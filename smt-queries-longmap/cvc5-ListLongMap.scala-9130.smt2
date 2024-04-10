; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109564 () Bool)

(assert start!109564)

(declare-fun b_free!29053 () Bool)

(declare-fun b_next!29053 () Bool)

(assert (=> start!109564 (= b_free!29053 (not b_next!29053))))

(declare-fun tp!102278 () Bool)

(declare-fun b_and!47143 () Bool)

(assert (=> start!109564 (= tp!102278 b_and!47143)))

(declare-fun b!1297671 () Bool)

(declare-fun res!862390 () Bool)

(declare-fun e!740368 () Bool)

(assert (=> b!1297671 (=> (not res!862390) (not e!740368))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86396 0))(
  ( (array!86397 (arr!41699 (Array (_ BitVec 32) (_ BitVec 64))) (size!42249 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86396)

(assert (=> b!1297671 (= res!862390 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42249 _keys!1741))))))

(declare-fun b!1297672 () Bool)

(declare-fun e!740371 () Bool)

(declare-fun tp_is_empty!34693 () Bool)

(assert (=> b!1297672 (= e!740371 tp_is_empty!34693)))

(declare-fun b!1297673 () Bool)

(assert (=> b!1297673 (= e!740368 false)))

(declare-datatypes ((V!51361 0))(
  ( (V!51362 (val!17421 Int)) )
))
(declare-fun minValue!1387 () V!51361)

(declare-fun zeroValue!1387 () V!51361)

(declare-datatypes ((ValueCell!16448 0))(
  ( (ValueCellFull!16448 (v!20024 V!51361)) (EmptyCell!16448) )
))
(declare-datatypes ((array!86398 0))(
  ( (array!86399 (arr!41700 (Array (_ BitVec 32) ValueCell!16448)) (size!42250 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86398)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!580625 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22452 0))(
  ( (tuple2!22453 (_1!11237 (_ BitVec 64)) (_2!11237 V!51361)) )
))
(declare-datatypes ((List!29586 0))(
  ( (Nil!29583) (Cons!29582 (h!30791 tuple2!22452) (t!43150 List!29586)) )
))
(declare-datatypes ((ListLongMap!20109 0))(
  ( (ListLongMap!20110 (toList!10070 List!29586)) )
))
(declare-fun contains!8188 (ListLongMap!20109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5099 (array!86396 array!86398 (_ BitVec 32) (_ BitVec 32) V!51361 V!51361 (_ BitVec 32) Int) ListLongMap!20109)

(assert (=> b!1297673 (= lt!580625 (contains!8188 (getCurrentListMap!5099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297674 () Bool)

(declare-fun res!862389 () Bool)

(assert (=> b!1297674 (=> (not res!862389) (not e!740368))))

(declare-datatypes ((List!29587 0))(
  ( (Nil!29584) (Cons!29583 (h!30792 (_ BitVec 64)) (t!43151 List!29587)) )
))
(declare-fun arrayNoDuplicates!0 (array!86396 (_ BitVec 32) List!29587) Bool)

(assert (=> b!1297674 (= res!862389 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29584))))

(declare-fun res!862391 () Bool)

(assert (=> start!109564 (=> (not res!862391) (not e!740368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109564 (= res!862391 (validMask!0 mask!2175))))

(assert (=> start!109564 e!740368))

(assert (=> start!109564 tp_is_empty!34693))

(assert (=> start!109564 true))

(declare-fun e!740372 () Bool)

(declare-fun array_inv!31561 (array!86398) Bool)

(assert (=> start!109564 (and (array_inv!31561 _values!1445) e!740372)))

(declare-fun array_inv!31562 (array!86396) Bool)

(assert (=> start!109564 (array_inv!31562 _keys!1741)))

(assert (=> start!109564 tp!102278))

(declare-fun b!1297675 () Bool)

(declare-fun e!740370 () Bool)

(declare-fun mapRes!53600 () Bool)

(assert (=> b!1297675 (= e!740372 (and e!740370 mapRes!53600))))

(declare-fun condMapEmpty!53600 () Bool)

(declare-fun mapDefault!53600 () ValueCell!16448)

