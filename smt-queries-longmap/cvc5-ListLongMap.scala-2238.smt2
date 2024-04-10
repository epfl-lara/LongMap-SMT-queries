; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36890 () Bool)

(assert start!36890)

(declare-fun b_free!8017 () Bool)

(declare-fun b_next!8017 () Bool)

(assert (=> start!36890 (= b_free!8017 (not b_next!8017))))

(declare-fun tp!28767 () Bool)

(declare-fun b_and!15259 () Bool)

(assert (=> start!36890 (= tp!28767 b_and!15259)))

(declare-fun b!369371 () Bool)

(declare-fun res!207208 () Bool)

(declare-fun e!225764 () Bool)

(assert (=> b!369371 (=> (not res!207208) (not e!225764))))

(declare-datatypes ((array!21281 0))(
  ( (array!21282 (arr!10109 (Array (_ BitVec 32) (_ BitVec 64))) (size!10461 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21281)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369371 (= res!207208 (or (= (select (arr!10109 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10109 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14562 () Bool)

(declare-fun mapRes!14562 () Bool)

(assert (=> mapIsEmpty!14562 mapRes!14562))

(declare-fun mapNonEmpty!14562 () Bool)

(declare-fun tp!28766 () Bool)

(declare-fun e!225763 () Bool)

(assert (=> mapNonEmpty!14562 (= mapRes!14562 (and tp!28766 e!225763))))

(declare-fun mapKey!14562 () (_ BitVec 32))

(declare-datatypes ((V!12659 0))(
  ( (V!12660 (val!4377 Int)) )
))
(declare-datatypes ((ValueCell!3989 0))(
  ( (ValueCellFull!3989 (v!6574 V!12659)) (EmptyCell!3989) )
))
(declare-fun mapRest!14562 () (Array (_ BitVec 32) ValueCell!3989))

(declare-fun mapValue!14562 () ValueCell!3989)

(declare-datatypes ((array!21283 0))(
  ( (array!21284 (arr!10110 (Array (_ BitVec 32) ValueCell!3989)) (size!10462 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21283)

(assert (=> mapNonEmpty!14562 (= (arr!10110 _values!506) (store mapRest!14562 mapKey!14562 mapValue!14562))))

(declare-fun b!369372 () Bool)

(declare-fun res!207203 () Bool)

(assert (=> b!369372 (=> (not res!207203) (not e!225764))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369372 (= res!207203 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369373 () Bool)

(declare-fun res!207201 () Bool)

(assert (=> b!369373 (=> (not res!207201) (not e!225764))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!369373 (= res!207201 (and (= (size!10462 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10461 _keys!658) (size!10462 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!207200 () Bool)

(assert (=> start!36890 (=> (not res!207200) (not e!225764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36890 (= res!207200 (validMask!0 mask!970))))

(assert (=> start!36890 e!225764))

(declare-fun e!225766 () Bool)

(declare-fun array_inv!7472 (array!21283) Bool)

(assert (=> start!36890 (and (array_inv!7472 _values!506) e!225766)))

(assert (=> start!36890 tp!28767))

(assert (=> start!36890 true))

(declare-fun tp_is_empty!8665 () Bool)

(assert (=> start!36890 tp_is_empty!8665))

(declare-fun array_inv!7473 (array!21281) Bool)

(assert (=> start!36890 (array_inv!7473 _keys!658)))

(declare-fun b!369374 () Bool)

(declare-fun e!225765 () Bool)

(assert (=> b!369374 (= e!225765 false)))

(declare-datatypes ((tuple2!5806 0))(
  ( (tuple2!5807 (_1!2914 (_ BitVec 64)) (_2!2914 V!12659)) )
))
(declare-datatypes ((List!5640 0))(
  ( (Nil!5637) (Cons!5636 (h!6492 tuple2!5806) (t!10790 List!5640)) )
))
(declare-datatypes ((ListLongMap!4719 0))(
  ( (ListLongMap!4720 (toList!2375 List!5640)) )
))
(declare-fun lt!169722 () ListLongMap!4719)

(declare-fun lt!169721 () array!21281)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12659)

(declare-fun v!373 () V!12659)

(declare-fun minValue!472 () V!12659)

(declare-fun getCurrentListMapNoExtraKeys!652 (array!21281 array!21283 (_ BitVec 32) (_ BitVec 32) V!12659 V!12659 (_ BitVec 32) Int) ListLongMap!4719)

(assert (=> b!369374 (= lt!169722 (getCurrentListMapNoExtraKeys!652 lt!169721 (array!21284 (store (arr!10110 _values!506) i!548 (ValueCellFull!3989 v!373)) (size!10462 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169720 () ListLongMap!4719)

(assert (=> b!369374 (= lt!169720 (getCurrentListMapNoExtraKeys!652 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369375 () Bool)

(declare-fun e!225762 () Bool)

(assert (=> b!369375 (= e!225762 tp_is_empty!8665)))

(declare-fun b!369376 () Bool)

(declare-fun res!207209 () Bool)

(assert (=> b!369376 (=> (not res!207209) (not e!225764))))

(assert (=> b!369376 (= res!207209 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10461 _keys!658))))))

(declare-fun b!369377 () Bool)

(declare-fun res!207205 () Bool)

(assert (=> b!369377 (=> (not res!207205) (not e!225764))))

(declare-datatypes ((List!5641 0))(
  ( (Nil!5638) (Cons!5637 (h!6493 (_ BitVec 64)) (t!10791 List!5641)) )
))
(declare-fun arrayNoDuplicates!0 (array!21281 (_ BitVec 32) List!5641) Bool)

(assert (=> b!369377 (= res!207205 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5638))))

(declare-fun b!369378 () Bool)

(declare-fun res!207206 () Bool)

(assert (=> b!369378 (=> (not res!207206) (not e!225764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21281 (_ BitVec 32)) Bool)

(assert (=> b!369378 (= res!207206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369379 () Bool)

(assert (=> b!369379 (= e!225763 tp_is_empty!8665)))

(declare-fun b!369380 () Bool)

(declare-fun res!207202 () Bool)

(assert (=> b!369380 (=> (not res!207202) (not e!225764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369380 (= res!207202 (validKeyInArray!0 k!778))))

(declare-fun b!369381 () Bool)

(assert (=> b!369381 (= e!225766 (and e!225762 mapRes!14562))))

(declare-fun condMapEmpty!14562 () Bool)

(declare-fun mapDefault!14562 () ValueCell!3989)

