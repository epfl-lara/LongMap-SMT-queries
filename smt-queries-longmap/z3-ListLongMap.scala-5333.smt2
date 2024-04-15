; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71238 () Bool)

(assert start!71238)

(declare-fun b_free!13405 () Bool)

(declare-fun b_next!13405 () Bool)

(assert (=> start!71238 (= b_free!13405 (not b_next!13405))))

(declare-fun tp!46977 () Bool)

(declare-fun b_and!22317 () Bool)

(assert (=> start!71238 (= tp!46977 b_and!22317)))

(declare-fun b!827455 () Bool)

(declare-fun res!564022 () Bool)

(declare-fun e!460975 () Bool)

(assert (=> b!827455 (=> (not res!564022) (not e!460975))))

(declare-datatypes ((array!46367 0))(
  ( (array!46368 (arr!22228 (Array (_ BitVec 32) (_ BitVec 64))) (size!22649 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46367)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25155 0))(
  ( (V!25156 (val!7605 Int)) )
))
(declare-datatypes ((ValueCell!7142 0))(
  ( (ValueCellFull!7142 (v!10034 V!25155)) (EmptyCell!7142) )
))
(declare-datatypes ((array!46369 0))(
  ( (array!46370 (arr!22229 (Array (_ BitVec 32) ValueCell!7142)) (size!22650 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46369)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827455 (= res!564022 (and (= (size!22650 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22649 _keys!976) (size!22650 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827456 () Bool)

(declare-fun e!460978 () Bool)

(declare-fun tp_is_empty!15115 () Bool)

(assert (=> b!827456 (= e!460978 tp_is_empty!15115)))

(declare-fun res!564021 () Bool)

(assert (=> start!71238 (=> (not res!564021) (not e!460975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71238 (= res!564021 (validMask!0 mask!1312))))

(assert (=> start!71238 e!460975))

(assert (=> start!71238 tp_is_empty!15115))

(declare-fun array_inv!17773 (array!46367) Bool)

(assert (=> start!71238 (array_inv!17773 _keys!976)))

(assert (=> start!71238 true))

(declare-fun e!460979 () Bool)

(declare-fun array_inv!17774 (array!46369) Bool)

(assert (=> start!71238 (and (array_inv!17774 _values!788) e!460979)))

(assert (=> start!71238 tp!46977))

(declare-fun b!827457 () Bool)

(declare-fun res!564019 () Bool)

(assert (=> b!827457 (=> (not res!564019) (not e!460975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46367 (_ BitVec 32)) Bool)

(assert (=> b!827457 (= res!564019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24301 () Bool)

(declare-fun mapRes!24301 () Bool)

(assert (=> mapIsEmpty!24301 mapRes!24301))

(declare-fun b!827458 () Bool)

(assert (=> b!827458 (= e!460979 (and e!460978 mapRes!24301))))

(declare-fun condMapEmpty!24301 () Bool)

(declare-fun mapDefault!24301 () ValueCell!7142)

(assert (=> b!827458 (= condMapEmpty!24301 (= (arr!22229 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7142)) mapDefault!24301)))))

(declare-fun b!827459 () Bool)

(declare-fun e!460977 () Bool)

(assert (=> b!827459 (= e!460977 tp_is_empty!15115)))

(declare-fun mapNonEmpty!24301 () Bool)

(declare-fun tp!46978 () Bool)

(assert (=> mapNonEmpty!24301 (= mapRes!24301 (and tp!46978 e!460977))))

(declare-fun mapKey!24301 () (_ BitVec 32))

(declare-fun mapRest!24301 () (Array (_ BitVec 32) ValueCell!7142))

(declare-fun mapValue!24301 () ValueCell!7142)

(assert (=> mapNonEmpty!24301 (= (arr!22229 _values!788) (store mapRest!24301 mapKey!24301 mapValue!24301))))

(declare-fun b!827460 () Bool)

(declare-fun res!564020 () Bool)

(assert (=> b!827460 (=> (not res!564020) (not e!460975))))

(declare-datatypes ((List!15878 0))(
  ( (Nil!15875) (Cons!15874 (h!17003 (_ BitVec 64)) (t!22218 List!15878)) )
))
(declare-fun arrayNoDuplicates!0 (array!46367 (_ BitVec 32) List!15878) Bool)

(assert (=> b!827460 (= res!564020 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15875))))

(declare-fun b!827461 () Bool)

(assert (=> b!827461 (= e!460975 false)))

(declare-fun zeroValueAfter!34 () V!25155)

(declare-fun minValue!754 () V!25155)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10092 0))(
  ( (tuple2!10093 (_1!5057 (_ BitVec 64)) (_2!5057 V!25155)) )
))
(declare-datatypes ((List!15879 0))(
  ( (Nil!15876) (Cons!15875 (h!17004 tuple2!10092) (t!22219 List!15879)) )
))
(declare-datatypes ((ListLongMap!8905 0))(
  ( (ListLongMap!8906 (toList!4468 List!15879)) )
))
(declare-fun lt!374737 () ListLongMap!8905)

(declare-fun getCurrentListMapNoExtraKeys!2500 (array!46367 array!46369 (_ BitVec 32) (_ BitVec 32) V!25155 V!25155 (_ BitVec 32) Int) ListLongMap!8905)

(assert (=> b!827461 (= lt!374737 (getCurrentListMapNoExtraKeys!2500 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25155)

(declare-fun lt!374738 () ListLongMap!8905)

(assert (=> b!827461 (= lt!374738 (getCurrentListMapNoExtraKeys!2500 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71238 res!564021) b!827455))

(assert (= (and b!827455 res!564022) b!827457))

(assert (= (and b!827457 res!564019) b!827460))

(assert (= (and b!827460 res!564020) b!827461))

(assert (= (and b!827458 condMapEmpty!24301) mapIsEmpty!24301))

(assert (= (and b!827458 (not condMapEmpty!24301)) mapNonEmpty!24301))

(get-info :version)

(assert (= (and mapNonEmpty!24301 ((_ is ValueCellFull!7142) mapValue!24301)) b!827459))

(assert (= (and b!827458 ((_ is ValueCellFull!7142) mapDefault!24301)) b!827456))

(assert (= start!71238 b!827458))

(declare-fun m!769967 () Bool)

(assert (=> start!71238 m!769967))

(declare-fun m!769969 () Bool)

(assert (=> start!71238 m!769969))

(declare-fun m!769971 () Bool)

(assert (=> start!71238 m!769971))

(declare-fun m!769973 () Bool)

(assert (=> b!827460 m!769973))

(declare-fun m!769975 () Bool)

(assert (=> mapNonEmpty!24301 m!769975))

(declare-fun m!769977 () Bool)

(assert (=> b!827461 m!769977))

(declare-fun m!769979 () Bool)

(assert (=> b!827461 m!769979))

(declare-fun m!769981 () Bool)

(assert (=> b!827457 m!769981))

(check-sat (not b!827460) (not b_next!13405) (not start!71238) tp_is_empty!15115 (not b!827461) (not mapNonEmpty!24301) b_and!22317 (not b!827457))
(check-sat b_and!22317 (not b_next!13405))
