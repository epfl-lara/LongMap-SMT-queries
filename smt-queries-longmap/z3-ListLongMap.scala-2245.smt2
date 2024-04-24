; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36918 () Bool)

(assert start!36918)

(declare-fun b_free!8059 () Bool)

(declare-fun b_next!8059 () Bool)

(assert (=> start!36918 (= b_free!8059 (not b_next!8059))))

(declare-fun tp!28893 () Bool)

(declare-fun b_and!15315 () Bool)

(assert (=> start!36918 (= tp!28893 b_and!15315)))

(declare-fun b!370141 () Bool)

(declare-fun e!226110 () Bool)

(declare-fun tp_is_empty!8707 () Bool)

(assert (=> b!370141 (= e!226110 tp_is_empty!8707)))

(declare-fun b!370142 () Bool)

(declare-fun res!207828 () Bool)

(declare-fun e!226111 () Bool)

(assert (=> b!370142 (=> (not res!207828) (not e!226111))))

(declare-datatypes ((array!21342 0))(
  ( (array!21343 (arr!10139 (Array (_ BitVec 32) (_ BitVec 64))) (size!10491 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21342)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370142 (= res!207828 (or (= (select (arr!10139 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10139 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!207832 () Bool)

(assert (=> start!36918 (=> (not res!207832) (not e!226111))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36918 (= res!207832 (validMask!0 mask!970))))

(assert (=> start!36918 e!226111))

(declare-datatypes ((V!12715 0))(
  ( (V!12716 (val!4398 Int)) )
))
(declare-datatypes ((ValueCell!4010 0))(
  ( (ValueCellFull!4010 (v!6596 V!12715)) (EmptyCell!4010) )
))
(declare-datatypes ((array!21344 0))(
  ( (array!21345 (arr!10140 (Array (_ BitVec 32) ValueCell!4010)) (size!10492 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21344)

(declare-fun e!226109 () Bool)

(declare-fun array_inv!7524 (array!21344) Bool)

(assert (=> start!36918 (and (array_inv!7524 _values!506) e!226109)))

(assert (=> start!36918 tp!28893))

(assert (=> start!36918 true))

(assert (=> start!36918 tp_is_empty!8707))

(declare-fun array_inv!7525 (array!21342) Bool)

(assert (=> start!36918 (array_inv!7525 _keys!658)))

(declare-fun b!370143 () Bool)

(declare-fun e!226108 () Bool)

(declare-fun mapRes!14625 () Bool)

(assert (=> b!370143 (= e!226109 (and e!226108 mapRes!14625))))

(declare-fun condMapEmpty!14625 () Bool)

(declare-fun mapDefault!14625 () ValueCell!4010)

(assert (=> b!370143 (= condMapEmpty!14625 (= (arr!10140 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4010)) mapDefault!14625)))))

(declare-fun b!370144 () Bool)

(declare-fun res!207833 () Bool)

(assert (=> b!370144 (=> (not res!207833) (not e!226111))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!370144 (= res!207833 (and (= (size!10492 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10491 _keys!658) (size!10492 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370145 () Bool)

(declare-fun e!226112 () Bool)

(assert (=> b!370145 (= e!226112 false)))

(declare-fun lt!169928 () array!21342)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12715)

(declare-datatypes ((tuple2!5740 0))(
  ( (tuple2!5741 (_1!2881 (_ BitVec 64)) (_2!2881 V!12715)) )
))
(declare-datatypes ((List!5568 0))(
  ( (Nil!5565) (Cons!5564 (h!6420 tuple2!5740) (t!10710 List!5568)) )
))
(declare-datatypes ((ListLongMap!4655 0))(
  ( (ListLongMap!4656 (toList!2343 List!5568)) )
))
(declare-fun lt!169930 () ListLongMap!4655)

(declare-fun v!373 () V!12715)

(declare-fun minValue!472 () V!12715)

(declare-fun getCurrentListMapNoExtraKeys!652 (array!21342 array!21344 (_ BitVec 32) (_ BitVec 32) V!12715 V!12715 (_ BitVec 32) Int) ListLongMap!4655)

(assert (=> b!370145 (= lt!169930 (getCurrentListMapNoExtraKeys!652 lt!169928 (array!21345 (store (arr!10140 _values!506) i!548 (ValueCellFull!4010 v!373)) (size!10492 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169929 () ListLongMap!4655)

(assert (=> b!370145 (= lt!169929 (getCurrentListMapNoExtraKeys!652 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14625 () Bool)

(declare-fun tp!28892 () Bool)

(assert (=> mapNonEmpty!14625 (= mapRes!14625 (and tp!28892 e!226110))))

(declare-fun mapKey!14625 () (_ BitVec 32))

(declare-fun mapRest!14625 () (Array (_ BitVec 32) ValueCell!4010))

(declare-fun mapValue!14625 () ValueCell!4010)

(assert (=> mapNonEmpty!14625 (= (arr!10140 _values!506) (store mapRest!14625 mapKey!14625 mapValue!14625))))

(declare-fun b!370146 () Bool)

(assert (=> b!370146 (= e!226108 tp_is_empty!8707)))

(declare-fun b!370147 () Bool)

(declare-fun res!207827 () Bool)

(assert (=> b!370147 (=> (not res!207827) (not e!226111))))

(declare-datatypes ((List!5569 0))(
  ( (Nil!5566) (Cons!5565 (h!6421 (_ BitVec 64)) (t!10711 List!5569)) )
))
(declare-fun arrayNoDuplicates!0 (array!21342 (_ BitVec 32) List!5569) Bool)

(assert (=> b!370147 (= res!207827 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5566))))

(declare-fun b!370148 () Bool)

(declare-fun res!207836 () Bool)

(assert (=> b!370148 (=> (not res!207836) (not e!226112))))

(assert (=> b!370148 (= res!207836 (arrayNoDuplicates!0 lt!169928 #b00000000000000000000000000000000 Nil!5566))))

(declare-fun b!370149 () Bool)

(assert (=> b!370149 (= e!226111 e!226112)))

(declare-fun res!207830 () Bool)

(assert (=> b!370149 (=> (not res!207830) (not e!226112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21342 (_ BitVec 32)) Bool)

(assert (=> b!370149 (= res!207830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169928 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!370149 (= lt!169928 (array!21343 (store (arr!10139 _keys!658) i!548 k0!778) (size!10491 _keys!658)))))

(declare-fun mapIsEmpty!14625 () Bool)

(assert (=> mapIsEmpty!14625 mapRes!14625))

(declare-fun b!370150 () Bool)

(declare-fun res!207835 () Bool)

(assert (=> b!370150 (=> (not res!207835) (not e!226111))))

(assert (=> b!370150 (= res!207835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370151 () Bool)

(declare-fun res!207834 () Bool)

(assert (=> b!370151 (=> (not res!207834) (not e!226111))))

(declare-fun arrayContainsKey!0 (array!21342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370151 (= res!207834 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370152 () Bool)

(declare-fun res!207829 () Bool)

(assert (=> b!370152 (=> (not res!207829) (not e!226111))))

(assert (=> b!370152 (= res!207829 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10491 _keys!658))))))

(declare-fun b!370153 () Bool)

(declare-fun res!207831 () Bool)

(assert (=> b!370153 (=> (not res!207831) (not e!226111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370153 (= res!207831 (validKeyInArray!0 k0!778))))

(assert (= (and start!36918 res!207832) b!370144))

(assert (= (and b!370144 res!207833) b!370150))

(assert (= (and b!370150 res!207835) b!370147))

(assert (= (and b!370147 res!207827) b!370152))

(assert (= (and b!370152 res!207829) b!370153))

(assert (= (and b!370153 res!207831) b!370142))

(assert (= (and b!370142 res!207828) b!370151))

(assert (= (and b!370151 res!207834) b!370149))

(assert (= (and b!370149 res!207830) b!370148))

(assert (= (and b!370148 res!207836) b!370145))

(assert (= (and b!370143 condMapEmpty!14625) mapIsEmpty!14625))

(assert (= (and b!370143 (not condMapEmpty!14625)) mapNonEmpty!14625))

(get-info :version)

(assert (= (and mapNonEmpty!14625 ((_ is ValueCellFull!4010) mapValue!14625)) b!370141))

(assert (= (and b!370143 ((_ is ValueCellFull!4010) mapDefault!14625)) b!370146))

(assert (= start!36918 b!370143))

(declare-fun m!366623 () Bool)

(assert (=> b!370142 m!366623))

(declare-fun m!366625 () Bool)

(assert (=> b!370151 m!366625))

(declare-fun m!366627 () Bool)

(assert (=> b!370147 m!366627))

(declare-fun m!366629 () Bool)

(assert (=> start!36918 m!366629))

(declare-fun m!366631 () Bool)

(assert (=> start!36918 m!366631))

(declare-fun m!366633 () Bool)

(assert (=> start!36918 m!366633))

(declare-fun m!366635 () Bool)

(assert (=> b!370148 m!366635))

(declare-fun m!366637 () Bool)

(assert (=> b!370150 m!366637))

(declare-fun m!366639 () Bool)

(assert (=> mapNonEmpty!14625 m!366639))

(declare-fun m!366641 () Bool)

(assert (=> b!370149 m!366641))

(declare-fun m!366643 () Bool)

(assert (=> b!370149 m!366643))

(declare-fun m!366645 () Bool)

(assert (=> b!370145 m!366645))

(declare-fun m!366647 () Bool)

(assert (=> b!370145 m!366647))

(declare-fun m!366649 () Bool)

(assert (=> b!370145 m!366649))

(declare-fun m!366651 () Bool)

(assert (=> b!370153 m!366651))

(check-sat (not start!36918) (not b!370148) (not b!370153) (not b!370149) (not b!370147) (not b!370151) (not mapNonEmpty!14625) (not b!370150) (not b!370145) (not b_next!8059) b_and!15315 tp_is_empty!8707)
(check-sat b_and!15315 (not b_next!8059))
