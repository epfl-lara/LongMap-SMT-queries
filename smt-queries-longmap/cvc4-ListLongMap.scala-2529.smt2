; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38996 () Bool)

(assert start!38996)

(declare-fun b!408614 () Bool)

(declare-fun res!236454 () Bool)

(declare-fun e!245242 () Bool)

(assert (=> b!408614 (=> (not res!236454) (not e!245242))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408614 (= res!236454 (validKeyInArray!0 k!794))))

(declare-fun b!408615 () Bool)

(declare-fun res!236448 () Bool)

(assert (=> b!408615 (=> (not res!236448) (not e!245242))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24705 0))(
  ( (array!24706 (arr!11802 (Array (_ BitVec 32) (_ BitVec 64))) (size!12154 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24705)

(assert (=> b!408615 (= res!236448 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12154 _keys!709))))))

(declare-fun res!236456 () Bool)

(assert (=> start!38996 (=> (not res!236456) (not e!245242))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38996 (= res!236456 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12154 _keys!709))))))

(assert (=> start!38996 e!245242))

(assert (=> start!38996 true))

(declare-datatypes ((V!14991 0))(
  ( (V!14992 (val!5252 Int)) )
))
(declare-datatypes ((ValueCell!4864 0))(
  ( (ValueCellFull!4864 (v!7499 V!14991)) (EmptyCell!4864) )
))
(declare-datatypes ((array!24707 0))(
  ( (array!24708 (arr!11803 (Array (_ BitVec 32) ValueCell!4864)) (size!12155 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24707)

(declare-fun e!245239 () Bool)

(declare-fun array_inv!8610 (array!24707) Bool)

(assert (=> start!38996 (and (array_inv!8610 _values!549) e!245239)))

(declare-fun array_inv!8611 (array!24705) Bool)

(assert (=> start!38996 (array_inv!8611 _keys!709)))

(declare-fun b!408616 () Bool)

(declare-fun e!245244 () Bool)

(declare-fun mapRes!17244 () Bool)

(assert (=> b!408616 (= e!245239 (and e!245244 mapRes!17244))))

(declare-fun condMapEmpty!17244 () Bool)

(declare-fun mapDefault!17244 () ValueCell!4864)

