; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40442 () Bool)

(assert start!40442)

(declare-fun b!444965 () Bool)

(declare-fun res!263941 () Bool)

(declare-fun e!261620 () Bool)

(assert (=> b!444965 (=> (not res!263941) (not e!261620))))

(declare-datatypes ((array!27461 0))(
  ( (array!27462 (arr!13178 (Array (_ BitVec 32) (_ BitVec 64))) (size!13530 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27461)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27461 (_ BitVec 32)) Bool)

(assert (=> b!444965 (= res!263941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444966 () Bool)

(declare-fun res!263945 () Bool)

(assert (=> b!444966 (=> (not res!263945) (not e!261620))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16875 0))(
  ( (V!16876 (val!5958 Int)) )
))
(declare-datatypes ((ValueCell!5570 0))(
  ( (ValueCellFull!5570 (v!8209 V!16875)) (EmptyCell!5570) )
))
(declare-datatypes ((array!27463 0))(
  ( (array!27464 (arr!13179 (Array (_ BitVec 32) ValueCell!5570)) (size!13531 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27463)

(assert (=> b!444966 (= res!263945 (and (= (size!13531 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13530 _keys!709) (size!13531 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444967 () Bool)

(declare-fun e!261619 () Bool)

(declare-fun tp_is_empty!11827 () Bool)

(assert (=> b!444967 (= e!261619 tp_is_empty!11827)))

(declare-fun mapNonEmpty!19368 () Bool)

(declare-fun mapRes!19368 () Bool)

(declare-fun tp!37350 () Bool)

(declare-fun e!261615 () Bool)

(assert (=> mapNonEmpty!19368 (= mapRes!19368 (and tp!37350 e!261615))))

(declare-fun mapRest!19368 () (Array (_ BitVec 32) ValueCell!5570))

(declare-fun mapValue!19368 () ValueCell!5570)

(declare-fun mapKey!19368 () (_ BitVec 32))

(assert (=> mapNonEmpty!19368 (= (arr!13179 _values!549) (store mapRest!19368 mapKey!19368 mapValue!19368))))

(declare-fun b!444968 () Bool)

(declare-fun res!263944 () Bool)

(assert (=> b!444968 (=> (not res!263944) (not e!261620))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444968 (= res!263944 (validKeyInArray!0 k!794))))

(declare-fun b!444969 () Bool)

(assert (=> b!444969 (= e!261615 tp_is_empty!11827)))

(declare-fun b!444970 () Bool)

(declare-fun res!263948 () Bool)

(assert (=> b!444970 (=> (not res!263948) (not e!261620))))

(declare-datatypes ((List!7881 0))(
  ( (Nil!7878) (Cons!7877 (h!8733 (_ BitVec 64)) (t!13639 List!7881)) )
))
(declare-fun arrayNoDuplicates!0 (array!27461 (_ BitVec 32) List!7881) Bool)

(assert (=> b!444970 (= res!263948 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7878))))

(declare-fun b!444971 () Bool)

(declare-fun res!263950 () Bool)

(assert (=> b!444971 (=> (not res!263950) (not e!261620))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444971 (= res!263950 (or (= (select (arr!13178 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13178 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444972 () Bool)

(declare-fun e!261617 () Bool)

(assert (=> b!444972 (= e!261617 (and e!261619 mapRes!19368))))

(declare-fun condMapEmpty!19368 () Bool)

(declare-fun mapDefault!19368 () ValueCell!5570)

