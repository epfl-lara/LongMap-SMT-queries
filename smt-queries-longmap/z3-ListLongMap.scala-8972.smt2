; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108782 () Bool)

(assert start!108782)

(declare-fun b_free!28105 () Bool)

(declare-fun b_next!28105 () Bool)

(assert (=> start!108782 (= b_free!28105 (not b_next!28105))))

(declare-fun tp!99425 () Bool)

(declare-fun b_and!46167 () Bool)

(assert (=> start!108782 (= tp!99425 b_and!46167)))

(declare-fun b!1282791 () Bool)

(declare-fun e!733014 () Bool)

(declare-fun tp_is_empty!33745 () Bool)

(assert (=> b!1282791 (= e!733014 tp_is_empty!33745)))

(declare-fun res!851790 () Bool)

(declare-fun e!733010 () Bool)

(assert (=> start!108782 (=> (not res!851790) (not e!733010))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108782 (= res!851790 (validMask!0 mask!2175))))

(assert (=> start!108782 e!733010))

(assert (=> start!108782 tp_is_empty!33745))

(assert (=> start!108782 true))

(declare-datatypes ((V!50097 0))(
  ( (V!50098 (val!16947 Int)) )
))
(declare-datatypes ((ValueCell!15974 0))(
  ( (ValueCellFull!15974 (v!19542 V!50097)) (EmptyCell!15974) )
))
(declare-datatypes ((array!84593 0))(
  ( (array!84594 (arr!40796 (Array (_ BitVec 32) ValueCell!15974)) (size!41347 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84593)

(declare-fun e!733009 () Bool)

(declare-fun array_inv!31169 (array!84593) Bool)

(assert (=> start!108782 (and (array_inv!31169 _values!1445) e!733009)))

(declare-datatypes ((array!84595 0))(
  ( (array!84596 (arr!40797 (Array (_ BitVec 32) (_ BitVec 64))) (size!41348 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84595)

(declare-fun array_inv!31170 (array!84595) Bool)

(assert (=> start!108782 (array_inv!31170 _keys!1741)))

(assert (=> start!108782 tp!99425))

(declare-fun b!1282792 () Bool)

(declare-fun res!851795 () Bool)

(assert (=> b!1282792 (=> (not res!851795) (not e!733010))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282792 (= res!851795 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41348 _keys!1741)) (not (= (select (arr!40797 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1282793 () Bool)

(declare-fun e!733011 () Bool)

(assert (=> b!1282793 (= e!733011 true)))

(declare-fun arrayContainsKey!0 (array!84595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1282793 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun minValue!1387 () V!50097)

(declare-fun zeroValue!1387 () V!50097)

(declare-datatypes ((Unit!42404 0))(
  ( (Unit!42405) )
))
(declare-fun lt!576726 () Unit!42404)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!637 (array!84595 array!84593 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 64) (_ BitVec 32) Int) Unit!42404)

(assert (=> b!1282793 (= lt!576726 (lemmaListMapContainsThenArrayContainsFrom!637 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1282794 () Bool)

(assert (=> b!1282794 (= e!733010 (not e!733011))))

(declare-fun res!851791 () Bool)

(assert (=> b!1282794 (=> res!851791 e!733011)))

(assert (=> b!1282794 (= res!851791 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!21720 0))(
  ( (tuple2!21721 (_1!10871 (_ BitVec 64)) (_2!10871 V!50097)) )
))
(declare-datatypes ((List!28935 0))(
  ( (Nil!28932) (Cons!28931 (h!30149 tuple2!21720) (t!42467 List!28935)) )
))
(declare-datatypes ((ListLongMap!19385 0))(
  ( (ListLongMap!19386 (toList!9708 List!28935)) )
))
(declare-fun contains!7837 (ListLongMap!19385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4777 (array!84595 array!84593 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 32) Int) ListLongMap!19385)

(assert (=> b!1282794 (contains!7837 (getCurrentListMap!4777 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-fun lt!576725 () Unit!42404)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!23 (array!84595 array!84593 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 64) (_ BitVec 32) Int) Unit!42404)

(assert (=> b!1282794 (= lt!576725 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!23 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1282795 () Bool)

(declare-fun e!733012 () Bool)

(declare-fun mapRes!52169 () Bool)

(assert (=> b!1282795 (= e!733009 (and e!733012 mapRes!52169))))

(declare-fun condMapEmpty!52169 () Bool)

(declare-fun mapDefault!52169 () ValueCell!15974)

(assert (=> b!1282795 (= condMapEmpty!52169 (= (arr!40796 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15974)) mapDefault!52169)))))

(declare-fun b!1282796 () Bool)

(declare-fun res!851792 () Bool)

(assert (=> b!1282796 (=> (not res!851792) (not e!733010))))

(assert (=> b!1282796 (= res!851792 (and (= (size!41347 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41348 _keys!1741) (size!41347 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282797 () Bool)

(assert (=> b!1282797 (= e!733012 tp_is_empty!33745)))

(declare-fun b!1282798 () Bool)

(declare-fun res!851793 () Bool)

(assert (=> b!1282798 (=> (not res!851793) (not e!733010))))

(declare-datatypes ((List!28936 0))(
  ( (Nil!28933) (Cons!28932 (h!30150 (_ BitVec 64)) (t!42468 List!28936)) )
))
(declare-fun arrayNoDuplicates!0 (array!84595 (_ BitVec 32) List!28936) Bool)

(assert (=> b!1282798 (= res!851793 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28933))))

(declare-fun b!1282799 () Bool)

(declare-fun res!851794 () Bool)

(assert (=> b!1282799 (=> (not res!851794) (not e!733010))))

(assert (=> b!1282799 (= res!851794 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41348 _keys!1741))))))

(declare-fun b!1282800 () Bool)

(declare-fun res!851796 () Bool)

(assert (=> b!1282800 (=> (not res!851796) (not e!733010))))

(assert (=> b!1282800 (= res!851796 (contains!7837 (getCurrentListMap!4777 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282801 () Bool)

(declare-fun res!851789 () Bool)

(assert (=> b!1282801 (=> (not res!851789) (not e!733010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84595 (_ BitVec 32)) Bool)

(assert (=> b!1282801 (= res!851789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52169 () Bool)

(declare-fun tp!99424 () Bool)

(assert (=> mapNonEmpty!52169 (= mapRes!52169 (and tp!99424 e!733014))))

(declare-fun mapValue!52169 () ValueCell!15974)

(declare-fun mapKey!52169 () (_ BitVec 32))

(declare-fun mapRest!52169 () (Array (_ BitVec 32) ValueCell!15974))

(assert (=> mapNonEmpty!52169 (= (arr!40796 _values!1445) (store mapRest!52169 mapKey!52169 mapValue!52169))))

(declare-fun mapIsEmpty!52169 () Bool)

(assert (=> mapIsEmpty!52169 mapRes!52169))

(assert (= (and start!108782 res!851790) b!1282796))

(assert (= (and b!1282796 res!851792) b!1282801))

(assert (= (and b!1282801 res!851789) b!1282798))

(assert (= (and b!1282798 res!851793) b!1282799))

(assert (= (and b!1282799 res!851794) b!1282800))

(assert (= (and b!1282800 res!851796) b!1282792))

(assert (= (and b!1282792 res!851795) b!1282794))

(assert (= (and b!1282794 (not res!851791)) b!1282793))

(assert (= (and b!1282795 condMapEmpty!52169) mapIsEmpty!52169))

(assert (= (and b!1282795 (not condMapEmpty!52169)) mapNonEmpty!52169))

(get-info :version)

(assert (= (and mapNonEmpty!52169 ((_ is ValueCellFull!15974) mapValue!52169)) b!1282791))

(assert (= (and b!1282795 ((_ is ValueCellFull!15974) mapDefault!52169)) b!1282797))

(assert (= start!108782 b!1282795))

(declare-fun m!1177509 () Bool)

(assert (=> mapNonEmpty!52169 m!1177509))

(declare-fun m!1177511 () Bool)

(assert (=> b!1282792 m!1177511))

(declare-fun m!1177513 () Bool)

(assert (=> b!1282798 m!1177513))

(declare-fun m!1177515 () Bool)

(assert (=> b!1282794 m!1177515))

(assert (=> b!1282794 m!1177515))

(declare-fun m!1177517 () Bool)

(assert (=> b!1282794 m!1177517))

(declare-fun m!1177519 () Bool)

(assert (=> b!1282794 m!1177519))

(declare-fun m!1177521 () Bool)

(assert (=> b!1282801 m!1177521))

(declare-fun m!1177523 () Bool)

(assert (=> b!1282793 m!1177523))

(declare-fun m!1177525 () Bool)

(assert (=> b!1282793 m!1177525))

(declare-fun m!1177527 () Bool)

(assert (=> start!108782 m!1177527))

(declare-fun m!1177529 () Bool)

(assert (=> start!108782 m!1177529))

(declare-fun m!1177531 () Bool)

(assert (=> start!108782 m!1177531))

(declare-fun m!1177533 () Bool)

(assert (=> b!1282800 m!1177533))

(assert (=> b!1282800 m!1177533))

(declare-fun m!1177535 () Bool)

(assert (=> b!1282800 m!1177535))

(check-sat (not b!1282801) (not mapNonEmpty!52169) (not b!1282794) (not start!108782) b_and!46167 (not b_next!28105) tp_is_empty!33745 (not b!1282793) (not b!1282798) (not b!1282800))
(check-sat b_and!46167 (not b_next!28105))
