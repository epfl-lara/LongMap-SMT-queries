; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99990 () Bool)

(assert start!99990)

(declare-fun b_free!25569 () Bool)

(declare-fun b_next!25569 () Bool)

(assert (=> start!99990 (= b_free!25569 (not b_next!25569))))

(declare-fun tp!89420 () Bool)

(declare-fun b_and!42005 () Bool)

(assert (=> start!99990 (= tp!89420 b_and!42005)))

(declare-fun b!1191045 () Bool)

(declare-fun e!677074 () Bool)

(declare-fun tp_is_empty!30099 () Bool)

(assert (=> b!1191045 (= e!677074 tp_is_empty!30099)))

(declare-fun b!1191046 () Bool)

(declare-fun res!792185 () Bool)

(declare-fun e!677068 () Bool)

(assert (=> b!1191046 (=> (not res!792185) (not e!677068))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191046 (= res!792185 (validKeyInArray!0 k0!934))))

(declare-fun b!1191047 () Bool)

(declare-fun e!677067 () Bool)

(assert (=> b!1191047 (= e!677067 true)))

(declare-datatypes ((V!45259 0))(
  ( (V!45260 (val!15106 Int)) )
))
(declare-fun zeroValue!944 () V!45259)

(declare-datatypes ((array!76989 0))(
  ( (array!76990 (arr!37144 (Array (_ BitVec 32) (_ BitVec 64))) (size!37680 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76989)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14340 0))(
  ( (ValueCellFull!14340 (v!17744 V!45259)) (EmptyCell!14340) )
))
(declare-datatypes ((array!76991 0))(
  ( (array!76992 (arr!37145 (Array (_ BitVec 32) ValueCell!14340)) (size!37681 (_ BitVec 32))) )
))
(declare-fun lt!541682 () array!76991)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!76991)

(declare-fun minValue!944 () V!45259)

(declare-fun lt!541681 () array!76989)

(declare-datatypes ((tuple2!19412 0))(
  ( (tuple2!19413 (_1!9717 (_ BitVec 64)) (_2!9717 V!45259)) )
))
(declare-datatypes ((List!26157 0))(
  ( (Nil!26154) (Cons!26153 (h!27362 tuple2!19412) (t!38718 List!26157)) )
))
(declare-datatypes ((ListLongMap!17381 0))(
  ( (ListLongMap!17382 (toList!8706 List!26157)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5147 (array!76989 array!76991 (_ BitVec 32) (_ BitVec 32) V!45259 V!45259 (_ BitVec 32) Int) ListLongMap!17381)

(declare-fun -!1732 (ListLongMap!17381 (_ BitVec 64)) ListLongMap!17381)

(assert (=> b!1191047 (= (getCurrentListMapNoExtraKeys!5147 lt!541681 lt!541682 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1732 (getCurrentListMapNoExtraKeys!5147 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39510 0))(
  ( (Unit!39511) )
))
(declare-fun lt!541686 () Unit!39510)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!941 (array!76989 array!76991 (_ BitVec 32) (_ BitVec 32) V!45259 V!45259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39510)

(assert (=> b!1191047 (= lt!541686 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!941 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191048 () Bool)

(declare-fun res!792178 () Bool)

(assert (=> b!1191048 (=> (not res!792178) (not e!677068))))

(assert (=> b!1191048 (= res!792178 (= (select (arr!37144 _keys!1208) i!673) k0!934))))

(declare-fun b!1191049 () Bool)

(declare-fun e!677073 () Bool)

(declare-fun e!677069 () Bool)

(assert (=> b!1191049 (= e!677073 (not e!677069))))

(declare-fun res!792177 () Bool)

(assert (=> b!1191049 (=> res!792177 e!677069)))

(assert (=> b!1191049 (= res!792177 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191049 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541684 () Unit!39510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76989 (_ BitVec 64) (_ BitVec 32)) Unit!39510)

(assert (=> b!1191049 (= lt!541684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191050 () Bool)

(declare-fun e!677070 () Bool)

(assert (=> b!1191050 (= e!677070 tp_is_empty!30099)))

(declare-fun b!1191051 () Bool)

(declare-fun res!792184 () Bool)

(assert (=> b!1191051 (=> (not res!792184) (not e!677068))))

(assert (=> b!1191051 (= res!792184 (and (= (size!37681 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37680 _keys!1208) (size!37681 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191052 () Bool)

(declare-fun res!792182 () Bool)

(assert (=> b!1191052 (=> (not res!792182) (not e!677073))))

(declare-datatypes ((List!26158 0))(
  ( (Nil!26155) (Cons!26154 (h!27363 (_ BitVec 64)) (t!38719 List!26158)) )
))
(declare-fun arrayNoDuplicates!0 (array!76989 (_ BitVec 32) List!26158) Bool)

(assert (=> b!1191052 (= res!792182 (arrayNoDuplicates!0 lt!541681 #b00000000000000000000000000000000 Nil!26155))))

(declare-fun mapIsEmpty!46976 () Bool)

(declare-fun mapRes!46976 () Bool)

(assert (=> mapIsEmpty!46976 mapRes!46976))

(declare-fun b!1191054 () Bool)

(declare-fun res!792186 () Bool)

(assert (=> b!1191054 (=> (not res!792186) (not e!677068))))

(assert (=> b!1191054 (= res!792186 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26155))))

(declare-fun b!1191055 () Bool)

(declare-fun res!792179 () Bool)

(assert (=> b!1191055 (=> (not res!792179) (not e!677068))))

(assert (=> b!1191055 (= res!792179 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37680 _keys!1208))))))

(declare-fun b!1191056 () Bool)

(declare-fun res!792183 () Bool)

(assert (=> b!1191056 (=> (not res!792183) (not e!677068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76989 (_ BitVec 32)) Bool)

(assert (=> b!1191056 (= res!792183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191057 () Bool)

(declare-fun res!792176 () Bool)

(assert (=> b!1191057 (=> (not res!792176) (not e!677068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191057 (= res!792176 (validMask!0 mask!1564))))

(declare-fun b!1191058 () Bool)

(assert (=> b!1191058 (= e!677069 e!677067)))

(declare-fun res!792180 () Bool)

(assert (=> b!1191058 (=> res!792180 e!677067)))

(assert (=> b!1191058 (= res!792180 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541685 () ListLongMap!17381)

(assert (=> b!1191058 (= lt!541685 (getCurrentListMapNoExtraKeys!5147 lt!541681 lt!541682 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3082 (Int (_ BitVec 64)) V!45259)

(assert (=> b!1191058 (= lt!541682 (array!76992 (store (arr!37145 _values!996) i!673 (ValueCellFull!14340 (dynLambda!3082 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37681 _values!996)))))

(declare-fun lt!541683 () ListLongMap!17381)

(assert (=> b!1191058 (= lt!541683 (getCurrentListMapNoExtraKeys!5147 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191053 () Bool)

(declare-fun e!677071 () Bool)

(assert (=> b!1191053 (= e!677071 (and e!677070 mapRes!46976))))

(declare-fun condMapEmpty!46976 () Bool)

(declare-fun mapDefault!46976 () ValueCell!14340)

(assert (=> b!1191053 (= condMapEmpty!46976 (= (arr!37145 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14340)) mapDefault!46976)))))

(declare-fun res!792187 () Bool)

(assert (=> start!99990 (=> (not res!792187) (not e!677068))))

(assert (=> start!99990 (= res!792187 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37680 _keys!1208))))))

(assert (=> start!99990 e!677068))

(assert (=> start!99990 tp_is_empty!30099))

(declare-fun array_inv!28326 (array!76989) Bool)

(assert (=> start!99990 (array_inv!28326 _keys!1208)))

(assert (=> start!99990 true))

(assert (=> start!99990 tp!89420))

(declare-fun array_inv!28327 (array!76991) Bool)

(assert (=> start!99990 (and (array_inv!28327 _values!996) e!677071)))

(declare-fun b!1191059 () Bool)

(assert (=> b!1191059 (= e!677068 e!677073)))

(declare-fun res!792181 () Bool)

(assert (=> b!1191059 (=> (not res!792181) (not e!677073))))

(assert (=> b!1191059 (= res!792181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541681 mask!1564))))

(assert (=> b!1191059 (= lt!541681 (array!76990 (store (arr!37144 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37680 _keys!1208)))))

(declare-fun mapNonEmpty!46976 () Bool)

(declare-fun tp!89421 () Bool)

(assert (=> mapNonEmpty!46976 (= mapRes!46976 (and tp!89421 e!677074))))

(declare-fun mapValue!46976 () ValueCell!14340)

(declare-fun mapKey!46976 () (_ BitVec 32))

(declare-fun mapRest!46976 () (Array (_ BitVec 32) ValueCell!14340))

(assert (=> mapNonEmpty!46976 (= (arr!37145 _values!996) (store mapRest!46976 mapKey!46976 mapValue!46976))))

(assert (= (and start!99990 res!792187) b!1191057))

(assert (= (and b!1191057 res!792176) b!1191051))

(assert (= (and b!1191051 res!792184) b!1191056))

(assert (= (and b!1191056 res!792183) b!1191054))

(assert (= (and b!1191054 res!792186) b!1191055))

(assert (= (and b!1191055 res!792179) b!1191046))

(assert (= (and b!1191046 res!792185) b!1191048))

(assert (= (and b!1191048 res!792178) b!1191059))

(assert (= (and b!1191059 res!792181) b!1191052))

(assert (= (and b!1191052 res!792182) b!1191049))

(assert (= (and b!1191049 (not res!792177)) b!1191058))

(assert (= (and b!1191058 (not res!792180)) b!1191047))

(assert (= (and b!1191053 condMapEmpty!46976) mapIsEmpty!46976))

(assert (= (and b!1191053 (not condMapEmpty!46976)) mapNonEmpty!46976))

(get-info :version)

(assert (= (and mapNonEmpty!46976 ((_ is ValueCellFull!14340) mapValue!46976)) b!1191045))

(assert (= (and b!1191053 ((_ is ValueCellFull!14340) mapDefault!46976)) b!1191050))

(assert (= start!99990 b!1191053))

(declare-fun b_lambda!20713 () Bool)

(assert (=> (not b_lambda!20713) (not b!1191058)))

(declare-fun t!38717 () Bool)

(declare-fun tb!10381 () Bool)

(assert (=> (and start!99990 (= defaultEntry!1004 defaultEntry!1004) t!38717) tb!10381))

(declare-fun result!21329 () Bool)

(assert (=> tb!10381 (= result!21329 tp_is_empty!30099)))

(assert (=> b!1191058 t!38717))

(declare-fun b_and!42007 () Bool)

(assert (= b_and!42005 (and (=> t!38717 result!21329) b_and!42007)))

(declare-fun m!1099551 () Bool)

(assert (=> b!1191046 m!1099551))

(declare-fun m!1099553 () Bool)

(assert (=> b!1191052 m!1099553))

(declare-fun m!1099555 () Bool)

(assert (=> start!99990 m!1099555))

(declare-fun m!1099557 () Bool)

(assert (=> start!99990 m!1099557))

(declare-fun m!1099559 () Bool)

(assert (=> mapNonEmpty!46976 m!1099559))

(declare-fun m!1099561 () Bool)

(assert (=> b!1191057 m!1099561))

(declare-fun m!1099563 () Bool)

(assert (=> b!1191054 m!1099563))

(declare-fun m!1099565 () Bool)

(assert (=> b!1191048 m!1099565))

(declare-fun m!1099567 () Bool)

(assert (=> b!1191058 m!1099567))

(declare-fun m!1099569 () Bool)

(assert (=> b!1191058 m!1099569))

(declare-fun m!1099571 () Bool)

(assert (=> b!1191058 m!1099571))

(declare-fun m!1099573 () Bool)

(assert (=> b!1191058 m!1099573))

(declare-fun m!1099575 () Bool)

(assert (=> b!1191059 m!1099575))

(declare-fun m!1099577 () Bool)

(assert (=> b!1191059 m!1099577))

(declare-fun m!1099579 () Bool)

(assert (=> b!1191056 m!1099579))

(declare-fun m!1099581 () Bool)

(assert (=> b!1191047 m!1099581))

(declare-fun m!1099583 () Bool)

(assert (=> b!1191047 m!1099583))

(assert (=> b!1191047 m!1099583))

(declare-fun m!1099585 () Bool)

(assert (=> b!1191047 m!1099585))

(declare-fun m!1099587 () Bool)

(assert (=> b!1191047 m!1099587))

(declare-fun m!1099589 () Bool)

(assert (=> b!1191049 m!1099589))

(declare-fun m!1099591 () Bool)

(assert (=> b!1191049 m!1099591))

(check-sat tp_is_empty!30099 b_and!42007 (not b!1191058) (not b!1191054) (not b!1191052) (not b!1191047) (not mapNonEmpty!46976) (not b!1191057) (not b_next!25569) (not b!1191059) (not start!99990) (not b!1191049) (not b!1191056) (not b_lambda!20713) (not b!1191046))
(check-sat b_and!42007 (not b_next!25569))
