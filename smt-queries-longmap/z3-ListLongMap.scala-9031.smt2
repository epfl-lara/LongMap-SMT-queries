; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109194 () Bool)

(assert start!109194)

(declare-fun b_free!28459 () Bool)

(declare-fun b_next!28459 () Bool)

(assert (=> start!109194 (= b_free!28459 (not b_next!28459))))

(declare-fun tp!100495 () Bool)

(declare-fun b_and!46551 () Bool)

(assert (=> start!109194 (= tp!100495 b_and!46551)))

(declare-fun b!1288902 () Bool)

(declare-fun res!855675 () Bool)

(declare-fun e!736169 () Bool)

(assert (=> b!1288902 (=> (not res!855675) (not e!736169))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85283 0))(
  ( (array!85284 (arr!41138 (Array (_ BitVec 32) (_ BitVec 64))) (size!41689 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85283)

(assert (=> b!1288902 (= res!855675 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41689 _keys!1741))))))

(declare-fun b!1288903 () Bool)

(declare-fun res!855674 () Bool)

(assert (=> b!1288903 (=> (not res!855674) (not e!736169))))

(declare-datatypes ((List!29180 0))(
  ( (Nil!29177) (Cons!29176 (h!30394 (_ BitVec 64)) (t!42736 List!29180)) )
))
(declare-fun arrayNoDuplicates!0 (array!85283 (_ BitVec 32) List!29180) Bool)

(assert (=> b!1288903 (= res!855674 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29177))))

(declare-fun b!1288904 () Bool)

(declare-fun e!736170 () Bool)

(declare-fun e!736167 () Bool)

(declare-fun mapRes!52709 () Bool)

(assert (=> b!1288904 (= e!736170 (and e!736167 mapRes!52709))))

(declare-fun condMapEmpty!52709 () Bool)

(declare-datatypes ((V!50569 0))(
  ( (V!50570 (val!17124 Int)) )
))
(declare-datatypes ((ValueCell!16151 0))(
  ( (ValueCellFull!16151 (v!19722 V!50569)) (EmptyCell!16151) )
))
(declare-datatypes ((array!85285 0))(
  ( (array!85286 (arr!41139 (Array (_ BitVec 32) ValueCell!16151)) (size!41690 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85285)

(declare-fun mapDefault!52709 () ValueCell!16151)

(assert (=> b!1288904 (= condMapEmpty!52709 (= (arr!41139 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16151)) mapDefault!52709)))))

(declare-fun b!1288905 () Bool)

(declare-fun res!855669 () Bool)

(assert (=> b!1288905 (=> (not res!855669) (not e!736169))))

(declare-fun minValue!1387 () V!50569)

(declare-fun zeroValue!1387 () V!50569)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21990 0))(
  ( (tuple2!21991 (_1!11006 (_ BitVec 64)) (_2!11006 V!50569)) )
))
(declare-datatypes ((List!29181 0))(
  ( (Nil!29178) (Cons!29177 (h!30395 tuple2!21990) (t!42737 List!29181)) )
))
(declare-datatypes ((ListLongMap!19655 0))(
  ( (ListLongMap!19656 (toList!9843 List!29181)) )
))
(declare-fun contains!7974 (ListLongMap!19655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4896 (array!85283 array!85285 (_ BitVec 32) (_ BitVec 32) V!50569 V!50569 (_ BitVec 32) Int) ListLongMap!19655)

(assert (=> b!1288905 (= res!855669 (contains!7974 (getCurrentListMap!4896 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288906 () Bool)

(declare-fun res!855670 () Bool)

(assert (=> b!1288906 (=> (not res!855670) (not e!736169))))

(assert (=> b!1288906 (= res!855670 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41689 _keys!1741))))))

(declare-fun b!1288907 () Bool)

(assert (=> b!1288907 (= e!736169 (not true))))

(assert (=> b!1288907 (not (contains!7974 (ListLongMap!19656 Nil!29178) k0!1205))))

(declare-datatypes ((Unit!42541 0))(
  ( (Unit!42542) )
))
(declare-fun lt!578364 () Unit!42541)

(declare-fun emptyContainsNothing!24 ((_ BitVec 64)) Unit!42541)

(assert (=> b!1288907 (= lt!578364 (emptyContainsNothing!24 k0!1205))))

(declare-fun mapNonEmpty!52709 () Bool)

(declare-fun tp!100496 () Bool)

(declare-fun e!736168 () Bool)

(assert (=> mapNonEmpty!52709 (= mapRes!52709 (and tp!100496 e!736168))))

(declare-fun mapValue!52709 () ValueCell!16151)

(declare-fun mapKey!52709 () (_ BitVec 32))

(declare-fun mapRest!52709 () (Array (_ BitVec 32) ValueCell!16151))

(assert (=> mapNonEmpty!52709 (= (arr!41139 _values!1445) (store mapRest!52709 mapKey!52709 mapValue!52709))))

(declare-fun b!1288908 () Bool)

(declare-fun res!855676 () Bool)

(assert (=> b!1288908 (=> (not res!855676) (not e!736169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85283 (_ BitVec 32)) Bool)

(assert (=> b!1288908 (= res!855676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288909 () Bool)

(declare-fun tp_is_empty!34099 () Bool)

(assert (=> b!1288909 (= e!736167 tp_is_empty!34099)))

(declare-fun b!1288911 () Bool)

(declare-fun res!855671 () Bool)

(assert (=> b!1288911 (=> (not res!855671) (not e!736169))))

(assert (=> b!1288911 (= res!855671 (and (= (size!41690 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41689 _keys!1741) (size!41690 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52709 () Bool)

(assert (=> mapIsEmpty!52709 mapRes!52709))

(declare-fun b!1288912 () Bool)

(declare-fun res!855673 () Bool)

(assert (=> b!1288912 (=> (not res!855673) (not e!736169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288912 (= res!855673 (not (validKeyInArray!0 (select (arr!41138 _keys!1741) from!2144))))))

(declare-fun res!855672 () Bool)

(assert (=> start!109194 (=> (not res!855672) (not e!736169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109194 (= res!855672 (validMask!0 mask!2175))))

(assert (=> start!109194 e!736169))

(assert (=> start!109194 tp_is_empty!34099))

(assert (=> start!109194 true))

(declare-fun array_inv!31399 (array!85285) Bool)

(assert (=> start!109194 (and (array_inv!31399 _values!1445) e!736170)))

(declare-fun array_inv!31400 (array!85283) Bool)

(assert (=> start!109194 (array_inv!31400 _keys!1741)))

(assert (=> start!109194 tp!100495))

(declare-fun b!1288910 () Bool)

(assert (=> b!1288910 (= e!736168 tp_is_empty!34099)))

(assert (= (and start!109194 res!855672) b!1288911))

(assert (= (and b!1288911 res!855671) b!1288908))

(assert (= (and b!1288908 res!855676) b!1288903))

(assert (= (and b!1288903 res!855674) b!1288906))

(assert (= (and b!1288906 res!855670) b!1288905))

(assert (= (and b!1288905 res!855669) b!1288902))

(assert (= (and b!1288902 res!855675) b!1288912))

(assert (= (and b!1288912 res!855673) b!1288907))

(assert (= (and b!1288904 condMapEmpty!52709) mapIsEmpty!52709))

(assert (= (and b!1288904 (not condMapEmpty!52709)) mapNonEmpty!52709))

(get-info :version)

(assert (= (and mapNonEmpty!52709 ((_ is ValueCellFull!16151) mapValue!52709)) b!1288910))

(assert (= (and b!1288904 ((_ is ValueCellFull!16151) mapDefault!52709)) b!1288909))

(assert (= start!109194 b!1288904))

(declare-fun m!1182033 () Bool)

(assert (=> b!1288908 m!1182033))

(declare-fun m!1182035 () Bool)

(assert (=> b!1288903 m!1182035))

(declare-fun m!1182037 () Bool)

(assert (=> b!1288905 m!1182037))

(assert (=> b!1288905 m!1182037))

(declare-fun m!1182039 () Bool)

(assert (=> b!1288905 m!1182039))

(declare-fun m!1182041 () Bool)

(assert (=> b!1288907 m!1182041))

(declare-fun m!1182043 () Bool)

(assert (=> b!1288907 m!1182043))

(declare-fun m!1182045 () Bool)

(assert (=> start!109194 m!1182045))

(declare-fun m!1182047 () Bool)

(assert (=> start!109194 m!1182047))

(declare-fun m!1182049 () Bool)

(assert (=> start!109194 m!1182049))

(declare-fun m!1182051 () Bool)

(assert (=> b!1288912 m!1182051))

(assert (=> b!1288912 m!1182051))

(declare-fun m!1182053 () Bool)

(assert (=> b!1288912 m!1182053))

(declare-fun m!1182055 () Bool)

(assert (=> mapNonEmpty!52709 m!1182055))

(check-sat (not b!1288903) (not b_next!28459) tp_is_empty!34099 (not b!1288912) (not mapNonEmpty!52709) (not b!1288907) (not b!1288908) (not b!1288905) b_and!46551 (not start!109194))
(check-sat b_and!46551 (not b_next!28459))
