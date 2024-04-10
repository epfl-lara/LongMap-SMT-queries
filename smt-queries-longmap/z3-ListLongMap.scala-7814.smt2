; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97630 () Bool)

(assert start!97630)

(declare-fun b!1115523 () Bool)

(declare-fun res!744734 () Bool)

(declare-fun e!635672 () Bool)

(assert (=> b!1115523 (=> (not res!744734) (not e!635672))))

(declare-datatypes ((array!72623 0))(
  ( (array!72624 (arr!34964 (Array (_ BitVec 32) (_ BitVec 64))) (size!35500 (_ BitVec 32))) )
))
(declare-fun lt!496993 () array!72623)

(declare-datatypes ((List!24349 0))(
  ( (Nil!24346) (Cons!24345 (h!25554 (_ BitVec 64)) (t!34830 List!24349)) )
))
(declare-fun arrayNoDuplicates!0 (array!72623 (_ BitVec 32) List!24349) Bool)

(assert (=> b!1115523 (= res!744734 (arrayNoDuplicates!0 lt!496993 #b00000000000000000000000000000000 Nil!24346))))

(declare-fun b!1115524 () Bool)

(declare-fun res!744736 () Bool)

(declare-fun e!635670 () Bool)

(assert (=> b!1115524 (=> (not res!744736) (not e!635670))))

(declare-fun _keys!1208 () array!72623)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72623 (_ BitVec 32)) Bool)

(assert (=> b!1115524 (= res!744736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115525 () Bool)

(declare-fun e!635673 () Bool)

(declare-fun tp_is_empty!27861 () Bool)

(assert (=> b!1115525 (= e!635673 tp_is_empty!27861)))

(declare-fun b!1115526 () Bool)

(declare-fun res!744735 () Bool)

(assert (=> b!1115526 (=> (not res!744735) (not e!635670))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115526 (= res!744735 (= (select (arr!34964 _keys!1208) i!673) k0!934))))

(declare-fun res!744733 () Bool)

(assert (=> start!97630 (=> (not res!744733) (not e!635670))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97630 (= res!744733 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35500 _keys!1208))))))

(assert (=> start!97630 e!635670))

(declare-fun array_inv!26876 (array!72623) Bool)

(assert (=> start!97630 (array_inv!26876 _keys!1208)))

(assert (=> start!97630 true))

(declare-datatypes ((V!42275 0))(
  ( (V!42276 (val!13987 Int)) )
))
(declare-datatypes ((ValueCell!13221 0))(
  ( (ValueCellFull!13221 (v!16620 V!42275)) (EmptyCell!13221) )
))
(declare-datatypes ((array!72625 0))(
  ( (array!72626 (arr!34965 (Array (_ BitVec 32) ValueCell!13221)) (size!35501 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72625)

(declare-fun e!635671 () Bool)

(declare-fun array_inv!26877 (array!72625) Bool)

(assert (=> start!97630 (and (array_inv!26877 _values!996) e!635671)))

(declare-fun b!1115527 () Bool)

(declare-fun res!744738 () Bool)

(assert (=> b!1115527 (=> (not res!744738) (not e!635670))))

(assert (=> b!1115527 (= res!744738 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24346))))

(declare-fun b!1115528 () Bool)

(declare-fun e!635668 () Bool)

(declare-fun mapRes!43609 () Bool)

(assert (=> b!1115528 (= e!635671 (and e!635668 mapRes!43609))))

(declare-fun condMapEmpty!43609 () Bool)

(declare-fun mapDefault!43609 () ValueCell!13221)

(assert (=> b!1115528 (= condMapEmpty!43609 (= (arr!34965 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13221)) mapDefault!43609)))))

(declare-fun b!1115529 () Bool)

(assert (=> b!1115529 (= e!635668 tp_is_empty!27861)))

(declare-fun b!1115530 () Bool)

(declare-fun res!744742 () Bool)

(assert (=> b!1115530 (=> (not res!744742) (not e!635670))))

(assert (=> b!1115530 (= res!744742 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35500 _keys!1208))))))

(declare-fun b!1115531 () Bool)

(assert (=> b!1115531 (= e!635672 (not true))))

(declare-fun arrayContainsKey!0 (array!72623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115531 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36612 0))(
  ( (Unit!36613) )
))
(declare-fun lt!496994 () Unit!36612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72623 (_ BitVec 64) (_ BitVec 32)) Unit!36612)

(assert (=> b!1115531 (= lt!496994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115532 () Bool)

(assert (=> b!1115532 (= e!635670 e!635672)))

(declare-fun res!744737 () Bool)

(assert (=> b!1115532 (=> (not res!744737) (not e!635672))))

(assert (=> b!1115532 (= res!744737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496993 mask!1564))))

(assert (=> b!1115532 (= lt!496993 (array!72624 (store (arr!34964 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35500 _keys!1208)))))

(declare-fun b!1115533 () Bool)

(declare-fun res!744739 () Bool)

(assert (=> b!1115533 (=> (not res!744739) (not e!635670))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115533 (= res!744739 (and (= (size!35501 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35500 _keys!1208) (size!35501 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43609 () Bool)

(assert (=> mapIsEmpty!43609 mapRes!43609))

(declare-fun b!1115534 () Bool)

(declare-fun res!744741 () Bool)

(assert (=> b!1115534 (=> (not res!744741) (not e!635670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115534 (= res!744741 (validMask!0 mask!1564))))

(declare-fun b!1115535 () Bool)

(declare-fun res!744740 () Bool)

(assert (=> b!1115535 (=> (not res!744740) (not e!635670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115535 (= res!744740 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43609 () Bool)

(declare-fun tp!82853 () Bool)

(assert (=> mapNonEmpty!43609 (= mapRes!43609 (and tp!82853 e!635673))))

(declare-fun mapRest!43609 () (Array (_ BitVec 32) ValueCell!13221))

(declare-fun mapKey!43609 () (_ BitVec 32))

(declare-fun mapValue!43609 () ValueCell!13221)

(assert (=> mapNonEmpty!43609 (= (arr!34965 _values!996) (store mapRest!43609 mapKey!43609 mapValue!43609))))

(assert (= (and start!97630 res!744733) b!1115534))

(assert (= (and b!1115534 res!744741) b!1115533))

(assert (= (and b!1115533 res!744739) b!1115524))

(assert (= (and b!1115524 res!744736) b!1115527))

(assert (= (and b!1115527 res!744738) b!1115530))

(assert (= (and b!1115530 res!744742) b!1115535))

(assert (= (and b!1115535 res!744740) b!1115526))

(assert (= (and b!1115526 res!744735) b!1115532))

(assert (= (and b!1115532 res!744737) b!1115523))

(assert (= (and b!1115523 res!744734) b!1115531))

(assert (= (and b!1115528 condMapEmpty!43609) mapIsEmpty!43609))

(assert (= (and b!1115528 (not condMapEmpty!43609)) mapNonEmpty!43609))

(get-info :version)

(assert (= (and mapNonEmpty!43609 ((_ is ValueCellFull!13221) mapValue!43609)) b!1115525))

(assert (= (and b!1115528 ((_ is ValueCellFull!13221) mapDefault!43609)) b!1115529))

(assert (= start!97630 b!1115528))

(declare-fun m!1032037 () Bool)

(assert (=> b!1115531 m!1032037))

(declare-fun m!1032039 () Bool)

(assert (=> b!1115531 m!1032039))

(declare-fun m!1032041 () Bool)

(assert (=> b!1115527 m!1032041))

(declare-fun m!1032043 () Bool)

(assert (=> b!1115524 m!1032043))

(declare-fun m!1032045 () Bool)

(assert (=> mapNonEmpty!43609 m!1032045))

(declare-fun m!1032047 () Bool)

(assert (=> b!1115523 m!1032047))

(declare-fun m!1032049 () Bool)

(assert (=> b!1115532 m!1032049))

(declare-fun m!1032051 () Bool)

(assert (=> b!1115532 m!1032051))

(declare-fun m!1032053 () Bool)

(assert (=> b!1115534 m!1032053))

(declare-fun m!1032055 () Bool)

(assert (=> start!97630 m!1032055))

(declare-fun m!1032057 () Bool)

(assert (=> start!97630 m!1032057))

(declare-fun m!1032059 () Bool)

(assert (=> b!1115535 m!1032059))

(declare-fun m!1032061 () Bool)

(assert (=> b!1115526 m!1032061))

(check-sat (not b!1115523) (not b!1115535) (not b!1115534) (not mapNonEmpty!43609) (not start!97630) (not b!1115527) (not b!1115532) tp_is_empty!27861 (not b!1115531) (not b!1115524))
(check-sat)
