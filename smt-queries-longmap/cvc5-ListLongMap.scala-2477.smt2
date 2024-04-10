; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38680 () Bool)

(assert start!38680)

(declare-fun b_free!9217 () Bool)

(declare-fun b_next!9217 () Bool)

(assert (=> start!38680 (= b_free!9217 (not b_next!9217))))

(declare-fun tp!32774 () Bool)

(declare-fun b_and!16603 () Bool)

(assert (=> start!38680 (= tp!32774 b_and!16603)))

(declare-fun b!401992 () Bool)

(declare-fun e!242285 () Bool)

(declare-fun tp_is_empty!10099 () Bool)

(assert (=> b!401992 (= e!242285 tp_is_empty!10099)))

(declare-fun b!401993 () Bool)

(declare-fun res!231483 () Bool)

(declare-fun e!242283 () Bool)

(assert (=> b!401993 (=> (not res!231483) (not e!242283))))

(declare-datatypes ((array!24105 0))(
  ( (array!24106 (arr!11502 (Array (_ BitVec 32) (_ BitVec 64))) (size!11854 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24105)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401993 (= res!231483 (or (= (select (arr!11502 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11502 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401994 () Bool)

(declare-fun res!231479 () Bool)

(declare-fun e!242281 () Bool)

(assert (=> b!401994 (=> (not res!231479) (not e!242281))))

(declare-fun lt!187876 () array!24105)

(declare-datatypes ((List!6687 0))(
  ( (Nil!6684) (Cons!6683 (h!7539 (_ BitVec 64)) (t!11861 List!6687)) )
))
(declare-fun arrayNoDuplicates!0 (array!24105 (_ BitVec 32) List!6687) Bool)

(assert (=> b!401994 (= res!231479 (arrayNoDuplicates!0 lt!187876 #b00000000000000000000000000000000 Nil!6684))))

(declare-fun b!401995 () Bool)

(declare-fun res!231488 () Bool)

(assert (=> b!401995 (=> (not res!231488) (not e!242283))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401995 (= res!231488 (validKeyInArray!0 k!794))))

(declare-fun b!401996 () Bool)

(assert (=> b!401996 (= e!242283 e!242281)))

(declare-fun res!231481 () Bool)

(assert (=> b!401996 (=> (not res!231481) (not e!242281))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24105 (_ BitVec 32)) Bool)

(assert (=> b!401996 (= res!231481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187876 mask!1025))))

(assert (=> b!401996 (= lt!187876 (array!24106 (store (arr!11502 _keys!709) i!563 k!794) (size!11854 _keys!709)))))

(declare-fun b!401997 () Bool)

(declare-fun res!231486 () Bool)

(assert (=> b!401997 (=> (not res!231486) (not e!242283))))

(assert (=> b!401997 (= res!231486 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11854 _keys!709))))))

(declare-fun b!401998 () Bool)

(declare-fun res!231489 () Bool)

(assert (=> b!401998 (=> (not res!231489) (not e!242283))))

(assert (=> b!401998 (= res!231489 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6684))))

(declare-fun b!401999 () Bool)

(declare-fun res!231487 () Bool)

(assert (=> b!401999 (=> (not res!231487) (not e!242281))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401999 (= res!231487 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11854 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402000 () Bool)

(declare-fun res!231484 () Bool)

(assert (=> b!402000 (=> (not res!231484) (not e!242283))))

(declare-fun arrayContainsKey!0 (array!24105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402000 (= res!231484 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!402001 () Bool)

(declare-fun e!242284 () Bool)

(declare-datatypes ((V!14571 0))(
  ( (V!14572 (val!5094 Int)) )
))
(declare-datatypes ((tuple2!6764 0))(
  ( (tuple2!6765 (_1!3393 (_ BitVec 64)) (_2!3393 V!14571)) )
))
(declare-datatypes ((List!6688 0))(
  ( (Nil!6685) (Cons!6684 (h!7540 tuple2!6764) (t!11862 List!6688)) )
))
(declare-datatypes ((ListLongMap!5677 0))(
  ( (ListLongMap!5678 (toList!2854 List!6688)) )
))
(declare-fun call!28315 () ListLongMap!5677)

(declare-fun call!28316 () ListLongMap!5677)

(assert (=> b!402001 (= e!242284 (= call!28315 call!28316))))

(declare-fun b!402002 () Bool)

(declare-fun res!231478 () Bool)

(assert (=> b!402002 (=> (not res!231478) (not e!242283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402002 (= res!231478 (validMask!0 mask!1025))))

(declare-fun b!402003 () Bool)

(declare-fun e!242280 () Bool)

(declare-fun e!242286 () Bool)

(declare-fun mapRes!16770 () Bool)

(assert (=> b!402003 (= e!242280 (and e!242286 mapRes!16770))))

(declare-fun condMapEmpty!16770 () Bool)

(declare-datatypes ((ValueCell!4706 0))(
  ( (ValueCellFull!4706 (v!7341 V!14571)) (EmptyCell!4706) )
))
(declare-datatypes ((array!24107 0))(
  ( (array!24108 (arr!11503 (Array (_ BitVec 32) ValueCell!4706)) (size!11855 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24107)

(declare-fun mapDefault!16770 () ValueCell!4706)

