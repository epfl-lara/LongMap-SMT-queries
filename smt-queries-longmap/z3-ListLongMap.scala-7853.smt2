; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97856 () Bool)

(assert start!97856)

(declare-fun b_free!23563 () Bool)

(declare-fun b_next!23563 () Bool)

(assert (=> start!97856 (= b_free!23563 (not b_next!23563))))

(declare-fun tp!83392 () Bool)

(declare-fun b_and!37887 () Bool)

(assert (=> start!97856 (= tp!83392 b_and!37887)))

(declare-fun b!1120181 () Bool)

(declare-fun e!637866 () Bool)

(assert (=> b!1120181 (= e!637866 true)))

(declare-datatypes ((V!42585 0))(
  ( (V!42586 (val!14103 Int)) )
))
(declare-fun zeroValue!944 () V!42585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72980 0))(
  ( (array!72981 (arr!35143 (Array (_ BitVec 32) (_ BitVec 64))) (size!35681 (_ BitVec 32))) )
))
(declare-fun lt!497790 () array!72980)

(declare-datatypes ((ValueCell!13337 0))(
  ( (ValueCellFull!13337 (v!16735 V!42585)) (EmptyCell!13337) )
))
(declare-datatypes ((array!72982 0))(
  ( (array!72983 (arr!35144 (Array (_ BitVec 32) ValueCell!13337)) (size!35682 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72982)

(declare-fun minValue!944 () V!42585)

(declare-datatypes ((tuple2!17760 0))(
  ( (tuple2!17761 (_1!8891 (_ BitVec 64)) (_2!8891 V!42585)) )
))
(declare-datatypes ((List!24532 0))(
  ( (Nil!24529) (Cons!24528 (h!25737 tuple2!17760) (t!35078 List!24532)) )
))
(declare-datatypes ((ListLongMap!15729 0))(
  ( (ListLongMap!15730 (toList!7880 List!24532)) )
))
(declare-fun lt!497791 () ListLongMap!15729)

(declare-fun getCurrentListMapNoExtraKeys!4389 (array!72980 array!72982 (_ BitVec 32) (_ BitVec 32) V!42585 V!42585 (_ BitVec 32) Int) ListLongMap!15729)

(declare-fun dynLambda!2432 (Int (_ BitVec 64)) V!42585)

(assert (=> b!1120181 (= lt!497791 (getCurrentListMapNoExtraKeys!4389 lt!497790 (array!72983 (store (arr!35144 _values!996) i!673 (ValueCellFull!13337 (dynLambda!2432 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35682 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!72980)

(declare-fun lt!497792 () ListLongMap!15729)

(assert (=> b!1120181 (= lt!497792 (getCurrentListMapNoExtraKeys!4389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120182 () Bool)

(declare-fun e!637867 () Bool)

(declare-fun tp_is_empty!28093 () Bool)

(assert (=> b!1120182 (= e!637867 tp_is_empty!28093)))

(declare-fun b!1120183 () Bool)

(declare-fun res!748341 () Bool)

(declare-fun e!637868 () Bool)

(assert (=> b!1120183 (=> (not res!748341) (not e!637868))))

(assert (=> b!1120183 (= res!748341 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35681 _keys!1208))))))

(declare-fun b!1120184 () Bool)

(declare-fun e!637871 () Bool)

(assert (=> b!1120184 (= e!637868 e!637871)))

(declare-fun res!748344 () Bool)

(assert (=> b!1120184 (=> (not res!748344) (not e!637871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72980 (_ BitVec 32)) Bool)

(assert (=> b!1120184 (= res!748344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497790 mask!1564))))

(assert (=> b!1120184 (= lt!497790 (array!72981 (store (arr!35143 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35681 _keys!1208)))))

(declare-fun b!1120185 () Bool)

(declare-fun res!748345 () Bool)

(assert (=> b!1120185 (=> (not res!748345) (not e!637868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120185 (= res!748345 (validMask!0 mask!1564))))

(declare-fun b!1120186 () Bool)

(declare-fun res!748339 () Bool)

(assert (=> b!1120186 (=> (not res!748339) (not e!637868))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120186 (= res!748339 (validKeyInArray!0 k0!934))))

(declare-fun res!748342 () Bool)

(assert (=> start!97856 (=> (not res!748342) (not e!637868))))

(assert (=> start!97856 (= res!748342 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35681 _keys!1208))))))

(assert (=> start!97856 e!637868))

(assert (=> start!97856 tp_is_empty!28093))

(declare-fun array_inv!27064 (array!72980) Bool)

(assert (=> start!97856 (array_inv!27064 _keys!1208)))

(assert (=> start!97856 true))

(assert (=> start!97856 tp!83392))

(declare-fun e!637869 () Bool)

(declare-fun array_inv!27065 (array!72982) Bool)

(assert (=> start!97856 (and (array_inv!27065 _values!996) e!637869)))

(declare-fun b!1120187 () Bool)

(declare-fun mapRes!43957 () Bool)

(assert (=> b!1120187 (= e!637869 (and e!637867 mapRes!43957))))

(declare-fun condMapEmpty!43957 () Bool)

(declare-fun mapDefault!43957 () ValueCell!13337)

(assert (=> b!1120187 (= condMapEmpty!43957 (= (arr!35144 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13337)) mapDefault!43957)))))

(declare-fun b!1120188 () Bool)

(declare-fun res!748335 () Bool)

(assert (=> b!1120188 (=> (not res!748335) (not e!637868))))

(assert (=> b!1120188 (= res!748335 (and (= (size!35682 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35681 _keys!1208) (size!35682 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120189 () Bool)

(declare-fun res!748336 () Bool)

(assert (=> b!1120189 (=> (not res!748336) (not e!637871))))

(declare-datatypes ((List!24533 0))(
  ( (Nil!24530) (Cons!24529 (h!25738 (_ BitVec 64)) (t!35079 List!24533)) )
))
(declare-fun arrayNoDuplicates!0 (array!72980 (_ BitVec 32) List!24533) Bool)

(assert (=> b!1120189 (= res!748336 (arrayNoDuplicates!0 lt!497790 #b00000000000000000000000000000000 Nil!24530))))

(declare-fun b!1120190 () Bool)

(assert (=> b!1120190 (= e!637871 (not e!637866))))

(declare-fun res!748343 () Bool)

(assert (=> b!1120190 (=> res!748343 e!637866)))

(assert (=> b!1120190 (= res!748343 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120190 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36583 0))(
  ( (Unit!36584) )
))
(declare-fun lt!497793 () Unit!36583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72980 (_ BitVec 64) (_ BitVec 32)) Unit!36583)

(assert (=> b!1120190 (= lt!497793 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120191 () Bool)

(declare-fun res!748337 () Bool)

(assert (=> b!1120191 (=> (not res!748337) (not e!637868))))

(assert (=> b!1120191 (= res!748337 (= (select (arr!35143 _keys!1208) i!673) k0!934))))

(declare-fun b!1120192 () Bool)

(declare-fun res!748338 () Bool)

(assert (=> b!1120192 (=> (not res!748338) (not e!637868))))

(assert (=> b!1120192 (= res!748338 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24530))))

(declare-fun mapIsEmpty!43957 () Bool)

(assert (=> mapIsEmpty!43957 mapRes!43957))

(declare-fun b!1120193 () Bool)

(declare-fun e!637872 () Bool)

(assert (=> b!1120193 (= e!637872 tp_is_empty!28093)))

(declare-fun mapNonEmpty!43957 () Bool)

(declare-fun tp!83393 () Bool)

(assert (=> mapNonEmpty!43957 (= mapRes!43957 (and tp!83393 e!637872))))

(declare-fun mapValue!43957 () ValueCell!13337)

(declare-fun mapKey!43957 () (_ BitVec 32))

(declare-fun mapRest!43957 () (Array (_ BitVec 32) ValueCell!13337))

(assert (=> mapNonEmpty!43957 (= (arr!35144 _values!996) (store mapRest!43957 mapKey!43957 mapValue!43957))))

(declare-fun b!1120194 () Bool)

(declare-fun res!748340 () Bool)

(assert (=> b!1120194 (=> (not res!748340) (not e!637868))))

(assert (=> b!1120194 (= res!748340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97856 res!748342) b!1120185))

(assert (= (and b!1120185 res!748345) b!1120188))

(assert (= (and b!1120188 res!748335) b!1120194))

(assert (= (and b!1120194 res!748340) b!1120192))

(assert (= (and b!1120192 res!748338) b!1120183))

(assert (= (and b!1120183 res!748341) b!1120186))

(assert (= (and b!1120186 res!748339) b!1120191))

(assert (= (and b!1120191 res!748337) b!1120184))

(assert (= (and b!1120184 res!748344) b!1120189))

(assert (= (and b!1120189 res!748336) b!1120190))

(assert (= (and b!1120190 (not res!748343)) b!1120181))

(assert (= (and b!1120187 condMapEmpty!43957) mapIsEmpty!43957))

(assert (= (and b!1120187 (not condMapEmpty!43957)) mapNonEmpty!43957))

(get-info :version)

(assert (= (and mapNonEmpty!43957 ((_ is ValueCellFull!13337) mapValue!43957)) b!1120193))

(assert (= (and b!1120187 ((_ is ValueCellFull!13337) mapDefault!43957)) b!1120182))

(assert (= start!97856 b!1120187))

(declare-fun b_lambda!18515 () Bool)

(assert (=> (not b_lambda!18515) (not b!1120181)))

(declare-fun t!35077 () Bool)

(declare-fun tb!8367 () Bool)

(assert (=> (and start!97856 (= defaultEntry!1004 defaultEntry!1004) t!35077) tb!8367))

(declare-fun result!17303 () Bool)

(assert (=> tb!8367 (= result!17303 tp_is_empty!28093)))

(assert (=> b!1120181 t!35077))

(declare-fun b_and!37889 () Bool)

(assert (= b_and!37887 (and (=> t!35077 result!17303) b_and!37889)))

(declare-fun m!1034769 () Bool)

(assert (=> b!1120190 m!1034769))

(declare-fun m!1034771 () Bool)

(assert (=> b!1120190 m!1034771))

(declare-fun m!1034773 () Bool)

(assert (=> start!97856 m!1034773))

(declare-fun m!1034775 () Bool)

(assert (=> start!97856 m!1034775))

(declare-fun m!1034777 () Bool)

(assert (=> b!1120184 m!1034777))

(declare-fun m!1034779 () Bool)

(assert (=> b!1120184 m!1034779))

(declare-fun m!1034781 () Bool)

(assert (=> mapNonEmpty!43957 m!1034781))

(declare-fun m!1034783 () Bool)

(assert (=> b!1120189 m!1034783))

(declare-fun m!1034785 () Bool)

(assert (=> b!1120181 m!1034785))

(declare-fun m!1034787 () Bool)

(assert (=> b!1120181 m!1034787))

(declare-fun m!1034789 () Bool)

(assert (=> b!1120181 m!1034789))

(declare-fun m!1034791 () Bool)

(assert (=> b!1120181 m!1034791))

(declare-fun m!1034793 () Bool)

(assert (=> b!1120192 m!1034793))

(declare-fun m!1034795 () Bool)

(assert (=> b!1120194 m!1034795))

(declare-fun m!1034797 () Bool)

(assert (=> b!1120185 m!1034797))

(declare-fun m!1034799 () Bool)

(assert (=> b!1120186 m!1034799))

(declare-fun m!1034801 () Bool)

(assert (=> b!1120191 m!1034801))

(check-sat (not b!1120192) (not b!1120194) (not b!1120181) (not start!97856) (not b!1120186) (not b_next!23563) (not b!1120189) (not b!1120184) b_and!37889 tp_is_empty!28093 (not mapNonEmpty!43957) (not b!1120185) (not b_lambda!18515) (not b!1120190))
(check-sat b_and!37889 (not b_next!23563))
