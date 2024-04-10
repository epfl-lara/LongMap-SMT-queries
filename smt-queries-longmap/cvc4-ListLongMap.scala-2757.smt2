; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40398 () Bool)

(assert start!40398)

(declare-fun b!444107 () Bool)

(declare-fun e!261224 () Bool)

(declare-fun e!261221 () Bool)

(assert (=> b!444107 (= e!261224 e!261221)))

(declare-fun res!263288 () Bool)

(assert (=> b!444107 (=> (not res!263288) (not e!261221))))

(declare-datatypes ((array!27375 0))(
  ( (array!27376 (arr!13135 (Array (_ BitVec 32) (_ BitVec 64))) (size!13487 (_ BitVec 32))) )
))
(declare-fun lt!203441 () array!27375)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27375 (_ BitVec 32)) Bool)

(assert (=> b!444107 (= res!263288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203441 mask!1025))))

(declare-fun _keys!709 () array!27375)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444107 (= lt!203441 (array!27376 (store (arr!13135 _keys!709) i!563 k!794) (size!13487 _keys!709)))))

(declare-fun b!444108 () Bool)

(declare-fun res!263282 () Bool)

(assert (=> b!444108 (=> (not res!263282) (not e!261224))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16815 0))(
  ( (V!16816 (val!5936 Int)) )
))
(declare-datatypes ((ValueCell!5548 0))(
  ( (ValueCellFull!5548 (v!8187 V!16815)) (EmptyCell!5548) )
))
(declare-datatypes ((array!27377 0))(
  ( (array!27378 (arr!13136 (Array (_ BitVec 32) ValueCell!5548)) (size!13488 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27377)

(assert (=> b!444108 (= res!263282 (and (= (size!13488 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13487 _keys!709) (size!13488 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444109 () Bool)

(declare-fun res!263283 () Bool)

(assert (=> b!444109 (=> (not res!263283) (not e!261224))))

(assert (=> b!444109 (= res!263283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444110 () Bool)

(declare-fun res!263281 () Bool)

(assert (=> b!444110 (=> (not res!263281) (not e!261224))))

(assert (=> b!444110 (= res!263281 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13487 _keys!709))))))

(declare-fun b!444112 () Bool)

(declare-fun res!263287 () Bool)

(assert (=> b!444112 (=> (not res!263287) (not e!261224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444112 (= res!263287 (validMask!0 mask!1025))))

(declare-fun b!444113 () Bool)

(declare-fun res!263285 () Bool)

(assert (=> b!444113 (=> (not res!263285) (not e!261224))))

(assert (=> b!444113 (= res!263285 (or (= (select (arr!13135 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13135 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444114 () Bool)

(declare-fun res!263289 () Bool)

(assert (=> b!444114 (=> (not res!263289) (not e!261224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444114 (= res!263289 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19302 () Bool)

(declare-fun mapRes!19302 () Bool)

(declare-fun tp!37284 () Bool)

(declare-fun e!261219 () Bool)

(assert (=> mapNonEmpty!19302 (= mapRes!19302 (and tp!37284 e!261219))))

(declare-fun mapValue!19302 () ValueCell!5548)

(declare-fun mapKey!19302 () (_ BitVec 32))

(declare-fun mapRest!19302 () (Array (_ BitVec 32) ValueCell!5548))

(assert (=> mapNonEmpty!19302 (= (arr!13136 _values!549) (store mapRest!19302 mapKey!19302 mapValue!19302))))

(declare-fun b!444115 () Bool)

(declare-fun e!261222 () Bool)

(declare-fun e!261220 () Bool)

(assert (=> b!444115 (= e!261222 (and e!261220 mapRes!19302))))

(declare-fun condMapEmpty!19302 () Bool)

(declare-fun mapDefault!19302 () ValueCell!5548)

