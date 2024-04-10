; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4222 () Bool)

(assert start!4222)

(declare-fun b_free!1127 () Bool)

(declare-fun b_next!1127 () Bool)

(assert (=> start!4222 (= b_free!1127 (not b_next!1127))))

(declare-fun tp!4800 () Bool)

(declare-fun b_and!1937 () Bool)

(assert (=> start!4222 (= tp!4800 b_and!1937)))

(declare-fun res!19623 () Bool)

(declare-fun e!20515 () Bool)

(assert (=> start!4222 (=> (not res!19623) (not e!20515))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4222 (= res!19623 (validMask!0 mask!2294))))

(assert (=> start!4222 e!20515))

(assert (=> start!4222 true))

(assert (=> start!4222 tp!4800))

(declare-datatypes ((V!1799 0))(
  ( (V!1800 (val!767 Int)) )
))
(declare-datatypes ((ValueCell!541 0))(
  ( (ValueCellFull!541 (v!1856 V!1799)) (EmptyCell!541) )
))
(declare-datatypes ((array!2171 0))(
  ( (array!2172 (arr!1039 (Array (_ BitVec 32) ValueCell!541)) (size!1140 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2171)

(declare-fun e!20516 () Bool)

(declare-fun array_inv!725 (array!2171) Bool)

(assert (=> start!4222 (and (array_inv!725 _values!1501) e!20516)))

(declare-datatypes ((array!2173 0))(
  ( (array!2174 (arr!1040 (Array (_ BitVec 32) (_ BitVec 64))) (size!1141 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2173)

(declare-fun array_inv!726 (array!2173) Bool)

(assert (=> start!4222 (array_inv!726 _keys!1833)))

(declare-fun tp_is_empty!1481 () Bool)

(assert (=> start!4222 tp_is_empty!1481))

(declare-fun mapIsEmpty!1750 () Bool)

(declare-fun mapRes!1750 () Bool)

(assert (=> mapIsEmpty!1750 mapRes!1750))

(declare-fun b!32277 () Bool)

(declare-fun lt!11651 () (_ BitVec 32))

(assert (=> b!32277 (= e!20515 (or (bvslt lt!11651 #b00000000000000000000000000000000) (bvsge lt!11651 (size!1141 _keys!1833))))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2173 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32277 (= lt!11651 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32278 () Bool)

(declare-fun res!19626 () Bool)

(assert (=> b!32278 (=> (not res!19626) (not e!20515))))

(declare-fun arrayContainsKey!0 (array!2173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32278 (= res!19626 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32279 () Bool)

(declare-fun e!20518 () Bool)

(assert (=> b!32279 (= e!20518 tp_is_empty!1481)))

(declare-fun b!32280 () Bool)

(declare-fun res!19625 () Bool)

(assert (=> b!32280 (=> (not res!19625) (not e!20515))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!32280 (= res!19625 (and (= (size!1140 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1141 _keys!1833) (size!1140 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32281 () Bool)

(declare-fun e!20517 () Bool)

(assert (=> b!32281 (= e!20517 tp_is_empty!1481)))

(declare-fun b!32282 () Bool)

(declare-fun res!19629 () Bool)

(assert (=> b!32282 (=> (not res!19629) (not e!20515))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1799)

(declare-fun minValue!1443 () V!1799)

(declare-datatypes ((tuple2!1246 0))(
  ( (tuple2!1247 (_1!634 (_ BitVec 64)) (_2!634 V!1799)) )
))
(declare-datatypes ((List!840 0))(
  ( (Nil!837) (Cons!836 (h!1403 tuple2!1246) (t!3533 List!840)) )
))
(declare-datatypes ((ListLongMap!823 0))(
  ( (ListLongMap!824 (toList!427 List!840)) )
))
(declare-fun contains!367 (ListLongMap!823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!255 (array!2173 array!2171 (_ BitVec 32) (_ BitVec 32) V!1799 V!1799 (_ BitVec 32) Int) ListLongMap!823)

(assert (=> b!32282 (= res!19629 (not (contains!367 (getCurrentListMap!255 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!32283 () Bool)

(assert (=> b!32283 (= e!20516 (and e!20518 mapRes!1750))))

(declare-fun condMapEmpty!1750 () Bool)

(declare-fun mapDefault!1750 () ValueCell!541)

