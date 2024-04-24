; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70166 () Bool)

(assert start!70166)

(declare-fun b_free!12421 () Bool)

(declare-fun b_next!12421 () Bool)

(assert (=> start!70166 (= b_free!12421 (not b_next!12421))))

(declare-fun tp!43978 () Bool)

(declare-fun b_and!21203 () Bool)

(assert (=> start!70166 (= tp!43978 b_and!21203)))

(declare-fun b!814469 () Bool)

(declare-fun e!451419 () Bool)

(assert (=> b!814469 (= e!451419 false)))

(declare-datatypes ((array!44481 0))(
  ( (array!44482 (arr!21296 (Array (_ BitVec 32) (_ BitVec 64))) (size!21716 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44481)

(declare-datatypes ((V!23843 0))(
  ( (V!23844 (val!7113 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23843)

(declare-fun minValue!754 () V!23843)

(declare-datatypes ((ValueCell!6650 0))(
  ( (ValueCellFull!6650 (v!9540 V!23843)) (EmptyCell!6650) )
))
(declare-datatypes ((array!44483 0))(
  ( (array!44484 (arr!21297 (Array (_ BitVec 32) ValueCell!6650)) (size!21717 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44483)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9240 0))(
  ( (tuple2!9241 (_1!4631 (_ BitVec 64)) (_2!4631 V!23843)) )
))
(declare-datatypes ((List!15058 0))(
  ( (Nil!15055) (Cons!15054 (h!16189 tuple2!9240) (t!21367 List!15058)) )
))
(declare-datatypes ((ListLongMap!8065 0))(
  ( (ListLongMap!8066 (toList!4048 List!15058)) )
))
(declare-fun lt!364689 () ListLongMap!8065)

(declare-fun getCurrentListMapNoExtraKeys!2155 (array!44481 array!44483 (_ BitVec 32) (_ BitVec 32) V!23843 V!23843 (_ BitVec 32) Int) ListLongMap!8065)

(assert (=> b!814469 (= lt!364689 (getCurrentListMapNoExtraKeys!2155 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23843)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364688 () ListLongMap!8065)

(assert (=> b!814469 (= lt!364688 (getCurrentListMapNoExtraKeys!2155 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814470 () Bool)

(declare-fun e!451417 () Bool)

(declare-fun e!451420 () Bool)

(declare-fun mapRes!22777 () Bool)

(assert (=> b!814470 (= e!451417 (and e!451420 mapRes!22777))))

(declare-fun condMapEmpty!22777 () Bool)

(declare-fun mapDefault!22777 () ValueCell!6650)

(assert (=> b!814470 (= condMapEmpty!22777 (= (arr!21297 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6650)) mapDefault!22777)))))

(declare-fun mapNonEmpty!22777 () Bool)

(declare-fun tp!43977 () Bool)

(declare-fun e!451421 () Bool)

(assert (=> mapNonEmpty!22777 (= mapRes!22777 (and tp!43977 e!451421))))

(declare-fun mapKey!22777 () (_ BitVec 32))

(declare-fun mapValue!22777 () ValueCell!6650)

(declare-fun mapRest!22777 () (Array (_ BitVec 32) ValueCell!6650))

(assert (=> mapNonEmpty!22777 (= (arr!21297 _values!788) (store mapRest!22777 mapKey!22777 mapValue!22777))))

(declare-fun b!814471 () Bool)

(declare-fun tp_is_empty!14131 () Bool)

(assert (=> b!814471 (= e!451421 tp_is_empty!14131)))

(declare-fun b!814472 () Bool)

(declare-fun res!556131 () Bool)

(assert (=> b!814472 (=> (not res!556131) (not e!451419))))

(declare-datatypes ((List!15059 0))(
  ( (Nil!15056) (Cons!15055 (h!16190 (_ BitVec 64)) (t!21368 List!15059)) )
))
(declare-fun arrayNoDuplicates!0 (array!44481 (_ BitVec 32) List!15059) Bool)

(assert (=> b!814472 (= res!556131 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15056))))

(declare-fun b!814473 () Bool)

(declare-fun res!556130 () Bool)

(assert (=> b!814473 (=> (not res!556130) (not e!451419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44481 (_ BitVec 32)) Bool)

(assert (=> b!814473 (= res!556130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814474 () Bool)

(declare-fun res!556129 () Bool)

(assert (=> b!814474 (=> (not res!556129) (not e!451419))))

(assert (=> b!814474 (= res!556129 (and (= (size!21717 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21716 _keys!976) (size!21717 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814475 () Bool)

(assert (=> b!814475 (= e!451420 tp_is_empty!14131)))

(declare-fun mapIsEmpty!22777 () Bool)

(assert (=> mapIsEmpty!22777 mapRes!22777))

(declare-fun res!556132 () Bool)

(assert (=> start!70166 (=> (not res!556132) (not e!451419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70166 (= res!556132 (validMask!0 mask!1312))))

(assert (=> start!70166 e!451419))

(assert (=> start!70166 tp_is_empty!14131))

(declare-fun array_inv!17105 (array!44481) Bool)

(assert (=> start!70166 (array_inv!17105 _keys!976)))

(assert (=> start!70166 true))

(declare-fun array_inv!17106 (array!44483) Bool)

(assert (=> start!70166 (and (array_inv!17106 _values!788) e!451417)))

(assert (=> start!70166 tp!43978))

(assert (= (and start!70166 res!556132) b!814474))

(assert (= (and b!814474 res!556129) b!814473))

(assert (= (and b!814473 res!556130) b!814472))

(assert (= (and b!814472 res!556131) b!814469))

(assert (= (and b!814470 condMapEmpty!22777) mapIsEmpty!22777))

(assert (= (and b!814470 (not condMapEmpty!22777)) mapNonEmpty!22777))

(get-info :version)

(assert (= (and mapNonEmpty!22777 ((_ is ValueCellFull!6650) mapValue!22777)) b!814471))

(assert (= (and b!814470 ((_ is ValueCellFull!6650) mapDefault!22777)) b!814475))

(assert (= start!70166 b!814470))

(declare-fun m!756855 () Bool)

(assert (=> b!814473 m!756855))

(declare-fun m!756857 () Bool)

(assert (=> b!814472 m!756857))

(declare-fun m!756859 () Bool)

(assert (=> b!814469 m!756859))

(declare-fun m!756861 () Bool)

(assert (=> b!814469 m!756861))

(declare-fun m!756863 () Bool)

(assert (=> mapNonEmpty!22777 m!756863))

(declare-fun m!756865 () Bool)

(assert (=> start!70166 m!756865))

(declare-fun m!756867 () Bool)

(assert (=> start!70166 m!756867))

(declare-fun m!756869 () Bool)

(assert (=> start!70166 m!756869))

(check-sat (not b!814473) (not b!814472) (not mapNonEmpty!22777) (not start!70166) b_and!21203 tp_is_empty!14131 (not b_next!12421) (not b!814469))
(check-sat b_and!21203 (not b_next!12421))
