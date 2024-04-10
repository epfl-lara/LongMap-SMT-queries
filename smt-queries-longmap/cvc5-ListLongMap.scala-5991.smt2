; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77798 () Bool)

(assert start!77798)

(declare-fun b_free!16357 () Bool)

(declare-fun b_next!16357 () Bool)

(assert (=> start!77798 (= b_free!16357 (not b_next!16357))))

(declare-fun tp!57336 () Bool)

(declare-fun b_and!26871 () Bool)

(assert (=> start!77798 (= tp!57336 b_and!26871)))

(declare-fun b!907981 () Bool)

(declare-fun res!612810 () Bool)

(declare-fun e!508882 () Bool)

(assert (=> b!907981 (=> (not res!612810) (not e!508882))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53584 0))(
  ( (array!53585 (arr!25750 (Array (_ BitVec 32) (_ BitVec 64))) (size!26209 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53584)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!907981 (= res!612810 (and (= (select (arr!25750 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907982 () Bool)

(declare-fun e!508887 () Bool)

(assert (=> b!907982 (= e!508887 true)))

(declare-datatypes ((V!29999 0))(
  ( (V!30000 (val!9438 Int)) )
))
(declare-datatypes ((tuple2!12292 0))(
  ( (tuple2!12293 (_1!6157 (_ BitVec 64)) (_2!6157 V!29999)) )
))
(declare-datatypes ((List!18091 0))(
  ( (Nil!18088) (Cons!18087 (h!19233 tuple2!12292) (t!25620 List!18091)) )
))
(declare-datatypes ((ListLongMap!10989 0))(
  ( (ListLongMap!10990 (toList!5510 List!18091)) )
))
(declare-fun lt!409546 () ListLongMap!10989)

(declare-fun lt!409549 () V!29999)

(declare-fun apply!494 (ListLongMap!10989 (_ BitVec 64)) V!29999)

(assert (=> b!907982 (= (apply!494 lt!409546 k!1033) lt!409549)))

(declare-datatypes ((ValueCell!8906 0))(
  ( (ValueCellFull!8906 (v!11945 V!29999)) (EmptyCell!8906) )
))
(declare-datatypes ((array!53586 0))(
  ( (array!53587 (arr!25751 (Array (_ BitVec 32) ValueCell!8906)) (size!26210 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53586)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29999)

(declare-datatypes ((Unit!30818 0))(
  ( (Unit!30819) )
))
(declare-fun lt!409548 () Unit!30818)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29999)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!47 (array!53584 array!53586 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 64) V!29999 (_ BitVec 32) Int) Unit!30818)

(assert (=> b!907982 (= lt!409548 (lemmaListMapApplyFromThenApplyFromZero!47 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409549 i!717 defaultEntry!1160))))

(declare-fun b!907983 () Bool)

(declare-fun res!612804 () Bool)

(assert (=> b!907983 (=> (not res!612804) (not e!508882))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907983 (= res!612804 (inRange!0 i!717 mask!1756))))

(declare-fun b!907984 () Bool)

(declare-fun e!508880 () Bool)

(assert (=> b!907984 (= e!508880 e!508882)))

(declare-fun res!612813 () Bool)

(assert (=> b!907984 (=> (not res!612813) (not e!508882))))

(declare-fun contains!4554 (ListLongMap!10989 (_ BitVec 64)) Bool)

(assert (=> b!907984 (= res!612813 (contains!4554 lt!409546 k!1033))))

(declare-fun getCurrentListMap!2774 (array!53584 array!53586 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 32) Int) ListLongMap!10989)

(assert (=> b!907984 (= lt!409546 (getCurrentListMap!2774 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun res!612809 () Bool)

(assert (=> start!77798 (=> (not res!612809) (not e!508880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77798 (= res!612809 (validMask!0 mask!1756))))

(assert (=> start!77798 e!508880))

(declare-fun e!508881 () Bool)

(declare-fun array_inv!20162 (array!53586) Bool)

(assert (=> start!77798 (and (array_inv!20162 _values!1152) e!508881)))

(assert (=> start!77798 tp!57336))

(assert (=> start!77798 true))

(declare-fun tp_is_empty!18775 () Bool)

(assert (=> start!77798 tp_is_empty!18775))

(declare-fun array_inv!20163 (array!53584) Bool)

(assert (=> start!77798 (array_inv!20163 _keys!1386)))

(declare-fun b!907985 () Bool)

(declare-fun e!508884 () Bool)

(declare-fun mapRes!29878 () Bool)

(assert (=> b!907985 (= e!508881 (and e!508884 mapRes!29878))))

(declare-fun condMapEmpty!29878 () Bool)

(declare-fun mapDefault!29878 () ValueCell!8906)

