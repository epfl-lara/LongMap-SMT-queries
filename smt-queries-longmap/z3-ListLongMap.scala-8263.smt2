; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100520 () Bool)

(assert start!100520)

(declare-fun b_free!25849 () Bool)

(declare-fun b_next!25849 () Bool)

(assert (=> start!100520 (= b_free!25849 (not b_next!25849))))

(declare-fun tp!90537 () Bool)

(declare-fun b_and!42563 () Bool)

(assert (=> start!100520 (= tp!90537 b_and!42563)))

(declare-fun bm!57362 () Bool)

(declare-datatypes ((V!45865 0))(
  ( (V!45866 (val!15333 Int)) )
))
(declare-datatypes ((tuple2!19722 0))(
  ( (tuple2!19723 (_1!9872 (_ BitVec 64)) (_2!9872 V!45865)) )
))
(declare-datatypes ((List!26511 0))(
  ( (Nil!26508) (Cons!26507 (h!27716 tuple2!19722) (t!39331 List!26511)) )
))
(declare-datatypes ((ListLongMap!17691 0))(
  ( (ListLongMap!17692 (toList!8861 List!26511)) )
))
(declare-fun call!57366 () ListLongMap!17691)

(declare-fun lt!544188 () ListLongMap!17691)

(declare-fun zeroValue!944 () V!45865)

(declare-fun c!117467 () Bool)

(declare-fun c!117465 () Bool)

(declare-fun minValue!944 () V!45865)

(declare-fun +!3999 (ListLongMap!17691 tuple2!19722) ListLongMap!17691)

(assert (=> bm!57362 (= call!57366 (+!3999 lt!544188 (ite (or c!117465 c!117467) (tuple2!19723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1201167 () Bool)

(declare-fun res!799625 () Bool)

(declare-fun e!682104 () Bool)

(assert (=> b!1201167 (=> (not res!799625) (not e!682104))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201167 (= res!799625 (validMask!0 mask!1564))))

(declare-fun res!799636 () Bool)

(assert (=> start!100520 (=> (not res!799636) (not e!682104))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77804 0))(
  ( (array!77805 (arr!37547 (Array (_ BitVec 32) (_ BitVec 64))) (size!38085 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77804)

(assert (=> start!100520 (= res!799636 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38085 _keys!1208))))))

(assert (=> start!100520 e!682104))

(declare-fun tp_is_empty!30553 () Bool)

(assert (=> start!100520 tp_is_empty!30553))

(declare-fun array_inv!28722 (array!77804) Bool)

(assert (=> start!100520 (array_inv!28722 _keys!1208)))

(assert (=> start!100520 true))

(assert (=> start!100520 tp!90537))

(declare-datatypes ((ValueCell!14567 0))(
  ( (ValueCellFull!14567 (v!17970 V!45865)) (EmptyCell!14567) )
))
(declare-datatypes ((array!77806 0))(
  ( (array!77807 (arr!37548 (Array (_ BitVec 32) ValueCell!14567)) (size!38086 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77806)

(declare-fun e!682109 () Bool)

(declare-fun array_inv!28723 (array!77806) Bool)

(assert (=> start!100520 (and (array_inv!28723 _values!996) e!682109)))

(declare-fun b!1201168 () Bool)

(declare-fun e!682111 () Bool)

(declare-fun mapRes!47672 () Bool)

(assert (=> b!1201168 (= e!682109 (and e!682111 mapRes!47672))))

(declare-fun condMapEmpty!47672 () Bool)

(declare-fun mapDefault!47672 () ValueCell!14567)

(assert (=> b!1201168 (= condMapEmpty!47672 (= (arr!37548 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14567)) mapDefault!47672)))))

(declare-fun bm!57363 () Bool)

(declare-fun call!57369 () Bool)

(declare-fun call!57372 () Bool)

(assert (=> bm!57363 (= call!57369 call!57372)))

(declare-fun b!1201169 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!57370 () ListLongMap!17691)

(declare-fun call!57371 () ListLongMap!17691)

(declare-fun e!682099 () Bool)

(declare-fun -!1759 (ListLongMap!17691 (_ BitVec 64)) ListLongMap!17691)

(assert (=> b!1201169 (= e!682099 (= call!57370 (-!1759 call!57371 k0!934)))))

(declare-fun b!1201170 () Bool)

(declare-fun e!682101 () Bool)

(declare-fun e!682107 () Bool)

(assert (=> b!1201170 (= e!682101 e!682107)))

(declare-fun res!799635 () Bool)

(assert (=> b!1201170 (=> res!799635 e!682107)))

(assert (=> b!1201170 (= res!799635 (not (= (select (arr!37547 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201170 e!682099))

(declare-fun c!117468 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201170 (= c!117468 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!39681 0))(
  ( (Unit!39682) )
))
(declare-fun lt!544182 () Unit!39681)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1009 (array!77804 array!77806 (_ BitVec 32) (_ BitVec 32) V!45865 V!45865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39681)

(assert (=> b!1201170 (= lt!544182 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1009 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47672 () Bool)

(declare-fun tp!90536 () Bool)

(declare-fun e!682106 () Bool)

(assert (=> mapNonEmpty!47672 (= mapRes!47672 (and tp!90536 e!682106))))

(declare-fun mapRest!47672 () (Array (_ BitVec 32) ValueCell!14567))

(declare-fun mapValue!47672 () ValueCell!14567)

(declare-fun mapKey!47672 () (_ BitVec 32))

(assert (=> mapNonEmpty!47672 (= (arr!37548 _values!996) (store mapRest!47672 mapKey!47672 mapValue!47672))))

(declare-fun b!1201171 () Bool)

(declare-fun e!682102 () Bool)

(assert (=> b!1201171 (= e!682102 e!682101)))

(declare-fun res!799637 () Bool)

(assert (=> b!1201171 (=> res!799637 e!682101)))

(assert (=> b!1201171 (= res!799637 (not (= from!1455 i!673)))))

(declare-fun lt!544185 () array!77806)

(declare-fun lt!544181 () array!77804)

(declare-fun lt!544187 () ListLongMap!17691)

(declare-fun getCurrentListMapNoExtraKeys!5309 (array!77804 array!77806 (_ BitVec 32) (_ BitVec 32) V!45865 V!45865 (_ BitVec 32) Int) ListLongMap!17691)

(assert (=> b!1201171 (= lt!544187 (getCurrentListMapNoExtraKeys!5309 lt!544181 lt!544185 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3186 (Int (_ BitVec 64)) V!45865)

(assert (=> b!1201171 (= lt!544185 (array!77807 (store (arr!37548 _values!996) i!673 (ValueCellFull!14567 (dynLambda!3186 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38086 _values!996)))))

(declare-fun lt!544184 () ListLongMap!17691)

(assert (=> b!1201171 (= lt!544184 (getCurrentListMapNoExtraKeys!5309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201172 () Bool)

(declare-fun c!117466 () Bool)

(declare-fun lt!544179 () Bool)

(assert (=> b!1201172 (= c!117466 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544179))))

(declare-fun e!682103 () Unit!39681)

(declare-fun e!682108 () Unit!39681)

(assert (=> b!1201172 (= e!682103 e!682108)))

(declare-fun b!1201173 () Bool)

(assert (=> b!1201173 (= e!682106 tp_is_empty!30553)))

(declare-fun b!1201174 () Bool)

(assert (=> b!1201174 (= e!682099 (= call!57370 call!57371))))

(declare-fun bm!57364 () Bool)

(declare-fun call!57365 () Unit!39681)

(declare-fun call!57368 () Unit!39681)

(assert (=> bm!57364 (= call!57365 call!57368)))

(declare-fun b!1201175 () Bool)

(declare-fun res!799628 () Bool)

(assert (=> b!1201175 (=> (not res!799628) (not e!682104))))

(assert (=> b!1201175 (= res!799628 (= (select (arr!37547 _keys!1208) i!673) k0!934))))

(declare-fun b!1201176 () Bool)

(declare-fun res!799638 () Bool)

(assert (=> b!1201176 (=> (not res!799638) (not e!682104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77804 (_ BitVec 32)) Bool)

(assert (=> b!1201176 (= res!799638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57365 () Bool)

(assert (=> bm!57365 (= call!57370 (getCurrentListMapNoExtraKeys!5309 lt!544181 lt!544185 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201177 () Bool)

(declare-fun lt!544190 () Unit!39681)

(assert (=> b!1201177 (= e!682108 lt!544190)))

(assert (=> b!1201177 (= lt!544190 call!57365)))

(assert (=> b!1201177 call!57369))

(declare-fun bm!57366 () Bool)

(assert (=> bm!57366 (= call!57371 (getCurrentListMapNoExtraKeys!5309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201178 () Bool)

(declare-fun res!799626 () Bool)

(assert (=> b!1201178 (=> (not res!799626) (not e!682104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201178 (= res!799626 (validKeyInArray!0 k0!934))))

(declare-fun b!1201179 () Bool)

(declare-fun res!799632 () Bool)

(assert (=> b!1201179 (=> (not res!799632) (not e!682104))))

(assert (=> b!1201179 (= res!799632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38085 _keys!1208))))))

(declare-fun mapIsEmpty!47672 () Bool)

(assert (=> mapIsEmpty!47672 mapRes!47672))

(declare-fun b!1201180 () Bool)

(declare-fun Unit!39683 () Unit!39681)

(assert (=> b!1201180 (= e!682108 Unit!39683)))

(declare-fun b!1201181 () Bool)

(declare-fun res!799630 () Bool)

(declare-fun e!682098 () Bool)

(assert (=> b!1201181 (=> (not res!799630) (not e!682098))))

(declare-datatypes ((List!26512 0))(
  ( (Nil!26509) (Cons!26508 (h!27717 (_ BitVec 64)) (t!39332 List!26512)) )
))
(declare-fun arrayNoDuplicates!0 (array!77804 (_ BitVec 32) List!26512) Bool)

(assert (=> b!1201181 (= res!799630 (arrayNoDuplicates!0 lt!544181 #b00000000000000000000000000000000 Nil!26509))))

(declare-fun b!1201182 () Bool)

(declare-fun e!682100 () Unit!39681)

(assert (=> b!1201182 (= e!682100 e!682103)))

(assert (=> b!1201182 (= c!117467 (and (not lt!544179) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!544192 () ListLongMap!17691)

(declare-fun bm!57367 () Bool)

(declare-fun addStillContains!983 (ListLongMap!17691 (_ BitVec 64) V!45865 (_ BitVec 64)) Unit!39681)

(assert (=> bm!57367 (= call!57368 (addStillContains!983 (ite c!117465 lt!544192 lt!544188) (ite c!117465 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117467 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117465 minValue!944 (ite c!117467 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1201183 () Bool)

(declare-fun e!682110 () Bool)

(assert (=> b!1201183 (= e!682110 true)))

(declare-fun lt!544191 () Unit!39681)

(assert (=> b!1201183 (= lt!544191 e!682100)))

(assert (=> b!1201183 (= c!117465 (and (not lt!544179) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201183 (= lt!544179 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201184 () Bool)

(assert (=> b!1201184 (= e!682111 tp_is_empty!30553)))

(declare-fun bm!57368 () Bool)

(declare-fun call!57367 () ListLongMap!17691)

(assert (=> bm!57368 (= call!57367 call!57366)))

(declare-fun b!1201185 () Bool)

(assert (=> b!1201185 (= e!682098 (not e!682102))))

(declare-fun res!799631 () Bool)

(assert (=> b!1201185 (=> res!799631 e!682102)))

(assert (=> b!1201185 (= res!799631 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201185 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544189 () Unit!39681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77804 (_ BitVec 64) (_ BitVec 32)) Unit!39681)

(assert (=> b!1201185 (= lt!544189 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201186 () Bool)

(declare-fun res!799634 () Bool)

(assert (=> b!1201186 (=> (not res!799634) (not e!682104))))

(assert (=> b!1201186 (= res!799634 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26509))))

(declare-fun b!1201187 () Bool)

(declare-fun lt!544180 () Unit!39681)

(assert (=> b!1201187 (= e!682100 lt!544180)))

(declare-fun lt!544186 () Unit!39681)

(assert (=> b!1201187 (= lt!544186 (addStillContains!983 lt!544188 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1201187 (= lt!544192 call!57366)))

(assert (=> b!1201187 call!57372))

(assert (=> b!1201187 (= lt!544180 call!57368)))

(declare-fun contains!6856 (ListLongMap!17691 (_ BitVec 64)) Bool)

(assert (=> b!1201187 (contains!6856 (+!3999 lt!544192 (tuple2!19723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!57369 () Bool)

(assert (=> bm!57369 (= call!57372 (contains!6856 (ite c!117465 lt!544192 call!57367) k0!934))))

(declare-fun b!1201188 () Bool)

(assert (=> b!1201188 call!57369))

(declare-fun lt!544183 () Unit!39681)

(assert (=> b!1201188 (= lt!544183 call!57365)))

(assert (=> b!1201188 (= e!682103 lt!544183)))

(declare-fun b!1201189 () Bool)

(declare-fun res!799633 () Bool)

(assert (=> b!1201189 (=> (not res!799633) (not e!682104))))

(assert (=> b!1201189 (= res!799633 (and (= (size!38086 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38085 _keys!1208) (size!38086 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201190 () Bool)

(assert (=> b!1201190 (= e!682104 e!682098)))

(declare-fun res!799629 () Bool)

(assert (=> b!1201190 (=> (not res!799629) (not e!682098))))

(assert (=> b!1201190 (= res!799629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544181 mask!1564))))

(assert (=> b!1201190 (= lt!544181 (array!77805 (store (arr!37547 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38085 _keys!1208)))))

(declare-fun b!1201191 () Bool)

(assert (=> b!1201191 (= e!682107 e!682110)))

(declare-fun res!799627 () Bool)

(assert (=> b!1201191 (=> res!799627 e!682110)))

(assert (=> b!1201191 (= res!799627 (not (contains!6856 lt!544188 k0!934)))))

(assert (=> b!1201191 (= lt!544188 (getCurrentListMapNoExtraKeys!5309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100520 res!799636) b!1201167))

(assert (= (and b!1201167 res!799625) b!1201189))

(assert (= (and b!1201189 res!799633) b!1201176))

(assert (= (and b!1201176 res!799638) b!1201186))

(assert (= (and b!1201186 res!799634) b!1201179))

(assert (= (and b!1201179 res!799632) b!1201178))

(assert (= (and b!1201178 res!799626) b!1201175))

(assert (= (and b!1201175 res!799628) b!1201190))

(assert (= (and b!1201190 res!799629) b!1201181))

(assert (= (and b!1201181 res!799630) b!1201185))

(assert (= (and b!1201185 (not res!799631)) b!1201171))

(assert (= (and b!1201171 (not res!799637)) b!1201170))

(assert (= (and b!1201170 c!117468) b!1201169))

(assert (= (and b!1201170 (not c!117468)) b!1201174))

(assert (= (or b!1201169 b!1201174) bm!57365))

(assert (= (or b!1201169 b!1201174) bm!57366))

(assert (= (and b!1201170 (not res!799635)) b!1201191))

(assert (= (and b!1201191 (not res!799627)) b!1201183))

(assert (= (and b!1201183 c!117465) b!1201187))

(assert (= (and b!1201183 (not c!117465)) b!1201182))

(assert (= (and b!1201182 c!117467) b!1201188))

(assert (= (and b!1201182 (not c!117467)) b!1201172))

(assert (= (and b!1201172 c!117466) b!1201177))

(assert (= (and b!1201172 (not c!117466)) b!1201180))

(assert (= (or b!1201188 b!1201177) bm!57364))

(assert (= (or b!1201188 b!1201177) bm!57368))

(assert (= (or b!1201188 b!1201177) bm!57363))

(assert (= (or b!1201187 bm!57363) bm!57369))

(assert (= (or b!1201187 bm!57364) bm!57367))

(assert (= (or b!1201187 bm!57368) bm!57362))

(assert (= (and b!1201168 condMapEmpty!47672) mapIsEmpty!47672))

(assert (= (and b!1201168 (not condMapEmpty!47672)) mapNonEmpty!47672))

(get-info :version)

(assert (= (and mapNonEmpty!47672 ((_ is ValueCellFull!14567) mapValue!47672)) b!1201173))

(assert (= (and b!1201168 ((_ is ValueCellFull!14567) mapDefault!47672)) b!1201184))

(assert (= start!100520 b!1201168))

(declare-fun b_lambda!21027 () Bool)

(assert (=> (not b_lambda!21027) (not b!1201171)))

(declare-fun t!39330 () Bool)

(declare-fun tb!10641 () Bool)

(assert (=> (and start!100520 (= defaultEntry!1004 defaultEntry!1004) t!39330) tb!10641))

(declare-fun result!21867 () Bool)

(assert (=> tb!10641 (= result!21867 tp_is_empty!30553)))

(assert (=> b!1201171 t!39330))

(declare-fun b_and!42565 () Bool)

(assert (= b_and!42563 (and (=> t!39330 result!21867) b_and!42565)))

(declare-fun m!1106823 () Bool)

(assert (=> b!1201185 m!1106823))

(declare-fun m!1106825 () Bool)

(assert (=> b!1201185 m!1106825))

(declare-fun m!1106827 () Bool)

(assert (=> bm!57366 m!1106827))

(declare-fun m!1106829 () Bool)

(assert (=> bm!57367 m!1106829))

(declare-fun m!1106831 () Bool)

(assert (=> b!1201167 m!1106831))

(declare-fun m!1106833 () Bool)

(assert (=> b!1201181 m!1106833))

(declare-fun m!1106835 () Bool)

(assert (=> b!1201191 m!1106835))

(assert (=> b!1201191 m!1106827))

(declare-fun m!1106837 () Bool)

(assert (=> b!1201175 m!1106837))

(declare-fun m!1106839 () Bool)

(assert (=> bm!57369 m!1106839))

(declare-fun m!1106841 () Bool)

(assert (=> b!1201169 m!1106841))

(declare-fun m!1106843 () Bool)

(assert (=> b!1201170 m!1106843))

(declare-fun m!1106845 () Bool)

(assert (=> b!1201170 m!1106845))

(declare-fun m!1106847 () Bool)

(assert (=> bm!57362 m!1106847))

(declare-fun m!1106849 () Bool)

(assert (=> b!1201178 m!1106849))

(declare-fun m!1106851 () Bool)

(assert (=> bm!57365 m!1106851))

(declare-fun m!1106853 () Bool)

(assert (=> b!1201171 m!1106853))

(declare-fun m!1106855 () Bool)

(assert (=> b!1201171 m!1106855))

(declare-fun m!1106857 () Bool)

(assert (=> b!1201171 m!1106857))

(declare-fun m!1106859 () Bool)

(assert (=> b!1201171 m!1106859))

(declare-fun m!1106861 () Bool)

(assert (=> mapNonEmpty!47672 m!1106861))

(declare-fun m!1106863 () Bool)

(assert (=> b!1201186 m!1106863))

(declare-fun m!1106865 () Bool)

(assert (=> b!1201187 m!1106865))

(declare-fun m!1106867 () Bool)

(assert (=> b!1201187 m!1106867))

(assert (=> b!1201187 m!1106867))

(declare-fun m!1106869 () Bool)

(assert (=> b!1201187 m!1106869))

(declare-fun m!1106871 () Bool)

(assert (=> b!1201176 m!1106871))

(declare-fun m!1106873 () Bool)

(assert (=> start!100520 m!1106873))

(declare-fun m!1106875 () Bool)

(assert (=> start!100520 m!1106875))

(declare-fun m!1106877 () Bool)

(assert (=> b!1201190 m!1106877))

(declare-fun m!1106879 () Bool)

(assert (=> b!1201190 m!1106879))

(check-sat (not b!1201185) (not bm!57367) (not start!100520) (not bm!57366) tp_is_empty!30553 (not mapNonEmpty!47672) (not b!1201181) b_and!42565 (not b!1201169) (not b!1201171) (not b_next!25849) (not b!1201186) (not bm!57365) (not b!1201190) (not b!1201167) (not b!1201178) (not b!1201170) (not b!1201176) (not b!1201187) (not bm!57362) (not bm!57369) (not b_lambda!21027) (not b!1201191))
(check-sat b_and!42565 (not b_next!25849))
