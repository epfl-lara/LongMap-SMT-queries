; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97876 () Bool)

(assert start!97876)

(declare-fun b!1117045 () Bool)

(declare-fun res!745408 () Bool)

(declare-fun e!636613 () Bool)

(assert (=> b!1117045 (=> (not res!745408) (not e!636613))))

(declare-datatypes ((array!72681 0))(
  ( (array!72682 (arr!34987 (Array (_ BitVec 32) (_ BitVec 64))) (size!35524 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72681)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117045 (= res!745408 (= (select (arr!34987 _keys!1208) i!673) k0!934))))

(declare-fun b!1117046 () Bool)

(declare-fun res!745405 () Bool)

(assert (=> b!1117046 (=> (not res!745405) (not e!636613))))

(assert (=> b!1117046 (= res!745405 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35524 _keys!1208))))))

(declare-fun b!1117047 () Bool)

(declare-fun res!745407 () Bool)

(assert (=> b!1117047 (=> (not res!745407) (not e!636613))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117047 (= res!745407 (validMask!0 mask!1564))))

(declare-fun b!1117048 () Bool)

(declare-fun e!636618 () Bool)

(declare-fun tp_is_empty!27871 () Bool)

(assert (=> b!1117048 (= e!636618 tp_is_empty!27871)))

(declare-fun mapIsEmpty!43624 () Bool)

(declare-fun mapRes!43624 () Bool)

(assert (=> mapIsEmpty!43624 mapRes!43624))

(declare-fun b!1117049 () Bool)

(declare-fun e!636614 () Bool)

(declare-fun e!636615 () Bool)

(assert (=> b!1117049 (= e!636614 (and e!636615 mapRes!43624))))

(declare-fun condMapEmpty!43624 () Bool)

(declare-datatypes ((V!42289 0))(
  ( (V!42290 (val!13992 Int)) )
))
(declare-datatypes ((ValueCell!13226 0))(
  ( (ValueCellFull!13226 (v!16621 V!42289)) (EmptyCell!13226) )
))
(declare-datatypes ((array!72683 0))(
  ( (array!72684 (arr!34988 (Array (_ BitVec 32) ValueCell!13226)) (size!35525 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72683)

(declare-fun mapDefault!43624 () ValueCell!13226)

(assert (=> b!1117049 (= condMapEmpty!43624 (= (arr!34988 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13226)) mapDefault!43624)))))

(declare-fun b!1117050 () Bool)

(declare-fun res!745414 () Bool)

(assert (=> b!1117050 (=> (not res!745414) (not e!636613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117050 (= res!745414 (validKeyInArray!0 k0!934))))

(declare-fun b!1117051 () Bool)

(declare-fun res!745412 () Bool)

(assert (=> b!1117051 (=> (not res!745412) (not e!636613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72681 (_ BitVec 32)) Bool)

(assert (=> b!1117051 (= res!745412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117052 () Bool)

(declare-fun res!745410 () Bool)

(assert (=> b!1117052 (=> (not res!745410) (not e!636613))))

(declare-datatypes ((List!24373 0))(
  ( (Nil!24370) (Cons!24369 (h!25587 (_ BitVec 64)) (t!34846 List!24373)) )
))
(declare-fun arrayNoDuplicates!0 (array!72681 (_ BitVec 32) List!24373) Bool)

(assert (=> b!1117052 (= res!745410 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24370))))

(declare-fun b!1117053 () Bool)

(declare-fun e!636616 () Bool)

(assert (=> b!1117053 (= e!636613 e!636616)))

(declare-fun res!745406 () Bool)

(assert (=> b!1117053 (=> (not res!745406) (not e!636616))))

(declare-fun lt!497538 () array!72681)

(assert (=> b!1117053 (= res!745406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497538 mask!1564))))

(assert (=> b!1117053 (= lt!497538 (array!72682 (store (arr!34987 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35524 _keys!1208)))))

(declare-fun res!745413 () Bool)

(assert (=> start!97876 (=> (not res!745413) (not e!636613))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97876 (= res!745413 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35524 _keys!1208))))))

(assert (=> start!97876 e!636613))

(declare-fun array_inv!26956 (array!72681) Bool)

(assert (=> start!97876 (array_inv!26956 _keys!1208)))

(assert (=> start!97876 true))

(declare-fun array_inv!26957 (array!72683) Bool)

(assert (=> start!97876 (and (array_inv!26957 _values!996) e!636614)))

(declare-fun b!1117054 () Bool)

(assert (=> b!1117054 (= e!636615 tp_is_empty!27871)))

(declare-fun mapNonEmpty!43624 () Bool)

(declare-fun tp!82868 () Bool)

(assert (=> mapNonEmpty!43624 (= mapRes!43624 (and tp!82868 e!636618))))

(declare-fun mapValue!43624 () ValueCell!13226)

(declare-fun mapRest!43624 () (Array (_ BitVec 32) ValueCell!13226))

(declare-fun mapKey!43624 () (_ BitVec 32))

(assert (=> mapNonEmpty!43624 (= (arr!34988 _values!996) (store mapRest!43624 mapKey!43624 mapValue!43624))))

(declare-fun b!1117055 () Bool)

(declare-fun res!745411 () Bool)

(assert (=> b!1117055 (=> (not res!745411) (not e!636613))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117055 (= res!745411 (and (= (size!35525 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35524 _keys!1208) (size!35525 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117056 () Bool)

(declare-fun res!745409 () Bool)

(assert (=> b!1117056 (=> (not res!745409) (not e!636616))))

(assert (=> b!1117056 (= res!745409 (arrayNoDuplicates!0 lt!497538 #b00000000000000000000000000000000 Nil!24370))))

(declare-fun b!1117057 () Bool)

(assert (=> b!1117057 (= e!636616 (not true))))

(declare-fun arrayContainsKey!0 (array!72681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117057 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36587 0))(
  ( (Unit!36588) )
))
(declare-fun lt!497539 () Unit!36587)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72681 (_ BitVec 64) (_ BitVec 32)) Unit!36587)

(assert (=> b!1117057 (= lt!497539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97876 res!745413) b!1117047))

(assert (= (and b!1117047 res!745407) b!1117055))

(assert (= (and b!1117055 res!745411) b!1117051))

(assert (= (and b!1117051 res!745412) b!1117052))

(assert (= (and b!1117052 res!745410) b!1117046))

(assert (= (and b!1117046 res!745405) b!1117050))

(assert (= (and b!1117050 res!745414) b!1117045))

(assert (= (and b!1117045 res!745408) b!1117053))

(assert (= (and b!1117053 res!745406) b!1117056))

(assert (= (and b!1117056 res!745409) b!1117057))

(assert (= (and b!1117049 condMapEmpty!43624) mapIsEmpty!43624))

(assert (= (and b!1117049 (not condMapEmpty!43624)) mapNonEmpty!43624))

(get-info :version)

(assert (= (and mapNonEmpty!43624 ((_ is ValueCellFull!13226) mapValue!43624)) b!1117048))

(assert (= (and b!1117049 ((_ is ValueCellFull!13226) mapDefault!43624)) b!1117054))

(assert (= start!97876 b!1117049))

(declare-fun m!1033839 () Bool)

(assert (=> b!1117052 m!1033839))

(declare-fun m!1033841 () Bool)

(assert (=> b!1117050 m!1033841))

(declare-fun m!1033843 () Bool)

(assert (=> b!1117051 m!1033843))

(declare-fun m!1033845 () Bool)

(assert (=> b!1117047 m!1033845))

(declare-fun m!1033847 () Bool)

(assert (=> start!97876 m!1033847))

(declare-fun m!1033849 () Bool)

(assert (=> start!97876 m!1033849))

(declare-fun m!1033851 () Bool)

(assert (=> b!1117057 m!1033851))

(declare-fun m!1033853 () Bool)

(assert (=> b!1117057 m!1033853))

(declare-fun m!1033855 () Bool)

(assert (=> b!1117056 m!1033855))

(declare-fun m!1033857 () Bool)

(assert (=> b!1117053 m!1033857))

(declare-fun m!1033859 () Bool)

(assert (=> b!1117053 m!1033859))

(declare-fun m!1033861 () Bool)

(assert (=> b!1117045 m!1033861))

(declare-fun m!1033863 () Bool)

(assert (=> mapNonEmpty!43624 m!1033863))

(check-sat (not b!1117050) (not b!1117057) (not b!1117052) (not b!1117056) tp_is_empty!27871 (not b!1117053) (not mapNonEmpty!43624) (not b!1117051) (not start!97876) (not b!1117047))
(check-sat)
