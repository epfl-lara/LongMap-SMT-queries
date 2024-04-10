; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77562 () Bool)

(assert start!77562)

(declare-fun b_free!16147 () Bool)

(declare-fun b_next!16147 () Bool)

(assert (=> start!77562 (= b_free!16147 (not b_next!16147))))

(declare-fun tp!56703 () Bool)

(declare-fun b_and!26513 () Bool)

(assert (=> start!77562 (= tp!56703 b_and!26513)))

(declare-fun b!903687 () Bool)

(declare-fun res!609689 () Bool)

(declare-fun e!506361 () Bool)

(assert (=> b!903687 (=> (not res!609689) (not e!506361))))

(declare-datatypes ((array!53182 0))(
  ( (array!53183 (arr!25550 (Array (_ BitVec 32) (_ BitVec 64))) (size!26009 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53182)

(declare-datatypes ((List!17939 0))(
  ( (Nil!17936) (Cons!17935 (h!19081 (_ BitVec 64)) (t!25322 List!17939)) )
))
(declare-fun arrayNoDuplicates!0 (array!53182 (_ BitVec 32) List!17939) Bool)

(assert (=> b!903687 (= res!609689 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17936))))

(declare-fun b!903688 () Bool)

(declare-fun res!609695 () Bool)

(assert (=> b!903688 (=> (not res!609695) (not e!506361))))

(declare-datatypes ((V!29719 0))(
  ( (V!29720 (val!9333 Int)) )
))
(declare-datatypes ((ValueCell!8801 0))(
  ( (ValueCellFull!8801 (v!11838 V!29719)) (EmptyCell!8801) )
))
(declare-datatypes ((array!53184 0))(
  ( (array!53185 (arr!25551 (Array (_ BitVec 32) ValueCell!8801)) (size!26010 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53184)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903688 (= res!609695 (and (= (size!26010 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26009 _keys!1386) (size!26010 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903689 () Bool)

(declare-fun e!506360 () Bool)

(assert (=> b!903689 (= e!506360 true)))

(declare-fun lt!408048 () V!29719)

(declare-datatypes ((tuple2!12120 0))(
  ( (tuple2!12121 (_1!6071 (_ BitVec 64)) (_2!6071 V!29719)) )
))
(declare-datatypes ((List!17940 0))(
  ( (Nil!17937) (Cons!17936 (h!19082 tuple2!12120) (t!25323 List!17940)) )
))
(declare-datatypes ((ListLongMap!10817 0))(
  ( (ListLongMap!10818 (toList!5424 List!17940)) )
))
(declare-fun lt!408046 () ListLongMap!10817)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!422 (ListLongMap!10817 (_ BitVec 64)) V!29719)

(assert (=> b!903689 (= lt!408048 (apply!422 lt!408046 k!1033))))

(declare-fun mapIsEmpty!29560 () Bool)

(declare-fun mapRes!29560 () Bool)

(assert (=> mapIsEmpty!29560 mapRes!29560))

(declare-fun b!903691 () Bool)

(declare-fun e!506355 () Bool)

(declare-fun tp_is_empty!18565 () Bool)

(assert (=> b!903691 (= e!506355 tp_is_empty!18565)))

(declare-fun b!903692 () Bool)

(declare-fun res!609692 () Bool)

(assert (=> b!903692 (=> (not res!609692) (not e!506361))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29719)

(declare-fun minValue!1094 () V!29719)

(declare-fun contains!4472 (ListLongMap!10817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2693 (array!53182 array!53184 (_ BitVec 32) (_ BitVec 32) V!29719 V!29719 (_ BitVec 32) Int) ListLongMap!10817)

(assert (=> b!903692 (= res!609692 (contains!4472 (getCurrentListMap!2693 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903693 () Bool)

(declare-fun res!609691 () Bool)

(assert (=> b!903693 (=> (not res!609691) (not e!506361))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903693 (= res!609691 (inRange!0 i!717 mask!1756))))

(declare-fun b!903694 () Bool)

(declare-fun e!506359 () Bool)

(assert (=> b!903694 (= e!506359 (and e!506355 mapRes!29560))))

(declare-fun condMapEmpty!29560 () Bool)

(declare-fun mapDefault!29560 () ValueCell!8801)

