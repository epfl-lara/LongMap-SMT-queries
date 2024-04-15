; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97574 () Bool)

(assert start!97574)

(declare-fun b!1114419 () Bool)

(declare-fun e!635138 () Bool)

(declare-fun tp_is_empty!27811 () Bool)

(assert (=> b!1114419 (= e!635138 tp_is_empty!27811)))

(declare-fun b!1114420 () Bool)

(declare-fun res!743922 () Bool)

(declare-fun e!635141 () Bool)

(assert (=> b!1114420 (=> (not res!743922) (not e!635141))))

(declare-datatypes ((array!72428 0))(
  ( (array!72429 (arr!34867 (Array (_ BitVec 32) (_ BitVec 64))) (size!35405 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72428)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114420 (= res!743922 (= (select (arr!34867 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43534 () Bool)

(declare-fun mapRes!43534 () Bool)

(assert (=> mapIsEmpty!43534 mapRes!43534))

(declare-fun b!1114421 () Bool)

(declare-fun res!743918 () Bool)

(assert (=> b!1114421 (=> (not res!743918) (not e!635141))))

(assert (=> b!1114421 (= res!743918 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35405 _keys!1208))))))

(declare-fun b!1114422 () Bool)

(declare-fun res!743916 () Bool)

(assert (=> b!1114422 (=> (not res!743916) (not e!635141))))

(declare-datatypes ((List!24365 0))(
  ( (Nil!24362) (Cons!24361 (h!25570 (_ BitVec 64)) (t!34837 List!24365)) )
))
(declare-fun arrayNoDuplicates!0 (array!72428 (_ BitVec 32) List!24365) Bool)

(assert (=> b!1114422 (= res!743916 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24362))))

(declare-fun b!1114423 () Bool)

(declare-fun e!635140 () Bool)

(assert (=> b!1114423 (= e!635140 (and e!635138 mapRes!43534))))

(declare-fun condMapEmpty!43534 () Bool)

(declare-datatypes ((V!42209 0))(
  ( (V!42210 (val!13962 Int)) )
))
(declare-datatypes ((ValueCell!13196 0))(
  ( (ValueCellFull!13196 (v!16594 V!42209)) (EmptyCell!13196) )
))
(declare-datatypes ((array!72430 0))(
  ( (array!72431 (arr!34868 (Array (_ BitVec 32) ValueCell!13196)) (size!35406 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72430)

(declare-fun mapDefault!43534 () ValueCell!13196)

(assert (=> b!1114423 (= condMapEmpty!43534 (= (arr!34868 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13196)) mapDefault!43534)))))

(declare-fun b!1114425 () Bool)

(declare-fun res!743914 () Bool)

(assert (=> b!1114425 (=> (not res!743914) (not e!635141))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114425 (= res!743914 (validMask!0 mask!1564))))

(declare-fun b!1114426 () Bool)

(declare-fun res!743921 () Bool)

(assert (=> b!1114426 (=> (not res!743921) (not e!635141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114426 (= res!743921 (validKeyInArray!0 k0!934))))

(declare-fun b!1114427 () Bool)

(declare-fun e!635139 () Bool)

(assert (=> b!1114427 (= e!635141 e!635139)))

(declare-fun res!743923 () Bool)

(assert (=> b!1114427 (=> (not res!743923) (not e!635139))))

(declare-fun lt!496643 () array!72428)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72428 (_ BitVec 32)) Bool)

(assert (=> b!1114427 (= res!743923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496643 mask!1564))))

(assert (=> b!1114427 (= lt!496643 (array!72429 (store (arr!34867 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35405 _keys!1208)))))

(declare-fun mapNonEmpty!43534 () Bool)

(declare-fun tp!82778 () Bool)

(declare-fun e!635137 () Bool)

(assert (=> mapNonEmpty!43534 (= mapRes!43534 (and tp!82778 e!635137))))

(declare-fun mapRest!43534 () (Array (_ BitVec 32) ValueCell!13196))

(declare-fun mapValue!43534 () ValueCell!13196)

(declare-fun mapKey!43534 () (_ BitVec 32))

(assert (=> mapNonEmpty!43534 (= (arr!34868 _values!996) (store mapRest!43534 mapKey!43534 mapValue!43534))))

(declare-fun b!1114428 () Bool)

(declare-fun res!743920 () Bool)

(assert (=> b!1114428 (=> (not res!743920) (not e!635141))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114428 (= res!743920 (and (= (size!35406 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35405 _keys!1208) (size!35406 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114429 () Bool)

(declare-fun res!743917 () Bool)

(assert (=> b!1114429 (=> (not res!743917) (not e!635139))))

(assert (=> b!1114429 (= res!743917 (arrayNoDuplicates!0 lt!496643 #b00000000000000000000000000000000 Nil!24362))))

(declare-fun b!1114430 () Bool)

(declare-fun res!743919 () Bool)

(assert (=> b!1114430 (=> (not res!743919) (not e!635141))))

(assert (=> b!1114430 (= res!743919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114431 () Bool)

(assert (=> b!1114431 (= e!635139 (not true))))

(declare-fun arrayContainsKey!0 (array!72428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114431 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36401 0))(
  ( (Unit!36402) )
))
(declare-fun lt!496644 () Unit!36401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72428 (_ BitVec 64) (_ BitVec 32)) Unit!36401)

(assert (=> b!1114431 (= lt!496644 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114424 () Bool)

(assert (=> b!1114424 (= e!635137 tp_is_empty!27811)))

(declare-fun res!743915 () Bool)

(assert (=> start!97574 (=> (not res!743915) (not e!635141))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97574 (= res!743915 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35405 _keys!1208))))))

(assert (=> start!97574 e!635141))

(declare-fun array_inv!26878 (array!72428) Bool)

(assert (=> start!97574 (array_inv!26878 _keys!1208)))

(assert (=> start!97574 true))

(declare-fun array_inv!26879 (array!72430) Bool)

(assert (=> start!97574 (and (array_inv!26879 _values!996) e!635140)))

(assert (= (and start!97574 res!743915) b!1114425))

(assert (= (and b!1114425 res!743914) b!1114428))

(assert (= (and b!1114428 res!743920) b!1114430))

(assert (= (and b!1114430 res!743919) b!1114422))

(assert (= (and b!1114422 res!743916) b!1114421))

(assert (= (and b!1114421 res!743918) b!1114426))

(assert (= (and b!1114426 res!743921) b!1114420))

(assert (= (and b!1114420 res!743922) b!1114427))

(assert (= (and b!1114427 res!743923) b!1114429))

(assert (= (and b!1114429 res!743917) b!1114431))

(assert (= (and b!1114423 condMapEmpty!43534) mapIsEmpty!43534))

(assert (= (and b!1114423 (not condMapEmpty!43534)) mapNonEmpty!43534))

(get-info :version)

(assert (= (and mapNonEmpty!43534 ((_ is ValueCellFull!13196) mapValue!43534)) b!1114424))

(assert (= (and b!1114423 ((_ is ValueCellFull!13196) mapDefault!43534)) b!1114419))

(assert (= start!97574 b!1114423))

(declare-fun m!1030761 () Bool)

(assert (=> b!1114422 m!1030761))

(declare-fun m!1030763 () Bool)

(assert (=> mapNonEmpty!43534 m!1030763))

(declare-fun m!1030765 () Bool)

(assert (=> b!1114425 m!1030765))

(declare-fun m!1030767 () Bool)

(assert (=> b!1114430 m!1030767))

(declare-fun m!1030769 () Bool)

(assert (=> b!1114429 m!1030769))

(declare-fun m!1030771 () Bool)

(assert (=> b!1114431 m!1030771))

(declare-fun m!1030773 () Bool)

(assert (=> b!1114431 m!1030773))

(declare-fun m!1030775 () Bool)

(assert (=> b!1114427 m!1030775))

(declare-fun m!1030777 () Bool)

(assert (=> b!1114427 m!1030777))

(declare-fun m!1030779 () Bool)

(assert (=> b!1114426 m!1030779))

(declare-fun m!1030781 () Bool)

(assert (=> start!97574 m!1030781))

(declare-fun m!1030783 () Bool)

(assert (=> start!97574 m!1030783))

(declare-fun m!1030785 () Bool)

(assert (=> b!1114420 m!1030785))

(check-sat (not b!1114425) (not b!1114430) tp_is_empty!27811 (not start!97574) (not b!1114422) (not b!1114429) (not b!1114426) (not b!1114427) (not b!1114431) (not mapNonEmpty!43534))
(check-sat)
