; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4054 () Bool)

(assert start!4054)

(declare-fun b_free!959 () Bool)

(declare-fun b_next!959 () Bool)

(assert (=> start!4054 (= b_free!959 (not b_next!959))))

(declare-fun tp!4297 () Bool)

(declare-fun b_and!1769 () Bool)

(assert (=> start!4054 (= tp!4297 b_and!1769)))

(declare-fun b!29777 () Bool)

(declare-fun e!19205 () Bool)

(assert (=> b!29777 (= e!19205 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1575 0))(
  ( (V!1576 (val!683 Int)) )
))
(declare-datatypes ((ValueCell!457 0))(
  ( (ValueCellFull!457 (v!1772 V!1575)) (EmptyCell!457) )
))
(declare-datatypes ((array!1857 0))(
  ( (array!1858 (arr!882 (Array (_ BitVec 32) ValueCell!457)) (size!983 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1857)

(declare-datatypes ((array!1859 0))(
  ( (array!1860 (arr!883 (Array (_ BitVec 32) (_ BitVec 64))) (size!984 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1859)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun lt!11354 () Bool)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1575)

(declare-fun minValue!1443 () V!1575)

(declare-datatypes ((tuple2!1132 0))(
  ( (tuple2!1133 (_1!577 (_ BitVec 64)) (_2!577 V!1575)) )
))
(declare-datatypes ((List!730 0))(
  ( (Nil!727) (Cons!726 (h!1293 tuple2!1132) (t!3423 List!730)) )
))
(declare-datatypes ((ListLongMap!709 0))(
  ( (ListLongMap!710 (toList!370 List!730)) )
))
(declare-fun contains!310 (ListLongMap!709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!198 (array!1859 array!1857 (_ BitVec 32) (_ BitVec 32) V!1575 V!1575 (_ BitVec 32) Int) ListLongMap!709)

(assert (=> b!29777 (= lt!11354 (contains!310 (getCurrentListMap!198 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun b!29778 () Bool)

(declare-fun e!19204 () Bool)

(declare-fun tp_is_empty!1313 () Bool)

(assert (=> b!29778 (= e!19204 tp_is_empty!1313)))

(declare-fun b!29779 () Bool)

(declare-fun res!17880 () Bool)

(assert (=> b!29779 (=> (not res!17880) (not e!19205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1859 (_ BitVec 32)) Bool)

(assert (=> b!29779 (= res!17880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29780 () Bool)

(declare-fun e!19202 () Bool)

(assert (=> b!29780 (= e!19202 tp_is_empty!1313)))

(declare-fun b!29781 () Bool)

(declare-fun e!19203 () Bool)

(declare-fun mapRes!1498 () Bool)

(assert (=> b!29781 (= e!19203 (and e!19202 mapRes!1498))))

(declare-fun condMapEmpty!1498 () Bool)

(declare-fun mapDefault!1498 () ValueCell!457)

