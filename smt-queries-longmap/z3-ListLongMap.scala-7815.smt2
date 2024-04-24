; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97870 () Bool)

(assert start!97870)

(declare-fun b!1116928 () Bool)

(declare-fun res!745315 () Bool)

(declare-fun e!636563 () Bool)

(assert (=> b!1116928 (=> (not res!745315) (not e!636563))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116928 (= res!745315 (validKeyInArray!0 k0!934))))

(declare-fun b!1116929 () Bool)

(declare-fun res!745321 () Bool)

(assert (=> b!1116929 (=> (not res!745321) (not e!636563))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72669 0))(
  ( (array!72670 (arr!34981 (Array (_ BitVec 32) (_ BitVec 64))) (size!35518 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72669)

(assert (=> b!1116929 (= res!745321 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35518 _keys!1208))))))

(declare-fun b!1116930 () Bool)

(declare-fun e!636561 () Bool)

(declare-fun tp_is_empty!27865 () Bool)

(assert (=> b!1116930 (= e!636561 tp_is_empty!27865)))

(declare-fun mapIsEmpty!43615 () Bool)

(declare-fun mapRes!43615 () Bool)

(assert (=> mapIsEmpty!43615 mapRes!43615))

(declare-fun res!745320 () Bool)

(assert (=> start!97870 (=> (not res!745320) (not e!636563))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97870 (= res!745320 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35518 _keys!1208))))))

(assert (=> start!97870 e!636563))

(declare-fun array_inv!26950 (array!72669) Bool)

(assert (=> start!97870 (array_inv!26950 _keys!1208)))

(assert (=> start!97870 true))

(declare-datatypes ((V!42281 0))(
  ( (V!42282 (val!13989 Int)) )
))
(declare-datatypes ((ValueCell!13223 0))(
  ( (ValueCellFull!13223 (v!16618 V!42281)) (EmptyCell!13223) )
))
(declare-datatypes ((array!72671 0))(
  ( (array!72672 (arr!34982 (Array (_ BitVec 32) ValueCell!13223)) (size!35519 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72671)

(declare-fun e!636559 () Bool)

(declare-fun array_inv!26951 (array!72671) Bool)

(assert (=> start!97870 (and (array_inv!26951 _values!996) e!636559)))

(declare-fun b!1116931 () Bool)

(declare-fun res!745324 () Bool)

(assert (=> b!1116931 (=> (not res!745324) (not e!636563))))

(declare-datatypes ((List!24371 0))(
  ( (Nil!24368) (Cons!24367 (h!25585 (_ BitVec 64)) (t!34844 List!24371)) )
))
(declare-fun arrayNoDuplicates!0 (array!72669 (_ BitVec 32) List!24371) Bool)

(assert (=> b!1116931 (= res!745324 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24368))))

(declare-fun mapNonEmpty!43615 () Bool)

(declare-fun tp!82859 () Bool)

(assert (=> mapNonEmpty!43615 (= mapRes!43615 (and tp!82859 e!636561))))

(declare-fun mapKey!43615 () (_ BitVec 32))

(declare-fun mapRest!43615 () (Array (_ BitVec 32) ValueCell!13223))

(declare-fun mapValue!43615 () ValueCell!13223)

(assert (=> mapNonEmpty!43615 (= (arr!34982 _values!996) (store mapRest!43615 mapKey!43615 mapValue!43615))))

(declare-fun b!1116932 () Bool)

(declare-fun res!745318 () Bool)

(assert (=> b!1116932 (=> (not res!745318) (not e!636563))))

(assert (=> b!1116932 (= res!745318 (= (select (arr!34981 _keys!1208) i!673) k0!934))))

(declare-fun b!1116933 () Bool)

(declare-fun res!745323 () Bool)

(declare-fun e!636564 () Bool)

(assert (=> b!1116933 (=> (not res!745323) (not e!636564))))

(declare-fun lt!497521 () array!72669)

(assert (=> b!1116933 (= res!745323 (arrayNoDuplicates!0 lt!497521 #b00000000000000000000000000000000 Nil!24368))))

(declare-fun b!1116934 () Bool)

(declare-fun e!636560 () Bool)

(assert (=> b!1116934 (= e!636560 tp_is_empty!27865)))

(declare-fun b!1116935 () Bool)

(assert (=> b!1116935 (= e!636563 e!636564)))

(declare-fun res!745317 () Bool)

(assert (=> b!1116935 (=> (not res!745317) (not e!636564))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72669 (_ BitVec 32)) Bool)

(assert (=> b!1116935 (= res!745317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497521 mask!1564))))

(assert (=> b!1116935 (= lt!497521 (array!72670 (store (arr!34981 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35518 _keys!1208)))))

(declare-fun b!1116936 () Bool)

(declare-fun res!745316 () Bool)

(assert (=> b!1116936 (=> (not res!745316) (not e!636563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116936 (= res!745316 (validMask!0 mask!1564))))

(declare-fun b!1116937 () Bool)

(assert (=> b!1116937 (= e!636559 (and e!636560 mapRes!43615))))

(declare-fun condMapEmpty!43615 () Bool)

(declare-fun mapDefault!43615 () ValueCell!13223)

(assert (=> b!1116937 (= condMapEmpty!43615 (= (arr!34982 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13223)) mapDefault!43615)))))

(declare-fun b!1116938 () Bool)

(declare-fun res!745319 () Bool)

(assert (=> b!1116938 (=> (not res!745319) (not e!636563))))

(assert (=> b!1116938 (= res!745319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116939 () Bool)

(assert (=> b!1116939 (= e!636564 (not true))))

(declare-fun arrayContainsKey!0 (array!72669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116939 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36581 0))(
  ( (Unit!36582) )
))
(declare-fun lt!497520 () Unit!36581)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72669 (_ BitVec 64) (_ BitVec 32)) Unit!36581)

(assert (=> b!1116939 (= lt!497520 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116940 () Bool)

(declare-fun res!745322 () Bool)

(assert (=> b!1116940 (=> (not res!745322) (not e!636563))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116940 (= res!745322 (and (= (size!35519 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35518 _keys!1208) (size!35519 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97870 res!745320) b!1116936))

(assert (= (and b!1116936 res!745316) b!1116940))

(assert (= (and b!1116940 res!745322) b!1116938))

(assert (= (and b!1116938 res!745319) b!1116931))

(assert (= (and b!1116931 res!745324) b!1116929))

(assert (= (and b!1116929 res!745321) b!1116928))

(assert (= (and b!1116928 res!745315) b!1116932))

(assert (= (and b!1116932 res!745318) b!1116935))

(assert (= (and b!1116935 res!745317) b!1116933))

(assert (= (and b!1116933 res!745323) b!1116939))

(assert (= (and b!1116937 condMapEmpty!43615) mapIsEmpty!43615))

(assert (= (and b!1116937 (not condMapEmpty!43615)) mapNonEmpty!43615))

(get-info :version)

(assert (= (and mapNonEmpty!43615 ((_ is ValueCellFull!13223) mapValue!43615)) b!1116930))

(assert (= (and b!1116937 ((_ is ValueCellFull!13223) mapDefault!43615)) b!1116934))

(assert (= start!97870 b!1116937))

(declare-fun m!1033761 () Bool)

(assert (=> mapNonEmpty!43615 m!1033761))

(declare-fun m!1033763 () Bool)

(assert (=> b!1116931 m!1033763))

(declare-fun m!1033765 () Bool)

(assert (=> b!1116938 m!1033765))

(declare-fun m!1033767 () Bool)

(assert (=> b!1116933 m!1033767))

(declare-fun m!1033769 () Bool)

(assert (=> start!97870 m!1033769))

(declare-fun m!1033771 () Bool)

(assert (=> start!97870 m!1033771))

(declare-fun m!1033773 () Bool)

(assert (=> b!1116939 m!1033773))

(declare-fun m!1033775 () Bool)

(assert (=> b!1116939 m!1033775))

(declare-fun m!1033777 () Bool)

(assert (=> b!1116932 m!1033777))

(declare-fun m!1033779 () Bool)

(assert (=> b!1116935 m!1033779))

(declare-fun m!1033781 () Bool)

(assert (=> b!1116935 m!1033781))

(declare-fun m!1033783 () Bool)

(assert (=> b!1116936 m!1033783))

(declare-fun m!1033785 () Bool)

(assert (=> b!1116928 m!1033785))

(check-sat (not start!97870) tp_is_empty!27865 (not b!1116928) (not b!1116931) (not b!1116939) (not mapNonEmpty!43615) (not b!1116936) (not b!1116935) (not b!1116938) (not b!1116933))
(check-sat)
