; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37706 () Bool)

(assert start!37706)

(declare-fun b_free!8809 () Bool)

(declare-fun b_next!8809 () Bool)

(assert (=> start!37706 (= b_free!8809 (not b_next!8809))))

(declare-fun tp!31179 () Bool)

(declare-fun b_and!16051 () Bool)

(assert (=> start!37706 (= tp!31179 b_and!16051)))

(declare-fun mapNonEmpty!15786 () Bool)

(declare-fun mapRes!15786 () Bool)

(declare-fun tp!31178 () Bool)

(declare-fun e!234452 () Bool)

(assert (=> mapNonEmpty!15786 (= mapRes!15786 (and tp!31178 e!234452))))

(declare-datatypes ((V!13747 0))(
  ( (V!13748 (val!4785 Int)) )
))
(declare-datatypes ((ValueCell!4397 0))(
  ( (ValueCellFull!4397 (v!6982 V!13747)) (EmptyCell!4397) )
))
(declare-datatypes ((array!22857 0))(
  ( (array!22858 (arr!10897 (Array (_ BitVec 32) ValueCell!4397)) (size!11249 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22857)

(declare-fun mapRest!15786 () (Array (_ BitVec 32) ValueCell!4397))

(declare-fun mapKey!15786 () (_ BitVec 32))

(declare-fun mapValue!15786 () ValueCell!4397)

(assert (=> mapNonEmpty!15786 (= (arr!10897 _values!506) (store mapRest!15786 mapKey!15786 mapValue!15786))))

(declare-fun b!386480 () Bool)

(declare-fun tp_is_empty!9481 () Bool)

(assert (=> b!386480 (= e!234452 tp_is_empty!9481)))

(declare-fun b!386481 () Bool)

(declare-fun res!220639 () Bool)

(declare-fun e!234449 () Bool)

(assert (=> b!386481 (=> (not res!220639) (not e!234449))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386481 (= res!220639 (validKeyInArray!0 k!778))))

(declare-fun b!386482 () Bool)

(declare-fun res!220641 () Bool)

(assert (=> b!386482 (=> (not res!220641) (not e!234449))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22859 0))(
  ( (array!22860 (arr!10898 (Array (_ BitVec 32) (_ BitVec 64))) (size!11250 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22859)

(assert (=> b!386482 (= res!220641 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11250 _keys!658))))))

(declare-fun b!386483 () Bool)

(declare-fun res!220640 () Bool)

(assert (=> b!386483 (=> (not res!220640) (not e!234449))))

(declare-datatypes ((List!6279 0))(
  ( (Nil!6276) (Cons!6275 (h!7131 (_ BitVec 64)) (t!11429 List!6279)) )
))
(declare-fun arrayNoDuplicates!0 (array!22859 (_ BitVec 32) List!6279) Bool)

(assert (=> b!386483 (= res!220640 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6276))))

(declare-fun b!386484 () Bool)

(declare-fun e!234450 () Bool)

(assert (=> b!386484 (= e!234449 e!234450)))

(declare-fun res!220638 () Bool)

(assert (=> b!386484 (=> (not res!220638) (not e!234450))))

(declare-fun lt!181818 () array!22859)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22859 (_ BitVec 32)) Bool)

(assert (=> b!386484 (= res!220638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181818 mask!970))))

(assert (=> b!386484 (= lt!181818 (array!22860 (store (arr!10898 _keys!658) i!548 k!778) (size!11250 _keys!658)))))

(declare-fun b!386485 () Bool)

(declare-fun res!220644 () Bool)

(assert (=> b!386485 (=> (not res!220644) (not e!234450))))

(assert (=> b!386485 (= res!220644 (arrayNoDuplicates!0 lt!181818 #b00000000000000000000000000000000 Nil!6276))))

(declare-fun mapIsEmpty!15786 () Bool)

(assert (=> mapIsEmpty!15786 mapRes!15786))

(declare-fun b!386486 () Bool)

(declare-fun res!220637 () Bool)

(assert (=> b!386486 (=> (not res!220637) (not e!234449))))

(assert (=> b!386486 (= res!220637 (or (= (select (arr!10898 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10898 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220645 () Bool)

(assert (=> start!37706 (=> (not res!220645) (not e!234449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37706 (= res!220645 (validMask!0 mask!970))))

(assert (=> start!37706 e!234449))

(declare-fun e!234448 () Bool)

(declare-fun array_inv!8016 (array!22857) Bool)

(assert (=> start!37706 (and (array_inv!8016 _values!506) e!234448)))

(assert (=> start!37706 tp!31179))

(assert (=> start!37706 true))

(assert (=> start!37706 tp_is_empty!9481))

(declare-fun array_inv!8017 (array!22859) Bool)

(assert (=> start!37706 (array_inv!8017 _keys!658)))

(declare-fun b!386487 () Bool)

(declare-fun res!220646 () Bool)

(assert (=> b!386487 (=> (not res!220646) (not e!234449))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386487 (= res!220646 (and (= (size!11249 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11250 _keys!658) (size!11249 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386488 () Bool)

(declare-fun res!220642 () Bool)

(assert (=> b!386488 (=> (not res!220642) (not e!234449))))

(declare-fun arrayContainsKey!0 (array!22859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386488 (= res!220642 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386489 () Bool)

(declare-fun res!220643 () Bool)

(assert (=> b!386489 (=> (not res!220643) (not e!234449))))

(assert (=> b!386489 (= res!220643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386490 () Bool)

(assert (=> b!386490 (= e!234450 false)))

(declare-datatypes ((tuple2!6432 0))(
  ( (tuple2!6433 (_1!3227 (_ BitVec 64)) (_2!3227 V!13747)) )
))
(declare-datatypes ((List!6280 0))(
  ( (Nil!6277) (Cons!6276 (h!7132 tuple2!6432) (t!11430 List!6280)) )
))
(declare-datatypes ((ListLongMap!5345 0))(
  ( (ListLongMap!5346 (toList!2688 List!6280)) )
))
(declare-fun lt!181816 () ListLongMap!5345)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13747)

(declare-fun v!373 () V!13747)

(declare-fun minValue!472 () V!13747)

(declare-fun getCurrentListMapNoExtraKeys!917 (array!22859 array!22857 (_ BitVec 32) (_ BitVec 32) V!13747 V!13747 (_ BitVec 32) Int) ListLongMap!5345)

(assert (=> b!386490 (= lt!181816 (getCurrentListMapNoExtraKeys!917 lt!181818 (array!22858 (store (arr!10897 _values!506) i!548 (ValueCellFull!4397 v!373)) (size!11249 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181817 () ListLongMap!5345)

(assert (=> b!386490 (= lt!181817 (getCurrentListMapNoExtraKeys!917 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386491 () Bool)

(declare-fun e!234451 () Bool)

(assert (=> b!386491 (= e!234451 tp_is_empty!9481)))

(declare-fun b!386492 () Bool)

(assert (=> b!386492 (= e!234448 (and e!234451 mapRes!15786))))

(declare-fun condMapEmpty!15786 () Bool)

(declare-fun mapDefault!15786 () ValueCell!4397)

