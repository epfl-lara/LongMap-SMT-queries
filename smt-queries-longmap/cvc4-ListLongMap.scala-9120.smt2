; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109508 () Bool)

(assert start!109508)

(declare-fun b_free!28997 () Bool)

(declare-fun b_next!28997 () Bool)

(assert (=> start!109508 (= b_free!28997 (not b_next!28997))))

(declare-fun tp!102110 () Bool)

(declare-fun b_and!47087 () Bool)

(assert (=> start!109508 (= tp!102110 b_and!47087)))

(declare-fun b!1296999 () Bool)

(declare-fun e!739949 () Bool)

(assert (=> b!1296999 (= e!739949 false)))

(declare-datatypes ((V!51285 0))(
  ( (V!51286 (val!17393 Int)) )
))
(declare-fun minValue!1387 () V!51285)

(declare-fun zeroValue!1387 () V!51285)

(declare-datatypes ((ValueCell!16420 0))(
  ( (ValueCellFull!16420 (v!19996 V!51285)) (EmptyCell!16420) )
))
(declare-datatypes ((array!86290 0))(
  ( (array!86291 (arr!41646 (Array (_ BitVec 32) ValueCell!16420)) (size!42196 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86290)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86292 0))(
  ( (array!86293 (arr!41647 (Array (_ BitVec 32) (_ BitVec 64))) (size!42197 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86292)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580541 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22412 0))(
  ( (tuple2!22413 (_1!11217 (_ BitVec 64)) (_2!11217 V!51285)) )
))
(declare-datatypes ((List!29547 0))(
  ( (Nil!29544) (Cons!29543 (h!30752 tuple2!22412) (t!43111 List!29547)) )
))
(declare-datatypes ((ListLongMap!20069 0))(
  ( (ListLongMap!20070 (toList!10050 List!29547)) )
))
(declare-fun contains!8168 (ListLongMap!20069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5079 (array!86292 array!86290 (_ BitVec 32) (_ BitVec 32) V!51285 V!51285 (_ BitVec 32) Int) ListLongMap!20069)

(assert (=> b!1296999 (= lt!580541 (contains!8168 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!861969 () Bool)

(assert (=> start!109508 (=> (not res!861969) (not e!739949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109508 (= res!861969 (validMask!0 mask!2175))))

(assert (=> start!109508 e!739949))

(declare-fun tp_is_empty!34637 () Bool)

(assert (=> start!109508 tp_is_empty!34637))

(assert (=> start!109508 true))

(declare-fun e!739952 () Bool)

(declare-fun array_inv!31519 (array!86290) Bool)

(assert (=> start!109508 (and (array_inv!31519 _values!1445) e!739952)))

(declare-fun array_inv!31520 (array!86292) Bool)

(assert (=> start!109508 (array_inv!31520 _keys!1741)))

(assert (=> start!109508 tp!102110))

(declare-fun b!1297000 () Bool)

(declare-fun res!861968 () Bool)

(assert (=> b!1297000 (=> (not res!861968) (not e!739949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86292 (_ BitVec 32)) Bool)

(assert (=> b!1297000 (= res!861968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297001 () Bool)

(declare-fun e!739948 () Bool)

(assert (=> b!1297001 (= e!739948 tp_is_empty!34637)))

(declare-fun b!1297002 () Bool)

(declare-fun res!861972 () Bool)

(assert (=> b!1297002 (=> (not res!861972) (not e!739949))))

(declare-datatypes ((List!29548 0))(
  ( (Nil!29545) (Cons!29544 (h!30753 (_ BitVec 64)) (t!43112 List!29548)) )
))
(declare-fun arrayNoDuplicates!0 (array!86292 (_ BitVec 32) List!29548) Bool)

(assert (=> b!1297002 (= res!861972 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29545))))

(declare-fun b!1297003 () Bool)

(declare-fun e!739951 () Bool)

(assert (=> b!1297003 (= e!739951 tp_is_empty!34637)))

(declare-fun b!1297004 () Bool)

(declare-fun res!861971 () Bool)

(assert (=> b!1297004 (=> (not res!861971) (not e!739949))))

(assert (=> b!1297004 (= res!861971 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42197 _keys!1741))))))

(declare-fun mapNonEmpty!53516 () Bool)

(declare-fun mapRes!53516 () Bool)

(declare-fun tp!102109 () Bool)

(assert (=> mapNonEmpty!53516 (= mapRes!53516 (and tp!102109 e!739948))))

(declare-fun mapKey!53516 () (_ BitVec 32))

(declare-fun mapRest!53516 () (Array (_ BitVec 32) ValueCell!16420))

(declare-fun mapValue!53516 () ValueCell!16420)

(assert (=> mapNonEmpty!53516 (= (arr!41646 _values!1445) (store mapRest!53516 mapKey!53516 mapValue!53516))))

(declare-fun mapIsEmpty!53516 () Bool)

(assert (=> mapIsEmpty!53516 mapRes!53516))

(declare-fun b!1297005 () Bool)

(declare-fun res!861970 () Bool)

(assert (=> b!1297005 (=> (not res!861970) (not e!739949))))

(assert (=> b!1297005 (= res!861970 (and (= (size!42196 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42197 _keys!1741) (size!42196 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297006 () Bool)

(assert (=> b!1297006 (= e!739952 (and e!739951 mapRes!53516))))

(declare-fun condMapEmpty!53516 () Bool)

(declare-fun mapDefault!53516 () ValueCell!16420)

