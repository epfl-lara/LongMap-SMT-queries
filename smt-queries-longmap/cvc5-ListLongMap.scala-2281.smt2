; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37148 () Bool)

(assert start!37148)

(declare-fun b_free!8275 () Bool)

(declare-fun b_next!8275 () Bool)

(assert (=> start!37148 (= b_free!8275 (not b_next!8275))))

(declare-fun tp!29540 () Bool)

(declare-fun b_and!15517 () Bool)

(assert (=> start!37148 (= tp!29540 b_and!15517)))

(declare-fun b!374622 () Bool)

(declare-fun res!211300 () Bool)

(declare-fun e!228297 () Bool)

(assert (=> b!374622 (=> (not res!211300) (not e!228297))))

(declare-datatypes ((array!21785 0))(
  ( (array!21786 (arr!10361 (Array (_ BitVec 32) (_ BitVec 64))) (size!10713 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21785)

(declare-datatypes ((List!5838 0))(
  ( (Nil!5835) (Cons!5834 (h!6690 (_ BitVec 64)) (t!10988 List!5838)) )
))
(declare-fun arrayNoDuplicates!0 (array!21785 (_ BitVec 32) List!5838) Bool)

(assert (=> b!374622 (= res!211300 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5835))))

(declare-fun b!374623 () Bool)

(declare-fun res!211293 () Bool)

(assert (=> b!374623 (=> (not res!211293) (not e!228297))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374623 (= res!211293 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10713 _keys!658))))))

(declare-fun b!374624 () Bool)

(declare-fun e!228301 () Bool)

(declare-fun e!228299 () Bool)

(declare-fun mapRes!14949 () Bool)

(assert (=> b!374624 (= e!228301 (and e!228299 mapRes!14949))))

(declare-fun condMapEmpty!14949 () Bool)

(declare-datatypes ((V!13003 0))(
  ( (V!13004 (val!4506 Int)) )
))
(declare-datatypes ((ValueCell!4118 0))(
  ( (ValueCellFull!4118 (v!6703 V!13003)) (EmptyCell!4118) )
))
(declare-datatypes ((array!21787 0))(
  ( (array!21788 (arr!10362 (Array (_ BitVec 32) ValueCell!4118)) (size!10714 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21787)

(declare-fun mapDefault!14949 () ValueCell!4118)

