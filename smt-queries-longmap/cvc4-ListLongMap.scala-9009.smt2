; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108818 () Bool)

(assert start!108818)

(declare-fun b_free!28331 () Bool)

(declare-fun b_next!28331 () Bool)

(assert (=> start!108818 (= b_free!28331 (not b_next!28331))))

(declare-fun tp!100109 () Bool)

(declare-fun b_and!46397 () Bool)

(assert (=> start!108818 (= tp!100109 b_and!46397)))

(declare-fun b!1285099 () Bool)

(declare-fun res!853721 () Bool)

(declare-fun e!734043 () Bool)

(assert (=> b!1285099 (=> (not res!853721) (not e!734043))))

(declare-datatypes ((array!85000 0))(
  ( (array!85001 (arr!41002 (Array (_ BitVec 32) (_ BitVec 64))) (size!41552 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85000)

(declare-datatypes ((List!29055 0))(
  ( (Nil!29052) (Cons!29051 (h!30260 (_ BitVec 64)) (t!42599 List!29055)) )
))
(declare-fun arrayNoDuplicates!0 (array!85000 (_ BitVec 32) List!29055) Bool)

(assert (=> b!1285099 (= res!853721 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29052))))

(declare-fun b!1285100 () Bool)

(declare-fun e!734041 () Bool)

(declare-fun tp_is_empty!33971 () Bool)

(assert (=> b!1285100 (= e!734041 tp_is_empty!33971)))

(declare-fun b!1285101 () Bool)

(declare-fun res!853725 () Bool)

(assert (=> b!1285101 (=> (not res!853725) (not e!734043))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285101 (= res!853725 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!52514 () Bool)

(declare-fun mapRes!52514 () Bool)

(declare-fun tp!100108 () Bool)

(assert (=> mapNonEmpty!52514 (= mapRes!52514 (and tp!100108 e!734041))))

(declare-datatypes ((V!50397 0))(
  ( (V!50398 (val!17060 Int)) )
))
(declare-datatypes ((ValueCell!16087 0))(
  ( (ValueCellFull!16087 (v!19662 V!50397)) (EmptyCell!16087) )
))
(declare-fun mapValue!52514 () ValueCell!16087)

(declare-datatypes ((array!85002 0))(
  ( (array!85003 (arr!41003 (Array (_ BitVec 32) ValueCell!16087)) (size!41553 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85002)

(declare-fun mapKey!52514 () (_ BitVec 32))

(declare-fun mapRest!52514 () (Array (_ BitVec 32) ValueCell!16087))

(assert (=> mapNonEmpty!52514 (= (arr!41003 _values!1445) (store mapRest!52514 mapKey!52514 mapValue!52514))))

(declare-fun b!1285103 () Bool)

(declare-fun res!853724 () Bool)

(assert (=> b!1285103 (=> (not res!853724) (not e!734043))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85000 (_ BitVec 32)) Bool)

(assert (=> b!1285103 (= res!853724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285104 () Bool)

(declare-fun res!853717 () Bool)

(assert (=> b!1285104 (=> (not res!853717) (not e!734043))))

(declare-fun minValue!1387 () V!50397)

(declare-fun zeroValue!1387 () V!50397)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21862 0))(
  ( (tuple2!21863 (_1!10942 (_ BitVec 64)) (_2!10942 V!50397)) )
))
(declare-datatypes ((List!29056 0))(
  ( (Nil!29053) (Cons!29052 (h!30261 tuple2!21862) (t!42600 List!29056)) )
))
(declare-datatypes ((ListLongMap!19519 0))(
  ( (ListLongMap!19520 (toList!9775 List!29056)) )
))
(declare-fun contains!7892 (ListLongMap!19519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4853 (array!85000 array!85002 (_ BitVec 32) (_ BitVec 32) V!50397 V!50397 (_ BitVec 32) Int) ListLongMap!19519)

(assert (=> b!1285104 (= res!853717 (contains!7892 (getCurrentListMap!4853 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52514 () Bool)

(assert (=> mapIsEmpty!52514 mapRes!52514))

(declare-fun b!1285105 () Bool)

(declare-fun res!853720 () Bool)

(assert (=> b!1285105 (=> (not res!853720) (not e!734043))))

(assert (=> b!1285105 (= res!853720 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41552 _keys!1741))))))

(declare-fun b!1285106 () Bool)

(declare-fun res!853719 () Bool)

(assert (=> b!1285106 (=> (not res!853719) (not e!734043))))

(assert (=> b!1285106 (= res!853719 (and (= (size!41553 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41552 _keys!1741) (size!41553 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285107 () Bool)

(declare-fun e!734042 () Bool)

(assert (=> b!1285107 (= e!734042 tp_is_empty!33971)))

(declare-fun b!1285108 () Bool)

(assert (=> b!1285108 (= e!734043 false)))

(declare-fun lt!576874 () Bool)

(declare-fun +!4306 (ListLongMap!19519 tuple2!21862) ListLongMap!19519)

(declare-fun getCurrentListMapNoExtraKeys!5936 (array!85000 array!85002 (_ BitVec 32) (_ BitVec 32) V!50397 V!50397 (_ BitVec 32) Int) ListLongMap!19519)

(assert (=> b!1285108 (= lt!576874 (contains!7892 (+!4306 (getCurrentListMapNoExtraKeys!5936 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun res!853718 () Bool)

(assert (=> start!108818 (=> (not res!853718) (not e!734043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108818 (= res!853718 (validMask!0 mask!2175))))

(assert (=> start!108818 e!734043))

(assert (=> start!108818 tp_is_empty!33971))

(assert (=> start!108818 true))

(declare-fun e!734045 () Bool)

(declare-fun array_inv!31097 (array!85002) Bool)

(assert (=> start!108818 (and (array_inv!31097 _values!1445) e!734045)))

(declare-fun array_inv!31098 (array!85000) Bool)

(assert (=> start!108818 (array_inv!31098 _keys!1741)))

(assert (=> start!108818 tp!100109))

(declare-fun b!1285102 () Bool)

(declare-fun res!853722 () Bool)

(assert (=> b!1285102 (=> (not res!853722) (not e!734043))))

(assert (=> b!1285102 (= res!853722 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41552 _keys!1741))))))

(declare-fun b!1285109 () Bool)

(assert (=> b!1285109 (= e!734045 (and e!734042 mapRes!52514))))

(declare-fun condMapEmpty!52514 () Bool)

(declare-fun mapDefault!52514 () ValueCell!16087)

