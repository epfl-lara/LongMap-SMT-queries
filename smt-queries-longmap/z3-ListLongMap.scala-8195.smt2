; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100030 () Bool)

(assert start!100030)

(declare-fun b_free!25615 () Bool)

(declare-fun b_next!25615 () Bool)

(assert (=> start!100030 (= b_free!25615 (not b_next!25615))))

(declare-fun tp!89559 () Bool)

(declare-fun b_and!42075 () Bool)

(assert (=> start!100030 (= tp!89559 b_and!42075)))

(declare-fun b!1192002 () Bool)

(declare-fun e!677544 () Bool)

(declare-fun tp_is_empty!30145 () Bool)

(assert (=> b!1192002 (= e!677544 tp_is_empty!30145)))

(declare-fun b!1192003 () Bool)

(declare-fun res!792946 () Bool)

(declare-fun e!677543 () Bool)

(assert (=> b!1192003 (=> (not res!792946) (not e!677543))))

(declare-datatypes ((array!77010 0))(
  ( (array!77011 (arr!37155 (Array (_ BitVec 32) (_ BitVec 64))) (size!37693 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77010)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1192003 (= res!792946 (= (select (arr!37155 _keys!1208) i!673) k0!934))))

(declare-fun b!1192004 () Bool)

(declare-fun res!792940 () Bool)

(declare-fun e!677548 () Bool)

(assert (=> b!1192004 (=> (not res!792940) (not e!677548))))

(declare-fun lt!541908 () array!77010)

(declare-datatypes ((List!26271 0))(
  ( (Nil!26268) (Cons!26267 (h!27476 (_ BitVec 64)) (t!38869 List!26271)) )
))
(declare-fun arrayNoDuplicates!0 (array!77010 (_ BitVec 32) List!26271) Bool)

(assert (=> b!1192004 (= res!792940 (arrayNoDuplicates!0 lt!541908 #b00000000000000000000000000000000 Nil!26268))))

(declare-fun b!1192005 () Bool)

(declare-fun res!792944 () Bool)

(assert (=> b!1192005 (=> (not res!792944) (not e!677543))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45321 0))(
  ( (V!45322 (val!15129 Int)) )
))
(declare-datatypes ((ValueCell!14363 0))(
  ( (ValueCellFull!14363 (v!17766 V!45321)) (EmptyCell!14363) )
))
(declare-datatypes ((array!77012 0))(
  ( (array!77013 (arr!37156 (Array (_ BitVec 32) ValueCell!14363)) (size!37694 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77012)

(assert (=> b!1192005 (= res!792944 (and (= (size!37694 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37693 _keys!1208) (size!37694 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192006 () Bool)

(declare-fun res!792938 () Bool)

(assert (=> b!1192006 (=> (not res!792938) (not e!677543))))

(assert (=> b!1192006 (= res!792938 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37693 _keys!1208))))))

(declare-fun mapNonEmpty!47045 () Bool)

(declare-fun mapRes!47045 () Bool)

(declare-fun tp!89558 () Bool)

(assert (=> mapNonEmpty!47045 (= mapRes!47045 (and tp!89558 e!677544))))

(declare-fun mapKey!47045 () (_ BitVec 32))

(declare-fun mapValue!47045 () ValueCell!14363)

(declare-fun mapRest!47045 () (Array (_ BitVec 32) ValueCell!14363))

(assert (=> mapNonEmpty!47045 (= (arr!37156 _values!996) (store mapRest!47045 mapKey!47045 mapValue!47045))))

(declare-fun b!1192007 () Bool)

(assert (=> b!1192007 (= e!677543 e!677548)))

(declare-fun res!792942 () Bool)

(assert (=> b!1192007 (=> (not res!792942) (not e!677548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77010 (_ BitVec 32)) Bool)

(assert (=> b!1192007 (= res!792942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541908 mask!1564))))

(assert (=> b!1192007 (= lt!541908 (array!77011 (store (arr!37155 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37693 _keys!1208)))))

(declare-fun b!1192008 () Bool)

(declare-fun e!677547 () Bool)

(declare-fun e!677545 () Bool)

(assert (=> b!1192008 (= e!677547 e!677545)))

(declare-fun res!792949 () Bool)

(assert (=> b!1192008 (=> res!792949 e!677545)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192008 (= res!792949 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45321)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19558 0))(
  ( (tuple2!19559 (_1!9790 (_ BitVec 64)) (_2!9790 V!45321)) )
))
(declare-datatypes ((List!26272 0))(
  ( (Nil!26269) (Cons!26268 (h!27477 tuple2!19558) (t!38870 List!26272)) )
))
(declare-datatypes ((ListLongMap!17527 0))(
  ( (ListLongMap!17528 (toList!8779 List!26272)) )
))
(declare-fun lt!541906 () ListLongMap!17527)

(declare-fun lt!541903 () array!77012)

(declare-fun minValue!944 () V!45321)

(declare-fun getCurrentListMapNoExtraKeys!5229 (array!77010 array!77012 (_ BitVec 32) (_ BitVec 32) V!45321 V!45321 (_ BitVec 32) Int) ListLongMap!17527)

(assert (=> b!1192008 (= lt!541906 (getCurrentListMapNoExtraKeys!5229 lt!541908 lt!541903 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3116 (Int (_ BitVec 64)) V!45321)

(assert (=> b!1192008 (= lt!541903 (array!77013 (store (arr!37156 _values!996) i!673 (ValueCellFull!14363 (dynLambda!3116 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37694 _values!996)))))

(declare-fun lt!541907 () ListLongMap!17527)

(assert (=> b!1192008 (= lt!541907 (getCurrentListMapNoExtraKeys!5229 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192009 () Bool)

(declare-fun e!677542 () Bool)

(declare-fun e!677546 () Bool)

(assert (=> b!1192009 (= e!677542 (and e!677546 mapRes!47045))))

(declare-fun condMapEmpty!47045 () Bool)

(declare-fun mapDefault!47045 () ValueCell!14363)

(assert (=> b!1192009 (= condMapEmpty!47045 (= (arr!37156 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14363)) mapDefault!47045)))))

(declare-fun b!1192010 () Bool)

(declare-fun res!792943 () Bool)

(assert (=> b!1192010 (=> (not res!792943) (not e!677543))))

(assert (=> b!1192010 (= res!792943 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26268))))

(declare-fun b!1192012 () Bool)

(assert (=> b!1192012 (= e!677548 (not e!677547))))

(declare-fun res!792945 () Bool)

(assert (=> b!1192012 (=> res!792945 e!677547)))

(assert (=> b!1192012 (= res!792945 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192012 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39425 0))(
  ( (Unit!39426) )
))
(declare-fun lt!541904 () Unit!39425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77010 (_ BitVec 64) (_ BitVec 32)) Unit!39425)

(assert (=> b!1192012 (= lt!541904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192013 () Bool)

(declare-fun res!792948 () Bool)

(assert (=> b!1192013 (=> (not res!792948) (not e!677543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192013 (= res!792948 (validMask!0 mask!1564))))

(declare-fun b!1192014 () Bool)

(assert (=> b!1192014 (= e!677545 true)))

(declare-fun -!1721 (ListLongMap!17527 (_ BitVec 64)) ListLongMap!17527)

(assert (=> b!1192014 (= (getCurrentListMapNoExtraKeys!5229 lt!541908 lt!541903 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1721 (getCurrentListMapNoExtraKeys!5229 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541905 () Unit!39425)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!971 (array!77010 array!77012 (_ BitVec 32) (_ BitVec 32) V!45321 V!45321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39425)

(assert (=> b!1192014 (= lt!541905 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!971 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192015 () Bool)

(declare-fun res!792941 () Bool)

(assert (=> b!1192015 (=> (not res!792941) (not e!677543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192015 (= res!792941 (validKeyInArray!0 k0!934))))

(declare-fun b!1192011 () Bool)

(declare-fun res!792939 () Bool)

(assert (=> b!1192011 (=> (not res!792939) (not e!677543))))

(assert (=> b!1192011 (= res!792939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!792947 () Bool)

(assert (=> start!100030 (=> (not res!792947) (not e!677543))))

(assert (=> start!100030 (= res!792947 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37693 _keys!1208))))))

(assert (=> start!100030 e!677543))

(assert (=> start!100030 tp_is_empty!30145))

(declare-fun array_inv!28454 (array!77010) Bool)

(assert (=> start!100030 (array_inv!28454 _keys!1208)))

(assert (=> start!100030 true))

(assert (=> start!100030 tp!89559))

(declare-fun array_inv!28455 (array!77012) Bool)

(assert (=> start!100030 (and (array_inv!28455 _values!996) e!677542)))

(declare-fun b!1192016 () Bool)

(assert (=> b!1192016 (= e!677546 tp_is_empty!30145)))

(declare-fun mapIsEmpty!47045 () Bool)

(assert (=> mapIsEmpty!47045 mapRes!47045))

(assert (= (and start!100030 res!792947) b!1192013))

(assert (= (and b!1192013 res!792948) b!1192005))

(assert (= (and b!1192005 res!792944) b!1192011))

(assert (= (and b!1192011 res!792939) b!1192010))

(assert (= (and b!1192010 res!792943) b!1192006))

(assert (= (and b!1192006 res!792938) b!1192015))

(assert (= (and b!1192015 res!792941) b!1192003))

(assert (= (and b!1192003 res!792946) b!1192007))

(assert (= (and b!1192007 res!792942) b!1192004))

(assert (= (and b!1192004 res!792940) b!1192012))

(assert (= (and b!1192012 (not res!792945)) b!1192008))

(assert (= (and b!1192008 (not res!792949)) b!1192014))

(assert (= (and b!1192009 condMapEmpty!47045) mapIsEmpty!47045))

(assert (= (and b!1192009 (not condMapEmpty!47045)) mapNonEmpty!47045))

(get-info :version)

(assert (= (and mapNonEmpty!47045 ((_ is ValueCellFull!14363) mapValue!47045)) b!1192002))

(assert (= (and b!1192009 ((_ is ValueCellFull!14363) mapDefault!47045)) b!1192016))

(assert (= start!100030 b!1192009))

(declare-fun b_lambda!20741 () Bool)

(assert (=> (not b_lambda!20741) (not b!1192008)))

(declare-fun t!38868 () Bool)

(declare-fun tb!10419 () Bool)

(assert (=> (and start!100030 (= defaultEntry!1004 defaultEntry!1004) t!38868) tb!10419))

(declare-fun result!21413 () Bool)

(assert (=> tb!10419 (= result!21413 tp_is_empty!30145)))

(assert (=> b!1192008 t!38868))

(declare-fun b_and!42077 () Bool)

(assert (= b_and!42075 (and (=> t!38868 result!21413) b_and!42077)))

(declare-fun m!1099907 () Bool)

(assert (=> b!1192004 m!1099907))

(declare-fun m!1099909 () Bool)

(assert (=> b!1192014 m!1099909))

(declare-fun m!1099911 () Bool)

(assert (=> b!1192014 m!1099911))

(assert (=> b!1192014 m!1099911))

(declare-fun m!1099913 () Bool)

(assert (=> b!1192014 m!1099913))

(declare-fun m!1099915 () Bool)

(assert (=> b!1192014 m!1099915))

(declare-fun m!1099917 () Bool)

(assert (=> b!1192008 m!1099917))

(declare-fun m!1099919 () Bool)

(assert (=> b!1192008 m!1099919))

(declare-fun m!1099921 () Bool)

(assert (=> b!1192008 m!1099921))

(declare-fun m!1099923 () Bool)

(assert (=> b!1192008 m!1099923))

(declare-fun m!1099925 () Bool)

(assert (=> b!1192013 m!1099925))

(declare-fun m!1099927 () Bool)

(assert (=> b!1192012 m!1099927))

(declare-fun m!1099929 () Bool)

(assert (=> b!1192012 m!1099929))

(declare-fun m!1099931 () Bool)

(assert (=> mapNonEmpty!47045 m!1099931))

(declare-fun m!1099933 () Bool)

(assert (=> b!1192010 m!1099933))

(declare-fun m!1099935 () Bool)

(assert (=> b!1192007 m!1099935))

(declare-fun m!1099937 () Bool)

(assert (=> b!1192007 m!1099937))

(declare-fun m!1099939 () Bool)

(assert (=> b!1192011 m!1099939))

(declare-fun m!1099941 () Bool)

(assert (=> b!1192003 m!1099941))

(declare-fun m!1099943 () Bool)

(assert (=> start!100030 m!1099943))

(declare-fun m!1099945 () Bool)

(assert (=> start!100030 m!1099945))

(declare-fun m!1099947 () Bool)

(assert (=> b!1192015 m!1099947))

(check-sat (not b!1192010) (not b!1192015) (not b!1192008) (not b!1192014) (not b!1192013) (not b!1192007) tp_is_empty!30145 (not b_next!25615) (not b!1192004) (not b!1192011) (not start!100030) (not mapNonEmpty!47045) (not b!1192012) (not b_lambda!20741) b_and!42077)
(check-sat b_and!42077 (not b_next!25615))
