; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107350 () Bool)

(assert start!107350)

(declare-fun b_free!27655 () Bool)

(declare-fun b_next!27655 () Bool)

(assert (=> start!107350 (= b_free!27655 (not b_next!27655))))

(declare-fun tp!97475 () Bool)

(declare-fun b_and!45685 () Bool)

(assert (=> start!107350 (= tp!97475 b_and!45685)))

(declare-fun mapNonEmpty!51121 () Bool)

(declare-fun mapRes!51121 () Bool)

(declare-fun tp!97474 () Bool)

(declare-fun e!725560 () Bool)

(assert (=> mapNonEmpty!51121 (= mapRes!51121 (and tp!97474 e!725560))))

(declare-datatypes ((V!49227 0))(
  ( (V!49228 (val!16587 Int)) )
))
(declare-datatypes ((ValueCell!15659 0))(
  ( (ValueCellFull!15659 (v!19223 V!49227)) (EmptyCell!15659) )
))
(declare-datatypes ((array!83201 0))(
  ( (array!83202 (arr!40137 (Array (_ BitVec 32) ValueCell!15659)) (size!40675 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83201)

(declare-fun mapValue!51121 () ValueCell!15659)

(declare-fun mapKey!51121 () (_ BitVec 32))

(declare-fun mapRest!51121 () (Array (_ BitVec 32) ValueCell!15659))

(assert (=> mapNonEmpty!51121 (= (arr!40137 _values!1134) (store mapRest!51121 mapKey!51121 mapValue!51121))))

(declare-fun mapIsEmpty!51121 () Bool)

(assert (=> mapIsEmpty!51121 mapRes!51121))

(declare-fun b!1272132 () Bool)

(declare-fun e!725562 () Bool)

(declare-fun tp_is_empty!33025 () Bool)

(assert (=> b!1272132 (= e!725562 tp_is_empty!33025)))

(declare-fun b!1272133 () Bool)

(declare-fun res!846269 () Bool)

(declare-fun e!725561 () Bool)

(assert (=> b!1272133 (=> (not res!846269) (not e!725561))))

(declare-datatypes ((array!83203 0))(
  ( (array!83204 (arr!40138 (Array (_ BitVec 32) (_ BitVec 64))) (size!40676 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83203)

(declare-datatypes ((List!28626 0))(
  ( (Nil!28623) (Cons!28622 (h!29831 (_ BitVec 64)) (t!42149 List!28626)) )
))
(declare-fun arrayNoDuplicates!0 (array!83203 (_ BitVec 32) List!28626) Bool)

(assert (=> b!1272133 (= res!846269 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28623))))

(declare-fun b!1272134 () Bool)

(declare-fun res!846271 () Bool)

(assert (=> b!1272134 (=> (not res!846271) (not e!725561))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1272134 (= res!846271 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40676 _keys!1364)) (bvsge from!1698 (size!40676 _keys!1364))))))

(declare-fun b!1272135 () Bool)

(assert (=> b!1272135 (= e!725560 tp_is_empty!33025)))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!49227)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!49227)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49227)

(declare-fun b!1272136 () Bool)

(declare-fun zeroValueBefore!52 () V!49227)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21448 0))(
  ( (tuple2!21449 (_1!10735 (_ BitVec 64)) (_2!10735 V!49227)) )
))
(declare-datatypes ((List!28627 0))(
  ( (Nil!28624) (Cons!28623 (h!29832 tuple2!21448) (t!42150 List!28627)) )
))
(declare-datatypes ((ListLongMap!19177 0))(
  ( (ListLongMap!19178 (toList!9604 List!28627)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5937 (array!83203 array!83201 (_ BitVec 32) (_ BitVec 32) V!49227 V!49227 (_ BitVec 32) Int) ListLongMap!19177)

(assert (=> b!1272136 (= e!725561 (not (= (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(declare-fun b!1272137 () Bool)

(declare-fun e!725563 () Bool)

(assert (=> b!1272137 (= e!725563 (and e!725562 mapRes!51121))))

(declare-fun condMapEmpty!51121 () Bool)

(declare-fun mapDefault!51121 () ValueCell!15659)

(assert (=> b!1272137 (= condMapEmpty!51121 (= (arr!40137 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15659)) mapDefault!51121)))))

(declare-fun b!1272139 () Bool)

(declare-fun res!846270 () Bool)

(assert (=> b!1272139 (=> (not res!846270) (not e!725561))))

(assert (=> b!1272139 (= res!846270 (and (= (size!40675 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40676 _keys!1364) (size!40675 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272138 () Bool)

(declare-fun res!846272 () Bool)

(assert (=> b!1272138 (=> (not res!846272) (not e!725561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83203 (_ BitVec 32)) Bool)

(assert (=> b!1272138 (= res!846272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846268 () Bool)

(assert (=> start!107350 (=> (not res!846268) (not e!725561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107350 (= res!846268 (validMask!0 mask!1730))))

(assert (=> start!107350 e!725561))

(declare-fun array_inv!30681 (array!83201) Bool)

(assert (=> start!107350 (and (array_inv!30681 _values!1134) e!725563)))

(assert (=> start!107350 true))

(declare-fun array_inv!30682 (array!83203) Bool)

(assert (=> start!107350 (array_inv!30682 _keys!1364)))

(assert (=> start!107350 tp_is_empty!33025))

(assert (=> start!107350 tp!97475))

(assert (= (and start!107350 res!846268) b!1272139))

(assert (= (and b!1272139 res!846270) b!1272138))

(assert (= (and b!1272138 res!846272) b!1272133))

(assert (= (and b!1272133 res!846269) b!1272134))

(assert (= (and b!1272134 res!846271) b!1272136))

(assert (= (and b!1272137 condMapEmpty!51121) mapIsEmpty!51121))

(assert (= (and b!1272137 (not condMapEmpty!51121)) mapNonEmpty!51121))

(get-info :version)

(assert (= (and mapNonEmpty!51121 ((_ is ValueCellFull!15659) mapValue!51121)) b!1272135))

(assert (= (and b!1272137 ((_ is ValueCellFull!15659) mapDefault!51121)) b!1272132))

(assert (= start!107350 b!1272137))

(declare-fun m!1169443 () Bool)

(assert (=> start!107350 m!1169443))

(declare-fun m!1169445 () Bool)

(assert (=> start!107350 m!1169445))

(declare-fun m!1169447 () Bool)

(assert (=> start!107350 m!1169447))

(declare-fun m!1169449 () Bool)

(assert (=> b!1272138 m!1169449))

(declare-fun m!1169451 () Bool)

(assert (=> b!1272133 m!1169451))

(declare-fun m!1169453 () Bool)

(assert (=> mapNonEmpty!51121 m!1169453))

(declare-fun m!1169455 () Bool)

(assert (=> b!1272136 m!1169455))

(declare-fun m!1169457 () Bool)

(assert (=> b!1272136 m!1169457))

(check-sat (not b!1272133) (not b!1272136) b_and!45685 (not start!107350) tp_is_empty!33025 (not b!1272138) (not mapNonEmpty!51121) (not b_next!27655))
(check-sat b_and!45685 (not b_next!27655))
(get-model)

(declare-fun b!1272196 () Bool)

(declare-fun e!725600 () Bool)

(declare-fun e!725602 () Bool)

(assert (=> b!1272196 (= e!725600 e!725602)))

(declare-fun lt!574838 () (_ BitVec 64))

(assert (=> b!1272196 (= lt!574838 (select (arr!40138 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42162 0))(
  ( (Unit!42163) )
))
(declare-fun lt!574837 () Unit!42162)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83203 (_ BitVec 64) (_ BitVec 32)) Unit!42162)

(assert (=> b!1272196 (= lt!574837 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574838 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272196 (arrayContainsKey!0 _keys!1364 lt!574838 #b00000000000000000000000000000000)))

(declare-fun lt!574836 () Unit!42162)

(assert (=> b!1272196 (= lt!574836 lt!574837)))

(declare-fun res!846307 () Bool)

(declare-datatypes ((SeekEntryResult!9987 0))(
  ( (MissingZero!9987 (index!42319 (_ BitVec 32))) (Found!9987 (index!42320 (_ BitVec 32))) (Intermediate!9987 (undefined!10799 Bool) (index!42321 (_ BitVec 32)) (x!112383 (_ BitVec 32))) (Undefined!9987) (MissingVacant!9987 (index!42322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83203 (_ BitVec 32)) SeekEntryResult!9987)

(assert (=> b!1272196 (= res!846307 (= (seekEntryOrOpen!0 (select (arr!40138 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9987 #b00000000000000000000000000000000)))))

(assert (=> b!1272196 (=> (not res!846307) (not e!725602))))

(declare-fun bm!62508 () Bool)

(declare-fun call!62511 () Bool)

(assert (=> bm!62508 (= call!62511 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1272197 () Bool)

(declare-fun e!725601 () Bool)

(assert (=> b!1272197 (= e!725601 e!725600)))

(declare-fun c!123649 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272197 (= c!123649 (validKeyInArray!0 (select (arr!40138 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun d!139717 () Bool)

(declare-fun res!846308 () Bool)

(assert (=> d!139717 (=> res!846308 e!725601)))

(assert (=> d!139717 (= res!846308 (bvsge #b00000000000000000000000000000000 (size!40676 _keys!1364)))))

(assert (=> d!139717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!725601)))

(declare-fun b!1272198 () Bool)

(assert (=> b!1272198 (= e!725600 call!62511)))

(declare-fun b!1272199 () Bool)

(assert (=> b!1272199 (= e!725602 call!62511)))

(assert (= (and d!139717 (not res!846308)) b!1272197))

(assert (= (and b!1272197 c!123649) b!1272196))

(assert (= (and b!1272197 (not c!123649)) b!1272198))

(assert (= (and b!1272196 res!846307) b!1272199))

(assert (= (or b!1272199 b!1272198) bm!62508))

(declare-fun m!1169491 () Bool)

(assert (=> b!1272196 m!1169491))

(declare-fun m!1169493 () Bool)

(assert (=> b!1272196 m!1169493))

(declare-fun m!1169495 () Bool)

(assert (=> b!1272196 m!1169495))

(assert (=> b!1272196 m!1169491))

(declare-fun m!1169497 () Bool)

(assert (=> b!1272196 m!1169497))

(declare-fun m!1169499 () Bool)

(assert (=> bm!62508 m!1169499))

(assert (=> b!1272197 m!1169491))

(assert (=> b!1272197 m!1169491))

(declare-fun m!1169501 () Bool)

(assert (=> b!1272197 m!1169501))

(assert (=> b!1272138 d!139717))

(declare-fun b!1272224 () Bool)

(declare-fun res!846317 () Bool)

(declare-fun e!725623 () Bool)

(assert (=> b!1272224 (=> (not res!846317) (not e!725623))))

(declare-fun lt!574857 () ListLongMap!19177)

(declare-fun contains!7635 (ListLongMap!19177 (_ BitVec 64)) Bool)

(assert (=> b!1272224 (= res!846317 (not (contains!7635 lt!574857 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272225 () Bool)

(declare-fun e!725622 () Bool)

(assert (=> b!1272225 (= e!725623 e!725622)))

(declare-fun c!123661 () Bool)

(declare-fun e!725618 () Bool)

(assert (=> b!1272225 (= c!123661 e!725618)))

(declare-fun res!846318 () Bool)

(assert (=> b!1272225 (=> (not res!846318) (not e!725618))))

(assert (=> b!1272225 (= res!846318 (bvslt from!1698 (size!40676 _keys!1364)))))

(declare-fun b!1272226 () Bool)

(declare-fun e!725620 () Bool)

(assert (=> b!1272226 (= e!725622 e!725620)))

(assert (=> b!1272226 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40676 _keys!1364)))))

(declare-fun res!846320 () Bool)

(assert (=> b!1272226 (= res!846320 (contains!7635 lt!574857 (select (arr!40138 _keys!1364) from!1698)))))

(assert (=> b!1272226 (=> (not res!846320) (not e!725620))))

(declare-fun b!1272228 () Bool)

(declare-fun e!725617 () ListLongMap!19177)

(assert (=> b!1272228 (= e!725617 (ListLongMap!19178 Nil!28624))))

(declare-fun bm!62511 () Bool)

(declare-fun call!62514 () ListLongMap!19177)

(assert (=> bm!62511 (= call!62514 (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272229 () Bool)

(declare-fun lt!574858 () Unit!42162)

(declare-fun lt!574855 () Unit!42162)

(assert (=> b!1272229 (= lt!574858 lt!574855)))

(declare-fun lt!574856 () (_ BitVec 64))

(declare-fun lt!574853 () ListLongMap!19177)

(declare-fun lt!574859 () (_ BitVec 64))

(declare-fun lt!574854 () V!49227)

(declare-fun +!4307 (ListLongMap!19177 tuple2!21448) ListLongMap!19177)

(assert (=> b!1272229 (not (contains!7635 (+!4307 lt!574853 (tuple2!21449 lt!574859 lt!574854)) lt!574856))))

(declare-fun addStillNotContains!335 (ListLongMap!19177 (_ BitVec 64) V!49227 (_ BitVec 64)) Unit!42162)

(assert (=> b!1272229 (= lt!574855 (addStillNotContains!335 lt!574853 lt!574859 lt!574854 lt!574856))))

(assert (=> b!1272229 (= lt!574856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20508 (ValueCell!15659 V!49227) V!49227)

(declare-fun dynLambda!3429 (Int (_ BitVec 64)) V!49227)

(assert (=> b!1272229 (= lt!574854 (get!20508 (select (arr!40137 _values!1134) from!1698) (dynLambda!3429 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272229 (= lt!574859 (select (arr!40138 _keys!1364) from!1698))))

(assert (=> b!1272229 (= lt!574853 call!62514)))

(declare-fun e!725619 () ListLongMap!19177)

(assert (=> b!1272229 (= e!725619 (+!4307 call!62514 (tuple2!21449 (select (arr!40138 _keys!1364) from!1698) (get!20508 (select (arr!40137 _values!1134) from!1698) (dynLambda!3429 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272230 () Bool)

(assert (=> b!1272230 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40676 _keys!1364)))))

(assert (=> b!1272230 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40675 _values!1134)))))

(declare-fun apply!999 (ListLongMap!19177 (_ BitVec 64)) V!49227)

(assert (=> b!1272230 (= e!725620 (= (apply!999 lt!574857 (select (arr!40138 _keys!1364) from!1698)) (get!20508 (select (arr!40137 _values!1134) from!1698) (dynLambda!3429 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272231 () Bool)

(declare-fun e!725621 () Bool)

(declare-fun isEmpty!1054 (ListLongMap!19177) Bool)

(assert (=> b!1272231 (= e!725621 (isEmpty!1054 lt!574857))))

(declare-fun b!1272227 () Bool)

(assert (=> b!1272227 (= e!725617 e!725619)))

(declare-fun c!123658 () Bool)

(assert (=> b!1272227 (= c!123658 (validKeyInArray!0 (select (arr!40138 _keys!1364) from!1698)))))

(declare-fun d!139719 () Bool)

(assert (=> d!139719 e!725623))

(declare-fun res!846319 () Bool)

(assert (=> d!139719 (=> (not res!846319) (not e!725623))))

(assert (=> d!139719 (= res!846319 (not (contains!7635 lt!574857 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139719 (= lt!574857 e!725617)))

(declare-fun c!123660 () Bool)

(assert (=> d!139719 (= c!123660 (bvsge from!1698 (size!40676 _keys!1364)))))

(assert (=> d!139719 (validMask!0 mask!1730)))

(assert (=> d!139719 (= (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) lt!574857)))

(declare-fun b!1272232 () Bool)

(assert (=> b!1272232 (= e!725619 call!62514)))

(declare-fun b!1272233 () Bool)

(assert (=> b!1272233 (= e!725621 (= lt!574857 (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272234 () Bool)

(assert (=> b!1272234 (= e!725622 e!725621)))

(declare-fun c!123659 () Bool)

(assert (=> b!1272234 (= c!123659 (bvslt from!1698 (size!40676 _keys!1364)))))

(declare-fun b!1272235 () Bool)

(assert (=> b!1272235 (= e!725618 (validKeyInArray!0 (select (arr!40138 _keys!1364) from!1698)))))

(assert (=> b!1272235 (bvsge from!1698 #b00000000000000000000000000000000)))

(assert (= (and d!139719 c!123660) b!1272228))

(assert (= (and d!139719 (not c!123660)) b!1272227))

(assert (= (and b!1272227 c!123658) b!1272229))

(assert (= (and b!1272227 (not c!123658)) b!1272232))

(assert (= (or b!1272229 b!1272232) bm!62511))

(assert (= (and d!139719 res!846319) b!1272224))

(assert (= (and b!1272224 res!846317) b!1272225))

(assert (= (and b!1272225 res!846318) b!1272235))

(assert (= (and b!1272225 c!123661) b!1272226))

(assert (= (and b!1272225 (not c!123661)) b!1272234))

(assert (= (and b!1272226 res!846320) b!1272230))

(assert (= (and b!1272234 c!123659) b!1272233))

(assert (= (and b!1272234 (not c!123659)) b!1272231))

(declare-fun b_lambda!23061 () Bool)

(assert (=> (not b_lambda!23061) (not b!1272229)))

(declare-fun t!42154 () Bool)

(declare-fun tb!11331 () Bool)

(assert (=> (and start!107350 (= defaultEntry!1142 defaultEntry!1142) t!42154) tb!11331))

(declare-fun result!23547 () Bool)

(assert (=> tb!11331 (= result!23547 tp_is_empty!33025)))

(assert (=> b!1272229 t!42154))

(declare-fun b_and!45691 () Bool)

(assert (= b_and!45685 (and (=> t!42154 result!23547) b_and!45691)))

(declare-fun b_lambda!23063 () Bool)

(assert (=> (not b_lambda!23063) (not b!1272230)))

(assert (=> b!1272230 t!42154))

(declare-fun b_and!45693 () Bool)

(assert (= b_and!45691 (and (=> t!42154 result!23547) b_and!45693)))

(declare-fun m!1169503 () Bool)

(assert (=> b!1272227 m!1169503))

(assert (=> b!1272227 m!1169503))

(declare-fun m!1169505 () Bool)

(assert (=> b!1272227 m!1169505))

(declare-fun m!1169507 () Bool)

(assert (=> b!1272233 m!1169507))

(assert (=> b!1272226 m!1169503))

(assert (=> b!1272226 m!1169503))

(declare-fun m!1169509 () Bool)

(assert (=> b!1272226 m!1169509))

(assert (=> bm!62511 m!1169507))

(declare-fun m!1169511 () Bool)

(assert (=> b!1272224 m!1169511))

(declare-fun m!1169513 () Bool)

(assert (=> b!1272231 m!1169513))

(declare-fun m!1169515 () Bool)

(assert (=> d!139719 m!1169515))

(assert (=> d!139719 m!1169443))

(declare-fun m!1169517 () Bool)

(assert (=> b!1272229 m!1169517))

(assert (=> b!1272229 m!1169503))

(declare-fun m!1169519 () Bool)

(assert (=> b!1272229 m!1169519))

(declare-fun m!1169521 () Bool)

(assert (=> b!1272229 m!1169521))

(declare-fun m!1169523 () Bool)

(assert (=> b!1272229 m!1169523))

(assert (=> b!1272229 m!1169521))

(declare-fun m!1169525 () Bool)

(assert (=> b!1272229 m!1169525))

(declare-fun m!1169527 () Bool)

(assert (=> b!1272229 m!1169527))

(assert (=> b!1272229 m!1169523))

(assert (=> b!1272229 m!1169527))

(declare-fun m!1169529 () Bool)

(assert (=> b!1272229 m!1169529))

(assert (=> b!1272230 m!1169503))

(assert (=> b!1272230 m!1169521))

(assert (=> b!1272230 m!1169523))

(assert (=> b!1272230 m!1169521))

(assert (=> b!1272230 m!1169525))

(assert (=> b!1272230 m!1169523))

(assert (=> b!1272230 m!1169503))

(declare-fun m!1169531 () Bool)

(assert (=> b!1272230 m!1169531))

(assert (=> b!1272235 m!1169503))

(assert (=> b!1272235 m!1169503))

(assert (=> b!1272235 m!1169505))

(assert (=> b!1272136 d!139719))

(declare-fun b!1272238 () Bool)

(declare-fun res!846321 () Bool)

(declare-fun e!725630 () Bool)

(assert (=> b!1272238 (=> (not res!846321) (not e!725630))))

(declare-fun lt!574864 () ListLongMap!19177)

(assert (=> b!1272238 (= res!846321 (not (contains!7635 lt!574864 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272239 () Bool)

(declare-fun e!725629 () Bool)

(assert (=> b!1272239 (= e!725630 e!725629)))

(declare-fun c!123665 () Bool)

(declare-fun e!725625 () Bool)

(assert (=> b!1272239 (= c!123665 e!725625)))

(declare-fun res!846322 () Bool)

(assert (=> b!1272239 (=> (not res!846322) (not e!725625))))

(assert (=> b!1272239 (= res!846322 (bvslt from!1698 (size!40676 _keys!1364)))))

(declare-fun b!1272240 () Bool)

(declare-fun e!725627 () Bool)

(assert (=> b!1272240 (= e!725629 e!725627)))

(assert (=> b!1272240 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40676 _keys!1364)))))

(declare-fun res!846324 () Bool)

(assert (=> b!1272240 (= res!846324 (contains!7635 lt!574864 (select (arr!40138 _keys!1364) from!1698)))))

(assert (=> b!1272240 (=> (not res!846324) (not e!725627))))

(declare-fun b!1272242 () Bool)

(declare-fun e!725624 () ListLongMap!19177)

(assert (=> b!1272242 (= e!725624 (ListLongMap!19178 Nil!28624))))

(declare-fun bm!62512 () Bool)

(declare-fun call!62515 () ListLongMap!19177)

(assert (=> bm!62512 (= call!62515 (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272243 () Bool)

(declare-fun lt!574865 () Unit!42162)

(declare-fun lt!574862 () Unit!42162)

(assert (=> b!1272243 (= lt!574865 lt!574862)))

(declare-fun lt!574861 () V!49227)

(declare-fun lt!574866 () (_ BitVec 64))

(declare-fun lt!574863 () (_ BitVec 64))

(declare-fun lt!574860 () ListLongMap!19177)

(assert (=> b!1272243 (not (contains!7635 (+!4307 lt!574860 (tuple2!21449 lt!574866 lt!574861)) lt!574863))))

(assert (=> b!1272243 (= lt!574862 (addStillNotContains!335 lt!574860 lt!574866 lt!574861 lt!574863))))

(assert (=> b!1272243 (= lt!574863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272243 (= lt!574861 (get!20508 (select (arr!40137 _values!1134) from!1698) (dynLambda!3429 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272243 (= lt!574866 (select (arr!40138 _keys!1364) from!1698))))

(assert (=> b!1272243 (= lt!574860 call!62515)))

(declare-fun e!725626 () ListLongMap!19177)

(assert (=> b!1272243 (= e!725626 (+!4307 call!62515 (tuple2!21449 (select (arr!40138 _keys!1364) from!1698) (get!20508 (select (arr!40137 _values!1134) from!1698) (dynLambda!3429 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272244 () Bool)

(assert (=> b!1272244 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40676 _keys!1364)))))

(assert (=> b!1272244 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40675 _values!1134)))))

(assert (=> b!1272244 (= e!725627 (= (apply!999 lt!574864 (select (arr!40138 _keys!1364) from!1698)) (get!20508 (select (arr!40137 _values!1134) from!1698) (dynLambda!3429 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272245 () Bool)

(declare-fun e!725628 () Bool)

(assert (=> b!1272245 (= e!725628 (isEmpty!1054 lt!574864))))

(declare-fun b!1272241 () Bool)

(assert (=> b!1272241 (= e!725624 e!725626)))

(declare-fun c!123662 () Bool)

(assert (=> b!1272241 (= c!123662 (validKeyInArray!0 (select (arr!40138 _keys!1364) from!1698)))))

(declare-fun d!139721 () Bool)

(assert (=> d!139721 e!725630))

(declare-fun res!846323 () Bool)

(assert (=> d!139721 (=> (not res!846323) (not e!725630))))

(assert (=> d!139721 (= res!846323 (not (contains!7635 lt!574864 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139721 (= lt!574864 e!725624)))

(declare-fun c!123664 () Bool)

(assert (=> d!139721 (= c!123664 (bvsge from!1698 (size!40676 _keys!1364)))))

(assert (=> d!139721 (validMask!0 mask!1730)))

(assert (=> d!139721 (= (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142) lt!574864)))

(declare-fun b!1272246 () Bool)

(assert (=> b!1272246 (= e!725626 call!62515)))

(declare-fun b!1272247 () Bool)

(assert (=> b!1272247 (= e!725628 (= lt!574864 (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272248 () Bool)

(assert (=> b!1272248 (= e!725629 e!725628)))

(declare-fun c!123663 () Bool)

(assert (=> b!1272248 (= c!123663 (bvslt from!1698 (size!40676 _keys!1364)))))

(declare-fun b!1272249 () Bool)

(assert (=> b!1272249 (= e!725625 (validKeyInArray!0 (select (arr!40138 _keys!1364) from!1698)))))

(assert (=> b!1272249 (bvsge from!1698 #b00000000000000000000000000000000)))

(assert (= (and d!139721 c!123664) b!1272242))

(assert (= (and d!139721 (not c!123664)) b!1272241))

(assert (= (and b!1272241 c!123662) b!1272243))

(assert (= (and b!1272241 (not c!123662)) b!1272246))

(assert (= (or b!1272243 b!1272246) bm!62512))

(assert (= (and d!139721 res!846323) b!1272238))

(assert (= (and b!1272238 res!846321) b!1272239))

(assert (= (and b!1272239 res!846322) b!1272249))

(assert (= (and b!1272239 c!123665) b!1272240))

(assert (= (and b!1272239 (not c!123665)) b!1272248))

(assert (= (and b!1272240 res!846324) b!1272244))

(assert (= (and b!1272248 c!123663) b!1272247))

(assert (= (and b!1272248 (not c!123663)) b!1272245))

(declare-fun b_lambda!23065 () Bool)

(assert (=> (not b_lambda!23065) (not b!1272243)))

(assert (=> b!1272243 t!42154))

(declare-fun b_and!45695 () Bool)

(assert (= b_and!45693 (and (=> t!42154 result!23547) b_and!45695)))

(declare-fun b_lambda!23067 () Bool)

(assert (=> (not b_lambda!23067) (not b!1272244)))

(assert (=> b!1272244 t!42154))

(declare-fun b_and!45697 () Bool)

(assert (= b_and!45695 (and (=> t!42154 result!23547) b_and!45697)))

(assert (=> b!1272241 m!1169503))

(assert (=> b!1272241 m!1169503))

(assert (=> b!1272241 m!1169505))

(declare-fun m!1169533 () Bool)

(assert (=> b!1272247 m!1169533))

(assert (=> b!1272240 m!1169503))

(assert (=> b!1272240 m!1169503))

(declare-fun m!1169535 () Bool)

(assert (=> b!1272240 m!1169535))

(assert (=> bm!62512 m!1169533))

(declare-fun m!1169537 () Bool)

(assert (=> b!1272238 m!1169537))

(declare-fun m!1169539 () Bool)

(assert (=> b!1272245 m!1169539))

(declare-fun m!1169541 () Bool)

(assert (=> d!139721 m!1169541))

(assert (=> d!139721 m!1169443))

(declare-fun m!1169543 () Bool)

(assert (=> b!1272243 m!1169543))

(assert (=> b!1272243 m!1169503))

(declare-fun m!1169545 () Bool)

(assert (=> b!1272243 m!1169545))

(assert (=> b!1272243 m!1169521))

(assert (=> b!1272243 m!1169523))

(assert (=> b!1272243 m!1169521))

(assert (=> b!1272243 m!1169525))

(declare-fun m!1169547 () Bool)

(assert (=> b!1272243 m!1169547))

(assert (=> b!1272243 m!1169523))

(assert (=> b!1272243 m!1169547))

(declare-fun m!1169549 () Bool)

(assert (=> b!1272243 m!1169549))

(assert (=> b!1272244 m!1169503))

(assert (=> b!1272244 m!1169521))

(assert (=> b!1272244 m!1169523))

(assert (=> b!1272244 m!1169521))

(assert (=> b!1272244 m!1169525))

(assert (=> b!1272244 m!1169523))

(assert (=> b!1272244 m!1169503))

(declare-fun m!1169551 () Bool)

(assert (=> b!1272244 m!1169551))

(assert (=> b!1272249 m!1169503))

(assert (=> b!1272249 m!1169503))

(assert (=> b!1272249 m!1169505))

(assert (=> b!1272136 d!139721))

(declare-fun d!139723 () Bool)

(assert (=> d!139723 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107350 d!139723))

(declare-fun d!139725 () Bool)

(assert (=> d!139725 (= (array_inv!30681 _values!1134) (bvsge (size!40675 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107350 d!139725))

(declare-fun d!139727 () Bool)

(assert (=> d!139727 (= (array_inv!30682 _keys!1364) (bvsge (size!40676 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107350 d!139727))

(declare-fun b!1272260 () Bool)

(declare-fun e!725640 () Bool)

(declare-fun e!725639 () Bool)

(assert (=> b!1272260 (= e!725640 e!725639)))

(declare-fun c!123668 () Bool)

(assert (=> b!1272260 (= c!123668 (validKeyInArray!0 (select (arr!40138 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272261 () Bool)

(declare-fun e!725641 () Bool)

(assert (=> b!1272261 (= e!725641 e!725640)))

(declare-fun res!846331 () Bool)

(assert (=> b!1272261 (=> (not res!846331) (not e!725640))))

(declare-fun e!725642 () Bool)

(assert (=> b!1272261 (= res!846331 (not e!725642))))

(declare-fun res!846333 () Bool)

(assert (=> b!1272261 (=> (not res!846333) (not e!725642))))

(assert (=> b!1272261 (= res!846333 (validKeyInArray!0 (select (arr!40138 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272262 () Bool)

(declare-fun call!62518 () Bool)

(assert (=> b!1272262 (= e!725639 call!62518)))

(declare-fun bm!62515 () Bool)

(assert (=> bm!62515 (= call!62518 (arrayNoDuplicates!0 _keys!1364 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123668 (Cons!28622 (select (arr!40138 _keys!1364) #b00000000000000000000000000000000) Nil!28623) Nil!28623)))))

(declare-fun b!1272264 () Bool)

(declare-fun contains!7636 (List!28626 (_ BitVec 64)) Bool)

(assert (=> b!1272264 (= e!725642 (contains!7636 Nil!28623 (select (arr!40138 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun d!139729 () Bool)

(declare-fun res!846332 () Bool)

(assert (=> d!139729 (=> res!846332 e!725641)))

(assert (=> d!139729 (= res!846332 (bvsge #b00000000000000000000000000000000 (size!40676 _keys!1364)))))

(assert (=> d!139729 (= (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28623) e!725641)))

(declare-fun b!1272263 () Bool)

(assert (=> b!1272263 (= e!725639 call!62518)))

(assert (= (and d!139729 (not res!846332)) b!1272261))

(assert (= (and b!1272261 res!846333) b!1272264))

(assert (= (and b!1272261 res!846331) b!1272260))

(assert (= (and b!1272260 c!123668) b!1272262))

(assert (= (and b!1272260 (not c!123668)) b!1272263))

(assert (= (or b!1272262 b!1272263) bm!62515))

(assert (=> b!1272260 m!1169491))

(assert (=> b!1272260 m!1169491))

(assert (=> b!1272260 m!1169501))

(assert (=> b!1272261 m!1169491))

(assert (=> b!1272261 m!1169491))

(assert (=> b!1272261 m!1169501))

(assert (=> bm!62515 m!1169491))

(declare-fun m!1169553 () Bool)

(assert (=> bm!62515 m!1169553))

(assert (=> b!1272264 m!1169491))

(assert (=> b!1272264 m!1169491))

(declare-fun m!1169555 () Bool)

(assert (=> b!1272264 m!1169555))

(assert (=> b!1272133 d!139729))

(declare-fun mapIsEmpty!51130 () Bool)

(declare-fun mapRes!51130 () Bool)

(assert (=> mapIsEmpty!51130 mapRes!51130))

(declare-fun b!1272272 () Bool)

(declare-fun e!725648 () Bool)

(assert (=> b!1272272 (= e!725648 tp_is_empty!33025)))

(declare-fun condMapEmpty!51130 () Bool)

(declare-fun mapDefault!51130 () ValueCell!15659)

(assert (=> mapNonEmpty!51121 (= condMapEmpty!51130 (= mapRest!51121 ((as const (Array (_ BitVec 32) ValueCell!15659)) mapDefault!51130)))))

(assert (=> mapNonEmpty!51121 (= tp!97474 (and e!725648 mapRes!51130))))

(declare-fun b!1272271 () Bool)

(declare-fun e!725647 () Bool)

(assert (=> b!1272271 (= e!725647 tp_is_empty!33025)))

(declare-fun mapNonEmpty!51130 () Bool)

(declare-fun tp!97490 () Bool)

(assert (=> mapNonEmpty!51130 (= mapRes!51130 (and tp!97490 e!725647))))

(declare-fun mapRest!51130 () (Array (_ BitVec 32) ValueCell!15659))

(declare-fun mapKey!51130 () (_ BitVec 32))

(declare-fun mapValue!51130 () ValueCell!15659)

(assert (=> mapNonEmpty!51130 (= mapRest!51121 (store mapRest!51130 mapKey!51130 mapValue!51130))))

(assert (= (and mapNonEmpty!51121 condMapEmpty!51130) mapIsEmpty!51130))

(assert (= (and mapNonEmpty!51121 (not condMapEmpty!51130)) mapNonEmpty!51130))

(assert (= (and mapNonEmpty!51130 ((_ is ValueCellFull!15659) mapValue!51130)) b!1272271))

(assert (= (and mapNonEmpty!51121 ((_ is ValueCellFull!15659) mapDefault!51130)) b!1272272))

(declare-fun m!1169557 () Bool)

(assert (=> mapNonEmpty!51130 m!1169557))

(declare-fun b_lambda!23069 () Bool)

(assert (= b_lambda!23067 (or (and start!107350 b_free!27655) b_lambda!23069)))

(declare-fun b_lambda!23071 () Bool)

(assert (= b_lambda!23061 (or (and start!107350 b_free!27655) b_lambda!23071)))

(declare-fun b_lambda!23073 () Bool)

(assert (= b_lambda!23063 (or (and start!107350 b_free!27655) b_lambda!23073)))

(declare-fun b_lambda!23075 () Bool)

(assert (= b_lambda!23065 (or (and start!107350 b_free!27655) b_lambda!23075)))

(check-sat (not b_next!27655) (not b!1272261) (not b!1272235) (not b!1272230) (not b!1272241) (not b!1272245) (not b!1272240) (not b_lambda!23071) (not b_lambda!23075) (not b!1272238) (not b!1272197) (not b_lambda!23073) (not bm!62511) (not b!1272233) (not b!1272196) (not mapNonEmpty!51130) (not bm!62512) (not b!1272227) (not b!1272247) (not b!1272229) (not b_lambda!23069) (not d!139719) (not bm!62515) (not b!1272226) b_and!45697 tp_is_empty!33025 (not b!1272244) (not b!1272224) (not b!1272231) (not b!1272264) (not bm!62508) (not b!1272249) (not b!1272260) (not d!139721) (not b!1272243))
(check-sat b_and!45697 (not b_next!27655))
