; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100230 () Bool)

(assert start!100230)

(declare-fun b_free!25573 () Bool)

(declare-fun b_next!25573 () Bool)

(assert (=> start!100230 (= b_free!25573 (not b_next!25573))))

(declare-fun tp!89432 () Bool)

(declare-fun b_and!42015 () Bool)

(assert (=> start!100230 (= tp!89432 b_and!42015)))

(declare-fun b!1192428 () Bool)

(declare-fun e!677950 () Bool)

(declare-fun e!677948 () Bool)

(assert (=> b!1192428 (= e!677950 e!677948)))

(declare-fun res!792757 () Bool)

(assert (=> b!1192428 (=> (not res!792757) (not e!677948))))

(declare-datatypes ((array!77041 0))(
  ( (array!77042 (arr!37164 (Array (_ BitVec 32) (_ BitVec 64))) (size!37701 (_ BitVec 32))) )
))
(declare-fun lt!542201 () array!77041)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77041 (_ BitVec 32)) Bool)

(assert (=> b!1192428 (= res!792757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542201 mask!1564))))

(declare-fun _keys!1208 () array!77041)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192428 (= lt!542201 (array!77042 (store (arr!37164 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37701 _keys!1208)))))

(declare-fun b!1192429 () Bool)

(declare-fun res!792756 () Bool)

(assert (=> b!1192429 (=> (not res!792756) (not e!677950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192429 (= res!792756 (validMask!0 mask!1564))))

(declare-fun b!1192430 () Bool)

(declare-fun res!792764 () Bool)

(assert (=> b!1192430 (=> (not res!792764) (not e!677950))))

(assert (=> b!1192430 (= res!792764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192431 () Bool)

(declare-fun e!677953 () Bool)

(assert (=> b!1192431 (= e!677948 (not e!677953))))

(declare-fun res!792763 () Bool)

(assert (=> b!1192431 (=> res!792763 e!677953)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192431 (= res!792763 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192431 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39495 0))(
  ( (Unit!39496) )
))
(declare-fun lt!542202 () Unit!39495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77041 (_ BitVec 64) (_ BitVec 32)) Unit!39495)

(assert (=> b!1192431 (= lt!542202 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192432 () Bool)

(declare-fun res!792762 () Bool)

(assert (=> b!1192432 (=> (not res!792762) (not e!677950))))

(assert (=> b!1192432 (= res!792762 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37701 _keys!1208))))))

(declare-fun b!1192433 () Bool)

(declare-fun e!677952 () Bool)

(assert (=> b!1192433 (= e!677952 true)))

(declare-datatypes ((V!45265 0))(
  ( (V!45266 (val!15108 Int)) )
))
(declare-fun zeroValue!944 () V!45265)

(declare-datatypes ((ValueCell!14342 0))(
  ( (ValueCellFull!14342 (v!17742 V!45265)) (EmptyCell!14342) )
))
(declare-datatypes ((array!77043 0))(
  ( (array!77044 (arr!37165 (Array (_ BitVec 32) ValueCell!14342)) (size!37702 (_ BitVec 32))) )
))
(declare-fun lt!542204 () array!77043)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun _values!996 () array!77043)

(declare-fun minValue!944 () V!45265)

(declare-datatypes ((tuple2!19446 0))(
  ( (tuple2!19447 (_1!9734 (_ BitVec 64)) (_2!9734 V!45265)) )
))
(declare-datatypes ((List!26190 0))(
  ( (Nil!26187) (Cons!26186 (h!27404 tuple2!19446) (t!38747 List!26190)) )
))
(declare-datatypes ((ListLongMap!17423 0))(
  ( (ListLongMap!17424 (toList!8727 List!26190)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5195 (array!77041 array!77043 (_ BitVec 32) (_ BitVec 32) V!45265 V!45265 (_ BitVec 32) Int) ListLongMap!17423)

(declare-fun -!1736 (ListLongMap!17423 (_ BitVec 64)) ListLongMap!17423)

(assert (=> b!1192433 (= (getCurrentListMapNoExtraKeys!5195 lt!542201 lt!542204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1736 (getCurrentListMapNoExtraKeys!5195 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542206 () Unit!39495)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!951 (array!77041 array!77043 (_ BitVec 32) (_ BitVec 32) V!45265 V!45265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39495)

(assert (=> b!1192433 (= lt!542206 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!951 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192434 () Bool)

(declare-fun res!792758 () Bool)

(assert (=> b!1192434 (=> (not res!792758) (not e!677950))))

(declare-datatypes ((List!26191 0))(
  ( (Nil!26188) (Cons!26187 (h!27405 (_ BitVec 64)) (t!38748 List!26191)) )
))
(declare-fun arrayNoDuplicates!0 (array!77041 (_ BitVec 32) List!26191) Bool)

(assert (=> b!1192434 (= res!792758 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26188))))

(declare-fun b!1192435 () Bool)

(declare-fun e!677954 () Bool)

(declare-fun tp_is_empty!30103 () Bool)

(assert (=> b!1192435 (= e!677954 tp_is_empty!30103)))

(declare-fun b!1192436 () Bool)

(declare-fun res!792761 () Bool)

(assert (=> b!1192436 (=> (not res!792761) (not e!677950))))

(assert (=> b!1192436 (= res!792761 (= (select (arr!37164 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46982 () Bool)

(declare-fun mapRes!46982 () Bool)

(assert (=> mapIsEmpty!46982 mapRes!46982))

(declare-fun b!1192438 () Bool)

(declare-fun e!677949 () Bool)

(declare-fun e!677947 () Bool)

(assert (=> b!1192438 (= e!677949 (and e!677947 mapRes!46982))))

(declare-fun condMapEmpty!46982 () Bool)

(declare-fun mapDefault!46982 () ValueCell!14342)

(assert (=> b!1192438 (= condMapEmpty!46982 (= (arr!37165 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14342)) mapDefault!46982)))))

(declare-fun b!1192439 () Bool)

(declare-fun res!792760 () Bool)

(assert (=> b!1192439 (=> (not res!792760) (not e!677950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192439 (= res!792760 (validKeyInArray!0 k0!934))))

(declare-fun b!1192440 () Bool)

(assert (=> b!1192440 (= e!677947 tp_is_empty!30103)))

(declare-fun mapNonEmpty!46982 () Bool)

(declare-fun tp!89433 () Bool)

(assert (=> mapNonEmpty!46982 (= mapRes!46982 (and tp!89433 e!677954))))

(declare-fun mapValue!46982 () ValueCell!14342)

(declare-fun mapKey!46982 () (_ BitVec 32))

(declare-fun mapRest!46982 () (Array (_ BitVec 32) ValueCell!14342))

(assert (=> mapNonEmpty!46982 (= (arr!37165 _values!996) (store mapRest!46982 mapKey!46982 mapValue!46982))))

(declare-fun b!1192441 () Bool)

(declare-fun res!792767 () Bool)

(assert (=> b!1192441 (=> (not res!792767) (not e!677950))))

(assert (=> b!1192441 (= res!792767 (and (= (size!37702 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37701 _keys!1208) (size!37702 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192442 () Bool)

(declare-fun res!792766 () Bool)

(assert (=> b!1192442 (=> (not res!792766) (not e!677948))))

(assert (=> b!1192442 (= res!792766 (arrayNoDuplicates!0 lt!542201 #b00000000000000000000000000000000 Nil!26188))))

(declare-fun b!1192437 () Bool)

(assert (=> b!1192437 (= e!677953 e!677952)))

(declare-fun res!792759 () Bool)

(assert (=> b!1192437 (=> res!792759 e!677952)))

(assert (=> b!1192437 (= res!792759 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542203 () ListLongMap!17423)

(assert (=> b!1192437 (= lt!542203 (getCurrentListMapNoExtraKeys!5195 lt!542201 lt!542204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3149 (Int (_ BitVec 64)) V!45265)

(assert (=> b!1192437 (= lt!542204 (array!77044 (store (arr!37165 _values!996) i!673 (ValueCellFull!14342 (dynLambda!3149 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37702 _values!996)))))

(declare-fun lt!542205 () ListLongMap!17423)

(assert (=> b!1192437 (= lt!542205 (getCurrentListMapNoExtraKeys!5195 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!792765 () Bool)

(assert (=> start!100230 (=> (not res!792765) (not e!677950))))

(assert (=> start!100230 (= res!792765 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37701 _keys!1208))))))

(assert (=> start!100230 e!677950))

(assert (=> start!100230 tp_is_empty!30103))

(declare-fun array_inv!28402 (array!77041) Bool)

(assert (=> start!100230 (array_inv!28402 _keys!1208)))

(assert (=> start!100230 true))

(assert (=> start!100230 tp!89432))

(declare-fun array_inv!28403 (array!77043) Bool)

(assert (=> start!100230 (and (array_inv!28403 _values!996) e!677949)))

(assert (= (and start!100230 res!792765) b!1192429))

(assert (= (and b!1192429 res!792756) b!1192441))

(assert (= (and b!1192441 res!792767) b!1192430))

(assert (= (and b!1192430 res!792764) b!1192434))

(assert (= (and b!1192434 res!792758) b!1192432))

(assert (= (and b!1192432 res!792762) b!1192439))

(assert (= (and b!1192439 res!792760) b!1192436))

(assert (= (and b!1192436 res!792761) b!1192428))

(assert (= (and b!1192428 res!792757) b!1192442))

(assert (= (and b!1192442 res!792766) b!1192431))

(assert (= (and b!1192431 (not res!792763)) b!1192437))

(assert (= (and b!1192437 (not res!792759)) b!1192433))

(assert (= (and b!1192438 condMapEmpty!46982) mapIsEmpty!46982))

(assert (= (and b!1192438 (not condMapEmpty!46982)) mapNonEmpty!46982))

(get-info :version)

(assert (= (and mapNonEmpty!46982 ((_ is ValueCellFull!14342) mapValue!46982)) b!1192435))

(assert (= (and b!1192438 ((_ is ValueCellFull!14342) mapDefault!46982)) b!1192440))

(assert (= start!100230 b!1192438))

(declare-fun b_lambda!20711 () Bool)

(assert (=> (not b_lambda!20711) (not b!1192437)))

(declare-fun t!38746 () Bool)

(declare-fun tb!10377 () Bool)

(assert (=> (and start!100230 (= defaultEntry!1004 defaultEntry!1004) t!38746) tb!10377))

(declare-fun result!21329 () Bool)

(assert (=> tb!10377 (= result!21329 tp_is_empty!30103)))

(assert (=> b!1192437 t!38746))

(declare-fun b_and!42017 () Bool)

(assert (= b_and!42015 (and (=> t!38746 result!21329) b_and!42017)))

(declare-fun m!1101207 () Bool)

(assert (=> b!1192434 m!1101207))

(declare-fun m!1101209 () Bool)

(assert (=> mapNonEmpty!46982 m!1101209))

(declare-fun m!1101211 () Bool)

(assert (=> b!1192430 m!1101211))

(declare-fun m!1101213 () Bool)

(assert (=> b!1192428 m!1101213))

(declare-fun m!1101215 () Bool)

(assert (=> b!1192428 m!1101215))

(declare-fun m!1101217 () Bool)

(assert (=> b!1192433 m!1101217))

(declare-fun m!1101219 () Bool)

(assert (=> b!1192433 m!1101219))

(assert (=> b!1192433 m!1101219))

(declare-fun m!1101221 () Bool)

(assert (=> b!1192433 m!1101221))

(declare-fun m!1101223 () Bool)

(assert (=> b!1192433 m!1101223))

(declare-fun m!1101225 () Bool)

(assert (=> b!1192429 m!1101225))

(declare-fun m!1101227 () Bool)

(assert (=> b!1192431 m!1101227))

(declare-fun m!1101229 () Bool)

(assert (=> b!1192431 m!1101229))

(declare-fun m!1101231 () Bool)

(assert (=> start!100230 m!1101231))

(declare-fun m!1101233 () Bool)

(assert (=> start!100230 m!1101233))

(declare-fun m!1101235 () Bool)

(assert (=> b!1192442 m!1101235))

(declare-fun m!1101237 () Bool)

(assert (=> b!1192436 m!1101237))

(declare-fun m!1101239 () Bool)

(assert (=> b!1192439 m!1101239))

(declare-fun m!1101241 () Bool)

(assert (=> b!1192437 m!1101241))

(declare-fun m!1101243 () Bool)

(assert (=> b!1192437 m!1101243))

(declare-fun m!1101245 () Bool)

(assert (=> b!1192437 m!1101245))

(declare-fun m!1101247 () Bool)

(assert (=> b!1192437 m!1101247))

(check-sat (not b!1192437) (not b_lambda!20711) (not start!100230) (not b!1192442) (not b!1192429) (not b!1192430) (not mapNonEmpty!46982) (not b!1192433) tp_is_empty!30103 b_and!42017 (not b_next!25573) (not b!1192439) (not b!1192434) (not b!1192431) (not b!1192428))
(check-sat b_and!42017 (not b_next!25573))
