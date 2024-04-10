; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38500 () Bool)

(assert start!38500)

(declare-fun b!397646 () Bool)

(declare-fun e!240456 () Bool)

(assert (=> b!397646 (= e!240456 false)))

(declare-fun lt!187336 () Bool)

(declare-datatypes ((array!23751 0))(
  ( (array!23752 (arr!11325 (Array (_ BitVec 32) (_ BitVec 64))) (size!11677 (_ BitVec 32))) )
))
(declare-fun lt!187337 () array!23751)

(declare-datatypes ((List!6554 0))(
  ( (Nil!6551) (Cons!6550 (h!7406 (_ BitVec 64)) (t!11728 List!6554)) )
))
(declare-fun arrayNoDuplicates!0 (array!23751 (_ BitVec 32) List!6554) Bool)

(assert (=> b!397646 (= lt!187336 (arrayNoDuplicates!0 lt!187337 #b00000000000000000000000000000000 Nil!6551))))

(declare-fun b!397647 () Bool)

(declare-fun res!228366 () Bool)

(declare-fun e!240454 () Bool)

(assert (=> b!397647 (=> (not res!228366) (not e!240454))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!23751)

(assert (=> b!397647 (= res!228366 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11677 _keys!709))))))

(declare-fun mapIsEmpty!16500 () Bool)

(declare-fun mapRes!16500 () Bool)

(assert (=> mapIsEmpty!16500 mapRes!16500))

(declare-fun b!397648 () Bool)

(declare-fun e!240452 () Bool)

(declare-fun tp_is_empty!9919 () Bool)

(assert (=> b!397648 (= e!240452 tp_is_empty!9919)))

(declare-fun b!397649 () Bool)

(declare-fun e!240451 () Bool)

(declare-fun e!240455 () Bool)

(assert (=> b!397649 (= e!240451 (and e!240455 mapRes!16500))))

(declare-fun condMapEmpty!16500 () Bool)

(declare-datatypes ((V!14331 0))(
  ( (V!14332 (val!5004 Int)) )
))
(declare-datatypes ((ValueCell!4616 0))(
  ( (ValueCellFull!4616 (v!7251 V!14331)) (EmptyCell!4616) )
))
(declare-datatypes ((array!23753 0))(
  ( (array!23754 (arr!11326 (Array (_ BitVec 32) ValueCell!4616)) (size!11678 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23753)

(declare-fun mapDefault!16500 () ValueCell!4616)

