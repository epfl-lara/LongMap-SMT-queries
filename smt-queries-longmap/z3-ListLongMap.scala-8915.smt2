; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108160 () Bool)

(assert start!108160)

(declare-fun b_free!27855 () Bool)

(declare-fun b_next!27855 () Bool)

(assert (=> start!108160 (= b_free!27855 (not b_next!27855))))

(declare-fun tp!98522 () Bool)

(declare-fun b_and!45913 () Bool)

(assert (=> start!108160 (= tp!98522 b_and!45913)))

(declare-fun b!1277277 () Bool)

(declare-fun e!729429 () Bool)

(declare-fun tp_is_empty!33405 () Bool)

(assert (=> b!1277277 (= e!729429 tp_is_empty!33405)))

(declare-fun b!1277278 () Bool)

(declare-fun res!848739 () Bool)

(declare-fun e!729426 () Bool)

(assert (=> b!1277278 (=> (not res!848739) (not e!729426))))

(declare-datatypes ((array!83904 0))(
  ( (array!83905 (arr!40462 (Array (_ BitVec 32) (_ BitVec 64))) (size!41012 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83904)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83904 (_ BitVec 32)) Bool)

(assert (=> b!1277278 (= res!848739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!848737 () Bool)

(assert (=> start!108160 (=> (not res!848737) (not e!729426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108160 (= res!848737 (validMask!0 mask!1805))))

(assert (=> start!108160 e!729426))

(assert (=> start!108160 true))

(assert (=> start!108160 tp!98522))

(assert (=> start!108160 tp_is_empty!33405))

(declare-datatypes ((V!49643 0))(
  ( (V!49644 (val!16777 Int)) )
))
(declare-datatypes ((ValueCell!15804 0))(
  ( (ValueCellFull!15804 (v!19375 V!49643)) (EmptyCell!15804) )
))
(declare-datatypes ((array!83906 0))(
  ( (array!83907 (arr!40463 (Array (_ BitVec 32) ValueCell!15804)) (size!41013 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83906)

(declare-fun e!729427 () Bool)

(declare-fun array_inv!30743 (array!83906) Bool)

(assert (=> start!108160 (and (array_inv!30743 _values!1187) e!729427)))

(declare-fun array_inv!30744 (array!83904) Bool)

(assert (=> start!108160 (array_inv!30744 _keys!1427)))

(declare-fun b!1277279 () Bool)

(assert (=> b!1277279 (= e!729426 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49643)

(declare-fun minValue!1129 () V!49643)

(declare-fun lt!575674 () Bool)

(declare-datatypes ((tuple2!21520 0))(
  ( (tuple2!21521 (_1!10771 (_ BitVec 64)) (_2!10771 V!49643)) )
))
(declare-datatypes ((List!28696 0))(
  ( (Nil!28693) (Cons!28692 (h!29901 tuple2!21520) (t!42234 List!28696)) )
))
(declare-datatypes ((ListLongMap!19177 0))(
  ( (ListLongMap!19178 (toList!9604 List!28696)) )
))
(declare-fun contains!7714 (ListLongMap!19177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4688 (array!83904 array!83906 (_ BitVec 32) (_ BitVec 32) V!49643 V!49643 (_ BitVec 32) Int) ListLongMap!19177)

(assert (=> b!1277279 (= lt!575674 (contains!7714 (getCurrentListMap!4688 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapNonEmpty!51641 () Bool)

(declare-fun mapRes!51641 () Bool)

(declare-fun tp!98521 () Bool)

(assert (=> mapNonEmpty!51641 (= mapRes!51641 (and tp!98521 e!729429))))

(declare-fun mapRest!51641 () (Array (_ BitVec 32) ValueCell!15804))

(declare-fun mapKey!51641 () (_ BitVec 32))

(declare-fun mapValue!51641 () ValueCell!15804)

(assert (=> mapNonEmpty!51641 (= (arr!40463 _values!1187) (store mapRest!51641 mapKey!51641 mapValue!51641))))

(declare-fun b!1277280 () Bool)

(declare-fun res!848738 () Bool)

(assert (=> b!1277280 (=> (not res!848738) (not e!729426))))

(assert (=> b!1277280 (= res!848738 (and (= (size!41013 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41012 _keys!1427) (size!41013 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51641 () Bool)

(assert (=> mapIsEmpty!51641 mapRes!51641))

(declare-fun b!1277281 () Bool)

(declare-fun e!729428 () Bool)

(assert (=> b!1277281 (= e!729427 (and e!729428 mapRes!51641))))

(declare-fun condMapEmpty!51641 () Bool)

(declare-fun mapDefault!51641 () ValueCell!15804)

(assert (=> b!1277281 (= condMapEmpty!51641 (= (arr!40463 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15804)) mapDefault!51641)))))

(declare-fun b!1277282 () Bool)

(declare-fun res!848736 () Bool)

(assert (=> b!1277282 (=> (not res!848736) (not e!729426))))

(declare-datatypes ((List!28697 0))(
  ( (Nil!28694) (Cons!28693 (h!29902 (_ BitVec 64)) (t!42235 List!28697)) )
))
(declare-fun arrayNoDuplicates!0 (array!83904 (_ BitVec 32) List!28697) Bool)

(assert (=> b!1277282 (= res!848736 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28694))))

(declare-fun b!1277283 () Bool)

(assert (=> b!1277283 (= e!729428 tp_is_empty!33405)))

(assert (= (and start!108160 res!848737) b!1277280))

(assert (= (and b!1277280 res!848738) b!1277278))

(assert (= (and b!1277278 res!848739) b!1277282))

(assert (= (and b!1277282 res!848736) b!1277279))

(assert (= (and b!1277281 condMapEmpty!51641) mapIsEmpty!51641))

(assert (= (and b!1277281 (not condMapEmpty!51641)) mapNonEmpty!51641))

(get-info :version)

(assert (= (and mapNonEmpty!51641 ((_ is ValueCellFull!15804) mapValue!51641)) b!1277277))

(assert (= (and b!1277281 ((_ is ValueCellFull!15804) mapDefault!51641)) b!1277283))

(assert (= start!108160 b!1277281))

(declare-fun m!1172937 () Bool)

(assert (=> b!1277278 m!1172937))

(declare-fun m!1172939 () Bool)

(assert (=> b!1277279 m!1172939))

(assert (=> b!1277279 m!1172939))

(declare-fun m!1172941 () Bool)

(assert (=> b!1277279 m!1172941))

(declare-fun m!1172943 () Bool)

(assert (=> mapNonEmpty!51641 m!1172943))

(declare-fun m!1172945 () Bool)

(assert (=> start!108160 m!1172945))

(declare-fun m!1172947 () Bool)

(assert (=> start!108160 m!1172947))

(declare-fun m!1172949 () Bool)

(assert (=> start!108160 m!1172949))

(declare-fun m!1172951 () Bool)

(assert (=> b!1277282 m!1172951))

(check-sat b_and!45913 (not b_next!27855) (not start!108160) (not b!1277282) (not b!1277279) tp_is_empty!33405 (not b!1277278) (not mapNonEmpty!51641))
(check-sat b_and!45913 (not b_next!27855))
