; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134078 () Bool)

(assert start!134078)

(declare-fun b_free!32205 () Bool)

(declare-fun b_next!32205 () Bool)

(assert (=> start!134078 (= b_free!32205 (not b_next!32205))))

(declare-fun tp!113934 () Bool)

(declare-fun b_and!51849 () Bool)

(assert (=> start!134078 (= tp!113934 b_and!51849)))

(declare-fun res!1071002 () Bool)

(declare-fun e!873497 () Bool)

(assert (=> start!134078 (=> (not res!1071002) (not e!873497))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134078 (= res!1071002 (validMask!0 mask!947))))

(assert (=> start!134078 e!873497))

(assert (=> start!134078 tp!113934))

(declare-fun tp_is_empty!38985 () Bool)

(assert (=> start!134078 tp_is_empty!38985))

(assert (=> start!134078 true))

(declare-datatypes ((array!104660 0))(
  ( (array!104661 (arr!50515 (Array (_ BitVec 32) (_ BitVec 64))) (size!51065 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104660)

(declare-fun array_inv!39249 (array!104660) Bool)

(assert (=> start!134078 (array_inv!39249 _keys!637)))

(declare-datatypes ((V!60187 0))(
  ( (V!60188 (val!19576 Int)) )
))
(declare-datatypes ((ValueCell!18462 0))(
  ( (ValueCellFull!18462 (v!22335 V!60187)) (EmptyCell!18462) )
))
(declare-datatypes ((array!104662 0))(
  ( (array!104663 (arr!50516 (Array (_ BitVec 32) ValueCell!18462)) (size!51066 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104662)

(declare-fun e!873494 () Bool)

(declare-fun array_inv!39250 (array!104662) Bool)

(assert (=> start!134078 (and (array_inv!39250 _values!487) e!873494)))

(declare-fun b!1567033 () Bool)

(declare-fun res!1071003 () Bool)

(assert (=> b!1567033 (=> (not res!1071003) (not e!873497))))

(declare-datatypes ((List!36645 0))(
  ( (Nil!36642) (Cons!36641 (h!38088 (_ BitVec 64)) (t!51549 List!36645)) )
))
(declare-fun arrayNoDuplicates!0 (array!104660 (_ BitVec 32) List!36645) Bool)

(assert (=> b!1567033 (= res!1071003 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36642))))

(declare-fun mapNonEmpty!59877 () Bool)

(declare-fun mapRes!59877 () Bool)

(declare-fun tp!113933 () Bool)

(declare-fun e!873495 () Bool)

(assert (=> mapNonEmpty!59877 (= mapRes!59877 (and tp!113933 e!873495))))

(declare-fun mapRest!59877 () (Array (_ BitVec 32) ValueCell!18462))

(declare-fun mapValue!59877 () ValueCell!18462)

(declare-fun mapKey!59877 () (_ BitVec 32))

(assert (=> mapNonEmpty!59877 (= (arr!50516 _values!487) (store mapRest!59877 mapKey!59877 mapValue!59877))))

(declare-fun b!1567034 () Bool)

(declare-fun e!873499 () Bool)

(assert (=> b!1567034 (= e!873499 false)))

(declare-fun lt!672850 () Bool)

(declare-datatypes ((tuple2!25258 0))(
  ( (tuple2!25259 (_1!12640 (_ BitVec 64)) (_2!12640 V!60187)) )
))
(declare-datatypes ((List!36646 0))(
  ( (Nil!36643) (Cons!36642 (h!38089 tuple2!25258) (t!51550 List!36646)) )
))
(declare-datatypes ((ListLongMap!22693 0))(
  ( (ListLongMap!22694 (toList!11362 List!36646)) )
))
(declare-fun lt!672851 () ListLongMap!22693)

(declare-fun contains!10356 (ListLongMap!22693 (_ BitVec 64)) Bool)

(assert (=> b!1567034 (= lt!672850 (contains!10356 lt!672851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567035 () Bool)

(declare-fun res!1071004 () Bool)

(assert (=> b!1567035 (=> (not res!1071004) (not e!873497))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567035 (= res!1071004 (not (validKeyInArray!0 (select (arr!50515 _keys!637) from!782))))))

(declare-fun mapIsEmpty!59877 () Bool)

(assert (=> mapIsEmpty!59877 mapRes!59877))

(declare-fun b!1567036 () Bool)

(declare-fun res!1070999 () Bool)

(assert (=> b!1567036 (=> (not res!1070999) (not e!873497))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1567036 (= res!1070999 (and (= (size!51066 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51065 _keys!637) (size!51066 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567037 () Bool)

(declare-fun e!873498 () Bool)

(assert (=> b!1567037 (= e!873498 tp_is_empty!38985)))

(declare-fun b!1567038 () Bool)

(assert (=> b!1567038 (= e!873497 e!873499)))

(declare-fun res!1071000 () Bool)

(assert (=> b!1567038 (=> (not res!1071000) (not e!873499))))

(assert (=> b!1567038 (= res!1071000 (not (contains!10356 lt!672851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60187)

(declare-fun minValue!453 () V!60187)

(declare-fun getCurrentListMapNoExtraKeys!6727 (array!104660 array!104662 (_ BitVec 32) (_ BitVec 32) V!60187 V!60187 (_ BitVec 32) Int) ListLongMap!22693)

(assert (=> b!1567038 (= lt!672851 (getCurrentListMapNoExtraKeys!6727 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567039 () Bool)

(declare-fun res!1070998 () Bool)

(assert (=> b!1567039 (=> (not res!1070998) (not e!873497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104660 (_ BitVec 32)) Bool)

(assert (=> b!1567039 (= res!1070998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567040 () Bool)

(assert (=> b!1567040 (= e!873495 tp_is_empty!38985)))

(declare-fun b!1567041 () Bool)

(assert (=> b!1567041 (= e!873494 (and e!873498 mapRes!59877))))

(declare-fun condMapEmpty!59877 () Bool)

(declare-fun mapDefault!59877 () ValueCell!18462)

(assert (=> b!1567041 (= condMapEmpty!59877 (= (arr!50516 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18462)) mapDefault!59877)))))

(declare-fun b!1567042 () Bool)

(declare-fun res!1071001 () Bool)

(assert (=> b!1567042 (=> (not res!1071001) (not e!873497))))

(assert (=> b!1567042 (= res!1071001 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51065 _keys!637)) (bvslt from!782 (size!51065 _keys!637))))))

(assert (= (and start!134078 res!1071002) b!1567036))

(assert (= (and b!1567036 res!1070999) b!1567039))

(assert (= (and b!1567039 res!1070998) b!1567033))

(assert (= (and b!1567033 res!1071003) b!1567042))

(assert (= (and b!1567042 res!1071001) b!1567035))

(assert (= (and b!1567035 res!1071004) b!1567038))

(assert (= (and b!1567038 res!1071000) b!1567034))

(assert (= (and b!1567041 condMapEmpty!59877) mapIsEmpty!59877))

(assert (= (and b!1567041 (not condMapEmpty!59877)) mapNonEmpty!59877))

(get-info :version)

(assert (= (and mapNonEmpty!59877 ((_ is ValueCellFull!18462) mapValue!59877)) b!1567040))

(assert (= (and b!1567041 ((_ is ValueCellFull!18462) mapDefault!59877)) b!1567037))

(assert (= start!134078 b!1567041))

(declare-fun m!1442001 () Bool)

(assert (=> b!1567039 m!1442001))

(declare-fun m!1442003 () Bool)

(assert (=> b!1567034 m!1442003))

(declare-fun m!1442005 () Bool)

(assert (=> b!1567035 m!1442005))

(assert (=> b!1567035 m!1442005))

(declare-fun m!1442007 () Bool)

(assert (=> b!1567035 m!1442007))

(declare-fun m!1442009 () Bool)

(assert (=> b!1567033 m!1442009))

(declare-fun m!1442011 () Bool)

(assert (=> mapNonEmpty!59877 m!1442011))

(declare-fun m!1442013 () Bool)

(assert (=> b!1567038 m!1442013))

(declare-fun m!1442015 () Bool)

(assert (=> b!1567038 m!1442015))

(declare-fun m!1442017 () Bool)

(assert (=> start!134078 m!1442017))

(declare-fun m!1442019 () Bool)

(assert (=> start!134078 m!1442019))

(declare-fun m!1442021 () Bool)

(assert (=> start!134078 m!1442021))

(check-sat (not b!1567035) tp_is_empty!38985 (not b_next!32205) (not b!1567038) (not b!1567033) b_and!51849 (not b!1567034) (not b!1567039) (not start!134078) (not mapNonEmpty!59877))
(check-sat b_and!51849 (not b_next!32205))
