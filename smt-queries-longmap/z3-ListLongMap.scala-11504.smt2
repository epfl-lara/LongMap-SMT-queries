; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133820 () Bool)

(assert start!133820)

(declare-fun b_free!32131 () Bool)

(declare-fun b_next!32131 () Bool)

(assert (=> start!133820 (= b_free!32131 (not b_next!32131))))

(declare-fun tp!113689 () Bool)

(declare-fun b_and!51683 () Bool)

(assert (=> start!133820 (= tp!113689 b_and!51683)))

(declare-fun b!1564768 () Bool)

(declare-fun res!1069789 () Bool)

(declare-fun e!872155 () Bool)

(assert (=> b!1564768 (=> (not res!1069789) (not e!872155))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104428 0))(
  ( (array!104429 (arr!50404 (Array (_ BitVec 32) (_ BitVec 64))) (size!50956 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104428)

(declare-datatypes ((V!60081 0))(
  ( (V!60082 (val!19536 Int)) )
))
(declare-datatypes ((ValueCell!18422 0))(
  ( (ValueCellFull!18422 (v!22286 V!60081)) (EmptyCell!18422) )
))
(declare-datatypes ((array!104430 0))(
  ( (array!104431 (arr!50405 (Array (_ BitVec 32) ValueCell!18422)) (size!50957 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104430)

(assert (=> b!1564768 (= res!1069789 (and (= (size!50957 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50956 _keys!637) (size!50957 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069788 () Bool)

(assert (=> start!133820 (=> (not res!1069788) (not e!872155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133820 (= res!1069788 (validMask!0 mask!947))))

(assert (=> start!133820 e!872155))

(assert (=> start!133820 tp!113689))

(declare-fun tp_is_empty!38905 () Bool)

(assert (=> start!133820 tp_is_empty!38905))

(assert (=> start!133820 true))

(declare-fun array_inv!39371 (array!104428) Bool)

(assert (=> start!133820 (array_inv!39371 _keys!637)))

(declare-fun e!872150 () Bool)

(declare-fun array_inv!39372 (array!104430) Bool)

(assert (=> start!133820 (and (array_inv!39372 _values!487) e!872150)))

(declare-fun b!1564769 () Bool)

(declare-fun res!1069783 () Bool)

(assert (=> b!1564769 (=> (not res!1069783) (not e!872155))))

(declare-datatypes ((List!36642 0))(
  ( (Nil!36639) (Cons!36638 (h!38085 (_ BitVec 64)) (t!51481 List!36642)) )
))
(declare-fun arrayNoDuplicates!0 (array!104428 (_ BitVec 32) List!36642) Bool)

(assert (=> b!1564769 (= res!1069783 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36639))))

(declare-fun mapNonEmpty!59743 () Bool)

(declare-fun mapRes!59743 () Bool)

(declare-fun tp!113690 () Bool)

(declare-fun e!872154 () Bool)

(assert (=> mapNonEmpty!59743 (= mapRes!59743 (and tp!113690 e!872154))))

(declare-fun mapKey!59743 () (_ BitVec 32))

(declare-fun mapRest!59743 () (Array (_ BitVec 32) ValueCell!18422))

(declare-fun mapValue!59743 () ValueCell!18422)

(assert (=> mapNonEmpty!59743 (= (arr!50405 _values!487) (store mapRest!59743 mapKey!59743 mapValue!59743))))

(declare-fun mapIsEmpty!59743 () Bool)

(assert (=> mapIsEmpty!59743 mapRes!59743))

(declare-fun b!1564770 () Bool)

(assert (=> b!1564770 (= e!872154 tp_is_empty!38905)))

(declare-fun b!1564771 () Bool)

(declare-fun e!872153 () Bool)

(assert (=> b!1564771 (= e!872155 e!872153)))

(declare-fun res!1069787 () Bool)

(assert (=> b!1564771 (=> res!1069787 e!872153)))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60081)

(declare-fun minValue!453 () V!60081)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((tuple2!25282 0))(
  ( (tuple2!25283 (_1!12652 (_ BitVec 64)) (_2!12652 V!60081)) )
))
(declare-datatypes ((List!36643 0))(
  ( (Nil!36640) (Cons!36639 (h!38086 tuple2!25282) (t!51482 List!36643)) )
))
(declare-datatypes ((ListLongMap!22717 0))(
  ( (ListLongMap!22718 (toList!11374 List!36643)) )
))
(declare-fun contains!10284 (ListLongMap!22717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6726 (array!104428 array!104430 (_ BitVec 32) (_ BitVec 32) V!60081 V!60081 (_ BitVec 32) Int) ListLongMap!22717)

(assert (=> b!1564771 (= res!1069787 (contains!10284 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564772 () Bool)

(declare-fun res!1069786 () Bool)

(assert (=> b!1564772 (=> (not res!1069786) (not e!872155))))

(assert (=> b!1564772 (= res!1069786 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50956 _keys!637)) (bvslt from!782 (size!50956 _keys!637))))))

(declare-fun b!1564773 () Bool)

(assert (=> b!1564773 (= e!872153 (= (select (arr!50404 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564774 () Bool)

(declare-fun res!1069785 () Bool)

(assert (=> b!1564774 (=> (not res!1069785) (not e!872155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104428 (_ BitVec 32)) Bool)

(assert (=> b!1564774 (= res!1069785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564775 () Bool)

(declare-fun e!872151 () Bool)

(assert (=> b!1564775 (= e!872150 (and e!872151 mapRes!59743))))

(declare-fun condMapEmpty!59743 () Bool)

(declare-fun mapDefault!59743 () ValueCell!18422)

(assert (=> b!1564775 (= condMapEmpty!59743 (= (arr!50405 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18422)) mapDefault!59743)))))

(declare-fun b!1564776 () Bool)

(declare-fun res!1069784 () Bool)

(assert (=> b!1564776 (=> (not res!1069784) (not e!872155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564776 (= res!1069784 (validKeyInArray!0 (select (arr!50404 _keys!637) from!782)))))

(declare-fun b!1564777 () Bool)

(assert (=> b!1564777 (= e!872151 tp_is_empty!38905)))

(assert (= (and start!133820 res!1069788) b!1564768))

(assert (= (and b!1564768 res!1069789) b!1564774))

(assert (= (and b!1564774 res!1069785) b!1564769))

(assert (= (and b!1564769 res!1069783) b!1564772))

(assert (= (and b!1564772 res!1069786) b!1564776))

(assert (= (and b!1564776 res!1069784) b!1564771))

(assert (= (and b!1564771 (not res!1069787)) b!1564773))

(assert (= (and b!1564775 condMapEmpty!59743) mapIsEmpty!59743))

(assert (= (and b!1564775 (not condMapEmpty!59743)) mapNonEmpty!59743))

(get-info :version)

(assert (= (and mapNonEmpty!59743 ((_ is ValueCellFull!18422) mapValue!59743)) b!1564770))

(assert (= (and b!1564775 ((_ is ValueCellFull!18422) mapDefault!59743)) b!1564777))

(assert (= start!133820 b!1564775))

(declare-fun m!1439163 () Bool)

(assert (=> b!1564769 m!1439163))

(declare-fun m!1439165 () Bool)

(assert (=> b!1564771 m!1439165))

(assert (=> b!1564771 m!1439165))

(declare-fun m!1439167 () Bool)

(assert (=> b!1564771 m!1439167))

(declare-fun m!1439169 () Bool)

(assert (=> b!1564774 m!1439169))

(declare-fun m!1439171 () Bool)

(assert (=> start!133820 m!1439171))

(declare-fun m!1439173 () Bool)

(assert (=> start!133820 m!1439173))

(declare-fun m!1439175 () Bool)

(assert (=> start!133820 m!1439175))

(declare-fun m!1439177 () Bool)

(assert (=> mapNonEmpty!59743 m!1439177))

(declare-fun m!1439179 () Bool)

(assert (=> b!1564773 m!1439179))

(assert (=> b!1564776 m!1439179))

(assert (=> b!1564776 m!1439179))

(declare-fun m!1439181 () Bool)

(assert (=> b!1564776 m!1439181))

(check-sat b_and!51683 (not b!1564771) (not b!1564776) (not b_next!32131) (not start!133820) (not b!1564769) (not b!1564774) (not mapNonEmpty!59743) tp_is_empty!38905)
(check-sat b_and!51683 (not b_next!32131))
(get-model)

(declare-fun d!162905 () Bool)

(assert (=> d!162905 (= (validKeyInArray!0 (select (arr!50404 _keys!637) from!782)) (and (not (= (select (arr!50404 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50404 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1564776 d!162905))

(declare-fun d!162907 () Bool)

(declare-fun e!872197 () Bool)

(assert (=> d!162907 e!872197))

(declare-fun res!1069834 () Bool)

(assert (=> d!162907 (=> res!1069834 e!872197)))

(declare-fun lt!671860 () Bool)

(assert (=> d!162907 (= res!1069834 (not lt!671860))))

(declare-fun lt!671857 () Bool)

(assert (=> d!162907 (= lt!671860 lt!671857)))

(declare-datatypes ((Unit!51806 0))(
  ( (Unit!51807) )
))
(declare-fun lt!671858 () Unit!51806)

(declare-fun e!872196 () Unit!51806)

(assert (=> d!162907 (= lt!671858 e!872196)))

(declare-fun c!144171 () Bool)

(assert (=> d!162907 (= c!144171 lt!671857)))

(declare-fun containsKey!847 (List!36643 (_ BitVec 64)) Bool)

(assert (=> d!162907 (= lt!671857 (containsKey!847 (toList!11374 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162907 (= (contains!10284 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000) lt!671860)))

(declare-fun b!1564844 () Bool)

(declare-fun lt!671859 () Unit!51806)

(assert (=> b!1564844 (= e!872196 lt!671859)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!531 (List!36643 (_ BitVec 64)) Unit!51806)

(assert (=> b!1564844 (= lt!671859 (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11374 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!869 0))(
  ( (Some!868 (v!22289 V!60081)) (None!867) )
))
(declare-fun isDefined!582 (Option!869) Bool)

(declare-fun getValueByKey!794 (List!36643 (_ BitVec 64)) Option!869)

(assert (=> b!1564844 (isDefined!582 (getValueByKey!794 (toList!11374 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564845 () Bool)

(declare-fun Unit!51808 () Unit!51806)

(assert (=> b!1564845 (= e!872196 Unit!51808)))

(declare-fun b!1564846 () Bool)

(assert (=> b!1564846 (= e!872197 (isDefined!582 (getValueByKey!794 (toList!11374 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162907 c!144171) b!1564844))

(assert (= (and d!162907 (not c!144171)) b!1564845))

(assert (= (and d!162907 (not res!1069834)) b!1564846))

(declare-fun m!1439223 () Bool)

(assert (=> d!162907 m!1439223))

(declare-fun m!1439225 () Bool)

(assert (=> b!1564844 m!1439225))

(declare-fun m!1439227 () Bool)

(assert (=> b!1564844 m!1439227))

(assert (=> b!1564844 m!1439227))

(declare-fun m!1439229 () Bool)

(assert (=> b!1564844 m!1439229))

(assert (=> b!1564846 m!1439227))

(assert (=> b!1564846 m!1439227))

(assert (=> b!1564846 m!1439229))

(assert (=> b!1564771 d!162907))

(declare-fun b!1564871 () Bool)

(declare-fun e!872212 () Bool)

(declare-fun e!872218 () Bool)

(assert (=> b!1564871 (= e!872212 e!872218)))

(declare-fun c!144183 () Bool)

(declare-fun e!872216 () Bool)

(assert (=> b!1564871 (= c!144183 e!872216)))

(declare-fun res!1069844 () Bool)

(assert (=> b!1564871 (=> (not res!1069844) (not e!872216))))

(assert (=> b!1564871 (= res!1069844 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50956 _keys!637)))))

(declare-fun b!1564872 () Bool)

(declare-fun e!872214 () Bool)

(declare-fun lt!671875 () ListLongMap!22717)

(declare-fun isEmpty!1149 (ListLongMap!22717) Bool)

(assert (=> b!1564872 (= e!872214 (isEmpty!1149 lt!671875))))

(declare-fun b!1564873 () Bool)

(declare-fun e!872215 () ListLongMap!22717)

(assert (=> b!1564873 (= e!872215 (ListLongMap!22718 Nil!36640))))

(declare-fun b!1564874 () Bool)

(assert (=> b!1564874 (= e!872216 (validKeyInArray!0 (select (arr!50404 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1564874 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun call!71832 () ListLongMap!22717)

(declare-fun bm!71829 () Bool)

(assert (=> bm!71829 (= call!71832 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1564875 () Bool)

(declare-fun e!872217 () ListLongMap!22717)

(assert (=> b!1564875 (= e!872217 call!71832)))

(declare-fun b!1564876 () Bool)

(assert (=> b!1564876 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50956 _keys!637)))))

(assert (=> b!1564876 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50957 _values!487)))))

(declare-fun e!872213 () Bool)

(declare-fun apply!1103 (ListLongMap!22717 (_ BitVec 64)) V!60081)

(declare-fun get!26320 (ValueCell!18422 V!60081) V!60081)

(declare-fun dynLambda!3871 (Int (_ BitVec 64)) V!60081)

(assert (=> b!1564876 (= e!872213 (= (apply!1103 lt!671875 (select (arr!50404 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26320 (select (arr!50405 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3871 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1564877 () Bool)

(declare-fun res!1069845 () Bool)

(assert (=> b!1564877 (=> (not res!1069845) (not e!872212))))

(assert (=> b!1564877 (= res!1069845 (not (contains!10284 lt!671875 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!162909 () Bool)

(assert (=> d!162909 e!872212))

(declare-fun res!1069843 () Bool)

(assert (=> d!162909 (=> (not res!1069843) (not e!872212))))

(assert (=> d!162909 (= res!1069843 (not (contains!10284 lt!671875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!162909 (= lt!671875 e!872215)))

(declare-fun c!144180 () Bool)

(assert (=> d!162909 (= c!144180 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!50956 _keys!637)))))

(assert (=> d!162909 (validMask!0 mask!947)))

(assert (=> d!162909 (= (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!671875)))

(declare-fun b!1564878 () Bool)

(declare-fun lt!671879 () Unit!51806)

(declare-fun lt!671878 () Unit!51806)

(assert (=> b!1564878 (= lt!671879 lt!671878)))

(declare-fun lt!671881 () ListLongMap!22717)

(declare-fun lt!671876 () (_ BitVec 64))

(declare-fun lt!671880 () V!60081)

(declare-fun lt!671877 () (_ BitVec 64))

(declare-fun +!5095 (ListLongMap!22717 tuple2!25282) ListLongMap!22717)

(assert (=> b!1564878 (not (contains!10284 (+!5095 lt!671881 (tuple2!25283 lt!671877 lt!671880)) lt!671876))))

(declare-fun addStillNotContains!542 (ListLongMap!22717 (_ BitVec 64) V!60081 (_ BitVec 64)) Unit!51806)

(assert (=> b!1564878 (= lt!671878 (addStillNotContains!542 lt!671881 lt!671877 lt!671880 lt!671876))))

(assert (=> b!1564878 (= lt!671876 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1564878 (= lt!671880 (get!26320 (select (arr!50405 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3871 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1564878 (= lt!671877 (select (arr!50404 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1564878 (= lt!671881 call!71832)))

(assert (=> b!1564878 (= e!872217 (+!5095 call!71832 (tuple2!25283 (select (arr!50404 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26320 (select (arr!50405 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3871 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1564879 () Bool)

(assert (=> b!1564879 (= e!872218 e!872213)))

(assert (=> b!1564879 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50956 _keys!637)))))

(declare-fun res!1069846 () Bool)

(assert (=> b!1564879 (= res!1069846 (contains!10284 lt!671875 (select (arr!50404 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1564879 (=> (not res!1069846) (not e!872213))))

(declare-fun b!1564880 () Bool)

(assert (=> b!1564880 (= e!872214 (= lt!671875 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1564881 () Bool)

(assert (=> b!1564881 (= e!872215 e!872217)))

(declare-fun c!144181 () Bool)

(assert (=> b!1564881 (= c!144181 (validKeyInArray!0 (select (arr!50404 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1564882 () Bool)

(assert (=> b!1564882 (= e!872218 e!872214)))

(declare-fun c!144182 () Bool)

(assert (=> b!1564882 (= c!144182 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50956 _keys!637)))))

(assert (= (and d!162909 c!144180) b!1564873))

(assert (= (and d!162909 (not c!144180)) b!1564881))

(assert (= (and b!1564881 c!144181) b!1564878))

(assert (= (and b!1564881 (not c!144181)) b!1564875))

(assert (= (or b!1564878 b!1564875) bm!71829))

(assert (= (and d!162909 res!1069843) b!1564877))

(assert (= (and b!1564877 res!1069845) b!1564871))

(assert (= (and b!1564871 res!1069844) b!1564874))

(assert (= (and b!1564871 c!144183) b!1564879))

(assert (= (and b!1564871 (not c!144183)) b!1564882))

(assert (= (and b!1564879 res!1069846) b!1564876))

(assert (= (and b!1564882 c!144182) b!1564880))

(assert (= (and b!1564882 (not c!144182)) b!1564872))

(declare-fun b_lambda!24923 () Bool)

(assert (=> (not b_lambda!24923) (not b!1564876)))

(declare-fun t!51485 () Bool)

(declare-fun tb!12595 () Bool)

(assert (=> (and start!133820 (= defaultEntry!495 defaultEntry!495) t!51485) tb!12595))

(declare-fun result!26485 () Bool)

(assert (=> tb!12595 (= result!26485 tp_is_empty!38905)))

(assert (=> b!1564876 t!51485))

(declare-fun b_and!51689 () Bool)

(assert (= b_and!51683 (and (=> t!51485 result!26485) b_and!51689)))

(declare-fun b_lambda!24925 () Bool)

(assert (=> (not b_lambda!24925) (not b!1564878)))

(assert (=> b!1564878 t!51485))

(declare-fun b_and!51691 () Bool)

(assert (= b_and!51689 (and (=> t!51485 result!26485) b_and!51691)))

(declare-fun m!1439231 () Bool)

(assert (=> b!1564876 m!1439231))

(declare-fun m!1439233 () Bool)

(assert (=> b!1564876 m!1439233))

(assert (=> b!1564876 m!1439231))

(declare-fun m!1439235 () Bool)

(assert (=> b!1564876 m!1439235))

(declare-fun m!1439237 () Bool)

(assert (=> b!1564876 m!1439237))

(assert (=> b!1564876 m!1439235))

(assert (=> b!1564876 m!1439237))

(declare-fun m!1439239 () Bool)

(assert (=> b!1564876 m!1439239))

(assert (=> b!1564881 m!1439231))

(assert (=> b!1564881 m!1439231))

(declare-fun m!1439241 () Bool)

(assert (=> b!1564881 m!1439241))

(assert (=> b!1564879 m!1439231))

(assert (=> b!1564879 m!1439231))

(declare-fun m!1439243 () Bool)

(assert (=> b!1564879 m!1439243))

(declare-fun m!1439245 () Bool)

(assert (=> bm!71829 m!1439245))

(declare-fun m!1439247 () Bool)

(assert (=> b!1564872 m!1439247))

(assert (=> b!1564874 m!1439231))

(assert (=> b!1564874 m!1439231))

(assert (=> b!1564874 m!1439241))

(declare-fun m!1439249 () Bool)

(assert (=> d!162909 m!1439249))

(assert (=> d!162909 m!1439171))

(declare-fun m!1439251 () Bool)

(assert (=> b!1564878 m!1439251))

(declare-fun m!1439253 () Bool)

(assert (=> b!1564878 m!1439253))

(assert (=> b!1564878 m!1439231))

(assert (=> b!1564878 m!1439235))

(assert (=> b!1564878 m!1439237))

(assert (=> b!1564878 m!1439251))

(declare-fun m!1439255 () Bool)

(assert (=> b!1564878 m!1439255))

(declare-fun m!1439257 () Bool)

(assert (=> b!1564878 m!1439257))

(assert (=> b!1564878 m!1439235))

(assert (=> b!1564878 m!1439237))

(assert (=> b!1564878 m!1439239))

(declare-fun m!1439259 () Bool)

(assert (=> b!1564877 m!1439259))

(assert (=> b!1564880 m!1439245))

(assert (=> b!1564771 d!162909))

(declare-fun bm!71832 () Bool)

(declare-fun call!71835 () Bool)

(assert (=> bm!71832 (= call!71835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1564893 () Bool)

(declare-fun e!872225 () Bool)

(declare-fun e!872226 () Bool)

(assert (=> b!1564893 (= e!872225 e!872226)))

(declare-fun lt!671890 () (_ BitVec 64))

(assert (=> b!1564893 (= lt!671890 (select (arr!50404 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!671888 () Unit!51806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104428 (_ BitVec 64) (_ BitVec 32)) Unit!51806)

(assert (=> b!1564893 (= lt!671888 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671890 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1564893 (arrayContainsKey!0 _keys!637 lt!671890 #b00000000000000000000000000000000)))

(declare-fun lt!671889 () Unit!51806)

(assert (=> b!1564893 (= lt!671889 lt!671888)))

(declare-fun res!1069851 () Bool)

(declare-datatypes ((SeekEntryResult!13524 0))(
  ( (MissingZero!13524 (index!56494 (_ BitVec 32))) (Found!13524 (index!56495 (_ BitVec 32))) (Intermediate!13524 (undefined!14336 Bool) (index!56496 (_ BitVec 32)) (x!140594 (_ BitVec 32))) (Undefined!13524) (MissingVacant!13524 (index!56497 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104428 (_ BitVec 32)) SeekEntryResult!13524)

(assert (=> b!1564893 (= res!1069851 (= (seekEntryOrOpen!0 (select (arr!50404 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13524 #b00000000000000000000000000000000)))))

(assert (=> b!1564893 (=> (not res!1069851) (not e!872226))))

(declare-fun b!1564894 () Bool)

(assert (=> b!1564894 (= e!872225 call!71835)))

(declare-fun d!162911 () Bool)

(declare-fun res!1069852 () Bool)

(declare-fun e!872227 () Bool)

(assert (=> d!162911 (=> res!1069852 e!872227)))

(assert (=> d!162911 (= res!1069852 (bvsge #b00000000000000000000000000000000 (size!50956 _keys!637)))))

(assert (=> d!162911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872227)))

(declare-fun b!1564895 () Bool)

(assert (=> b!1564895 (= e!872227 e!872225)))

(declare-fun c!144186 () Bool)

(assert (=> b!1564895 (= c!144186 (validKeyInArray!0 (select (arr!50404 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564896 () Bool)

(assert (=> b!1564896 (= e!872226 call!71835)))

(assert (= (and d!162911 (not res!1069852)) b!1564895))

(assert (= (and b!1564895 c!144186) b!1564893))

(assert (= (and b!1564895 (not c!144186)) b!1564894))

(assert (= (and b!1564893 res!1069851) b!1564896))

(assert (= (or b!1564896 b!1564894) bm!71832))

(declare-fun m!1439261 () Bool)

(assert (=> bm!71832 m!1439261))

(declare-fun m!1439263 () Bool)

(assert (=> b!1564893 m!1439263))

(declare-fun m!1439265 () Bool)

(assert (=> b!1564893 m!1439265))

(declare-fun m!1439267 () Bool)

(assert (=> b!1564893 m!1439267))

(assert (=> b!1564893 m!1439263))

(declare-fun m!1439269 () Bool)

(assert (=> b!1564893 m!1439269))

(assert (=> b!1564895 m!1439263))

(assert (=> b!1564895 m!1439263))

(declare-fun m!1439271 () Bool)

(assert (=> b!1564895 m!1439271))

(assert (=> b!1564774 d!162911))

(declare-fun d!162913 () Bool)

(assert (=> d!162913 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133820 d!162913))

(declare-fun d!162915 () Bool)

(assert (=> d!162915 (= (array_inv!39371 _keys!637) (bvsge (size!50956 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133820 d!162915))

(declare-fun d!162917 () Bool)

(assert (=> d!162917 (= (array_inv!39372 _values!487) (bvsge (size!50957 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133820 d!162917))

(declare-fun b!1564907 () Bool)

(declare-fun e!872236 () Bool)

(declare-fun e!872238 () Bool)

(assert (=> b!1564907 (= e!872236 e!872238)))

(declare-fun res!1069861 () Bool)

(assert (=> b!1564907 (=> (not res!1069861) (not e!872238))))

(declare-fun e!872237 () Bool)

(assert (=> b!1564907 (= res!1069861 (not e!872237))))

(declare-fun res!1069859 () Bool)

(assert (=> b!1564907 (=> (not res!1069859) (not e!872237))))

(assert (=> b!1564907 (= res!1069859 (validKeyInArray!0 (select (arr!50404 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71835 () Bool)

(declare-fun call!71838 () Bool)

(declare-fun c!144189 () Bool)

(assert (=> bm!71835 (= call!71838 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144189 (Cons!36638 (select (arr!50404 _keys!637) #b00000000000000000000000000000000) Nil!36639) Nil!36639)))))

(declare-fun b!1564908 () Bool)

(declare-fun e!872239 () Bool)

(assert (=> b!1564908 (= e!872238 e!872239)))

(assert (=> b!1564908 (= c!144189 (validKeyInArray!0 (select (arr!50404 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564909 () Bool)

(assert (=> b!1564909 (= e!872239 call!71838)))

(declare-fun b!1564911 () Bool)

(declare-fun contains!10285 (List!36642 (_ BitVec 64)) Bool)

(assert (=> b!1564911 (= e!872237 (contains!10285 Nil!36639 (select (arr!50404 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564910 () Bool)

(assert (=> b!1564910 (= e!872239 call!71838)))

(declare-fun d!162919 () Bool)

(declare-fun res!1069860 () Bool)

(assert (=> d!162919 (=> res!1069860 e!872236)))

(assert (=> d!162919 (= res!1069860 (bvsge #b00000000000000000000000000000000 (size!50956 _keys!637)))))

(assert (=> d!162919 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36639) e!872236)))

(assert (= (and d!162919 (not res!1069860)) b!1564907))

(assert (= (and b!1564907 res!1069859) b!1564911))

(assert (= (and b!1564907 res!1069861) b!1564908))

(assert (= (and b!1564908 c!144189) b!1564910))

(assert (= (and b!1564908 (not c!144189)) b!1564909))

(assert (= (or b!1564910 b!1564909) bm!71835))

(assert (=> b!1564907 m!1439263))

(assert (=> b!1564907 m!1439263))

(assert (=> b!1564907 m!1439271))

(assert (=> bm!71835 m!1439263))

(declare-fun m!1439273 () Bool)

(assert (=> bm!71835 m!1439273))

(assert (=> b!1564908 m!1439263))

(assert (=> b!1564908 m!1439263))

(assert (=> b!1564908 m!1439271))

(assert (=> b!1564911 m!1439263))

(assert (=> b!1564911 m!1439263))

(declare-fun m!1439275 () Bool)

(assert (=> b!1564911 m!1439275))

(assert (=> b!1564769 d!162919))

(declare-fun condMapEmpty!59752 () Bool)

(declare-fun mapDefault!59752 () ValueCell!18422)

(assert (=> mapNonEmpty!59743 (= condMapEmpty!59752 (= mapRest!59743 ((as const (Array (_ BitVec 32) ValueCell!18422)) mapDefault!59752)))))

(declare-fun e!872244 () Bool)

(declare-fun mapRes!59752 () Bool)

(assert (=> mapNonEmpty!59743 (= tp!113690 (and e!872244 mapRes!59752))))

(declare-fun b!1564919 () Bool)

(assert (=> b!1564919 (= e!872244 tp_is_empty!38905)))

(declare-fun mapIsEmpty!59752 () Bool)

(assert (=> mapIsEmpty!59752 mapRes!59752))

(declare-fun b!1564918 () Bool)

(declare-fun e!872245 () Bool)

(assert (=> b!1564918 (= e!872245 tp_is_empty!38905)))

(declare-fun mapNonEmpty!59752 () Bool)

(declare-fun tp!113705 () Bool)

(assert (=> mapNonEmpty!59752 (= mapRes!59752 (and tp!113705 e!872245))))

(declare-fun mapRest!59752 () (Array (_ BitVec 32) ValueCell!18422))

(declare-fun mapValue!59752 () ValueCell!18422)

(declare-fun mapKey!59752 () (_ BitVec 32))

(assert (=> mapNonEmpty!59752 (= mapRest!59743 (store mapRest!59752 mapKey!59752 mapValue!59752))))

(assert (= (and mapNonEmpty!59743 condMapEmpty!59752) mapIsEmpty!59752))

(assert (= (and mapNonEmpty!59743 (not condMapEmpty!59752)) mapNonEmpty!59752))

(assert (= (and mapNonEmpty!59752 ((_ is ValueCellFull!18422) mapValue!59752)) b!1564918))

(assert (= (and mapNonEmpty!59743 ((_ is ValueCellFull!18422) mapDefault!59752)) b!1564919))

(declare-fun m!1439277 () Bool)

(assert (=> mapNonEmpty!59752 m!1439277))

(declare-fun b_lambda!24927 () Bool)

(assert (= b_lambda!24923 (or (and start!133820 b_free!32131) b_lambda!24927)))

(declare-fun b_lambda!24929 () Bool)

(assert (= b_lambda!24925 (or (and start!133820 b_free!32131) b_lambda!24929)))

(check-sat (not b!1564893) (not bm!71832) (not b!1564880) (not b!1564911) (not b!1564872) (not b!1564874) (not d!162909) (not b!1564895) (not b!1564881) (not b!1564879) (not b!1564877) (not b!1564878) (not bm!71835) (not mapNonEmpty!59752) (not b!1564876) (not b!1564908) (not b_lambda!24927) (not b_next!32131) (not b!1564907) (not bm!71829) tp_is_empty!38905 (not b!1564846) b_and!51691 (not b_lambda!24929) (not d!162907) (not b!1564844))
(check-sat b_and!51691 (not b_next!32131))
