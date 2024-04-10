; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34700 () Bool)

(assert start!34700)

(declare-fun b_free!7507 () Bool)

(declare-fun b_next!7507 () Bool)

(assert (=> start!34700 (= b_free!7507 (not b_next!7507))))

(declare-fun tp!26085 () Bool)

(declare-fun b_and!14727 () Bool)

(assert (=> start!34700 (= tp!26085 b_and!14727)))

(declare-fun b!346781 () Bool)

(declare-fun res!191858 () Bool)

(declare-fun e!212521 () Bool)

(assert (=> b!346781 (=> (not res!191858) (not e!212521))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10923 0))(
  ( (V!10924 (val!3774 Int)) )
))
(declare-datatypes ((ValueCell!3386 0))(
  ( (ValueCellFull!3386 (v!5956 V!10923)) (EmptyCell!3386) )
))
(declare-datatypes ((array!18511 0))(
  ( (array!18512 (arr!8766 (Array (_ BitVec 32) ValueCell!3386)) (size!9118 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18511)

(declare-datatypes ((array!18513 0))(
  ( (array!18514 (arr!8767 (Array (_ BitVec 32) (_ BitVec 64))) (size!9119 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18513)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346781 (= res!191858 (and (= (size!9118 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9119 _keys!1895) (size!9118 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346782 () Bool)

(declare-fun res!191856 () Bool)

(assert (=> b!346782 (=> (not res!191856) (not e!212521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18513 (_ BitVec 32)) Bool)

(assert (=> b!346782 (= res!191856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346783 () Bool)

(declare-fun res!191851 () Bool)

(assert (=> b!346783 (=> (not res!191851) (not e!212521))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10923)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10923)

(declare-datatypes ((tuple2!5462 0))(
  ( (tuple2!5463 (_1!2742 (_ BitVec 64)) (_2!2742 V!10923)) )
))
(declare-datatypes ((List!5084 0))(
  ( (Nil!5081) (Cons!5080 (h!5936 tuple2!5462) (t!10212 List!5084)) )
))
(declare-datatypes ((ListLongMap!4375 0))(
  ( (ListLongMap!4376 (toList!2203 List!5084)) )
))
(declare-fun contains!2267 (ListLongMap!4375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1724 (array!18513 array!18511 (_ BitVec 32) (_ BitVec 32) V!10923 V!10923 (_ BitVec 32) Int) ListLongMap!4375)

(assert (=> b!346783 (= res!191851 (not (contains!2267 (getCurrentListMap!1724 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346785 () Bool)

(declare-fun e!212522 () Bool)

(declare-fun tp_is_empty!7459 () Bool)

(assert (=> b!346785 (= e!212522 tp_is_empty!7459)))

(declare-fun mapIsEmpty!12645 () Bool)

(declare-fun mapRes!12645 () Bool)

(assert (=> mapIsEmpty!12645 mapRes!12645))

(declare-fun b!346786 () Bool)

(declare-fun res!191857 () Bool)

(assert (=> b!346786 (=> (not res!191857) (not e!212521))))

(declare-datatypes ((List!5085 0))(
  ( (Nil!5082) (Cons!5081 (h!5937 (_ BitVec 64)) (t!10213 List!5085)) )
))
(declare-fun arrayNoDuplicates!0 (array!18513 (_ BitVec 32) List!5085) Bool)

(assert (=> b!346786 (= res!191857 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5082))))

(declare-fun b!346784 () Bool)

(declare-fun res!191853 () Bool)

(assert (=> b!346784 (=> (not res!191853) (not e!212521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346784 (= res!191853 (validKeyInArray!0 k!1348))))

(declare-fun res!191855 () Bool)

(assert (=> start!34700 (=> (not res!191855) (not e!212521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34700 (= res!191855 (validMask!0 mask!2385))))

(assert (=> start!34700 e!212521))

(assert (=> start!34700 true))

(assert (=> start!34700 tp_is_empty!7459))

(assert (=> start!34700 tp!26085))

(declare-fun e!212526 () Bool)

(declare-fun array_inv!6494 (array!18511) Bool)

(assert (=> start!34700 (and (array_inv!6494 _values!1525) e!212526)))

(declare-fun array_inv!6495 (array!18513) Bool)

(assert (=> start!34700 (array_inv!6495 _keys!1895)))

(declare-fun b!346787 () Bool)

(declare-fun res!191854 () Bool)

(declare-fun e!212523 () Bool)

(assert (=> b!346787 (=> (not res!191854) (not e!212523))))

(declare-datatypes ((SeekEntryResult!3382 0))(
  ( (MissingZero!3382 (index!15707 (_ BitVec 32))) (Found!3382 (index!15708 (_ BitVec 32))) (Intermediate!3382 (undefined!4194 Bool) (index!15709 (_ BitVec 32)) (x!34548 (_ BitVec 32))) (Undefined!3382) (MissingVacant!3382 (index!15710 (_ BitVec 32))) )
))
(declare-fun lt!163431 () SeekEntryResult!3382)

(declare-fun arrayContainsKey!0 (array!18513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346787 (= res!191854 (arrayContainsKey!0 _keys!1895 k!1348 (index!15708 lt!163431)))))

(declare-fun b!346788 () Bool)

(assert (=> b!346788 (= e!212523 (not true))))

(assert (=> b!346788 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10765 0))(
  ( (Unit!10766) )
))
(declare-fun lt!163432 () Unit!10765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18513 (_ BitVec 64) (_ BitVec 32)) Unit!10765)

(assert (=> b!346788 (= lt!163432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15708 lt!163431)))))

(declare-fun b!346789 () Bool)

(declare-fun e!212524 () Bool)

(assert (=> b!346789 (= e!212524 tp_is_empty!7459)))

(declare-fun b!346790 () Bool)

(assert (=> b!346790 (= e!212521 e!212523)))

(declare-fun res!191852 () Bool)

(assert (=> b!346790 (=> (not res!191852) (not e!212523))))

(assert (=> b!346790 (= res!191852 (and (is-Found!3382 lt!163431) (= (select (arr!8767 _keys!1895) (index!15708 lt!163431)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18513 (_ BitVec 32)) SeekEntryResult!3382)

(assert (=> b!346790 (= lt!163431 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346791 () Bool)

(assert (=> b!346791 (= e!212526 (and e!212522 mapRes!12645))))

(declare-fun condMapEmpty!12645 () Bool)

(declare-fun mapDefault!12645 () ValueCell!3386)

