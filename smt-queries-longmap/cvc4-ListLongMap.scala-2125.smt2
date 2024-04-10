; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35970 () Bool)

(assert start!35970)

(declare-fun b!361394 () Bool)

(declare-fun res!201044 () Bool)

(declare-fun e!221297 () Bool)

(assert (=> b!361394 (=> (not res!201044) (not e!221297))))

(declare-datatypes ((array!20303 0))(
  ( (array!20304 (arr!9640 (Array (_ BitVec 32) (_ BitVec 64))) (size!9992 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20303)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12143 0))(
  ( (V!12144 (val!4232 Int)) )
))
(declare-datatypes ((ValueCell!3844 0))(
  ( (ValueCellFull!3844 (v!6426 V!12143)) (EmptyCell!3844) )
))
(declare-datatypes ((array!20305 0))(
  ( (array!20306 (arr!9641 (Array (_ BitVec 32) ValueCell!3844)) (size!9993 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20305)

(assert (=> b!361394 (= res!201044 (and (= (size!9993 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9992 _keys!1541) (size!9993 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361395 () Bool)

(declare-fun e!221302 () Bool)

(assert (=> b!361395 (= e!221297 e!221302)))

(declare-fun res!201041 () Bool)

(assert (=> b!361395 (=> res!201041 e!221302)))

(declare-datatypes ((List!5506 0))(
  ( (Nil!5503) (Cons!5502 (h!6358 (_ BitVec 64)) (t!10656 List!5506)) )
))
(declare-fun contains!2426 (List!5506 (_ BitVec 64)) Bool)

(assert (=> b!361395 (= res!201041 (contains!2426 Nil!5503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361396 () Bool)

(declare-fun res!201040 () Bool)

(assert (=> b!361396 (=> (not res!201040) (not e!221297))))

(assert (=> b!361396 (= res!201040 (and (bvsle #b00000000000000000000000000000000 (size!9992 _keys!1541)) (bvslt (size!9992 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361397 () Bool)

(declare-fun e!221300 () Bool)

(declare-fun e!221301 () Bool)

(declare-fun mapRes!14085 () Bool)

(assert (=> b!361397 (= e!221300 (and e!221301 mapRes!14085))))

(declare-fun condMapEmpty!14085 () Bool)

(declare-fun mapDefault!14085 () ValueCell!3844)

