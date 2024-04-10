; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77760 () Bool)

(assert start!77760)

(declare-fun b_free!16345 () Bool)

(declare-fun b_next!16345 () Bool)

(assert (=> start!77760 (= b_free!16345 (not b_next!16345))))

(declare-fun tp!57296 () Bool)

(declare-fun b_and!26843 () Bool)

(assert (=> start!77760 (= tp!57296 b_and!26843)))

(declare-fun mapNonEmpty!29857 () Bool)

(declare-fun mapRes!29857 () Bool)

(declare-fun tp!57297 () Bool)

(declare-fun e!508634 () Bool)

(assert (=> mapNonEmpty!29857 (= mapRes!29857 (and tp!57297 e!508634))))

(declare-datatypes ((V!29983 0))(
  ( (V!29984 (val!9432 Int)) )
))
(declare-datatypes ((ValueCell!8900 0))(
  ( (ValueCellFull!8900 (v!11937 V!29983)) (EmptyCell!8900) )
))
(declare-datatypes ((array!53558 0))(
  ( (array!53559 (arr!25738 (Array (_ BitVec 32) ValueCell!8900)) (size!26197 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53558)

(declare-fun mapRest!29857 () (Array (_ BitVec 32) ValueCell!8900))

(declare-fun mapKey!29857 () (_ BitVec 32))

(declare-fun mapValue!29857 () ValueCell!8900)

(assert (=> mapNonEmpty!29857 (= (arr!25738 _values!1152) (store mapRest!29857 mapKey!29857 mapValue!29857))))

(declare-fun b!907584 () Bool)

(declare-fun res!612562 () Bool)

(declare-fun e!508640 () Bool)

(assert (=> b!907584 (=> (not res!612562) (not e!508640))))

(declare-datatypes ((array!53560 0))(
  ( (array!53561 (arr!25739 (Array (_ BitVec 32) (_ BitVec 64))) (size!26198 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53560)

(declare-datatypes ((List!18084 0))(
  ( (Nil!18081) (Cons!18080 (h!19226 (_ BitVec 64)) (t!25601 List!18084)) )
))
(declare-fun arrayNoDuplicates!0 (array!53560 (_ BitVec 32) List!18084) Bool)

(assert (=> b!907584 (= res!612562 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18081))))

(declare-fun b!907585 () Bool)

(declare-fun e!508635 () Bool)

(declare-fun tp_is_empty!18763 () Bool)

(assert (=> b!907585 (= e!508635 tp_is_empty!18763)))

(declare-fun b!907586 () Bool)

(declare-fun res!612566 () Bool)

(assert (=> b!907586 (=> (not res!612566) (not e!508640))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!907586 (= res!612566 (and (= (size!26197 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26198 _keys!1386) (size!26197 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907587 () Bool)

(declare-fun e!508637 () Bool)

(assert (=> b!907587 (= e!508637 (or (bvsge #b00000000000000000000000000000000 (size!26198 _keys!1386)) (bvslt (size!26198 _keys!1386) #b01111111111111111111111111111111)))))

(declare-datatypes ((tuple2!12284 0))(
  ( (tuple2!12285 (_1!6153 (_ BitVec 64)) (_2!6153 V!29983)) )
))
(declare-datatypes ((List!18085 0))(
  ( (Nil!18082) (Cons!18081 (h!19227 tuple2!12284) (t!25602 List!18085)) )
))
(declare-datatypes ((ListLongMap!10981 0))(
  ( (ListLongMap!10982 (toList!5506 List!18085)) )
))
(declare-fun lt!409340 () ListLongMap!10981)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!409339 () V!29983)

(declare-fun apply!490 (ListLongMap!10981 (_ BitVec 64)) V!29983)

(assert (=> b!907587 (= (apply!490 lt!409340 k!1033) lt!409339)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29983)

(declare-datatypes ((Unit!30802 0))(
  ( (Unit!30803) )
))
(declare-fun lt!409337 () Unit!30802)

(declare-fun minValue!1094 () V!29983)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!43 (array!53560 array!53558 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) V!29983 (_ BitVec 32) Int) Unit!30802)

(assert (=> b!907587 (= lt!409337 (lemmaListMapApplyFromThenApplyFromZero!43 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409339 i!717 defaultEntry!1160))))

(declare-fun b!907588 () Bool)

(declare-fun res!612569 () Bool)

(declare-fun e!508638 () Bool)

(assert (=> b!907588 (=> (not res!612569) (not e!508638))))

(assert (=> b!907588 (= res!612569 (and (= (select (arr!25739 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907589 () Bool)

(declare-fun e!508641 () Bool)

(assert (=> b!907589 (= e!508641 (and e!508635 mapRes!29857))))

(declare-fun condMapEmpty!29857 () Bool)

(declare-fun mapDefault!29857 () ValueCell!8900)

