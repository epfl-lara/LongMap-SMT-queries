; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69980 () Bool)

(assert start!69980)

(declare-fun b_free!12421 () Bool)

(declare-fun b_next!12421 () Bool)

(assert (=> start!69980 (= b_free!12421 (not b_next!12421))))

(declare-fun tp!43978 () Bool)

(declare-fun b_and!21167 () Bool)

(assert (=> start!69980 (= tp!43978 b_and!21167)))

(declare-fun b!813329 () Bool)

(declare-fun res!555680 () Bool)

(declare-fun e!450689 () Bool)

(assert (=> b!813329 (=> (not res!555680) (not e!450689))))

(declare-datatypes ((array!44471 0))(
  ( (array!44472 (arr!21296 (Array (_ BitVec 32) (_ BitVec 64))) (size!21717 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44471)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23843 0))(
  ( (V!23844 (val!7113 Int)) )
))
(declare-datatypes ((ValueCell!6650 0))(
  ( (ValueCellFull!6650 (v!9534 V!23843)) (EmptyCell!6650) )
))
(declare-datatypes ((array!44473 0))(
  ( (array!44474 (arr!21297 (Array (_ BitVec 32) ValueCell!6650)) (size!21718 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44473)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813329 (= res!555680 (and (= (size!21718 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21717 _keys!976) (size!21718 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!555679 () Bool)

(assert (=> start!69980 (=> (not res!555679) (not e!450689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69980 (= res!555679 (validMask!0 mask!1312))))

(assert (=> start!69980 e!450689))

(declare-fun tp_is_empty!14131 () Bool)

(assert (=> start!69980 tp_is_empty!14131))

(declare-fun array_inv!17135 (array!44471) Bool)

(assert (=> start!69980 (array_inv!17135 _keys!976)))

(assert (=> start!69980 true))

(declare-fun e!450691 () Bool)

(declare-fun array_inv!17136 (array!44473) Bool)

(assert (=> start!69980 (and (array_inv!17136 _values!788) e!450691)))

(assert (=> start!69980 tp!43978))

(declare-fun b!813330 () Bool)

(declare-fun res!555677 () Bool)

(assert (=> b!813330 (=> (not res!555677) (not e!450689))))

(declare-datatypes ((List!15188 0))(
  ( (Nil!15185) (Cons!15184 (h!16313 (_ BitVec 64)) (t!21496 List!15188)) )
))
(declare-fun arrayNoDuplicates!0 (array!44471 (_ BitVec 32) List!15188) Bool)

(assert (=> b!813330 (= res!555677 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15185))))

(declare-fun mapNonEmpty!22777 () Bool)

(declare-fun mapRes!22777 () Bool)

(declare-fun tp!43977 () Bool)

(declare-fun e!450692 () Bool)

(assert (=> mapNonEmpty!22777 (= mapRes!22777 (and tp!43977 e!450692))))

(declare-fun mapKey!22777 () (_ BitVec 32))

(declare-fun mapValue!22777 () ValueCell!6650)

(declare-fun mapRest!22777 () (Array (_ BitVec 32) ValueCell!6650))

(assert (=> mapNonEmpty!22777 (= (arr!21297 _values!788) (store mapRest!22777 mapKey!22777 mapValue!22777))))

(declare-fun b!813331 () Bool)

(declare-fun e!450690 () Bool)

(assert (=> b!813331 (= e!450690 tp_is_empty!14131)))

(declare-fun b!813332 () Bool)

(assert (=> b!813332 (= e!450692 tp_is_empty!14131)))

(declare-fun b!813333 () Bool)

(assert (=> b!813333 (= e!450691 (and e!450690 mapRes!22777))))

(declare-fun condMapEmpty!22777 () Bool)

(declare-fun mapDefault!22777 () ValueCell!6650)

(assert (=> b!813333 (= condMapEmpty!22777 (= (arr!21297 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6650)) mapDefault!22777)))))

(declare-fun mapIsEmpty!22777 () Bool)

(assert (=> mapIsEmpty!22777 mapRes!22777))

(declare-fun b!813334 () Bool)

(assert (=> b!813334 (= e!450689 false)))

(declare-datatypes ((tuple2!9362 0))(
  ( (tuple2!9363 (_1!4692 (_ BitVec 64)) (_2!4692 V!23843)) )
))
(declare-datatypes ((List!15189 0))(
  ( (Nil!15186) (Cons!15185 (h!16314 tuple2!9362) (t!21497 List!15189)) )
))
(declare-datatypes ((ListLongMap!8175 0))(
  ( (ListLongMap!8176 (toList!4103 List!15189)) )
))
(declare-fun lt!364092 () ListLongMap!8175)

(declare-fun zeroValueAfter!34 () V!23843)

(declare-fun minValue!754 () V!23843)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2168 (array!44471 array!44473 (_ BitVec 32) (_ BitVec 32) V!23843 V!23843 (_ BitVec 32) Int) ListLongMap!8175)

(assert (=> b!813334 (= lt!364092 (getCurrentListMapNoExtraKeys!2168 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364091 () ListLongMap!8175)

(declare-fun zeroValueBefore!34 () V!23843)

(assert (=> b!813334 (= lt!364091 (getCurrentListMapNoExtraKeys!2168 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813335 () Bool)

(declare-fun res!555678 () Bool)

(assert (=> b!813335 (=> (not res!555678) (not e!450689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44471 (_ BitVec 32)) Bool)

(assert (=> b!813335 (= res!555678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!69980 res!555679) b!813329))

(assert (= (and b!813329 res!555680) b!813335))

(assert (= (and b!813335 res!555678) b!813330))

(assert (= (and b!813330 res!555677) b!813334))

(assert (= (and b!813333 condMapEmpty!22777) mapIsEmpty!22777))

(assert (= (and b!813333 (not condMapEmpty!22777)) mapNonEmpty!22777))

(get-info :version)

(assert (= (and mapNonEmpty!22777 ((_ is ValueCellFull!6650) mapValue!22777)) b!813332))

(assert (= (and b!813333 ((_ is ValueCellFull!6650) mapDefault!22777)) b!813331))

(assert (= start!69980 b!813333))

(declare-fun m!754821 () Bool)

(assert (=> mapNonEmpty!22777 m!754821))

(declare-fun m!754823 () Bool)

(assert (=> b!813334 m!754823))

(declare-fun m!754825 () Bool)

(assert (=> b!813334 m!754825))

(declare-fun m!754827 () Bool)

(assert (=> start!69980 m!754827))

(declare-fun m!754829 () Bool)

(assert (=> start!69980 m!754829))

(declare-fun m!754831 () Bool)

(assert (=> start!69980 m!754831))

(declare-fun m!754833 () Bool)

(assert (=> b!813335 m!754833))

(declare-fun m!754835 () Bool)

(assert (=> b!813330 m!754835))

(check-sat b_and!21167 (not b!813330) tp_is_empty!14131 (not b_next!12421) (not mapNonEmpty!22777) (not b!813335) (not start!69980) (not b!813334))
(check-sat b_and!21167 (not b_next!12421))
