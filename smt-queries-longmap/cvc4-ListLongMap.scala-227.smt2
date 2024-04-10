; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4048 () Bool)

(assert start!4048)

(declare-fun b_free!953 () Bool)

(declare-fun b_next!953 () Bool)

(assert (=> start!4048 (= b_free!953 (not b_next!953))))

(declare-fun tp!4279 () Bool)

(declare-fun b_and!1763 () Bool)

(assert (=> start!4048 (= tp!4279 b_and!1763)))

(declare-fun b!29703 () Bool)

(declare-fun res!17837 () Bool)

(declare-fun e!19159 () Bool)

(assert (=> b!29703 (=> (not res!17837) (not e!19159))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1567 0))(
  ( (V!1568 (val!680 Int)) )
))
(declare-datatypes ((ValueCell!454 0))(
  ( (ValueCellFull!454 (v!1769 V!1567)) (EmptyCell!454) )
))
(declare-datatypes ((array!1845 0))(
  ( (array!1846 (arr!876 (Array (_ BitVec 32) ValueCell!454)) (size!977 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1845)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1847 0))(
  ( (array!1848 (arr!877 (Array (_ BitVec 32) (_ BitVec 64))) (size!978 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1847)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1567)

(declare-fun minValue!1443 () V!1567)

(declare-datatypes ((tuple2!1126 0))(
  ( (tuple2!1127 (_1!574 (_ BitVec 64)) (_2!574 V!1567)) )
))
(declare-datatypes ((List!726 0))(
  ( (Nil!723) (Cons!722 (h!1289 tuple2!1126) (t!3419 List!726)) )
))
(declare-datatypes ((ListLongMap!703 0))(
  ( (ListLongMap!704 (toList!367 List!726)) )
))
(declare-fun contains!307 (ListLongMap!703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!195 (array!1847 array!1845 (_ BitVec 32) (_ BitVec 32) V!1567 V!1567 (_ BitVec 32) Int) ListLongMap!703)

(assert (=> b!29703 (= res!17837 (not (contains!307 (getCurrentListMap!195 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun res!17836 () Bool)

(assert (=> start!4048 (=> (not res!17836) (not e!19159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4048 (= res!17836 (validMask!0 mask!2294))))

(assert (=> start!4048 e!19159))

(assert (=> start!4048 true))

(assert (=> start!4048 tp!4279))

(declare-fun e!19157 () Bool)

(declare-fun array_inv!611 (array!1845) Bool)

(assert (=> start!4048 (and (array_inv!611 _values!1501) e!19157)))

(declare-fun array_inv!612 (array!1847) Bool)

(assert (=> start!4048 (array_inv!612 _keys!1833)))

(declare-fun tp_is_empty!1307 () Bool)

(assert (=> start!4048 tp_is_empty!1307))

(declare-fun b!29704 () Bool)

(declare-fun e!19158 () Bool)

(assert (=> b!29704 (= e!19158 tp_is_empty!1307)))

(declare-fun b!29705 () Bool)

(declare-fun e!19160 () Bool)

(assert (=> b!29705 (= e!19160 tp_is_empty!1307)))

(declare-fun b!29706 () Bool)

(declare-fun mapRes!1489 () Bool)

(assert (=> b!29706 (= e!19157 (and e!19158 mapRes!1489))))

(declare-fun condMapEmpty!1489 () Bool)

(declare-fun mapDefault!1489 () ValueCell!454)

