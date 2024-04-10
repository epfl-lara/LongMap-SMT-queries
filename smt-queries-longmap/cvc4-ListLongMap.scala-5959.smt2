; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77584 () Bool)

(assert start!77584)

(declare-fun b_free!16169 () Bool)

(declare-fun b_next!16169 () Bool)

(assert (=> start!77584 (= b_free!16169 (not b_next!16169))))

(declare-fun tp!56769 () Bool)

(declare-fun b_and!26535 () Bool)

(assert (=> start!77584 (= tp!56769 b_and!26535)))

(declare-fun b!904083 () Bool)

(declare-fun res!609989 () Bool)

(declare-fun e!506592 () Bool)

(assert (=> b!904083 (=> (not res!609989) (not e!506592))))

(declare-datatypes ((V!29747 0))(
  ( (V!29748 (val!9344 Int)) )
))
(declare-datatypes ((ValueCell!8812 0))(
  ( (ValueCellFull!8812 (v!11849 V!29747)) (EmptyCell!8812) )
))
(declare-datatypes ((array!53226 0))(
  ( (array!53227 (arr!25572 (Array (_ BitVec 32) ValueCell!8812)) (size!26031 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53226)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29747)

(declare-datatypes ((array!53228 0))(
  ( (array!53229 (arr!25573 (Array (_ BitVec 32) (_ BitVec 64))) (size!26032 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53228)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29747)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12140 0))(
  ( (tuple2!12141 (_1!6081 (_ BitVec 64)) (_2!6081 V!29747)) )
))
(declare-datatypes ((List!17959 0))(
  ( (Nil!17956) (Cons!17955 (h!19101 tuple2!12140) (t!25342 List!17959)) )
))
(declare-datatypes ((ListLongMap!10837 0))(
  ( (ListLongMap!10838 (toList!5434 List!17959)) )
))
(declare-fun contains!4482 (ListLongMap!10837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2703 (array!53228 array!53226 (_ BitVec 32) (_ BitVec 32) V!29747 V!29747 (_ BitVec 32) Int) ListLongMap!10837)

(assert (=> b!904083 (= res!609989 (contains!4482 (getCurrentListMap!2703 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904084 () Bool)

(declare-fun res!609991 () Bool)

(assert (=> b!904084 (=> (not res!609991) (not e!506592))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904084 (= res!609991 (and (= (select (arr!25573 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904085 () Bool)

(declare-fun e!506589 () Bool)

(assert (=> b!904085 (= e!506592 (not e!506589))))

(declare-fun res!609986 () Bool)

(assert (=> b!904085 (=> res!609986 e!506589)))

(assert (=> b!904085 (= res!609986 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26032 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904085 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30664 0))(
  ( (Unit!30665) )
))
(declare-fun lt!408146 () Unit!30664)

(declare-fun lemmaKeyInListMapIsInArray!175 (array!53228 array!53226 (_ BitVec 32) (_ BitVec 32) V!29747 V!29747 (_ BitVec 64) Int) Unit!30664)

(assert (=> b!904085 (= lt!408146 (lemmaKeyInListMapIsInArray!175 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904086 () Bool)

(declare-fun e!506588 () Bool)

(declare-fun tp_is_empty!18587 () Bool)

(assert (=> b!904086 (= e!506588 tp_is_empty!18587)))

(declare-fun res!609985 () Bool)

(assert (=> start!77584 (=> (not res!609985) (not e!506592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77584 (= res!609985 (validMask!0 mask!1756))))

(assert (=> start!77584 e!506592))

(declare-fun e!506590 () Bool)

(declare-fun array_inv!20038 (array!53226) Bool)

(assert (=> start!77584 (and (array_inv!20038 _values!1152) e!506590)))

(assert (=> start!77584 tp!56769))

(assert (=> start!77584 true))

(assert (=> start!77584 tp_is_empty!18587))

(declare-fun array_inv!20039 (array!53228) Bool)

(assert (=> start!77584 (array_inv!20039 _keys!1386)))

(declare-fun b!904087 () Bool)

(declare-fun e!506591 () Bool)

(assert (=> b!904087 (= e!506589 e!506591)))

(declare-fun res!609987 () Bool)

(assert (=> b!904087 (=> res!609987 e!506591)))

(declare-fun lt!408147 () ListLongMap!10837)

(assert (=> b!904087 (= res!609987 (not (contains!4482 lt!408147 k!1033)))))

(assert (=> b!904087 (= lt!408147 (getCurrentListMap!2703 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904088 () Bool)

(declare-fun res!609990 () Bool)

(assert (=> b!904088 (=> (not res!609990) (not e!506592))))

(assert (=> b!904088 (= res!609990 (and (= (size!26031 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26032 _keys!1386) (size!26031 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904089 () Bool)

(assert (=> b!904089 (= e!506591 true)))

(declare-fun lt!408145 () V!29747)

(declare-fun apply!431 (ListLongMap!10837 (_ BitVec 64)) V!29747)

(assert (=> b!904089 (= lt!408145 (apply!431 lt!408147 k!1033))))

(declare-fun mapNonEmpty!29593 () Bool)

(declare-fun mapRes!29593 () Bool)

(declare-fun tp!56768 () Bool)

(declare-fun e!506587 () Bool)

(assert (=> mapNonEmpty!29593 (= mapRes!29593 (and tp!56768 e!506587))))

(declare-fun mapValue!29593 () ValueCell!8812)

(declare-fun mapRest!29593 () (Array (_ BitVec 32) ValueCell!8812))

(declare-fun mapKey!29593 () (_ BitVec 32))

(assert (=> mapNonEmpty!29593 (= (arr!25572 _values!1152) (store mapRest!29593 mapKey!29593 mapValue!29593))))

(declare-fun b!904090 () Bool)

(assert (=> b!904090 (= e!506590 (and e!506588 mapRes!29593))))

(declare-fun condMapEmpty!29593 () Bool)

(declare-fun mapDefault!29593 () ValueCell!8812)

