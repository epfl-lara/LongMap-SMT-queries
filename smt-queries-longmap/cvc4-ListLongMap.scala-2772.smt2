; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40488 () Bool)

(assert start!40488)

(declare-fun b_free!10559 () Bool)

(declare-fun b_next!10559 () Bool)

(assert (=> start!40488 (= b_free!10559 (not b_next!10559))))

(declare-fun tp!37454 () Bool)

(declare-fun b_and!18543 () Bool)

(assert (=> start!40488 (= tp!37454 b_and!18543)))

(declare-fun b!446011 () Bool)

(declare-fun res!264720 () Bool)

(declare-fun e!262066 () Bool)

(assert (=> b!446011 (=> (not res!264720) (not e!262066))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446011 (= res!264720 (validKeyInArray!0 k!794))))

(declare-fun b!446012 () Bool)

(declare-fun res!264717 () Bool)

(assert (=> b!446012 (=> (not res!264717) (not e!262066))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27553 0))(
  ( (array!27554 (arr!13224 (Array (_ BitVec 32) (_ BitVec 64))) (size!13576 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27553)

(assert (=> b!446012 (= res!264717 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13576 _keys!709))))))

(declare-fun b!446013 () Bool)

(declare-fun e!262070 () Bool)

(declare-datatypes ((V!16935 0))(
  ( (V!16936 (val!5981 Int)) )
))
(declare-datatypes ((tuple2!7860 0))(
  ( (tuple2!7861 (_1!3941 (_ BitVec 64)) (_2!3941 V!16935)) )
))
(declare-datatypes ((List!7911 0))(
  ( (Nil!7908) (Cons!7907 (h!8763 tuple2!7860) (t!13669 List!7911)) )
))
(declare-datatypes ((ListLongMap!6773 0))(
  ( (ListLongMap!6774 (toList!3402 List!7911)) )
))
(declare-fun call!29634 () ListLongMap!6773)

(declare-fun call!29633 () ListLongMap!6773)

(assert (=> b!446013 (= e!262070 (= call!29634 call!29633))))

(declare-fun b!446014 () Bool)

(declare-fun e!262069 () Bool)

(declare-fun e!262065 () Bool)

(declare-fun mapRes!19437 () Bool)

(assert (=> b!446014 (= e!262069 (and e!262065 mapRes!19437))))

(declare-fun condMapEmpty!19437 () Bool)

(declare-datatypes ((ValueCell!5593 0))(
  ( (ValueCellFull!5593 (v!8232 V!16935)) (EmptyCell!5593) )
))
(declare-datatypes ((array!27555 0))(
  ( (array!27556 (arr!13225 (Array (_ BitVec 32) ValueCell!5593)) (size!13577 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27555)

(declare-fun mapDefault!19437 () ValueCell!5593)

