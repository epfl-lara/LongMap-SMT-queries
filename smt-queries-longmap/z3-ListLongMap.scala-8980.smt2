; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108864 () Bool)

(assert start!108864)

(declare-fun b_free!28153 () Bool)

(declare-fun b_next!28153 () Bool)

(assert (=> start!108864 (= b_free!28153 (not b_next!28153))))

(declare-fun tp!99575 () Bool)

(declare-fun b_and!46221 () Bool)

(assert (=> start!108864 (= tp!99575 b_and!46221)))

(declare-fun mapIsEmpty!52247 () Bool)

(declare-fun mapRes!52247 () Bool)

(assert (=> mapIsEmpty!52247 mapRes!52247))

(declare-fun b!1283678 () Bool)

(declare-fun e!733554 () Bool)

(declare-fun tp_is_empty!33793 () Bool)

(assert (=> b!1283678 (= e!733554 tp_is_empty!33793)))

(declare-fun b!1283679 () Bool)

(declare-fun res!852313 () Bool)

(declare-fun e!733555 () Bool)

(assert (=> b!1283679 (=> (not res!852313) (not e!733555))))

(declare-datatypes ((array!84687 0))(
  ( (array!84688 (arr!40841 (Array (_ BitVec 32) (_ BitVec 64))) (size!41392 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84687)

(declare-datatypes ((List!28961 0))(
  ( (Nil!28958) (Cons!28957 (h!30175 (_ BitVec 64)) (t!42497 List!28961)) )
))
(declare-fun arrayNoDuplicates!0 (array!84687 (_ BitVec 32) List!28961) Bool)

(assert (=> b!1283679 (= res!852313 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28958))))

(declare-fun res!852315 () Bool)

(assert (=> start!108864 (=> (not res!852315) (not e!733555))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108864 (= res!852315 (validMask!0 mask!2175))))

(assert (=> start!108864 e!733555))

(assert (=> start!108864 tp_is_empty!33793))

(assert (=> start!108864 true))

(declare-datatypes ((V!50161 0))(
  ( (V!50162 (val!16971 Int)) )
))
(declare-datatypes ((ValueCell!15998 0))(
  ( (ValueCellFull!15998 (v!19568 V!50161)) (EmptyCell!15998) )
))
(declare-datatypes ((array!84689 0))(
  ( (array!84690 (arr!40842 (Array (_ BitVec 32) ValueCell!15998)) (size!41393 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84689)

(declare-fun e!733556 () Bool)

(declare-fun array_inv!31195 (array!84689) Bool)

(assert (=> start!108864 (and (array_inv!31195 _values!1445) e!733556)))

(declare-fun array_inv!31196 (array!84687) Bool)

(assert (=> start!108864 (array_inv!31196 _keys!1741)))

(assert (=> start!108864 tp!99575))

(declare-fun b!1283680 () Bool)

(declare-fun e!733557 () Bool)

(assert (=> b!1283680 (= e!733556 (and e!733557 mapRes!52247))))

(declare-fun condMapEmpty!52247 () Bool)

(declare-fun mapDefault!52247 () ValueCell!15998)

(assert (=> b!1283680 (= condMapEmpty!52247 (= (arr!40842 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15998)) mapDefault!52247)))))

(declare-fun b!1283681 () Bool)

(assert (=> b!1283681 (= e!733555 false)))

(declare-fun minValue!1387 () V!50161)

(declare-fun zeroValue!1387 () V!50161)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577010 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21746 0))(
  ( (tuple2!21747 (_1!10884 (_ BitVec 64)) (_2!10884 V!50161)) )
))
(declare-datatypes ((List!28962 0))(
  ( (Nil!28959) (Cons!28958 (h!30176 tuple2!21746) (t!42498 List!28962)) )
))
(declare-datatypes ((ListLongMap!19411 0))(
  ( (ListLongMap!19412 (toList!9721 List!28962)) )
))
(declare-fun contains!7852 (ListLongMap!19411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4790 (array!84687 array!84689 (_ BitVec 32) (_ BitVec 32) V!50161 V!50161 (_ BitVec 32) Int) ListLongMap!19411)

(assert (=> b!1283681 (= lt!577010 (contains!7852 (getCurrentListMap!4790 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283682 () Bool)

(declare-fun res!852314 () Bool)

(assert (=> b!1283682 (=> (not res!852314) (not e!733555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84687 (_ BitVec 32)) Bool)

(assert (=> b!1283682 (= res!852314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283683 () Bool)

(declare-fun res!852312 () Bool)

(assert (=> b!1283683 (=> (not res!852312) (not e!733555))))

(assert (=> b!1283683 (= res!852312 (and (= (size!41393 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41392 _keys!1741) (size!41393 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283684 () Bool)

(declare-fun res!852316 () Bool)

(assert (=> b!1283684 (=> (not res!852316) (not e!733555))))

(assert (=> b!1283684 (= res!852316 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41392 _keys!1741))))))

(declare-fun mapNonEmpty!52247 () Bool)

(declare-fun tp!99574 () Bool)

(assert (=> mapNonEmpty!52247 (= mapRes!52247 (and tp!99574 e!733554))))

(declare-fun mapRest!52247 () (Array (_ BitVec 32) ValueCell!15998))

(declare-fun mapValue!52247 () ValueCell!15998)

(declare-fun mapKey!52247 () (_ BitVec 32))

(assert (=> mapNonEmpty!52247 (= (arr!40842 _values!1445) (store mapRest!52247 mapKey!52247 mapValue!52247))))

(declare-fun b!1283685 () Bool)

(assert (=> b!1283685 (= e!733557 tp_is_empty!33793)))

(assert (= (and start!108864 res!852315) b!1283683))

(assert (= (and b!1283683 res!852312) b!1283682))

(assert (= (and b!1283682 res!852314) b!1283679))

(assert (= (and b!1283679 res!852313) b!1283684))

(assert (= (and b!1283684 res!852316) b!1283681))

(assert (= (and b!1283680 condMapEmpty!52247) mapIsEmpty!52247))

(assert (= (and b!1283680 (not condMapEmpty!52247)) mapNonEmpty!52247))

(get-info :version)

(assert (= (and mapNonEmpty!52247 ((_ is ValueCellFull!15998) mapValue!52247)) b!1283678))

(assert (= (and b!1283680 ((_ is ValueCellFull!15998) mapDefault!52247)) b!1283685))

(assert (= start!108864 b!1283680))

(declare-fun m!1178209 () Bool)

(assert (=> mapNonEmpty!52247 m!1178209))

(declare-fun m!1178211 () Bool)

(assert (=> b!1283682 m!1178211))

(declare-fun m!1178213 () Bool)

(assert (=> start!108864 m!1178213))

(declare-fun m!1178215 () Bool)

(assert (=> start!108864 m!1178215))

(declare-fun m!1178217 () Bool)

(assert (=> start!108864 m!1178217))

(declare-fun m!1178219 () Bool)

(assert (=> b!1283679 m!1178219))

(declare-fun m!1178221 () Bool)

(assert (=> b!1283681 m!1178221))

(assert (=> b!1283681 m!1178221))

(declare-fun m!1178223 () Bool)

(assert (=> b!1283681 m!1178223))

(check-sat (not b_next!28153) (not b!1283679) b_and!46221 (not start!108864) (not b!1283682) tp_is_empty!33793 (not b!1283681) (not mapNonEmpty!52247))
(check-sat b_and!46221 (not b_next!28153))
