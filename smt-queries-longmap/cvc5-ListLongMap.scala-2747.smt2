; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40320 () Bool)

(assert start!40320)

(declare-fun b!442800 () Bool)

(declare-fun res!262286 () Bool)

(declare-fun e!260603 () Bool)

(assert (=> b!442800 (=> (not res!262286) (not e!260603))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442800 (= res!262286 (validMask!0 mask!1025))))

(declare-fun b!442801 () Bool)

(declare-fun res!262293 () Bool)

(assert (=> b!442801 (=> (not res!262293) (not e!260603))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442801 (= res!262293 (validKeyInArray!0 k!794))))

(declare-fun b!442802 () Bool)

(declare-fun e!260604 () Bool)

(assert (=> b!442802 (= e!260603 e!260604)))

(declare-fun res!262295 () Bool)

(assert (=> b!442802 (=> (not res!262295) (not e!260604))))

(declare-datatypes ((array!27249 0))(
  ( (array!27250 (arr!13073 (Array (_ BitVec 32) (_ BitVec 64))) (size!13425 (_ BitVec 32))) )
))
(declare-fun lt!203245 () array!27249)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27249 (_ BitVec 32)) Bool)

(assert (=> b!442802 (= res!262295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203245 mask!1025))))

(declare-fun _keys!709 () array!27249)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442802 (= lt!203245 (array!27250 (store (arr!13073 _keys!709) i!563 k!794) (size!13425 _keys!709)))))

(declare-fun b!442803 () Bool)

(declare-fun res!262292 () Bool)

(assert (=> b!442803 (=> (not res!262292) (not e!260603))))

(declare-datatypes ((List!7845 0))(
  ( (Nil!7842) (Cons!7841 (h!8697 (_ BitVec 64)) (t!13603 List!7845)) )
))
(declare-fun arrayNoDuplicates!0 (array!27249 (_ BitVec 32) List!7845) Bool)

(assert (=> b!442803 (= res!262292 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7842))))

(declare-fun b!442804 () Bool)

(declare-fun e!260607 () Bool)

(declare-fun e!260608 () Bool)

(declare-fun mapRes!19203 () Bool)

(assert (=> b!442804 (= e!260607 (and e!260608 mapRes!19203))))

(declare-fun condMapEmpty!19203 () Bool)

(declare-datatypes ((V!16731 0))(
  ( (V!16732 (val!5904 Int)) )
))
(declare-datatypes ((ValueCell!5516 0))(
  ( (ValueCellFull!5516 (v!8155 V!16731)) (EmptyCell!5516) )
))
(declare-datatypes ((array!27251 0))(
  ( (array!27252 (arr!13074 (Array (_ BitVec 32) ValueCell!5516)) (size!13426 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27251)

(declare-fun mapDefault!19203 () ValueCell!5516)

