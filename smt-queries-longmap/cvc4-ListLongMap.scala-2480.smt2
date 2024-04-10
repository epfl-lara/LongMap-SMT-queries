; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38702 () Bool)

(assert start!38702)

(declare-fun b_free!9239 () Bool)

(declare-fun b_next!9239 () Bool)

(assert (=> start!38702 (= b_free!9239 (not b_next!9239))))

(declare-fun tp!32841 () Bool)

(declare-fun b_and!16625 () Bool)

(assert (=> start!38702 (= tp!32841 b_and!16625)))

(declare-fun b!402554 () Bool)

(declare-fun res!231877 () Bool)

(declare-fun e!242517 () Bool)

(assert (=> b!402554 (=> (not res!231877) (not e!242517))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24147 0))(
  ( (array!24148 (arr!11523 (Array (_ BitVec 32) (_ BitVec 64))) (size!11875 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24147)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!402554 (= res!231877 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11875 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402555 () Bool)

(declare-fun e!242512 () Bool)

(assert (=> b!402555 (= e!242512 e!242517)))

(declare-fun res!231876 () Bool)

(assert (=> b!402555 (=> (not res!231876) (not e!242517))))

(declare-fun lt!187943 () array!24147)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24147 (_ BitVec 32)) Bool)

(assert (=> b!402555 (= res!231876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187943 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!402555 (= lt!187943 (array!24148 (store (arr!11523 _keys!709) i!563 k!794) (size!11875 _keys!709)))))

(declare-fun b!402556 () Bool)

(declare-fun e!242515 () Bool)

(declare-fun tp_is_empty!10121 () Bool)

(assert (=> b!402556 (= e!242515 tp_is_empty!10121)))

(declare-fun b!402557 () Bool)

(assert (=> b!402557 (= e!242517 (not true))))

(declare-fun e!242514 () Bool)

(assert (=> b!402557 e!242514))

(declare-fun c!54815 () Bool)

(assert (=> b!402557 (= c!54815 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14599 0))(
  ( (V!14600 (val!5105 Int)) )
))
(declare-fun minValue!515 () V!14599)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4717 0))(
  ( (ValueCellFull!4717 (v!7352 V!14599)) (EmptyCell!4717) )
))
(declare-datatypes ((array!24149 0))(
  ( (array!24150 (arr!11524 (Array (_ BitVec 32) ValueCell!4717)) (size!11876 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24149)

(declare-fun zeroValue!515 () V!14599)

(declare-datatypes ((Unit!12188 0))(
  ( (Unit!12189) )
))
(declare-fun lt!187942 () Unit!12188)

(declare-fun v!412 () V!14599)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!352 (array!24147 array!24149 (_ BitVec 32) (_ BitVec 32) V!14599 V!14599 (_ BitVec 32) (_ BitVec 64) V!14599 (_ BitVec 32) Int) Unit!12188)

(assert (=> b!402557 (= lt!187942 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!352 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402558 () Bool)

(declare-fun res!231885 () Bool)

(assert (=> b!402558 (=> (not res!231885) (not e!242512))))

(assert (=> b!402558 (= res!231885 (or (= (select (arr!11523 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11523 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402559 () Bool)

(declare-fun e!242516 () Bool)

(declare-fun e!242513 () Bool)

(declare-fun mapRes!16803 () Bool)

(assert (=> b!402559 (= e!242516 (and e!242513 mapRes!16803))))

(declare-fun condMapEmpty!16803 () Bool)

(declare-fun mapDefault!16803 () ValueCell!4717)

