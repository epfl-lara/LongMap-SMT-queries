; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99586 () Bool)

(assert start!99586)

(declare-fun b_free!25171 () Bool)

(declare-fun b_next!25171 () Bool)

(assert (=> start!99586 (= b_free!25171 (not b_next!25171))))

(declare-fun tp!88227 () Bool)

(declare-fun b_and!41187 () Bool)

(assert (=> start!99586 (= tp!88227 b_and!41187)))

(declare-fun mapNonEmpty!46379 () Bool)

(declare-fun mapRes!46379 () Bool)

(declare-fun tp!88226 () Bool)

(declare-fun e!670432 () Bool)

(assert (=> mapNonEmpty!46379 (= mapRes!46379 (and tp!88226 e!670432))))

(declare-datatypes ((V!44729 0))(
  ( (V!44730 (val!14907 Int)) )
))
(declare-datatypes ((ValueCell!14141 0))(
  ( (ValueCellFull!14141 (v!17544 V!44729)) (EmptyCell!14141) )
))
(declare-fun mapRest!46379 () (Array (_ BitVec 32) ValueCell!14141))

(declare-fun mapValue!46379 () ValueCell!14141)

(declare-datatypes ((array!76140 0))(
  ( (array!76141 (arr!36720 (Array (_ BitVec 32) ValueCell!14141)) (size!37258 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76140)

(declare-fun mapKey!46379 () (_ BitVec 32))

(assert (=> mapNonEmpty!46379 (= (arr!36720 _values!996) (store mapRest!46379 mapKey!46379 mapValue!46379))))

(declare-datatypes ((tuple2!19192 0))(
  ( (tuple2!19193 (_1!9607 (_ BitVec 64)) (_2!9607 V!44729)) )
))
(declare-datatypes ((List!25900 0))(
  ( (Nil!25897) (Cons!25896 (h!27105 tuple2!19192) (t!38054 List!25900)) )
))
(declare-datatypes ((ListLongMap!17161 0))(
  ( (ListLongMap!17162 (toList!8596 List!25900)) )
))
(declare-fun lt!532823 () ListLongMap!17161)

(declare-fun lt!532832 () tuple2!19192)

(declare-fun b!1179276 () Bool)

(declare-fun lt!532826 () ListLongMap!17161)

(declare-fun e!670436 () Bool)

(declare-fun +!3896 (ListLongMap!17161 tuple2!19192) ListLongMap!17161)

(assert (=> b!1179276 (= e!670436 (= lt!532826 (+!3896 lt!532823 lt!532832)))))

(declare-fun b!1179277 () Bool)

(declare-fun e!670435 () Bool)

(declare-fun e!670443 () Bool)

(assert (=> b!1179277 (= e!670435 e!670443)))

(declare-fun res!783508 () Bool)

(assert (=> b!1179277 (=> res!783508 e!670443)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179277 (= res!783508 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!532834 () array!76140)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532822 () ListLongMap!17161)

(declare-fun minValue!944 () V!44729)

(declare-datatypes ((array!76142 0))(
  ( (array!76143 (arr!36721 (Array (_ BitVec 32) (_ BitVec 64))) (size!37259 (_ BitVec 32))) )
))
(declare-fun lt!532827 () array!76142)

(declare-fun zeroValue!944 () V!44729)

(declare-fun getCurrentListMapNoExtraKeys!5056 (array!76142 array!76140 (_ BitVec 32) (_ BitVec 32) V!44729 V!44729 (_ BitVec 32) Int) ListLongMap!17161)

(assert (=> b!1179277 (= lt!532822 (getCurrentListMapNoExtraKeys!5056 lt!532827 lt!532834 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532831 () V!44729)

(assert (=> b!1179277 (= lt!532834 (array!76141 (store (arr!36720 _values!996) i!673 (ValueCellFull!14141 lt!532831)) (size!37258 _values!996)))))

(declare-fun dynLambda!2969 (Int (_ BitVec 64)) V!44729)

(assert (=> b!1179277 (= lt!532831 (dynLambda!2969 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76142)

(assert (=> b!1179277 (= lt!532826 (getCurrentListMapNoExtraKeys!5056 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179278 () Bool)

(declare-datatypes ((Unit!38822 0))(
  ( (Unit!38823) )
))
(declare-fun e!670441 () Unit!38822)

(declare-fun Unit!38824 () Unit!38822)

(assert (=> b!1179278 (= e!670441 Unit!38824)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!532835 () Unit!38822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76142 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38822)

(assert (=> b!1179278 (= lt!532835 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179278 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532830 () Unit!38822)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76142 (_ BitVec 32) (_ BitVec 32)) Unit!38822)

(assert (=> b!1179278 (= lt!532830 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25901 0))(
  ( (Nil!25898) (Cons!25897 (h!27106 (_ BitVec 64)) (t!38055 List!25901)) )
))
(declare-fun arrayNoDuplicates!0 (array!76142 (_ BitVec 32) List!25901) Bool)

(assert (=> b!1179278 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25898)))

(declare-fun lt!532829 () Unit!38822)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76142 (_ BitVec 64) (_ BitVec 32) List!25901) Unit!38822)

(assert (=> b!1179278 (= lt!532829 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25898))))

(assert (=> b!1179278 false))

(declare-fun b!1179280 () Bool)

(declare-fun res!783499 () Bool)

(declare-fun e!670438 () Bool)

(assert (=> b!1179280 (=> (not res!783499) (not e!670438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179280 (= res!783499 (validMask!0 mask!1564))))

(declare-fun b!1179281 () Bool)

(declare-fun e!670437 () Bool)

(assert (=> b!1179281 (= e!670438 e!670437)))

(declare-fun res!783510 () Bool)

(assert (=> b!1179281 (=> (not res!783510) (not e!670437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76142 (_ BitVec 32)) Bool)

(assert (=> b!1179281 (= res!783510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532827 mask!1564))))

(assert (=> b!1179281 (= lt!532827 (array!76143 (store (arr!36721 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37259 _keys!1208)))))

(declare-fun b!1179282 () Bool)

(declare-fun e!670439 () Bool)

(assert (=> b!1179282 (= e!670439 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179283 () Bool)

(declare-fun res!783509 () Bool)

(assert (=> b!1179283 (=> (not res!783509) (not e!670438))))

(assert (=> b!1179283 (= res!783509 (= (select (arr!36721 _keys!1208) i!673) k0!934))))

(declare-fun b!1179284 () Bool)

(declare-fun res!783500 () Bool)

(assert (=> b!1179284 (=> (not res!783500) (not e!670437))))

(assert (=> b!1179284 (= res!783500 (arrayNoDuplicates!0 lt!532827 #b00000000000000000000000000000000 Nil!25898))))

(declare-fun b!1179285 () Bool)

(declare-fun e!670442 () Bool)

(declare-fun e!670444 () Bool)

(assert (=> b!1179285 (= e!670442 (and e!670444 mapRes!46379))))

(declare-fun condMapEmpty!46379 () Bool)

(declare-fun mapDefault!46379 () ValueCell!14141)

(assert (=> b!1179285 (= condMapEmpty!46379 (= (arr!36720 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14141)) mapDefault!46379)))))

(declare-fun b!1179286 () Bool)

(declare-fun res!783506 () Bool)

(assert (=> b!1179286 (=> (not res!783506) (not e!670438))))

(assert (=> b!1179286 (= res!783506 (and (= (size!37258 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37259 _keys!1208) (size!37258 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179287 () Bool)

(declare-fun e!670434 () Bool)

(assert (=> b!1179287 (= e!670434 e!670439)))

(declare-fun res!783502 () Bool)

(assert (=> b!1179287 (=> res!783502 e!670439)))

(assert (=> b!1179287 (= res!783502 (not (= (select (arr!36721 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179288 () Bool)

(declare-fun res!783504 () Bool)

(assert (=> b!1179288 (=> (not res!783504) (not e!670438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179288 (= res!783504 (validKeyInArray!0 k0!934))))

(declare-fun b!1179289 () Bool)

(assert (=> b!1179289 (= e!670437 (not e!670435))))

(declare-fun res!783498 () Bool)

(assert (=> b!1179289 (=> res!783498 e!670435)))

(assert (=> b!1179289 (= res!783498 (bvsgt from!1455 i!673))))

(assert (=> b!1179289 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532824 () Unit!38822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76142 (_ BitVec 64) (_ BitVec 32)) Unit!38822)

(assert (=> b!1179289 (= lt!532824 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179290 () Bool)

(declare-fun tp_is_empty!29701 () Bool)

(assert (=> b!1179290 (= e!670432 tp_is_empty!29701)))

(declare-fun b!1179291 () Bool)

(declare-fun e!670433 () Bool)

(assert (=> b!1179291 (= e!670443 e!670433)))

(declare-fun res!783501 () Bool)

(assert (=> b!1179291 (=> res!783501 e!670433)))

(assert (=> b!1179291 (= res!783501 (not (validKeyInArray!0 (select (arr!36721 _keys!1208) from!1455))))))

(declare-fun lt!532836 () ListLongMap!17161)

(declare-fun lt!532825 () ListLongMap!17161)

(assert (=> b!1179291 (= lt!532836 lt!532825)))

(declare-fun -!1562 (ListLongMap!17161 (_ BitVec 64)) ListLongMap!17161)

(assert (=> b!1179291 (= lt!532825 (-!1562 lt!532823 k0!934))))

(assert (=> b!1179291 (= lt!532836 (getCurrentListMapNoExtraKeys!5056 lt!532827 lt!532834 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179291 (= lt!532823 (getCurrentListMapNoExtraKeys!5056 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532833 () Unit!38822)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!826 (array!76142 array!76140 (_ BitVec 32) (_ BitVec 32) V!44729 V!44729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38822)

(assert (=> b!1179291 (= lt!532833 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46379 () Bool)

(assert (=> mapIsEmpty!46379 mapRes!46379))

(declare-fun b!1179292 () Bool)

(declare-fun res!783503 () Bool)

(assert (=> b!1179292 (=> (not res!783503) (not e!670438))))

(assert (=> b!1179292 (= res!783503 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37259 _keys!1208))))))

(declare-fun res!783511 () Bool)

(assert (=> start!99586 (=> (not res!783511) (not e!670438))))

(assert (=> start!99586 (= res!783511 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37259 _keys!1208))))))

(assert (=> start!99586 e!670438))

(assert (=> start!99586 tp_is_empty!29701))

(declare-fun array_inv!28148 (array!76142) Bool)

(assert (=> start!99586 (array_inv!28148 _keys!1208)))

(assert (=> start!99586 true))

(assert (=> start!99586 tp!88227))

(declare-fun array_inv!28149 (array!76140) Bool)

(assert (=> start!99586 (and (array_inv!28149 _values!996) e!670442)))

(declare-fun b!1179279 () Bool)

(declare-fun res!783505 () Bool)

(assert (=> b!1179279 (=> (not res!783505) (not e!670438))))

(assert (=> b!1179279 (= res!783505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179293 () Bool)

(declare-fun res!783507 () Bool)

(assert (=> b!1179293 (=> (not res!783507) (not e!670438))))

(assert (=> b!1179293 (= res!783507 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25898))))

(declare-fun b!1179294 () Bool)

(declare-fun Unit!38825 () Unit!38822)

(assert (=> b!1179294 (= e!670441 Unit!38825)))

(declare-fun b!1179295 () Bool)

(assert (=> b!1179295 (= e!670444 tp_is_empty!29701)))

(declare-fun b!1179296 () Bool)

(assert (=> b!1179296 (= e!670433 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37259 _keys!1208))))))

(assert (=> b!1179296 e!670436))

(declare-fun res!783496 () Bool)

(assert (=> b!1179296 (=> (not res!783496) (not e!670436))))

(assert (=> b!1179296 (= res!783496 (not (= (select (arr!36721 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532828 () Unit!38822)

(assert (=> b!1179296 (= lt!532828 e!670441)))

(declare-fun c!116854 () Bool)

(assert (=> b!1179296 (= c!116854 (= (select (arr!36721 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179296 e!670434))

(declare-fun res!783497 () Bool)

(assert (=> b!1179296 (=> (not res!783497) (not e!670434))))

(assert (=> b!1179296 (= res!783497 (= lt!532822 (+!3896 lt!532825 lt!532832)))))

(declare-fun get!18778 (ValueCell!14141 V!44729) V!44729)

(assert (=> b!1179296 (= lt!532832 (tuple2!19193 (select (arr!36721 _keys!1208) from!1455) (get!18778 (select (arr!36720 _values!996) from!1455) lt!532831)))))

(assert (= (and start!99586 res!783511) b!1179280))

(assert (= (and b!1179280 res!783499) b!1179286))

(assert (= (and b!1179286 res!783506) b!1179279))

(assert (= (and b!1179279 res!783505) b!1179293))

(assert (= (and b!1179293 res!783507) b!1179292))

(assert (= (and b!1179292 res!783503) b!1179288))

(assert (= (and b!1179288 res!783504) b!1179283))

(assert (= (and b!1179283 res!783509) b!1179281))

(assert (= (and b!1179281 res!783510) b!1179284))

(assert (= (and b!1179284 res!783500) b!1179289))

(assert (= (and b!1179289 (not res!783498)) b!1179277))

(assert (= (and b!1179277 (not res!783508)) b!1179291))

(assert (= (and b!1179291 (not res!783501)) b!1179296))

(assert (= (and b!1179296 res!783497) b!1179287))

(assert (= (and b!1179287 (not res!783502)) b!1179282))

(assert (= (and b!1179296 c!116854) b!1179278))

(assert (= (and b!1179296 (not c!116854)) b!1179294))

(assert (= (and b!1179296 res!783496) b!1179276))

(assert (= (and b!1179285 condMapEmpty!46379) mapIsEmpty!46379))

(assert (= (and b!1179285 (not condMapEmpty!46379)) mapNonEmpty!46379))

(get-info :version)

(assert (= (and mapNonEmpty!46379 ((_ is ValueCellFull!14141) mapValue!46379)) b!1179290))

(assert (= (and b!1179285 ((_ is ValueCellFull!14141) mapDefault!46379)) b!1179295))

(assert (= start!99586 b!1179285))

(declare-fun b_lambda!20297 () Bool)

(assert (=> (not b_lambda!20297) (not b!1179277)))

(declare-fun t!38053 () Bool)

(declare-fun tb!9975 () Bool)

(assert (=> (and start!99586 (= defaultEntry!1004 defaultEntry!1004) t!38053) tb!9975))

(declare-fun result!20525 () Bool)

(assert (=> tb!9975 (= result!20525 tp_is_empty!29701)))

(assert (=> b!1179277 t!38053))

(declare-fun b_and!41189 () Bool)

(assert (= b_and!41187 (and (=> t!38053 result!20525) b_and!41189)))

(declare-fun m!1086767 () Bool)

(assert (=> b!1179281 m!1086767))

(declare-fun m!1086769 () Bool)

(assert (=> b!1179281 m!1086769))

(declare-fun m!1086771 () Bool)

(assert (=> b!1179280 m!1086771))

(declare-fun m!1086773 () Bool)

(assert (=> b!1179287 m!1086773))

(declare-fun m!1086775 () Bool)

(assert (=> start!99586 m!1086775))

(declare-fun m!1086777 () Bool)

(assert (=> start!99586 m!1086777))

(declare-fun m!1086779 () Bool)

(assert (=> b!1179293 m!1086779))

(declare-fun m!1086781 () Bool)

(assert (=> b!1179288 m!1086781))

(declare-fun m!1086783 () Bool)

(assert (=> b!1179282 m!1086783))

(declare-fun m!1086785 () Bool)

(assert (=> b!1179289 m!1086785))

(declare-fun m!1086787 () Bool)

(assert (=> b!1179289 m!1086787))

(declare-fun m!1086789 () Bool)

(assert (=> b!1179284 m!1086789))

(declare-fun m!1086791 () Bool)

(assert (=> b!1179279 m!1086791))

(declare-fun m!1086793 () Bool)

(assert (=> b!1179291 m!1086793))

(declare-fun m!1086795 () Bool)

(assert (=> b!1179291 m!1086795))

(declare-fun m!1086797 () Bool)

(assert (=> b!1179291 m!1086797))

(declare-fun m!1086799 () Bool)

(assert (=> b!1179291 m!1086799))

(assert (=> b!1179291 m!1086773))

(declare-fun m!1086801 () Bool)

(assert (=> b!1179291 m!1086801))

(assert (=> b!1179291 m!1086773))

(declare-fun m!1086803 () Bool)

(assert (=> mapNonEmpty!46379 m!1086803))

(declare-fun m!1086805 () Bool)

(assert (=> b!1179276 m!1086805))

(assert (=> b!1179296 m!1086773))

(declare-fun m!1086807 () Bool)

(assert (=> b!1179296 m!1086807))

(declare-fun m!1086809 () Bool)

(assert (=> b!1179296 m!1086809))

(assert (=> b!1179296 m!1086809))

(declare-fun m!1086811 () Bool)

(assert (=> b!1179296 m!1086811))

(declare-fun m!1086813 () Bool)

(assert (=> b!1179278 m!1086813))

(declare-fun m!1086815 () Bool)

(assert (=> b!1179278 m!1086815))

(declare-fun m!1086817 () Bool)

(assert (=> b!1179278 m!1086817))

(declare-fun m!1086819 () Bool)

(assert (=> b!1179278 m!1086819))

(declare-fun m!1086821 () Bool)

(assert (=> b!1179278 m!1086821))

(declare-fun m!1086823 () Bool)

(assert (=> b!1179277 m!1086823))

(declare-fun m!1086825 () Bool)

(assert (=> b!1179277 m!1086825))

(declare-fun m!1086827 () Bool)

(assert (=> b!1179277 m!1086827))

(declare-fun m!1086829 () Bool)

(assert (=> b!1179277 m!1086829))

(declare-fun m!1086831 () Bool)

(assert (=> b!1179283 m!1086831))

(check-sat (not b!1179296) (not b!1179293) (not b!1179284) (not b!1179291) (not b!1179289) (not b!1179279) b_and!41189 (not b!1179278) (not b!1179276) (not start!99586) (not b!1179280) (not b!1179281) (not b!1179277) (not mapNonEmpty!46379) (not b!1179288) (not b!1179282) (not b_lambda!20297) (not b_next!25171) tp_is_empty!29701)
(check-sat b_and!41189 (not b_next!25171))
