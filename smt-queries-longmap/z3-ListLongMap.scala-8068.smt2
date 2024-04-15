; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99268 () Bool)

(assert start!99268)

(declare-fun b_free!24853 () Bool)

(declare-fun b_next!24853 () Bool)

(assert (=> start!99268 (= b_free!24853 (not b_next!24853))))

(declare-fun tp!87272 () Bool)

(declare-fun b_and!40551 () Bool)

(assert (=> start!99268 (= tp!87272 b_and!40551)))

(declare-datatypes ((array!75514 0))(
  ( (array!75515 (arr!36407 (Array (_ BitVec 32) (_ BitVec 64))) (size!36945 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75514)

(declare-fun b!1169214 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!664516 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169214 (= e!664516 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169215 () Bool)

(declare-fun e!664514 () Bool)

(declare-fun tp_is_empty!29383 () Bool)

(assert (=> b!1169215 (= e!664514 tp_is_empty!29383)))

(declare-fun b!1169216 () Bool)

(declare-fun res!775826 () Bool)

(declare-fun e!664515 () Bool)

(assert (=> b!1169216 (=> (not res!775826) (not e!664515))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169216 (= res!775826 (validMask!0 mask!1564))))

(declare-fun b!1169217 () Bool)

(declare-fun res!775825 () Bool)

(assert (=> b!1169217 (=> (not res!775825) (not e!664515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169217 (= res!775825 (validKeyInArray!0 k0!934))))

(declare-fun b!1169218 () Bool)

(declare-fun res!775830 () Bool)

(assert (=> b!1169218 (=> (not res!775830) (not e!664515))))

(declare-datatypes ((List!25633 0))(
  ( (Nil!25630) (Cons!25629 (h!26838 (_ BitVec 64)) (t!37469 List!25633)) )
))
(declare-fun arrayNoDuplicates!0 (array!75514 (_ BitVec 32) List!25633) Bool)

(assert (=> b!1169218 (= res!775830 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25630))))

(declare-fun res!775824 () Bool)

(assert (=> start!99268 (=> (not res!775824) (not e!664515))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99268 (= res!775824 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36945 _keys!1208))))))

(assert (=> start!99268 e!664515))

(assert (=> start!99268 tp_is_empty!29383))

(declare-fun array_inv!27928 (array!75514) Bool)

(assert (=> start!99268 (array_inv!27928 _keys!1208)))

(assert (=> start!99268 true))

(assert (=> start!99268 tp!87272))

(declare-datatypes ((V!44305 0))(
  ( (V!44306 (val!14748 Int)) )
))
(declare-datatypes ((ValueCell!13982 0))(
  ( (ValueCellFull!13982 (v!17385 V!44305)) (EmptyCell!13982) )
))
(declare-datatypes ((array!75516 0))(
  ( (array!75517 (arr!36408 (Array (_ BitVec 32) ValueCell!13982)) (size!36946 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75516)

(declare-fun e!664508 () Bool)

(declare-fun array_inv!27929 (array!75516) Bool)

(assert (=> start!99268 (and (array_inv!27929 _values!996) e!664508)))

(declare-fun mapNonEmpty!45902 () Bool)

(declare-fun mapRes!45902 () Bool)

(declare-fun tp!87273 () Bool)

(assert (=> mapNonEmpty!45902 (= mapRes!45902 (and tp!87273 e!664514))))

(declare-fun mapRest!45902 () (Array (_ BitVec 32) ValueCell!13982))

(declare-fun mapKey!45902 () (_ BitVec 32))

(declare-fun mapValue!45902 () ValueCell!13982)

(assert (=> mapNonEmpty!45902 (= (arr!36408 _values!996) (store mapRest!45902 mapKey!45902 mapValue!45902))))

(declare-fun b!1169219 () Bool)

(declare-fun res!775819 () Bool)

(assert (=> b!1169219 (=> (not res!775819) (not e!664515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75514 (_ BitVec 32)) Bool)

(assert (=> b!1169219 (= res!775819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169220 () Bool)

(declare-fun e!664511 () Bool)

(declare-fun e!664507 () Bool)

(assert (=> b!1169220 (= e!664511 e!664507)))

(declare-fun res!775820 () Bool)

(assert (=> b!1169220 (=> res!775820 e!664507)))

(assert (=> b!1169220 (= res!775820 (not (validKeyInArray!0 (select (arr!36407 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18918 0))(
  ( (tuple2!18919 (_1!9470 (_ BitVec 64)) (_2!9470 V!44305)) )
))
(declare-datatypes ((List!25634 0))(
  ( (Nil!25631) (Cons!25630 (h!26839 tuple2!18918) (t!37470 List!25634)) )
))
(declare-datatypes ((ListLongMap!16887 0))(
  ( (ListLongMap!16888 (toList!8459 List!25634)) )
))
(declare-fun lt!526346 () ListLongMap!16887)

(declare-fun lt!526342 () ListLongMap!16887)

(assert (=> b!1169220 (= lt!526346 lt!526342)))

(declare-fun lt!526345 () ListLongMap!16887)

(declare-fun -!1463 (ListLongMap!16887 (_ BitVec 64)) ListLongMap!16887)

(assert (=> b!1169220 (= lt!526342 (-!1463 lt!526345 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!526341 () array!75516)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526349 () array!75514)

(declare-fun minValue!944 () V!44305)

(declare-fun zeroValue!944 () V!44305)

(declare-fun getCurrentListMapNoExtraKeys!4934 (array!75514 array!75516 (_ BitVec 32) (_ BitVec 32) V!44305 V!44305 (_ BitVec 32) Int) ListLongMap!16887)

(assert (=> b!1169220 (= lt!526346 (getCurrentListMapNoExtraKeys!4934 lt!526349 lt!526341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169220 (= lt!526345 (getCurrentListMapNoExtraKeys!4934 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38403 0))(
  ( (Unit!38404) )
))
(declare-fun lt!526350 () Unit!38403)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!727 (array!75514 array!75516 (_ BitVec 32) (_ BitVec 32) V!44305 V!44305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38403)

(assert (=> b!1169220 (= lt!526350 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!727 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169221 () Bool)

(declare-fun e!664509 () Bool)

(assert (=> b!1169221 (= e!664508 (and e!664509 mapRes!45902))))

(declare-fun condMapEmpty!45902 () Bool)

(declare-fun mapDefault!45902 () ValueCell!13982)

(assert (=> b!1169221 (= condMapEmpty!45902 (= (arr!36408 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13982)) mapDefault!45902)))))

(declare-fun mapIsEmpty!45902 () Bool)

(assert (=> mapIsEmpty!45902 mapRes!45902))

(declare-fun b!1169222 () Bool)

(declare-fun e!664512 () Bool)

(assert (=> b!1169222 (= e!664512 e!664511)))

(declare-fun res!775821 () Bool)

(assert (=> b!1169222 (=> res!775821 e!664511)))

(assert (=> b!1169222 (= res!775821 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526347 () ListLongMap!16887)

(assert (=> b!1169222 (= lt!526347 (getCurrentListMapNoExtraKeys!4934 lt!526349 lt!526341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526344 () V!44305)

(assert (=> b!1169222 (= lt!526341 (array!75517 (store (arr!36408 _values!996) i!673 (ValueCellFull!13982 lt!526344)) (size!36946 _values!996)))))

(declare-fun dynLambda!2860 (Int (_ BitVec 64)) V!44305)

(assert (=> b!1169222 (= lt!526344 (dynLambda!2860 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526343 () ListLongMap!16887)

(assert (=> b!1169222 (= lt!526343 (getCurrentListMapNoExtraKeys!4934 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169223 () Bool)

(declare-fun res!775823 () Bool)

(assert (=> b!1169223 (=> (not res!775823) (not e!664515))))

(assert (=> b!1169223 (= res!775823 (= (select (arr!36407 _keys!1208) i!673) k0!934))))

(declare-fun b!1169224 () Bool)

(declare-fun e!664510 () Bool)

(assert (=> b!1169224 (= e!664510 e!664516)))

(declare-fun res!775827 () Bool)

(assert (=> b!1169224 (=> res!775827 e!664516)))

(assert (=> b!1169224 (= res!775827 (not (= (select (arr!36407 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169225 () Bool)

(assert (=> b!1169225 (= e!664507 true)))

(assert (=> b!1169225 e!664510))

(declare-fun res!775829 () Bool)

(assert (=> b!1169225 (=> (not res!775829) (not e!664510))))

(declare-fun +!3783 (ListLongMap!16887 tuple2!18918) ListLongMap!16887)

(declare-fun get!18567 (ValueCell!13982 V!44305) V!44305)

(assert (=> b!1169225 (= res!775829 (= lt!526347 (+!3783 lt!526342 (tuple2!18919 (select (arr!36407 _keys!1208) from!1455) (get!18567 (select (arr!36408 _values!996) from!1455) lt!526344)))))))

(declare-fun b!1169226 () Bool)

(assert (=> b!1169226 (= e!664509 tp_is_empty!29383)))

(declare-fun b!1169227 () Bool)

(declare-fun res!775818 () Bool)

(assert (=> b!1169227 (=> (not res!775818) (not e!664515))))

(assert (=> b!1169227 (= res!775818 (and (= (size!36946 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36945 _keys!1208) (size!36946 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169228 () Bool)

(declare-fun res!775831 () Bool)

(assert (=> b!1169228 (=> (not res!775831) (not e!664515))))

(assert (=> b!1169228 (= res!775831 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36945 _keys!1208))))))

(declare-fun b!1169229 () Bool)

(declare-fun e!664513 () Bool)

(assert (=> b!1169229 (= e!664515 e!664513)))

(declare-fun res!775822 () Bool)

(assert (=> b!1169229 (=> (not res!775822) (not e!664513))))

(assert (=> b!1169229 (= res!775822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526349 mask!1564))))

(assert (=> b!1169229 (= lt!526349 (array!75515 (store (arr!36407 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36945 _keys!1208)))))

(declare-fun b!1169230 () Bool)

(assert (=> b!1169230 (= e!664513 (not e!664512))))

(declare-fun res!775817 () Bool)

(assert (=> b!1169230 (=> res!775817 e!664512)))

(assert (=> b!1169230 (= res!775817 (bvsgt from!1455 i!673))))

(assert (=> b!1169230 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526348 () Unit!38403)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75514 (_ BitVec 64) (_ BitVec 32)) Unit!38403)

(assert (=> b!1169230 (= lt!526348 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169231 () Bool)

(declare-fun res!775828 () Bool)

(assert (=> b!1169231 (=> (not res!775828) (not e!664513))))

(assert (=> b!1169231 (= res!775828 (arrayNoDuplicates!0 lt!526349 #b00000000000000000000000000000000 Nil!25630))))

(assert (= (and start!99268 res!775824) b!1169216))

(assert (= (and b!1169216 res!775826) b!1169227))

(assert (= (and b!1169227 res!775818) b!1169219))

(assert (= (and b!1169219 res!775819) b!1169218))

(assert (= (and b!1169218 res!775830) b!1169228))

(assert (= (and b!1169228 res!775831) b!1169217))

(assert (= (and b!1169217 res!775825) b!1169223))

(assert (= (and b!1169223 res!775823) b!1169229))

(assert (= (and b!1169229 res!775822) b!1169231))

(assert (= (and b!1169231 res!775828) b!1169230))

(assert (= (and b!1169230 (not res!775817)) b!1169222))

(assert (= (and b!1169222 (not res!775821)) b!1169220))

(assert (= (and b!1169220 (not res!775820)) b!1169225))

(assert (= (and b!1169225 res!775829) b!1169224))

(assert (= (and b!1169224 (not res!775827)) b!1169214))

(assert (= (and b!1169221 condMapEmpty!45902) mapIsEmpty!45902))

(assert (= (and b!1169221 (not condMapEmpty!45902)) mapNonEmpty!45902))

(get-info :version)

(assert (= (and mapNonEmpty!45902 ((_ is ValueCellFull!13982) mapValue!45902)) b!1169215))

(assert (= (and b!1169221 ((_ is ValueCellFull!13982) mapDefault!45902)) b!1169226))

(assert (= start!99268 b!1169221))

(declare-fun b_lambda!19979 () Bool)

(assert (=> (not b_lambda!19979) (not b!1169222)))

(declare-fun t!37468 () Bool)

(declare-fun tb!9657 () Bool)

(assert (=> (and start!99268 (= defaultEntry!1004 defaultEntry!1004) t!37468) tb!9657))

(declare-fun result!19889 () Bool)

(assert (=> tb!9657 (= result!19889 tp_is_empty!29383)))

(assert (=> b!1169222 t!37468))

(declare-fun b_and!40553 () Bool)

(assert (= b_and!40551 (and (=> t!37468 result!19889) b_and!40553)))

(declare-fun m!1076591 () Bool)

(assert (=> b!1169230 m!1076591))

(declare-fun m!1076593 () Bool)

(assert (=> b!1169230 m!1076593))

(declare-fun m!1076595 () Bool)

(assert (=> b!1169218 m!1076595))

(declare-fun m!1076597 () Bool)

(assert (=> b!1169224 m!1076597))

(declare-fun m!1076599 () Bool)

(assert (=> b!1169214 m!1076599))

(declare-fun m!1076601 () Bool)

(assert (=> b!1169216 m!1076601))

(declare-fun m!1076603 () Bool)

(assert (=> b!1169229 m!1076603))

(declare-fun m!1076605 () Bool)

(assert (=> b!1169229 m!1076605))

(declare-fun m!1076607 () Bool)

(assert (=> start!99268 m!1076607))

(declare-fun m!1076609 () Bool)

(assert (=> start!99268 m!1076609))

(declare-fun m!1076611 () Bool)

(assert (=> b!1169217 m!1076611))

(declare-fun m!1076613 () Bool)

(assert (=> b!1169223 m!1076613))

(assert (=> b!1169225 m!1076597))

(declare-fun m!1076615 () Bool)

(assert (=> b!1169225 m!1076615))

(assert (=> b!1169225 m!1076615))

(declare-fun m!1076617 () Bool)

(assert (=> b!1169225 m!1076617))

(declare-fun m!1076619 () Bool)

(assert (=> b!1169225 m!1076619))

(declare-fun m!1076621 () Bool)

(assert (=> mapNonEmpty!45902 m!1076621))

(declare-fun m!1076623 () Bool)

(assert (=> b!1169219 m!1076623))

(declare-fun m!1076625 () Bool)

(assert (=> b!1169222 m!1076625))

(declare-fun m!1076627 () Bool)

(assert (=> b!1169222 m!1076627))

(declare-fun m!1076629 () Bool)

(assert (=> b!1169222 m!1076629))

(declare-fun m!1076631 () Bool)

(assert (=> b!1169222 m!1076631))

(declare-fun m!1076633 () Bool)

(assert (=> b!1169231 m!1076633))

(declare-fun m!1076635 () Bool)

(assert (=> b!1169220 m!1076635))

(declare-fun m!1076637 () Bool)

(assert (=> b!1169220 m!1076637))

(declare-fun m!1076639 () Bool)

(assert (=> b!1169220 m!1076639))

(declare-fun m!1076641 () Bool)

(assert (=> b!1169220 m!1076641))

(assert (=> b!1169220 m!1076597))

(declare-fun m!1076643 () Bool)

(assert (=> b!1169220 m!1076643))

(assert (=> b!1169220 m!1076597))

(check-sat (not b!1169214) (not b_lambda!19979) (not b!1169217) (not b!1169216) (not b!1169222) (not b!1169230) (not mapNonEmpty!45902) (not b!1169231) (not b!1169229) (not start!99268) (not b!1169218) (not b!1169220) b_and!40553 (not b_next!24853) (not b!1169225) tp_is_empty!29383 (not b!1169219))
(check-sat b_and!40553 (not b_next!24853))
