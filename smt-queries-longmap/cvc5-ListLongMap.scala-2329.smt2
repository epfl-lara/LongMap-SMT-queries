; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37436 () Bool)

(assert start!37436)

(declare-fun b_free!8563 () Bool)

(declare-fun b_next!8563 () Bool)

(assert (=> start!37436 (= b_free!8563 (not b_next!8563))))

(declare-fun tp!30404 () Bool)

(declare-fun b_and!15805 () Bool)

(assert (=> start!37436 (= tp!30404 b_and!15805)))

(declare-fun b!381100 () Bool)

(declare-fun res!216475 () Bool)

(declare-fun e!231736 () Bool)

(assert (=> b!381100 (=> (not res!216475) (not e!231736))))

(declare-datatypes ((array!22339 0))(
  ( (array!22340 (arr!10638 (Array (_ BitVec 32) (_ BitVec 64))) (size!10990 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22339)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22339 (_ BitVec 32)) Bool)

(assert (=> b!381100 (= res!216475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381101 () Bool)

(declare-fun res!216481 () Bool)

(assert (=> b!381101 (=> (not res!216481) (not e!231736))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381101 (= res!216481 (validKeyInArray!0 k!778))))

(declare-fun b!381102 () Bool)

(declare-fun res!216480 () Bool)

(assert (=> b!381102 (=> (not res!216480) (not e!231736))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13387 0))(
  ( (V!13388 (val!4650 Int)) )
))
(declare-datatypes ((ValueCell!4262 0))(
  ( (ValueCellFull!4262 (v!6847 V!13387)) (EmptyCell!4262) )
))
(declare-datatypes ((array!22341 0))(
  ( (array!22342 (arr!10639 (Array (_ BitVec 32) ValueCell!4262)) (size!10991 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22341)

(assert (=> b!381102 (= res!216480 (and (= (size!10991 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10990 _keys!658) (size!10991 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381103 () Bool)

(declare-fun res!216479 () Bool)

(assert (=> b!381103 (=> (not res!216479) (not e!231736))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381103 (= res!216479 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10990 _keys!658))))))

(declare-fun mapIsEmpty!15381 () Bool)

(declare-fun mapRes!15381 () Bool)

(assert (=> mapIsEmpty!15381 mapRes!15381))

(declare-fun b!381105 () Bool)

(declare-fun e!231733 () Bool)

(declare-fun e!231737 () Bool)

(assert (=> b!381105 (= e!231733 (not e!231737))))

(declare-fun res!216473 () Bool)

(assert (=> b!381105 (=> res!216473 e!231737)))

(declare-fun lt!178566 () Bool)

(assert (=> b!381105 (= res!216473 (or (and (not lt!178566) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178566) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178566)))))

(assert (=> b!381105 (= lt!178566 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13387)

(declare-datatypes ((tuple2!6242 0))(
  ( (tuple2!6243 (_1!3132 (_ BitVec 64)) (_2!3132 V!13387)) )
))
(declare-datatypes ((List!6075 0))(
  ( (Nil!6072) (Cons!6071 (h!6927 tuple2!6242) (t!11225 List!6075)) )
))
(declare-datatypes ((ListLongMap!5155 0))(
  ( (ListLongMap!5156 (toList!2593 List!6075)) )
))
(declare-fun lt!178564 () ListLongMap!5155)

(declare-fun minValue!472 () V!13387)

(declare-fun getCurrentListMap!2008 (array!22339 array!22341 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) Int) ListLongMap!5155)

(assert (=> b!381105 (= lt!178564 (getCurrentListMap!2008 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178569 () array!22341)

(declare-fun lt!178567 () ListLongMap!5155)

(declare-fun lt!178561 () array!22339)

(assert (=> b!381105 (= lt!178567 (getCurrentListMap!2008 lt!178561 lt!178569 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178565 () ListLongMap!5155)

(declare-fun lt!178568 () ListLongMap!5155)

(assert (=> b!381105 (and (= lt!178565 lt!178568) (= lt!178568 lt!178565))))

(declare-fun lt!178562 () ListLongMap!5155)

(declare-fun v!373 () V!13387)

(declare-fun +!938 (ListLongMap!5155 tuple2!6242) ListLongMap!5155)

(assert (=> b!381105 (= lt!178568 (+!938 lt!178562 (tuple2!6243 k!778 v!373)))))

(declare-datatypes ((Unit!11770 0))(
  ( (Unit!11771) )
))
(declare-fun lt!178563 () Unit!11770)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!166 (array!22339 array!22341 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) (_ BitVec 64) V!13387 (_ BitVec 32) Int) Unit!11770)

(assert (=> b!381105 (= lt!178563 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!166 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!842 (array!22339 array!22341 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) Int) ListLongMap!5155)

(assert (=> b!381105 (= lt!178565 (getCurrentListMapNoExtraKeys!842 lt!178561 lt!178569 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381105 (= lt!178569 (array!22342 (store (arr!10639 _values!506) i!548 (ValueCellFull!4262 v!373)) (size!10991 _values!506)))))

(assert (=> b!381105 (= lt!178562 (getCurrentListMapNoExtraKeys!842 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381106 () Bool)

(declare-fun res!216474 () Bool)

(assert (=> b!381106 (=> (not res!216474) (not e!231736))))

(assert (=> b!381106 (= res!216474 (or (= (select (arr!10638 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10638 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381107 () Bool)

(declare-fun e!231734 () Bool)

(declare-fun tp_is_empty!9211 () Bool)

(assert (=> b!381107 (= e!231734 tp_is_empty!9211)))

(declare-fun b!381108 () Bool)

(declare-fun e!231732 () Bool)

(assert (=> b!381108 (= e!231732 tp_is_empty!9211)))

(declare-fun b!381109 () Bool)

(assert (=> b!381109 (= e!231737 true)))

(assert (=> b!381109 (= lt!178567 lt!178565)))

(declare-fun b!381110 () Bool)

(declare-fun res!216482 () Bool)

(assert (=> b!381110 (=> (not res!216482) (not e!231736))))

(declare-datatypes ((List!6076 0))(
  ( (Nil!6073) (Cons!6072 (h!6928 (_ BitVec 64)) (t!11226 List!6076)) )
))
(declare-fun arrayNoDuplicates!0 (array!22339 (_ BitVec 32) List!6076) Bool)

(assert (=> b!381110 (= res!216482 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6073))))

(declare-fun b!381111 () Bool)

(assert (=> b!381111 (= e!231736 e!231733)))

(declare-fun res!216478 () Bool)

(assert (=> b!381111 (=> (not res!216478) (not e!231733))))

(assert (=> b!381111 (= res!216478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178561 mask!970))))

(assert (=> b!381111 (= lt!178561 (array!22340 (store (arr!10638 _keys!658) i!548 k!778) (size!10990 _keys!658)))))

(declare-fun b!381112 () Bool)

(declare-fun res!216477 () Bool)

(assert (=> b!381112 (=> (not res!216477) (not e!231736))))

(declare-fun arrayContainsKey!0 (array!22339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381112 (= res!216477 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!381104 () Bool)

(declare-fun res!216472 () Bool)

(assert (=> b!381104 (=> (not res!216472) (not e!231733))))

(assert (=> b!381104 (= res!216472 (arrayNoDuplicates!0 lt!178561 #b00000000000000000000000000000000 Nil!6073))))

(declare-fun res!216476 () Bool)

(assert (=> start!37436 (=> (not res!216476) (not e!231736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37436 (= res!216476 (validMask!0 mask!970))))

(assert (=> start!37436 e!231736))

(declare-fun e!231735 () Bool)

(declare-fun array_inv!7834 (array!22341) Bool)

(assert (=> start!37436 (and (array_inv!7834 _values!506) e!231735)))

(assert (=> start!37436 tp!30404))

(assert (=> start!37436 true))

(assert (=> start!37436 tp_is_empty!9211))

(declare-fun array_inv!7835 (array!22339) Bool)

(assert (=> start!37436 (array_inv!7835 _keys!658)))

(declare-fun b!381113 () Bool)

(assert (=> b!381113 (= e!231735 (and e!231734 mapRes!15381))))

(declare-fun condMapEmpty!15381 () Bool)

(declare-fun mapDefault!15381 () ValueCell!4262)

