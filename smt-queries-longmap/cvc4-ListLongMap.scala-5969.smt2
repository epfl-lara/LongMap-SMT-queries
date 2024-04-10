; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77644 () Bool)

(assert start!77644)

(declare-fun b_free!16229 () Bool)

(declare-fun b_next!16229 () Bool)

(assert (=> start!77644 (= b_free!16229 (not b_next!16229))))

(declare-fun tp!56948 () Bool)

(declare-fun b_and!26611 () Bool)

(assert (=> start!77644 (= tp!56948 b_and!26611)))

(declare-fun b!905205 () Bool)

(declare-fun res!610823 () Bool)

(declare-fun e!507245 () Bool)

(assert (=> b!905205 (=> (not res!610823) (not e!507245))))

(declare-datatypes ((array!53338 0))(
  ( (array!53339 (arr!25628 (Array (_ BitVec 32) (_ BitVec 64))) (size!26087 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53338)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53338 (_ BitVec 32)) Bool)

(assert (=> b!905205 (= res!610823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!610825 () Bool)

(assert (=> start!77644 (=> (not res!610825) (not e!507245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77644 (= res!610825 (validMask!0 mask!1756))))

(assert (=> start!77644 e!507245))

(declare-datatypes ((V!29827 0))(
  ( (V!29828 (val!9374 Int)) )
))
(declare-datatypes ((ValueCell!8842 0))(
  ( (ValueCellFull!8842 (v!11879 V!29827)) (EmptyCell!8842) )
))
(declare-datatypes ((array!53340 0))(
  ( (array!53341 (arr!25629 (Array (_ BitVec 32) ValueCell!8842)) (size!26088 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53340)

(declare-fun e!507248 () Bool)

(declare-fun array_inv!20078 (array!53340) Bool)

(assert (=> start!77644 (and (array_inv!20078 _values!1152) e!507248)))

(assert (=> start!77644 tp!56948))

(assert (=> start!77644 true))

(declare-fun tp_is_empty!18647 () Bool)

(assert (=> start!77644 tp_is_empty!18647))

(declare-fun array_inv!20079 (array!53338) Bool)

(assert (=> start!77644 (array_inv!20079 _keys!1386)))

(declare-fun b!905206 () Bool)

(declare-fun e!507242 () Bool)

(assert (=> b!905206 (= e!507245 e!507242)))

(declare-fun res!610822 () Bool)

(assert (=> b!905206 (=> (not res!610822) (not e!507242))))

(declare-datatypes ((tuple2!12190 0))(
  ( (tuple2!12191 (_1!6106 (_ BitVec 64)) (_2!6106 V!29827)) )
))
(declare-datatypes ((List!18002 0))(
  ( (Nil!17999) (Cons!17998 (h!19144 tuple2!12190) (t!25403 List!18002)) )
))
(declare-datatypes ((ListLongMap!10887 0))(
  ( (ListLongMap!10888 (toList!5459 List!18002)) )
))
(declare-fun lt!408468 () ListLongMap!10887)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4505 (ListLongMap!10887 (_ BitVec 64)) Bool)

(assert (=> b!905206 (= res!610822 (contains!4505 lt!408468 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29827)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29827)

(declare-fun getCurrentListMap!2726 (array!53338 array!53340 (_ BitVec 32) (_ BitVec 32) V!29827 V!29827 (_ BitVec 32) Int) ListLongMap!10887)

(assert (=> b!905206 (= lt!408468 (getCurrentListMap!2726 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905207 () Bool)

(declare-fun e!507249 () Bool)

(assert (=> b!905207 (= e!507242 (not e!507249))))

(declare-fun res!610829 () Bool)

(assert (=> b!905207 (=> res!610829 e!507249)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905207 (= res!610829 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26087 _keys!1386))))))

(declare-fun lt!408467 () V!29827)

(declare-fun get!13462 (ValueCell!8842 V!29827) V!29827)

(declare-fun dynLambda!1326 (Int (_ BitVec 64)) V!29827)

(assert (=> b!905207 (= lt!408467 (get!13462 (select (arr!25629 _values!1152) i!717) (dynLambda!1326 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905207 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30710 0))(
  ( (Unit!30711) )
))
(declare-fun lt!408470 () Unit!30710)

(declare-fun lemmaKeyInListMapIsInArray!198 (array!53338 array!53340 (_ BitVec 32) (_ BitVec 32) V!29827 V!29827 (_ BitVec 64) Int) Unit!30710)

(assert (=> b!905207 (= lt!408470 (lemmaKeyInListMapIsInArray!198 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905208 () Bool)

(declare-fun e!507243 () Bool)

(declare-fun mapRes!29683 () Bool)

(assert (=> b!905208 (= e!507248 (and e!507243 mapRes!29683))))

(declare-fun condMapEmpty!29683 () Bool)

(declare-fun mapDefault!29683 () ValueCell!8842)

