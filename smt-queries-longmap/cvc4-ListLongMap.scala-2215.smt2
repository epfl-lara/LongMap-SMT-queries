; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36756 () Bool)

(assert start!36756)

(declare-fun b!366822 () Bool)

(declare-fun e!224559 () Bool)

(declare-fun tp_is_empty!8531 () Bool)

(assert (=> b!366822 (= e!224559 tp_is_empty!8531)))

(declare-fun b!366823 () Bool)

(declare-fun res!205260 () Bool)

(declare-fun e!224558 () Bool)

(assert (=> b!366823 (=> (not res!205260) (not e!224558))))

(declare-datatypes ((array!21021 0))(
  ( (array!21022 (arr!9979 (Array (_ BitVec 32) (_ BitVec 64))) (size!10331 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21021)

(declare-datatypes ((List!5554 0))(
  ( (Nil!5551) (Cons!5550 (h!6406 (_ BitVec 64)) (t!10704 List!5554)) )
))
(declare-fun arrayNoDuplicates!0 (array!21021 (_ BitVec 32) List!5554) Bool)

(assert (=> b!366823 (= res!205260 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5551))))

(declare-fun mapNonEmpty!14361 () Bool)

(declare-fun mapRes!14361 () Bool)

(declare-fun tp!28437 () Bool)

(declare-fun e!224557 () Bool)

(assert (=> mapNonEmpty!14361 (= mapRes!14361 (and tp!28437 e!224557))))

(declare-datatypes ((V!12479 0))(
  ( (V!12480 (val!4310 Int)) )
))
(declare-datatypes ((ValueCell!3922 0))(
  ( (ValueCellFull!3922 (v!6507 V!12479)) (EmptyCell!3922) )
))
(declare-datatypes ((array!21023 0))(
  ( (array!21024 (arr!9980 (Array (_ BitVec 32) ValueCell!3922)) (size!10332 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21023)

(declare-fun mapValue!14361 () ValueCell!3922)

(declare-fun mapKey!14361 () (_ BitVec 32))

(declare-fun mapRest!14361 () (Array (_ BitVec 32) ValueCell!3922))

(assert (=> mapNonEmpty!14361 (= (arr!9980 _values!506) (store mapRest!14361 mapKey!14361 mapValue!14361))))

(declare-fun b!366824 () Bool)

(declare-fun res!205258 () Bool)

(assert (=> b!366824 (=> (not res!205258) (not e!224558))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366824 (= res!205258 (validKeyInArray!0 k!778))))

(declare-fun b!366826 () Bool)

(declare-fun res!205261 () Bool)

(assert (=> b!366826 (=> (not res!205261) (not e!224558))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21021 (_ BitVec 32)) Bool)

(assert (=> b!366826 (= res!205261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14361 () Bool)

(assert (=> mapIsEmpty!14361 mapRes!14361))

(declare-fun b!366827 () Bool)

(declare-fun e!224561 () Bool)

(assert (=> b!366827 (= e!224561 (and e!224559 mapRes!14361))))

(declare-fun condMapEmpty!14361 () Bool)

(declare-fun mapDefault!14361 () ValueCell!3922)

