; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37712 () Bool)

(assert start!37712)

(declare-fun b_free!8815 () Bool)

(declare-fun b_next!8815 () Bool)

(assert (=> start!37712 (= b_free!8815 (not b_next!8815))))

(declare-fun tp!31197 () Bool)

(declare-fun b_and!16057 () Bool)

(assert (=> start!37712 (= tp!31197 b_and!16057)))

(declare-fun b!386597 () Bool)

(declare-fun e!234505 () Bool)

(declare-fun e!234501 () Bool)

(assert (=> b!386597 (= e!234505 e!234501)))

(declare-fun res!220736 () Bool)

(assert (=> b!386597 (=> (not res!220736) (not e!234501))))

(declare-datatypes ((array!22869 0))(
  ( (array!22870 (arr!10903 (Array (_ BitVec 32) (_ BitVec 64))) (size!11255 (_ BitVec 32))) )
))
(declare-fun lt!181844 () array!22869)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22869 (_ BitVec 32)) Bool)

(assert (=> b!386597 (= res!220736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181844 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22869)

(assert (=> b!386597 (= lt!181844 (array!22870 (store (arr!10903 _keys!658) i!548 k!778) (size!11255 _keys!658)))))

(declare-fun b!386598 () Bool)

(declare-fun res!220735 () Bool)

(assert (=> b!386598 (=> (not res!220735) (not e!234501))))

(declare-datatypes ((List!6284 0))(
  ( (Nil!6281) (Cons!6280 (h!7136 (_ BitVec 64)) (t!11434 List!6284)) )
))
(declare-fun arrayNoDuplicates!0 (array!22869 (_ BitVec 32) List!6284) Bool)

(assert (=> b!386598 (= res!220735 (arrayNoDuplicates!0 lt!181844 #b00000000000000000000000000000000 Nil!6281))))

(declare-fun b!386599 () Bool)

(declare-fun res!220734 () Bool)

(assert (=> b!386599 (=> (not res!220734) (not e!234505))))

(assert (=> b!386599 (= res!220734 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6281))))

(declare-fun b!386600 () Bool)

(assert (=> b!386600 (= e!234501 false)))

(declare-datatypes ((V!13755 0))(
  ( (V!13756 (val!4788 Int)) )
))
(declare-datatypes ((tuple2!6436 0))(
  ( (tuple2!6437 (_1!3229 (_ BitVec 64)) (_2!3229 V!13755)) )
))
(declare-datatypes ((List!6285 0))(
  ( (Nil!6282) (Cons!6281 (h!7137 tuple2!6436) (t!11435 List!6285)) )
))
(declare-datatypes ((ListLongMap!5349 0))(
  ( (ListLongMap!5350 (toList!2690 List!6285)) )
))
(declare-fun lt!181843 () ListLongMap!5349)

(declare-datatypes ((ValueCell!4400 0))(
  ( (ValueCellFull!4400 (v!6985 V!13755)) (EmptyCell!4400) )
))
(declare-datatypes ((array!22871 0))(
  ( (array!22872 (arr!10904 (Array (_ BitVec 32) ValueCell!4400)) (size!11256 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22871)

(declare-fun zeroValue!472 () V!13755)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13755)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13755)

(declare-fun getCurrentListMapNoExtraKeys!919 (array!22869 array!22871 (_ BitVec 32) (_ BitVec 32) V!13755 V!13755 (_ BitVec 32) Int) ListLongMap!5349)

(assert (=> b!386600 (= lt!181843 (getCurrentListMapNoExtraKeys!919 lt!181844 (array!22872 (store (arr!10904 _values!506) i!548 (ValueCellFull!4400 v!373)) (size!11256 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181845 () ListLongMap!5349)

(assert (=> b!386600 (= lt!181845 (getCurrentListMapNoExtraKeys!919 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386601 () Bool)

(declare-fun res!220727 () Bool)

(assert (=> b!386601 (=> (not res!220727) (not e!234505))))

(assert (=> b!386601 (= res!220727 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11255 _keys!658))))))

(declare-fun b!386602 () Bool)

(declare-fun e!234503 () Bool)

(declare-fun tp_is_empty!9487 () Bool)

(assert (=> b!386602 (= e!234503 tp_is_empty!9487)))

(declare-fun b!386603 () Bool)

(declare-fun res!220732 () Bool)

(assert (=> b!386603 (=> (not res!220732) (not e!234505))))

(assert (=> b!386603 (= res!220732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15795 () Bool)

(declare-fun mapRes!15795 () Bool)

(assert (=> mapIsEmpty!15795 mapRes!15795))

(declare-fun mapNonEmpty!15795 () Bool)

(declare-fun tp!31196 () Bool)

(assert (=> mapNonEmpty!15795 (= mapRes!15795 (and tp!31196 e!234503))))

(declare-fun mapKey!15795 () (_ BitVec 32))

(declare-fun mapRest!15795 () (Array (_ BitVec 32) ValueCell!4400))

(declare-fun mapValue!15795 () ValueCell!4400)

(assert (=> mapNonEmpty!15795 (= (arr!10904 _values!506) (store mapRest!15795 mapKey!15795 mapValue!15795))))

(declare-fun b!386605 () Bool)

(declare-fun res!220730 () Bool)

(assert (=> b!386605 (=> (not res!220730) (not e!234505))))

(assert (=> b!386605 (= res!220730 (or (= (select (arr!10903 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10903 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386606 () Bool)

(declare-fun res!220731 () Bool)

(assert (=> b!386606 (=> (not res!220731) (not e!234505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386606 (= res!220731 (validKeyInArray!0 k!778))))

(declare-fun b!386607 () Bool)

(declare-fun res!220728 () Bool)

(assert (=> b!386607 (=> (not res!220728) (not e!234505))))

(assert (=> b!386607 (= res!220728 (and (= (size!11256 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11255 _keys!658) (size!11256 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386608 () Bool)

(declare-fun e!234506 () Bool)

(assert (=> b!386608 (= e!234506 tp_is_empty!9487)))

(declare-fun b!386609 () Bool)

(declare-fun res!220733 () Bool)

(assert (=> b!386609 (=> (not res!220733) (not e!234505))))

(declare-fun arrayContainsKey!0 (array!22869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386609 (= res!220733 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386604 () Bool)

(declare-fun e!234504 () Bool)

(assert (=> b!386604 (= e!234504 (and e!234506 mapRes!15795))))

(declare-fun condMapEmpty!15795 () Bool)

(declare-fun mapDefault!15795 () ValueCell!4400)

