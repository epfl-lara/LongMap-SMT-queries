; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108792 () Bool)

(assert start!108792)

(declare-fun b_free!28305 () Bool)

(declare-fun b_next!28305 () Bool)

(assert (=> start!108792 (= b_free!28305 (not b_next!28305))))

(declare-fun tp!100031 () Bool)

(declare-fun b_and!46371 () Bool)

(assert (=> start!108792 (= tp!100031 b_and!46371)))

(declare-fun b!1284692 () Bool)

(declare-fun res!853428 () Bool)

(declare-fun e!733848 () Bool)

(assert (=> b!1284692 (=> (not res!853428) (not e!733848))))

(declare-datatypes ((array!84948 0))(
  ( (array!84949 (arr!40976 (Array (_ BitVec 32) (_ BitVec 64))) (size!41526 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84948)

(declare-datatypes ((List!29037 0))(
  ( (Nil!29034) (Cons!29033 (h!30242 (_ BitVec 64)) (t!42581 List!29037)) )
))
(declare-fun arrayNoDuplicates!0 (array!84948 (_ BitVec 32) List!29037) Bool)

(assert (=> b!1284692 (= res!853428 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29034))))

(declare-fun b!1284693 () Bool)

(assert (=> b!1284693 (= e!733848 false)))

(declare-datatypes ((V!50363 0))(
  ( (V!50364 (val!17047 Int)) )
))
(declare-fun minValue!1387 () V!50363)

(declare-fun zeroValue!1387 () V!50363)

(declare-datatypes ((ValueCell!16074 0))(
  ( (ValueCellFull!16074 (v!19649 V!50363)) (EmptyCell!16074) )
))
(declare-datatypes ((array!84950 0))(
  ( (array!84951 (arr!40977 (Array (_ BitVec 32) ValueCell!16074)) (size!41527 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84950)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576844 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21844 0))(
  ( (tuple2!21845 (_1!10933 (_ BitVec 64)) (_2!10933 V!50363)) )
))
(declare-datatypes ((List!29038 0))(
  ( (Nil!29035) (Cons!29034 (h!30243 tuple2!21844) (t!42582 List!29038)) )
))
(declare-datatypes ((ListLongMap!19501 0))(
  ( (ListLongMap!19502 (toList!9766 List!29038)) )
))
(declare-fun contains!7883 (ListLongMap!19501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4845 (array!84948 array!84950 (_ BitVec 32) (_ BitVec 32) V!50363 V!50363 (_ BitVec 32) Int) ListLongMap!19501)

(assert (=> b!1284693 (= lt!576844 (contains!7883 (getCurrentListMap!4845 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284694 () Bool)

(declare-fun e!733847 () Bool)

(declare-fun e!733849 () Bool)

(declare-fun mapRes!52475 () Bool)

(assert (=> b!1284694 (= e!733847 (and e!733849 mapRes!52475))))

(declare-fun condMapEmpty!52475 () Bool)

(declare-fun mapDefault!52475 () ValueCell!16074)

(assert (=> b!1284694 (= condMapEmpty!52475 (= (arr!40977 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16074)) mapDefault!52475)))))

(declare-fun b!1284695 () Bool)

(declare-fun e!733846 () Bool)

(declare-fun tp_is_empty!33945 () Bool)

(assert (=> b!1284695 (= e!733846 tp_is_empty!33945)))

(declare-fun b!1284696 () Bool)

(declare-fun res!853427 () Bool)

(assert (=> b!1284696 (=> (not res!853427) (not e!733848))))

(assert (=> b!1284696 (= res!853427 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41526 _keys!1741))))))

(declare-fun b!1284697 () Bool)

(declare-fun res!853429 () Bool)

(assert (=> b!1284697 (=> (not res!853429) (not e!733848))))

(assert (=> b!1284697 (= res!853429 (and (= (size!41527 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41526 _keys!1741) (size!41527 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!853431 () Bool)

(assert (=> start!108792 (=> (not res!853431) (not e!733848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108792 (= res!853431 (validMask!0 mask!2175))))

(assert (=> start!108792 e!733848))

(assert (=> start!108792 tp_is_empty!33945))

(assert (=> start!108792 true))

(declare-fun array_inv!31079 (array!84950) Bool)

(assert (=> start!108792 (and (array_inv!31079 _values!1445) e!733847)))

(declare-fun array_inv!31080 (array!84948) Bool)

(assert (=> start!108792 (array_inv!31080 _keys!1741)))

(assert (=> start!108792 tp!100031))

(declare-fun mapIsEmpty!52475 () Bool)

(assert (=> mapIsEmpty!52475 mapRes!52475))

(declare-fun b!1284698 () Bool)

(declare-fun res!853430 () Bool)

(assert (=> b!1284698 (=> (not res!853430) (not e!733848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84948 (_ BitVec 32)) Bool)

(assert (=> b!1284698 (= res!853430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52475 () Bool)

(declare-fun tp!100030 () Bool)

(assert (=> mapNonEmpty!52475 (= mapRes!52475 (and tp!100030 e!733846))))

(declare-fun mapRest!52475 () (Array (_ BitVec 32) ValueCell!16074))

(declare-fun mapValue!52475 () ValueCell!16074)

(declare-fun mapKey!52475 () (_ BitVec 32))

(assert (=> mapNonEmpty!52475 (= (arr!40977 _values!1445) (store mapRest!52475 mapKey!52475 mapValue!52475))))

(declare-fun b!1284699 () Bool)

(assert (=> b!1284699 (= e!733849 tp_is_empty!33945)))

(assert (= (and start!108792 res!853431) b!1284697))

(assert (= (and b!1284697 res!853429) b!1284698))

(assert (= (and b!1284698 res!853430) b!1284692))

(assert (= (and b!1284692 res!853428) b!1284696))

(assert (= (and b!1284696 res!853427) b!1284693))

(assert (= (and b!1284694 condMapEmpty!52475) mapIsEmpty!52475))

(assert (= (and b!1284694 (not condMapEmpty!52475)) mapNonEmpty!52475))

(get-info :version)

(assert (= (and mapNonEmpty!52475 ((_ is ValueCellFull!16074) mapValue!52475)) b!1284695))

(assert (= (and b!1284694 ((_ is ValueCellFull!16074) mapDefault!52475)) b!1284699))

(assert (= start!108792 b!1284694))

(declare-fun m!1178293 () Bool)

(assert (=> mapNonEmpty!52475 m!1178293))

(declare-fun m!1178295 () Bool)

(assert (=> b!1284692 m!1178295))

(declare-fun m!1178297 () Bool)

(assert (=> b!1284698 m!1178297))

(declare-fun m!1178299 () Bool)

(assert (=> b!1284693 m!1178299))

(assert (=> b!1284693 m!1178299))

(declare-fun m!1178301 () Bool)

(assert (=> b!1284693 m!1178301))

(declare-fun m!1178303 () Bool)

(assert (=> start!108792 m!1178303))

(declare-fun m!1178305 () Bool)

(assert (=> start!108792 m!1178305))

(declare-fun m!1178307 () Bool)

(assert (=> start!108792 m!1178307))

(check-sat b_and!46371 tp_is_empty!33945 (not mapNonEmpty!52475) (not b!1284692) (not b_next!28305) (not start!108792) (not b!1284698) (not b!1284693))
(check-sat b_and!46371 (not b_next!28305))
