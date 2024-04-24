; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97954 () Bool)

(assert start!97954)

(declare-fun res!746581 () Bool)

(declare-fun e!637318 () Bool)

(assert (=> start!97954 (=> (not res!746581) (not e!637318))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72835 0))(
  ( (array!72836 (arr!35064 (Array (_ BitVec 32) (_ BitVec 64))) (size!35601 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72835)

(assert (=> start!97954 (= res!746581 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35601 _keys!1208))))))

(assert (=> start!97954 e!637318))

(declare-fun array_inv!27012 (array!72835) Bool)

(assert (=> start!97954 (array_inv!27012 _keys!1208)))

(assert (=> start!97954 true))

(declare-datatypes ((V!42393 0))(
  ( (V!42394 (val!14031 Int)) )
))
(declare-datatypes ((ValueCell!13265 0))(
  ( (ValueCellFull!13265 (v!16660 V!42393)) (EmptyCell!13265) )
))
(declare-datatypes ((array!72837 0))(
  ( (array!72838 (arr!35065 (Array (_ BitVec 32) ValueCell!13265)) (size!35602 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72837)

(declare-fun e!637316 () Bool)

(declare-fun array_inv!27013 (array!72837) Bool)

(assert (=> start!97954 (and (array_inv!27013 _values!996) e!637316)))

(declare-fun b!1118566 () Bool)

(declare-fun res!746576 () Bool)

(declare-fun e!637317 () Bool)

(assert (=> b!1118566 (=> (not res!746576) (not e!637317))))

(declare-fun lt!497773 () array!72835)

(declare-datatypes ((List!24407 0))(
  ( (Nil!24404) (Cons!24403 (h!25621 (_ BitVec 64)) (t!34880 List!24407)) )
))
(declare-fun arrayNoDuplicates!0 (array!72835 (_ BitVec 32) List!24407) Bool)

(assert (=> b!1118566 (= res!746576 (arrayNoDuplicates!0 lt!497773 #b00000000000000000000000000000000 Nil!24404))))

(declare-fun b!1118567 () Bool)

(declare-fun res!746579 () Bool)

(assert (=> b!1118567 (=> (not res!746579) (not e!637318))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1118567 (= res!746579 (and (= (size!35602 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35601 _keys!1208) (size!35602 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118568 () Bool)

(declare-fun res!746578 () Bool)

(assert (=> b!1118568 (=> (not res!746578) (not e!637318))))

(assert (=> b!1118568 (= res!746578 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24404))))

(declare-fun mapIsEmpty!43741 () Bool)

(declare-fun mapRes!43741 () Bool)

(assert (=> mapIsEmpty!43741 mapRes!43741))

(declare-fun mapNonEmpty!43741 () Bool)

(declare-fun tp!82985 () Bool)

(declare-fun e!637320 () Bool)

(assert (=> mapNonEmpty!43741 (= mapRes!43741 (and tp!82985 e!637320))))

(declare-fun mapRest!43741 () (Array (_ BitVec 32) ValueCell!13265))

(declare-fun mapValue!43741 () ValueCell!13265)

(declare-fun mapKey!43741 () (_ BitVec 32))

(assert (=> mapNonEmpty!43741 (= (arr!35065 _values!996) (store mapRest!43741 mapKey!43741 mapValue!43741))))

(declare-fun b!1118569 () Bool)

(declare-fun res!746580 () Bool)

(assert (=> b!1118569 (=> (not res!746580) (not e!637318))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118569 (= res!746580 (= (select (arr!35064 _keys!1208) i!673) k0!934))))

(declare-fun b!1118570 () Bool)

(declare-fun e!637319 () Bool)

(assert (=> b!1118570 (= e!637316 (and e!637319 mapRes!43741))))

(declare-fun condMapEmpty!43741 () Bool)

(declare-fun mapDefault!43741 () ValueCell!13265)

(assert (=> b!1118570 (= condMapEmpty!43741 (= (arr!35065 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13265)) mapDefault!43741)))))

(declare-fun b!1118571 () Bool)

(declare-fun res!746577 () Bool)

(assert (=> b!1118571 (=> (not res!746577) (not e!637318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118571 (= res!746577 (validKeyInArray!0 k0!934))))

(declare-fun b!1118572 () Bool)

(declare-fun tp_is_empty!27949 () Bool)

(assert (=> b!1118572 (= e!637319 tp_is_empty!27949)))

(declare-fun b!1118573 () Bool)

(assert (=> b!1118573 (= e!637318 e!637317)))

(declare-fun res!746583 () Bool)

(assert (=> b!1118573 (=> (not res!746583) (not e!637317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72835 (_ BitVec 32)) Bool)

(assert (=> b!1118573 (= res!746583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497773 mask!1564))))

(assert (=> b!1118573 (= lt!497773 (array!72836 (store (arr!35064 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35601 _keys!1208)))))

(declare-fun b!1118574 () Bool)

(assert (=> b!1118574 (= e!637317 (not true))))

(declare-fun arrayContainsKey!0 (array!72835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118574 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36645 0))(
  ( (Unit!36646) )
))
(declare-fun lt!497772 () Unit!36645)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72835 (_ BitVec 64) (_ BitVec 32)) Unit!36645)

(assert (=> b!1118574 (= lt!497772 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118575 () Bool)

(declare-fun res!746575 () Bool)

(assert (=> b!1118575 (=> (not res!746575) (not e!637318))))

(assert (=> b!1118575 (= res!746575 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35601 _keys!1208))))))

(declare-fun b!1118576 () Bool)

(assert (=> b!1118576 (= e!637320 tp_is_empty!27949)))

(declare-fun b!1118577 () Bool)

(declare-fun res!746582 () Bool)

(assert (=> b!1118577 (=> (not res!746582) (not e!637318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118577 (= res!746582 (validMask!0 mask!1564))))

(declare-fun b!1118578 () Bool)

(declare-fun res!746584 () Bool)

(assert (=> b!1118578 (=> (not res!746584) (not e!637318))))

(assert (=> b!1118578 (= res!746584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97954 res!746581) b!1118577))

(assert (= (and b!1118577 res!746582) b!1118567))

(assert (= (and b!1118567 res!746579) b!1118578))

(assert (= (and b!1118578 res!746584) b!1118568))

(assert (= (and b!1118568 res!746578) b!1118575))

(assert (= (and b!1118575 res!746575) b!1118571))

(assert (= (and b!1118571 res!746577) b!1118569))

(assert (= (and b!1118569 res!746580) b!1118573))

(assert (= (and b!1118573 res!746583) b!1118566))

(assert (= (and b!1118566 res!746576) b!1118574))

(assert (= (and b!1118570 condMapEmpty!43741) mapIsEmpty!43741))

(assert (= (and b!1118570 (not condMapEmpty!43741)) mapNonEmpty!43741))

(get-info :version)

(assert (= (and mapNonEmpty!43741 ((_ is ValueCellFull!13265) mapValue!43741)) b!1118576))

(assert (= (and b!1118570 ((_ is ValueCellFull!13265) mapDefault!43741)) b!1118572))

(assert (= start!97954 b!1118570))

(declare-fun m!1034853 () Bool)

(assert (=> b!1118577 m!1034853))

(declare-fun m!1034855 () Bool)

(assert (=> b!1118569 m!1034855))

(declare-fun m!1034857 () Bool)

(assert (=> b!1118573 m!1034857))

(declare-fun m!1034859 () Bool)

(assert (=> b!1118573 m!1034859))

(declare-fun m!1034861 () Bool)

(assert (=> b!1118578 m!1034861))

(declare-fun m!1034863 () Bool)

(assert (=> b!1118568 m!1034863))

(declare-fun m!1034865 () Bool)

(assert (=> b!1118574 m!1034865))

(declare-fun m!1034867 () Bool)

(assert (=> b!1118574 m!1034867))

(declare-fun m!1034869 () Bool)

(assert (=> start!97954 m!1034869))

(declare-fun m!1034871 () Bool)

(assert (=> start!97954 m!1034871))

(declare-fun m!1034873 () Bool)

(assert (=> mapNonEmpty!43741 m!1034873))

(declare-fun m!1034875 () Bool)

(assert (=> b!1118566 m!1034875))

(declare-fun m!1034877 () Bool)

(assert (=> b!1118571 m!1034877))

(check-sat (not b!1118568) (not b!1118577) (not b!1118573) (not b!1118566) (not start!97954) (not mapNonEmpty!43741) (not b!1118571) (not b!1118574) tp_is_empty!27949 (not b!1118578))
(check-sat)
