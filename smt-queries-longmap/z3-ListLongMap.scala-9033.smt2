; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109206 () Bool)

(assert start!109206)

(declare-fun b_free!28471 () Bool)

(declare-fun b_next!28471 () Bool)

(assert (=> start!109206 (= b_free!28471 (not b_next!28471))))

(declare-fun tp!100531 () Bool)

(declare-fun b_and!46563 () Bool)

(assert (=> start!109206 (= tp!100531 b_and!46563)))

(declare-fun b!1289100 () Bool)

(declare-fun e!736258 () Bool)

(declare-fun tp_is_empty!34111 () Bool)

(assert (=> b!1289100 (= e!736258 tp_is_empty!34111)))

(declare-fun b!1289101 () Bool)

(declare-fun e!736260 () Bool)

(assert (=> b!1289101 (= e!736260 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50585 0))(
  ( (V!50586 (val!17130 Int)) )
))
(declare-datatypes ((tuple2!22000 0))(
  ( (tuple2!22001 (_1!11011 (_ BitVec 64)) (_2!11011 V!50585)) )
))
(declare-datatypes ((List!29190 0))(
  ( (Nil!29187) (Cons!29186 (h!30404 tuple2!22000) (t!42746 List!29190)) )
))
(declare-datatypes ((ListLongMap!19665 0))(
  ( (ListLongMap!19666 (toList!9848 List!29190)) )
))
(declare-fun contains!7979 (ListLongMap!19665 (_ BitVec 64)) Bool)

(assert (=> b!1289101 (not (contains!7979 (ListLongMap!19666 Nil!29187) k0!1205))))

(declare-datatypes ((Unit!42551 0))(
  ( (Unit!42552) )
))
(declare-fun lt!578382 () Unit!42551)

(declare-fun emptyContainsNothing!29 ((_ BitVec 64)) Unit!42551)

(assert (=> b!1289101 (= lt!578382 (emptyContainsNothing!29 k0!1205))))

(declare-fun res!855818 () Bool)

(assert (=> start!109206 (=> (not res!855818) (not e!736260))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109206 (= res!855818 (validMask!0 mask!2175))))

(assert (=> start!109206 e!736260))

(assert (=> start!109206 tp_is_empty!34111))

(assert (=> start!109206 true))

(declare-datatypes ((ValueCell!16157 0))(
  ( (ValueCellFull!16157 (v!19728 V!50585)) (EmptyCell!16157) )
))
(declare-datatypes ((array!85305 0))(
  ( (array!85306 (arr!41149 (Array (_ BitVec 32) ValueCell!16157)) (size!41700 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85305)

(declare-fun e!736259 () Bool)

(declare-fun array_inv!31409 (array!85305) Bool)

(assert (=> start!109206 (and (array_inv!31409 _values!1445) e!736259)))

(declare-datatypes ((array!85307 0))(
  ( (array!85308 (arr!41150 (Array (_ BitVec 32) (_ BitVec 64))) (size!41701 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85307)

(declare-fun array_inv!31410 (array!85307) Bool)

(assert (=> start!109206 (array_inv!31410 _keys!1741)))

(assert (=> start!109206 tp!100531))

(declare-fun b!1289102 () Bool)

(declare-fun e!736256 () Bool)

(assert (=> b!1289102 (= e!736256 tp_is_empty!34111)))

(declare-fun b!1289103 () Bool)

(declare-fun res!855815 () Bool)

(assert (=> b!1289103 (=> (not res!855815) (not e!736260))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289103 (= res!855815 (not (validKeyInArray!0 (select (arr!41150 _keys!1741) from!2144))))))

(declare-fun b!1289104 () Bool)

(declare-fun res!855820 () Bool)

(assert (=> b!1289104 (=> (not res!855820) (not e!736260))))

(declare-datatypes ((List!29191 0))(
  ( (Nil!29188) (Cons!29187 (h!30405 (_ BitVec 64)) (t!42747 List!29191)) )
))
(declare-fun arrayNoDuplicates!0 (array!85307 (_ BitVec 32) List!29191) Bool)

(assert (=> b!1289104 (= res!855820 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29188))))

(declare-fun b!1289105 () Bool)

(declare-fun res!855814 () Bool)

(assert (=> b!1289105 (=> (not res!855814) (not e!736260))))

(declare-fun minValue!1387 () V!50585)

(declare-fun zeroValue!1387 () V!50585)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4899 (array!85307 array!85305 (_ BitVec 32) (_ BitVec 32) V!50585 V!50585 (_ BitVec 32) Int) ListLongMap!19665)

(assert (=> b!1289105 (= res!855814 (contains!7979 (getCurrentListMap!4899 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52727 () Bool)

(declare-fun mapRes!52727 () Bool)

(declare-fun tp!100532 () Bool)

(assert (=> mapNonEmpty!52727 (= mapRes!52727 (and tp!100532 e!736256))))

(declare-fun mapRest!52727 () (Array (_ BitVec 32) ValueCell!16157))

(declare-fun mapValue!52727 () ValueCell!16157)

(declare-fun mapKey!52727 () (_ BitVec 32))

(assert (=> mapNonEmpty!52727 (= (arr!41149 _values!1445) (store mapRest!52727 mapKey!52727 mapValue!52727))))

(declare-fun b!1289106 () Bool)

(declare-fun res!855817 () Bool)

(assert (=> b!1289106 (=> (not res!855817) (not e!736260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85307 (_ BitVec 32)) Bool)

(assert (=> b!1289106 (= res!855817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289107 () Bool)

(declare-fun res!855816 () Bool)

(assert (=> b!1289107 (=> (not res!855816) (not e!736260))))

(assert (=> b!1289107 (= res!855816 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41701 _keys!1741))))))

(declare-fun mapIsEmpty!52727 () Bool)

(assert (=> mapIsEmpty!52727 mapRes!52727))

(declare-fun b!1289108 () Bool)

(declare-fun res!855819 () Bool)

(assert (=> b!1289108 (=> (not res!855819) (not e!736260))))

(assert (=> b!1289108 (= res!855819 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41701 _keys!1741))))))

(declare-fun b!1289109 () Bool)

(declare-fun res!855813 () Bool)

(assert (=> b!1289109 (=> (not res!855813) (not e!736260))))

(assert (=> b!1289109 (= res!855813 (and (= (size!41700 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41701 _keys!1741) (size!41700 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289110 () Bool)

(assert (=> b!1289110 (= e!736259 (and e!736258 mapRes!52727))))

(declare-fun condMapEmpty!52727 () Bool)

(declare-fun mapDefault!52727 () ValueCell!16157)

(assert (=> b!1289110 (= condMapEmpty!52727 (= (arr!41149 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16157)) mapDefault!52727)))))

(assert (= (and start!109206 res!855818) b!1289109))

(assert (= (and b!1289109 res!855813) b!1289106))

(assert (= (and b!1289106 res!855817) b!1289104))

(assert (= (and b!1289104 res!855820) b!1289108))

(assert (= (and b!1289108 res!855819) b!1289105))

(assert (= (and b!1289105 res!855814) b!1289107))

(assert (= (and b!1289107 res!855816) b!1289103))

(assert (= (and b!1289103 res!855815) b!1289101))

(assert (= (and b!1289110 condMapEmpty!52727) mapIsEmpty!52727))

(assert (= (and b!1289110 (not condMapEmpty!52727)) mapNonEmpty!52727))

(get-info :version)

(assert (= (and mapNonEmpty!52727 ((_ is ValueCellFull!16157) mapValue!52727)) b!1289102))

(assert (= (and b!1289110 ((_ is ValueCellFull!16157) mapDefault!52727)) b!1289100))

(assert (= start!109206 b!1289110))

(declare-fun m!1182177 () Bool)

(assert (=> mapNonEmpty!52727 m!1182177))

(declare-fun m!1182179 () Bool)

(assert (=> b!1289105 m!1182179))

(assert (=> b!1289105 m!1182179))

(declare-fun m!1182181 () Bool)

(assert (=> b!1289105 m!1182181))

(declare-fun m!1182183 () Bool)

(assert (=> b!1289104 m!1182183))

(declare-fun m!1182185 () Bool)

(assert (=> b!1289101 m!1182185))

(declare-fun m!1182187 () Bool)

(assert (=> b!1289101 m!1182187))

(declare-fun m!1182189 () Bool)

(assert (=> b!1289106 m!1182189))

(declare-fun m!1182191 () Bool)

(assert (=> start!109206 m!1182191))

(declare-fun m!1182193 () Bool)

(assert (=> start!109206 m!1182193))

(declare-fun m!1182195 () Bool)

(assert (=> start!109206 m!1182195))

(declare-fun m!1182197 () Bool)

(assert (=> b!1289103 m!1182197))

(assert (=> b!1289103 m!1182197))

(declare-fun m!1182199 () Bool)

(assert (=> b!1289103 m!1182199))

(check-sat b_and!46563 (not b!1289105) (not b!1289103) (not start!109206) (not b!1289106) tp_is_empty!34111 (not b_next!28471) (not b!1289101) (not mapNonEmpty!52727) (not b!1289104))
(check-sat b_and!46563 (not b_next!28471))
