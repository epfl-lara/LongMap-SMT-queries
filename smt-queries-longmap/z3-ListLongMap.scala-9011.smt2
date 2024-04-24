; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109050 () Bool)

(assert start!109050)

(declare-fun b_free!28339 () Bool)

(declare-fun b_next!28339 () Bool)

(assert (=> start!109050 (= b_free!28339 (not b_next!28339))))

(declare-fun tp!100133 () Bool)

(declare-fun b_and!46407 () Bool)

(assert (=> start!109050 (= tp!100133 b_and!46407)))

(declare-fun b!1286504 () Bool)

(declare-fun res!854303 () Bool)

(declare-fun e!734951 () Bool)

(assert (=> b!1286504 (=> (not res!854303) (not e!734951))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85045 0))(
  ( (array!85046 (arr!41020 (Array (_ BitVec 32) (_ BitVec 64))) (size!41571 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85045)

(assert (=> b!1286504 (= res!854303 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41571 _keys!1741))))))

(declare-fun res!854301 () Bool)

(assert (=> start!109050 (=> (not res!854301) (not e!734951))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109050 (= res!854301 (validMask!0 mask!2175))))

(assert (=> start!109050 e!734951))

(declare-fun tp_is_empty!33979 () Bool)

(assert (=> start!109050 tp_is_empty!33979))

(assert (=> start!109050 true))

(declare-datatypes ((V!50409 0))(
  ( (V!50410 (val!17064 Int)) )
))
(declare-datatypes ((ValueCell!16091 0))(
  ( (ValueCellFull!16091 (v!19661 V!50409)) (EmptyCell!16091) )
))
(declare-datatypes ((array!85047 0))(
  ( (array!85048 (arr!41021 (Array (_ BitVec 32) ValueCell!16091)) (size!41572 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85047)

(declare-fun e!734949 () Bool)

(declare-fun array_inv!31327 (array!85047) Bool)

(assert (=> start!109050 (and (array_inv!31327 _values!1445) e!734949)))

(declare-fun array_inv!31328 (array!85045) Bool)

(assert (=> start!109050 (array_inv!31328 _keys!1741)))

(assert (=> start!109050 tp!100133))

(declare-fun b!1286505 () Bool)

(declare-fun res!854302 () Bool)

(assert (=> b!1286505 (=> (not res!854302) (not e!734951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85045 (_ BitVec 32)) Bool)

(assert (=> b!1286505 (= res!854302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286506 () Bool)

(declare-fun res!854305 () Bool)

(assert (=> b!1286506 (=> (not res!854305) (not e!734951))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286506 (= res!854305 (and (= (size!41572 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41571 _keys!1741) (size!41572 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52526 () Bool)

(declare-fun mapRes!52526 () Bool)

(assert (=> mapIsEmpty!52526 mapRes!52526))

(declare-fun b!1286507 () Bool)

(assert (=> b!1286507 (= e!734951 false)))

(declare-fun minValue!1387 () V!50409)

(declare-fun zeroValue!1387 () V!50409)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577370 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21894 0))(
  ( (tuple2!21895 (_1!10958 (_ BitVec 64)) (_2!10958 V!50409)) )
))
(declare-datatypes ((List!29095 0))(
  ( (Nil!29092) (Cons!29091 (h!30309 tuple2!21894) (t!42631 List!29095)) )
))
(declare-datatypes ((ListLongMap!19559 0))(
  ( (ListLongMap!19560 (toList!9795 List!29095)) )
))
(declare-fun contains!7926 (ListLongMap!19559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4859 (array!85045 array!85047 (_ BitVec 32) (_ BitVec 32) V!50409 V!50409 (_ BitVec 32) Int) ListLongMap!19559)

(assert (=> b!1286507 (= lt!577370 (contains!7926 (getCurrentListMap!4859 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286508 () Bool)

(declare-fun res!854304 () Bool)

(assert (=> b!1286508 (=> (not res!854304) (not e!734951))))

(declare-datatypes ((List!29096 0))(
  ( (Nil!29093) (Cons!29092 (h!30310 (_ BitVec 64)) (t!42632 List!29096)) )
))
(declare-fun arrayNoDuplicates!0 (array!85045 (_ BitVec 32) List!29096) Bool)

(assert (=> b!1286508 (= res!854304 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29093))))

(declare-fun b!1286509 () Bool)

(declare-fun e!734950 () Bool)

(assert (=> b!1286509 (= e!734950 tp_is_empty!33979)))

(declare-fun b!1286510 () Bool)

(declare-fun e!734952 () Bool)

(assert (=> b!1286510 (= e!734952 tp_is_empty!33979)))

(declare-fun b!1286511 () Bool)

(assert (=> b!1286511 (= e!734949 (and e!734950 mapRes!52526))))

(declare-fun condMapEmpty!52526 () Bool)

(declare-fun mapDefault!52526 () ValueCell!16091)

(assert (=> b!1286511 (= condMapEmpty!52526 (= (arr!41021 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16091)) mapDefault!52526)))))

(declare-fun mapNonEmpty!52526 () Bool)

(declare-fun tp!100132 () Bool)

(assert (=> mapNonEmpty!52526 (= mapRes!52526 (and tp!100132 e!734952))))

(declare-fun mapValue!52526 () ValueCell!16091)

(declare-fun mapRest!52526 () (Array (_ BitVec 32) ValueCell!16091))

(declare-fun mapKey!52526 () (_ BitVec 32))

(assert (=> mapNonEmpty!52526 (= (arr!41021 _values!1445) (store mapRest!52526 mapKey!52526 mapValue!52526))))

(assert (= (and start!109050 res!854301) b!1286506))

(assert (= (and b!1286506 res!854305) b!1286505))

(assert (= (and b!1286505 res!854302) b!1286508))

(assert (= (and b!1286508 res!854304) b!1286504))

(assert (= (and b!1286504 res!854303) b!1286507))

(assert (= (and b!1286511 condMapEmpty!52526) mapIsEmpty!52526))

(assert (= (and b!1286511 (not condMapEmpty!52526)) mapNonEmpty!52526))

(get-info :version)

(assert (= (and mapNonEmpty!52526 ((_ is ValueCellFull!16091) mapValue!52526)) b!1286510))

(assert (= (and b!1286511 ((_ is ValueCellFull!16091) mapDefault!52526)) b!1286509))

(assert (= start!109050 b!1286511))

(declare-fun m!1180249 () Bool)

(assert (=> b!1286507 m!1180249))

(assert (=> b!1286507 m!1180249))

(declare-fun m!1180251 () Bool)

(assert (=> b!1286507 m!1180251))

(declare-fun m!1180253 () Bool)

(assert (=> mapNonEmpty!52526 m!1180253))

(declare-fun m!1180255 () Bool)

(assert (=> b!1286508 m!1180255))

(declare-fun m!1180257 () Bool)

(assert (=> b!1286505 m!1180257))

(declare-fun m!1180259 () Bool)

(assert (=> start!109050 m!1180259))

(declare-fun m!1180261 () Bool)

(assert (=> start!109050 m!1180261))

(declare-fun m!1180263 () Bool)

(assert (=> start!109050 m!1180263))

(check-sat b_and!46407 (not b!1286507) tp_is_empty!33979 (not mapNonEmpty!52526) (not b_next!28339) (not start!109050) (not b!1286508) (not b!1286505))
(check-sat b_and!46407 (not b_next!28339))
