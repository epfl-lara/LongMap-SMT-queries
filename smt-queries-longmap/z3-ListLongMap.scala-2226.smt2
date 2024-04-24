; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36804 () Bool)

(assert start!36804)

(declare-fun b_free!7945 () Bool)

(declare-fun b_next!7945 () Bool)

(assert (=> start!36804 (= b_free!7945 (not b_next!7945))))

(declare-fun tp!28551 () Bool)

(declare-fun b_and!15201 () Bool)

(assert (=> start!36804 (= tp!28551 b_and!15201)))

(declare-fun b!367918 () Bool)

(declare-fun res!206118 () Bool)

(declare-fun e!225085 () Bool)

(assert (=> b!367918 (=> (not res!206118) (not e!225085))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12563 0))(
  ( (V!12564 (val!4341 Int)) )
))
(declare-datatypes ((ValueCell!3953 0))(
  ( (ValueCellFull!3953 (v!6539 V!12563)) (EmptyCell!3953) )
))
(declare-datatypes ((array!21126 0))(
  ( (array!21127 (arr!10031 (Array (_ BitVec 32) ValueCell!3953)) (size!10383 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21126)

(declare-datatypes ((array!21128 0))(
  ( (array!21129 (arr!10032 (Array (_ BitVec 32) (_ BitVec 64))) (size!10384 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21128)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367918 (= res!206118 (and (= (size!10383 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10384 _keys!658) (size!10383 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367919 () Bool)

(declare-fun res!206123 () Bool)

(assert (=> b!367919 (=> (not res!206123) (not e!225085))))

(declare-datatypes ((List!5491 0))(
  ( (Nil!5488) (Cons!5487 (h!6343 (_ BitVec 64)) (t!10633 List!5491)) )
))
(declare-fun arrayNoDuplicates!0 (array!21128 (_ BitVec 32) List!5491) Bool)

(assert (=> b!367919 (= res!206123 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5488))))

(declare-fun b!367920 () Bool)

(declare-fun res!206125 () Bool)

(assert (=> b!367920 (=> (not res!206125) (not e!225085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21128 (_ BitVec 32)) Bool)

(assert (=> b!367920 (= res!206125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367921 () Bool)

(declare-fun res!206126 () Bool)

(assert (=> b!367921 (=> (not res!206126) (not e!225085))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367921 (= res!206126 (validKeyInArray!0 k0!778))))

(declare-fun b!367922 () Bool)

(declare-fun e!225087 () Bool)

(declare-fun tp_is_empty!8593 () Bool)

(assert (=> b!367922 (= e!225087 tp_is_empty!8593)))

(declare-fun mapIsEmpty!14454 () Bool)

(declare-fun mapRes!14454 () Bool)

(assert (=> mapIsEmpty!14454 mapRes!14454))

(declare-fun b!367923 () Bool)

(declare-fun e!225084 () Bool)

(assert (=> b!367923 (= e!225084 false)))

(declare-datatypes ((tuple2!5672 0))(
  ( (tuple2!5673 (_1!2847 (_ BitVec 64)) (_2!2847 V!12563)) )
))
(declare-datatypes ((List!5492 0))(
  ( (Nil!5489) (Cons!5488 (h!6344 tuple2!5672) (t!10634 List!5492)) )
))
(declare-datatypes ((ListLongMap!4587 0))(
  ( (ListLongMap!4588 (toList!2309 List!5492)) )
))
(declare-fun lt!169476 () ListLongMap!4587)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12563)

(declare-fun minValue!472 () V!12563)

(declare-fun getCurrentListMapNoExtraKeys!618 (array!21128 array!21126 (_ BitVec 32) (_ BitVec 32) V!12563 V!12563 (_ BitVec 32) Int) ListLongMap!4587)

(assert (=> b!367923 (= lt!169476 (getCurrentListMapNoExtraKeys!618 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!206124 () Bool)

(assert (=> start!36804 (=> (not res!206124) (not e!225085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36804 (= res!206124 (validMask!0 mask!970))))

(assert (=> start!36804 e!225085))

(assert (=> start!36804 true))

(declare-fun e!225082 () Bool)

(declare-fun array_inv!7450 (array!21126) Bool)

(assert (=> start!36804 (and (array_inv!7450 _values!506) e!225082)))

(assert (=> start!36804 tp!28551))

(assert (=> start!36804 tp_is_empty!8593))

(declare-fun array_inv!7451 (array!21128) Bool)

(assert (=> start!36804 (array_inv!7451 _keys!658)))

(declare-fun b!367924 () Bool)

(declare-fun res!206117 () Bool)

(assert (=> b!367924 (=> (not res!206117) (not e!225085))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367924 (= res!206117 (or (= (select (arr!10032 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10032 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367925 () Bool)

(assert (=> b!367925 (= e!225085 e!225084)))

(declare-fun res!206121 () Bool)

(assert (=> b!367925 (=> (not res!206121) (not e!225084))))

(declare-fun lt!169477 () array!21128)

(assert (=> b!367925 (= res!206121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169477 mask!970))))

(assert (=> b!367925 (= lt!169477 (array!21129 (store (arr!10032 _keys!658) i!548 k0!778) (size!10384 _keys!658)))))

(declare-fun b!367926 () Bool)

(assert (=> b!367926 (= e!225082 (and e!225087 mapRes!14454))))

(declare-fun condMapEmpty!14454 () Bool)

(declare-fun mapDefault!14454 () ValueCell!3953)

(assert (=> b!367926 (= condMapEmpty!14454 (= (arr!10031 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3953)) mapDefault!14454)))))

(declare-fun b!367927 () Bool)

(declare-fun res!206120 () Bool)

(assert (=> b!367927 (=> (not res!206120) (not e!225084))))

(assert (=> b!367927 (= res!206120 (arrayNoDuplicates!0 lt!169477 #b00000000000000000000000000000000 Nil!5488))))

(declare-fun mapNonEmpty!14454 () Bool)

(declare-fun tp!28550 () Bool)

(declare-fun e!225086 () Bool)

(assert (=> mapNonEmpty!14454 (= mapRes!14454 (and tp!28550 e!225086))))

(declare-fun mapKey!14454 () (_ BitVec 32))

(declare-fun mapValue!14454 () ValueCell!3953)

(declare-fun mapRest!14454 () (Array (_ BitVec 32) ValueCell!3953))

(assert (=> mapNonEmpty!14454 (= (arr!10031 _values!506) (store mapRest!14454 mapKey!14454 mapValue!14454))))

(declare-fun b!367928 () Bool)

(assert (=> b!367928 (= e!225086 tp_is_empty!8593)))

(declare-fun b!367929 () Bool)

(declare-fun res!206119 () Bool)

(assert (=> b!367929 (=> (not res!206119) (not e!225085))))

(declare-fun arrayContainsKey!0 (array!21128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367929 (= res!206119 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367930 () Bool)

(declare-fun res!206122 () Bool)

(assert (=> b!367930 (=> (not res!206122) (not e!225085))))

(assert (=> b!367930 (= res!206122 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10384 _keys!658))))))

(assert (= (and start!36804 res!206124) b!367918))

(assert (= (and b!367918 res!206118) b!367920))

(assert (= (and b!367920 res!206125) b!367919))

(assert (= (and b!367919 res!206123) b!367930))

(assert (= (and b!367930 res!206122) b!367921))

(assert (= (and b!367921 res!206126) b!367924))

(assert (= (and b!367924 res!206117) b!367929))

(assert (= (and b!367929 res!206119) b!367925))

(assert (= (and b!367925 res!206121) b!367927))

(assert (= (and b!367927 res!206120) b!367923))

(assert (= (and b!367926 condMapEmpty!14454) mapIsEmpty!14454))

(assert (= (and b!367926 (not condMapEmpty!14454)) mapNonEmpty!14454))

(get-info :version)

(assert (= (and mapNonEmpty!14454 ((_ is ValueCellFull!3953) mapValue!14454)) b!367928))

(assert (= (and b!367926 ((_ is ValueCellFull!3953) mapDefault!14454)) b!367922))

(assert (= start!36804 b!367926))

(declare-fun m!364997 () Bool)

(assert (=> b!367929 m!364997))

(declare-fun m!364999 () Bool)

(assert (=> b!367923 m!364999))

(declare-fun m!365001 () Bool)

(assert (=> b!367920 m!365001))

(declare-fun m!365003 () Bool)

(assert (=> b!367921 m!365003))

(declare-fun m!365005 () Bool)

(assert (=> b!367924 m!365005))

(declare-fun m!365007 () Bool)

(assert (=> start!36804 m!365007))

(declare-fun m!365009 () Bool)

(assert (=> start!36804 m!365009))

(declare-fun m!365011 () Bool)

(assert (=> start!36804 m!365011))

(declare-fun m!365013 () Bool)

(assert (=> mapNonEmpty!14454 m!365013))

(declare-fun m!365015 () Bool)

(assert (=> b!367925 m!365015))

(declare-fun m!365017 () Bool)

(assert (=> b!367925 m!365017))

(declare-fun m!365019 () Bool)

(assert (=> b!367919 m!365019))

(declare-fun m!365021 () Bool)

(assert (=> b!367927 m!365021))

(check-sat (not b!367925) tp_is_empty!8593 (not b!367919) (not b!367921) (not b!367920) (not mapNonEmpty!14454) (not b!367929) (not b!367923) b_and!15201 (not start!36804) (not b_next!7945) (not b!367927))
(check-sat b_and!15201 (not b_next!7945))
