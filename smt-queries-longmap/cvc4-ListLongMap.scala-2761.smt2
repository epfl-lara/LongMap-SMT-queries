; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40422 () Bool)

(assert start!40422)

(declare-fun b!444575 () Bool)

(declare-fun res!263647 () Bool)

(declare-fun e!261436 () Bool)

(assert (=> b!444575 (=> (not res!263647) (not e!261436))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444575 (= res!263647 (validMask!0 mask!1025))))

(declare-fun b!444576 () Bool)

(declare-fun res!263646 () Bool)

(assert (=> b!444576 (=> (not res!263646) (not e!261436))))

(declare-datatypes ((array!27423 0))(
  ( (array!27424 (arr!13159 (Array (_ BitVec 32) (_ BitVec 64))) (size!13511 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27423)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444576 (= res!263646 (or (= (select (arr!13159 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13159 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19338 () Bool)

(declare-fun mapRes!19338 () Bool)

(assert (=> mapIsEmpty!19338 mapRes!19338))

(declare-fun b!444577 () Bool)

(declare-fun res!263641 () Bool)

(assert (=> b!444577 (=> (not res!263641) (not e!261436))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16847 0))(
  ( (V!16848 (val!5948 Int)) )
))
(declare-datatypes ((ValueCell!5560 0))(
  ( (ValueCellFull!5560 (v!8199 V!16847)) (EmptyCell!5560) )
))
(declare-datatypes ((array!27425 0))(
  ( (array!27426 (arr!13160 (Array (_ BitVec 32) ValueCell!5560)) (size!13512 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27425)

(assert (=> b!444577 (= res!263641 (and (= (size!13512 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13511 _keys!709) (size!13512 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444578 () Bool)

(declare-fun e!261435 () Bool)

(assert (=> b!444578 (= e!261436 e!261435)))

(declare-fun res!263648 () Bool)

(assert (=> b!444578 (=> (not res!263648) (not e!261435))))

(declare-fun lt!203512 () array!27423)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27423 (_ BitVec 32)) Bool)

(assert (=> b!444578 (= res!263648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203512 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!444578 (= lt!203512 (array!27424 (store (arr!13159 _keys!709) i!563 k!794) (size!13511 _keys!709)))))

(declare-fun b!444579 () Bool)

(declare-fun e!261439 () Bool)

(declare-fun e!261437 () Bool)

(assert (=> b!444579 (= e!261439 (and e!261437 mapRes!19338))))

(declare-fun condMapEmpty!19338 () Bool)

(declare-fun mapDefault!19338 () ValueCell!5560)

