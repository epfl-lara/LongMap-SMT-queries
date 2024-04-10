; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33896 () Bool)

(assert start!33896)

(declare-fun b_free!7075 () Bool)

(declare-fun b_next!7075 () Bool)

(assert (=> start!33896 (= b_free!7075 (not b_next!7075))))

(declare-fun tp!24737 () Bool)

(declare-fun b_and!14261 () Bool)

(assert (=> start!33896 (= tp!24737 b_and!14261)))

(declare-fun b!337557 () Bool)

(declare-fun res!186485 () Bool)

(declare-fun e!207132 () Bool)

(assert (=> b!337557 (=> (not res!186485) (not e!207132))))

(declare-datatypes ((array!17649 0))(
  ( (array!17650 (arr!8352 (Array (_ BitVec 32) (_ BitVec 64))) (size!8704 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17649)

(declare-datatypes ((List!4783 0))(
  ( (Nil!4780) (Cons!4779 (h!5635 (_ BitVec 64)) (t!9877 List!4783)) )
))
(declare-fun arrayNoDuplicates!0 (array!17649 (_ BitVec 32) List!4783) Bool)

(assert (=> b!337557 (= res!186485 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4780))))

(declare-fun b!337558 () Bool)

(declare-fun res!186486 () Bool)

(assert (=> b!337558 (=> (not res!186486) (not e!207132))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17649 (_ BitVec 32)) Bool)

(assert (=> b!337558 (= res!186486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!186487 () Bool)

(assert (=> start!33896 (=> (not res!186487) (not e!207132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33896 (= res!186487 (validMask!0 mask!2385))))

(assert (=> start!33896 e!207132))

(assert (=> start!33896 true))

(declare-fun tp_is_empty!7027 () Bool)

(assert (=> start!33896 tp_is_empty!7027))

(assert (=> start!33896 tp!24737))

(declare-datatypes ((V!10347 0))(
  ( (V!10348 (val!3558 Int)) )
))
(declare-datatypes ((ValueCell!3170 0))(
  ( (ValueCellFull!3170 (v!5723 V!10347)) (EmptyCell!3170) )
))
(declare-datatypes ((array!17651 0))(
  ( (array!17652 (arr!8353 (Array (_ BitVec 32) ValueCell!3170)) (size!8705 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17651)

(declare-fun e!207131 () Bool)

(declare-fun array_inv!6200 (array!17651) Bool)

(assert (=> start!33896 (and (array_inv!6200 _values!1525) e!207131)))

(declare-fun array_inv!6201 (array!17649) Bool)

(assert (=> start!33896 (array_inv!6201 _keys!1895)))

(declare-fun b!337559 () Bool)

(declare-fun e!207130 () Bool)

(assert (=> b!337559 (= e!207130 tp_is_empty!7027)))

(declare-fun b!337560 () Bool)

(declare-fun e!207128 () Bool)

(declare-fun mapRes!11946 () Bool)

(assert (=> b!337560 (= e!207131 (and e!207128 mapRes!11946))))

(declare-fun condMapEmpty!11946 () Bool)

(declare-fun mapDefault!11946 () ValueCell!3170)

