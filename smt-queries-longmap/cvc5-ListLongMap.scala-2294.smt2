; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37226 () Bool)

(assert start!37226)

(declare-fun b_free!8353 () Bool)

(declare-fun b_next!8353 () Bool)

(assert (=> start!37226 (= b_free!8353 (not b_next!8353))))

(declare-fun tp!29774 () Bool)

(declare-fun b_and!15595 () Bool)

(assert (=> start!37226 (= tp!29774 b_and!15595)))

(declare-fun res!212711 () Bool)

(declare-fun e!229234 () Bool)

(assert (=> start!37226 (=> (not res!212711) (not e!229234))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37226 (= res!212711 (validMask!0 mask!970))))

(assert (=> start!37226 e!229234))

(declare-datatypes ((V!13107 0))(
  ( (V!13108 (val!4545 Int)) )
))
(declare-datatypes ((ValueCell!4157 0))(
  ( (ValueCellFull!4157 (v!6742 V!13107)) (EmptyCell!4157) )
))
(declare-datatypes ((array!21931 0))(
  ( (array!21932 (arr!10434 (Array (_ BitVec 32) ValueCell!4157)) (size!10786 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21931)

(declare-fun e!229235 () Bool)

(declare-fun array_inv!7690 (array!21931) Bool)

(assert (=> start!37226 (and (array_inv!7690 _values!506) e!229235)))

(assert (=> start!37226 tp!29774))

(assert (=> start!37226 true))

(declare-fun tp_is_empty!9001 () Bool)

(assert (=> start!37226 tp_is_empty!9001))

(declare-datatypes ((array!21933 0))(
  ( (array!21934 (arr!10435 (Array (_ BitVec 32) (_ BitVec 64))) (size!10787 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21933)

(declare-fun array_inv!7691 (array!21933) Bool)

(assert (=> start!37226 (array_inv!7691 _keys!658)))

(declare-fun b!376386 () Bool)

(declare-fun res!212705 () Bool)

(assert (=> b!376386 (=> (not res!212705) (not e!229234))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376386 (= res!212705 (and (= (size!10786 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10787 _keys!658) (size!10786 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376387 () Bool)

(declare-fun e!229238 () Bool)

(assert (=> b!376387 (= e!229238 tp_is_empty!9001)))

(declare-fun b!376388 () Bool)

(declare-fun res!212706 () Bool)

(assert (=> b!376388 (=> (not res!212706) (not e!229234))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376388 (= res!212706 (or (= (select (arr!10435 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10435 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376389 () Bool)

(declare-fun res!212714 () Bool)

(assert (=> b!376389 (=> (not res!212714) (not e!229234))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376389 (= res!212714 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15066 () Bool)

(declare-fun mapRes!15066 () Bool)

(declare-fun tp!29775 () Bool)

(assert (=> mapNonEmpty!15066 (= mapRes!15066 (and tp!29775 e!229238))))

(declare-fun mapValue!15066 () ValueCell!4157)

(declare-fun mapKey!15066 () (_ BitVec 32))

(declare-fun mapRest!15066 () (Array (_ BitVec 32) ValueCell!4157))

(assert (=> mapNonEmpty!15066 (= (arr!10434 _values!506) (store mapRest!15066 mapKey!15066 mapValue!15066))))

(declare-fun b!376390 () Bool)

(declare-fun res!212707 () Bool)

(assert (=> b!376390 (=> (not res!212707) (not e!229234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21933 (_ BitVec 32)) Bool)

(assert (=> b!376390 (= res!212707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15066 () Bool)

(assert (=> mapIsEmpty!15066 mapRes!15066))

(declare-fun b!376391 () Bool)

(declare-fun e!229232 () Bool)

(assert (=> b!376391 (= e!229232 tp_is_empty!9001)))

(declare-fun b!376392 () Bool)

(declare-fun e!229231 () Bool)

(declare-fun e!229233 () Bool)

(assert (=> b!376392 (= e!229231 (not e!229233))))

(declare-fun res!212704 () Bool)

(assert (=> b!376392 (=> res!212704 e!229233)))

(assert (=> b!376392 (= res!212704 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6050 0))(
  ( (tuple2!6051 (_1!3036 (_ BitVec 64)) (_2!3036 V!13107)) )
))
(declare-datatypes ((List!5892 0))(
  ( (Nil!5889) (Cons!5888 (h!6744 tuple2!6050) (t!11042 List!5892)) )
))
(declare-datatypes ((ListLongMap!4963 0))(
  ( (ListLongMap!4964 (toList!2497 List!5892)) )
))
(declare-fun lt!174584 () ListLongMap!4963)

(declare-fun zeroValue!472 () V!13107)

(declare-fun minValue!472 () V!13107)

(declare-fun getCurrentListMap!1931 (array!21933 array!21931 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) Int) ListLongMap!4963)

(assert (=> b!376392 (= lt!174584 (getCurrentListMap!1931 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174594 () ListLongMap!4963)

(declare-fun lt!174589 () array!21931)

(declare-fun lt!174593 () array!21933)

(assert (=> b!376392 (= lt!174594 (getCurrentListMap!1931 lt!174593 lt!174589 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174588 () ListLongMap!4963)

(declare-fun lt!174587 () ListLongMap!4963)

(assert (=> b!376392 (and (= lt!174588 lt!174587) (= lt!174587 lt!174588))))

(declare-fun lt!174591 () ListLongMap!4963)

(declare-fun lt!174583 () tuple2!6050)

(declare-fun +!843 (ListLongMap!4963 tuple2!6050) ListLongMap!4963)

(assert (=> b!376392 (= lt!174587 (+!843 lt!174591 lt!174583))))

(declare-fun v!373 () V!13107)

(assert (=> b!376392 (= lt!174583 (tuple2!6051 k!778 v!373))))

(declare-datatypes ((Unit!11592 0))(
  ( (Unit!11593) )
))
(declare-fun lt!174590 () Unit!11592)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!89 (array!21933 array!21931 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) (_ BitVec 64) V!13107 (_ BitVec 32) Int) Unit!11592)

(assert (=> b!376392 (= lt!174590 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!89 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!765 (array!21933 array!21931 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) Int) ListLongMap!4963)

(assert (=> b!376392 (= lt!174588 (getCurrentListMapNoExtraKeys!765 lt!174593 lt!174589 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376392 (= lt!174589 (array!21932 (store (arr!10434 _values!506) i!548 (ValueCellFull!4157 v!373)) (size!10786 _values!506)))))

(assert (=> b!376392 (= lt!174591 (getCurrentListMapNoExtraKeys!765 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376393 () Bool)

(declare-fun e!229237 () Bool)

(assert (=> b!376393 (= e!229237 true)))

(declare-fun lt!174582 () ListLongMap!4963)

(declare-fun lt!174592 () ListLongMap!4963)

(assert (=> b!376393 (= lt!174582 (+!843 lt!174592 lt!174583))))

(declare-fun lt!174586 () Unit!11592)

(declare-fun addCommutativeForDiffKeys!258 (ListLongMap!4963 (_ BitVec 64) V!13107 (_ BitVec 64) V!13107) Unit!11592)

(assert (=> b!376393 (= lt!174586 (addCommutativeForDiffKeys!258 lt!174591 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376394 () Bool)

(declare-fun res!212703 () Bool)

(assert (=> b!376394 (=> (not res!212703) (not e!229234))))

(declare-fun arrayContainsKey!0 (array!21933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376394 (= res!212703 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!376395 () Bool)

(declare-fun res!212712 () Bool)

(assert (=> b!376395 (=> (not res!212712) (not e!229231))))

(declare-datatypes ((List!5893 0))(
  ( (Nil!5890) (Cons!5889 (h!6745 (_ BitVec 64)) (t!11043 List!5893)) )
))
(declare-fun arrayNoDuplicates!0 (array!21933 (_ BitVec 32) List!5893) Bool)

(assert (=> b!376395 (= res!212712 (arrayNoDuplicates!0 lt!174593 #b00000000000000000000000000000000 Nil!5890))))

(declare-fun b!376396 () Bool)

(assert (=> b!376396 (= e!229233 e!229237)))

(declare-fun res!212710 () Bool)

(assert (=> b!376396 (=> res!212710 e!229237)))

(assert (=> b!376396 (= res!212710 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376396 (= lt!174594 lt!174582)))

(declare-fun lt!174585 () tuple2!6050)

(assert (=> b!376396 (= lt!174582 (+!843 lt!174587 lt!174585))))

(assert (=> b!376396 (= lt!174584 lt!174592)))

(assert (=> b!376396 (= lt!174592 (+!843 lt!174591 lt!174585))))

(assert (=> b!376396 (= lt!174594 (+!843 lt!174588 lt!174585))))

(assert (=> b!376396 (= lt!174585 (tuple2!6051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376397 () Bool)

(assert (=> b!376397 (= e!229234 e!229231)))

(declare-fun res!212709 () Bool)

(assert (=> b!376397 (=> (not res!212709) (not e!229231))))

(assert (=> b!376397 (= res!212709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174593 mask!970))))

(assert (=> b!376397 (= lt!174593 (array!21934 (store (arr!10435 _keys!658) i!548 k!778) (size!10787 _keys!658)))))

(declare-fun b!376398 () Bool)

(declare-fun res!212713 () Bool)

(assert (=> b!376398 (=> (not res!212713) (not e!229234))))

(assert (=> b!376398 (= res!212713 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5890))))

(declare-fun b!376399 () Bool)

(assert (=> b!376399 (= e!229235 (and e!229232 mapRes!15066))))

(declare-fun condMapEmpty!15066 () Bool)

(declare-fun mapDefault!15066 () ValueCell!4157)

