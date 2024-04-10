; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40418 () Bool)

(assert start!40418)

(declare-fun b!444497 () Bool)

(declare-fun e!261399 () Bool)

(declare-fun tp_is_empty!11803 () Bool)

(assert (=> b!444497 (= e!261399 tp_is_empty!11803)))

(declare-fun b!444498 () Bool)

(declare-fun e!261401 () Bool)

(assert (=> b!444498 (= e!261401 tp_is_empty!11803)))

(declare-fun b!444499 () Bool)

(declare-fun res!263589 () Bool)

(declare-fun e!261400 () Bool)

(assert (=> b!444499 (=> (not res!263589) (not e!261400))))

(declare-datatypes ((array!27415 0))(
  ( (array!27416 (arr!13155 (Array (_ BitVec 32) (_ BitVec 64))) (size!13507 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27415)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444499 (= res!263589 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!444500 () Bool)

(declare-fun res!263590 () Bool)

(assert (=> b!444500 (=> (not res!263590) (not e!261400))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16843 0))(
  ( (V!16844 (val!5946 Int)) )
))
(declare-datatypes ((ValueCell!5558 0))(
  ( (ValueCellFull!5558 (v!8197 V!16843)) (EmptyCell!5558) )
))
(declare-datatypes ((array!27417 0))(
  ( (array!27418 (arr!13156 (Array (_ BitVec 32) ValueCell!5558)) (size!13508 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27417)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444500 (= res!263590 (and (= (size!13508 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13507 _keys!709) (size!13508 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444501 () Bool)

(declare-fun res!263588 () Bool)

(assert (=> b!444501 (=> (not res!263588) (not e!261400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444501 (= res!263588 (validMask!0 mask!1025))))

(declare-fun b!444502 () Bool)

(declare-fun e!261404 () Bool)

(declare-fun mapRes!19332 () Bool)

(assert (=> b!444502 (= e!261404 (and e!261401 mapRes!19332))))

(declare-fun condMapEmpty!19332 () Bool)

(declare-fun mapDefault!19332 () ValueCell!5558)

