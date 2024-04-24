; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97438 () Bool)

(assert start!97438)

(declare-fun b!1107280 () Bool)

(declare-fun e!632007 () Bool)

(assert (=> b!1107280 (= e!632007 (not true))))

(declare-datatypes ((array!71819 0))(
  ( (array!71820 (arr!34556 (Array (_ BitVec 32) (_ BitVec 64))) (size!35093 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71819)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107280 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36283 0))(
  ( (Unit!36284) )
))
(declare-fun lt!495901 () Unit!36283)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71819 (_ BitVec 64) (_ BitVec 32)) Unit!36283)

(assert (=> b!1107280 (= lt!495901 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107281 () Bool)

(declare-fun e!632005 () Bool)

(assert (=> b!1107281 (= e!632005 e!632007)))

(declare-fun res!738513 () Bool)

(assert (=> b!1107281 (=> (not res!738513) (not e!632007))))

(declare-fun lt!495900 () array!71819)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71819 (_ BitVec 32)) Bool)

(assert (=> b!1107281 (= res!738513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495900 mask!1564))))

(assert (=> b!1107281 (= lt!495900 (array!71820 (store (arr!34556 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35093 _keys!1208)))))

(declare-fun b!1107282 () Bool)

(declare-fun e!632009 () Bool)

(declare-fun tp_is_empty!27433 () Bool)

(assert (=> b!1107282 (= e!632009 tp_is_empty!27433)))

(declare-fun res!738520 () Bool)

(assert (=> start!97438 (=> (not res!738520) (not e!632005))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97438 (= res!738520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35093 _keys!1208))))))

(assert (=> start!97438 e!632005))

(declare-fun array_inv!26632 (array!71819) Bool)

(assert (=> start!97438 (array_inv!26632 _keys!1208)))

(assert (=> start!97438 true))

(declare-datatypes ((V!41705 0))(
  ( (V!41706 (val!13773 Int)) )
))
(declare-datatypes ((ValueCell!13007 0))(
  ( (ValueCellFull!13007 (v!16402 V!41705)) (EmptyCell!13007) )
))
(declare-datatypes ((array!71821 0))(
  ( (array!71822 (arr!34557 (Array (_ BitVec 32) ValueCell!13007)) (size!35094 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71821)

(declare-fun e!632010 () Bool)

(declare-fun array_inv!26633 (array!71821) Bool)

(assert (=> start!97438 (and (array_inv!26633 _values!996) e!632010)))

(declare-fun b!1107283 () Bool)

(declare-fun e!632008 () Bool)

(declare-fun mapRes!42967 () Bool)

(assert (=> b!1107283 (= e!632010 (and e!632008 mapRes!42967))))

(declare-fun condMapEmpty!42967 () Bool)

(declare-fun mapDefault!42967 () ValueCell!13007)

(assert (=> b!1107283 (= condMapEmpty!42967 (= (arr!34557 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13007)) mapDefault!42967)))))

(declare-fun mapNonEmpty!42967 () Bool)

(declare-fun tp!81887 () Bool)

(assert (=> mapNonEmpty!42967 (= mapRes!42967 (and tp!81887 e!632009))))

(declare-fun mapValue!42967 () ValueCell!13007)

(declare-fun mapRest!42967 () (Array (_ BitVec 32) ValueCell!13007))

(declare-fun mapKey!42967 () (_ BitVec 32))

(assert (=> mapNonEmpty!42967 (= (arr!34557 _values!996) (store mapRest!42967 mapKey!42967 mapValue!42967))))

(declare-fun b!1107284 () Bool)

(declare-fun res!738519 () Bool)

(assert (=> b!1107284 (=> (not res!738519) (not e!632005))))

(assert (=> b!1107284 (= res!738519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107285 () Bool)

(declare-fun res!738517 () Bool)

(assert (=> b!1107285 (=> (not res!738517) (not e!632007))))

(declare-datatypes ((List!24107 0))(
  ( (Nil!24104) (Cons!24103 (h!25321 (_ BitVec 64)) (t!34364 List!24107)) )
))
(declare-fun arrayNoDuplicates!0 (array!71819 (_ BitVec 32) List!24107) Bool)

(assert (=> b!1107285 (= res!738517 (arrayNoDuplicates!0 lt!495900 #b00000000000000000000000000000000 Nil!24104))))

(declare-fun b!1107286 () Bool)

(declare-fun res!738514 () Bool)

(assert (=> b!1107286 (=> (not res!738514) (not e!632005))))

(assert (=> b!1107286 (= res!738514 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35093 _keys!1208))))))

(declare-fun b!1107287 () Bool)

(declare-fun res!738518 () Bool)

(assert (=> b!1107287 (=> (not res!738518) (not e!632005))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107287 (= res!738518 (and (= (size!35094 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35093 _keys!1208) (size!35094 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107288 () Bool)

(declare-fun res!738511 () Bool)

(assert (=> b!1107288 (=> (not res!738511) (not e!632005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107288 (= res!738511 (validMask!0 mask!1564))))

(declare-fun b!1107289 () Bool)

(declare-fun res!738516 () Bool)

(assert (=> b!1107289 (=> (not res!738516) (not e!632005))))

(assert (=> b!1107289 (= res!738516 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24104))))

(declare-fun b!1107290 () Bool)

(declare-fun res!738512 () Bool)

(assert (=> b!1107290 (=> (not res!738512) (not e!632005))))

(assert (=> b!1107290 (= res!738512 (= (select (arr!34556 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!42967 () Bool)

(assert (=> mapIsEmpty!42967 mapRes!42967))

(declare-fun b!1107291 () Bool)

(declare-fun res!738515 () Bool)

(assert (=> b!1107291 (=> (not res!738515) (not e!632005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107291 (= res!738515 (validKeyInArray!0 k0!934))))

(declare-fun b!1107292 () Bool)

(assert (=> b!1107292 (= e!632008 tp_is_empty!27433)))

(assert (= (and start!97438 res!738520) b!1107288))

(assert (= (and b!1107288 res!738511) b!1107287))

(assert (= (and b!1107287 res!738518) b!1107284))

(assert (= (and b!1107284 res!738519) b!1107289))

(assert (= (and b!1107289 res!738516) b!1107286))

(assert (= (and b!1107286 res!738514) b!1107291))

(assert (= (and b!1107291 res!738515) b!1107290))

(assert (= (and b!1107290 res!738512) b!1107281))

(assert (= (and b!1107281 res!738513) b!1107285))

(assert (= (and b!1107285 res!738517) b!1107280))

(assert (= (and b!1107283 condMapEmpty!42967) mapIsEmpty!42967))

(assert (= (and b!1107283 (not condMapEmpty!42967)) mapNonEmpty!42967))

(get-info :version)

(assert (= (and mapNonEmpty!42967 ((_ is ValueCellFull!13007) mapValue!42967)) b!1107282))

(assert (= (and b!1107283 ((_ is ValueCellFull!13007) mapDefault!42967)) b!1107292))

(assert (= start!97438 b!1107283))

(declare-fun m!1026849 () Bool)

(assert (=> b!1107288 m!1026849))

(declare-fun m!1026851 () Bool)

(assert (=> b!1107281 m!1026851))

(declare-fun m!1026853 () Bool)

(assert (=> b!1107281 m!1026853))

(declare-fun m!1026855 () Bool)

(assert (=> start!97438 m!1026855))

(declare-fun m!1026857 () Bool)

(assert (=> start!97438 m!1026857))

(declare-fun m!1026859 () Bool)

(assert (=> b!1107290 m!1026859))

(declare-fun m!1026861 () Bool)

(assert (=> b!1107280 m!1026861))

(declare-fun m!1026863 () Bool)

(assert (=> b!1107280 m!1026863))

(declare-fun m!1026865 () Bool)

(assert (=> b!1107285 m!1026865))

(declare-fun m!1026867 () Bool)

(assert (=> b!1107284 m!1026867))

(declare-fun m!1026869 () Bool)

(assert (=> mapNonEmpty!42967 m!1026869))

(declare-fun m!1026871 () Bool)

(assert (=> b!1107291 m!1026871))

(declare-fun m!1026873 () Bool)

(assert (=> b!1107289 m!1026873))

(check-sat (not b!1107285) (not b!1107280) (not b!1107281) (not mapNonEmpty!42967) (not b!1107288) (not b!1107284) (not b!1107289) (not start!97438) (not b!1107291) tp_is_empty!27433)
(check-sat)
