; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79666 () Bool)

(assert start!79666)

(declare-fun b_free!17715 () Bool)

(declare-fun b_next!17715 () Bool)

(assert (=> start!79666 (= b_free!17715 (not b_next!17715))))

(declare-fun tp!61601 () Bool)

(declare-fun b_and!29021 () Bool)

(assert (=> start!79666 (= tp!61601 b_and!29021)))

(declare-fun b!936838 () Bool)

(declare-fun e!526048 () Bool)

(declare-fun e!526052 () Bool)

(declare-fun mapRes!32106 () Bool)

(assert (=> b!936838 (= e!526048 (and e!526052 mapRes!32106))))

(declare-fun condMapEmpty!32106 () Bool)

(declare-datatypes ((V!31929 0))(
  ( (V!31930 (val!10162 Int)) )
))
(declare-datatypes ((ValueCell!9630 0))(
  ( (ValueCellFull!9630 (v!12687 V!31929)) (EmptyCell!9630) )
))
(declare-datatypes ((array!56386 0))(
  ( (array!56387 (arr!27133 (Array (_ BitVec 32) ValueCell!9630)) (size!27592 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56386)

(declare-fun mapDefault!32106 () ValueCell!9630)

(assert (=> b!936838 (= condMapEmpty!32106 (= (arr!27133 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9630)) mapDefault!32106)))))

(declare-fun b!936839 () Bool)

(declare-datatypes ((Unit!31609 0))(
  ( (Unit!31610) )
))
(declare-fun e!526050 () Unit!31609)

(declare-fun Unit!31611 () Unit!31609)

(assert (=> b!936839 (= e!526050 Unit!31611)))

(declare-fun b!936841 () Bool)

(declare-datatypes ((tuple2!13346 0))(
  ( (tuple2!13347 (_1!6684 (_ BitVec 64)) (_2!6684 V!31929)) )
))
(declare-datatypes ((List!19125 0))(
  ( (Nil!19122) (Cons!19121 (h!20267 tuple2!13346) (t!27384 List!19125)) )
))
(declare-datatypes ((ListLongMap!12043 0))(
  ( (ListLongMap!12044 (toList!6037 List!19125)) )
))
(declare-fun lt!422537 () ListLongMap!12043)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!422541 () V!31929)

(declare-fun apply!839 (ListLongMap!12043 (_ BitVec 64)) V!31929)

(assert (=> b!936841 (= (apply!839 lt!422537 k0!1099) lt!422541)))

(declare-fun lt!422540 () (_ BitVec 64))

(declare-fun lt!422543 () Unit!31609)

(declare-fun lt!422545 () ListLongMap!12043)

(declare-fun lt!422535 () V!31929)

(declare-fun addApplyDifferent!426 (ListLongMap!12043 (_ BitVec 64) V!31929 (_ BitVec 64)) Unit!31609)

(assert (=> b!936841 (= lt!422543 (addApplyDifferent!426 lt!422545 lt!422540 lt!422535 k0!1099))))

(assert (=> b!936841 (not (= lt!422540 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!422539 () Unit!31609)

(declare-datatypes ((array!56388 0))(
  ( (array!56389 (arr!27134 (Array (_ BitVec 32) (_ BitVec 64))) (size!27593 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56388)

(declare-datatypes ((List!19126 0))(
  ( (Nil!19123) (Cons!19122 (h!20268 (_ BitVec 64)) (t!27385 List!19126)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56388 (_ BitVec 64) (_ BitVec 32) List!19126) Unit!31609)

(assert (=> b!936841 (= lt!422539 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19123))))

(declare-fun e!526049 () Bool)

(assert (=> b!936841 e!526049))

(declare-fun c!97469 () Bool)

(assert (=> b!936841 (= c!97469 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!422538 () Unit!31609)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31929)

(declare-fun minValue!1173 () V!31929)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!299 (array!56388 array!56386 (_ BitVec 32) (_ BitVec 32) V!31929 V!31929 (_ BitVec 64) (_ BitVec 32) Int) Unit!31609)

(assert (=> b!936841 (= lt!422538 (lemmaListMapContainsThenArrayContainsFrom!299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56388 (_ BitVec 32) List!19126) Bool)

(assert (=> b!936841 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19123)))

(declare-fun lt!422542 () Unit!31609)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56388 (_ BitVec 32) (_ BitVec 32)) Unit!31609)

(assert (=> b!936841 (= lt!422542 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5096 (ListLongMap!12043 (_ BitVec 64)) Bool)

(assert (=> b!936841 (contains!5096 lt!422537 k0!1099)))

(declare-fun lt!422546 () tuple2!13346)

(declare-fun +!2827 (ListLongMap!12043 tuple2!13346) ListLongMap!12043)

(assert (=> b!936841 (= lt!422537 (+!2827 lt!422545 lt!422546))))

(declare-fun lt!422544 () Unit!31609)

(declare-fun addStillContains!546 (ListLongMap!12043 (_ BitVec 64) V!31929 (_ BitVec 64)) Unit!31609)

(assert (=> b!936841 (= lt!422544 (addStillContains!546 lt!422545 lt!422540 lt!422535 k0!1099))))

(declare-fun getCurrentListMap!3272 (array!56388 array!56386 (_ BitVec 32) (_ BitVec 32) V!31929 V!31929 (_ BitVec 32) Int) ListLongMap!12043)

(assert (=> b!936841 (= (getCurrentListMap!3272 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2827 (getCurrentListMap!3272 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422546))))

(assert (=> b!936841 (= lt!422546 (tuple2!13347 lt!422540 lt!422535))))

(declare-fun get!14303 (ValueCell!9630 V!31929) V!31929)

(declare-fun dynLambda!1616 (Int (_ BitVec 64)) V!31929)

(assert (=> b!936841 (= lt!422535 (get!14303 (select (arr!27133 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1616 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422536 () Unit!31609)

(declare-fun lemmaListMapRecursiveValidKeyArray!217 (array!56388 array!56386 (_ BitVec 32) (_ BitVec 32) V!31929 V!31929 (_ BitVec 32) Int) Unit!31609)

(assert (=> b!936841 (= lt!422536 (lemmaListMapRecursiveValidKeyArray!217 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936841 (= e!526050 lt!422543)))

(declare-fun mapIsEmpty!32106 () Bool)

(assert (=> mapIsEmpty!32106 mapRes!32106))

(declare-fun b!936842 () Bool)

(declare-fun e!526054 () Bool)

(declare-fun e!526053 () Bool)

(assert (=> b!936842 (= e!526054 e!526053)))

(declare-fun res!630702 () Bool)

(assert (=> b!936842 (=> (not res!630702) (not e!526053))))

(assert (=> b!936842 (= res!630702 (contains!5096 lt!422545 k0!1099))))

(assert (=> b!936842 (= lt!422545 (getCurrentListMap!3272 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936843 () Bool)

(declare-fun tp_is_empty!20223 () Bool)

(assert (=> b!936843 (= e!526052 tp_is_empty!20223)))

(declare-fun b!936844 () Bool)

(assert (=> b!936844 (= e!526049 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936845 () Bool)

(declare-fun e!526047 () Unit!31609)

(assert (=> b!936845 (= e!526047 e!526050)))

(assert (=> b!936845 (= lt!422540 (select (arr!27134 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97470 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936845 (= c!97470 (validKeyInArray!0 lt!422540))))

(declare-fun b!936846 () Bool)

(declare-fun res!630700 () Bool)

(assert (=> b!936846 (=> (not res!630700) (not e!526054))))

(assert (=> b!936846 (= res!630700 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19123))))

(declare-fun mapNonEmpty!32106 () Bool)

(declare-fun tp!61600 () Bool)

(declare-fun e!526056 () Bool)

(assert (=> mapNonEmpty!32106 (= mapRes!32106 (and tp!61600 e!526056))))

(declare-fun mapKey!32106 () (_ BitVec 32))

(declare-fun mapRest!32106 () (Array (_ BitVec 32) ValueCell!9630))

(declare-fun mapValue!32106 () ValueCell!9630)

(assert (=> mapNonEmpty!32106 (= (arr!27133 _values!1231) (store mapRest!32106 mapKey!32106 mapValue!32106))))

(declare-fun b!936847 () Bool)

(declare-fun e!526051 () Bool)

(assert (=> b!936847 (= e!526053 e!526051)))

(declare-fun res!630703 () Bool)

(assert (=> b!936847 (=> (not res!630703) (not e!526051))))

(declare-fun v!791 () V!31929)

(assert (=> b!936847 (= res!630703 (and (= lt!422541 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!936847 (= lt!422541 (apply!839 lt!422545 k0!1099))))

(declare-fun b!936848 () Bool)

(declare-fun arrayContainsKey!0 (array!56388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936848 (= e!526049 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936849 () Bool)

(assert (=> b!936849 (= e!526056 tp_is_empty!20223)))

(declare-fun res!630704 () Bool)

(assert (=> start!79666 (=> (not res!630704) (not e!526054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79666 (= res!630704 (validMask!0 mask!1881))))

(assert (=> start!79666 e!526054))

(assert (=> start!79666 true))

(assert (=> start!79666 tp_is_empty!20223))

(declare-fun array_inv!21110 (array!56386) Bool)

(assert (=> start!79666 (and (array_inv!21110 _values!1231) e!526048)))

(assert (=> start!79666 tp!61601))

(declare-fun array_inv!21111 (array!56388) Bool)

(assert (=> start!79666 (array_inv!21111 _keys!1487)))

(declare-fun b!936840 () Bool)

(declare-fun res!630701 () Bool)

(assert (=> b!936840 (=> (not res!630701) (not e!526054))))

(assert (=> b!936840 (= res!630701 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27593 _keys!1487))))))

(declare-fun b!936850 () Bool)

(declare-fun res!630706 () Bool)

(assert (=> b!936850 (=> (not res!630706) (not e!526054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56388 (_ BitVec 32)) Bool)

(assert (=> b!936850 (= res!630706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936851 () Bool)

(declare-fun res!630705 () Bool)

(assert (=> b!936851 (=> (not res!630705) (not e!526054))))

(assert (=> b!936851 (= res!630705 (and (= (size!27592 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27593 _keys!1487) (size!27592 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936852 () Bool)

(declare-fun Unit!31612 () Unit!31609)

(assert (=> b!936852 (= e!526047 Unit!31612)))

(declare-fun b!936853 () Bool)

(assert (=> b!936853 (= e!526051 false)))

(declare-fun lt!422534 () Unit!31609)

(assert (=> b!936853 (= lt!422534 e!526047)))

(declare-fun c!97468 () Bool)

(assert (=> b!936853 (= c!97468 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79666 res!630704) b!936851))

(assert (= (and b!936851 res!630705) b!936850))

(assert (= (and b!936850 res!630706) b!936846))

(assert (= (and b!936846 res!630700) b!936840))

(assert (= (and b!936840 res!630701) b!936842))

(assert (= (and b!936842 res!630702) b!936847))

(assert (= (and b!936847 res!630703) b!936853))

(assert (= (and b!936853 c!97468) b!936845))

(assert (= (and b!936853 (not c!97468)) b!936852))

(assert (= (and b!936845 c!97470) b!936841))

(assert (= (and b!936845 (not c!97470)) b!936839))

(assert (= (and b!936841 c!97469) b!936848))

(assert (= (and b!936841 (not c!97469)) b!936844))

(assert (= (and b!936838 condMapEmpty!32106) mapIsEmpty!32106))

(assert (= (and b!936838 (not condMapEmpty!32106)) mapNonEmpty!32106))

(get-info :version)

(assert (= (and mapNonEmpty!32106 ((_ is ValueCellFull!9630) mapValue!32106)) b!936849))

(assert (= (and b!936838 ((_ is ValueCellFull!9630) mapDefault!32106)) b!936843))

(assert (= start!79666 b!936838))

(declare-fun b_lambda!14121 () Bool)

(assert (=> (not b_lambda!14121) (not b!936841)))

(declare-fun t!27383 () Bool)

(declare-fun tb!6109 () Bool)

(assert (=> (and start!79666 (= defaultEntry!1235 defaultEntry!1235) t!27383) tb!6109))

(declare-fun result!12051 () Bool)

(assert (=> tb!6109 (= result!12051 tp_is_empty!20223)))

(assert (=> b!936841 t!27383))

(declare-fun b_and!29023 () Bool)

(assert (= b_and!29021 (and (=> t!27383 result!12051) b_and!29023)))

(declare-fun m!871505 () Bool)

(assert (=> b!936847 m!871505))

(declare-fun m!871507 () Bool)

(assert (=> mapNonEmpty!32106 m!871507))

(declare-fun m!871509 () Bool)

(assert (=> b!936842 m!871509))

(declare-fun m!871511 () Bool)

(assert (=> b!936842 m!871511))

(declare-fun m!871513 () Bool)

(assert (=> start!79666 m!871513))

(declare-fun m!871515 () Bool)

(assert (=> start!79666 m!871515))

(declare-fun m!871517 () Bool)

(assert (=> start!79666 m!871517))

(declare-fun m!871519 () Bool)

(assert (=> b!936848 m!871519))

(declare-fun m!871521 () Bool)

(assert (=> b!936850 m!871521))

(declare-fun m!871523 () Bool)

(assert (=> b!936853 m!871523))

(declare-fun m!871525 () Bool)

(assert (=> b!936841 m!871525))

(declare-fun m!871527 () Bool)

(assert (=> b!936841 m!871527))

(declare-fun m!871529 () Bool)

(assert (=> b!936841 m!871529))

(declare-fun m!871531 () Bool)

(assert (=> b!936841 m!871531))

(assert (=> b!936841 m!871525))

(assert (=> b!936841 m!871527))

(declare-fun m!871533 () Bool)

(assert (=> b!936841 m!871533))

(declare-fun m!871535 () Bool)

(assert (=> b!936841 m!871535))

(declare-fun m!871537 () Bool)

(assert (=> b!936841 m!871537))

(declare-fun m!871539 () Bool)

(assert (=> b!936841 m!871539))

(declare-fun m!871541 () Bool)

(assert (=> b!936841 m!871541))

(declare-fun m!871543 () Bool)

(assert (=> b!936841 m!871543))

(declare-fun m!871545 () Bool)

(assert (=> b!936841 m!871545))

(declare-fun m!871547 () Bool)

(assert (=> b!936841 m!871547))

(declare-fun m!871549 () Bool)

(assert (=> b!936841 m!871549))

(declare-fun m!871551 () Bool)

(assert (=> b!936841 m!871551))

(declare-fun m!871553 () Bool)

(assert (=> b!936841 m!871553))

(assert (=> b!936841 m!871541))

(declare-fun m!871555 () Bool)

(assert (=> b!936841 m!871555))

(declare-fun m!871557 () Bool)

(assert (=> b!936846 m!871557))

(declare-fun m!871559 () Bool)

(assert (=> b!936845 m!871559))

(declare-fun m!871561 () Bool)

(assert (=> b!936845 m!871561))

(check-sat (not mapNonEmpty!32106) (not b!936848) (not b!936846) (not b!936842) (not b_next!17715) (not b!936841) (not b!936850) b_and!29023 (not b!936853) tp_is_empty!20223 (not b_lambda!14121) (not b!936845) (not b!936847) (not start!79666))
(check-sat b_and!29023 (not b_next!17715))
