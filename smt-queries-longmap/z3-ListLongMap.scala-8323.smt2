; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101522 () Bool)

(assert start!101522)

(declare-fun b_free!26209 () Bool)

(declare-fun b_next!26209 () Bool)

(assert (=> start!101522 (= b_free!26209 (not b_next!26209))))

(declare-fun tp!91649 () Bool)

(declare-fun b_and!43537 () Bool)

(assert (=> start!101522 (= tp!91649 b_and!43537)))

(declare-fun b!1218217 () Bool)

(declare-fun res!808646 () Bool)

(declare-fun e!691722 () Bool)

(assert (=> b!1218217 (=> (not res!808646) (not e!691722))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78639 0))(
  ( (array!78640 (arr!37948 (Array (_ BitVec 32) (_ BitVec 64))) (size!38485 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78639)

(assert (=> b!1218217 (= res!808646 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38485 _keys!1208))))))

(declare-fun b!1218218 () Bool)

(declare-fun e!691715 () Bool)

(declare-fun tp_is_empty!30913 () Bool)

(assert (=> b!1218218 (= e!691715 tp_is_empty!30913)))

(declare-fun mapNonEmpty!48244 () Bool)

(declare-fun mapRes!48244 () Bool)

(declare-fun tp!91648 () Bool)

(declare-fun e!691717 () Bool)

(assert (=> mapNonEmpty!48244 (= mapRes!48244 (and tp!91648 e!691717))))

(declare-fun mapKey!48244 () (_ BitVec 32))

(declare-datatypes ((V!46345 0))(
  ( (V!46346 (val!15513 Int)) )
))
(declare-datatypes ((ValueCell!14747 0))(
  ( (ValueCellFull!14747 (v!18162 V!46345)) (EmptyCell!14747) )
))
(declare-fun mapRest!48244 () (Array (_ BitVec 32) ValueCell!14747))

(declare-datatypes ((array!78641 0))(
  ( (array!78642 (arr!37949 (Array (_ BitVec 32) ValueCell!14747)) (size!38486 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78641)

(declare-fun mapValue!48244 () ValueCell!14747)

(assert (=> mapNonEmpty!48244 (= (arr!37949 _values!996) (store mapRest!48244 mapKey!48244 mapValue!48244))))

(declare-fun b!1218219 () Bool)

(declare-fun e!691720 () Bool)

(declare-fun e!691723 () Bool)

(assert (=> b!1218219 (= e!691720 (not e!691723))))

(declare-fun res!808647 () Bool)

(assert (=> b!1218219 (=> res!808647 e!691723)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218219 (= res!808647 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218219 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40324 0))(
  ( (Unit!40325) )
))
(declare-fun lt!553566 () Unit!40324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78639 (_ BitVec 64) (_ BitVec 32)) Unit!40324)

(assert (=> b!1218219 (= lt!553566 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218220 () Bool)

(declare-fun e!691716 () Bool)

(assert (=> b!1218220 (= e!691716 (bvslt from!1455 (size!38486 _values!996)))))

(declare-fun b!1218221 () Bool)

(declare-fun res!808653 () Bool)

(assert (=> b!1218221 (=> (not res!808653) (not e!691722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218221 (= res!808653 (validKeyInArray!0 k0!934))))

(declare-fun b!1218222 () Bool)

(assert (=> b!1218222 (= e!691722 e!691720)))

(declare-fun res!808644 () Bool)

(assert (=> b!1218222 (=> (not res!808644) (not e!691720))))

(declare-fun lt!553563 () array!78639)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78639 (_ BitVec 32)) Bool)

(assert (=> b!1218222 (= res!808644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553563 mask!1564))))

(assert (=> b!1218222 (= lt!553563 (array!78640 (store (arr!37948 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38485 _keys!1208)))))

(declare-fun b!1218223 () Bool)

(declare-fun res!808645 () Bool)

(assert (=> b!1218223 (=> (not res!808645) (not e!691722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218223 (= res!808645 (validMask!0 mask!1564))))

(declare-fun b!1218224 () Bool)

(declare-fun res!808643 () Bool)

(assert (=> b!1218224 (=> (not res!808643) (not e!691722))))

(assert (=> b!1218224 (= res!808643 (= (select (arr!37948 _keys!1208) i!673) k0!934))))

(declare-fun res!808654 () Bool)

(assert (=> start!101522 (=> (not res!808654) (not e!691722))))

(assert (=> start!101522 (= res!808654 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38485 _keys!1208))))))

(assert (=> start!101522 e!691722))

(assert (=> start!101522 tp_is_empty!30913))

(declare-fun array_inv!28956 (array!78639) Bool)

(assert (=> start!101522 (array_inv!28956 _keys!1208)))

(assert (=> start!101522 true))

(assert (=> start!101522 tp!91649))

(declare-fun e!691718 () Bool)

(declare-fun array_inv!28957 (array!78641) Bool)

(assert (=> start!101522 (and (array_inv!28957 _values!996) e!691718)))

(declare-fun b!1218225 () Bool)

(declare-fun e!691721 () Bool)

(assert (=> b!1218225 (= e!691721 e!691716)))

(declare-fun res!808652 () Bool)

(assert (=> b!1218225 (=> res!808652 e!691716)))

(assert (=> b!1218225 (= res!808652 (not (validKeyInArray!0 (select (arr!37948 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46345)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46345)

(declare-fun lt!553565 () array!78641)

(declare-datatypes ((tuple2!19958 0))(
  ( (tuple2!19959 (_1!9990 (_ BitVec 64)) (_2!9990 V!46345)) )
))
(declare-datatypes ((List!26768 0))(
  ( (Nil!26765) (Cons!26764 (h!27982 tuple2!19958) (t!39949 List!26768)) )
))
(declare-datatypes ((ListLongMap!17935 0))(
  ( (ListLongMap!17936 (toList!8983 List!26768)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5440 (array!78639 array!78641 (_ BitVec 32) (_ BitVec 32) V!46345 V!46345 (_ BitVec 32) Int) ListLongMap!17935)

(declare-fun -!1875 (ListLongMap!17935 (_ BitVec 64)) ListLongMap!17935)

(assert (=> b!1218225 (= (getCurrentListMapNoExtraKeys!5440 lt!553563 lt!553565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1875 (getCurrentListMapNoExtraKeys!5440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!553561 () Unit!40324)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1090 (array!78639 array!78641 (_ BitVec 32) (_ BitVec 32) V!46345 V!46345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40324)

(assert (=> b!1218225 (= lt!553561 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1090 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218226 () Bool)

(assert (=> b!1218226 (= e!691718 (and e!691715 mapRes!48244))))

(declare-fun condMapEmpty!48244 () Bool)

(declare-fun mapDefault!48244 () ValueCell!14747)

(assert (=> b!1218226 (= condMapEmpty!48244 (= (arr!37949 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14747)) mapDefault!48244)))))

(declare-fun b!1218227 () Bool)

(declare-fun res!808648 () Bool)

(assert (=> b!1218227 (=> (not res!808648) (not e!691722))))

(assert (=> b!1218227 (= res!808648 (and (= (size!38486 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38485 _keys!1208) (size!38486 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218228 () Bool)

(assert (=> b!1218228 (= e!691717 tp_is_empty!30913)))

(declare-fun b!1218229 () Bool)

(assert (=> b!1218229 (= e!691723 e!691721)))

(declare-fun res!808651 () Bool)

(assert (=> b!1218229 (=> res!808651 e!691721)))

(assert (=> b!1218229 (= res!808651 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553562 () ListLongMap!17935)

(assert (=> b!1218229 (= lt!553562 (getCurrentListMapNoExtraKeys!5440 lt!553563 lt!553565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3349 (Int (_ BitVec 64)) V!46345)

(assert (=> b!1218229 (= lt!553565 (array!78642 (store (arr!37949 _values!996) i!673 (ValueCellFull!14747 (dynLambda!3349 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38486 _values!996)))))

(declare-fun lt!553564 () ListLongMap!17935)

(assert (=> b!1218229 (= lt!553564 (getCurrentListMapNoExtraKeys!5440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218230 () Bool)

(declare-fun res!808650 () Bool)

(assert (=> b!1218230 (=> (not res!808650) (not e!691720))))

(declare-datatypes ((List!26769 0))(
  ( (Nil!26766) (Cons!26765 (h!27983 (_ BitVec 64)) (t!39950 List!26769)) )
))
(declare-fun arrayNoDuplicates!0 (array!78639 (_ BitVec 32) List!26769) Bool)

(assert (=> b!1218230 (= res!808650 (arrayNoDuplicates!0 lt!553563 #b00000000000000000000000000000000 Nil!26766))))

(declare-fun b!1218231 () Bool)

(declare-fun res!808642 () Bool)

(assert (=> b!1218231 (=> (not res!808642) (not e!691722))))

(assert (=> b!1218231 (= res!808642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218232 () Bool)

(declare-fun res!808649 () Bool)

(assert (=> b!1218232 (=> (not res!808649) (not e!691722))))

(assert (=> b!1218232 (= res!808649 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26766))))

(declare-fun mapIsEmpty!48244 () Bool)

(assert (=> mapIsEmpty!48244 mapRes!48244))

(assert (= (and start!101522 res!808654) b!1218223))

(assert (= (and b!1218223 res!808645) b!1218227))

(assert (= (and b!1218227 res!808648) b!1218231))

(assert (= (and b!1218231 res!808642) b!1218232))

(assert (= (and b!1218232 res!808649) b!1218217))

(assert (= (and b!1218217 res!808646) b!1218221))

(assert (= (and b!1218221 res!808653) b!1218224))

(assert (= (and b!1218224 res!808643) b!1218222))

(assert (= (and b!1218222 res!808644) b!1218230))

(assert (= (and b!1218230 res!808650) b!1218219))

(assert (= (and b!1218219 (not res!808647)) b!1218229))

(assert (= (and b!1218229 (not res!808651)) b!1218225))

(assert (= (and b!1218225 (not res!808652)) b!1218220))

(assert (= (and b!1218226 condMapEmpty!48244) mapIsEmpty!48244))

(assert (= (and b!1218226 (not condMapEmpty!48244)) mapNonEmpty!48244))

(get-info :version)

(assert (= (and mapNonEmpty!48244 ((_ is ValueCellFull!14747) mapValue!48244)) b!1218228))

(assert (= (and b!1218226 ((_ is ValueCellFull!14747) mapDefault!48244)) b!1218218))

(assert (= start!101522 b!1218226))

(declare-fun b_lambda!21879 () Bool)

(assert (=> (not b_lambda!21879) (not b!1218229)))

(declare-fun t!39948 () Bool)

(declare-fun tb!11001 () Bool)

(assert (=> (and start!101522 (= defaultEntry!1004 defaultEntry!1004) t!39948) tb!11001))

(declare-fun result!22607 () Bool)

(assert (=> tb!11001 (= result!22607 tp_is_empty!30913)))

(assert (=> b!1218229 t!39948))

(declare-fun b_and!43539 () Bool)

(assert (= b_and!43537 (and (=> t!39948 result!22607) b_and!43539)))

(declare-fun m!1123227 () Bool)

(assert (=> start!101522 m!1123227))

(declare-fun m!1123229 () Bool)

(assert (=> start!101522 m!1123229))

(declare-fun m!1123231 () Bool)

(assert (=> mapNonEmpty!48244 m!1123231))

(declare-fun m!1123233 () Bool)

(assert (=> b!1218219 m!1123233))

(declare-fun m!1123235 () Bool)

(assert (=> b!1218219 m!1123235))

(declare-fun m!1123237 () Bool)

(assert (=> b!1218225 m!1123237))

(declare-fun m!1123239 () Bool)

(assert (=> b!1218225 m!1123239))

(declare-fun m!1123241 () Bool)

(assert (=> b!1218225 m!1123241))

(assert (=> b!1218225 m!1123237))

(declare-fun m!1123243 () Bool)

(assert (=> b!1218225 m!1123243))

(declare-fun m!1123245 () Bool)

(assert (=> b!1218225 m!1123245))

(declare-fun m!1123247 () Bool)

(assert (=> b!1218225 m!1123247))

(assert (=> b!1218225 m!1123245))

(declare-fun m!1123249 () Bool)

(assert (=> b!1218221 m!1123249))

(declare-fun m!1123251 () Bool)

(assert (=> b!1218223 m!1123251))

(declare-fun m!1123253 () Bool)

(assert (=> b!1218229 m!1123253))

(declare-fun m!1123255 () Bool)

(assert (=> b!1218229 m!1123255))

(declare-fun m!1123257 () Bool)

(assert (=> b!1218229 m!1123257))

(declare-fun m!1123259 () Bool)

(assert (=> b!1218229 m!1123259))

(declare-fun m!1123261 () Bool)

(assert (=> b!1218224 m!1123261))

(declare-fun m!1123263 () Bool)

(assert (=> b!1218230 m!1123263))

(declare-fun m!1123265 () Bool)

(assert (=> b!1218231 m!1123265))

(declare-fun m!1123267 () Bool)

(assert (=> b!1218222 m!1123267))

(declare-fun m!1123269 () Bool)

(assert (=> b!1218222 m!1123269))

(declare-fun m!1123271 () Bool)

(assert (=> b!1218232 m!1123271))

(check-sat (not b!1218221) (not b!1218229) (not b_next!26209) b_and!43539 (not b!1218232) (not b!1218225) (not b_lambda!21879) (not b!1218219) (not start!101522) (not b!1218223) (not b!1218222) (not b!1218231) (not b!1218230) tp_is_empty!30913 (not mapNonEmpty!48244))
(check-sat b_and!43539 (not b_next!26209))
