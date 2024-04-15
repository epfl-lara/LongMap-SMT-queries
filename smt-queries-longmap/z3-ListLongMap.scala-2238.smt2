; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36876 () Bool)

(assert start!36876)

(declare-fun b_free!8017 () Bool)

(declare-fun b_next!8017 () Bool)

(assert (=> start!36876 (= b_free!8017 (not b_next!8017))))

(declare-fun tp!28767 () Bool)

(declare-fun b_and!15233 () Bool)

(assert (=> start!36876 (= tp!28767 b_and!15233)))

(declare-fun b!369100 () Bool)

(declare-fun e!225588 () Bool)

(declare-fun e!225591 () Bool)

(declare-fun mapRes!14562 () Bool)

(assert (=> b!369100 (= e!225588 (and e!225591 mapRes!14562))))

(declare-fun condMapEmpty!14562 () Bool)

(declare-datatypes ((V!12659 0))(
  ( (V!12660 (val!4377 Int)) )
))
(declare-datatypes ((ValueCell!3989 0))(
  ( (ValueCellFull!3989 (v!6568 V!12659)) (EmptyCell!3989) )
))
(declare-datatypes ((array!21265 0))(
  ( (array!21266 (arr!10101 (Array (_ BitVec 32) ValueCell!3989)) (size!10454 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21265)

(declare-fun mapDefault!14562 () ValueCell!3989)

(assert (=> b!369100 (= condMapEmpty!14562 (= (arr!10101 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3989)) mapDefault!14562)))))

(declare-fun b!369102 () Bool)

(declare-fun tp_is_empty!8665 () Bool)

(assert (=> b!369102 (= e!225591 tp_is_empty!8665)))

(declare-fun mapNonEmpty!14562 () Bool)

(declare-fun tp!28766 () Bool)

(declare-fun e!225593 () Bool)

(assert (=> mapNonEmpty!14562 (= mapRes!14562 (and tp!28766 e!225593))))

(declare-fun mapRest!14562 () (Array (_ BitVec 32) ValueCell!3989))

(declare-fun mapKey!14562 () (_ BitVec 32))

(declare-fun mapValue!14562 () ValueCell!3989)

(assert (=> mapNonEmpty!14562 (= (arr!10101 _values!506) (store mapRest!14562 mapKey!14562 mapValue!14562))))

(declare-fun b!369103 () Bool)

(declare-fun res!207074 () Bool)

(declare-fun e!225589 () Bool)

(assert (=> b!369103 (=> (not res!207074) (not e!225589))))

(declare-datatypes ((array!21267 0))(
  ( (array!21268 (arr!10102 (Array (_ BitVec 32) (_ BitVec 64))) (size!10455 (_ BitVec 32))) )
))
(declare-fun lt!169487 () array!21267)

(declare-datatypes ((List!5605 0))(
  ( (Nil!5602) (Cons!5601 (h!6457 (_ BitVec 64)) (t!10746 List!5605)) )
))
(declare-fun arrayNoDuplicates!0 (array!21267 (_ BitVec 32) List!5605) Bool)

(assert (=> b!369103 (= res!207074 (arrayNoDuplicates!0 lt!169487 #b00000000000000000000000000000000 Nil!5602))))

(declare-fun b!369104 () Bool)

(declare-fun res!207073 () Bool)

(declare-fun e!225590 () Bool)

(assert (=> b!369104 (=> (not res!207073) (not e!225590))))

(declare-fun _keys!658 () array!21267)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21267 (_ BitVec 32)) Bool)

(assert (=> b!369104 (= res!207073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369105 () Bool)

(declare-fun res!207071 () Bool)

(assert (=> b!369105 (=> (not res!207071) (not e!225590))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369105 (= res!207071 (and (= (size!10454 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10455 _keys!658) (size!10454 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369106 () Bool)

(assert (=> b!369106 (= e!225589 false)))

(declare-datatypes ((tuple2!5776 0))(
  ( (tuple2!5777 (_1!2899 (_ BitVec 64)) (_2!2899 V!12659)) )
))
(declare-datatypes ((List!5606 0))(
  ( (Nil!5603) (Cons!5602 (h!6458 tuple2!5776) (t!10747 List!5606)) )
))
(declare-datatypes ((ListLongMap!4679 0))(
  ( (ListLongMap!4680 (toList!2355 List!5606)) )
))
(declare-fun lt!169488 () ListLongMap!4679)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12659)

(declare-fun v!373 () V!12659)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12659)

(declare-fun getCurrentListMapNoExtraKeys!646 (array!21267 array!21265 (_ BitVec 32) (_ BitVec 32) V!12659 V!12659 (_ BitVec 32) Int) ListLongMap!4679)

(assert (=> b!369106 (= lt!169488 (getCurrentListMapNoExtraKeys!646 lt!169487 (array!21266 (store (arr!10101 _values!506) i!548 (ValueCellFull!3989 v!373)) (size!10454 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169486 () ListLongMap!4679)

(assert (=> b!369106 (= lt!169486 (getCurrentListMapNoExtraKeys!646 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369107 () Bool)

(declare-fun res!207079 () Bool)

(assert (=> b!369107 (=> (not res!207079) (not e!225590))))

(assert (=> b!369107 (= res!207079 (or (= (select (arr!10102 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10102 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369108 () Bool)

(assert (=> b!369108 (= e!225590 e!225589)))

(declare-fun res!207078 () Bool)

(assert (=> b!369108 (=> (not res!207078) (not e!225589))))

(assert (=> b!369108 (= res!207078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169487 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!369108 (= lt!169487 (array!21268 (store (arr!10102 _keys!658) i!548 k0!778) (size!10455 _keys!658)))))

(declare-fun res!207072 () Bool)

(assert (=> start!36876 (=> (not res!207072) (not e!225590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36876 (= res!207072 (validMask!0 mask!970))))

(assert (=> start!36876 e!225590))

(declare-fun array_inv!7480 (array!21265) Bool)

(assert (=> start!36876 (and (array_inv!7480 _values!506) e!225588)))

(assert (=> start!36876 tp!28767))

(assert (=> start!36876 true))

(assert (=> start!36876 tp_is_empty!8665))

(declare-fun array_inv!7481 (array!21267) Bool)

(assert (=> start!36876 (array_inv!7481 _keys!658)))

(declare-fun b!369101 () Bool)

(declare-fun res!207076 () Bool)

(assert (=> b!369101 (=> (not res!207076) (not e!225590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369101 (= res!207076 (validKeyInArray!0 k0!778))))

(declare-fun b!369109 () Bool)

(assert (=> b!369109 (= e!225593 tp_is_empty!8665)))

(declare-fun b!369110 () Bool)

(declare-fun res!207075 () Bool)

(assert (=> b!369110 (=> (not res!207075) (not e!225590))))

(assert (=> b!369110 (= res!207075 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10455 _keys!658))))))

(declare-fun b!369111 () Bool)

(declare-fun res!207080 () Bool)

(assert (=> b!369111 (=> (not res!207080) (not e!225590))))

(assert (=> b!369111 (= res!207080 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5602))))

(declare-fun mapIsEmpty!14562 () Bool)

(assert (=> mapIsEmpty!14562 mapRes!14562))

(declare-fun b!369112 () Bool)

(declare-fun res!207077 () Bool)

(assert (=> b!369112 (=> (not res!207077) (not e!225590))))

(declare-fun arrayContainsKey!0 (array!21267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369112 (= res!207077 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36876 res!207072) b!369105))

(assert (= (and b!369105 res!207071) b!369104))

(assert (= (and b!369104 res!207073) b!369111))

(assert (= (and b!369111 res!207080) b!369110))

(assert (= (and b!369110 res!207075) b!369101))

(assert (= (and b!369101 res!207076) b!369107))

(assert (= (and b!369107 res!207079) b!369112))

(assert (= (and b!369112 res!207077) b!369108))

(assert (= (and b!369108 res!207078) b!369103))

(assert (= (and b!369103 res!207074) b!369106))

(assert (= (and b!369100 condMapEmpty!14562) mapIsEmpty!14562))

(assert (= (and b!369100 (not condMapEmpty!14562)) mapNonEmpty!14562))

(get-info :version)

(assert (= (and mapNonEmpty!14562 ((_ is ValueCellFull!3989) mapValue!14562)) b!369109))

(assert (= (and b!369100 ((_ is ValueCellFull!3989) mapDefault!14562)) b!369102))

(assert (= start!36876 b!369100))

(declare-fun m!365039 () Bool)

(assert (=> b!369112 m!365039))

(declare-fun m!365041 () Bool)

(assert (=> b!369111 m!365041))

(declare-fun m!365043 () Bool)

(assert (=> b!369103 m!365043))

(declare-fun m!365045 () Bool)

(assert (=> b!369108 m!365045))

(declare-fun m!365047 () Bool)

(assert (=> b!369108 m!365047))

(declare-fun m!365049 () Bool)

(assert (=> b!369104 m!365049))

(declare-fun m!365051 () Bool)

(assert (=> b!369101 m!365051))

(declare-fun m!365053 () Bool)

(assert (=> start!36876 m!365053))

(declare-fun m!365055 () Bool)

(assert (=> start!36876 m!365055))

(declare-fun m!365057 () Bool)

(assert (=> start!36876 m!365057))

(declare-fun m!365059 () Bool)

(assert (=> b!369106 m!365059))

(declare-fun m!365061 () Bool)

(assert (=> b!369106 m!365061))

(declare-fun m!365063 () Bool)

(assert (=> b!369106 m!365063))

(declare-fun m!365065 () Bool)

(assert (=> b!369107 m!365065))

(declare-fun m!365067 () Bool)

(assert (=> mapNonEmpty!14562 m!365067))

(check-sat (not b!369101) (not b!369111) (not mapNonEmpty!14562) (not b!369104) b_and!15233 (not b!369103) (not b!369112) (not b!369108) (not b_next!8017) (not b!369106) tp_is_empty!8665 (not start!36876))
(check-sat b_and!15233 (not b_next!8017))
