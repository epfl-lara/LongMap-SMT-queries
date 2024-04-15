; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97556 () Bool)

(assert start!97556)

(declare-fun mapIsEmpty!43507 () Bool)

(declare-fun mapRes!43507 () Bool)

(assert (=> mapIsEmpty!43507 mapRes!43507))

(declare-fun b!1114068 () Bool)

(declare-fun e!634975 () Bool)

(declare-fun e!634978 () Bool)

(assert (=> b!1114068 (= e!634975 e!634978)))

(declare-fun res!743645 () Bool)

(assert (=> b!1114068 (=> (not res!743645) (not e!634978))))

(declare-datatypes ((array!72392 0))(
  ( (array!72393 (arr!34849 (Array (_ BitVec 32) (_ BitVec 64))) (size!35387 (_ BitVec 32))) )
))
(declare-fun lt!496590 () array!72392)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72392 (_ BitVec 32)) Bool)

(assert (=> b!1114068 (= res!743645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496590 mask!1564))))

(declare-fun _keys!1208 () array!72392)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114068 (= lt!496590 (array!72393 (store (arr!34849 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35387 _keys!1208)))))

(declare-fun b!1114069 () Bool)

(declare-fun e!634979 () Bool)

(declare-fun tp_is_empty!27793 () Bool)

(assert (=> b!1114069 (= e!634979 tp_is_empty!27793)))

(declare-fun b!1114070 () Bool)

(declare-fun res!743647 () Bool)

(assert (=> b!1114070 (=> (not res!743647) (not e!634975))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114070 (= res!743647 (= (select (arr!34849 _keys!1208) i!673) k0!934))))

(declare-fun b!1114071 () Bool)

(declare-fun res!743650 () Bool)

(assert (=> b!1114071 (=> (not res!743650) (not e!634975))))

(declare-datatypes ((List!24357 0))(
  ( (Nil!24354) (Cons!24353 (h!25562 (_ BitVec 64)) (t!34829 List!24357)) )
))
(declare-fun arrayNoDuplicates!0 (array!72392 (_ BitVec 32) List!24357) Bool)

(assert (=> b!1114071 (= res!743650 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24354))))

(declare-fun b!1114072 () Bool)

(declare-fun res!743646 () Bool)

(assert (=> b!1114072 (=> (not res!743646) (not e!634975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114072 (= res!743646 (validKeyInArray!0 k0!934))))

(declare-fun b!1114073 () Bool)

(declare-fun res!743649 () Bool)

(assert (=> b!1114073 (=> (not res!743649) (not e!634975))))

(assert (=> b!1114073 (= res!743649 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35387 _keys!1208))))))

(declare-fun b!1114074 () Bool)

(declare-fun res!743653 () Bool)

(assert (=> b!1114074 (=> (not res!743653) (not e!634975))))

(assert (=> b!1114074 (= res!743653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43507 () Bool)

(declare-fun tp!82751 () Bool)

(assert (=> mapNonEmpty!43507 (= mapRes!43507 (and tp!82751 e!634979))))

(declare-fun mapKey!43507 () (_ BitVec 32))

(declare-datatypes ((V!42185 0))(
  ( (V!42186 (val!13953 Int)) )
))
(declare-datatypes ((ValueCell!13187 0))(
  ( (ValueCellFull!13187 (v!16585 V!42185)) (EmptyCell!13187) )
))
(declare-fun mapValue!43507 () ValueCell!13187)

(declare-fun mapRest!43507 () (Array (_ BitVec 32) ValueCell!13187))

(declare-datatypes ((array!72394 0))(
  ( (array!72395 (arr!34850 (Array (_ BitVec 32) ValueCell!13187)) (size!35388 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72394)

(assert (=> mapNonEmpty!43507 (= (arr!34850 _values!996) (store mapRest!43507 mapKey!43507 mapValue!43507))))

(declare-fun b!1114075 () Bool)

(declare-fun e!634977 () Bool)

(assert (=> b!1114075 (= e!634977 tp_is_empty!27793)))

(declare-fun b!1114076 () Bool)

(declare-fun res!743651 () Bool)

(assert (=> b!1114076 (=> (not res!743651) (not e!634975))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114076 (= res!743651 (and (= (size!35388 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35387 _keys!1208) (size!35388 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!743644 () Bool)

(assert (=> start!97556 (=> (not res!743644) (not e!634975))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97556 (= res!743644 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35387 _keys!1208))))))

(assert (=> start!97556 e!634975))

(declare-fun array_inv!26866 (array!72392) Bool)

(assert (=> start!97556 (array_inv!26866 _keys!1208)))

(assert (=> start!97556 true))

(declare-fun e!634976 () Bool)

(declare-fun array_inv!26867 (array!72394) Bool)

(assert (=> start!97556 (and (array_inv!26867 _values!996) e!634976)))

(declare-fun b!1114077 () Bool)

(assert (=> b!1114077 (= e!634978 (not true))))

(declare-fun arrayContainsKey!0 (array!72392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114077 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36387 0))(
  ( (Unit!36388) )
))
(declare-fun lt!496589 () Unit!36387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72392 (_ BitVec 64) (_ BitVec 32)) Unit!36387)

(assert (=> b!1114077 (= lt!496589 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114078 () Bool)

(assert (=> b!1114078 (= e!634976 (and e!634977 mapRes!43507))))

(declare-fun condMapEmpty!43507 () Bool)

(declare-fun mapDefault!43507 () ValueCell!13187)

(assert (=> b!1114078 (= condMapEmpty!43507 (= (arr!34850 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13187)) mapDefault!43507)))))

(declare-fun b!1114079 () Bool)

(declare-fun res!743648 () Bool)

(assert (=> b!1114079 (=> (not res!743648) (not e!634975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114079 (= res!743648 (validMask!0 mask!1564))))

(declare-fun b!1114080 () Bool)

(declare-fun res!743652 () Bool)

(assert (=> b!1114080 (=> (not res!743652) (not e!634978))))

(assert (=> b!1114080 (= res!743652 (arrayNoDuplicates!0 lt!496590 #b00000000000000000000000000000000 Nil!24354))))

(assert (= (and start!97556 res!743644) b!1114079))

(assert (= (and b!1114079 res!743648) b!1114076))

(assert (= (and b!1114076 res!743651) b!1114074))

(assert (= (and b!1114074 res!743653) b!1114071))

(assert (= (and b!1114071 res!743650) b!1114073))

(assert (= (and b!1114073 res!743649) b!1114072))

(assert (= (and b!1114072 res!743646) b!1114070))

(assert (= (and b!1114070 res!743647) b!1114068))

(assert (= (and b!1114068 res!743645) b!1114080))

(assert (= (and b!1114080 res!743652) b!1114077))

(assert (= (and b!1114078 condMapEmpty!43507) mapIsEmpty!43507))

(assert (= (and b!1114078 (not condMapEmpty!43507)) mapNonEmpty!43507))

(get-info :version)

(assert (= (and mapNonEmpty!43507 ((_ is ValueCellFull!13187) mapValue!43507)) b!1114069))

(assert (= (and b!1114078 ((_ is ValueCellFull!13187) mapDefault!43507)) b!1114075))

(assert (= start!97556 b!1114078))

(declare-fun m!1030527 () Bool)

(assert (=> b!1114079 m!1030527))

(declare-fun m!1030529 () Bool)

(assert (=> b!1114070 m!1030529))

(declare-fun m!1030531 () Bool)

(assert (=> b!1114074 m!1030531))

(declare-fun m!1030533 () Bool)

(assert (=> start!97556 m!1030533))

(declare-fun m!1030535 () Bool)

(assert (=> start!97556 m!1030535))

(declare-fun m!1030537 () Bool)

(assert (=> mapNonEmpty!43507 m!1030537))

(declare-fun m!1030539 () Bool)

(assert (=> b!1114072 m!1030539))

(declare-fun m!1030541 () Bool)

(assert (=> b!1114080 m!1030541))

(declare-fun m!1030543 () Bool)

(assert (=> b!1114068 m!1030543))

(declare-fun m!1030545 () Bool)

(assert (=> b!1114068 m!1030545))

(declare-fun m!1030547 () Bool)

(assert (=> b!1114071 m!1030547))

(declare-fun m!1030549 () Bool)

(assert (=> b!1114077 m!1030549))

(declare-fun m!1030551 () Bool)

(assert (=> b!1114077 m!1030551))

(check-sat (not b!1114068) (not mapNonEmpty!43507) tp_is_empty!27793 (not b!1114077) (not start!97556) (not b!1114074) (not b!1114072) (not b!1114071) (not b!1114079) (not b!1114080))
(check-sat)
