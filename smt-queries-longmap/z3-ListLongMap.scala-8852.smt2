; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107574 () Bool)

(assert start!107574)

(declare-fun b_free!27655 () Bool)

(declare-fun b_next!27655 () Bool)

(assert (=> start!107574 (= b_free!27655 (not b_next!27655))))

(declare-fun tp!97473 () Bool)

(declare-fun b_and!45705 () Bool)

(assert (=> start!107574 (= tp!97473 b_and!45705)))

(declare-fun b!1273501 () Bool)

(declare-fun res!846819 () Bool)

(declare-fun e!726435 () Bool)

(assert (=> b!1273501 (=> (not res!846819) (not e!726435))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!83317 0))(
  ( (array!83318 (arr!40190 (Array (_ BitVec 32) (_ BitVec 64))) (size!40727 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83317)

(assert (=> b!1273501 (= res!846819 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40727 _keys!1364)) (bvsge from!1698 (size!40727 _keys!1364))))))

(declare-fun b!1273502 () Bool)

(declare-fun res!846815 () Bool)

(assert (=> b!1273502 (=> (not res!846815) (not e!726435))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83317 (_ BitVec 32)) Bool)

(assert (=> b!1273502 (= res!846815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846816 () Bool)

(assert (=> start!107574 (=> (not res!846816) (not e!726435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107574 (= res!846816 (validMask!0 mask!1730))))

(assert (=> start!107574 e!726435))

(declare-datatypes ((V!49227 0))(
  ( (V!49228 (val!16587 Int)) )
))
(declare-datatypes ((ValueCell!15659 0))(
  ( (ValueCellFull!15659 (v!19219 V!49227)) (EmptyCell!15659) )
))
(declare-datatypes ((array!83319 0))(
  ( (array!83320 (arr!40191 (Array (_ BitVec 32) ValueCell!15659)) (size!40728 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83319)

(declare-fun e!726439 () Bool)

(declare-fun array_inv!30731 (array!83319) Bool)

(assert (=> start!107574 (and (array_inv!30731 _values!1134) e!726439)))

(assert (=> start!107574 true))

(declare-fun array_inv!30732 (array!83317) Bool)

(assert (=> start!107574 (array_inv!30732 _keys!1364)))

(declare-fun tp_is_empty!33025 () Bool)

(assert (=> start!107574 tp_is_empty!33025))

(assert (=> start!107574 tp!97473))

(declare-fun mapNonEmpty!51121 () Bool)

(declare-fun mapRes!51121 () Bool)

(declare-fun tp!97474 () Bool)

(declare-fun e!726437 () Bool)

(assert (=> mapNonEmpty!51121 (= mapRes!51121 (and tp!97474 e!726437))))

(declare-fun mapValue!51121 () ValueCell!15659)

(declare-fun mapKey!51121 () (_ BitVec 32))

(declare-fun mapRest!51121 () (Array (_ BitVec 32) ValueCell!15659))

(assert (=> mapNonEmpty!51121 (= (arr!40191 _values!1134) (store mapRest!51121 mapKey!51121 mapValue!51121))))

(declare-fun mapIsEmpty!51121 () Bool)

(assert (=> mapIsEmpty!51121 mapRes!51121))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!49227)

(declare-fun b!1273503 () Bool)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!49227)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49227)

(declare-fun zeroValueBefore!52 () V!49227)

(declare-datatypes ((tuple2!21378 0))(
  ( (tuple2!21379 (_1!10700 (_ BitVec 64)) (_2!10700 V!49227)) )
))
(declare-datatypes ((List!28578 0))(
  ( (Nil!28575) (Cons!28574 (h!29792 tuple2!21378) (t!42101 List!28578)) )
))
(declare-datatypes ((ListLongMap!19115 0))(
  ( (ListLongMap!19116 (toList!9573 List!28578)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5945 (array!83317 array!83319 (_ BitVec 32) (_ BitVec 32) V!49227 V!49227 (_ BitVec 32) Int) ListLongMap!19115)

(assert (=> b!1273503 (= e!726435 (not (= (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(declare-fun b!1273504 () Bool)

(assert (=> b!1273504 (= e!726437 tp_is_empty!33025)))

(declare-fun b!1273505 () Bool)

(declare-fun res!846818 () Bool)

(assert (=> b!1273505 (=> (not res!846818) (not e!726435))))

(declare-datatypes ((List!28579 0))(
  ( (Nil!28576) (Cons!28575 (h!29793 (_ BitVec 64)) (t!42102 List!28579)) )
))
(declare-fun arrayNoDuplicates!0 (array!83317 (_ BitVec 32) List!28579) Bool)

(assert (=> b!1273505 (= res!846818 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28576))))

(declare-fun b!1273506 () Bool)

(declare-fun res!846817 () Bool)

(assert (=> b!1273506 (=> (not res!846817) (not e!726435))))

(assert (=> b!1273506 (= res!846817 (and (= (size!40728 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40727 _keys!1364) (size!40728 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1273507 () Bool)

(declare-fun e!726438 () Bool)

(assert (=> b!1273507 (= e!726438 tp_is_empty!33025)))

(declare-fun b!1273508 () Bool)

(assert (=> b!1273508 (= e!726439 (and e!726438 mapRes!51121))))

(declare-fun condMapEmpty!51121 () Bool)

(declare-fun mapDefault!51121 () ValueCell!15659)

(assert (=> b!1273508 (= condMapEmpty!51121 (= (arr!40191 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15659)) mapDefault!51121)))))

(assert (= (and start!107574 res!846816) b!1273506))

(assert (= (and b!1273506 res!846817) b!1273502))

(assert (= (and b!1273502 res!846815) b!1273505))

(assert (= (and b!1273505 res!846818) b!1273501))

(assert (= (and b!1273501 res!846819) b!1273503))

(assert (= (and b!1273508 condMapEmpty!51121) mapIsEmpty!51121))

(assert (= (and b!1273508 (not condMapEmpty!51121)) mapNonEmpty!51121))

(get-info :version)

(assert (= (and mapNonEmpty!51121 ((_ is ValueCellFull!15659) mapValue!51121)) b!1273504))

(assert (= (and b!1273508 ((_ is ValueCellFull!15659) mapDefault!51121)) b!1273507))

(assert (= start!107574 b!1273508))

(declare-fun m!1171555 () Bool)

(assert (=> b!1273503 m!1171555))

(declare-fun m!1171557 () Bool)

(assert (=> b!1273503 m!1171557))

(declare-fun m!1171559 () Bool)

(assert (=> mapNonEmpty!51121 m!1171559))

(declare-fun m!1171561 () Bool)

(assert (=> start!107574 m!1171561))

(declare-fun m!1171563 () Bool)

(assert (=> start!107574 m!1171563))

(declare-fun m!1171565 () Bool)

(assert (=> start!107574 m!1171565))

(declare-fun m!1171567 () Bool)

(assert (=> b!1273505 m!1171567))

(declare-fun m!1171569 () Bool)

(assert (=> b!1273502 m!1171569))

(check-sat (not b!1273503) b_and!45705 (not mapNonEmpty!51121) (not start!107574) (not b_next!27655) (not b!1273502) tp_is_empty!33025 (not b!1273505))
(check-sat b_and!45705 (not b_next!27655))
(get-model)

(declare-fun b!1273567 () Bool)

(declare-fun e!726478 () Bool)

(declare-fun call!62595 () Bool)

(assert (=> b!1273567 (= e!726478 call!62595)))

(declare-fun b!1273568 () Bool)

(declare-fun e!726480 () Bool)

(declare-fun e!726481 () Bool)

(assert (=> b!1273568 (= e!726480 e!726481)))

(declare-fun res!846856 () Bool)

(assert (=> b!1273568 (=> (not res!846856) (not e!726481))))

(declare-fun e!726479 () Bool)

(assert (=> b!1273568 (= res!846856 (not e!726479))))

(declare-fun res!846857 () Bool)

(assert (=> b!1273568 (=> (not res!846857) (not e!726479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273568 (= res!846857 (validKeyInArray!0 (select (arr!40190 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun bm!62592 () Bool)

(declare-fun c!124065 () Bool)

(assert (=> bm!62592 (= call!62595 (arrayNoDuplicates!0 _keys!1364 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124065 (Cons!28575 (select (arr!40190 _keys!1364) #b00000000000000000000000000000000) Nil!28576) Nil!28576)))))

(declare-fun b!1273569 () Bool)

(assert (=> b!1273569 (= e!726481 e!726478)))

(assert (=> b!1273569 (= c!124065 (validKeyInArray!0 (select (arr!40190 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun d!140277 () Bool)

(declare-fun res!846858 () Bool)

(assert (=> d!140277 (=> res!846858 e!726480)))

(assert (=> d!140277 (= res!846858 (bvsge #b00000000000000000000000000000000 (size!40727 _keys!1364)))))

(assert (=> d!140277 (= (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28576) e!726480)))

(declare-fun b!1273570 () Bool)

(assert (=> b!1273570 (= e!726478 call!62595)))

(declare-fun b!1273571 () Bool)

(declare-fun contains!7690 (List!28579 (_ BitVec 64)) Bool)

(assert (=> b!1273571 (= e!726479 (contains!7690 Nil!28576 (select (arr!40190 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!140277 (not res!846858)) b!1273568))

(assert (= (and b!1273568 res!846857) b!1273571))

(assert (= (and b!1273568 res!846856) b!1273569))

(assert (= (and b!1273569 c!124065) b!1273567))

(assert (= (and b!1273569 (not c!124065)) b!1273570))

(assert (= (or b!1273567 b!1273570) bm!62592))

(declare-fun m!1171603 () Bool)

(assert (=> b!1273568 m!1171603))

(assert (=> b!1273568 m!1171603))

(declare-fun m!1171605 () Bool)

(assert (=> b!1273568 m!1171605))

(assert (=> bm!62592 m!1171603))

(declare-fun m!1171607 () Bool)

(assert (=> bm!62592 m!1171607))

(assert (=> b!1273569 m!1171603))

(assert (=> b!1273569 m!1171603))

(assert (=> b!1273569 m!1171605))

(assert (=> b!1273571 m!1171603))

(assert (=> b!1273571 m!1171603))

(declare-fun m!1171609 () Bool)

(assert (=> b!1273571 m!1171609))

(assert (=> b!1273505 d!140277))

(declare-fun b!1273596 () Bool)

(declare-fun e!726496 () Bool)

(declare-fun lt!575511 () ListLongMap!19115)

(declare-fun isEmpty!1052 (ListLongMap!19115) Bool)

(assert (=> b!1273596 (= e!726496 (isEmpty!1052 lt!575511))))

(declare-fun b!1273597 () Bool)

(declare-fun res!846869 () Bool)

(declare-fun e!726499 () Bool)

(assert (=> b!1273597 (=> (not res!846869) (not e!726499))))

(declare-fun contains!7691 (ListLongMap!19115 (_ BitVec 64)) Bool)

(assert (=> b!1273597 (= res!846869 (not (contains!7691 lt!575511 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1273598 () Bool)

(declare-fun e!726500 () ListLongMap!19115)

(declare-fun call!62598 () ListLongMap!19115)

(assert (=> b!1273598 (= e!726500 call!62598)))

(declare-fun b!1273599 () Bool)

(declare-fun e!726501 () Bool)

(declare-fun e!726498 () Bool)

(assert (=> b!1273599 (= e!726501 e!726498)))

(assert (=> b!1273599 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40727 _keys!1364)))))

(declare-fun res!846867 () Bool)

(assert (=> b!1273599 (= res!846867 (contains!7691 lt!575511 (select (arr!40190 _keys!1364) from!1698)))))

(assert (=> b!1273599 (=> (not res!846867) (not e!726498))))

(declare-fun b!1273600 () Bool)

(assert (=> b!1273600 (= e!726496 (= lt!575511 (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1273602 () Bool)

(assert (=> b!1273602 (= e!726501 e!726496)))

(declare-fun c!124076 () Bool)

(assert (=> b!1273602 (= c!124076 (bvslt from!1698 (size!40727 _keys!1364)))))

(declare-fun b!1273603 () Bool)

(declare-fun e!726502 () ListLongMap!19115)

(assert (=> b!1273603 (= e!726502 (ListLongMap!19116 Nil!28575))))

(declare-fun b!1273604 () Bool)

(assert (=> b!1273604 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40727 _keys!1364)))))

(assert (=> b!1273604 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40728 _values!1134)))))

(declare-fun apply!1015 (ListLongMap!19115 (_ BitVec 64)) V!49227)

(declare-fun get!20558 (ValueCell!15659 V!49227) V!49227)

(declare-fun dynLambda!3467 (Int (_ BitVec 64)) V!49227)

(assert (=> b!1273604 (= e!726498 (= (apply!1015 lt!575511 (select (arr!40190 _keys!1364) from!1698)) (get!20558 (select (arr!40191 _values!1134) from!1698) (dynLambda!3467 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62595 () Bool)

(assert (=> bm!62595 (= call!62598 (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1273605 () Bool)

(declare-datatypes ((Unit!42287 0))(
  ( (Unit!42288) )
))
(declare-fun lt!575510 () Unit!42287)

(declare-fun lt!575512 () Unit!42287)

(assert (=> b!1273605 (= lt!575510 lt!575512)))

(declare-fun lt!575508 () (_ BitVec 64))

(declare-fun lt!575507 () (_ BitVec 64))

(declare-fun lt!575509 () ListLongMap!19115)

(declare-fun lt!575506 () V!49227)

(declare-fun +!4315 (ListLongMap!19115 tuple2!21378) ListLongMap!19115)

(assert (=> b!1273605 (not (contains!7691 (+!4315 lt!575509 (tuple2!21379 lt!575507 lt!575506)) lt!575508))))

(declare-fun addStillNotContains!336 (ListLongMap!19115 (_ BitVec 64) V!49227 (_ BitVec 64)) Unit!42287)

(assert (=> b!1273605 (= lt!575512 (addStillNotContains!336 lt!575509 lt!575507 lt!575506 lt!575508))))

(assert (=> b!1273605 (= lt!575508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1273605 (= lt!575506 (get!20558 (select (arr!40191 _values!1134) from!1698) (dynLambda!3467 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1273605 (= lt!575507 (select (arr!40190 _keys!1364) from!1698))))

(assert (=> b!1273605 (= lt!575509 call!62598)))

(assert (=> b!1273605 (= e!726500 (+!4315 call!62598 (tuple2!21379 (select (arr!40190 _keys!1364) from!1698) (get!20558 (select (arr!40191 _values!1134) from!1698) (dynLambda!3467 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!140279 () Bool)

(assert (=> d!140279 e!726499))

(declare-fun res!846870 () Bool)

(assert (=> d!140279 (=> (not res!846870) (not e!726499))))

(assert (=> d!140279 (= res!846870 (not (contains!7691 lt!575511 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140279 (= lt!575511 e!726502)))

(declare-fun c!124077 () Bool)

(assert (=> d!140279 (= c!124077 (bvsge from!1698 (size!40727 _keys!1364)))))

(assert (=> d!140279 (validMask!0 mask!1730)))

(assert (=> d!140279 (= (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) lt!575511)))

(declare-fun b!1273601 () Bool)

(assert (=> b!1273601 (= e!726502 e!726500)))

(declare-fun c!124074 () Bool)

(assert (=> b!1273601 (= c!124074 (validKeyInArray!0 (select (arr!40190 _keys!1364) from!1698)))))

(declare-fun b!1273606 () Bool)

(assert (=> b!1273606 (= e!726499 e!726501)))

(declare-fun c!124075 () Bool)

(declare-fun e!726497 () Bool)

(assert (=> b!1273606 (= c!124075 e!726497)))

(declare-fun res!846868 () Bool)

(assert (=> b!1273606 (=> (not res!846868) (not e!726497))))

(assert (=> b!1273606 (= res!846868 (bvslt from!1698 (size!40727 _keys!1364)))))

(declare-fun b!1273607 () Bool)

(assert (=> b!1273607 (= e!726497 (validKeyInArray!0 (select (arr!40190 _keys!1364) from!1698)))))

(assert (=> b!1273607 (bvsge from!1698 #b00000000000000000000000000000000)))

(assert (= (and d!140279 c!124077) b!1273603))

(assert (= (and d!140279 (not c!124077)) b!1273601))

(assert (= (and b!1273601 c!124074) b!1273605))

(assert (= (and b!1273601 (not c!124074)) b!1273598))

(assert (= (or b!1273605 b!1273598) bm!62595))

(assert (= (and d!140279 res!846870) b!1273597))

(assert (= (and b!1273597 res!846869) b!1273606))

(assert (= (and b!1273606 res!846868) b!1273607))

(assert (= (and b!1273606 c!124075) b!1273599))

(assert (= (and b!1273606 (not c!124075)) b!1273602))

(assert (= (and b!1273599 res!846867) b!1273604))

(assert (= (and b!1273602 c!124076) b!1273600))

(assert (= (and b!1273602 (not c!124076)) b!1273596))

(declare-fun b_lambda!23065 () Bool)

(assert (=> (not b_lambda!23065) (not b!1273604)))

(declare-fun t!42108 () Bool)

(declare-fun tb!11331 () Bool)

(assert (=> (and start!107574 (= defaultEntry!1142 defaultEntry!1142) t!42108) tb!11331))

(declare-fun result!23547 () Bool)

(assert (=> tb!11331 (= result!23547 tp_is_empty!33025)))

(assert (=> b!1273604 t!42108))

(declare-fun b_and!45711 () Bool)

(assert (= b_and!45705 (and (=> t!42108 result!23547) b_and!45711)))

(declare-fun b_lambda!23067 () Bool)

(assert (=> (not b_lambda!23067) (not b!1273605)))

(assert (=> b!1273605 t!42108))

(declare-fun b_and!45713 () Bool)

(assert (= b_and!45711 (and (=> t!42108 result!23547) b_and!45713)))

(declare-fun m!1171611 () Bool)

(assert (=> b!1273600 m!1171611))

(declare-fun m!1171613 () Bool)

(assert (=> b!1273597 m!1171613))

(declare-fun m!1171615 () Bool)

(assert (=> b!1273605 m!1171615))

(assert (=> b!1273605 m!1171615))

(declare-fun m!1171617 () Bool)

(assert (=> b!1273605 m!1171617))

(declare-fun m!1171619 () Bool)

(assert (=> b!1273605 m!1171619))

(declare-fun m!1171621 () Bool)

(assert (=> b!1273605 m!1171621))

(declare-fun m!1171623 () Bool)

(assert (=> b!1273605 m!1171623))

(declare-fun m!1171625 () Bool)

(assert (=> b!1273605 m!1171625))

(declare-fun m!1171627 () Bool)

(assert (=> b!1273605 m!1171627))

(declare-fun m!1171629 () Bool)

(assert (=> b!1273605 m!1171629))

(assert (=> b!1273605 m!1171617))

(assert (=> b!1273605 m!1171623))

(assert (=> b!1273604 m!1171615))

(assert (=> b!1273604 m!1171615))

(assert (=> b!1273604 m!1171617))

(assert (=> b!1273604 m!1171619))

(assert (=> b!1273604 m!1171617))

(assert (=> b!1273604 m!1171629))

(assert (=> b!1273604 m!1171629))

(declare-fun m!1171631 () Bool)

(assert (=> b!1273604 m!1171631))

(declare-fun m!1171633 () Bool)

(assert (=> b!1273596 m!1171633))

(assert (=> bm!62595 m!1171611))

(assert (=> b!1273607 m!1171629))

(assert (=> b!1273607 m!1171629))

(declare-fun m!1171635 () Bool)

(assert (=> b!1273607 m!1171635))

(declare-fun m!1171637 () Bool)

(assert (=> d!140279 m!1171637))

(assert (=> d!140279 m!1171561))

(assert (=> b!1273601 m!1171629))

(assert (=> b!1273601 m!1171629))

(assert (=> b!1273601 m!1171635))

(assert (=> b!1273599 m!1171629))

(assert (=> b!1273599 m!1171629))

(declare-fun m!1171639 () Bool)

(assert (=> b!1273599 m!1171639))

(assert (=> b!1273503 d!140279))

(declare-fun b!1273610 () Bool)

(declare-fun e!726503 () Bool)

(declare-fun lt!575518 () ListLongMap!19115)

(assert (=> b!1273610 (= e!726503 (isEmpty!1052 lt!575518))))

(declare-fun b!1273611 () Bool)

(declare-fun res!846873 () Bool)

(declare-fun e!726506 () Bool)

(assert (=> b!1273611 (=> (not res!846873) (not e!726506))))

(assert (=> b!1273611 (= res!846873 (not (contains!7691 lt!575518 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1273612 () Bool)

(declare-fun e!726507 () ListLongMap!19115)

(declare-fun call!62599 () ListLongMap!19115)

(assert (=> b!1273612 (= e!726507 call!62599)))

(declare-fun b!1273613 () Bool)

(declare-fun e!726508 () Bool)

(declare-fun e!726505 () Bool)

(assert (=> b!1273613 (= e!726508 e!726505)))

(assert (=> b!1273613 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40727 _keys!1364)))))

(declare-fun res!846871 () Bool)

(assert (=> b!1273613 (= res!846871 (contains!7691 lt!575518 (select (arr!40190 _keys!1364) from!1698)))))

(assert (=> b!1273613 (=> (not res!846871) (not e!726505))))

(declare-fun b!1273614 () Bool)

(assert (=> b!1273614 (= e!726503 (= lt!575518 (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1273616 () Bool)

(assert (=> b!1273616 (= e!726508 e!726503)))

(declare-fun c!124080 () Bool)

(assert (=> b!1273616 (= c!124080 (bvslt from!1698 (size!40727 _keys!1364)))))

(declare-fun b!1273617 () Bool)

(declare-fun e!726509 () ListLongMap!19115)

(assert (=> b!1273617 (= e!726509 (ListLongMap!19116 Nil!28575))))

(declare-fun b!1273618 () Bool)

(assert (=> b!1273618 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40727 _keys!1364)))))

(assert (=> b!1273618 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40728 _values!1134)))))

(assert (=> b!1273618 (= e!726505 (= (apply!1015 lt!575518 (select (arr!40190 _keys!1364) from!1698)) (get!20558 (select (arr!40191 _values!1134) from!1698) (dynLambda!3467 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62596 () Bool)

(assert (=> bm!62596 (= call!62599 (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1273619 () Bool)

(declare-fun lt!575517 () Unit!42287)

(declare-fun lt!575519 () Unit!42287)

(assert (=> b!1273619 (= lt!575517 lt!575519)))

(declare-fun lt!575513 () V!49227)

(declare-fun lt!575516 () ListLongMap!19115)

(declare-fun lt!575514 () (_ BitVec 64))

(declare-fun lt!575515 () (_ BitVec 64))

(assert (=> b!1273619 (not (contains!7691 (+!4315 lt!575516 (tuple2!21379 lt!575514 lt!575513)) lt!575515))))

(assert (=> b!1273619 (= lt!575519 (addStillNotContains!336 lt!575516 lt!575514 lt!575513 lt!575515))))

(assert (=> b!1273619 (= lt!575515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1273619 (= lt!575513 (get!20558 (select (arr!40191 _values!1134) from!1698) (dynLambda!3467 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1273619 (= lt!575514 (select (arr!40190 _keys!1364) from!1698))))

(assert (=> b!1273619 (= lt!575516 call!62599)))

(assert (=> b!1273619 (= e!726507 (+!4315 call!62599 (tuple2!21379 (select (arr!40190 _keys!1364) from!1698) (get!20558 (select (arr!40191 _values!1134) from!1698) (dynLambda!3467 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!140281 () Bool)

(assert (=> d!140281 e!726506))

(declare-fun res!846874 () Bool)

(assert (=> d!140281 (=> (not res!846874) (not e!726506))))

(assert (=> d!140281 (= res!846874 (not (contains!7691 lt!575518 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140281 (= lt!575518 e!726509)))

(declare-fun c!124081 () Bool)

(assert (=> d!140281 (= c!124081 (bvsge from!1698 (size!40727 _keys!1364)))))

(assert (=> d!140281 (validMask!0 mask!1730)))

(assert (=> d!140281 (= (getCurrentListMapNoExtraKeys!5945 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142) lt!575518)))

(declare-fun b!1273615 () Bool)

(assert (=> b!1273615 (= e!726509 e!726507)))

(declare-fun c!124078 () Bool)

(assert (=> b!1273615 (= c!124078 (validKeyInArray!0 (select (arr!40190 _keys!1364) from!1698)))))

(declare-fun b!1273620 () Bool)

(assert (=> b!1273620 (= e!726506 e!726508)))

(declare-fun c!124079 () Bool)

(declare-fun e!726504 () Bool)

(assert (=> b!1273620 (= c!124079 e!726504)))

(declare-fun res!846872 () Bool)

(assert (=> b!1273620 (=> (not res!846872) (not e!726504))))

(assert (=> b!1273620 (= res!846872 (bvslt from!1698 (size!40727 _keys!1364)))))

(declare-fun b!1273621 () Bool)

(assert (=> b!1273621 (= e!726504 (validKeyInArray!0 (select (arr!40190 _keys!1364) from!1698)))))

(assert (=> b!1273621 (bvsge from!1698 #b00000000000000000000000000000000)))

(assert (= (and d!140281 c!124081) b!1273617))

(assert (= (and d!140281 (not c!124081)) b!1273615))

(assert (= (and b!1273615 c!124078) b!1273619))

(assert (= (and b!1273615 (not c!124078)) b!1273612))

(assert (= (or b!1273619 b!1273612) bm!62596))

(assert (= (and d!140281 res!846874) b!1273611))

(assert (= (and b!1273611 res!846873) b!1273620))

(assert (= (and b!1273620 res!846872) b!1273621))

(assert (= (and b!1273620 c!124079) b!1273613))

(assert (= (and b!1273620 (not c!124079)) b!1273616))

(assert (= (and b!1273613 res!846871) b!1273618))

(assert (= (and b!1273616 c!124080) b!1273614))

(assert (= (and b!1273616 (not c!124080)) b!1273610))

(declare-fun b_lambda!23069 () Bool)

(assert (=> (not b_lambda!23069) (not b!1273618)))

(assert (=> b!1273618 t!42108))

(declare-fun b_and!45715 () Bool)

(assert (= b_and!45713 (and (=> t!42108 result!23547) b_and!45715)))

(declare-fun b_lambda!23071 () Bool)

(assert (=> (not b_lambda!23071) (not b!1273619)))

(assert (=> b!1273619 t!42108))

(declare-fun b_and!45717 () Bool)

(assert (= b_and!45715 (and (=> t!42108 result!23547) b_and!45717)))

(declare-fun m!1171641 () Bool)

(assert (=> b!1273614 m!1171641))

(declare-fun m!1171643 () Bool)

(assert (=> b!1273611 m!1171643))

(assert (=> b!1273619 m!1171615))

(assert (=> b!1273619 m!1171615))

(assert (=> b!1273619 m!1171617))

(assert (=> b!1273619 m!1171619))

(declare-fun m!1171645 () Bool)

(assert (=> b!1273619 m!1171645))

(declare-fun m!1171647 () Bool)

(assert (=> b!1273619 m!1171647))

(declare-fun m!1171649 () Bool)

(assert (=> b!1273619 m!1171649))

(declare-fun m!1171651 () Bool)

(assert (=> b!1273619 m!1171651))

(assert (=> b!1273619 m!1171629))

(assert (=> b!1273619 m!1171617))

(assert (=> b!1273619 m!1171647))

(assert (=> b!1273618 m!1171615))

(assert (=> b!1273618 m!1171615))

(assert (=> b!1273618 m!1171617))

(assert (=> b!1273618 m!1171619))

(assert (=> b!1273618 m!1171617))

(assert (=> b!1273618 m!1171629))

(assert (=> b!1273618 m!1171629))

(declare-fun m!1171653 () Bool)

(assert (=> b!1273618 m!1171653))

(declare-fun m!1171655 () Bool)

(assert (=> b!1273610 m!1171655))

(assert (=> bm!62596 m!1171641))

(assert (=> b!1273621 m!1171629))

(assert (=> b!1273621 m!1171629))

(assert (=> b!1273621 m!1171635))

(declare-fun m!1171657 () Bool)

(assert (=> d!140281 m!1171657))

(assert (=> d!140281 m!1171561))

(assert (=> b!1273615 m!1171629))

(assert (=> b!1273615 m!1171629))

(assert (=> b!1273615 m!1171635))

(assert (=> b!1273613 m!1171629))

(assert (=> b!1273613 m!1171629))

(declare-fun m!1171659 () Bool)

(assert (=> b!1273613 m!1171659))

(assert (=> b!1273503 d!140281))

(declare-fun d!140283 () Bool)

(assert (=> d!140283 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107574 d!140283))

(declare-fun d!140285 () Bool)

(assert (=> d!140285 (= (array_inv!30731 _values!1134) (bvsge (size!40728 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107574 d!140285))

(declare-fun d!140287 () Bool)

(assert (=> d!140287 (= (array_inv!30732 _keys!1364) (bvsge (size!40727 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107574 d!140287))

(declare-fun d!140289 () Bool)

(declare-fun res!846880 () Bool)

(declare-fun e!726517 () Bool)

(assert (=> d!140289 (=> res!846880 e!726517)))

(assert (=> d!140289 (= res!846880 (bvsge #b00000000000000000000000000000000 (size!40727 _keys!1364)))))

(assert (=> d!140289 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!726517)))

(declare-fun b!1273630 () Bool)

(declare-fun e!726516 () Bool)

(declare-fun call!62602 () Bool)

(assert (=> b!1273630 (= e!726516 call!62602)))

(declare-fun b!1273631 () Bool)

(declare-fun e!726518 () Bool)

(assert (=> b!1273631 (= e!726516 e!726518)))

(declare-fun lt!575527 () (_ BitVec 64))

(assert (=> b!1273631 (= lt!575527 (select (arr!40190 _keys!1364) #b00000000000000000000000000000000))))

(declare-fun lt!575526 () Unit!42287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83317 (_ BitVec 64) (_ BitVec 32)) Unit!42287)

(assert (=> b!1273631 (= lt!575526 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!575527 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273631 (arrayContainsKey!0 _keys!1364 lt!575527 #b00000000000000000000000000000000)))

(declare-fun lt!575528 () Unit!42287)

(assert (=> b!1273631 (= lt!575528 lt!575526)))

(declare-fun res!846879 () Bool)

(declare-datatypes ((SeekEntryResult!9944 0))(
  ( (MissingZero!9944 (index!42147 (_ BitVec 32))) (Found!9944 (index!42148 (_ BitVec 32))) (Intermediate!9944 (undefined!10756 Bool) (index!42149 (_ BitVec 32)) (x!112365 (_ BitVec 32))) (Undefined!9944) (MissingVacant!9944 (index!42150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83317 (_ BitVec 32)) SeekEntryResult!9944)

(assert (=> b!1273631 (= res!846879 (= (seekEntryOrOpen!0 (select (arr!40190 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9944 #b00000000000000000000000000000000)))))

(assert (=> b!1273631 (=> (not res!846879) (not e!726518))))

(declare-fun b!1273632 () Bool)

(assert (=> b!1273632 (= e!726518 call!62602)))

(declare-fun bm!62599 () Bool)

(assert (=> bm!62599 (= call!62602 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1273633 () Bool)

(assert (=> b!1273633 (= e!726517 e!726516)))

(declare-fun c!124084 () Bool)

(assert (=> b!1273633 (= c!124084 (validKeyInArray!0 (select (arr!40190 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!140289 (not res!846880)) b!1273633))

(assert (= (and b!1273633 c!124084) b!1273631))

(assert (= (and b!1273633 (not c!124084)) b!1273630))

(assert (= (and b!1273631 res!846879) b!1273632))

(assert (= (or b!1273632 b!1273630) bm!62599))

(assert (=> b!1273631 m!1171603))

(declare-fun m!1171661 () Bool)

(assert (=> b!1273631 m!1171661))

(declare-fun m!1171663 () Bool)

(assert (=> b!1273631 m!1171663))

(assert (=> b!1273631 m!1171603))

(declare-fun m!1171665 () Bool)

(assert (=> b!1273631 m!1171665))

(declare-fun m!1171667 () Bool)

(assert (=> bm!62599 m!1171667))

(assert (=> b!1273633 m!1171603))

(assert (=> b!1273633 m!1171603))

(assert (=> b!1273633 m!1171605))

(assert (=> b!1273502 d!140289))

(declare-fun condMapEmpty!51130 () Bool)

(declare-fun mapDefault!51130 () ValueCell!15659)

(assert (=> mapNonEmpty!51121 (= condMapEmpty!51130 (= mapRest!51121 ((as const (Array (_ BitVec 32) ValueCell!15659)) mapDefault!51130)))))

(declare-fun e!726523 () Bool)

(declare-fun mapRes!51130 () Bool)

(assert (=> mapNonEmpty!51121 (= tp!97474 (and e!726523 mapRes!51130))))

(declare-fun b!1273641 () Bool)

(assert (=> b!1273641 (= e!726523 tp_is_empty!33025)))

(declare-fun b!1273640 () Bool)

(declare-fun e!726524 () Bool)

(assert (=> b!1273640 (= e!726524 tp_is_empty!33025)))

(declare-fun mapNonEmpty!51130 () Bool)

(declare-fun tp!97489 () Bool)

(assert (=> mapNonEmpty!51130 (= mapRes!51130 (and tp!97489 e!726524))))

(declare-fun mapRest!51130 () (Array (_ BitVec 32) ValueCell!15659))

(declare-fun mapValue!51130 () ValueCell!15659)

(declare-fun mapKey!51130 () (_ BitVec 32))

(assert (=> mapNonEmpty!51130 (= mapRest!51121 (store mapRest!51130 mapKey!51130 mapValue!51130))))

(declare-fun mapIsEmpty!51130 () Bool)

(assert (=> mapIsEmpty!51130 mapRes!51130))

(assert (= (and mapNonEmpty!51121 condMapEmpty!51130) mapIsEmpty!51130))

(assert (= (and mapNonEmpty!51121 (not condMapEmpty!51130)) mapNonEmpty!51130))

(assert (= (and mapNonEmpty!51130 ((_ is ValueCellFull!15659) mapValue!51130)) b!1273640))

(assert (= (and mapNonEmpty!51121 ((_ is ValueCellFull!15659) mapDefault!51130)) b!1273641))

(declare-fun m!1171669 () Bool)

(assert (=> mapNonEmpty!51130 m!1171669))

(declare-fun b_lambda!23073 () Bool)

(assert (= b_lambda!23069 (or (and start!107574 b_free!27655) b_lambda!23073)))

(declare-fun b_lambda!23075 () Bool)

(assert (= b_lambda!23065 (or (and start!107574 b_free!27655) b_lambda!23075)))

(declare-fun b_lambda!23077 () Bool)

(assert (= b_lambda!23071 (or (and start!107574 b_free!27655) b_lambda!23077)))

(declare-fun b_lambda!23079 () Bool)

(assert (= b_lambda!23067 (or (and start!107574 b_free!27655) b_lambda!23079)))

(check-sat (not b!1273607) (not b_next!27655) (not b_lambda!23073) (not b!1273614) (not bm!62599) (not b!1273605) (not b!1273615) (not b!1273604) (not b!1273571) (not b!1273600) (not d!140279) (not b!1273569) (not b!1273568) (not bm!62595) (not b_lambda!23079) tp_is_empty!33025 (not b!1273631) (not b!1273610) (not mapNonEmpty!51130) (not b_lambda!23077) (not b_lambda!23075) (not b!1273597) (not b!1273596) b_and!45717 (not b!1273613) (not b!1273633) (not b!1273611) (not b!1273618) (not b!1273619) (not bm!62596) (not d!140281) (not b!1273601) (not b!1273621) (not bm!62592) (not b!1273599))
(check-sat b_and!45717 (not b_next!27655))
