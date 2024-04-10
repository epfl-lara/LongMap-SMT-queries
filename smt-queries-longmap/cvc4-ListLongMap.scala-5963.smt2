; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77608 () Bool)

(assert start!77608)

(declare-fun b_free!16193 () Bool)

(declare-fun b_next!16193 () Bool)

(assert (=> start!77608 (= b_free!16193 (not b_next!16193))))

(declare-fun tp!56840 () Bool)

(declare-fun b_and!26559 () Bool)

(assert (=> start!77608 (= tp!56840 b_and!26559)))

(declare-fun b!904515 () Bool)

(declare-fun e!506844 () Bool)

(declare-fun e!506840 () Bool)

(assert (=> b!904515 (= e!506844 (not e!506840))))

(declare-fun res!610311 () Bool)

(assert (=> b!904515 (=> res!610311 e!506840)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53266 0))(
  ( (array!53267 (arr!25592 (Array (_ BitVec 32) (_ BitVec 64))) (size!26051 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53266)

(assert (=> b!904515 (= res!610311 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26051 _keys!1386))))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904515 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!29779 0))(
  ( (V!29780 (val!9356 Int)) )
))
(declare-datatypes ((ValueCell!8824 0))(
  ( (ValueCellFull!8824 (v!11861 V!29779)) (EmptyCell!8824) )
))
(declare-datatypes ((array!53268 0))(
  ( (array!53269 (arr!25593 (Array (_ BitVec 32) ValueCell!8824)) (size!26052 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53268)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30678 0))(
  ( (Unit!30679) )
))
(declare-fun lt!408254 () Unit!30678)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29779)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29779)

(declare-fun lemmaKeyInListMapIsInArray!182 (array!53266 array!53268 (_ BitVec 32) (_ BitVec 32) V!29779 V!29779 (_ BitVec 64) Int) Unit!30678)

(assert (=> b!904515 (= lt!408254 (lemmaKeyInListMapIsInArray!182 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29629 () Bool)

(declare-fun mapRes!29629 () Bool)

(declare-fun tp!56841 () Bool)

(declare-fun e!506839 () Bool)

(assert (=> mapNonEmpty!29629 (= mapRes!29629 (and tp!56841 e!506839))))

(declare-fun mapRest!29629 () (Array (_ BitVec 32) ValueCell!8824))

(declare-fun mapKey!29629 () (_ BitVec 32))

(declare-fun mapValue!29629 () ValueCell!8824)

(assert (=> mapNonEmpty!29629 (= (arr!25593 _values!1152) (store mapRest!29629 mapKey!29629 mapValue!29629))))

(declare-fun b!904516 () Bool)

(declare-fun res!610312 () Bool)

(assert (=> b!904516 (=> (not res!610312) (not e!506844))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904516 (= res!610312 (inRange!0 i!717 mask!1756))))

(declare-fun b!904517 () Bool)

(declare-fun e!506843 () Bool)

(assert (=> b!904517 (= e!506843 true)))

(declare-fun lt!408255 () V!29779)

(declare-datatypes ((tuple2!12156 0))(
  ( (tuple2!12157 (_1!6089 (_ BitVec 64)) (_2!6089 V!29779)) )
))
(declare-datatypes ((List!17973 0))(
  ( (Nil!17970) (Cons!17969 (h!19115 tuple2!12156) (t!25356 List!17973)) )
))
(declare-datatypes ((ListLongMap!10853 0))(
  ( (ListLongMap!10854 (toList!5442 List!17973)) )
))
(declare-fun lt!408253 () ListLongMap!10853)

(declare-fun apply!437 (ListLongMap!10853 (_ BitVec 64)) V!29779)

(assert (=> b!904517 (= lt!408255 (apply!437 lt!408253 k!1033))))

(declare-fun b!904518 () Bool)

(declare-fun e!506838 () Bool)

(declare-fun e!506841 () Bool)

(assert (=> b!904518 (= e!506838 (and e!506841 mapRes!29629))))

(declare-fun condMapEmpty!29629 () Bool)

(declare-fun mapDefault!29629 () ValueCell!8824)

