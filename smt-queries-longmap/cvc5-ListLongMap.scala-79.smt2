; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1076 () Bool)

(assert start!1076)

(declare-fun b_free!379 () Bool)

(declare-fun b_next!379 () Bool)

(assert (=> start!1076 (= b_free!379 (not b_next!379))))

(declare-fun tp!1378 () Bool)

(declare-fun b_and!533 () Bool)

(assert (=> start!1076 (= tp!1378 b_and!533)))

(declare-fun b!9505 () Bool)

(declare-fun e!5443 () Bool)

(declare-fun e!5442 () Bool)

(assert (=> b!9505 (= e!5443 e!5442)))

(declare-fun res!8535 () Bool)

(assert (=> b!9505 (=> res!8535 e!5442)))

(declare-datatypes ((array!845 0))(
  ( (array!846 (arr!407 (Array (_ BitVec 32) (_ BitVec 64))) (size!469 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!845)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!9505 (= res!8535 (not (= (size!469 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!2145 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!845 (_ BitVec 32)) Bool)

(assert (=> b!9505 (arrayForallSeekEntryOrOpenFound!0 lt!2145 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!193 0))(
  ( (Unit!194) )
))
(declare-fun lt!2148 () Unit!193)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!193)

(assert (=> b!9505 (= lt!2148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2145))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!845 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9505 (= lt!2145 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!9507 () Bool)

(declare-fun res!8538 () Bool)

(declare-fun e!5447 () Bool)

(assert (=> b!9507 (=> (not res!8538) (not e!5447))))

(declare-datatypes ((V!787 0))(
  ( (V!788 (val!234 Int)) )
))
(declare-datatypes ((ValueCell!212 0))(
  ( (ValueCellFull!212 (v!1329 V!787)) (EmptyCell!212) )
))
(declare-datatypes ((array!847 0))(
  ( (array!848 (arr!408 (Array (_ BitVec 32) ValueCell!212)) (size!470 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!847)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9507 (= res!8538 (and (= (size!470 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!469 _keys!1806) (size!470 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9508 () Bool)

(assert (=> b!9508 (= e!5447 (not e!5443))))

(declare-fun res!8532 () Bool)

(assert (=> b!9508 (=> res!8532 e!5443)))

(declare-fun arrayContainsKey!0 (array!845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9508 (= res!8532 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!5441 () Bool)

(assert (=> b!9508 e!5441))

(declare-fun c!759 () Bool)

(assert (=> b!9508 (= c!759 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!787)

(declare-fun zeroValue!1434 () V!787)

(declare-fun lt!2146 () Unit!193)

(declare-fun lemmaKeyInListMapIsInArray!72 (array!845 array!847 (_ BitVec 32) (_ BitVec 32) V!787 V!787 (_ BitVec 64) Int) Unit!193)

(assert (=> b!9508 (= lt!2146 (lemmaKeyInListMapIsInArray!72 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!9509 () Bool)

(declare-fun e!5446 () Bool)

(declare-fun tp_is_empty!457 () Bool)

(assert (=> b!9509 (= e!5446 tp_is_empty!457)))

(declare-fun b!9510 () Bool)

(declare-fun e!5445 () Bool)

(declare-fun e!5440 () Bool)

(declare-fun mapRes!668 () Bool)

(assert (=> b!9510 (= e!5445 (and e!5440 mapRes!668))))

(declare-fun condMapEmpty!668 () Bool)

(declare-fun mapDefault!668 () ValueCell!212)

