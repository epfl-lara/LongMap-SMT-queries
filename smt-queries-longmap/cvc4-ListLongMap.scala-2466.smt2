; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38618 () Bool)

(assert start!38618)

(declare-fun b_free!9155 () Bool)

(declare-fun b_next!9155 () Bool)

(assert (=> start!38618 (= b_free!9155 (not b_next!9155))))

(declare-fun tp!32589 () Bool)

(declare-fun b_and!16541 () Bool)

(assert (=> start!38618 (= tp!32589 b_and!16541)))

(declare-fun b!400412 () Bool)

(declare-fun res!230364 () Bool)

(declare-fun e!241629 () Bool)

(assert (=> b!400412 (=> (not res!230364) (not e!241629))))

(declare-datatypes ((array!23983 0))(
  ( (array!23984 (arr!11441 (Array (_ BitVec 32) (_ BitVec 64))) (size!11793 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23983)

(declare-datatypes ((List!6636 0))(
  ( (Nil!6633) (Cons!6632 (h!7488 (_ BitVec 64)) (t!11810 List!6636)) )
))
(declare-fun arrayNoDuplicates!0 (array!23983 (_ BitVec 32) List!6636) Bool)

(assert (=> b!400412 (= res!230364 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6633))))

(declare-fun b!400413 () Bool)

(declare-fun res!230369 () Bool)

(assert (=> b!400413 (=> (not res!230369) (not e!241629))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400413 (= res!230369 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!400414 () Bool)

(declare-fun e!241632 () Bool)

(assert (=> b!400414 (= e!241629 e!241632)))

(declare-fun res!230367 () Bool)

(assert (=> b!400414 (=> (not res!230367) (not e!241632))))

(declare-fun lt!187690 () array!23983)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23983 (_ BitVec 32)) Bool)

(assert (=> b!400414 (= res!230367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187690 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400414 (= lt!187690 (array!23984 (store (arr!11441 _keys!709) i!563 k!794) (size!11793 _keys!709)))))

(declare-fun b!400415 () Bool)

(declare-fun e!241635 () Bool)

(declare-fun tp_is_empty!10037 () Bool)

(assert (=> b!400415 (= e!241635 tp_is_empty!10037)))

(declare-fun b!400416 () Bool)

(declare-fun e!241633 () Bool)

(assert (=> b!400416 (= e!241633 tp_is_empty!10037)))

(declare-fun b!400417 () Bool)

(declare-fun res!230362 () Bool)

(assert (=> b!400417 (=> (not res!230362) (not e!241629))))

(assert (=> b!400417 (= res!230362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400418 () Bool)

(declare-fun res!230371 () Bool)

(assert (=> b!400418 (=> (not res!230371) (not e!241632))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400418 (= res!230371 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11793 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14487 0))(
  ( (V!14488 (val!5063 Int)) )
))
(declare-fun minValue!515 () V!14487)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28126 () Bool)

(declare-datatypes ((ValueCell!4675 0))(
  ( (ValueCellFull!4675 (v!7310 V!14487)) (EmptyCell!4675) )
))
(declare-datatypes ((array!23985 0))(
  ( (array!23986 (arr!11442 (Array (_ BitVec 32) ValueCell!4675)) (size!11794 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23985)

(declare-fun zeroValue!515 () V!14487)

(declare-fun c!54689 () Bool)

(declare-datatypes ((tuple2!6714 0))(
  ( (tuple2!6715 (_1!3368 (_ BitVec 64)) (_2!3368 V!14487)) )
))
(declare-datatypes ((List!6637 0))(
  ( (Nil!6634) (Cons!6633 (h!7489 tuple2!6714) (t!11811 List!6637)) )
))
(declare-datatypes ((ListLongMap!5627 0))(
  ( (ListLongMap!5628 (toList!2829 List!6637)) )
))
(declare-fun call!28129 () ListLongMap!5627)

(declare-fun v!412 () V!14487)

(declare-fun getCurrentListMapNoExtraKeys!1042 (array!23983 array!23985 (_ BitVec 32) (_ BitVec 32) V!14487 V!14487 (_ BitVec 32) Int) ListLongMap!5627)

(assert (=> bm!28126 (= call!28129 (getCurrentListMapNoExtraKeys!1042 (ite c!54689 lt!187690 _keys!709) (ite c!54689 (array!23986 (store (arr!11442 _values!549) i!563 (ValueCellFull!4675 v!412)) (size!11794 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16677 () Bool)

(declare-fun mapRes!16677 () Bool)

(assert (=> mapIsEmpty!16677 mapRes!16677))

(declare-fun b!400419 () Bool)

(declare-fun res!230370 () Bool)

(assert (=> b!400419 (=> (not res!230370) (not e!241629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400419 (= res!230370 (validKeyInArray!0 k!794))))

(declare-fun b!400411 () Bool)

(declare-fun e!241631 () Bool)

(assert (=> b!400411 (= e!241631 (and e!241633 mapRes!16677))))

(declare-fun condMapEmpty!16677 () Bool)

(declare-fun mapDefault!16677 () ValueCell!4675)

