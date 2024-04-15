; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97178 () Bool)

(assert start!97178)

(declare-fun b!1105449 () Bool)

(declare-fun res!737659 () Bool)

(declare-fun e!630896 () Bool)

(assert (=> b!1105449 (=> (not res!737659) (not e!630896))))

(declare-datatypes ((array!71664 0))(
  ( (array!71665 (arr!34485 (Array (_ BitVec 32) (_ BitVec 64))) (size!35023 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71664)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105449 (= res!737659 (= (select (arr!34485 _keys!1208) i!673) k0!934))))

(declare-fun b!1105450 () Bool)

(declare-fun e!630897 () Bool)

(declare-fun tp_is_empty!27415 () Bool)

(assert (=> b!1105450 (= e!630897 tp_is_empty!27415)))

(declare-fun b!1105451 () Bool)

(declare-fun res!737650 () Bool)

(assert (=> b!1105451 (=> (not res!737650) (not e!630896))))

(assert (=> b!1105451 (= res!737650 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35023 _keys!1208))))))

(declare-fun mapIsEmpty!42940 () Bool)

(declare-fun mapRes!42940 () Bool)

(assert (=> mapIsEmpty!42940 mapRes!42940))

(declare-fun mapNonEmpty!42940 () Bool)

(declare-fun tp!81860 () Bool)

(declare-fun e!630895 () Bool)

(assert (=> mapNonEmpty!42940 (= mapRes!42940 (and tp!81860 e!630895))))

(declare-datatypes ((V!41681 0))(
  ( (V!41682 (val!13764 Int)) )
))
(declare-datatypes ((ValueCell!12998 0))(
  ( (ValueCellFull!12998 (v!16396 V!41681)) (EmptyCell!12998) )
))
(declare-fun mapRest!42940 () (Array (_ BitVec 32) ValueCell!12998))

(declare-fun mapValue!42940 () ValueCell!12998)

(declare-datatypes ((array!71666 0))(
  ( (array!71667 (arr!34486 (Array (_ BitVec 32) ValueCell!12998)) (size!35024 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71666)

(declare-fun mapKey!42940 () (_ BitVec 32))

(assert (=> mapNonEmpty!42940 (= (arr!34486 _values!996) (store mapRest!42940 mapKey!42940 mapValue!42940))))

(declare-fun b!1105452 () Bool)

(assert (=> b!1105452 (= e!630895 tp_is_empty!27415)))

(declare-fun b!1105454 () Bool)

(declare-fun res!737652 () Bool)

(assert (=> b!1105454 (=> (not res!737652) (not e!630896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105454 (= res!737652 (validKeyInArray!0 k0!934))))

(declare-fun b!1105455 () Bool)

(declare-fun e!630899 () Bool)

(assert (=> b!1105455 (= e!630896 e!630899)))

(declare-fun res!737651 () Bool)

(assert (=> b!1105455 (=> (not res!737651) (not e!630899))))

(declare-fun lt!495132 () array!71664)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71664 (_ BitVec 32)) Bool)

(assert (=> b!1105455 (= res!737651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495132 mask!1564))))

(assert (=> b!1105455 (= lt!495132 (array!71665 (store (arr!34485 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35023 _keys!1208)))))

(declare-fun b!1105456 () Bool)

(declare-fun res!737654 () Bool)

(assert (=> b!1105456 (=> (not res!737654) (not e!630899))))

(declare-datatypes ((List!24112 0))(
  ( (Nil!24109) (Cons!24108 (h!25317 (_ BitVec 64)) (t!34368 List!24112)) )
))
(declare-fun arrayNoDuplicates!0 (array!71664 (_ BitVec 32) List!24112) Bool)

(assert (=> b!1105456 (= res!737654 (arrayNoDuplicates!0 lt!495132 #b00000000000000000000000000000000 Nil!24109))))

(declare-fun b!1105457 () Bool)

(declare-fun res!737656 () Bool)

(assert (=> b!1105457 (=> (not res!737656) (not e!630896))))

(assert (=> b!1105457 (= res!737656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105458 () Bool)

(declare-fun res!737657 () Bool)

(assert (=> b!1105458 (=> (not res!737657) (not e!630896))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105458 (= res!737657 (and (= (size!35024 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35023 _keys!1208) (size!35024 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105459 () Bool)

(declare-fun res!737655 () Bool)

(assert (=> b!1105459 (=> (not res!737655) (not e!630896))))

(assert (=> b!1105459 (= res!737655 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24109))))

(declare-fun b!1105460 () Bool)

(assert (=> b!1105460 (= e!630899 (not true))))

(declare-fun arrayContainsKey!0 (array!71664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105460 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36099 0))(
  ( (Unit!36100) )
))
(declare-fun lt!495131 () Unit!36099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71664 (_ BitVec 64) (_ BitVec 32)) Unit!36099)

(assert (=> b!1105460 (= lt!495131 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105461 () Bool)

(declare-fun e!630898 () Bool)

(assert (=> b!1105461 (= e!630898 (and e!630897 mapRes!42940))))

(declare-fun condMapEmpty!42940 () Bool)

(declare-fun mapDefault!42940 () ValueCell!12998)

(assert (=> b!1105461 (= condMapEmpty!42940 (= (arr!34486 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12998)) mapDefault!42940)))))

(declare-fun b!1105453 () Bool)

(declare-fun res!737653 () Bool)

(assert (=> b!1105453 (=> (not res!737653) (not e!630896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105453 (= res!737653 (validMask!0 mask!1564))))

(declare-fun res!737658 () Bool)

(assert (=> start!97178 (=> (not res!737658) (not e!630896))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97178 (= res!737658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35023 _keys!1208))))))

(assert (=> start!97178 e!630896))

(declare-fun array_inv!26594 (array!71664) Bool)

(assert (=> start!97178 (array_inv!26594 _keys!1208)))

(assert (=> start!97178 true))

(declare-fun array_inv!26595 (array!71666) Bool)

(assert (=> start!97178 (and (array_inv!26595 _values!996) e!630898)))

(assert (= (and start!97178 res!737658) b!1105453))

(assert (= (and b!1105453 res!737653) b!1105458))

(assert (= (and b!1105458 res!737657) b!1105457))

(assert (= (and b!1105457 res!737656) b!1105459))

(assert (= (and b!1105459 res!737655) b!1105451))

(assert (= (and b!1105451 res!737650) b!1105454))

(assert (= (and b!1105454 res!737652) b!1105449))

(assert (= (and b!1105449 res!737659) b!1105455))

(assert (= (and b!1105455 res!737651) b!1105456))

(assert (= (and b!1105456 res!737654) b!1105460))

(assert (= (and b!1105461 condMapEmpty!42940) mapIsEmpty!42940))

(assert (= (and b!1105461 (not condMapEmpty!42940)) mapNonEmpty!42940))

(get-info :version)

(assert (= (and mapNonEmpty!42940 ((_ is ValueCellFull!12998) mapValue!42940)) b!1105452))

(assert (= (and b!1105461 ((_ is ValueCellFull!12998) mapDefault!42940)) b!1105450))

(assert (= start!97178 b!1105461))

(declare-fun m!1024317 () Bool)

(assert (=> mapNonEmpty!42940 m!1024317))

(declare-fun m!1024319 () Bool)

(assert (=> b!1105456 m!1024319))

(declare-fun m!1024321 () Bool)

(assert (=> b!1105455 m!1024321))

(declare-fun m!1024323 () Bool)

(assert (=> b!1105455 m!1024323))

(declare-fun m!1024325 () Bool)

(assert (=> b!1105457 m!1024325))

(declare-fun m!1024327 () Bool)

(assert (=> b!1105459 m!1024327))

(declare-fun m!1024329 () Bool)

(assert (=> b!1105449 m!1024329))

(declare-fun m!1024331 () Bool)

(assert (=> b!1105460 m!1024331))

(declare-fun m!1024333 () Bool)

(assert (=> b!1105460 m!1024333))

(declare-fun m!1024335 () Bool)

(assert (=> b!1105454 m!1024335))

(declare-fun m!1024337 () Bool)

(assert (=> b!1105453 m!1024337))

(declare-fun m!1024339 () Bool)

(assert (=> start!97178 m!1024339))

(declare-fun m!1024341 () Bool)

(assert (=> start!97178 m!1024341))

(check-sat (not b!1105457) (not start!97178) (not b!1105459) (not b!1105455) tp_is_empty!27415 (not b!1105456) (not b!1105454) (not mapNonEmpty!42940) (not b!1105460) (not b!1105453))
(check-sat)
