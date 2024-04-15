; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97508 () Bool)

(assert start!97508)

(declare-fun b!1113132 () Bool)

(declare-fun res!742926 () Bool)

(declare-fun e!634547 () Bool)

(assert (=> b!1113132 (=> (not res!742926) (not e!634547))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72298 0))(
  ( (array!72299 (arr!34802 (Array (_ BitVec 32) (_ BitVec 64))) (size!35340 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72298)

(assert (=> b!1113132 (= res!742926 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35340 _keys!1208))))))

(declare-fun res!742929 () Bool)

(assert (=> start!97508 (=> (not res!742929) (not e!634547))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97508 (= res!742929 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35340 _keys!1208))))))

(assert (=> start!97508 e!634547))

(declare-fun array_inv!26832 (array!72298) Bool)

(assert (=> start!97508 (array_inv!26832 _keys!1208)))

(assert (=> start!97508 true))

(declare-datatypes ((V!42121 0))(
  ( (V!42122 (val!13929 Int)) )
))
(declare-datatypes ((ValueCell!13163 0))(
  ( (ValueCellFull!13163 (v!16561 V!42121)) (EmptyCell!13163) )
))
(declare-datatypes ((array!72300 0))(
  ( (array!72301 (arr!34803 (Array (_ BitVec 32) ValueCell!13163)) (size!35341 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72300)

(declare-fun e!634548 () Bool)

(declare-fun array_inv!26833 (array!72300) Bool)

(assert (=> start!97508 (and (array_inv!26833 _values!996) e!634548)))

(declare-fun b!1113133 () Bool)

(declare-fun e!634545 () Bool)

(assert (=> b!1113133 (= e!634547 e!634545)))

(declare-fun res!742931 () Bool)

(assert (=> b!1113133 (=> (not res!742931) (not e!634545))))

(declare-fun lt!496446 () array!72298)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72298 (_ BitVec 32)) Bool)

(assert (=> b!1113133 (= res!742931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496446 mask!1564))))

(assert (=> b!1113133 (= lt!496446 (array!72299 (store (arr!34802 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35340 _keys!1208)))))

(declare-fun b!1113134 () Bool)

(declare-fun res!742927 () Bool)

(assert (=> b!1113134 (=> (not res!742927) (not e!634547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113134 (= res!742927 (validMask!0 mask!1564))))

(declare-fun b!1113135 () Bool)

(declare-fun e!634544 () Bool)

(declare-fun tp_is_empty!27745 () Bool)

(assert (=> b!1113135 (= e!634544 tp_is_empty!27745)))

(declare-fun b!1113136 () Bool)

(declare-fun res!742925 () Bool)

(assert (=> b!1113136 (=> (not res!742925) (not e!634547))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113136 (= res!742925 (validKeyInArray!0 k0!934))))

(declare-fun b!1113137 () Bool)

(declare-fun res!742928 () Bool)

(assert (=> b!1113137 (=> (not res!742928) (not e!634547))))

(declare-datatypes ((List!24338 0))(
  ( (Nil!24335) (Cons!24334 (h!25543 (_ BitVec 64)) (t!34810 List!24338)) )
))
(declare-fun arrayNoDuplicates!0 (array!72298 (_ BitVec 32) List!24338) Bool)

(assert (=> b!1113137 (= res!742928 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24335))))

(declare-fun mapNonEmpty!43435 () Bool)

(declare-fun mapRes!43435 () Bool)

(declare-fun tp!82679 () Bool)

(declare-fun e!634546 () Bool)

(assert (=> mapNonEmpty!43435 (= mapRes!43435 (and tp!82679 e!634546))))

(declare-fun mapValue!43435 () ValueCell!13163)

(declare-fun mapKey!43435 () (_ BitVec 32))

(declare-fun mapRest!43435 () (Array (_ BitVec 32) ValueCell!13163))

(assert (=> mapNonEmpty!43435 (= (arr!34803 _values!996) (store mapRest!43435 mapKey!43435 mapValue!43435))))

(declare-fun b!1113138 () Bool)

(assert (=> b!1113138 (= e!634545 (not true))))

(declare-fun arrayContainsKey!0 (array!72298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113138 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36353 0))(
  ( (Unit!36354) )
))
(declare-fun lt!496445 () Unit!36353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72298 (_ BitVec 64) (_ BitVec 32)) Unit!36353)

(assert (=> b!1113138 (= lt!496445 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113139 () Bool)

(declare-fun res!742930 () Bool)

(assert (=> b!1113139 (=> (not res!742930) (not e!634547))))

(assert (=> b!1113139 (= res!742930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43435 () Bool)

(assert (=> mapIsEmpty!43435 mapRes!43435))

(declare-fun b!1113140 () Bool)

(assert (=> b!1113140 (= e!634546 tp_is_empty!27745)))

(declare-fun b!1113141 () Bool)

(declare-fun res!742932 () Bool)

(assert (=> b!1113141 (=> (not res!742932) (not e!634547))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113141 (= res!742932 (and (= (size!35341 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35340 _keys!1208) (size!35341 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113142 () Bool)

(declare-fun res!742924 () Bool)

(assert (=> b!1113142 (=> (not res!742924) (not e!634547))))

(assert (=> b!1113142 (= res!742924 (= (select (arr!34802 _keys!1208) i!673) k0!934))))

(declare-fun b!1113143 () Bool)

(assert (=> b!1113143 (= e!634548 (and e!634544 mapRes!43435))))

(declare-fun condMapEmpty!43435 () Bool)

(declare-fun mapDefault!43435 () ValueCell!13163)

(assert (=> b!1113143 (= condMapEmpty!43435 (= (arr!34803 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13163)) mapDefault!43435)))))

(declare-fun b!1113144 () Bool)

(declare-fun res!742933 () Bool)

(assert (=> b!1113144 (=> (not res!742933) (not e!634545))))

(assert (=> b!1113144 (= res!742933 (arrayNoDuplicates!0 lt!496446 #b00000000000000000000000000000000 Nil!24335))))

(assert (= (and start!97508 res!742929) b!1113134))

(assert (= (and b!1113134 res!742927) b!1113141))

(assert (= (and b!1113141 res!742932) b!1113139))

(assert (= (and b!1113139 res!742930) b!1113137))

(assert (= (and b!1113137 res!742928) b!1113132))

(assert (= (and b!1113132 res!742926) b!1113136))

(assert (= (and b!1113136 res!742925) b!1113142))

(assert (= (and b!1113142 res!742924) b!1113133))

(assert (= (and b!1113133 res!742931) b!1113144))

(assert (= (and b!1113144 res!742933) b!1113138))

(assert (= (and b!1113143 condMapEmpty!43435) mapIsEmpty!43435))

(assert (= (and b!1113143 (not condMapEmpty!43435)) mapNonEmpty!43435))

(get-info :version)

(assert (= (and mapNonEmpty!43435 ((_ is ValueCellFull!13163) mapValue!43435)) b!1113140))

(assert (= (and b!1113143 ((_ is ValueCellFull!13163) mapDefault!43435)) b!1113135))

(assert (= start!97508 b!1113143))

(declare-fun m!1029903 () Bool)

(assert (=> start!97508 m!1029903))

(declare-fun m!1029905 () Bool)

(assert (=> start!97508 m!1029905))

(declare-fun m!1029907 () Bool)

(assert (=> b!1113137 m!1029907))

(declare-fun m!1029909 () Bool)

(assert (=> b!1113138 m!1029909))

(declare-fun m!1029911 () Bool)

(assert (=> b!1113138 m!1029911))

(declare-fun m!1029913 () Bool)

(assert (=> b!1113142 m!1029913))

(declare-fun m!1029915 () Bool)

(assert (=> mapNonEmpty!43435 m!1029915))

(declare-fun m!1029917 () Bool)

(assert (=> b!1113134 m!1029917))

(declare-fun m!1029919 () Bool)

(assert (=> b!1113139 m!1029919))

(declare-fun m!1029921 () Bool)

(assert (=> b!1113133 m!1029921))

(declare-fun m!1029923 () Bool)

(assert (=> b!1113133 m!1029923))

(declare-fun m!1029925 () Bool)

(assert (=> b!1113144 m!1029925))

(declare-fun m!1029927 () Bool)

(assert (=> b!1113136 m!1029927))

(check-sat tp_is_empty!27745 (not b!1113137) (not b!1113136) (not b!1113144) (not mapNonEmpty!43435) (not b!1113138) (not b!1113133) (not b!1113139) (not b!1113134) (not start!97508))
(check-sat)
