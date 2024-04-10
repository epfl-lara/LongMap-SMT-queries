; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109628 () Bool)

(assert start!109628)

(declare-fun b_free!29117 () Bool)

(declare-fun b_next!29117 () Bool)

(assert (=> start!109628 (= b_free!29117 (not b_next!29117))))

(declare-fun tp!102470 () Bool)

(declare-fun b_and!47207 () Bool)

(assert (=> start!109628 (= tp!102470 b_and!47207)))

(declare-fun b!1298617 () Bool)

(declare-fun e!740849 () Bool)

(declare-fun tp_is_empty!34757 () Bool)

(assert (=> b!1298617 (= e!740849 tp_is_empty!34757)))

(declare-fun b!1298618 () Bool)

(declare-fun res!863046 () Bool)

(declare-fun e!740852 () Bool)

(assert (=> b!1298618 (=> (not res!863046) (not e!740852))))

(declare-datatypes ((array!86520 0))(
  ( (array!86521 (arr!41761 (Array (_ BitVec 32) (_ BitVec 64))) (size!42311 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86520)

(declare-datatypes ((List!29636 0))(
  ( (Nil!29633) (Cons!29632 (h!30841 (_ BitVec 64)) (t!43200 List!29636)) )
))
(declare-fun arrayNoDuplicates!0 (array!86520 (_ BitVec 32) List!29636) Bool)

(assert (=> b!1298618 (= res!863046 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29633))))

(declare-fun res!863047 () Bool)

(assert (=> start!109628 (=> (not res!863047) (not e!740852))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109628 (= res!863047 (validMask!0 mask!2175))))

(assert (=> start!109628 e!740852))

(assert (=> start!109628 tp_is_empty!34757))

(assert (=> start!109628 true))

(declare-datatypes ((V!51445 0))(
  ( (V!51446 (val!17453 Int)) )
))
(declare-datatypes ((ValueCell!16480 0))(
  ( (ValueCellFull!16480 (v!20056 V!51445)) (EmptyCell!16480) )
))
(declare-datatypes ((array!86522 0))(
  ( (array!86523 (arr!41762 (Array (_ BitVec 32) ValueCell!16480)) (size!42312 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86522)

(declare-fun e!740850 () Bool)

(declare-fun array_inv!31609 (array!86522) Bool)

(assert (=> start!109628 (and (array_inv!31609 _values!1445) e!740850)))

(declare-fun array_inv!31610 (array!86520) Bool)

(assert (=> start!109628 (array_inv!31610 _keys!1741)))

(assert (=> start!109628 tp!102470))

(declare-fun mapIsEmpty!53696 () Bool)

(declare-fun mapRes!53696 () Bool)

(assert (=> mapIsEmpty!53696 mapRes!53696))

(declare-fun b!1298619 () Bool)

(declare-fun e!740851 () Bool)

(assert (=> b!1298619 (= e!740851 tp_is_empty!34757)))

(declare-fun b!1298620 () Bool)

(declare-fun res!863051 () Bool)

(assert (=> b!1298620 (=> (not res!863051) (not e!740852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86520 (_ BitVec 32)) Bool)

(assert (=> b!1298620 (= res!863051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53696 () Bool)

(declare-fun tp!102469 () Bool)

(assert (=> mapNonEmpty!53696 (= mapRes!53696 (and tp!102469 e!740849))))

(declare-fun mapRest!53696 () (Array (_ BitVec 32) ValueCell!16480))

(declare-fun mapValue!53696 () ValueCell!16480)

(declare-fun mapKey!53696 () (_ BitVec 32))

(assert (=> mapNonEmpty!53696 (= (arr!41762 _values!1445) (store mapRest!53696 mapKey!53696 mapValue!53696))))

(declare-fun b!1298621 () Bool)

(declare-fun res!863049 () Bool)

(assert (=> b!1298621 (=> (not res!863049) (not e!740852))))

(declare-fun minValue!1387 () V!51445)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!51445)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22508 0))(
  ( (tuple2!22509 (_1!11265 (_ BitVec 64)) (_2!11265 V!51445)) )
))
(declare-datatypes ((List!29637 0))(
  ( (Nil!29634) (Cons!29633 (h!30842 tuple2!22508) (t!43201 List!29637)) )
))
(declare-datatypes ((ListLongMap!20165 0))(
  ( (ListLongMap!20166 (toList!10098 List!29637)) )
))
(declare-fun contains!8216 (ListLongMap!20165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5127 (array!86520 array!86522 (_ BitVec 32) (_ BitVec 32) V!51445 V!51445 (_ BitVec 32) Int) ListLongMap!20165)

(assert (=> b!1298621 (= res!863049 (contains!8216 (getCurrentListMap!5127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298622 () Bool)

(declare-fun res!863052 () Bool)

(assert (=> b!1298622 (=> (not res!863052) (not e!740852))))

(assert (=> b!1298622 (= res!863052 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42311 _keys!1741))))))

(declare-fun b!1298623 () Bool)

(declare-fun res!863048 () Bool)

(assert (=> b!1298623 (=> (not res!863048) (not e!740852))))

(assert (=> b!1298623 (= res!863048 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42311 _keys!1741)) (not (= (select (arr!41761 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298624 () Bool)

(assert (=> b!1298624 (= e!740850 (and e!740851 mapRes!53696))))

(declare-fun condMapEmpty!53696 () Bool)

(declare-fun mapDefault!53696 () ValueCell!16480)

