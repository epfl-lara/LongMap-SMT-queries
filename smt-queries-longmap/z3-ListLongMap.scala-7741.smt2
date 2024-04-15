; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97184 () Bool)

(assert start!97184)

(declare-fun b!1105566 () Bool)

(declare-fun res!737749 () Bool)

(declare-fun e!630951 () Bool)

(assert (=> b!1105566 (=> (not res!737749) (not e!630951))))

(declare-datatypes ((array!71674 0))(
  ( (array!71675 (arr!34490 (Array (_ BitVec 32) (_ BitVec 64))) (size!35028 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71674)

(declare-datatypes ((List!24113 0))(
  ( (Nil!24110) (Cons!24109 (h!25318 (_ BitVec 64)) (t!34369 List!24113)) )
))
(declare-fun arrayNoDuplicates!0 (array!71674 (_ BitVec 32) List!24113) Bool)

(assert (=> b!1105566 (= res!737749 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24110))))

(declare-fun res!737747 () Bool)

(assert (=> start!97184 (=> (not res!737747) (not e!630951))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97184 (= res!737747 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35028 _keys!1208))))))

(assert (=> start!97184 e!630951))

(declare-fun array_inv!26598 (array!71674) Bool)

(assert (=> start!97184 (array_inv!26598 _keys!1208)))

(assert (=> start!97184 true))

(declare-datatypes ((V!41689 0))(
  ( (V!41690 (val!13767 Int)) )
))
(declare-datatypes ((ValueCell!13001 0))(
  ( (ValueCellFull!13001 (v!16399 V!41689)) (EmptyCell!13001) )
))
(declare-datatypes ((array!71676 0))(
  ( (array!71677 (arr!34491 (Array (_ BitVec 32) ValueCell!13001)) (size!35029 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71676)

(declare-fun e!630953 () Bool)

(declare-fun array_inv!26599 (array!71676) Bool)

(assert (=> start!97184 (and (array_inv!26599 _values!996) e!630953)))

(declare-fun b!1105567 () Bool)

(declare-fun res!737743 () Bool)

(assert (=> b!1105567 (=> (not res!737743) (not e!630951))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105567 (= res!737743 (= (select (arr!34490 _keys!1208) i!673) k0!934))))

(declare-fun b!1105568 () Bool)

(declare-fun res!737748 () Bool)

(assert (=> b!1105568 (=> (not res!737748) (not e!630951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105568 (= res!737748 (validKeyInArray!0 k0!934))))

(declare-fun b!1105569 () Bool)

(declare-fun res!737746 () Bool)

(assert (=> b!1105569 (=> (not res!737746) (not e!630951))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71674 (_ BitVec 32)) Bool)

(assert (=> b!1105569 (= res!737746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42949 () Bool)

(declare-fun mapRes!42949 () Bool)

(assert (=> mapIsEmpty!42949 mapRes!42949))

(declare-fun b!1105570 () Bool)

(declare-fun res!737745 () Bool)

(assert (=> b!1105570 (=> (not res!737745) (not e!630951))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105570 (= res!737745 (and (= (size!35029 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35028 _keys!1208) (size!35029 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42949 () Bool)

(declare-fun tp!81869 () Bool)

(declare-fun e!630949 () Bool)

(assert (=> mapNonEmpty!42949 (= mapRes!42949 (and tp!81869 e!630949))))

(declare-fun mapKey!42949 () (_ BitVec 32))

(declare-fun mapRest!42949 () (Array (_ BitVec 32) ValueCell!13001))

(declare-fun mapValue!42949 () ValueCell!13001)

(assert (=> mapNonEmpty!42949 (= (arr!34491 _values!996) (store mapRest!42949 mapKey!42949 mapValue!42949))))

(declare-fun b!1105571 () Bool)

(declare-fun res!737741 () Bool)

(assert (=> b!1105571 (=> (not res!737741) (not e!630951))))

(assert (=> b!1105571 (= res!737741 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35028 _keys!1208))))))

(declare-fun b!1105572 () Bool)

(declare-fun e!630952 () Bool)

(assert (=> b!1105572 (= e!630952 (not true))))

(declare-fun arrayContainsKey!0 (array!71674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105572 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36101 0))(
  ( (Unit!36102) )
))
(declare-fun lt!495150 () Unit!36101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71674 (_ BitVec 64) (_ BitVec 32)) Unit!36101)

(assert (=> b!1105572 (= lt!495150 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105573 () Bool)

(assert (=> b!1105573 (= e!630951 e!630952)))

(declare-fun res!737742 () Bool)

(assert (=> b!1105573 (=> (not res!737742) (not e!630952))))

(declare-fun lt!495149 () array!71674)

(assert (=> b!1105573 (= res!737742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495149 mask!1564))))

(assert (=> b!1105573 (= lt!495149 (array!71675 (store (arr!34490 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35028 _keys!1208)))))

(declare-fun b!1105574 () Bool)

(declare-fun res!737740 () Bool)

(assert (=> b!1105574 (=> (not res!737740) (not e!630952))))

(assert (=> b!1105574 (= res!737740 (arrayNoDuplicates!0 lt!495149 #b00000000000000000000000000000000 Nil!24110))))

(declare-fun b!1105575 () Bool)

(declare-fun e!630950 () Bool)

(assert (=> b!1105575 (= e!630953 (and e!630950 mapRes!42949))))

(declare-fun condMapEmpty!42949 () Bool)

(declare-fun mapDefault!42949 () ValueCell!13001)

(assert (=> b!1105575 (= condMapEmpty!42949 (= (arr!34491 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13001)) mapDefault!42949)))))

(declare-fun b!1105576 () Bool)

(declare-fun res!737744 () Bool)

(assert (=> b!1105576 (=> (not res!737744) (not e!630951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105576 (= res!737744 (validMask!0 mask!1564))))

(declare-fun b!1105577 () Bool)

(declare-fun tp_is_empty!27421 () Bool)

(assert (=> b!1105577 (= e!630950 tp_is_empty!27421)))

(declare-fun b!1105578 () Bool)

(assert (=> b!1105578 (= e!630949 tp_is_empty!27421)))

(assert (= (and start!97184 res!737747) b!1105576))

(assert (= (and b!1105576 res!737744) b!1105570))

(assert (= (and b!1105570 res!737745) b!1105569))

(assert (= (and b!1105569 res!737746) b!1105566))

(assert (= (and b!1105566 res!737749) b!1105571))

(assert (= (and b!1105571 res!737741) b!1105568))

(assert (= (and b!1105568 res!737748) b!1105567))

(assert (= (and b!1105567 res!737743) b!1105573))

(assert (= (and b!1105573 res!737742) b!1105574))

(assert (= (and b!1105574 res!737740) b!1105572))

(assert (= (and b!1105575 condMapEmpty!42949) mapIsEmpty!42949))

(assert (= (and b!1105575 (not condMapEmpty!42949)) mapNonEmpty!42949))

(get-info :version)

(assert (= (and mapNonEmpty!42949 ((_ is ValueCellFull!13001) mapValue!42949)) b!1105578))

(assert (= (and b!1105575 ((_ is ValueCellFull!13001) mapDefault!42949)) b!1105577))

(assert (= start!97184 b!1105575))

(declare-fun m!1024395 () Bool)

(assert (=> b!1105573 m!1024395))

(declare-fun m!1024397 () Bool)

(assert (=> b!1105573 m!1024397))

(declare-fun m!1024399 () Bool)

(assert (=> b!1105568 m!1024399))

(declare-fun m!1024401 () Bool)

(assert (=> b!1105572 m!1024401))

(declare-fun m!1024403 () Bool)

(assert (=> b!1105572 m!1024403))

(declare-fun m!1024405 () Bool)

(assert (=> b!1105574 m!1024405))

(declare-fun m!1024407 () Bool)

(assert (=> b!1105567 m!1024407))

(declare-fun m!1024409 () Bool)

(assert (=> start!97184 m!1024409))

(declare-fun m!1024411 () Bool)

(assert (=> start!97184 m!1024411))

(declare-fun m!1024413 () Bool)

(assert (=> b!1105566 m!1024413))

(declare-fun m!1024415 () Bool)

(assert (=> b!1105569 m!1024415))

(declare-fun m!1024417 () Bool)

(assert (=> mapNonEmpty!42949 m!1024417))

(declare-fun m!1024419 () Bool)

(assert (=> b!1105576 m!1024419))

(check-sat tp_is_empty!27421 (not b!1105572) (not b!1105568) (not b!1105566) (not b!1105576) (not mapNonEmpty!42949) (not b!1105573) (not b!1105574) (not start!97184) (not b!1105569))
(check-sat)
