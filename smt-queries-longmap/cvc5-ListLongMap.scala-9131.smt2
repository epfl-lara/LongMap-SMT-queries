; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109570 () Bool)

(assert start!109570)

(declare-fun b_free!29059 () Bool)

(declare-fun b_next!29059 () Bool)

(assert (=> start!109570 (= b_free!29059 (not b_next!29059))))

(declare-fun tp!102296 () Bool)

(declare-fun b_and!47149 () Bool)

(assert (=> start!109570 (= tp!102296 b_and!47149)))

(declare-fun b!1297747 () Bool)

(declare-fun res!862440 () Bool)

(declare-fun e!740413 () Bool)

(assert (=> b!1297747 (=> (not res!862440) (not e!740413))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86406 0))(
  ( (array!86407 (arr!41704 (Array (_ BitVec 32) (_ BitVec 64))) (size!42254 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86406)

(assert (=> b!1297747 (= res!862440 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42254 _keys!1741))))))

(declare-fun res!862437 () Bool)

(assert (=> start!109570 (=> (not res!862437) (not e!740413))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109570 (= res!862437 (validMask!0 mask!2175))))

(assert (=> start!109570 e!740413))

(declare-fun tp_is_empty!34699 () Bool)

(assert (=> start!109570 tp_is_empty!34699))

(assert (=> start!109570 true))

(declare-datatypes ((V!51369 0))(
  ( (V!51370 (val!17424 Int)) )
))
(declare-datatypes ((ValueCell!16451 0))(
  ( (ValueCellFull!16451 (v!20027 V!51369)) (EmptyCell!16451) )
))
(declare-datatypes ((array!86408 0))(
  ( (array!86409 (arr!41705 (Array (_ BitVec 32) ValueCell!16451)) (size!42255 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86408)

(declare-fun e!740416 () Bool)

(declare-fun array_inv!31565 (array!86408) Bool)

(assert (=> start!109570 (and (array_inv!31565 _values!1445) e!740416)))

(declare-fun array_inv!31566 (array!86406) Bool)

(assert (=> start!109570 (array_inv!31566 _keys!1741)))

(assert (=> start!109570 tp!102296))

(declare-fun b!1297748 () Bool)

(declare-fun res!862441 () Bool)

(assert (=> b!1297748 (=> (not res!862441) (not e!740413))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1297748 (= res!862441 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42254 _keys!1741)) (not (= (select (arr!41704 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1297749 () Bool)

(assert (=> b!1297749 (= e!740413 (not true))))

(declare-fun minValue!1387 () V!51369)

(declare-fun zeroValue!1387 () V!51369)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22456 0))(
  ( (tuple2!22457 (_1!11239 (_ BitVec 64)) (_2!11239 V!51369)) )
))
(declare-datatypes ((List!29590 0))(
  ( (Nil!29587) (Cons!29586 (h!30795 tuple2!22456) (t!43154 List!29590)) )
))
(declare-datatypes ((ListLongMap!20113 0))(
  ( (ListLongMap!20114 (toList!10072 List!29590)) )
))
(declare-fun contains!8190 (ListLongMap!20113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5101 (array!86406 array!86408 (_ BitVec 32) (_ BitVec 32) V!51369 V!51369 (_ BitVec 32) Int) ListLongMap!20113)

(assert (=> b!1297749 (contains!8190 (getCurrentListMap!5101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42957 0))(
  ( (Unit!42958) )
))
(declare-fun lt!580634 () Unit!42957)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!31 (array!86406 array!86408 (_ BitVec 32) (_ BitVec 32) V!51369 V!51369 (_ BitVec 64) (_ BitVec 32) Int) Unit!42957)

(assert (=> b!1297749 (= lt!580634 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!31 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297750 () Bool)

(declare-fun e!740417 () Bool)

(declare-fun mapRes!53609 () Bool)

(assert (=> b!1297750 (= e!740416 (and e!740417 mapRes!53609))))

(declare-fun condMapEmpty!53609 () Bool)

(declare-fun mapDefault!53609 () ValueCell!16451)

