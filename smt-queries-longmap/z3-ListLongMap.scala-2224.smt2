; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36792 () Bool)

(assert start!36792)

(declare-fun b_free!7933 () Bool)

(declare-fun b_next!7933 () Bool)

(assert (=> start!36792 (= b_free!7933 (not b_next!7933))))

(declare-fun tp!28514 () Bool)

(declare-fun b_and!15149 () Bool)

(assert (=> start!36792 (= tp!28514 b_and!15149)))

(declare-fun b!367462 () Bool)

(declare-fun res!205814 () Bool)

(declare-fun e!224837 () Bool)

(assert (=> b!367462 (=> (not res!205814) (not e!224837))))

(declare-datatypes ((array!21101 0))(
  ( (array!21102 (arr!10019 (Array (_ BitVec 32) (_ BitVec 64))) (size!10372 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21101)

(declare-datatypes ((List!5539 0))(
  ( (Nil!5536) (Cons!5535 (h!6391 (_ BitVec 64)) (t!10680 List!5539)) )
))
(declare-fun arrayNoDuplicates!0 (array!21101 (_ BitVec 32) List!5539) Bool)

(assert (=> b!367462 (= res!205814 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5536))))

(declare-fun b!367463 () Bool)

(declare-fun res!205811 () Bool)

(assert (=> b!367463 (=> (not res!205811) (not e!224837))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367463 (= res!205811 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14436 () Bool)

(declare-fun mapRes!14436 () Bool)

(assert (=> mapIsEmpty!14436 mapRes!14436))

(declare-fun b!367464 () Bool)

(declare-fun res!205817 () Bool)

(assert (=> b!367464 (=> (not res!205817) (not e!224837))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367464 (= res!205817 (or (= (select (arr!10019 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10019 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367465 () Bool)

(declare-fun res!205819 () Bool)

(declare-fun e!224834 () Bool)

(assert (=> b!367465 (=> (not res!205819) (not e!224834))))

(declare-fun lt!169187 () array!21101)

(assert (=> b!367465 (= res!205819 (arrayNoDuplicates!0 lt!169187 #b00000000000000000000000000000000 Nil!5536))))

(declare-fun b!367466 () Bool)

(declare-fun e!224833 () Bool)

(declare-fun tp_is_empty!8581 () Bool)

(assert (=> b!367466 (= e!224833 tp_is_empty!8581)))

(declare-fun b!367467 () Bool)

(declare-fun e!224835 () Bool)

(declare-fun e!224832 () Bool)

(assert (=> b!367467 (= e!224835 (and e!224832 mapRes!14436))))

(declare-fun condMapEmpty!14436 () Bool)

(declare-datatypes ((V!12547 0))(
  ( (V!12548 (val!4335 Int)) )
))
(declare-datatypes ((ValueCell!3947 0))(
  ( (ValueCellFull!3947 (v!6526 V!12547)) (EmptyCell!3947) )
))
(declare-datatypes ((array!21103 0))(
  ( (array!21104 (arr!10020 (Array (_ BitVec 32) ValueCell!3947)) (size!10373 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21103)

(declare-fun mapDefault!14436 () ValueCell!3947)

(assert (=> b!367467 (= condMapEmpty!14436 (= (arr!10020 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3947)) mapDefault!14436)))))

(declare-fun b!367468 () Bool)

(declare-fun res!205820 () Bool)

(assert (=> b!367468 (=> (not res!205820) (not e!224837))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21101 (_ BitVec 32)) Bool)

(assert (=> b!367468 (= res!205820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367469 () Bool)

(declare-fun res!205815 () Bool)

(assert (=> b!367469 (=> (not res!205815) (not e!224837))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367469 (= res!205815 (and (= (size!10373 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10372 _keys!658) (size!10373 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!205813 () Bool)

(assert (=> start!36792 (=> (not res!205813) (not e!224837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36792 (= res!205813 (validMask!0 mask!970))))

(assert (=> start!36792 e!224837))

(assert (=> start!36792 true))

(declare-fun array_inv!7426 (array!21103) Bool)

(assert (=> start!36792 (and (array_inv!7426 _values!506) e!224835)))

(assert (=> start!36792 tp!28514))

(assert (=> start!36792 tp_is_empty!8581))

(declare-fun array_inv!7427 (array!21101) Bool)

(assert (=> start!36792 (array_inv!7427 _keys!658)))

(declare-fun b!367470 () Bool)

(assert (=> b!367470 (= e!224834 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5710 0))(
  ( (tuple2!5711 (_1!2866 (_ BitVec 64)) (_2!2866 V!12547)) )
))
(declare-datatypes ((List!5540 0))(
  ( (Nil!5537) (Cons!5536 (h!6392 tuple2!5710) (t!10681 List!5540)) )
))
(declare-datatypes ((ListLongMap!4613 0))(
  ( (ListLongMap!4614 (toList!2322 List!5540)) )
))
(declare-fun lt!169188 () ListLongMap!4613)

(declare-fun zeroValue!472 () V!12547)

(declare-fun minValue!472 () V!12547)

(declare-fun getCurrentListMapNoExtraKeys!613 (array!21101 array!21103 (_ BitVec 32) (_ BitVec 32) V!12547 V!12547 (_ BitVec 32) Int) ListLongMap!4613)

(assert (=> b!367470 (= lt!169188 (getCurrentListMapNoExtraKeys!613 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367471 () Bool)

(assert (=> b!367471 (= e!224832 tp_is_empty!8581)))

(declare-fun b!367472 () Bool)

(declare-fun res!205818 () Bool)

(assert (=> b!367472 (=> (not res!205818) (not e!224837))))

(assert (=> b!367472 (= res!205818 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10372 _keys!658))))))

(declare-fun mapNonEmpty!14436 () Bool)

(declare-fun tp!28515 () Bool)

(assert (=> mapNonEmpty!14436 (= mapRes!14436 (and tp!28515 e!224833))))

(declare-fun mapKey!14436 () (_ BitVec 32))

(declare-fun mapValue!14436 () ValueCell!3947)

(declare-fun mapRest!14436 () (Array (_ BitVec 32) ValueCell!3947))

(assert (=> mapNonEmpty!14436 (= (arr!10020 _values!506) (store mapRest!14436 mapKey!14436 mapValue!14436))))

(declare-fun b!367473 () Bool)

(assert (=> b!367473 (= e!224837 e!224834)))

(declare-fun res!205812 () Bool)

(assert (=> b!367473 (=> (not res!205812) (not e!224834))))

(assert (=> b!367473 (= res!205812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169187 mask!970))))

(assert (=> b!367473 (= lt!169187 (array!21102 (store (arr!10019 _keys!658) i!548 k0!778) (size!10372 _keys!658)))))

(declare-fun b!367474 () Bool)

(declare-fun res!205816 () Bool)

(assert (=> b!367474 (=> (not res!205816) (not e!224837))))

(declare-fun arrayContainsKey!0 (array!21101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367474 (= res!205816 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36792 res!205813) b!367469))

(assert (= (and b!367469 res!205815) b!367468))

(assert (= (and b!367468 res!205820) b!367462))

(assert (= (and b!367462 res!205814) b!367472))

(assert (= (and b!367472 res!205818) b!367463))

(assert (= (and b!367463 res!205811) b!367464))

(assert (= (and b!367464 res!205817) b!367474))

(assert (= (and b!367474 res!205816) b!367473))

(assert (= (and b!367473 res!205812) b!367465))

(assert (= (and b!367465 res!205819) b!367470))

(assert (= (and b!367467 condMapEmpty!14436) mapIsEmpty!14436))

(assert (= (and b!367467 (not condMapEmpty!14436)) mapNonEmpty!14436))

(get-info :version)

(assert (= (and mapNonEmpty!14436 ((_ is ValueCellFull!3947) mapValue!14436)) b!367466))

(assert (= (and b!367467 ((_ is ValueCellFull!3947) mapDefault!14436)) b!367471))

(assert (= start!36792 b!367467))

(declare-fun m!363887 () Bool)

(assert (=> b!367474 m!363887))

(declare-fun m!363889 () Bool)

(assert (=> mapNonEmpty!14436 m!363889))

(declare-fun m!363891 () Bool)

(assert (=> start!36792 m!363891))

(declare-fun m!363893 () Bool)

(assert (=> start!36792 m!363893))

(declare-fun m!363895 () Bool)

(assert (=> start!36792 m!363895))

(declare-fun m!363897 () Bool)

(assert (=> b!367462 m!363897))

(declare-fun m!363899 () Bool)

(assert (=> b!367463 m!363899))

(declare-fun m!363901 () Bool)

(assert (=> b!367464 m!363901))

(declare-fun m!363903 () Bool)

(assert (=> b!367473 m!363903))

(declare-fun m!363905 () Bool)

(assert (=> b!367473 m!363905))

(declare-fun m!363907 () Bool)

(assert (=> b!367465 m!363907))

(declare-fun m!363909 () Bool)

(assert (=> b!367470 m!363909))

(declare-fun m!363911 () Bool)

(assert (=> b!367468 m!363911))

(check-sat (not b!367462) (not b!367468) (not mapNonEmpty!14436) (not b!367470) b_and!15149 (not b!367474) (not b!367465) (not start!36792) tp_is_empty!8581 (not b!367473) (not b_next!7933) (not b!367463))
(check-sat b_and!15149 (not b_next!7933))
