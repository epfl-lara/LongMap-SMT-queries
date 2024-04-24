; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134500 () Bool)

(assert start!134500)

(declare-fun b_free!32215 () Bool)

(declare-fun b_next!32215 () Bool)

(assert (=> start!134500 (= b_free!32215 (not b_next!32215))))

(declare-fun tp!113964 () Bool)

(declare-fun b_and!51861 () Bool)

(assert (=> start!134500 (= tp!113964 b_and!51861)))

(declare-fun b!1569621 () Bool)

(declare-fun e!875098 () Bool)

(declare-datatypes ((array!104800 0))(
  ( (array!104801 (arr!50578 (Array (_ BitVec 32) (_ BitVec 64))) (size!51129 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104800)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1569621 (= e!875098 (bvsge (bvsub (size!51129 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51129 _keys!637)) from!782)))))

(declare-fun b!1569622 () Bool)

(declare-fun e!875095 () Bool)

(declare-fun tp_is_empty!38995 () Bool)

(assert (=> b!1569622 (= e!875095 tp_is_empty!38995)))

(declare-fun b!1569623 () Bool)

(declare-fun e!875097 () Bool)

(assert (=> b!1569623 (= e!875097 tp_is_empty!38995)))

(declare-fun b!1569624 () Bool)

(declare-fun res!1071972 () Bool)

(declare-fun e!875096 () Bool)

(assert (=> b!1569624 (=> (not res!1071972) (not e!875096))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60201 0))(
  ( (V!60202 (val!19581 Int)) )
))
(declare-datatypes ((ValueCell!18467 0))(
  ( (ValueCellFull!18467 (v!22332 V!60201)) (EmptyCell!18467) )
))
(declare-datatypes ((array!104802 0))(
  ( (array!104803 (arr!50579 (Array (_ BitVec 32) ValueCell!18467)) (size!51130 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104802)

(assert (=> b!1569624 (= res!1071972 (and (= (size!51130 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51129 _keys!637) (size!51130 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1569625 () Bool)

(declare-fun res!1071967 () Bool)

(assert (=> b!1569625 (=> (not res!1071967) (not e!875096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104800 (_ BitVec 32)) Bool)

(assert (=> b!1569625 (= res!1071967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1569626 () Bool)

(declare-fun res!1071969 () Bool)

(assert (=> b!1569626 (=> (not res!1071969) (not e!875098))))

(declare-datatypes ((tuple2!25324 0))(
  ( (tuple2!25325 (_1!12673 (_ BitVec 64)) (_2!12673 V!60201)) )
))
(declare-datatypes ((List!36685 0))(
  ( (Nil!36682) (Cons!36681 (h!38146 tuple2!25324) (t!51581 List!36685)) )
))
(declare-datatypes ((ListLongMap!22767 0))(
  ( (ListLongMap!22768 (toList!11399 List!36685)) )
))
(declare-fun lt!673786 () ListLongMap!22767)

(declare-fun contains!10404 (ListLongMap!22767 (_ BitVec 64)) Bool)

(assert (=> b!1569626 (= res!1071969 (not (contains!10404 lt!673786 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!59892 () Bool)

(declare-fun mapRes!59892 () Bool)

(declare-fun tp!113963 () Bool)

(assert (=> mapNonEmpty!59892 (= mapRes!59892 (and tp!113963 e!875097))))

(declare-fun mapRest!59892 () (Array (_ BitVec 32) ValueCell!18467))

(declare-fun mapValue!59892 () ValueCell!18467)

(declare-fun mapKey!59892 () (_ BitVec 32))

(assert (=> mapNonEmpty!59892 (= (arr!50579 _values!487) (store mapRest!59892 mapKey!59892 mapValue!59892))))

(declare-fun mapIsEmpty!59892 () Bool)

(assert (=> mapIsEmpty!59892 mapRes!59892))

(declare-fun b!1569627 () Bool)

(declare-fun res!1071971 () Bool)

(assert (=> b!1569627 (=> (not res!1071971) (not e!875096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1569627 (= res!1071971 (not (validKeyInArray!0 (select (arr!50578 _keys!637) from!782))))))

(declare-fun b!1569628 () Bool)

(declare-fun res!1071966 () Bool)

(assert (=> b!1569628 (=> (not res!1071966) (not e!875096))))

(assert (=> b!1569628 (= res!1071966 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51129 _keys!637)) (bvslt from!782 (size!51129 _keys!637))))))

(declare-fun b!1569630 () Bool)

(declare-fun e!875094 () Bool)

(assert (=> b!1569630 (= e!875094 (and e!875095 mapRes!59892))))

(declare-fun condMapEmpty!59892 () Bool)

(declare-fun mapDefault!59892 () ValueCell!18467)

(assert (=> b!1569630 (= condMapEmpty!59892 (= (arr!50579 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18467)) mapDefault!59892)))))

(declare-fun b!1569631 () Bool)

(assert (=> b!1569631 (= e!875096 e!875098)))

(declare-fun res!1071965 () Bool)

(assert (=> b!1569631 (=> (not res!1071965) (not e!875098))))

(assert (=> b!1569631 (= res!1071965 (not (contains!10404 lt!673786 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60201)

(declare-fun minValue!453 () V!60201)

(declare-fun getCurrentListMapNoExtraKeys!6778 (array!104800 array!104802 (_ BitVec 32) (_ BitVec 32) V!60201 V!60201 (_ BitVec 32) Int) ListLongMap!22767)

(assert (=> b!1569631 (= lt!673786 (getCurrentListMapNoExtraKeys!6778 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1071970 () Bool)

(assert (=> start!134500 (=> (not res!1071970) (not e!875096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134500 (= res!1071970 (validMask!0 mask!947))))

(assert (=> start!134500 e!875096))

(assert (=> start!134500 tp!113964))

(assert (=> start!134500 tp_is_empty!38995))

(assert (=> start!134500 true))

(declare-fun array_inv!39535 (array!104800) Bool)

(assert (=> start!134500 (array_inv!39535 _keys!637)))

(declare-fun array_inv!39536 (array!104802) Bool)

(assert (=> start!134500 (and (array_inv!39536 _values!487) e!875094)))

(declare-fun b!1569629 () Bool)

(declare-fun res!1071968 () Bool)

(assert (=> b!1569629 (=> (not res!1071968) (not e!875096))))

(declare-datatypes ((List!36686 0))(
  ( (Nil!36683) (Cons!36682 (h!38147 (_ BitVec 64)) (t!51582 List!36686)) )
))
(declare-fun arrayNoDuplicates!0 (array!104800 (_ BitVec 32) List!36686) Bool)

(assert (=> b!1569629 (= res!1071968 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36683))))

(assert (= (and start!134500 res!1071970) b!1569624))

(assert (= (and b!1569624 res!1071972) b!1569625))

(assert (= (and b!1569625 res!1071967) b!1569629))

(assert (= (and b!1569629 res!1071968) b!1569628))

(assert (= (and b!1569628 res!1071966) b!1569627))

(assert (= (and b!1569627 res!1071971) b!1569631))

(assert (= (and b!1569631 res!1071965) b!1569626))

(assert (= (and b!1569626 res!1071969) b!1569621))

(assert (= (and b!1569630 condMapEmpty!59892) mapIsEmpty!59892))

(assert (= (and b!1569630 (not condMapEmpty!59892)) mapNonEmpty!59892))

(get-info :version)

(assert (= (and mapNonEmpty!59892 ((_ is ValueCellFull!18467) mapValue!59892)) b!1569623))

(assert (= (and b!1569630 ((_ is ValueCellFull!18467) mapDefault!59892)) b!1569622))

(assert (= start!134500 b!1569630))

(declare-fun m!1444369 () Bool)

(assert (=> b!1569625 m!1444369))

(declare-fun m!1444371 () Bool)

(assert (=> b!1569631 m!1444371))

(declare-fun m!1444373 () Bool)

(assert (=> b!1569631 m!1444373))

(declare-fun m!1444375 () Bool)

(assert (=> start!134500 m!1444375))

(declare-fun m!1444377 () Bool)

(assert (=> start!134500 m!1444377))

(declare-fun m!1444379 () Bool)

(assert (=> start!134500 m!1444379))

(declare-fun m!1444381 () Bool)

(assert (=> b!1569627 m!1444381))

(assert (=> b!1569627 m!1444381))

(declare-fun m!1444383 () Bool)

(assert (=> b!1569627 m!1444383))

(declare-fun m!1444385 () Bool)

(assert (=> mapNonEmpty!59892 m!1444385))

(declare-fun m!1444387 () Bool)

(assert (=> b!1569626 m!1444387))

(declare-fun m!1444389 () Bool)

(assert (=> b!1569629 m!1444389))

(check-sat (not b_next!32215) (not start!134500) (not b!1569627) (not mapNonEmpty!59892) (not b!1569625) b_and!51861 (not b!1569631) (not b!1569629) tp_is_empty!38995 (not b!1569626))
(check-sat b_and!51861 (not b_next!32215))
(get-model)

(declare-fun d!164249 () Bool)

(declare-fun e!875139 () Bool)

(assert (=> d!164249 e!875139))

(declare-fun res!1072023 () Bool)

(assert (=> d!164249 (=> res!1072023 e!875139)))

(declare-fun lt!673801 () Bool)

(assert (=> d!164249 (= res!1072023 (not lt!673801))))

(declare-fun lt!673802 () Bool)

(assert (=> d!164249 (= lt!673801 lt!673802)))

(declare-datatypes ((Unit!51964 0))(
  ( (Unit!51965) )
))
(declare-fun lt!673803 () Unit!51964)

(declare-fun e!875140 () Unit!51964)

(assert (=> d!164249 (= lt!673803 e!875140)))

(declare-fun c!145266 () Bool)

(assert (=> d!164249 (= c!145266 lt!673802)))

(declare-fun containsKey!852 (List!36685 (_ BitVec 64)) Bool)

(assert (=> d!164249 (= lt!673802 (containsKey!852 (toList!11399 lt!673786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164249 (= (contains!10404 lt!673786 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673801)))

(declare-fun b!1569704 () Bool)

(declare-fun lt!673804 () Unit!51964)

(assert (=> b!1569704 (= e!875140 lt!673804)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!535 (List!36685 (_ BitVec 64)) Unit!51964)

(assert (=> b!1569704 (= lt!673804 (lemmaContainsKeyImpliesGetValueByKeyDefined!535 (toList!11399 lt!673786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!865 0))(
  ( (Some!864 (v!22335 V!60201)) (None!863) )
))
(declare-fun isDefined!581 (Option!865) Bool)

(declare-fun getValueByKey!790 (List!36685 (_ BitVec 64)) Option!865)

(assert (=> b!1569704 (isDefined!581 (getValueByKey!790 (toList!11399 lt!673786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569705 () Bool)

(declare-fun Unit!51966 () Unit!51964)

(assert (=> b!1569705 (= e!875140 Unit!51966)))

(declare-fun b!1569706 () Bool)

(assert (=> b!1569706 (= e!875139 (isDefined!581 (getValueByKey!790 (toList!11399 lt!673786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164249 c!145266) b!1569704))

(assert (= (and d!164249 (not c!145266)) b!1569705))

(assert (= (and d!164249 (not res!1072023)) b!1569706))

(declare-fun m!1444435 () Bool)

(assert (=> d!164249 m!1444435))

(declare-fun m!1444437 () Bool)

(assert (=> b!1569704 m!1444437))

(declare-fun m!1444439 () Bool)

(assert (=> b!1569704 m!1444439))

(assert (=> b!1569704 m!1444439))

(declare-fun m!1444441 () Bool)

(assert (=> b!1569704 m!1444441))

(assert (=> b!1569706 m!1444439))

(assert (=> b!1569706 m!1444439))

(assert (=> b!1569706 m!1444441))

(assert (=> b!1569626 d!164249))

(declare-fun d!164251 () Bool)

(declare-fun e!875141 () Bool)

(assert (=> d!164251 e!875141))

(declare-fun res!1072024 () Bool)

(assert (=> d!164251 (=> res!1072024 e!875141)))

(declare-fun lt!673805 () Bool)

(assert (=> d!164251 (= res!1072024 (not lt!673805))))

(declare-fun lt!673806 () Bool)

(assert (=> d!164251 (= lt!673805 lt!673806)))

(declare-fun lt!673807 () Unit!51964)

(declare-fun e!875142 () Unit!51964)

(assert (=> d!164251 (= lt!673807 e!875142)))

(declare-fun c!145267 () Bool)

(assert (=> d!164251 (= c!145267 lt!673806)))

(assert (=> d!164251 (= lt!673806 (containsKey!852 (toList!11399 lt!673786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164251 (= (contains!10404 lt!673786 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673805)))

(declare-fun b!1569707 () Bool)

(declare-fun lt!673808 () Unit!51964)

(assert (=> b!1569707 (= e!875142 lt!673808)))

(assert (=> b!1569707 (= lt!673808 (lemmaContainsKeyImpliesGetValueByKeyDefined!535 (toList!11399 lt!673786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1569707 (isDefined!581 (getValueByKey!790 (toList!11399 lt!673786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569708 () Bool)

(declare-fun Unit!51967 () Unit!51964)

(assert (=> b!1569708 (= e!875142 Unit!51967)))

(declare-fun b!1569709 () Bool)

(assert (=> b!1569709 (= e!875141 (isDefined!581 (getValueByKey!790 (toList!11399 lt!673786) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164251 c!145267) b!1569707))

(assert (= (and d!164251 (not c!145267)) b!1569708))

(assert (= (and d!164251 (not res!1072024)) b!1569709))

(declare-fun m!1444443 () Bool)

(assert (=> d!164251 m!1444443))

(declare-fun m!1444445 () Bool)

(assert (=> b!1569707 m!1444445))

(declare-fun m!1444447 () Bool)

(assert (=> b!1569707 m!1444447))

(assert (=> b!1569707 m!1444447))

(declare-fun m!1444449 () Bool)

(assert (=> b!1569707 m!1444449))

(assert (=> b!1569709 m!1444447))

(assert (=> b!1569709 m!1444447))

(assert (=> b!1569709 m!1444449))

(assert (=> b!1569631 d!164251))

(declare-fun b!1569734 () Bool)

(declare-fun e!875163 () ListLongMap!22767)

(declare-fun call!72074 () ListLongMap!22767)

(assert (=> b!1569734 (= e!875163 call!72074)))

(declare-fun bm!72071 () Bool)

(assert (=> bm!72071 (= call!72074 (getCurrentListMapNoExtraKeys!6778 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1569735 () Bool)

(assert (=> b!1569735 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51129 _keys!637)))))

(assert (=> b!1569735 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51130 _values!487)))))

(declare-fun lt!673829 () ListLongMap!22767)

(declare-fun e!875161 () Bool)

(declare-fun apply!1123 (ListLongMap!22767 (_ BitVec 64)) V!60201)

(declare-fun get!26418 (ValueCell!18467 V!60201) V!60201)

(declare-fun dynLambda!3923 (Int (_ BitVec 64)) V!60201)

(assert (=> b!1569735 (= e!875161 (= (apply!1123 lt!673829 (select (arr!50578 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26418 (select (arr!50579 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3923 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1569736 () Bool)

(declare-fun e!875160 () Bool)

(declare-fun isEmpty!1152 (ListLongMap!22767) Bool)

(assert (=> b!1569736 (= e!875160 (isEmpty!1152 lt!673829))))

(declare-fun b!1569737 () Bool)

(declare-fun e!875158 () ListLongMap!22767)

(assert (=> b!1569737 (= e!875158 (ListLongMap!22768 Nil!36682))))

(declare-fun b!1569738 () Bool)

(declare-fun res!1072033 () Bool)

(declare-fun e!875159 () Bool)

(assert (=> b!1569738 (=> (not res!1072033) (not e!875159))))

(assert (=> b!1569738 (= res!1072033 (not (contains!10404 lt!673829 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164253 () Bool)

(assert (=> d!164253 e!875159))

(declare-fun res!1072034 () Bool)

(assert (=> d!164253 (=> (not res!1072034) (not e!875159))))

(assert (=> d!164253 (= res!1072034 (not (contains!10404 lt!673829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164253 (= lt!673829 e!875158)))

(declare-fun c!145278 () Bool)

(assert (=> d!164253 (= c!145278 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51129 _keys!637)))))

(assert (=> d!164253 (validMask!0 mask!947)))

(assert (=> d!164253 (= (getCurrentListMapNoExtraKeys!6778 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!673829)))

(declare-fun b!1569739 () Bool)

(declare-fun lt!673825 () Unit!51964)

(declare-fun lt!673827 () Unit!51964)

(assert (=> b!1569739 (= lt!673825 lt!673827)))

(declare-fun lt!673823 () (_ BitVec 64))

(declare-fun lt!673824 () V!60201)

(declare-fun lt!673828 () ListLongMap!22767)

(declare-fun lt!673826 () (_ BitVec 64))

(declare-fun +!5125 (ListLongMap!22767 tuple2!25324) ListLongMap!22767)

(assert (=> b!1569739 (not (contains!10404 (+!5125 lt!673828 (tuple2!25325 lt!673826 lt!673824)) lt!673823))))

(declare-fun addStillNotContains!576 (ListLongMap!22767 (_ BitVec 64) V!60201 (_ BitVec 64)) Unit!51964)

(assert (=> b!1569739 (= lt!673827 (addStillNotContains!576 lt!673828 lt!673826 lt!673824 lt!673823))))

(assert (=> b!1569739 (= lt!673823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1569739 (= lt!673824 (get!26418 (select (arr!50579 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3923 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1569739 (= lt!673826 (select (arr!50578 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1569739 (= lt!673828 call!72074)))

(assert (=> b!1569739 (= e!875163 (+!5125 call!72074 (tuple2!25325 (select (arr!50578 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26418 (select (arr!50579 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3923 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1569740 () Bool)

(declare-fun e!875162 () Bool)

(assert (=> b!1569740 (= e!875162 e!875161)))

(assert (=> b!1569740 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51129 _keys!637)))))

(declare-fun res!1072036 () Bool)

(assert (=> b!1569740 (= res!1072036 (contains!10404 lt!673829 (select (arr!50578 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1569740 (=> (not res!1072036) (not e!875161))))

(declare-fun b!1569741 () Bool)

(assert (=> b!1569741 (= e!875158 e!875163)))

(declare-fun c!145276 () Bool)

(assert (=> b!1569741 (= c!145276 (validKeyInArray!0 (select (arr!50578 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1569742 () Bool)

(assert (=> b!1569742 (= e!875159 e!875162)))

(declare-fun c!145277 () Bool)

(declare-fun e!875157 () Bool)

(assert (=> b!1569742 (= c!145277 e!875157)))

(declare-fun res!1072035 () Bool)

(assert (=> b!1569742 (=> (not res!1072035) (not e!875157))))

(assert (=> b!1569742 (= res!1072035 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51129 _keys!637)))))

(declare-fun b!1569743 () Bool)

(assert (=> b!1569743 (= e!875157 (validKeyInArray!0 (select (arr!50578 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1569743 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1569744 () Bool)

(assert (=> b!1569744 (= e!875162 e!875160)))

(declare-fun c!145279 () Bool)

(assert (=> b!1569744 (= c!145279 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51129 _keys!637)))))

(declare-fun b!1569745 () Bool)

(assert (=> b!1569745 (= e!875160 (= lt!673829 (getCurrentListMapNoExtraKeys!6778 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(assert (= (and d!164253 c!145278) b!1569737))

(assert (= (and d!164253 (not c!145278)) b!1569741))

(assert (= (and b!1569741 c!145276) b!1569739))

(assert (= (and b!1569741 (not c!145276)) b!1569734))

(assert (= (or b!1569739 b!1569734) bm!72071))

(assert (= (and d!164253 res!1072034) b!1569738))

(assert (= (and b!1569738 res!1072033) b!1569742))

(assert (= (and b!1569742 res!1072035) b!1569743))

(assert (= (and b!1569742 c!145277) b!1569740))

(assert (= (and b!1569742 (not c!145277)) b!1569744))

(assert (= (and b!1569740 res!1072036) b!1569735))

(assert (= (and b!1569744 c!145279) b!1569745))

(assert (= (and b!1569744 (not c!145279)) b!1569736))

(declare-fun b_lambda!25025 () Bool)

(assert (=> (not b_lambda!25025) (not b!1569735)))

(declare-fun t!51587 () Bool)

(declare-fun tb!12651 () Bool)

(assert (=> (and start!134500 (= defaultEntry!495 defaultEntry!495) t!51587) tb!12651))

(declare-fun result!26605 () Bool)

(assert (=> tb!12651 (= result!26605 tp_is_empty!38995)))

(assert (=> b!1569735 t!51587))

(declare-fun b_and!51867 () Bool)

(assert (= b_and!51861 (and (=> t!51587 result!26605) b_and!51867)))

(declare-fun b_lambda!25027 () Bool)

(assert (=> (not b_lambda!25027) (not b!1569739)))

(assert (=> b!1569739 t!51587))

(declare-fun b_and!51869 () Bool)

(assert (= b_and!51867 (and (=> t!51587 result!26605) b_and!51869)))

(declare-fun m!1444451 () Bool)

(assert (=> b!1569735 m!1444451))

(declare-fun m!1444453 () Bool)

(assert (=> b!1569735 m!1444453))

(declare-fun m!1444455 () Bool)

(assert (=> b!1569735 m!1444455))

(assert (=> b!1569735 m!1444453))

(declare-fun m!1444457 () Bool)

(assert (=> b!1569735 m!1444457))

(assert (=> b!1569735 m!1444457))

(declare-fun m!1444459 () Bool)

(assert (=> b!1569735 m!1444459))

(assert (=> b!1569735 m!1444451))

(declare-fun m!1444461 () Bool)

(assert (=> b!1569745 m!1444461))

(assert (=> bm!72071 m!1444461))

(assert (=> b!1569741 m!1444457))

(assert (=> b!1569741 m!1444457))

(declare-fun m!1444463 () Bool)

(assert (=> b!1569741 m!1444463))

(declare-fun m!1444465 () Bool)

(assert (=> d!164253 m!1444465))

(assert (=> d!164253 m!1444375))

(declare-fun m!1444467 () Bool)

(assert (=> b!1569739 m!1444467))

(assert (=> b!1569739 m!1444451))

(assert (=> b!1569739 m!1444453))

(assert (=> b!1569739 m!1444455))

(declare-fun m!1444469 () Bool)

(assert (=> b!1569739 m!1444469))

(declare-fun m!1444471 () Bool)

(assert (=> b!1569739 m!1444471))

(assert (=> b!1569739 m!1444453))

(assert (=> b!1569739 m!1444457))

(declare-fun m!1444473 () Bool)

(assert (=> b!1569739 m!1444473))

(assert (=> b!1569739 m!1444469))

(assert (=> b!1569739 m!1444451))

(declare-fun m!1444475 () Bool)

(assert (=> b!1569736 m!1444475))

(assert (=> b!1569743 m!1444457))

(assert (=> b!1569743 m!1444457))

(assert (=> b!1569743 m!1444463))

(assert (=> b!1569740 m!1444457))

(assert (=> b!1569740 m!1444457))

(declare-fun m!1444477 () Bool)

(assert (=> b!1569740 m!1444477))

(declare-fun m!1444479 () Bool)

(assert (=> b!1569738 m!1444479))

(assert (=> b!1569631 d!164253))

(declare-fun d!164255 () Bool)

(assert (=> d!164255 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134500 d!164255))

(declare-fun d!164257 () Bool)

(assert (=> d!164257 (= (array_inv!39535 _keys!637) (bvsge (size!51129 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134500 d!164257))

(declare-fun d!164259 () Bool)

(assert (=> d!164259 (= (array_inv!39536 _values!487) (bvsge (size!51130 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134500 d!164259))

(declare-fun d!164261 () Bool)

(assert (=> d!164261 (= (validKeyInArray!0 (select (arr!50578 _keys!637) from!782)) (and (not (= (select (arr!50578 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50578 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1569627 d!164261))

(declare-fun b!1569758 () Bool)

(declare-fun e!875173 () Bool)

(declare-fun call!72077 () Bool)

(assert (=> b!1569758 (= e!875173 call!72077)))

(declare-fun b!1569759 () Bool)

(declare-fun e!875172 () Bool)

(assert (=> b!1569759 (= e!875172 e!875173)))

(declare-fun c!145282 () Bool)

(assert (=> b!1569759 (= c!145282 (validKeyInArray!0 (select (arr!50578 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!72074 () Bool)

(assert (=> bm!72074 (= call!72077 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145282 (Cons!36682 (select (arr!50578 _keys!637) #b00000000000000000000000000000000) Nil!36683) Nil!36683)))))

(declare-fun b!1569760 () Bool)

(assert (=> b!1569760 (= e!875173 call!72077)))

(declare-fun b!1569761 () Bool)

(declare-fun e!875174 () Bool)

(assert (=> b!1569761 (= e!875174 e!875172)))

(declare-fun res!1072045 () Bool)

(assert (=> b!1569761 (=> (not res!1072045) (not e!875172))))

(declare-fun e!875175 () Bool)

(assert (=> b!1569761 (= res!1072045 (not e!875175))))

(declare-fun res!1072043 () Bool)

(assert (=> b!1569761 (=> (not res!1072043) (not e!875175))))

(assert (=> b!1569761 (= res!1072043 (validKeyInArray!0 (select (arr!50578 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!164263 () Bool)

(declare-fun res!1072044 () Bool)

(assert (=> d!164263 (=> res!1072044 e!875174)))

(assert (=> d!164263 (= res!1072044 (bvsge #b00000000000000000000000000000000 (size!51129 _keys!637)))))

(assert (=> d!164263 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36683) e!875174)))

(declare-fun b!1569762 () Bool)

(declare-fun contains!10407 (List!36686 (_ BitVec 64)) Bool)

(assert (=> b!1569762 (= e!875175 (contains!10407 Nil!36683 (select (arr!50578 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!164263 (not res!1072044)) b!1569761))

(assert (= (and b!1569761 res!1072043) b!1569762))

(assert (= (and b!1569761 res!1072045) b!1569759))

(assert (= (and b!1569759 c!145282) b!1569758))

(assert (= (and b!1569759 (not c!145282)) b!1569760))

(assert (= (or b!1569758 b!1569760) bm!72074))

(declare-fun m!1444481 () Bool)

(assert (=> b!1569759 m!1444481))

(assert (=> b!1569759 m!1444481))

(declare-fun m!1444483 () Bool)

(assert (=> b!1569759 m!1444483))

(assert (=> bm!72074 m!1444481))

(declare-fun m!1444485 () Bool)

(assert (=> bm!72074 m!1444485))

(assert (=> b!1569761 m!1444481))

(assert (=> b!1569761 m!1444481))

(assert (=> b!1569761 m!1444483))

(assert (=> b!1569762 m!1444481))

(assert (=> b!1569762 m!1444481))

(declare-fun m!1444487 () Bool)

(assert (=> b!1569762 m!1444487))

(assert (=> b!1569629 d!164263))

(declare-fun b!1569771 () Bool)

(declare-fun e!875182 () Bool)

(declare-fun e!875183 () Bool)

(assert (=> b!1569771 (= e!875182 e!875183)))

(declare-fun lt!673837 () (_ BitVec 64))

(assert (=> b!1569771 (= lt!673837 (select (arr!50578 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!673838 () Unit!51964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104800 (_ BitVec 64) (_ BitVec 32)) Unit!51964)

(assert (=> b!1569771 (= lt!673838 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673837 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1569771 (arrayContainsKey!0 _keys!637 lt!673837 #b00000000000000000000000000000000)))

(declare-fun lt!673836 () Unit!51964)

(assert (=> b!1569771 (= lt!673836 lt!673838)))

(declare-fun res!1072051 () Bool)

(declare-datatypes ((SeekEntryResult!13476 0))(
  ( (MissingZero!13476 (index!56302 (_ BitVec 32))) (Found!13476 (index!56303 (_ BitVec 32))) (Intermediate!13476 (undefined!14288 Bool) (index!56304 (_ BitVec 32)) (x!140820 (_ BitVec 32))) (Undefined!13476) (MissingVacant!13476 (index!56305 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104800 (_ BitVec 32)) SeekEntryResult!13476)

(assert (=> b!1569771 (= res!1072051 (= (seekEntryOrOpen!0 (select (arr!50578 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13476 #b00000000000000000000000000000000)))))

(assert (=> b!1569771 (=> (not res!1072051) (not e!875183))))

(declare-fun b!1569772 () Bool)

(declare-fun call!72080 () Bool)

(assert (=> b!1569772 (= e!875182 call!72080)))

(declare-fun b!1569773 () Bool)

(assert (=> b!1569773 (= e!875183 call!72080)))

(declare-fun d!164265 () Bool)

(declare-fun res!1072050 () Bool)

(declare-fun e!875184 () Bool)

(assert (=> d!164265 (=> res!1072050 e!875184)))

(assert (=> d!164265 (= res!1072050 (bvsge #b00000000000000000000000000000000 (size!51129 _keys!637)))))

(assert (=> d!164265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!875184)))

(declare-fun b!1569774 () Bool)

(assert (=> b!1569774 (= e!875184 e!875182)))

(declare-fun c!145285 () Bool)

(assert (=> b!1569774 (= c!145285 (validKeyInArray!0 (select (arr!50578 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!72077 () Bool)

(assert (=> bm!72077 (= call!72080 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(assert (= (and d!164265 (not res!1072050)) b!1569774))

(assert (= (and b!1569774 c!145285) b!1569771))

(assert (= (and b!1569774 (not c!145285)) b!1569772))

(assert (= (and b!1569771 res!1072051) b!1569773))

(assert (= (or b!1569773 b!1569772) bm!72077))

(assert (=> b!1569771 m!1444481))

(declare-fun m!1444489 () Bool)

(assert (=> b!1569771 m!1444489))

(declare-fun m!1444491 () Bool)

(assert (=> b!1569771 m!1444491))

(assert (=> b!1569771 m!1444481))

(declare-fun m!1444493 () Bool)

(assert (=> b!1569771 m!1444493))

(assert (=> b!1569774 m!1444481))

(assert (=> b!1569774 m!1444481))

(assert (=> b!1569774 m!1444483))

(declare-fun m!1444495 () Bool)

(assert (=> bm!72077 m!1444495))

(assert (=> b!1569625 d!164265))

(declare-fun mapIsEmpty!59901 () Bool)

(declare-fun mapRes!59901 () Bool)

(assert (=> mapIsEmpty!59901 mapRes!59901))

(declare-fun b!1569781 () Bool)

(declare-fun e!875189 () Bool)

(assert (=> b!1569781 (= e!875189 tp_is_empty!38995)))

(declare-fun b!1569782 () Bool)

(declare-fun e!875190 () Bool)

(assert (=> b!1569782 (= e!875190 tp_is_empty!38995)))

(declare-fun condMapEmpty!59901 () Bool)

(declare-fun mapDefault!59901 () ValueCell!18467)

(assert (=> mapNonEmpty!59892 (= condMapEmpty!59901 (= mapRest!59892 ((as const (Array (_ BitVec 32) ValueCell!18467)) mapDefault!59901)))))

(assert (=> mapNonEmpty!59892 (= tp!113963 (and e!875190 mapRes!59901))))

(declare-fun mapNonEmpty!59901 () Bool)

(declare-fun tp!113979 () Bool)

(assert (=> mapNonEmpty!59901 (= mapRes!59901 (and tp!113979 e!875189))))

(declare-fun mapValue!59901 () ValueCell!18467)

(declare-fun mapRest!59901 () (Array (_ BitVec 32) ValueCell!18467))

(declare-fun mapKey!59901 () (_ BitVec 32))

(assert (=> mapNonEmpty!59901 (= mapRest!59892 (store mapRest!59901 mapKey!59901 mapValue!59901))))

(assert (= (and mapNonEmpty!59892 condMapEmpty!59901) mapIsEmpty!59901))

(assert (= (and mapNonEmpty!59892 (not condMapEmpty!59901)) mapNonEmpty!59901))

(assert (= (and mapNonEmpty!59901 ((_ is ValueCellFull!18467) mapValue!59901)) b!1569781))

(assert (= (and mapNonEmpty!59892 ((_ is ValueCellFull!18467) mapDefault!59901)) b!1569782))

(declare-fun m!1444497 () Bool)

(assert (=> mapNonEmpty!59901 m!1444497))

(declare-fun b_lambda!25029 () Bool)

(assert (= b_lambda!25025 (or (and start!134500 b_free!32215) b_lambda!25029)))

(declare-fun b_lambda!25031 () Bool)

(assert (= b_lambda!25027 (or (and start!134500 b_free!32215) b_lambda!25031)))

(check-sat (not b!1569736) (not bm!72074) (not b_lambda!25031) b_and!51869 (not bm!72071) (not mapNonEmpty!59901) (not b_lambda!25029) (not b!1569745) (not d!164251) (not bm!72077) (not b!1569741) (not b!1569738) (not b!1569761) (not b!1569709) (not b!1569762) (not b!1569735) (not b_next!32215) (not d!164253) (not b!1569739) (not b!1569774) (not b!1569740) (not b!1569706) (not d!164249) tp_is_empty!38995 (not b!1569771) (not b!1569743) (not b!1569707) (not b!1569704) (not b!1569759))
(check-sat b_and!51869 (not b_next!32215))
