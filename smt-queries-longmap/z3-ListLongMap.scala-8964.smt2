; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108734 () Bool)

(assert start!108734)

(declare-fun b_free!28057 () Bool)

(declare-fun b_next!28057 () Bool)

(assert (=> start!108734 (= b_free!28057 (not b_next!28057))))

(declare-fun tp!99280 () Bool)

(declare-fun b_and!46119 () Bool)

(assert (=> start!108734 (= tp!99280 b_and!46119)))

(declare-fun b!1282060 () Bool)

(declare-fun e!732642 () Bool)

(declare-fun tp_is_empty!33697 () Bool)

(assert (=> b!1282060 (= e!732642 tp_is_empty!33697)))

(declare-fun mapIsEmpty!52097 () Bool)

(declare-fun mapRes!52097 () Bool)

(assert (=> mapIsEmpty!52097 mapRes!52097))

(declare-fun b!1282061 () Bool)

(declare-fun res!851279 () Bool)

(declare-fun e!732639 () Bool)

(assert (=> b!1282061 (=> (not res!851279) (not e!732639))))

(declare-datatypes ((array!84497 0))(
  ( (array!84498 (arr!40748 (Array (_ BitVec 32) (_ BitVec 64))) (size!41299 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84497)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84497 (_ BitVec 32)) Bool)

(assert (=> b!1282061 (= res!851279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282062 () Bool)

(declare-fun res!851276 () Bool)

(assert (=> b!1282062 (=> (not res!851276) (not e!732639))))

(declare-datatypes ((List!28896 0))(
  ( (Nil!28893) (Cons!28892 (h!30110 (_ BitVec 64)) (t!42428 List!28896)) )
))
(declare-fun arrayNoDuplicates!0 (array!84497 (_ BitVec 32) List!28896) Bool)

(assert (=> b!1282062 (= res!851276 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28893))))

(declare-fun mapNonEmpty!52097 () Bool)

(declare-fun tp!99281 () Bool)

(declare-fun e!732640 () Bool)

(assert (=> mapNonEmpty!52097 (= mapRes!52097 (and tp!99281 e!732640))))

(declare-fun mapKey!52097 () (_ BitVec 32))

(declare-datatypes ((V!50033 0))(
  ( (V!50034 (val!16923 Int)) )
))
(declare-datatypes ((ValueCell!15950 0))(
  ( (ValueCellFull!15950 (v!19518 V!50033)) (EmptyCell!15950) )
))
(declare-datatypes ((array!84499 0))(
  ( (array!84500 (arr!40749 (Array (_ BitVec 32) ValueCell!15950)) (size!41300 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84499)

(declare-fun mapRest!52097 () (Array (_ BitVec 32) ValueCell!15950))

(declare-fun mapValue!52097 () ValueCell!15950)

(assert (=> mapNonEmpty!52097 (= (arr!40749 _values!1445) (store mapRest!52097 mapKey!52097 mapValue!52097))))

(declare-fun b!1282063 () Bool)

(declare-fun e!732638 () Bool)

(assert (=> b!1282063 (= e!732638 (and e!732642 mapRes!52097))))

(declare-fun condMapEmpty!52097 () Bool)

(declare-fun mapDefault!52097 () ValueCell!15950)

(assert (=> b!1282063 (= condMapEmpty!52097 (= (arr!40749 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15950)) mapDefault!52097)))))

(declare-fun b!1282064 () Bool)

(declare-fun res!851275 () Bool)

(assert (=> b!1282064 (=> (not res!851275) (not e!732639))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282064 (= res!851275 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41299 _keys!1741))))))

(declare-fun b!1282066 () Bool)

(declare-fun res!851278 () Bool)

(assert (=> b!1282066 (=> (not res!851278) (not e!732639))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1282066 (= res!851278 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41299 _keys!1741)) (not (= (select (arr!40748 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1282067 () Bool)

(declare-fun res!851280 () Bool)

(assert (=> b!1282067 (=> (not res!851280) (not e!732639))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282067 (= res!851280 (and (= (size!41300 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41299 _keys!1741) (size!41300 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282068 () Bool)

(assert (=> b!1282068 (= e!732639 (not true))))

(declare-fun minValue!1387 () V!50033)

(declare-fun zeroValue!1387 () V!50033)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21682 0))(
  ( (tuple2!21683 (_1!10852 (_ BitVec 64)) (_2!10852 V!50033)) )
))
(declare-datatypes ((List!28897 0))(
  ( (Nil!28894) (Cons!28893 (h!30111 tuple2!21682) (t!42429 List!28897)) )
))
(declare-datatypes ((ListLongMap!19347 0))(
  ( (ListLongMap!19348 (toList!9689 List!28897)) )
))
(declare-fun contains!7818 (ListLongMap!19347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4758 (array!84497 array!84499 (_ BitVec 32) (_ BitVec 32) V!50033 V!50033 (_ BitVec 32) Int) ListLongMap!19347)

(assert (=> b!1282068 (contains!7818 (getCurrentListMap!4758 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42368 0))(
  ( (Unit!42369) )
))
(declare-fun lt!576642 () Unit!42368)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!5 (array!84497 array!84499 (_ BitVec 32) (_ BitVec 32) V!50033 V!50033 (_ BitVec 64) (_ BitVec 32) Int) Unit!42368)

(assert (=> b!1282068 (= lt!576642 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!5 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1282069 () Bool)

(declare-fun res!851277 () Bool)

(assert (=> b!1282069 (=> (not res!851277) (not e!732639))))

(assert (=> b!1282069 (= res!851277 (contains!7818 (getCurrentListMap!4758 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282065 () Bool)

(assert (=> b!1282065 (= e!732640 tp_is_empty!33697)))

(declare-fun res!851274 () Bool)

(assert (=> start!108734 (=> (not res!851274) (not e!732639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108734 (= res!851274 (validMask!0 mask!2175))))

(assert (=> start!108734 e!732639))

(assert (=> start!108734 tp_is_empty!33697))

(assert (=> start!108734 true))

(declare-fun array_inv!31131 (array!84499) Bool)

(assert (=> start!108734 (and (array_inv!31131 _values!1445) e!732638)))

(declare-fun array_inv!31132 (array!84497) Bool)

(assert (=> start!108734 (array_inv!31132 _keys!1741)))

(assert (=> start!108734 tp!99280))

(assert (= (and start!108734 res!851274) b!1282067))

(assert (= (and b!1282067 res!851280) b!1282061))

(assert (= (and b!1282061 res!851279) b!1282062))

(assert (= (and b!1282062 res!851276) b!1282064))

(assert (= (and b!1282064 res!851275) b!1282069))

(assert (= (and b!1282069 res!851277) b!1282066))

(assert (= (and b!1282066 res!851278) b!1282068))

(assert (= (and b!1282063 condMapEmpty!52097) mapIsEmpty!52097))

(assert (= (and b!1282063 (not condMapEmpty!52097)) mapNonEmpty!52097))

(get-info :version)

(assert (= (and mapNonEmpty!52097 ((_ is ValueCellFull!15950) mapValue!52097)) b!1282065))

(assert (= (and b!1282063 ((_ is ValueCellFull!15950) mapDefault!52097)) b!1282060))

(assert (= start!108734 b!1282063))

(declare-fun m!1176921 () Bool)

(assert (=> b!1282069 m!1176921))

(assert (=> b!1282069 m!1176921))

(declare-fun m!1176923 () Bool)

(assert (=> b!1282069 m!1176923))

(declare-fun m!1176925 () Bool)

(assert (=> mapNonEmpty!52097 m!1176925))

(declare-fun m!1176927 () Bool)

(assert (=> start!108734 m!1176927))

(declare-fun m!1176929 () Bool)

(assert (=> start!108734 m!1176929))

(declare-fun m!1176931 () Bool)

(assert (=> start!108734 m!1176931))

(declare-fun m!1176933 () Bool)

(assert (=> b!1282061 m!1176933))

(declare-fun m!1176935 () Bool)

(assert (=> b!1282066 m!1176935))

(declare-fun m!1176937 () Bool)

(assert (=> b!1282062 m!1176937))

(declare-fun m!1176939 () Bool)

(assert (=> b!1282068 m!1176939))

(assert (=> b!1282068 m!1176939))

(declare-fun m!1176941 () Bool)

(assert (=> b!1282068 m!1176941))

(declare-fun m!1176943 () Bool)

(assert (=> b!1282068 m!1176943))

(check-sat (not b_next!28057) (not b!1282069) b_and!46119 (not start!108734) (not mapNonEmpty!52097) tp_is_empty!33697 (not b!1282061) (not b!1282068) (not b!1282062))
(check-sat b_and!46119 (not b_next!28057))
