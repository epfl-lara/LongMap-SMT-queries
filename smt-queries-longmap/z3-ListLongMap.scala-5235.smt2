; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70492 () Bool)

(assert start!70492)

(declare-fun b_free!12819 () Bool)

(declare-fun b_next!12819 () Bool)

(assert (=> start!70492 (= b_free!12819 (not b_next!12819))))

(declare-fun tp!45189 () Bool)

(declare-fun b_and!21649 () Bool)

(assert (=> start!70492 (= tp!45189 b_and!21649)))

(declare-fun b!818814 () Bool)

(declare-fun res!558777 () Bool)

(declare-fun e!454594 () Bool)

(assert (=> b!818814 (=> (not res!558777) (not e!454594))))

(declare-datatypes ((array!45256 0))(
  ( (array!45257 (arr!21682 (Array (_ BitVec 32) (_ BitVec 64))) (size!22103 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45256)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45256 (_ BitVec 32)) Bool)

(assert (=> b!818814 (= res!558777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818815 () Bool)

(declare-fun e!454598 () Bool)

(assert (=> b!818815 (= e!454594 (not e!454598))))

(declare-fun res!558779 () Bool)

(assert (=> b!818815 (=> res!558779 e!454598)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818815 (= res!558779 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24373 0))(
  ( (V!24374 (val!7312 Int)) )
))
(declare-datatypes ((tuple2!9612 0))(
  ( (tuple2!9613 (_1!4817 (_ BitVec 64)) (_2!4817 V!24373)) )
))
(declare-datatypes ((List!15444 0))(
  ( (Nil!15441) (Cons!15440 (h!16569 tuple2!9612) (t!21773 List!15444)) )
))
(declare-datatypes ((ListLongMap!8435 0))(
  ( (ListLongMap!8436 (toList!4233 List!15444)) )
))
(declare-fun lt!367078 () ListLongMap!8435)

(declare-fun lt!367074 () ListLongMap!8435)

(assert (=> b!818815 (= lt!367078 lt!367074)))

(declare-fun zeroValueBefore!34 () V!24373)

(declare-datatypes ((Unit!27947 0))(
  ( (Unit!27948) )
))
(declare-fun lt!367081 () Unit!27947)

(declare-fun zeroValueAfter!34 () V!24373)

(declare-fun minValue!754 () V!24373)

(declare-datatypes ((ValueCell!6849 0))(
  ( (ValueCellFull!6849 (v!9741 V!24373)) (EmptyCell!6849) )
))
(declare-datatypes ((array!45258 0))(
  ( (array!45259 (arr!21683 (Array (_ BitVec 32) ValueCell!6849)) (size!22104 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45258)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!380 (array!45256 array!45258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24373 V!24373 V!24373 V!24373 (_ BitVec 32) Int) Unit!27947)

(assert (=> b!818815 (= lt!367081 (lemmaNoChangeToArrayThenSameMapNoExtras!380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2270 (array!45256 array!45258 (_ BitVec 32) (_ BitVec 32) V!24373 V!24373 (_ BitVec 32) Int) ListLongMap!8435)

(assert (=> b!818815 (= lt!367074 (getCurrentListMapNoExtraKeys!2270 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818815 (= lt!367078 (getCurrentListMapNoExtraKeys!2270 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558775 () Bool)

(assert (=> start!70492 (=> (not res!558775) (not e!454594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70492 (= res!558775 (validMask!0 mask!1312))))

(assert (=> start!70492 e!454594))

(declare-fun tp_is_empty!14529 () Bool)

(assert (=> start!70492 tp_is_empty!14529))

(declare-fun array_inv!17337 (array!45256) Bool)

(assert (=> start!70492 (array_inv!17337 _keys!976)))

(assert (=> start!70492 true))

(declare-fun e!454593 () Bool)

(declare-fun array_inv!17338 (array!45258) Bool)

(assert (=> start!70492 (and (array_inv!17338 _values!788) e!454593)))

(assert (=> start!70492 tp!45189))

(declare-fun b!818816 () Bool)

(declare-fun res!558778 () Bool)

(assert (=> b!818816 (=> (not res!558778) (not e!454594))))

(assert (=> b!818816 (= res!558778 (and (= (size!22104 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22103 _keys!976) (size!22104 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818817 () Bool)

(declare-fun e!454596 () Bool)

(assert (=> b!818817 (= e!454596 tp_is_empty!14529)))

(declare-fun mapIsEmpty!23392 () Bool)

(declare-fun mapRes!23392 () Bool)

(assert (=> mapIsEmpty!23392 mapRes!23392))

(declare-fun mapNonEmpty!23392 () Bool)

(declare-fun tp!45190 () Bool)

(declare-fun e!454597 () Bool)

(assert (=> mapNonEmpty!23392 (= mapRes!23392 (and tp!45190 e!454597))))

(declare-fun mapValue!23392 () ValueCell!6849)

(declare-fun mapRest!23392 () (Array (_ BitVec 32) ValueCell!6849))

(declare-fun mapKey!23392 () (_ BitVec 32))

(assert (=> mapNonEmpty!23392 (= (arr!21683 _values!788) (store mapRest!23392 mapKey!23392 mapValue!23392))))

(declare-fun b!818818 () Bool)

(assert (=> b!818818 (= e!454597 tp_is_empty!14529)))

(declare-fun b!818819 () Bool)

(assert (=> b!818819 (= e!454593 (and e!454596 mapRes!23392))))

(declare-fun condMapEmpty!23392 () Bool)

(declare-fun mapDefault!23392 () ValueCell!6849)

(assert (=> b!818819 (= condMapEmpty!23392 (= (arr!21683 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6849)) mapDefault!23392)))))

(declare-fun b!818820 () Bool)

(assert (=> b!818820 (= e!454598 true)))

(declare-fun lt!367075 () tuple2!9612)

(declare-fun lt!367082 () ListLongMap!8435)

(declare-fun lt!367079 () tuple2!9612)

(declare-fun +!1830 (ListLongMap!8435 tuple2!9612) ListLongMap!8435)

(assert (=> b!818820 (= lt!367082 (+!1830 (+!1830 lt!367074 lt!367075) lt!367079))))

(declare-fun lt!367080 () ListLongMap!8435)

(assert (=> b!818820 (= (+!1830 lt!367078 lt!367079) (+!1830 lt!367080 lt!367079))))

(declare-fun lt!367077 () Unit!27947)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!171 (ListLongMap!8435 (_ BitVec 64) V!24373 V!24373) Unit!27947)

(assert (=> b!818820 (= lt!367077 (addSameAsAddTwiceSameKeyDiffValues!171 lt!367078 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818820 (= lt!367079 (tuple2!9613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454595 () Bool)

(assert (=> b!818820 e!454595))

(declare-fun res!558780 () Bool)

(assert (=> b!818820 (=> (not res!558780) (not e!454595))))

(declare-fun lt!367073 () ListLongMap!8435)

(assert (=> b!818820 (= res!558780 (= lt!367073 lt!367080))))

(assert (=> b!818820 (= lt!367080 (+!1830 lt!367078 lt!367075))))

(assert (=> b!818820 (= lt!367075 (tuple2!9613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!367076 () ListLongMap!8435)

(declare-fun getCurrentListMap!2437 (array!45256 array!45258 (_ BitVec 32) (_ BitVec 32) V!24373 V!24373 (_ BitVec 32) Int) ListLongMap!8435)

(assert (=> b!818820 (= lt!367076 (getCurrentListMap!2437 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818820 (= lt!367073 (getCurrentListMap!2437 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818821 () Bool)

(declare-fun res!558776 () Bool)

(assert (=> b!818821 (=> (not res!558776) (not e!454594))))

(declare-datatypes ((List!15445 0))(
  ( (Nil!15442) (Cons!15441 (h!16570 (_ BitVec 64)) (t!21774 List!15445)) )
))
(declare-fun arrayNoDuplicates!0 (array!45256 (_ BitVec 32) List!15445) Bool)

(assert (=> b!818821 (= res!558776 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15442))))

(declare-fun b!818822 () Bool)

(assert (=> b!818822 (= e!454595 (= lt!367076 (+!1830 lt!367074 (tuple2!9613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70492 res!558775) b!818816))

(assert (= (and b!818816 res!558778) b!818814))

(assert (= (and b!818814 res!558777) b!818821))

(assert (= (and b!818821 res!558776) b!818815))

(assert (= (and b!818815 (not res!558779)) b!818820))

(assert (= (and b!818820 res!558780) b!818822))

(assert (= (and b!818819 condMapEmpty!23392) mapIsEmpty!23392))

(assert (= (and b!818819 (not condMapEmpty!23392)) mapNonEmpty!23392))

(get-info :version)

(assert (= (and mapNonEmpty!23392 ((_ is ValueCellFull!6849) mapValue!23392)) b!818818))

(assert (= (and b!818819 ((_ is ValueCellFull!6849) mapDefault!23392)) b!818817))

(assert (= start!70492 b!818819))

(declare-fun m!760249 () Bool)

(assert (=> b!818822 m!760249))

(declare-fun m!760251 () Bool)

(assert (=> start!70492 m!760251))

(declare-fun m!760253 () Bool)

(assert (=> start!70492 m!760253))

(declare-fun m!760255 () Bool)

(assert (=> start!70492 m!760255))

(declare-fun m!760257 () Bool)

(assert (=> b!818815 m!760257))

(declare-fun m!760259 () Bool)

(assert (=> b!818815 m!760259))

(declare-fun m!760261 () Bool)

(assert (=> b!818815 m!760261))

(declare-fun m!760263 () Bool)

(assert (=> b!818814 m!760263))

(declare-fun m!760265 () Bool)

(assert (=> mapNonEmpty!23392 m!760265))

(declare-fun m!760267 () Bool)

(assert (=> b!818821 m!760267))

(declare-fun m!760269 () Bool)

(assert (=> b!818820 m!760269))

(declare-fun m!760271 () Bool)

(assert (=> b!818820 m!760271))

(declare-fun m!760273 () Bool)

(assert (=> b!818820 m!760273))

(declare-fun m!760275 () Bool)

(assert (=> b!818820 m!760275))

(declare-fun m!760277 () Bool)

(assert (=> b!818820 m!760277))

(declare-fun m!760279 () Bool)

(assert (=> b!818820 m!760279))

(declare-fun m!760281 () Bool)

(assert (=> b!818820 m!760281))

(assert (=> b!818820 m!760271))

(declare-fun m!760283 () Bool)

(assert (=> b!818820 m!760283))

(check-sat (not start!70492) b_and!21649 (not b!818814) (not b_next!12819) (not mapNonEmpty!23392) (not b!818822) (not b!818820) (not b!818821) tp_is_empty!14529 (not b!818815))
(check-sat b_and!21649 (not b_next!12819))
