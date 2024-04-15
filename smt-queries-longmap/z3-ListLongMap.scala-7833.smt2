; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97736 () Bool)

(assert start!97736)

(declare-fun b_free!23443 () Bool)

(declare-fun b_next!23443 () Bool)

(assert (=> start!97736 (= b_free!23443 (not b_next!23443))))

(declare-fun tp!83032 () Bool)

(declare-fun b_and!37695 () Bool)

(assert (=> start!97736 (= tp!83032 b_and!37695)))

(declare-fun b!1117589 () Bool)

(declare-fun e!636611 () Bool)

(assert (=> b!1117589 (= e!636611 true)))

(declare-datatypes ((V!42425 0))(
  ( (V!42426 (val!14043 Int)) )
))
(declare-fun zeroValue!944 () V!42425)

(declare-datatypes ((array!72742 0))(
  ( (array!72743 (arr!35024 (Array (_ BitVec 32) (_ BitVec 64))) (size!35562 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72742)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17676 0))(
  ( (tuple2!17677 (_1!8849 (_ BitVec 64)) (_2!8849 V!42425)) )
))
(declare-datatypes ((List!24435 0))(
  ( (Nil!24432) (Cons!24431 (h!25640 tuple2!17676) (t!34907 List!24435)) )
))
(declare-datatypes ((ListLongMap!15645 0))(
  ( (ListLongMap!15646 (toList!7838 List!24435)) )
))
(declare-fun lt!497140 () ListLongMap!15645)

(declare-datatypes ((ValueCell!13277 0))(
  ( (ValueCellFull!13277 (v!16675 V!42425)) (EmptyCell!13277) )
))
(declare-datatypes ((array!72744 0))(
  ( (array!72745 (arr!35025 (Array (_ BitVec 32) ValueCell!13277)) (size!35563 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72744)

(declare-fun minValue!944 () V!42425)

(declare-fun getCurrentListMapNoExtraKeys!4347 (array!72742 array!72744 (_ BitVec 32) (_ BitVec 32) V!42425 V!42425 (_ BitVec 32) Int) ListLongMap!15645)

(assert (=> b!1117589 (= lt!497140 (getCurrentListMapNoExtraKeys!4347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117590 () Bool)

(declare-fun res!746362 () Bool)

(declare-fun e!636607 () Bool)

(assert (=> b!1117590 (=> (not res!746362) (not e!636607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72742 (_ BitVec 32)) Bool)

(assert (=> b!1117590 (= res!746362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117591 () Bool)

(declare-fun e!636608 () Bool)

(declare-fun e!636612 () Bool)

(declare-fun mapRes!43777 () Bool)

(assert (=> b!1117591 (= e!636608 (and e!636612 mapRes!43777))))

(declare-fun condMapEmpty!43777 () Bool)

(declare-fun mapDefault!43777 () ValueCell!13277)

(assert (=> b!1117591 (= condMapEmpty!43777 (= (arr!35025 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13277)) mapDefault!43777)))))

(declare-fun res!746365 () Bool)

(assert (=> start!97736 (=> (not res!746365) (not e!636607))))

(assert (=> start!97736 (= res!746365 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35562 _keys!1208))))))

(assert (=> start!97736 e!636607))

(declare-fun tp_is_empty!27973 () Bool)

(assert (=> start!97736 tp_is_empty!27973))

(declare-fun array_inv!26986 (array!72742) Bool)

(assert (=> start!97736 (array_inv!26986 _keys!1208)))

(assert (=> start!97736 true))

(assert (=> start!97736 tp!83032))

(declare-fun array_inv!26987 (array!72744) Bool)

(assert (=> start!97736 (and (array_inv!26987 _values!996) e!636608)))

(declare-fun b!1117592 () Bool)

(declare-fun res!746361 () Bool)

(assert (=> b!1117592 (=> (not res!746361) (not e!636607))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117592 (= res!746361 (= (select (arr!35024 _keys!1208) i!673) k0!934))))

(declare-fun b!1117593 () Bool)

(declare-fun res!746359 () Bool)

(assert (=> b!1117593 (=> (not res!746359) (not e!636607))))

(assert (=> b!1117593 (= res!746359 (and (= (size!35563 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35562 _keys!1208) (size!35563 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117594 () Bool)

(declare-fun res!746355 () Bool)

(assert (=> b!1117594 (=> (not res!746355) (not e!636607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117594 (= res!746355 (validMask!0 mask!1564))))

(declare-fun b!1117595 () Bool)

(declare-fun e!636610 () Bool)

(assert (=> b!1117595 (= e!636607 e!636610)))

(declare-fun res!746356 () Bool)

(assert (=> b!1117595 (=> (not res!746356) (not e!636610))))

(declare-fun lt!497141 () array!72742)

(assert (=> b!1117595 (= res!746356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497141 mask!1564))))

(assert (=> b!1117595 (= lt!497141 (array!72743 (store (arr!35024 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35562 _keys!1208)))))

(declare-fun b!1117596 () Bool)

(declare-fun e!636609 () Bool)

(assert (=> b!1117596 (= e!636609 tp_is_empty!27973)))

(declare-fun b!1117597 () Bool)

(declare-fun res!746360 () Bool)

(assert (=> b!1117597 (=> (not res!746360) (not e!636607))))

(declare-datatypes ((List!24436 0))(
  ( (Nil!24433) (Cons!24432 (h!25641 (_ BitVec 64)) (t!34908 List!24436)) )
))
(declare-fun arrayNoDuplicates!0 (array!72742 (_ BitVec 32) List!24436) Bool)

(assert (=> b!1117597 (= res!746360 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24433))))

(declare-fun mapNonEmpty!43777 () Bool)

(declare-fun tp!83033 () Bool)

(assert (=> mapNonEmpty!43777 (= mapRes!43777 (and tp!83033 e!636609))))

(declare-fun mapValue!43777 () ValueCell!13277)

(declare-fun mapKey!43777 () (_ BitVec 32))

(declare-fun mapRest!43777 () (Array (_ BitVec 32) ValueCell!13277))

(assert (=> mapNonEmpty!43777 (= (arr!35025 _values!996) (store mapRest!43777 mapKey!43777 mapValue!43777))))

(declare-fun b!1117598 () Bool)

(assert (=> b!1117598 (= e!636610 (not e!636611))))

(declare-fun res!746363 () Bool)

(assert (=> b!1117598 (=> res!746363 e!636611)))

(assert (=> b!1117598 (= res!746363 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117598 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36509 0))(
  ( (Unit!36510) )
))
(declare-fun lt!497142 () Unit!36509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72742 (_ BitVec 64) (_ BitVec 32)) Unit!36509)

(assert (=> b!1117598 (= lt!497142 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117599 () Bool)

(declare-fun res!746357 () Bool)

(assert (=> b!1117599 (=> (not res!746357) (not e!636607))))

(assert (=> b!1117599 (= res!746357 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35562 _keys!1208))))))

(declare-fun b!1117600 () Bool)

(declare-fun res!746364 () Bool)

(assert (=> b!1117600 (=> (not res!746364) (not e!636607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117600 (= res!746364 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43777 () Bool)

(assert (=> mapIsEmpty!43777 mapRes!43777))

(declare-fun b!1117601 () Bool)

(assert (=> b!1117601 (= e!636612 tp_is_empty!27973)))

(declare-fun b!1117602 () Bool)

(declare-fun res!746358 () Bool)

(assert (=> b!1117602 (=> (not res!746358) (not e!636610))))

(assert (=> b!1117602 (= res!746358 (arrayNoDuplicates!0 lt!497141 #b00000000000000000000000000000000 Nil!24433))))

(assert (= (and start!97736 res!746365) b!1117594))

(assert (= (and b!1117594 res!746355) b!1117593))

(assert (= (and b!1117593 res!746359) b!1117590))

(assert (= (and b!1117590 res!746362) b!1117597))

(assert (= (and b!1117597 res!746360) b!1117599))

(assert (= (and b!1117599 res!746357) b!1117600))

(assert (= (and b!1117600 res!746364) b!1117592))

(assert (= (and b!1117592 res!746361) b!1117595))

(assert (= (and b!1117595 res!746356) b!1117602))

(assert (= (and b!1117602 res!746358) b!1117598))

(assert (= (and b!1117598 (not res!746363)) b!1117589))

(assert (= (and b!1117591 condMapEmpty!43777) mapIsEmpty!43777))

(assert (= (and b!1117591 (not condMapEmpty!43777)) mapNonEmpty!43777))

(get-info :version)

(assert (= (and mapNonEmpty!43777 ((_ is ValueCellFull!13277) mapValue!43777)) b!1117596))

(assert (= (and b!1117591 ((_ is ValueCellFull!13277) mapDefault!43777)) b!1117601))

(assert (= start!97736 b!1117591))

(declare-fun m!1032873 () Bool)

(assert (=> start!97736 m!1032873))

(declare-fun m!1032875 () Bool)

(assert (=> start!97736 m!1032875))

(declare-fun m!1032877 () Bool)

(assert (=> b!1117594 m!1032877))

(declare-fun m!1032879 () Bool)

(assert (=> b!1117592 m!1032879))

(declare-fun m!1032881 () Bool)

(assert (=> b!1117595 m!1032881))

(declare-fun m!1032883 () Bool)

(assert (=> b!1117595 m!1032883))

(declare-fun m!1032885 () Bool)

(assert (=> b!1117589 m!1032885))

(declare-fun m!1032887 () Bool)

(assert (=> b!1117600 m!1032887))

(declare-fun m!1032889 () Bool)

(assert (=> b!1117602 m!1032889))

(declare-fun m!1032891 () Bool)

(assert (=> mapNonEmpty!43777 m!1032891))

(declare-fun m!1032893 () Bool)

(assert (=> b!1117597 m!1032893))

(declare-fun m!1032895 () Bool)

(assert (=> b!1117598 m!1032895))

(declare-fun m!1032897 () Bool)

(assert (=> b!1117598 m!1032897))

(declare-fun m!1032899 () Bool)

(assert (=> b!1117590 m!1032899))

(check-sat (not b!1117600) (not b!1117598) tp_is_empty!27973 (not mapNonEmpty!43777) (not b_next!23443) (not b!1117595) (not b!1117594) b_and!37695 (not b!1117590) (not b!1117602) (not b!1117597) (not start!97736) (not b!1117589))
(check-sat b_and!37695 (not b_next!23443))
