; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77602 () Bool)

(assert start!77602)

(declare-fun b_free!16187 () Bool)

(declare-fun b_next!16187 () Bool)

(assert (=> start!77602 (= b_free!16187 (not b_next!16187))))

(declare-fun tp!56823 () Bool)

(declare-fun b_and!26553 () Bool)

(assert (=> start!77602 (= tp!56823 b_and!26553)))

(declare-fun b!904407 () Bool)

(declare-fun e!506780 () Bool)

(declare-fun e!506775 () Bool)

(assert (=> b!904407 (= e!506780 (not e!506775))))

(declare-fun res!610234 () Bool)

(assert (=> b!904407 (=> res!610234 e!506775)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53254 0))(
  ( (array!53255 (arr!25586 (Array (_ BitVec 32) (_ BitVec 64))) (size!26045 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53254)

(assert (=> b!904407 (= res!610234 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26045 _keys!1386))))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904407 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!29771 0))(
  ( (V!29772 (val!9353 Int)) )
))
(declare-datatypes ((ValueCell!8821 0))(
  ( (ValueCellFull!8821 (v!11858 V!29771)) (EmptyCell!8821) )
))
(declare-datatypes ((array!53256 0))(
  ( (array!53257 (arr!25587 (Array (_ BitVec 32) ValueCell!8821)) (size!26046 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53256)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29771)

(declare-datatypes ((Unit!30672 0))(
  ( (Unit!30673) )
))
(declare-fun lt!408226 () Unit!30672)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29771)

(declare-fun lemmaKeyInListMapIsInArray!179 (array!53254 array!53256 (_ BitVec 32) (_ BitVec 32) V!29771 V!29771 (_ BitVec 64) Int) Unit!30672)

(assert (=> b!904407 (= lt!408226 (lemmaKeyInListMapIsInArray!179 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904408 () Bool)

(declare-fun res!610235 () Bool)

(assert (=> b!904408 (=> (not res!610235) (not e!506780))))

(declare-datatypes ((List!17968 0))(
  ( (Nil!17965) (Cons!17964 (h!19110 (_ BitVec 64)) (t!25351 List!17968)) )
))
(declare-fun arrayNoDuplicates!0 (array!53254 (_ BitVec 32) List!17968) Bool)

(assert (=> b!904408 (= res!610235 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17965))))

(declare-fun b!904409 () Bool)

(declare-fun res!610230 () Bool)

(assert (=> b!904409 (=> (not res!610230) (not e!506780))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904409 (= res!610230 (inRange!0 i!717 mask!1756))))

(declare-fun res!610232 () Bool)

(assert (=> start!77602 (=> (not res!610232) (not e!506780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77602 (= res!610232 (validMask!0 mask!1756))))

(assert (=> start!77602 e!506780))

(declare-fun e!506776 () Bool)

(declare-fun array_inv!20046 (array!53256) Bool)

(assert (=> start!77602 (and (array_inv!20046 _values!1152) e!506776)))

(assert (=> start!77602 tp!56823))

(assert (=> start!77602 true))

(declare-fun tp_is_empty!18605 () Bool)

(assert (=> start!77602 tp_is_empty!18605))

(declare-fun array_inv!20047 (array!53254) Bool)

(assert (=> start!77602 (array_inv!20047 _keys!1386)))

(declare-fun b!904410 () Bool)

(declare-fun res!610231 () Bool)

(assert (=> b!904410 (=> (not res!610231) (not e!506780))))

(assert (=> b!904410 (= res!610231 (and (= (size!26046 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26045 _keys!1386) (size!26046 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904411 () Bool)

(declare-fun res!610227 () Bool)

(assert (=> b!904411 (=> (not res!610227) (not e!506780))))

(declare-datatypes ((tuple2!12150 0))(
  ( (tuple2!12151 (_1!6086 (_ BitVec 64)) (_2!6086 V!29771)) )
))
(declare-datatypes ((List!17969 0))(
  ( (Nil!17966) (Cons!17965 (h!19111 tuple2!12150) (t!25352 List!17969)) )
))
(declare-datatypes ((ListLongMap!10847 0))(
  ( (ListLongMap!10848 (toList!5439 List!17969)) )
))
(declare-fun contains!4487 (ListLongMap!10847 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2708 (array!53254 array!53256 (_ BitVec 32) (_ BitVec 32) V!29771 V!29771 (_ BitVec 32) Int) ListLongMap!10847)

(assert (=> b!904411 (= res!610227 (contains!4487 (getCurrentListMap!2708 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904412 () Bool)

(declare-fun e!506781 () Bool)

(assert (=> b!904412 (= e!506781 tp_is_empty!18605)))

(declare-fun b!904413 () Bool)

(declare-fun e!506779 () Bool)

(assert (=> b!904413 (= e!506779 true)))

(declare-fun lt!408227 () V!29771)

(declare-fun lt!408228 () ListLongMap!10847)

(declare-fun apply!435 (ListLongMap!10847 (_ BitVec 64)) V!29771)

(assert (=> b!904413 (= lt!408227 (apply!435 lt!408228 k!1033))))

(declare-fun b!904414 () Bool)

(declare-fun e!506777 () Bool)

(declare-fun mapRes!29620 () Bool)

(assert (=> b!904414 (= e!506776 (and e!506777 mapRes!29620))))

(declare-fun condMapEmpty!29620 () Bool)

(declare-fun mapDefault!29620 () ValueCell!8821)

