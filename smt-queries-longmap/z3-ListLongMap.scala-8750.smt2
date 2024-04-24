; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106422 () Bool)

(assert start!106422)

(declare-fun b_free!27535 () Bool)

(declare-fun b_next!27535 () Bool)

(assert (=> start!106422 (= b_free!27535 (not b_next!27535))))

(declare-fun tp!96170 () Bool)

(declare-fun b_and!45569 () Bool)

(assert (=> start!106422 (= tp!96170 b_and!45569)))

(declare-fun mapNonEmpty!50491 () Bool)

(declare-fun mapRes!50491 () Bool)

(declare-fun tp!96169 () Bool)

(declare-fun e!720818 () Bool)

(assert (=> mapNonEmpty!50491 (= mapRes!50491 (and tp!96169 e!720818))))

(declare-datatypes ((V!48615 0))(
  ( (V!48616 (val!16281 Int)) )
))
(declare-datatypes ((ValueCell!15455 0))(
  ( (ValueCellFull!15455 (v!18991 V!48615)) (EmptyCell!15455) )
))
(declare-fun mapRest!50491 () (Array (_ BitVec 32) ValueCell!15455))

(declare-datatypes ((array!82545 0))(
  ( (array!82546 (arr!39810 (Array (_ BitVec 32) ValueCell!15455)) (size!40347 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82545)

(declare-fun mapValue!50491 () ValueCell!15455)

(declare-fun mapKey!50491 () (_ BitVec 32))

(assert (=> mapNonEmpty!50491 (= (arr!39810 _values!914) (store mapRest!50491 mapKey!50491 mapValue!50491))))

(declare-fun mapIsEmpty!50491 () Bool)

(assert (=> mapIsEmpty!50491 mapRes!50491))

(declare-fun b!1265705 () Bool)

(declare-fun res!842573 () Bool)

(declare-fun e!720819 () Bool)

(assert (=> b!1265705 (=> (not res!842573) (not e!720819))))

(declare-datatypes ((array!82547 0))(
  ( (array!82548 (arr!39811 (Array (_ BitVec 32) (_ BitVec 64))) (size!40348 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82547)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82547 (_ BitVec 32)) Bool)

(assert (=> b!1265705 (= res!842573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1265706 () Bool)

(declare-fun e!720814 () Bool)

(assert (=> b!1265706 (= e!720814 true)))

(declare-datatypes ((tuple2!21090 0))(
  ( (tuple2!21091 (_1!10556 (_ BitVec 64)) (_2!10556 V!48615)) )
))
(declare-datatypes ((List!28308 0))(
  ( (Nil!28305) (Cons!28304 (h!29522 tuple2!21090) (t!41821 List!28308)) )
))
(declare-datatypes ((ListLongMap!18971 0))(
  ( (ListLongMap!18972 (toList!9501 List!28308)) )
))
(declare-fun lt!574220 () ListLongMap!18971)

(declare-fun lt!574228 () ListLongMap!18971)

(declare-fun -!2124 (ListLongMap!18971 (_ BitVec 64)) ListLongMap!18971)

(assert (=> b!1265706 (= lt!574220 (-!2124 lt!574228 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!574227 () ListLongMap!18971)

(declare-fun lt!574223 () ListLongMap!18971)

(assert (=> b!1265706 (= (-!2124 lt!574227 #b1000000000000000000000000000000000000000000000000000000000000000) lt!574223)))

(declare-datatypes ((Unit!42112 0))(
  ( (Unit!42113) )
))
(declare-fun lt!574226 () Unit!42112)

(declare-fun minValueBefore!43 () V!48615)

(declare-fun addThenRemoveForNewKeyIsSame!373 (ListLongMap!18971 (_ BitVec 64) V!48615) Unit!42112)

(assert (=> b!1265706 (= lt!574226 (addThenRemoveForNewKeyIsSame!373 lt!574223 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!720815 () Bool)

(assert (=> b!1265706 e!720815))

(declare-fun res!842574 () Bool)

(assert (=> b!1265706 (=> (not res!842574) (not e!720815))))

(assert (=> b!1265706 (= res!842574 (= lt!574228 lt!574227))))

(declare-fun +!4308 (ListLongMap!18971 tuple2!21090) ListLongMap!18971)

(assert (=> b!1265706 (= lt!574227 (+!4308 lt!574223 (tuple2!21091 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!574224 () ListLongMap!18971)

(declare-fun lt!574219 () tuple2!21090)

(assert (=> b!1265706 (= lt!574223 (+!4308 lt!574224 lt!574219))))

(declare-fun zeroValue!871 () V!48615)

(assert (=> b!1265706 (= lt!574219 (tuple2!21091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!574222 () ListLongMap!18971)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48615)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4651 (array!82547 array!82545 (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 (_ BitVec 32) Int) ListLongMap!18971)

(assert (=> b!1265706 (= lt!574222 (getCurrentListMap!4651 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1265706 (= lt!574228 (getCurrentListMap!4651 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265707 () Bool)

(assert (=> b!1265707 (= e!720819 (not e!720814))))

(declare-fun res!842576 () Bool)

(assert (=> b!1265707 (=> res!842576 e!720814)))

(assert (=> b!1265707 (= res!842576 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!574225 () ListLongMap!18971)

(assert (=> b!1265707 (= lt!574224 lt!574225)))

(declare-fun lt!574221 () Unit!42112)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1193 (array!82547 array!82545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 V!48615 V!48615 (_ BitVec 32) Int) Unit!42112)

(assert (=> b!1265707 (= lt!574221 (lemmaNoChangeToArrayThenSameMapNoExtras!1193 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5903 (array!82547 array!82545 (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 (_ BitVec 32) Int) ListLongMap!18971)

(assert (=> b!1265707 (= lt!574225 (getCurrentListMapNoExtraKeys!5903 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1265707 (= lt!574224 (getCurrentListMapNoExtraKeys!5903 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265708 () Bool)

(declare-fun res!842571 () Bool)

(assert (=> b!1265708 (=> (not res!842571) (not e!720819))))

(declare-datatypes ((List!28309 0))(
  ( (Nil!28306) (Cons!28305 (h!29523 (_ BitVec 64)) (t!41822 List!28309)) )
))
(declare-fun arrayNoDuplicates!0 (array!82547 (_ BitVec 32) List!28309) Bool)

(assert (=> b!1265708 (= res!842571 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28306))))

(declare-fun b!1265709 () Bool)

(assert (=> b!1265709 (= e!720815 (= lt!574222 (+!4308 lt!574225 lt!574219)))))

(declare-fun b!1265710 () Bool)

(declare-fun tp_is_empty!32437 () Bool)

(assert (=> b!1265710 (= e!720818 tp_is_empty!32437)))

(declare-fun b!1265711 () Bool)

(declare-fun res!842575 () Bool)

(assert (=> b!1265711 (=> (not res!842575) (not e!720819))))

(assert (=> b!1265711 (= res!842575 (and (= (size!40347 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40348 _keys!1118) (size!40347 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!842572 () Bool)

(assert (=> start!106422 (=> (not res!842572) (not e!720819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106422 (= res!842572 (validMask!0 mask!1466))))

(assert (=> start!106422 e!720819))

(assert (=> start!106422 true))

(assert (=> start!106422 tp!96170))

(assert (=> start!106422 tp_is_empty!32437))

(declare-fun array_inv!30461 (array!82547) Bool)

(assert (=> start!106422 (array_inv!30461 _keys!1118)))

(declare-fun e!720813 () Bool)

(declare-fun array_inv!30462 (array!82545) Bool)

(assert (=> start!106422 (and (array_inv!30462 _values!914) e!720813)))

(declare-fun b!1265712 () Bool)

(declare-fun e!720816 () Bool)

(assert (=> b!1265712 (= e!720816 tp_is_empty!32437)))

(declare-fun b!1265713 () Bool)

(assert (=> b!1265713 (= e!720813 (and e!720816 mapRes!50491))))

(declare-fun condMapEmpty!50491 () Bool)

(declare-fun mapDefault!50491 () ValueCell!15455)

(assert (=> b!1265713 (= condMapEmpty!50491 (= (arr!39810 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15455)) mapDefault!50491)))))

(assert (= (and start!106422 res!842572) b!1265711))

(assert (= (and b!1265711 res!842575) b!1265705))

(assert (= (and b!1265705 res!842573) b!1265708))

(assert (= (and b!1265708 res!842571) b!1265707))

(assert (= (and b!1265707 (not res!842576)) b!1265706))

(assert (= (and b!1265706 res!842574) b!1265709))

(assert (= (and b!1265713 condMapEmpty!50491) mapIsEmpty!50491))

(assert (= (and b!1265713 (not condMapEmpty!50491)) mapNonEmpty!50491))

(get-info :version)

(assert (= (and mapNonEmpty!50491 ((_ is ValueCellFull!15455) mapValue!50491)) b!1265710))

(assert (= (and b!1265713 ((_ is ValueCellFull!15455) mapDefault!50491)) b!1265712))

(assert (= start!106422 b!1265713))

(declare-fun m!1166557 () Bool)

(assert (=> start!106422 m!1166557))

(declare-fun m!1166559 () Bool)

(assert (=> start!106422 m!1166559))

(declare-fun m!1166561 () Bool)

(assert (=> start!106422 m!1166561))

(declare-fun m!1166563 () Bool)

(assert (=> b!1265709 m!1166563))

(declare-fun m!1166565 () Bool)

(assert (=> b!1265707 m!1166565))

(declare-fun m!1166567 () Bool)

(assert (=> b!1265707 m!1166567))

(declare-fun m!1166569 () Bool)

(assert (=> b!1265707 m!1166569))

(declare-fun m!1166571 () Bool)

(assert (=> mapNonEmpty!50491 m!1166571))

(declare-fun m!1166573 () Bool)

(assert (=> b!1265708 m!1166573))

(declare-fun m!1166575 () Bool)

(assert (=> b!1265705 m!1166575))

(declare-fun m!1166577 () Bool)

(assert (=> b!1265706 m!1166577))

(declare-fun m!1166579 () Bool)

(assert (=> b!1265706 m!1166579))

(declare-fun m!1166581 () Bool)

(assert (=> b!1265706 m!1166581))

(declare-fun m!1166583 () Bool)

(assert (=> b!1265706 m!1166583))

(declare-fun m!1166585 () Bool)

(assert (=> b!1265706 m!1166585))

(declare-fun m!1166587 () Bool)

(assert (=> b!1265706 m!1166587))

(declare-fun m!1166589 () Bool)

(assert (=> b!1265706 m!1166589))

(check-sat (not b!1265706) (not mapNonEmpty!50491) b_and!45569 (not b_next!27535) (not b!1265709) (not b!1265705) (not b!1265708) (not start!106422) tp_is_empty!32437 (not b!1265707))
(check-sat b_and!45569 (not b_next!27535))
