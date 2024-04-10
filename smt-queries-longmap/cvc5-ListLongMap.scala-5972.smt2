; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77658 () Bool)

(assert start!77658)

(declare-fun b_free!16243 () Bool)

(declare-fun b_next!16243 () Bool)

(assert (=> start!77658 (= b_free!16243 (not b_next!16243))))

(declare-fun tp!56991 () Bool)

(declare-fun b_and!26639 () Bool)

(assert (=> start!77658 (= tp!56991 b_and!26639)))

(declare-fun b!905492 () Bool)

(declare-fun e!507413 () Bool)

(assert (=> b!905492 (= e!507413 true)))

(declare-datatypes ((V!29847 0))(
  ( (V!29848 (val!9381 Int)) )
))
(declare-datatypes ((tuple2!12202 0))(
  ( (tuple2!12203 (_1!6112 (_ BitVec 64)) (_2!6112 V!29847)) )
))
(declare-datatypes ((List!18013 0))(
  ( (Nil!18010) (Cons!18009 (h!19155 tuple2!12202) (t!25428 List!18013)) )
))
(declare-datatypes ((ListLongMap!10899 0))(
  ( (ListLongMap!10900 (toList!5465 List!18013)) )
))
(declare-fun lt!408572 () ListLongMap!10899)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!408574 () V!29847)

(declare-fun apply!454 (ListLongMap!10899 (_ BitVec 64)) V!29847)

(assert (=> b!905492 (= (apply!454 lt!408572 k!1033) lt!408574)))

(declare-datatypes ((ValueCell!8849 0))(
  ( (ValueCellFull!8849 (v!11886 V!29847)) (EmptyCell!8849) )
))
(declare-datatypes ((array!53364 0))(
  ( (array!53365 (arr!25641 (Array (_ BitVec 32) ValueCell!8849)) (size!26100 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53364)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29847)

(declare-datatypes ((array!53366 0))(
  ( (array!53367 (arr!25642 (Array (_ BitVec 32) (_ BitVec 64))) (size!26101 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53366)

(declare-datatypes ((Unit!30722 0))(
  ( (Unit!30723) )
))
(declare-fun lt!408576 () Unit!30722)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29847)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!9 (array!53366 array!53364 (_ BitVec 32) (_ BitVec 32) V!29847 V!29847 (_ BitVec 64) V!29847 (_ BitVec 32) Int) Unit!30722)

(assert (=> b!905492 (= lt!408576 (lemmaListMapApplyFromThenApplyFromZero!9 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408574 i!717 defaultEntry!1160))))

(declare-fun b!905493 () Bool)

(declare-fun e!507411 () Bool)

(declare-fun e!507410 () Bool)

(declare-fun mapRes!29704 () Bool)

(assert (=> b!905493 (= e!507411 (and e!507410 mapRes!29704))))

(declare-fun condMapEmpty!29704 () Bool)

(declare-fun mapDefault!29704 () ValueCell!8849)

