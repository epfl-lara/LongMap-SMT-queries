; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108826 () Bool)

(assert start!108826)

(declare-fun b_free!28339 () Bool)

(declare-fun b_next!28339 () Bool)

(assert (=> start!108826 (= b_free!28339 (not b_next!28339))))

(declare-fun tp!100134 () Bool)

(declare-fun b_and!46387 () Bool)

(assert (=> start!108826 (= tp!100134 b_and!46387)))

(declare-fun mapIsEmpty!52526 () Bool)

(declare-fun mapRes!52526 () Bool)

(assert (=> mapIsEmpty!52526 mapRes!52526))

(declare-fun b!1285135 () Bool)

(declare-fun res!853758 () Bool)

(declare-fun e!734075 () Bool)

(assert (=> b!1285135 (=> (not res!853758) (not e!734075))))

(declare-datatypes ((array!84905 0))(
  ( (array!84906 (arr!40955 (Array (_ BitVec 32) (_ BitVec 64))) (size!41507 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84905)

(declare-datatypes ((List!29115 0))(
  ( (Nil!29112) (Cons!29111 (h!30320 (_ BitVec 64)) (t!42651 List!29115)) )
))
(declare-fun arrayNoDuplicates!0 (array!84905 (_ BitVec 32) List!29115) Bool)

(assert (=> b!1285135 (= res!853758 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29112))))

(declare-fun b!1285136 () Bool)

(assert (=> b!1285136 (= e!734075 false)))

(declare-datatypes ((V!50409 0))(
  ( (V!50410 (val!17064 Int)) )
))
(declare-fun minValue!1387 () V!50409)

(declare-fun zeroValue!1387 () V!50409)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576708 () Bool)

(declare-datatypes ((ValueCell!16091 0))(
  ( (ValueCellFull!16091 (v!19665 V!50409)) (EmptyCell!16091) )
))
(declare-datatypes ((array!84907 0))(
  ( (array!84908 (arr!40956 (Array (_ BitVec 32) ValueCell!16091)) (size!41508 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84907)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21936 0))(
  ( (tuple2!21937 (_1!10979 (_ BitVec 64)) (_2!10979 V!50409)) )
))
(declare-datatypes ((List!29116 0))(
  ( (Nil!29113) (Cons!29112 (h!30321 tuple2!21936) (t!42652 List!29116)) )
))
(declare-datatypes ((ListLongMap!19593 0))(
  ( (ListLongMap!19594 (toList!9812 List!29116)) )
))
(declare-fun contains!7859 (ListLongMap!19593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4782 (array!84905 array!84907 (_ BitVec 32) (_ BitVec 32) V!50409 V!50409 (_ BitVec 32) Int) ListLongMap!19593)

(assert (=> b!1285136 (= lt!576708 (contains!7859 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285137 () Bool)

(declare-fun res!853755 () Bool)

(assert (=> b!1285137 (=> (not res!853755) (not e!734075))))

(assert (=> b!1285137 (= res!853755 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41507 _keys!1741))))))

(declare-fun res!853757 () Bool)

(assert (=> start!108826 (=> (not res!853757) (not e!734075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108826 (= res!853757 (validMask!0 mask!2175))))

(assert (=> start!108826 e!734075))

(declare-fun tp_is_empty!33979 () Bool)

(assert (=> start!108826 tp_is_empty!33979))

(assert (=> start!108826 true))

(declare-fun e!734074 () Bool)

(declare-fun array_inv!31223 (array!84907) Bool)

(assert (=> start!108826 (and (array_inv!31223 _values!1445) e!734074)))

(declare-fun array_inv!31224 (array!84905) Bool)

(assert (=> start!108826 (array_inv!31224 _keys!1741)))

(assert (=> start!108826 tp!100134))

(declare-fun b!1285138 () Bool)

(declare-fun e!734072 () Bool)

(assert (=> b!1285138 (= e!734072 tp_is_empty!33979)))

(declare-fun b!1285139 () Bool)

(declare-fun e!734076 () Bool)

(assert (=> b!1285139 (= e!734076 tp_is_empty!33979)))

(declare-fun mapNonEmpty!52526 () Bool)

(declare-fun tp!100133 () Bool)

(assert (=> mapNonEmpty!52526 (= mapRes!52526 (and tp!100133 e!734076))))

(declare-fun mapRest!52526 () (Array (_ BitVec 32) ValueCell!16091))

(declare-fun mapKey!52526 () (_ BitVec 32))

(declare-fun mapValue!52526 () ValueCell!16091)

(assert (=> mapNonEmpty!52526 (= (arr!40956 _values!1445) (store mapRest!52526 mapKey!52526 mapValue!52526))))

(declare-fun b!1285140 () Bool)

(assert (=> b!1285140 (= e!734074 (and e!734072 mapRes!52526))))

(declare-fun condMapEmpty!52526 () Bool)

(declare-fun mapDefault!52526 () ValueCell!16091)

(assert (=> b!1285140 (= condMapEmpty!52526 (= (arr!40956 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16091)) mapDefault!52526)))))

(declare-fun b!1285141 () Bool)

(declare-fun res!853754 () Bool)

(assert (=> b!1285141 (=> (not res!853754) (not e!734075))))

(assert (=> b!1285141 (= res!853754 (and (= (size!41508 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41507 _keys!1741) (size!41508 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285142 () Bool)

(declare-fun res!853756 () Bool)

(assert (=> b!1285142 (=> (not res!853756) (not e!734075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84905 (_ BitVec 32)) Bool)

(assert (=> b!1285142 (= res!853756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108826 res!853757) b!1285141))

(assert (= (and b!1285141 res!853754) b!1285142))

(assert (= (and b!1285142 res!853756) b!1285135))

(assert (= (and b!1285135 res!853758) b!1285137))

(assert (= (and b!1285137 res!853755) b!1285136))

(assert (= (and b!1285140 condMapEmpty!52526) mapIsEmpty!52526))

(assert (= (and b!1285140 (not condMapEmpty!52526)) mapNonEmpty!52526))

(get-info :version)

(assert (= (and mapNonEmpty!52526 ((_ is ValueCellFull!16091) mapValue!52526)) b!1285139))

(assert (= (and b!1285140 ((_ is ValueCellFull!16091) mapDefault!52526)) b!1285138))

(assert (= start!108826 b!1285140))

(declare-fun m!1178137 () Bool)

(assert (=> mapNonEmpty!52526 m!1178137))

(declare-fun m!1178139 () Bool)

(assert (=> start!108826 m!1178139))

(declare-fun m!1178141 () Bool)

(assert (=> start!108826 m!1178141))

(declare-fun m!1178143 () Bool)

(assert (=> start!108826 m!1178143))

(declare-fun m!1178145 () Bool)

(assert (=> b!1285142 m!1178145))

(declare-fun m!1178147 () Bool)

(assert (=> b!1285135 m!1178147))

(declare-fun m!1178149 () Bool)

(assert (=> b!1285136 m!1178149))

(assert (=> b!1285136 m!1178149))

(declare-fun m!1178151 () Bool)

(assert (=> b!1285136 m!1178151))

(check-sat (not start!108826) b_and!46387 (not mapNonEmpty!52526) tp_is_empty!33979 (not b!1285142) (not b!1285135) (not b!1285136) (not b_next!28339))
(check-sat b_and!46387 (not b_next!28339))
