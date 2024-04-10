; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1036 () Bool)

(assert start!1036)

(declare-fun b_free!365 () Bool)

(declare-fun b_next!365 () Bool)

(assert (=> start!1036 (= b_free!365 (not b_next!365))))

(declare-fun tp!1333 () Bool)

(declare-fun b_and!517 () Bool)

(assert (=> start!1036 (= tp!1333 b_and!517)))

(declare-fun b!9087 () Bool)

(declare-fun e!5183 () Bool)

(declare-fun tp_is_empty!443 () Bool)

(assert (=> b!9087 (= e!5183 tp_is_empty!443)))

(declare-fun b!9088 () Bool)

(declare-fun e!5185 () Bool)

(declare-fun e!5188 () Bool)

(assert (=> b!9088 (= e!5185 (not e!5188))))

(declare-fun res!8315 () Bool)

(assert (=> b!9088 (=> res!8315 e!5188)))

(declare-datatypes ((array!819 0))(
  ( (array!820 (arr!395 (Array (_ BitVec 32) (_ BitVec 64))) (size!457 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!819)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9088 (= res!8315 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!5184 () Bool)

(assert (=> b!9088 e!5184))

(declare-fun c!695 () Bool)

(assert (=> b!9088 (= c!695 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!767 0))(
  ( (V!768 (val!227 Int)) )
))
(declare-datatypes ((ValueCell!205 0))(
  ( (ValueCellFull!205 (v!1321 V!767)) (EmptyCell!205) )
))
(declare-datatypes ((array!821 0))(
  ( (array!822 (arr!396 (Array (_ BitVec 32) ValueCell!205)) (size!458 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!821)

(declare-fun minValue!1434 () V!767)

(declare-datatypes ((Unit!185 0))(
  ( (Unit!186) )
))
(declare-fun lt!1971 () Unit!185)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!767)

(declare-fun lemmaKeyInListMapIsInArray!69 (array!819 array!821 (_ BitVec 32) (_ BitVec 32) V!767 V!767 (_ BitVec 64) Int) Unit!185)

(assert (=> b!9088 (= lt!1971 (lemmaKeyInListMapIsInArray!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!644 () Bool)

(declare-fun mapRes!644 () Bool)

(declare-fun tp!1334 () Bool)

(assert (=> mapNonEmpty!644 (= mapRes!644 (and tp!1334 e!5183))))

(declare-fun mapKey!644 () (_ BitVec 32))

(declare-fun mapRest!644 () (Array (_ BitVec 32) ValueCell!205))

(declare-fun mapValue!644 () ValueCell!205)

(assert (=> mapNonEmpty!644 (= (arr!396 _values!1492) (store mapRest!644 mapKey!644 mapValue!644))))

(declare-fun b!9089 () Bool)

(declare-fun res!8320 () Bool)

(assert (=> b!9089 (=> (not res!8320) (not e!5185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!819 (_ BitVec 32)) Bool)

(assert (=> b!9089 (= res!8320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!8316 () Bool)

(assert (=> start!1036 (=> (not res!8316) (not e!5185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1036 (= res!8316 (validMask!0 mask!2250))))

(assert (=> start!1036 e!5185))

(assert (=> start!1036 tp!1333))

(assert (=> start!1036 true))

(declare-fun e!5189 () Bool)

(declare-fun array_inv!291 (array!821) Bool)

(assert (=> start!1036 (and (array_inv!291 _values!1492) e!5189)))

(assert (=> start!1036 tp_is_empty!443))

(declare-fun array_inv!292 (array!819) Bool)

(assert (=> start!1036 (array_inv!292 _keys!1806)))

(declare-fun b!9090 () Bool)

(assert (=> b!9090 (= e!5188 true)))

(declare-fun lt!1969 () (_ BitVec 32))

(assert (=> b!9090 (arrayForallSeekEntryOrOpenFound!0 lt!1969 _keys!1806 mask!2250)))

(declare-fun lt!1970 () Unit!185)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!185)

(assert (=> b!9090 (= lt!1970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1969))))

(declare-fun arrayScanForKey!0 (array!819 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9090 (= lt!1969 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!9091 () Bool)

(declare-fun res!8314 () Bool)

(assert (=> b!9091 (=> (not res!8314) (not e!5185))))

(declare-datatypes ((List!276 0))(
  ( (Nil!273) (Cons!272 (h!838 (_ BitVec 64)) (t!2417 List!276)) )
))
(declare-fun arrayNoDuplicates!0 (array!819 (_ BitVec 32) List!276) Bool)

(assert (=> b!9091 (= res!8314 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!273))))

(declare-fun b!9092 () Bool)

(declare-fun e!5186 () Bool)

(assert (=> b!9092 (= e!5189 (and e!5186 mapRes!644))))

(declare-fun condMapEmpty!644 () Bool)

(declare-fun mapDefault!644 () ValueCell!205)

