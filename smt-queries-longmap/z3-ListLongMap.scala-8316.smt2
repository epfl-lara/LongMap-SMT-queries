; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101238 () Bool)

(assert start!101238)

(declare-fun b_free!26167 () Bool)

(declare-fun b_next!26167 () Bool)

(assert (=> start!101238 (= b_free!26167 (not b_next!26167))))

(declare-fun tp!91523 () Bool)

(declare-fun b_and!43433 () Bool)

(assert (=> start!101238 (= tp!91523 b_and!43433)))

(declare-fun b!1215839 () Bool)

(declare-fun res!807325 () Bool)

(declare-fun e!690317 () Bool)

(assert (=> b!1215839 (=> (not res!807325) (not e!690317))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78436 0))(
  ( (array!78437 (arr!37853 (Array (_ BitVec 32) (_ BitVec 64))) (size!38391 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78436)

(assert (=> b!1215839 (= res!807325 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38391 _keys!1208))))))

(declare-fun b!1215840 () Bool)

(declare-fun res!807327 () Bool)

(assert (=> b!1215840 (=> (not res!807327) (not e!690317))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215840 (= res!807327 (= (select (arr!37853 _keys!1208) i!673) k0!934))))

(declare-fun b!1215841 () Bool)

(declare-fun res!807334 () Bool)

(declare-fun e!690320 () Bool)

(assert (=> b!1215841 (=> (not res!807334) (not e!690320))))

(declare-fun lt!552572 () array!78436)

(declare-datatypes ((List!26780 0))(
  ( (Nil!26777) (Cons!26776 (h!27985 (_ BitVec 64)) (t!39918 List!26780)) )
))
(declare-fun arrayNoDuplicates!0 (array!78436 (_ BitVec 32) List!26780) Bool)

(assert (=> b!1215841 (= res!807334 (arrayNoDuplicates!0 lt!552572 #b00000000000000000000000000000000 Nil!26777))))

(declare-fun b!1215842 () Bool)

(declare-fun e!690319 () Bool)

(assert (=> b!1215842 (= e!690320 (not e!690319))))

(declare-fun res!807330 () Bool)

(assert (=> b!1215842 (=> res!807330 e!690319)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1215842 (= res!807330 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215842 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40175 0))(
  ( (Unit!40176) )
))
(declare-fun lt!552574 () Unit!40175)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78436 (_ BitVec 64) (_ BitVec 32)) Unit!40175)

(assert (=> b!1215842 (= lt!552574 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215843 () Bool)

(declare-fun e!690322 () Bool)

(declare-fun tp_is_empty!30871 () Bool)

(assert (=> b!1215843 (= e!690322 tp_is_empty!30871)))

(declare-fun b!1215844 () Bool)

(assert (=> b!1215844 (= e!690317 e!690320)))

(declare-fun res!807326 () Bool)

(assert (=> b!1215844 (=> (not res!807326) (not e!690320))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78436 (_ BitVec 32)) Bool)

(assert (=> b!1215844 (= res!807326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552572 mask!1564))))

(assert (=> b!1215844 (= lt!552572 (array!78437 (store (arr!37853 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38391 _keys!1208)))))

(declare-fun b!1215845 () Bool)

(assert (=> b!1215845 (= e!690319 true)))

(declare-datatypes ((V!46289 0))(
  ( (V!46290 (val!15492 Int)) )
))
(declare-fun zeroValue!944 () V!46289)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20000 0))(
  ( (tuple2!20001 (_1!10011 (_ BitVec 64)) (_2!10011 V!46289)) )
))
(declare-datatypes ((List!26781 0))(
  ( (Nil!26778) (Cons!26777 (h!27986 tuple2!20000) (t!39919 List!26781)) )
))
(declare-datatypes ((ListLongMap!17969 0))(
  ( (ListLongMap!17970 (toList!9000 List!26781)) )
))
(declare-fun lt!552573 () ListLongMap!17969)

(declare-datatypes ((ValueCell!14726 0))(
  ( (ValueCellFull!14726 (v!18144 V!46289)) (EmptyCell!14726) )
))
(declare-datatypes ((array!78438 0))(
  ( (array!78439 (arr!37854 (Array (_ BitVec 32) ValueCell!14726)) (size!38392 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78438)

(declare-fun minValue!944 () V!46289)

(declare-fun getCurrentListMapNoExtraKeys!5439 (array!78436 array!78438 (_ BitVec 32) (_ BitVec 32) V!46289 V!46289 (_ BitVec 32) Int) ListLongMap!17969)

(declare-fun dynLambda!3291 (Int (_ BitVec 64)) V!46289)

(assert (=> b!1215845 (= lt!552573 (getCurrentListMapNoExtraKeys!5439 lt!552572 (array!78439 (store (arr!37854 _values!996) i!673 (ValueCellFull!14726 (dynLambda!3291 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38392 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552575 () ListLongMap!17969)

(assert (=> b!1215845 (= lt!552575 (getCurrentListMapNoExtraKeys!5439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215846 () Bool)

(declare-fun e!690316 () Bool)

(assert (=> b!1215846 (= e!690316 tp_is_empty!30871)))

(declare-fun b!1215847 () Bool)

(declare-fun res!807329 () Bool)

(assert (=> b!1215847 (=> (not res!807329) (not e!690317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215847 (= res!807329 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48181 () Bool)

(declare-fun mapRes!48181 () Bool)

(assert (=> mapIsEmpty!48181 mapRes!48181))

(declare-fun mapNonEmpty!48181 () Bool)

(declare-fun tp!91522 () Bool)

(assert (=> mapNonEmpty!48181 (= mapRes!48181 (and tp!91522 e!690316))))

(declare-fun mapValue!48181 () ValueCell!14726)

(declare-fun mapRest!48181 () (Array (_ BitVec 32) ValueCell!14726))

(declare-fun mapKey!48181 () (_ BitVec 32))

(assert (=> mapNonEmpty!48181 (= (arr!37854 _values!996) (store mapRest!48181 mapKey!48181 mapValue!48181))))

(declare-fun b!1215848 () Bool)

(declare-fun res!807333 () Bool)

(assert (=> b!1215848 (=> (not res!807333) (not e!690317))))

(assert (=> b!1215848 (= res!807333 (and (= (size!38392 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38391 _keys!1208) (size!38392 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215850 () Bool)

(declare-fun res!807331 () Bool)

(assert (=> b!1215850 (=> (not res!807331) (not e!690317))))

(assert (=> b!1215850 (= res!807331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215851 () Bool)

(declare-fun res!807328 () Bool)

(assert (=> b!1215851 (=> (not res!807328) (not e!690317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215851 (= res!807328 (validMask!0 mask!1564))))

(declare-fun b!1215852 () Bool)

(declare-fun e!690318 () Bool)

(assert (=> b!1215852 (= e!690318 (and e!690322 mapRes!48181))))

(declare-fun condMapEmpty!48181 () Bool)

(declare-fun mapDefault!48181 () ValueCell!14726)

(assert (=> b!1215852 (= condMapEmpty!48181 (= (arr!37854 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14726)) mapDefault!48181)))))

(declare-fun b!1215849 () Bool)

(declare-fun res!807332 () Bool)

(assert (=> b!1215849 (=> (not res!807332) (not e!690317))))

(assert (=> b!1215849 (= res!807332 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26777))))

(declare-fun res!807324 () Bool)

(assert (=> start!101238 (=> (not res!807324) (not e!690317))))

(assert (=> start!101238 (= res!807324 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38391 _keys!1208))))))

(assert (=> start!101238 e!690317))

(assert (=> start!101238 tp_is_empty!30871))

(declare-fun array_inv!28932 (array!78436) Bool)

(assert (=> start!101238 (array_inv!28932 _keys!1208)))

(assert (=> start!101238 true))

(assert (=> start!101238 tp!91523))

(declare-fun array_inv!28933 (array!78438) Bool)

(assert (=> start!101238 (and (array_inv!28933 _values!996) e!690318)))

(assert (= (and start!101238 res!807324) b!1215851))

(assert (= (and b!1215851 res!807328) b!1215848))

(assert (= (and b!1215848 res!807333) b!1215850))

(assert (= (and b!1215850 res!807331) b!1215849))

(assert (= (and b!1215849 res!807332) b!1215839))

(assert (= (and b!1215839 res!807325) b!1215847))

(assert (= (and b!1215847 res!807329) b!1215840))

(assert (= (and b!1215840 res!807327) b!1215844))

(assert (= (and b!1215844 res!807326) b!1215841))

(assert (= (and b!1215841 res!807334) b!1215842))

(assert (= (and b!1215842 (not res!807330)) b!1215845))

(assert (= (and b!1215852 condMapEmpty!48181) mapIsEmpty!48181))

(assert (= (and b!1215852 (not condMapEmpty!48181)) mapNonEmpty!48181))

(get-info :version)

(assert (= (and mapNonEmpty!48181 ((_ is ValueCellFull!14726) mapValue!48181)) b!1215846))

(assert (= (and b!1215852 ((_ is ValueCellFull!14726) mapDefault!48181)) b!1215843))

(assert (= start!101238 b!1215852))

(declare-fun b_lambda!21833 () Bool)

(assert (=> (not b_lambda!21833) (not b!1215845)))

(declare-fun t!39917 () Bool)

(declare-fun tb!10959 () Bool)

(assert (=> (and start!101238 (= defaultEntry!1004 defaultEntry!1004) t!39917) tb!10959))

(declare-fun result!22523 () Bool)

(assert (=> tb!10959 (= result!22523 tp_is_empty!30871)))

(assert (=> b!1215845 t!39917))

(declare-fun b_and!43435 () Bool)

(assert (= b_and!43433 (and (=> t!39917 result!22523) b_and!43435)))

(declare-fun m!1120239 () Bool)

(assert (=> b!1215849 m!1120239))

(declare-fun m!1120241 () Bool)

(assert (=> b!1215850 m!1120241))

(declare-fun m!1120243 () Bool)

(assert (=> b!1215844 m!1120243))

(declare-fun m!1120245 () Bool)

(assert (=> b!1215844 m!1120245))

(declare-fun m!1120247 () Bool)

(assert (=> b!1215840 m!1120247))

(declare-fun m!1120249 () Bool)

(assert (=> b!1215847 m!1120249))

(declare-fun m!1120251 () Bool)

(assert (=> mapNonEmpty!48181 m!1120251))

(declare-fun m!1120253 () Bool)

(assert (=> b!1215842 m!1120253))

(declare-fun m!1120255 () Bool)

(assert (=> b!1215842 m!1120255))

(declare-fun m!1120257 () Bool)

(assert (=> b!1215851 m!1120257))

(declare-fun m!1120259 () Bool)

(assert (=> b!1215845 m!1120259))

(declare-fun m!1120261 () Bool)

(assert (=> b!1215845 m!1120261))

(declare-fun m!1120263 () Bool)

(assert (=> b!1215845 m!1120263))

(declare-fun m!1120265 () Bool)

(assert (=> b!1215845 m!1120265))

(declare-fun m!1120267 () Bool)

(assert (=> b!1215841 m!1120267))

(declare-fun m!1120269 () Bool)

(assert (=> start!101238 m!1120269))

(declare-fun m!1120271 () Bool)

(assert (=> start!101238 m!1120271))

(check-sat (not b!1215851) (not b!1215842) (not b!1215850) b_and!43435 tp_is_empty!30871 (not b!1215849) (not b!1215844) (not b!1215845) (not start!101238) (not b!1215841) (not b_lambda!21833) (not mapNonEmpty!48181) (not b_next!26167) (not b!1215847))
(check-sat b_and!43435 (not b_next!26167))
