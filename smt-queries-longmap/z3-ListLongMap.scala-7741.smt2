; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97426 () Bool)

(assert start!97426)

(declare-fun b!1107046 () Bool)

(declare-fun res!738337 () Bool)

(declare-fun e!631901 () Bool)

(assert (=> b!1107046 (=> (not res!738337) (not e!631901))))

(declare-datatypes ((array!71799 0))(
  ( (array!71800 (arr!34546 (Array (_ BitVec 32) (_ BitVec 64))) (size!35083 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71799)

(declare-datatypes ((List!24104 0))(
  ( (Nil!24101) (Cons!24100 (h!25318 (_ BitVec 64)) (t!34361 List!24104)) )
))
(declare-fun arrayNoDuplicates!0 (array!71799 (_ BitVec 32) List!24104) Bool)

(assert (=> b!1107046 (= res!738337 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24101))))

(declare-fun b!1107047 () Bool)

(declare-fun e!631899 () Bool)

(declare-fun tp_is_empty!27421 () Bool)

(assert (=> b!1107047 (= e!631899 tp_is_empty!27421)))

(declare-fun b!1107048 () Bool)

(declare-fun res!738339 () Bool)

(assert (=> b!1107048 (=> (not res!738339) (not e!631901))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71799 (_ BitVec 32)) Bool)

(assert (=> b!1107048 (= res!738339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107049 () Bool)

(declare-fun e!631902 () Bool)

(assert (=> b!1107049 (= e!631901 e!631902)))

(declare-fun res!738332 () Bool)

(assert (=> b!1107049 (=> (not res!738332) (not e!631902))))

(declare-fun lt!495864 () array!71799)

(assert (=> b!1107049 (= res!738332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495864 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107049 (= lt!495864 (array!71800 (store (arr!34546 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35083 _keys!1208)))))

(declare-fun b!1107050 () Bool)

(declare-fun res!738338 () Bool)

(assert (=> b!1107050 (=> (not res!738338) (not e!631901))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107050 (= res!738338 (validKeyInArray!0 k0!934))))

(declare-fun b!1107051 () Bool)

(declare-fun e!631898 () Bool)

(declare-fun mapRes!42949 () Bool)

(assert (=> b!1107051 (= e!631898 (and e!631899 mapRes!42949))))

(declare-fun condMapEmpty!42949 () Bool)

(declare-datatypes ((V!41689 0))(
  ( (V!41690 (val!13767 Int)) )
))
(declare-datatypes ((ValueCell!13001 0))(
  ( (ValueCellFull!13001 (v!16396 V!41689)) (EmptyCell!13001) )
))
(declare-datatypes ((array!71801 0))(
  ( (array!71802 (arr!34547 (Array (_ BitVec 32) ValueCell!13001)) (size!35084 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71801)

(declare-fun mapDefault!42949 () ValueCell!13001)

(assert (=> b!1107051 (= condMapEmpty!42949 (= (arr!34547 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13001)) mapDefault!42949)))))

(declare-fun b!1107052 () Bool)

(declare-fun res!738333 () Bool)

(assert (=> b!1107052 (=> (not res!738333) (not e!631902))))

(assert (=> b!1107052 (= res!738333 (arrayNoDuplicates!0 lt!495864 #b00000000000000000000000000000000 Nil!24101))))

(declare-fun b!1107053 () Bool)

(declare-fun res!738334 () Bool)

(assert (=> b!1107053 (=> (not res!738334) (not e!631901))))

(assert (=> b!1107053 (= res!738334 (= (select (arr!34546 _keys!1208) i!673) k0!934))))

(declare-fun b!1107054 () Bool)

(declare-fun res!738335 () Bool)

(assert (=> b!1107054 (=> (not res!738335) (not e!631901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107054 (= res!738335 (validMask!0 mask!1564))))

(declare-fun b!1107055 () Bool)

(declare-fun e!631897 () Bool)

(assert (=> b!1107055 (= e!631897 tp_is_empty!27421)))

(declare-fun b!1107056 () Bool)

(declare-fun res!738340 () Bool)

(assert (=> b!1107056 (=> (not res!738340) (not e!631901))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107056 (= res!738340 (and (= (size!35084 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35083 _keys!1208) (size!35084 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42949 () Bool)

(declare-fun tp!81869 () Bool)

(assert (=> mapNonEmpty!42949 (= mapRes!42949 (and tp!81869 e!631897))))

(declare-fun mapKey!42949 () (_ BitVec 32))

(declare-fun mapRest!42949 () (Array (_ BitVec 32) ValueCell!13001))

(declare-fun mapValue!42949 () ValueCell!13001)

(assert (=> mapNonEmpty!42949 (= (arr!34547 _values!996) (store mapRest!42949 mapKey!42949 mapValue!42949))))

(declare-fun res!738336 () Bool)

(assert (=> start!97426 (=> (not res!738336) (not e!631901))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97426 (= res!738336 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35083 _keys!1208))))))

(assert (=> start!97426 e!631901))

(declare-fun array_inv!26628 (array!71799) Bool)

(assert (=> start!97426 (array_inv!26628 _keys!1208)))

(assert (=> start!97426 true))

(declare-fun array_inv!26629 (array!71801) Bool)

(assert (=> start!97426 (and (array_inv!26629 _values!996) e!631898)))

(declare-fun b!1107057 () Bool)

(declare-fun res!738331 () Bool)

(assert (=> b!1107057 (=> (not res!738331) (not e!631901))))

(assert (=> b!1107057 (= res!738331 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35083 _keys!1208))))))

(declare-fun mapIsEmpty!42949 () Bool)

(assert (=> mapIsEmpty!42949 mapRes!42949))

(declare-fun b!1107058 () Bool)

(assert (=> b!1107058 (= e!631902 (not true))))

(declare-fun arrayContainsKey!0 (array!71799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107058 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36275 0))(
  ( (Unit!36276) )
))
(declare-fun lt!495865 () Unit!36275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71799 (_ BitVec 64) (_ BitVec 32)) Unit!36275)

(assert (=> b!1107058 (= lt!495865 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97426 res!738336) b!1107054))

(assert (= (and b!1107054 res!738335) b!1107056))

(assert (= (and b!1107056 res!738340) b!1107048))

(assert (= (and b!1107048 res!738339) b!1107046))

(assert (= (and b!1107046 res!738337) b!1107057))

(assert (= (and b!1107057 res!738331) b!1107050))

(assert (= (and b!1107050 res!738338) b!1107053))

(assert (= (and b!1107053 res!738334) b!1107049))

(assert (= (and b!1107049 res!738332) b!1107052))

(assert (= (and b!1107052 res!738333) b!1107058))

(assert (= (and b!1107051 condMapEmpty!42949) mapIsEmpty!42949))

(assert (= (and b!1107051 (not condMapEmpty!42949)) mapNonEmpty!42949))

(get-info :version)

(assert (= (and mapNonEmpty!42949 ((_ is ValueCellFull!13001) mapValue!42949)) b!1107055))

(assert (= (and b!1107051 ((_ is ValueCellFull!13001) mapDefault!42949)) b!1107047))

(assert (= start!97426 b!1107051))

(declare-fun m!1026693 () Bool)

(assert (=> b!1107054 m!1026693))

(declare-fun m!1026695 () Bool)

(assert (=> start!97426 m!1026695))

(declare-fun m!1026697 () Bool)

(assert (=> start!97426 m!1026697))

(declare-fun m!1026699 () Bool)

(assert (=> b!1107050 m!1026699))

(declare-fun m!1026701 () Bool)

(assert (=> b!1107046 m!1026701))

(declare-fun m!1026703 () Bool)

(assert (=> mapNonEmpty!42949 m!1026703))

(declare-fun m!1026705 () Bool)

(assert (=> b!1107049 m!1026705))

(declare-fun m!1026707 () Bool)

(assert (=> b!1107049 m!1026707))

(declare-fun m!1026709 () Bool)

(assert (=> b!1107058 m!1026709))

(declare-fun m!1026711 () Bool)

(assert (=> b!1107058 m!1026711))

(declare-fun m!1026713 () Bool)

(assert (=> b!1107053 m!1026713))

(declare-fun m!1026715 () Bool)

(assert (=> b!1107048 m!1026715))

(declare-fun m!1026717 () Bool)

(assert (=> b!1107052 m!1026717))

(check-sat (not b!1107050) (not b!1107048) (not b!1107058) tp_is_empty!27421 (not start!97426) (not b!1107054) (not b!1107046) (not mapNonEmpty!42949) (not b!1107049) (not b!1107052))
(check-sat)
