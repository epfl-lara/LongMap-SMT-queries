; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109032 () Bool)

(assert start!109032)

(declare-fun b_free!28321 () Bool)

(declare-fun b_next!28321 () Bool)

(assert (=> start!109032 (= b_free!28321 (not b_next!28321))))

(declare-fun tp!100079 () Bool)

(declare-fun b_and!46389 () Bool)

(assert (=> start!109032 (= tp!100079 b_and!46389)))

(declare-fun b!1286224 () Bool)

(declare-fun e!734813 () Bool)

(declare-fun e!734817 () Bool)

(declare-fun mapRes!52499 () Bool)

(assert (=> b!1286224 (= e!734813 (and e!734817 mapRes!52499))))

(declare-fun condMapEmpty!52499 () Bool)

(declare-datatypes ((V!50385 0))(
  ( (V!50386 (val!17055 Int)) )
))
(declare-datatypes ((ValueCell!16082 0))(
  ( (ValueCellFull!16082 (v!19652 V!50385)) (EmptyCell!16082) )
))
(declare-datatypes ((array!85009 0))(
  ( (array!85010 (arr!41002 (Array (_ BitVec 32) ValueCell!16082)) (size!41553 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85009)

(declare-fun mapDefault!52499 () ValueCell!16082)

(assert (=> b!1286224 (= condMapEmpty!52499 (= (arr!41002 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16082)) mapDefault!52499)))))

(declare-fun b!1286225 () Bool)

(declare-fun e!734815 () Bool)

(assert (=> b!1286225 (= e!734815 false)))

(declare-fun minValue!1387 () V!50385)

(declare-fun zeroValue!1387 () V!50385)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85011 0))(
  ( (array!85012 (arr!41003 (Array (_ BitVec 32) (_ BitVec 64))) (size!41554 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85011)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!577343 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21880 0))(
  ( (tuple2!21881 (_1!10951 (_ BitVec 64)) (_2!10951 V!50385)) )
))
(declare-datatypes ((List!29080 0))(
  ( (Nil!29077) (Cons!29076 (h!30294 tuple2!21880) (t!42616 List!29080)) )
))
(declare-datatypes ((ListLongMap!19545 0))(
  ( (ListLongMap!19546 (toList!9788 List!29080)) )
))
(declare-fun contains!7919 (ListLongMap!19545 (_ BitVec 64)) Bool)

(declare-fun +!4349 (ListLongMap!19545 tuple2!21880) ListLongMap!19545)

(declare-fun getCurrentListMapNoExtraKeys!5981 (array!85011 array!85009 (_ BitVec 32) (_ BitVec 32) V!50385 V!50385 (_ BitVec 32) Int) ListLongMap!19545)

(assert (=> b!1286225 (= lt!577343 (contains!7919 (+!4349 (getCurrentListMapNoExtraKeys!5981 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun mapIsEmpty!52499 () Bool)

(assert (=> mapIsEmpty!52499 mapRes!52499))

(declare-fun b!1286227 () Bool)

(declare-fun res!854103 () Bool)

(assert (=> b!1286227 (=> (not res!854103) (not e!734815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286227 (= res!854103 (validKeyInArray!0 (select (arr!41003 _keys!1741) from!2144)))))

(declare-fun b!1286228 () Bool)

(declare-fun res!854106 () Bool)

(assert (=> b!1286228 (=> (not res!854106) (not e!734815))))

(assert (=> b!1286228 (= res!854106 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41554 _keys!1741))))))

(declare-fun mapNonEmpty!52499 () Bool)

(declare-fun tp!100078 () Bool)

(declare-fun e!734816 () Bool)

(assert (=> mapNonEmpty!52499 (= mapRes!52499 (and tp!100078 e!734816))))

(declare-fun mapKey!52499 () (_ BitVec 32))

(declare-fun mapValue!52499 () ValueCell!16082)

(declare-fun mapRest!52499 () (Array (_ BitVec 32) ValueCell!16082))

(assert (=> mapNonEmpty!52499 (= (arr!41002 _values!1445) (store mapRest!52499 mapKey!52499 mapValue!52499))))

(declare-fun b!1286229 () Bool)

(declare-fun res!854105 () Bool)

(assert (=> b!1286229 (=> (not res!854105) (not e!734815))))

(assert (=> b!1286229 (= res!854105 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41554 _keys!1741))))))

(declare-fun b!1286230 () Bool)

(declare-fun res!854108 () Bool)

(assert (=> b!1286230 (=> (not res!854108) (not e!734815))))

(declare-datatypes ((List!29081 0))(
  ( (Nil!29078) (Cons!29077 (h!30295 (_ BitVec 64)) (t!42617 List!29081)) )
))
(declare-fun arrayNoDuplicates!0 (array!85011 (_ BitVec 32) List!29081) Bool)

(assert (=> b!1286230 (= res!854108 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29078))))

(declare-fun b!1286231 () Bool)

(declare-fun res!854107 () Bool)

(assert (=> b!1286231 (=> (not res!854107) (not e!734815))))

(assert (=> b!1286231 (= res!854107 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1286232 () Bool)

(declare-fun res!854104 () Bool)

(assert (=> b!1286232 (=> (not res!854104) (not e!734815))))

(declare-fun getCurrentListMap!4852 (array!85011 array!85009 (_ BitVec 32) (_ BitVec 32) V!50385 V!50385 (_ BitVec 32) Int) ListLongMap!19545)

(assert (=> b!1286232 (= res!854104 (contains!7919 (getCurrentListMap!4852 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286233 () Bool)

(declare-fun res!854102 () Bool)

(assert (=> b!1286233 (=> (not res!854102) (not e!734815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85011 (_ BitVec 32)) Bool)

(assert (=> b!1286233 (= res!854102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286226 () Bool)

(declare-fun tp_is_empty!33961 () Bool)

(assert (=> b!1286226 (= e!734816 tp_is_empty!33961)))

(declare-fun res!854109 () Bool)

(assert (=> start!109032 (=> (not res!854109) (not e!734815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109032 (= res!854109 (validMask!0 mask!2175))))

(assert (=> start!109032 e!734815))

(assert (=> start!109032 tp_is_empty!33961))

(assert (=> start!109032 true))

(declare-fun array_inv!31313 (array!85009) Bool)

(assert (=> start!109032 (and (array_inv!31313 _values!1445) e!734813)))

(declare-fun array_inv!31314 (array!85011) Bool)

(assert (=> start!109032 (array_inv!31314 _keys!1741)))

(assert (=> start!109032 tp!100079))

(declare-fun b!1286234 () Bool)

(declare-fun res!854110 () Bool)

(assert (=> b!1286234 (=> (not res!854110) (not e!734815))))

(assert (=> b!1286234 (= res!854110 (and (= (size!41553 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41554 _keys!1741) (size!41553 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286235 () Bool)

(assert (=> b!1286235 (= e!734817 tp_is_empty!33961)))

(assert (= (and start!109032 res!854109) b!1286234))

(assert (= (and b!1286234 res!854110) b!1286233))

(assert (= (and b!1286233 res!854102) b!1286230))

(assert (= (and b!1286230 res!854108) b!1286228))

(assert (= (and b!1286228 res!854106) b!1286232))

(assert (= (and b!1286232 res!854104) b!1286229))

(assert (= (and b!1286229 res!854105) b!1286227))

(assert (= (and b!1286227 res!854103) b!1286231))

(assert (= (and b!1286231 res!854107) b!1286225))

(assert (= (and b!1286224 condMapEmpty!52499) mapIsEmpty!52499))

(assert (= (and b!1286224 (not condMapEmpty!52499)) mapNonEmpty!52499))

(get-info :version)

(assert (= (and mapNonEmpty!52499 ((_ is ValueCellFull!16082) mapValue!52499)) b!1286226))

(assert (= (and b!1286224 ((_ is ValueCellFull!16082) mapDefault!52499)) b!1286235))

(assert (= start!109032 b!1286224))

(declare-fun m!1180045 () Bool)

(assert (=> b!1286232 m!1180045))

(assert (=> b!1286232 m!1180045))

(declare-fun m!1180047 () Bool)

(assert (=> b!1286232 m!1180047))

(declare-fun m!1180049 () Bool)

(assert (=> b!1286233 m!1180049))

(declare-fun m!1180051 () Bool)

(assert (=> b!1286230 m!1180051))

(declare-fun m!1180053 () Bool)

(assert (=> b!1286225 m!1180053))

(assert (=> b!1286225 m!1180053))

(declare-fun m!1180055 () Bool)

(assert (=> b!1286225 m!1180055))

(assert (=> b!1286225 m!1180055))

(declare-fun m!1180057 () Bool)

(assert (=> b!1286225 m!1180057))

(declare-fun m!1180059 () Bool)

(assert (=> start!109032 m!1180059))

(declare-fun m!1180061 () Bool)

(assert (=> start!109032 m!1180061))

(declare-fun m!1180063 () Bool)

(assert (=> start!109032 m!1180063))

(declare-fun m!1180065 () Bool)

(assert (=> b!1286227 m!1180065))

(assert (=> b!1286227 m!1180065))

(declare-fun m!1180067 () Bool)

(assert (=> b!1286227 m!1180067))

(declare-fun m!1180069 () Bool)

(assert (=> mapNonEmpty!52499 m!1180069))

(check-sat (not mapNonEmpty!52499) (not b_next!28321) (not b!1286227) (not b!1286225) b_and!46389 (not b!1286233) tp_is_empty!33961 (not b!1286232) (not start!109032) (not b!1286230))
(check-sat b_and!46389 (not b_next!28321))
