; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77764 () Bool)

(assert start!77764)

(declare-fun b_free!16349 () Bool)

(declare-fun b_next!16349 () Bool)

(assert (=> start!77764 (= b_free!16349 (not b_next!16349))))

(declare-fun tp!57308 () Bool)

(declare-fun b_and!26851 () Bool)

(assert (=> start!77764 (= tp!57308 b_and!26851)))

(declare-fun b!907665 () Bool)

(declare-fun e!508689 () Bool)

(declare-fun e!508683 () Bool)

(assert (=> b!907665 (= e!508689 (not e!508683))))

(declare-fun res!612628 () Bool)

(assert (=> b!907665 (=> res!612628 e!508683)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53566 0))(
  ( (array!53567 (arr!25742 (Array (_ BitVec 32) (_ BitVec 64))) (size!26201 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53566)

(assert (=> b!907665 (= res!612628 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26201 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((V!29987 0))(
  ( (V!29988 (val!9434 Int)) )
))
(declare-fun lt!409370 () V!29987)

(declare-datatypes ((ValueCell!8902 0))(
  ( (ValueCellFull!8902 (v!11939 V!29987)) (EmptyCell!8902) )
))
(declare-datatypes ((array!53568 0))(
  ( (array!53569 (arr!25743 (Array (_ BitVec 32) ValueCell!8902)) (size!26202 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53568)

(declare-fun get!13543 (ValueCell!8902 V!29987) V!29987)

(declare-fun dynLambda!1367 (Int (_ BitVec 64)) V!29987)

(assert (=> b!907665 (= lt!409370 (get!13543 (select (arr!25743 _values!1152) i!717) (dynLambda!1367 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907665 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30806 0))(
  ( (Unit!30807) )
))
(declare-fun lt!409371 () Unit!30806)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29987)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29987)

(declare-fun lemmaKeyInListMapIsInArray!239 (array!53566 array!53568 (_ BitVec 32) (_ BitVec 32) V!29987 V!29987 (_ BitVec 64) Int) Unit!30806)

(assert (=> b!907665 (= lt!409371 (lemmaKeyInListMapIsInArray!239 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!907666 () Bool)

(declare-fun e!508688 () Bool)

(declare-fun e!508686 () Bool)

(declare-fun mapRes!29863 () Bool)

(assert (=> b!907666 (= e!508688 (and e!508686 mapRes!29863))))

(declare-fun condMapEmpty!29863 () Bool)

(declare-fun mapDefault!29863 () ValueCell!8902)

