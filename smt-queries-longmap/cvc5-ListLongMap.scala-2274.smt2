; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37106 () Bool)

(assert start!37106)

(declare-fun b_free!8233 () Bool)

(declare-fun b_next!8233 () Bool)

(assert (=> start!37106 (= b_free!8233 (not b_next!8233))))

(declare-fun tp!29415 () Bool)

(declare-fun b_and!15475 () Bool)

(assert (=> start!37106 (= tp!29415 b_and!15475)))

(declare-fun b!373677 () Bool)

(declare-fun e!227797 () Bool)

(declare-fun e!227794 () Bool)

(assert (=> b!373677 (= e!227797 e!227794)))

(declare-fun res!210545 () Bool)

(assert (=> b!373677 (=> (not res!210545) (not e!227794))))

(declare-datatypes ((array!21701 0))(
  ( (array!21702 (arr!10319 (Array (_ BitVec 32) (_ BitVec 64))) (size!10671 (_ BitVec 32))) )
))
(declare-fun lt!171749 () array!21701)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21701 (_ BitVec 32)) Bool)

(assert (=> b!373677 (= res!210545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171749 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!21701)

(assert (=> b!373677 (= lt!171749 (array!21702 (store (arr!10319 _keys!658) i!548 k!778) (size!10671 _keys!658)))))

(declare-fun b!373678 () Bool)

(declare-fun res!210536 () Bool)

(assert (=> b!373678 (=> (not res!210536) (not e!227797))))

(assert (=> b!373678 (= res!210536 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10671 _keys!658))))))

(declare-fun b!373679 () Bool)

(declare-fun res!210540 () Bool)

(assert (=> b!373679 (=> (not res!210540) (not e!227797))))

(declare-datatypes ((List!5801 0))(
  ( (Nil!5798) (Cons!5797 (h!6653 (_ BitVec 64)) (t!10951 List!5801)) )
))
(declare-fun arrayNoDuplicates!0 (array!21701 (_ BitVec 32) List!5801) Bool)

(assert (=> b!373679 (= res!210540 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5798))))

(declare-fun mapIsEmpty!14886 () Bool)

(declare-fun mapRes!14886 () Bool)

(assert (=> mapIsEmpty!14886 mapRes!14886))

(declare-fun b!373680 () Bool)

(declare-fun e!227793 () Bool)

(declare-fun e!227795 () Bool)

(assert (=> b!373680 (= e!227793 e!227795)))

(declare-fun res!210542 () Bool)

(assert (=> b!373680 (=> res!210542 e!227795)))

(assert (=> b!373680 (= res!210542 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!12947 0))(
  ( (V!12948 (val!4485 Int)) )
))
(declare-datatypes ((tuple2!5956 0))(
  ( (tuple2!5957 (_1!2989 (_ BitVec 64)) (_2!2989 V!12947)) )
))
(declare-datatypes ((List!5802 0))(
  ( (Nil!5799) (Cons!5798 (h!6654 tuple2!5956) (t!10952 List!5802)) )
))
(declare-datatypes ((ListLongMap!4869 0))(
  ( (ListLongMap!4870 (toList!2450 List!5802)) )
))
(declare-fun lt!171758 () ListLongMap!4869)

(declare-fun lt!171760 () ListLongMap!4869)

(assert (=> b!373680 (= lt!171758 lt!171760)))

(declare-fun lt!171761 () ListLongMap!4869)

(declare-fun lt!171757 () tuple2!5956)

(declare-fun +!796 (ListLongMap!4869 tuple2!5956) ListLongMap!4869)

(assert (=> b!373680 (= lt!171760 (+!796 lt!171761 lt!171757))))

(declare-fun v!373 () V!12947)

(declare-datatypes ((Unit!11498 0))(
  ( (Unit!11499) )
))
(declare-fun lt!171752 () Unit!11498)

(declare-fun zeroValue!472 () V!12947)

(declare-fun lt!171748 () ListLongMap!4869)

(declare-fun addCommutativeForDiffKeys!220 (ListLongMap!4869 (_ BitVec 64) V!12947 (_ BitVec 64) V!12947) Unit!11498)

(assert (=> b!373680 (= lt!171752 (addCommutativeForDiffKeys!220 lt!171748 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171754 () ListLongMap!4869)

(declare-fun lt!171750 () tuple2!5956)

(assert (=> b!373680 (= lt!171754 (+!796 lt!171758 lt!171750))))

(declare-fun lt!171755 () ListLongMap!4869)

(declare-fun lt!171747 () tuple2!5956)

(assert (=> b!373680 (= lt!171758 (+!796 lt!171755 lt!171747))))

(declare-fun lt!171753 () ListLongMap!4869)

(declare-fun lt!171751 () ListLongMap!4869)

(assert (=> b!373680 (= lt!171753 lt!171751)))

(assert (=> b!373680 (= lt!171751 (+!796 lt!171761 lt!171750))))

(assert (=> b!373680 (= lt!171761 (+!796 lt!171748 lt!171747))))

(declare-fun lt!171756 () ListLongMap!4869)

(assert (=> b!373680 (= lt!171754 (+!796 (+!796 lt!171756 lt!171747) lt!171750))))

(declare-fun minValue!472 () V!12947)

(assert (=> b!373680 (= lt!171750 (tuple2!5957 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373680 (= lt!171747 (tuple2!5957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373681 () Bool)

(declare-fun e!227798 () Bool)

(declare-fun e!227792 () Bool)

(assert (=> b!373681 (= e!227798 (and e!227792 mapRes!14886))))

(declare-fun condMapEmpty!14886 () Bool)

(declare-datatypes ((ValueCell!4097 0))(
  ( (ValueCellFull!4097 (v!6682 V!12947)) (EmptyCell!4097) )
))
(declare-datatypes ((array!21703 0))(
  ( (array!21704 (arr!10320 (Array (_ BitVec 32) ValueCell!4097)) (size!10672 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21703)

(declare-fun mapDefault!14886 () ValueCell!4097)

