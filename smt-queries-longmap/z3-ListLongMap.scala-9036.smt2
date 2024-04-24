; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109224 () Bool)

(assert start!109224)

(declare-fun b_free!28489 () Bool)

(declare-fun b_next!28489 () Bool)

(assert (=> start!109224 (= b_free!28489 (not b_next!28489))))

(declare-fun tp!100585 () Bool)

(declare-fun b_and!46581 () Bool)

(assert (=> start!109224 (= tp!100585 b_and!46581)))

(declare-fun b!1289397 () Bool)

(declare-fun e!736393 () Bool)

(declare-fun tp_is_empty!34129 () Bool)

(assert (=> b!1289397 (= e!736393 tp_is_empty!34129)))

(declare-fun b!1289398 () Bool)

(declare-fun e!736392 () Bool)

(assert (=> b!1289398 (= e!736392 tp_is_empty!34129)))

(declare-fun mapIsEmpty!52754 () Bool)

(declare-fun mapRes!52754 () Bool)

(assert (=> mapIsEmpty!52754 mapRes!52754))

(declare-fun res!856029 () Bool)

(declare-fun e!736394 () Bool)

(assert (=> start!109224 (=> (not res!856029) (not e!736394))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109224 (= res!856029 (validMask!0 mask!2175))))

(assert (=> start!109224 e!736394))

(assert (=> start!109224 tp_is_empty!34129))

(assert (=> start!109224 true))

(declare-datatypes ((V!50609 0))(
  ( (V!50610 (val!17139 Int)) )
))
(declare-datatypes ((ValueCell!16166 0))(
  ( (ValueCellFull!16166 (v!19737 V!50609)) (EmptyCell!16166) )
))
(declare-datatypes ((array!85341 0))(
  ( (array!85342 (arr!41167 (Array (_ BitVec 32) ValueCell!16166)) (size!41718 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85341)

(declare-fun e!736391 () Bool)

(declare-fun array_inv!31423 (array!85341) Bool)

(assert (=> start!109224 (and (array_inv!31423 _values!1445) e!736391)))

(declare-datatypes ((array!85343 0))(
  ( (array!85344 (arr!41168 (Array (_ BitVec 32) (_ BitVec 64))) (size!41719 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85343)

(declare-fun array_inv!31424 (array!85343) Bool)

(assert (=> start!109224 (array_inv!31424 _keys!1741)))

(assert (=> start!109224 tp!100585))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun b!1289399 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289399 (= e!736394 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle from!2144 (size!41719 _keys!1741)))))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22014 0))(
  ( (tuple2!22015 (_1!11018 (_ BitVec 64)) (_2!11018 V!50609)) )
))
(declare-datatypes ((List!29202 0))(
  ( (Nil!29199) (Cons!29198 (h!30416 tuple2!22014) (t!42758 List!29202)) )
))
(declare-datatypes ((ListLongMap!19679 0))(
  ( (ListLongMap!19680 (toList!9855 List!29202)) )
))
(declare-fun contains!7986 (ListLongMap!19679 (_ BitVec 64)) Bool)

(assert (=> b!1289399 (not (contains!7986 (ListLongMap!19680 Nil!29199) k0!1205))))

(declare-datatypes ((Unit!42563 0))(
  ( (Unit!42564) )
))
(declare-fun lt!578409 () Unit!42563)

(declare-fun emptyContainsNothing!35 ((_ BitVec 64)) Unit!42563)

(assert (=> b!1289399 (= lt!578409 (emptyContainsNothing!35 k0!1205))))

(declare-fun b!1289400 () Bool)

(assert (=> b!1289400 (= e!736391 (and e!736392 mapRes!52754))))

(declare-fun condMapEmpty!52754 () Bool)

(declare-fun mapDefault!52754 () ValueCell!16166)

(assert (=> b!1289400 (= condMapEmpty!52754 (= (arr!41167 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16166)) mapDefault!52754)))))

(declare-fun b!1289401 () Bool)

(declare-fun res!856030 () Bool)

(assert (=> b!1289401 (=> (not res!856030) (not e!736394))))

(assert (=> b!1289401 (= res!856030 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41719 _keys!1741))))))

(declare-fun b!1289402 () Bool)

(declare-fun res!856034 () Bool)

(assert (=> b!1289402 (=> (not res!856034) (not e!736394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289402 (= res!856034 (not (validKeyInArray!0 (select (arr!41168 _keys!1741) from!2144))))))

(declare-fun b!1289403 () Bool)

(declare-fun res!856032 () Bool)

(assert (=> b!1289403 (=> (not res!856032) (not e!736394))))

(assert (=> b!1289403 (= res!856032 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41719 _keys!1741))))))

(declare-fun b!1289404 () Bool)

(declare-fun res!856033 () Bool)

(assert (=> b!1289404 (=> (not res!856033) (not e!736394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85343 (_ BitVec 32)) Bool)

(assert (=> b!1289404 (= res!856033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289405 () Bool)

(declare-fun res!856036 () Bool)

(assert (=> b!1289405 (=> (not res!856036) (not e!736394))))

(assert (=> b!1289405 (= res!856036 (and (= (size!41718 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41719 _keys!1741) (size!41718 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289406 () Bool)

(declare-fun res!856035 () Bool)

(assert (=> b!1289406 (=> (not res!856035) (not e!736394))))

(declare-fun minValue!1387 () V!50609)

(declare-fun zeroValue!1387 () V!50609)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4905 (array!85343 array!85341 (_ BitVec 32) (_ BitVec 32) V!50609 V!50609 (_ BitVec 32) Int) ListLongMap!19679)

(assert (=> b!1289406 (= res!856035 (contains!7986 (getCurrentListMap!4905 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52754 () Bool)

(declare-fun tp!100586 () Bool)

(assert (=> mapNonEmpty!52754 (= mapRes!52754 (and tp!100586 e!736393))))

(declare-fun mapKey!52754 () (_ BitVec 32))

(declare-fun mapValue!52754 () ValueCell!16166)

(declare-fun mapRest!52754 () (Array (_ BitVec 32) ValueCell!16166))

(assert (=> mapNonEmpty!52754 (= (arr!41167 _values!1445) (store mapRest!52754 mapKey!52754 mapValue!52754))))

(declare-fun b!1289407 () Bool)

(declare-fun res!856031 () Bool)

(assert (=> b!1289407 (=> (not res!856031) (not e!736394))))

(declare-datatypes ((List!29203 0))(
  ( (Nil!29200) (Cons!29199 (h!30417 (_ BitVec 64)) (t!42759 List!29203)) )
))
(declare-fun arrayNoDuplicates!0 (array!85343 (_ BitVec 32) List!29203) Bool)

(assert (=> b!1289407 (= res!856031 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29200))))

(assert (= (and start!109224 res!856029) b!1289405))

(assert (= (and b!1289405 res!856036) b!1289404))

(assert (= (and b!1289404 res!856033) b!1289407))

(assert (= (and b!1289407 res!856031) b!1289403))

(assert (= (and b!1289403 res!856032) b!1289406))

(assert (= (and b!1289406 res!856035) b!1289401))

(assert (= (and b!1289401 res!856030) b!1289402))

(assert (= (and b!1289402 res!856034) b!1289399))

(assert (= (and b!1289400 condMapEmpty!52754) mapIsEmpty!52754))

(assert (= (and b!1289400 (not condMapEmpty!52754)) mapNonEmpty!52754))

(get-info :version)

(assert (= (and mapNonEmpty!52754 ((_ is ValueCellFull!16166) mapValue!52754)) b!1289397))

(assert (= (and b!1289400 ((_ is ValueCellFull!16166) mapDefault!52754)) b!1289398))

(assert (= start!109224 b!1289400))

(declare-fun m!1182393 () Bool)

(assert (=> start!109224 m!1182393))

(declare-fun m!1182395 () Bool)

(assert (=> start!109224 m!1182395))

(declare-fun m!1182397 () Bool)

(assert (=> start!109224 m!1182397))

(declare-fun m!1182399 () Bool)

(assert (=> b!1289404 m!1182399))

(declare-fun m!1182401 () Bool)

(assert (=> b!1289399 m!1182401))

(declare-fun m!1182403 () Bool)

(assert (=> b!1289399 m!1182403))

(declare-fun m!1182405 () Bool)

(assert (=> mapNonEmpty!52754 m!1182405))

(declare-fun m!1182407 () Bool)

(assert (=> b!1289407 m!1182407))

(declare-fun m!1182409 () Bool)

(assert (=> b!1289402 m!1182409))

(assert (=> b!1289402 m!1182409))

(declare-fun m!1182411 () Bool)

(assert (=> b!1289402 m!1182411))

(declare-fun m!1182413 () Bool)

(assert (=> b!1289406 m!1182413))

(assert (=> b!1289406 m!1182413))

(declare-fun m!1182415 () Bool)

(assert (=> b!1289406 m!1182415))

(check-sat (not b!1289399) tp_is_empty!34129 (not b!1289404) (not start!109224) (not b!1289402) (not b!1289407) b_and!46581 (not b_next!28489) (not b!1289406) (not mapNonEmpty!52754))
(check-sat b_and!46581 (not b_next!28489))
