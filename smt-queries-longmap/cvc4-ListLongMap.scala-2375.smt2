; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37716 () Bool)

(assert start!37716)

(declare-fun b_free!8819 () Bool)

(declare-fun b_next!8819 () Bool)

(assert (=> start!37716 (= b_free!8819 (not b_next!8819))))

(declare-fun tp!31209 () Bool)

(declare-fun b_and!16061 () Bool)

(assert (=> start!37716 (= tp!31209 b_and!16061)))

(declare-fun b!386675 () Bool)

(declare-fun e!234539 () Bool)

(declare-fun tp_is_empty!9491 () Bool)

(assert (=> b!386675 (= e!234539 tp_is_empty!9491)))

(declare-fun b!386676 () Bool)

(declare-fun res!220796 () Bool)

(declare-fun e!234540 () Bool)

(assert (=> b!386676 (=> (not res!220796) (not e!234540))))

(declare-datatypes ((array!22877 0))(
  ( (array!22878 (arr!10907 (Array (_ BitVec 32) (_ BitVec 64))) (size!11259 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22877)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386676 (= res!220796 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386677 () Bool)

(declare-fun e!234538 () Bool)

(assert (=> b!386677 (= e!234540 e!234538)))

(declare-fun res!220788 () Bool)

(assert (=> b!386677 (=> (not res!220788) (not e!234538))))

(declare-fun lt!181862 () array!22877)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22877 (_ BitVec 32)) Bool)

(assert (=> b!386677 (= res!220788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181862 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386677 (= lt!181862 (array!22878 (store (arr!10907 _keys!658) i!548 k!778) (size!11259 _keys!658)))))

(declare-fun b!386678 () Bool)

(assert (=> b!386678 (= e!234538 false)))

(declare-datatypes ((V!13759 0))(
  ( (V!13760 (val!4790 Int)) )
))
(declare-datatypes ((ValueCell!4402 0))(
  ( (ValueCellFull!4402 (v!6987 V!13759)) (EmptyCell!4402) )
))
(declare-datatypes ((array!22879 0))(
  ( (array!22880 (arr!10908 (Array (_ BitVec 32) ValueCell!4402)) (size!11260 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22879)

(declare-fun zeroValue!472 () V!13759)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13759)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13759)

(declare-datatypes ((tuple2!6440 0))(
  ( (tuple2!6441 (_1!3231 (_ BitVec 64)) (_2!3231 V!13759)) )
))
(declare-datatypes ((List!6288 0))(
  ( (Nil!6285) (Cons!6284 (h!7140 tuple2!6440) (t!11438 List!6288)) )
))
(declare-datatypes ((ListLongMap!5353 0))(
  ( (ListLongMap!5354 (toList!2692 List!6288)) )
))
(declare-fun lt!181861 () ListLongMap!5353)

(declare-fun getCurrentListMapNoExtraKeys!921 (array!22877 array!22879 (_ BitVec 32) (_ BitVec 32) V!13759 V!13759 (_ BitVec 32) Int) ListLongMap!5353)

(assert (=> b!386678 (= lt!181861 (getCurrentListMapNoExtraKeys!921 lt!181862 (array!22880 (store (arr!10908 _values!506) i!548 (ValueCellFull!4402 v!373)) (size!11260 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181863 () ListLongMap!5353)

(assert (=> b!386678 (= lt!181863 (getCurrentListMapNoExtraKeys!921 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15801 () Bool)

(declare-fun mapRes!15801 () Bool)

(assert (=> mapIsEmpty!15801 mapRes!15801))

(declare-fun b!386679 () Bool)

(declare-fun e!234542 () Bool)

(assert (=> b!386679 (= e!234542 tp_is_empty!9491)))

(declare-fun b!386680 () Bool)

(declare-fun res!220787 () Bool)

(assert (=> b!386680 (=> (not res!220787) (not e!234540))))

(declare-datatypes ((List!6289 0))(
  ( (Nil!6286) (Cons!6285 (h!7141 (_ BitVec 64)) (t!11439 List!6289)) )
))
(declare-fun arrayNoDuplicates!0 (array!22877 (_ BitVec 32) List!6289) Bool)

(assert (=> b!386680 (= res!220787 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6286))))

(declare-fun res!220791 () Bool)

(assert (=> start!37716 (=> (not res!220791) (not e!234540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37716 (= res!220791 (validMask!0 mask!970))))

(assert (=> start!37716 e!234540))

(declare-fun e!234537 () Bool)

(declare-fun array_inv!8024 (array!22879) Bool)

(assert (=> start!37716 (and (array_inv!8024 _values!506) e!234537)))

(assert (=> start!37716 tp!31209))

(assert (=> start!37716 true))

(assert (=> start!37716 tp_is_empty!9491))

(declare-fun array_inv!8025 (array!22877) Bool)

(assert (=> start!37716 (array_inv!8025 _keys!658)))

(declare-fun b!386681 () Bool)

(declare-fun res!220789 () Bool)

(assert (=> b!386681 (=> (not res!220789) (not e!234540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386681 (= res!220789 (validKeyInArray!0 k!778))))

(declare-fun b!386682 () Bool)

(declare-fun res!220792 () Bool)

(assert (=> b!386682 (=> (not res!220792) (not e!234538))))

(assert (=> b!386682 (= res!220792 (arrayNoDuplicates!0 lt!181862 #b00000000000000000000000000000000 Nil!6286))))

(declare-fun b!386683 () Bool)

(declare-fun res!220793 () Bool)

(assert (=> b!386683 (=> (not res!220793) (not e!234540))))

(assert (=> b!386683 (= res!220793 (and (= (size!11260 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11259 _keys!658) (size!11260 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15801 () Bool)

(declare-fun tp!31208 () Bool)

(assert (=> mapNonEmpty!15801 (= mapRes!15801 (and tp!31208 e!234539))))

(declare-fun mapRest!15801 () (Array (_ BitVec 32) ValueCell!4402))

(declare-fun mapValue!15801 () ValueCell!4402)

(declare-fun mapKey!15801 () (_ BitVec 32))

(assert (=> mapNonEmpty!15801 (= (arr!10908 _values!506) (store mapRest!15801 mapKey!15801 mapValue!15801))))

(declare-fun b!386684 () Bool)

(assert (=> b!386684 (= e!234537 (and e!234542 mapRes!15801))))

(declare-fun condMapEmpty!15801 () Bool)

(declare-fun mapDefault!15801 () ValueCell!4402)

