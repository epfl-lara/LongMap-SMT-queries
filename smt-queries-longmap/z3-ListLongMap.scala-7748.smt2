; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97234 () Bool)

(assert start!97234)

(declare-fun b!1106577 () Bool)

(declare-fun e!631439 () Bool)

(assert (=> b!1106577 (= e!631439 (not true))))

(declare-datatypes ((array!71847 0))(
  ( (array!71848 (arr!34576 (Array (_ BitVec 32) (_ BitVec 64))) (size!35112 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71847)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106577 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36314 0))(
  ( (Unit!36315) )
))
(declare-fun lt!495481 () Unit!36314)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71847 (_ BitVec 64) (_ BitVec 32)) Unit!36314)

(assert (=> b!1106577 (= lt!495481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106578 () Bool)

(declare-fun res!738471 () Bool)

(declare-fun e!631442 () Bool)

(assert (=> b!1106578 (=> (not res!738471) (not e!631442))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41747 0))(
  ( (V!41748 (val!13789 Int)) )
))
(declare-datatypes ((ValueCell!13023 0))(
  ( (ValueCellFull!13023 (v!16422 V!41747)) (EmptyCell!13023) )
))
(declare-datatypes ((array!71849 0))(
  ( (array!71850 (arr!34577 (Array (_ BitVec 32) ValueCell!13023)) (size!35113 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71849)

(assert (=> b!1106578 (= res!738471 (and (= (size!35113 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35112 _keys!1208) (size!35113 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106579 () Bool)

(declare-fun res!738476 () Bool)

(assert (=> b!1106579 (=> (not res!738476) (not e!631442))))

(assert (=> b!1106579 (= res!738476 (= (select (arr!34576 _keys!1208) i!673) k0!934))))

(declare-fun b!1106580 () Bool)

(declare-fun res!738475 () Bool)

(assert (=> b!1106580 (=> (not res!738475) (not e!631439))))

(declare-fun lt!495482 () array!71847)

(declare-datatypes ((List!24099 0))(
  ( (Nil!24096) (Cons!24095 (h!25304 (_ BitVec 64)) (t!34364 List!24099)) )
))
(declare-fun arrayNoDuplicates!0 (array!71847 (_ BitVec 32) List!24099) Bool)

(assert (=> b!1106580 (= res!738475 (arrayNoDuplicates!0 lt!495482 #b00000000000000000000000000000000 Nil!24096))))

(declare-fun b!1106581 () Bool)

(declare-fun res!738470 () Bool)

(assert (=> b!1106581 (=> (not res!738470) (not e!631442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106581 (= res!738470 (validKeyInArray!0 k0!934))))

(declare-fun b!1106583 () Bool)

(declare-fun e!631443 () Bool)

(declare-fun tp_is_empty!27465 () Bool)

(assert (=> b!1106583 (= e!631443 tp_is_empty!27465)))

(declare-fun mapIsEmpty!43015 () Bool)

(declare-fun mapRes!43015 () Bool)

(assert (=> mapIsEmpty!43015 mapRes!43015))

(declare-fun mapNonEmpty!43015 () Bool)

(declare-fun tp!81935 () Bool)

(declare-fun e!631438 () Bool)

(assert (=> mapNonEmpty!43015 (= mapRes!43015 (and tp!81935 e!631438))))

(declare-fun mapValue!43015 () ValueCell!13023)

(declare-fun mapKey!43015 () (_ BitVec 32))

(declare-fun mapRest!43015 () (Array (_ BitVec 32) ValueCell!13023))

(assert (=> mapNonEmpty!43015 (= (arr!34577 _values!996) (store mapRest!43015 mapKey!43015 mapValue!43015))))

(declare-fun b!1106584 () Bool)

(declare-fun res!738469 () Bool)

(assert (=> b!1106584 (=> (not res!738469) (not e!631442))))

(assert (=> b!1106584 (= res!738469 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35112 _keys!1208))))))

(declare-fun b!1106585 () Bool)

(declare-fun res!738473 () Bool)

(assert (=> b!1106585 (=> (not res!738473) (not e!631442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71847 (_ BitVec 32)) Bool)

(assert (=> b!1106585 (= res!738473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106586 () Bool)

(declare-fun e!631440 () Bool)

(assert (=> b!1106586 (= e!631440 (and e!631443 mapRes!43015))))

(declare-fun condMapEmpty!43015 () Bool)

(declare-fun mapDefault!43015 () ValueCell!13023)

(assert (=> b!1106586 (= condMapEmpty!43015 (= (arr!34577 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13023)) mapDefault!43015)))))

(declare-fun b!1106587 () Bool)

(assert (=> b!1106587 (= e!631438 tp_is_empty!27465)))

(declare-fun b!1106582 () Bool)

(declare-fun res!738478 () Bool)

(assert (=> b!1106582 (=> (not res!738478) (not e!631442))))

(assert (=> b!1106582 (= res!738478 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24096))))

(declare-fun res!738472 () Bool)

(assert (=> start!97234 (=> (not res!738472) (not e!631442))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97234 (= res!738472 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35112 _keys!1208))))))

(assert (=> start!97234 e!631442))

(declare-fun array_inv!26610 (array!71847) Bool)

(assert (=> start!97234 (array_inv!26610 _keys!1208)))

(assert (=> start!97234 true))

(declare-fun array_inv!26611 (array!71849) Bool)

(assert (=> start!97234 (and (array_inv!26611 _values!996) e!631440)))

(declare-fun b!1106588 () Bool)

(declare-fun res!738477 () Bool)

(assert (=> b!1106588 (=> (not res!738477) (not e!631442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106588 (= res!738477 (validMask!0 mask!1564))))

(declare-fun b!1106589 () Bool)

(assert (=> b!1106589 (= e!631442 e!631439)))

(declare-fun res!738474 () Bool)

(assert (=> b!1106589 (=> (not res!738474) (not e!631439))))

(assert (=> b!1106589 (= res!738474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495482 mask!1564))))

(assert (=> b!1106589 (= lt!495482 (array!71848 (store (arr!34576 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35112 _keys!1208)))))

(assert (= (and start!97234 res!738472) b!1106588))

(assert (= (and b!1106588 res!738477) b!1106578))

(assert (= (and b!1106578 res!738471) b!1106585))

(assert (= (and b!1106585 res!738473) b!1106582))

(assert (= (and b!1106582 res!738478) b!1106584))

(assert (= (and b!1106584 res!738469) b!1106581))

(assert (= (and b!1106581 res!738470) b!1106579))

(assert (= (and b!1106579 res!738476) b!1106589))

(assert (= (and b!1106589 res!738474) b!1106580))

(assert (= (and b!1106580 res!738475) b!1106577))

(assert (= (and b!1106586 condMapEmpty!43015) mapIsEmpty!43015))

(assert (= (and b!1106586 (not condMapEmpty!43015)) mapNonEmpty!43015))

(get-info :version)

(assert (= (and mapNonEmpty!43015 ((_ is ValueCellFull!13023) mapValue!43015)) b!1106587))

(assert (= (and b!1106586 ((_ is ValueCellFull!13023) mapDefault!43015)) b!1106583))

(assert (= start!97234 b!1106586))

(declare-fun m!1025593 () Bool)

(assert (=> b!1106588 m!1025593))

(declare-fun m!1025595 () Bool)

(assert (=> b!1106582 m!1025595))

(declare-fun m!1025597 () Bool)

(assert (=> b!1106580 m!1025597))

(declare-fun m!1025599 () Bool)

(assert (=> b!1106577 m!1025599))

(declare-fun m!1025601 () Bool)

(assert (=> b!1106577 m!1025601))

(declare-fun m!1025603 () Bool)

(assert (=> start!97234 m!1025603))

(declare-fun m!1025605 () Bool)

(assert (=> start!97234 m!1025605))

(declare-fun m!1025607 () Bool)

(assert (=> b!1106589 m!1025607))

(declare-fun m!1025609 () Bool)

(assert (=> b!1106589 m!1025609))

(declare-fun m!1025611 () Bool)

(assert (=> b!1106585 m!1025611))

(declare-fun m!1025613 () Bool)

(assert (=> b!1106579 m!1025613))

(declare-fun m!1025615 () Bool)

(assert (=> b!1106581 m!1025615))

(declare-fun m!1025617 () Bool)

(assert (=> mapNonEmpty!43015 m!1025617))

(check-sat (not b!1106588) tp_is_empty!27465 (not b!1106581) (not b!1106585) (not mapNonEmpty!43015) (not b!1106577) (not b!1106580) (not b!1106589) (not b!1106582) (not start!97234))
(check-sat)
