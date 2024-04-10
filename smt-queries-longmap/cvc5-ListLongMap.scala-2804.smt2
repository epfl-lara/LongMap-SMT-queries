; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40712 () Bool)

(assert start!40712)

(declare-fun b_free!10723 () Bool)

(declare-fun b_next!10723 () Bool)

(assert (=> start!40712 (= b_free!10723 (not b_next!10723))))

(declare-fun tp!37988 () Bool)

(declare-fun b_and!18731 () Bool)

(assert (=> start!40712 (= tp!37988 b_and!18731)))

(declare-fun b!450562 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((V!17187 0))(
  ( (V!17188 (val!6075 Int)) )
))
(declare-datatypes ((tuple2!7980 0))(
  ( (tuple2!7981 (_1!4001 (_ BitVec 64)) (_2!4001 V!17187)) )
))
(declare-datatypes ((List!8047 0))(
  ( (Nil!8044) (Cons!8043 (h!8899 tuple2!7980) (t!13809 List!8047)) )
))
(declare-datatypes ((ListLongMap!6893 0))(
  ( (ListLongMap!6894 (toList!3462 List!8047)) )
))
(declare-fun call!29761 () ListLongMap!6893)

(declare-fun v!412 () V!17187)

(declare-fun e!264015 () Bool)

(declare-fun call!29762 () ListLongMap!6893)

(declare-fun +!1543 (ListLongMap!6893 tuple2!7980) ListLongMap!6893)

(assert (=> b!450562 (= e!264015 (= call!29761 (+!1543 call!29762 (tuple2!7981 k!794 v!412))))))

(declare-fun b!450563 () Bool)

(declare-fun res!268185 () Bool)

(declare-fun e!264016 () Bool)

(assert (=> b!450563 (=> (not res!268185) (not e!264016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450563 (= res!268185 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!19725 () Bool)

(declare-fun mapRes!19725 () Bool)

(assert (=> mapIsEmpty!19725 mapRes!19725))

(declare-fun b!450564 () Bool)

(declare-fun e!264019 () Bool)

(declare-fun e!264018 () Bool)

(assert (=> b!450564 (= e!264019 (and e!264018 mapRes!19725))))

(declare-fun condMapEmpty!19725 () Bool)

(declare-datatypes ((ValueCell!5687 0))(
  ( (ValueCellFull!5687 (v!8330 V!17187)) (EmptyCell!5687) )
))
(declare-datatypes ((array!27929 0))(
  ( (array!27930 (arr!13410 (Array (_ BitVec 32) ValueCell!5687)) (size!13762 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27929)

(declare-fun mapDefault!19725 () ValueCell!5687)

