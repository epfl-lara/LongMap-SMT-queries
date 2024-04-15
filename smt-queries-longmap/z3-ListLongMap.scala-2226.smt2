; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36804 () Bool)

(assert start!36804)

(declare-fun b_free!7945 () Bool)

(declare-fun b_next!7945 () Bool)

(assert (=> start!36804 (= b_free!7945 (not b_next!7945))))

(declare-fun tp!28550 () Bool)

(declare-fun b_and!15161 () Bool)

(assert (=> start!36804 (= tp!28550 b_and!15161)))

(declare-fun b!367696 () Bool)

(declare-fun e!224941 () Bool)

(declare-fun tp_is_empty!8593 () Bool)

(assert (=> b!367696 (= e!224941 tp_is_empty!8593)))

(declare-fun b!367697 () Bool)

(declare-fun res!205994 () Bool)

(declare-fun e!224944 () Bool)

(assert (=> b!367697 (=> (not res!205994) (not e!224944))))

(declare-datatypes ((array!21125 0))(
  ( (array!21126 (arr!10031 (Array (_ BitVec 32) (_ BitVec 64))) (size!10384 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21125)

(declare-datatypes ((List!5549 0))(
  ( (Nil!5546) (Cons!5545 (h!6401 (_ BitVec 64)) (t!10690 List!5549)) )
))
(declare-fun arrayNoDuplicates!0 (array!21125 (_ BitVec 32) List!5549) Bool)

(assert (=> b!367697 (= res!205994 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5546))))

(declare-fun b!367698 () Bool)

(declare-fun res!206000 () Bool)

(assert (=> b!367698 (=> (not res!206000) (not e!224944))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12563 0))(
  ( (V!12564 (val!4341 Int)) )
))
(declare-datatypes ((ValueCell!3953 0))(
  ( (ValueCellFull!3953 (v!6532 V!12563)) (EmptyCell!3953) )
))
(declare-datatypes ((array!21127 0))(
  ( (array!21128 (arr!10032 (Array (_ BitVec 32) ValueCell!3953)) (size!10385 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21127)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367698 (= res!206000 (and (= (size!10385 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10384 _keys!658) (size!10385 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367699 () Bool)

(declare-fun res!205991 () Bool)

(assert (=> b!367699 (=> (not res!205991) (not e!224944))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367699 (= res!205991 (or (= (select (arr!10031 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10031 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367700 () Bool)

(declare-fun e!224942 () Bool)

(declare-fun mapRes!14454 () Bool)

(assert (=> b!367700 (= e!224942 (and e!224941 mapRes!14454))))

(declare-fun condMapEmpty!14454 () Bool)

(declare-fun mapDefault!14454 () ValueCell!3953)

(assert (=> b!367700 (= condMapEmpty!14454 (= (arr!10032 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3953)) mapDefault!14454)))))

(declare-fun mapIsEmpty!14454 () Bool)

(assert (=> mapIsEmpty!14454 mapRes!14454))

(declare-fun b!367701 () Bool)

(declare-fun res!205997 () Bool)

(assert (=> b!367701 (=> (not res!205997) (not e!224944))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367701 (= res!205997 (validKeyInArray!0 k0!778))))

(declare-fun b!367702 () Bool)

(declare-fun res!205995 () Bool)

(assert (=> b!367702 (=> (not res!205995) (not e!224944))))

(declare-fun arrayContainsKey!0 (array!21125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367702 (= res!205995 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!205996 () Bool)

(assert (=> start!36804 (=> (not res!205996) (not e!224944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36804 (= res!205996 (validMask!0 mask!970))))

(assert (=> start!36804 e!224944))

(assert (=> start!36804 true))

(declare-fun array_inv!7434 (array!21127) Bool)

(assert (=> start!36804 (and (array_inv!7434 _values!506) e!224942)))

(assert (=> start!36804 tp!28550))

(assert (=> start!36804 tp_is_empty!8593))

(declare-fun array_inv!7435 (array!21125) Bool)

(assert (=> start!36804 (array_inv!7435 _keys!658)))

(declare-fun b!367703 () Bool)

(declare-fun res!205998 () Bool)

(assert (=> b!367703 (=> (not res!205998) (not e!224944))))

(assert (=> b!367703 (= res!205998 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10384 _keys!658))))))

(declare-fun mapNonEmpty!14454 () Bool)

(declare-fun tp!28551 () Bool)

(declare-fun e!224945 () Bool)

(assert (=> mapNonEmpty!14454 (= mapRes!14454 (and tp!28551 e!224945))))

(declare-fun mapValue!14454 () ValueCell!3953)

(declare-fun mapRest!14454 () (Array (_ BitVec 32) ValueCell!3953))

(declare-fun mapKey!14454 () (_ BitVec 32))

(assert (=> mapNonEmpty!14454 (= (arr!10032 _values!506) (store mapRest!14454 mapKey!14454 mapValue!14454))))

(declare-fun b!367704 () Bool)

(declare-fun e!224943 () Bool)

(assert (=> b!367704 (= e!224943 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5720 0))(
  ( (tuple2!5721 (_1!2871 (_ BitVec 64)) (_2!2871 V!12563)) )
))
(declare-datatypes ((List!5550 0))(
  ( (Nil!5547) (Cons!5546 (h!6402 tuple2!5720) (t!10691 List!5550)) )
))
(declare-datatypes ((ListLongMap!4623 0))(
  ( (ListLongMap!4624 (toList!2327 List!5550)) )
))
(declare-fun lt!169223 () ListLongMap!4623)

(declare-fun zeroValue!472 () V!12563)

(declare-fun minValue!472 () V!12563)

(declare-fun getCurrentListMapNoExtraKeys!618 (array!21125 array!21127 (_ BitVec 32) (_ BitVec 32) V!12563 V!12563 (_ BitVec 32) Int) ListLongMap!4623)

(assert (=> b!367704 (= lt!169223 (getCurrentListMapNoExtraKeys!618 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367705 () Bool)

(declare-fun res!205993 () Bool)

(assert (=> b!367705 (=> (not res!205993) (not e!224944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21125 (_ BitVec 32)) Bool)

(assert (=> b!367705 (= res!205993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367706 () Bool)

(assert (=> b!367706 (= e!224945 tp_is_empty!8593)))

(declare-fun b!367707 () Bool)

(assert (=> b!367707 (= e!224944 e!224943)))

(declare-fun res!205992 () Bool)

(assert (=> b!367707 (=> (not res!205992) (not e!224943))))

(declare-fun lt!169224 () array!21125)

(assert (=> b!367707 (= res!205992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169224 mask!970))))

(assert (=> b!367707 (= lt!169224 (array!21126 (store (arr!10031 _keys!658) i!548 k0!778) (size!10384 _keys!658)))))

(declare-fun b!367708 () Bool)

(declare-fun res!205999 () Bool)

(assert (=> b!367708 (=> (not res!205999) (not e!224943))))

(assert (=> b!367708 (= res!205999 (arrayNoDuplicates!0 lt!169224 #b00000000000000000000000000000000 Nil!5546))))

(assert (= (and start!36804 res!205996) b!367698))

(assert (= (and b!367698 res!206000) b!367705))

(assert (= (and b!367705 res!205993) b!367697))

(assert (= (and b!367697 res!205994) b!367703))

(assert (= (and b!367703 res!205998) b!367701))

(assert (= (and b!367701 res!205997) b!367699))

(assert (= (and b!367699 res!205991) b!367702))

(assert (= (and b!367702 res!205995) b!367707))

(assert (= (and b!367707 res!205992) b!367708))

(assert (= (and b!367708 res!205999) b!367704))

(assert (= (and b!367700 condMapEmpty!14454) mapIsEmpty!14454))

(assert (= (and b!367700 (not condMapEmpty!14454)) mapNonEmpty!14454))

(get-info :version)

(assert (= (and mapNonEmpty!14454 ((_ is ValueCellFull!3953) mapValue!14454)) b!367706))

(assert (= (and b!367700 ((_ is ValueCellFull!3953) mapDefault!14454)) b!367696))

(assert (= start!36804 b!367700))

(declare-fun m!364043 () Bool)

(assert (=> b!367701 m!364043))

(declare-fun m!364045 () Bool)

(assert (=> b!367705 m!364045))

(declare-fun m!364047 () Bool)

(assert (=> mapNonEmpty!14454 m!364047))

(declare-fun m!364049 () Bool)

(assert (=> b!367697 m!364049))

(declare-fun m!364051 () Bool)

(assert (=> start!36804 m!364051))

(declare-fun m!364053 () Bool)

(assert (=> start!36804 m!364053))

(declare-fun m!364055 () Bool)

(assert (=> start!36804 m!364055))

(declare-fun m!364057 () Bool)

(assert (=> b!367708 m!364057))

(declare-fun m!364059 () Bool)

(assert (=> b!367704 m!364059))

(declare-fun m!364061 () Bool)

(assert (=> b!367707 m!364061))

(declare-fun m!364063 () Bool)

(assert (=> b!367707 m!364063))

(declare-fun m!364065 () Bool)

(assert (=> b!367702 m!364065))

(declare-fun m!364067 () Bool)

(assert (=> b!367699 m!364067))

(check-sat (not b!367708) (not b!367704) (not b!367705) (not b!367707) (not b_next!7945) (not b!367702) (not b!367701) tp_is_empty!8593 (not mapNonEmpty!14454) (not start!36804) b_and!15161 (not b!367697))
(check-sat b_and!15161 (not b_next!7945))
