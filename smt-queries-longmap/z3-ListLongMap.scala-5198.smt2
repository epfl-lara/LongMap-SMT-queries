; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70182 () Bool)

(assert start!70182)

(declare-fun b_free!12595 () Bool)

(declare-fun b_next!12595 () Bool)

(assert (=> start!70182 (= b_free!12595 (not b_next!12595))))

(declare-fun tp!44506 () Bool)

(declare-fun b_and!21357 () Bool)

(assert (=> start!70182 (= tp!44506 b_and!21357)))

(declare-fun b!815337 () Bool)

(declare-fun res!556798 () Bool)

(declare-fun e!452120 () Bool)

(assert (=> b!815337 (=> (not res!556798) (not e!452120))))

(declare-datatypes ((array!44801 0))(
  ( (array!44802 (arr!21459 (Array (_ BitVec 32) (_ BitVec 64))) (size!21880 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44801)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44801 (_ BitVec 32)) Bool)

(assert (=> b!815337 (= res!556798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815338 () Bool)

(declare-fun e!452118 () Bool)

(assert (=> b!815338 (= e!452118 true)))

(declare-datatypes ((V!24075 0))(
  ( (V!24076 (val!7200 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24075)

(declare-fun minValue!754 () V!24075)

(declare-datatypes ((ValueCell!6737 0))(
  ( (ValueCellFull!6737 (v!9621 V!24075)) (EmptyCell!6737) )
))
(declare-datatypes ((array!44803 0))(
  ( (array!44804 (arr!21460 (Array (_ BitVec 32) ValueCell!6737)) (size!21881 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44803)

(declare-datatypes ((tuple2!9466 0))(
  ( (tuple2!9467 (_1!4744 (_ BitVec 64)) (_2!4744 V!24075)) )
))
(declare-datatypes ((List!15294 0))(
  ( (Nil!15291) (Cons!15290 (h!16419 tuple2!9466) (t!21606 List!15294)) )
))
(declare-datatypes ((ListLongMap!8279 0))(
  ( (ListLongMap!8280 (toList!4155 List!15294)) )
))
(declare-fun lt!364892 () ListLongMap!8279)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2332 (array!44801 array!44803 (_ BitVec 32) (_ BitVec 32) V!24075 V!24075 (_ BitVec 32) Int) ListLongMap!8279)

(assert (=> b!815338 (= lt!364892 (getCurrentListMap!2332 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24075)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364891 () ListLongMap!8279)

(declare-fun +!1820 (ListLongMap!8279 tuple2!9466) ListLongMap!8279)

(assert (=> b!815338 (= lt!364891 (+!1820 (getCurrentListMap!2332 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23044 () Bool)

(declare-fun mapRes!23044 () Bool)

(assert (=> mapIsEmpty!23044 mapRes!23044))

(declare-fun b!815339 () Bool)

(declare-fun res!556797 () Bool)

(assert (=> b!815339 (=> (not res!556797) (not e!452120))))

(assert (=> b!815339 (= res!556797 (and (= (size!21881 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21880 _keys!976) (size!21881 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556796 () Bool)

(assert (=> start!70182 (=> (not res!556796) (not e!452120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70182 (= res!556796 (validMask!0 mask!1312))))

(assert (=> start!70182 e!452120))

(declare-fun tp_is_empty!14305 () Bool)

(assert (=> start!70182 tp_is_empty!14305))

(declare-fun array_inv!17251 (array!44801) Bool)

(assert (=> start!70182 (array_inv!17251 _keys!976)))

(assert (=> start!70182 true))

(declare-fun e!452116 () Bool)

(declare-fun array_inv!17252 (array!44803) Bool)

(assert (=> start!70182 (and (array_inv!17252 _values!788) e!452116)))

(assert (=> start!70182 tp!44506))

(declare-fun b!815340 () Bool)

(declare-fun e!452115 () Bool)

(assert (=> b!815340 (= e!452116 (and e!452115 mapRes!23044))))

(declare-fun condMapEmpty!23044 () Bool)

(declare-fun mapDefault!23044 () ValueCell!6737)

(assert (=> b!815340 (= condMapEmpty!23044 (= (arr!21460 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6737)) mapDefault!23044)))))

(declare-fun mapNonEmpty!23044 () Bool)

(declare-fun tp!44505 () Bool)

(declare-fun e!452117 () Bool)

(assert (=> mapNonEmpty!23044 (= mapRes!23044 (and tp!44505 e!452117))))

(declare-fun mapKey!23044 () (_ BitVec 32))

(declare-fun mapValue!23044 () ValueCell!6737)

(declare-fun mapRest!23044 () (Array (_ BitVec 32) ValueCell!6737))

(assert (=> mapNonEmpty!23044 (= (arr!21460 _values!788) (store mapRest!23044 mapKey!23044 mapValue!23044))))

(declare-fun b!815341 () Bool)

(assert (=> b!815341 (= e!452117 tp_is_empty!14305)))

(declare-fun b!815342 () Bool)

(assert (=> b!815342 (= e!452120 (not e!452118))))

(declare-fun res!556795 () Bool)

(assert (=> b!815342 (=> res!556795 e!452118)))

(assert (=> b!815342 (= res!556795 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!364889 () ListLongMap!8279)

(declare-fun lt!364888 () ListLongMap!8279)

(assert (=> b!815342 (= lt!364889 lt!364888)))

(declare-datatypes ((Unit!27744 0))(
  ( (Unit!27745) )
))
(declare-fun lt!364890 () Unit!27744)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!313 (array!44801 array!44803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24075 V!24075 V!24075 V!24075 (_ BitVec 32) Int) Unit!27744)

(assert (=> b!815342 (= lt!364890 (lemmaNoChangeToArrayThenSameMapNoExtras!313 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2220 (array!44801 array!44803 (_ BitVec 32) (_ BitVec 32) V!24075 V!24075 (_ BitVec 32) Int) ListLongMap!8279)

(assert (=> b!815342 (= lt!364888 (getCurrentListMapNoExtraKeys!2220 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815342 (= lt!364889 (getCurrentListMapNoExtraKeys!2220 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815343 () Bool)

(assert (=> b!815343 (= e!452115 tp_is_empty!14305)))

(declare-fun b!815344 () Bool)

(declare-fun res!556794 () Bool)

(assert (=> b!815344 (=> (not res!556794) (not e!452120))))

(declare-datatypes ((List!15295 0))(
  ( (Nil!15292) (Cons!15291 (h!16420 (_ BitVec 64)) (t!21607 List!15295)) )
))
(declare-fun arrayNoDuplicates!0 (array!44801 (_ BitVec 32) List!15295) Bool)

(assert (=> b!815344 (= res!556794 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15292))))

(assert (= (and start!70182 res!556796) b!815339))

(assert (= (and b!815339 res!556797) b!815337))

(assert (= (and b!815337 res!556798) b!815344))

(assert (= (and b!815344 res!556794) b!815342))

(assert (= (and b!815342 (not res!556795)) b!815338))

(assert (= (and b!815340 condMapEmpty!23044) mapIsEmpty!23044))

(assert (= (and b!815340 (not condMapEmpty!23044)) mapNonEmpty!23044))

(get-info :version)

(assert (= (and mapNonEmpty!23044 ((_ is ValueCellFull!6737) mapValue!23044)) b!815341))

(assert (= (and b!815340 ((_ is ValueCellFull!6737) mapDefault!23044)) b!815343))

(assert (= start!70182 b!815340))

(declare-fun m!756477 () Bool)

(assert (=> b!815338 m!756477))

(declare-fun m!756479 () Bool)

(assert (=> b!815338 m!756479))

(assert (=> b!815338 m!756479))

(declare-fun m!756481 () Bool)

(assert (=> b!815338 m!756481))

(declare-fun m!756483 () Bool)

(assert (=> b!815344 m!756483))

(declare-fun m!756485 () Bool)

(assert (=> b!815342 m!756485))

(declare-fun m!756487 () Bool)

(assert (=> b!815342 m!756487))

(declare-fun m!756489 () Bool)

(assert (=> b!815342 m!756489))

(declare-fun m!756491 () Bool)

(assert (=> b!815337 m!756491))

(declare-fun m!756493 () Bool)

(assert (=> start!70182 m!756493))

(declare-fun m!756495 () Bool)

(assert (=> start!70182 m!756495))

(declare-fun m!756497 () Bool)

(assert (=> start!70182 m!756497))

(declare-fun m!756499 () Bool)

(assert (=> mapNonEmpty!23044 m!756499))

(check-sat (not b!815344) (not start!70182) tp_is_empty!14305 (not mapNonEmpty!23044) (not b!815342) (not b!815337) (not b_next!12595) (not b!815338) b_and!21357)
(check-sat b_and!21357 (not b_next!12595))
