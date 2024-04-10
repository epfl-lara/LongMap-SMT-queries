; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36850 () Bool)

(assert start!36850)

(declare-fun b_free!7977 () Bool)

(declare-fun b_next!7977 () Bool)

(assert (=> start!36850 (= b_free!7977 (not b_next!7977))))

(declare-fun tp!28646 () Bool)

(declare-fun b_and!15219 () Bool)

(assert (=> start!36850 (= tp!28646 b_and!15219)))

(declare-fun b!368591 () Bool)

(declare-fun e!225404 () Bool)

(declare-fun e!225406 () Bool)

(declare-fun mapRes!14502 () Bool)

(assert (=> b!368591 (= e!225404 (and e!225406 mapRes!14502))))

(declare-fun condMapEmpty!14502 () Bool)

(declare-datatypes ((V!12605 0))(
  ( (V!12606 (val!4357 Int)) )
))
(declare-datatypes ((ValueCell!3969 0))(
  ( (ValueCellFull!3969 (v!6554 V!12605)) (EmptyCell!3969) )
))
(declare-datatypes ((array!21205 0))(
  ( (array!21206 (arr!10071 (Array (_ BitVec 32) ValueCell!3969)) (size!10423 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21205)

(declare-fun mapDefault!14502 () ValueCell!3969)

(assert (=> b!368591 (= condMapEmpty!14502 (= (arr!10071 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3969)) mapDefault!14502)))))

(declare-fun b!368592 () Bool)

(declare-fun e!225407 () Bool)

(declare-fun e!225402 () Bool)

(assert (=> b!368592 (= e!225407 e!225402)))

(declare-fun res!206603 () Bool)

(assert (=> b!368592 (=> (not res!206603) (not e!225402))))

(declare-datatypes ((array!21207 0))(
  ( (array!21208 (arr!10072 (Array (_ BitVec 32) (_ BitVec 64))) (size!10424 (_ BitVec 32))) )
))
(declare-fun lt!169554 () array!21207)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21207 (_ BitVec 32)) Bool)

(assert (=> b!368592 (= res!206603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169554 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21207)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368592 (= lt!169554 (array!21208 (store (arr!10072 _keys!658) i!548 k0!778) (size!10424 _keys!658)))))

(declare-fun b!368593 () Bool)

(declare-fun res!206607 () Bool)

(assert (=> b!368593 (=> (not res!206607) (not e!225407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368593 (= res!206607 (validKeyInArray!0 k0!778))))

(declare-fun b!368594 () Bool)

(declare-fun res!206609 () Bool)

(assert (=> b!368594 (=> (not res!206609) (not e!225407))))

(assert (=> b!368594 (= res!206609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14502 () Bool)

(declare-fun tp!28647 () Bool)

(declare-fun e!225405 () Bool)

(assert (=> mapNonEmpty!14502 (= mapRes!14502 (and tp!28647 e!225405))))

(declare-fun mapRest!14502 () (Array (_ BitVec 32) ValueCell!3969))

(declare-fun mapKey!14502 () (_ BitVec 32))

(declare-fun mapValue!14502 () ValueCell!3969)

(assert (=> mapNonEmpty!14502 (= (arr!10071 _values!506) (store mapRest!14502 mapKey!14502 mapValue!14502))))

(declare-fun b!368595 () Bool)

(declare-fun res!206604 () Bool)

(assert (=> b!368595 (=> (not res!206604) (not e!225407))))

(declare-fun arrayContainsKey!0 (array!21207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368595 (= res!206604 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368597 () Bool)

(declare-fun res!206600 () Bool)

(assert (=> b!368597 (=> (not res!206600) (not e!225407))))

(assert (=> b!368597 (= res!206600 (or (= (select (arr!10072 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10072 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368598 () Bool)

(declare-fun res!206602 () Bool)

(assert (=> b!368598 (=> (not res!206602) (not e!225407))))

(declare-datatypes ((List!5607 0))(
  ( (Nil!5604) (Cons!5603 (h!6459 (_ BitVec 64)) (t!10757 List!5607)) )
))
(declare-fun arrayNoDuplicates!0 (array!21207 (_ BitVec 32) List!5607) Bool)

(assert (=> b!368598 (= res!206602 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5604))))

(declare-fun b!368599 () Bool)

(declare-fun res!206601 () Bool)

(assert (=> b!368599 (=> (not res!206601) (not e!225407))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368599 (= res!206601 (and (= (size!10423 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10424 _keys!658) (size!10423 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368600 () Bool)

(declare-fun res!206608 () Bool)

(assert (=> b!368600 (=> (not res!206608) (not e!225402))))

(assert (=> b!368600 (= res!206608 (arrayNoDuplicates!0 lt!169554 #b00000000000000000000000000000000 Nil!5604))))

(declare-fun b!368601 () Bool)

(assert (=> b!368601 (= e!225402 false)))

(declare-datatypes ((tuple2!5774 0))(
  ( (tuple2!5775 (_1!2898 (_ BitVec 64)) (_2!2898 V!12605)) )
))
(declare-datatypes ((List!5608 0))(
  ( (Nil!5605) (Cons!5604 (h!6460 tuple2!5774) (t!10758 List!5608)) )
))
(declare-datatypes ((ListLongMap!4687 0))(
  ( (ListLongMap!4688 (toList!2359 List!5608)) )
))
(declare-fun lt!169553 () ListLongMap!4687)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12605)

(declare-fun minValue!472 () V!12605)

(declare-fun getCurrentListMapNoExtraKeys!636 (array!21207 array!21205 (_ BitVec 32) (_ BitVec 32) V!12605 V!12605 (_ BitVec 32) Int) ListLongMap!4687)

(assert (=> b!368601 (= lt!169553 (getCurrentListMapNoExtraKeys!636 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368602 () Bool)

(declare-fun tp_is_empty!8625 () Bool)

(assert (=> b!368602 (= e!225406 tp_is_empty!8625)))

(declare-fun b!368603 () Bool)

(assert (=> b!368603 (= e!225405 tp_is_empty!8625)))

(declare-fun mapIsEmpty!14502 () Bool)

(assert (=> mapIsEmpty!14502 mapRes!14502))

(declare-fun b!368596 () Bool)

(declare-fun res!206605 () Bool)

(assert (=> b!368596 (=> (not res!206605) (not e!225407))))

(assert (=> b!368596 (= res!206605 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10424 _keys!658))))))

(declare-fun res!206606 () Bool)

(assert (=> start!36850 (=> (not res!206606) (not e!225407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36850 (= res!206606 (validMask!0 mask!970))))

(assert (=> start!36850 e!225407))

(assert (=> start!36850 true))

(declare-fun array_inv!7446 (array!21205) Bool)

(assert (=> start!36850 (and (array_inv!7446 _values!506) e!225404)))

(assert (=> start!36850 tp!28646))

(assert (=> start!36850 tp_is_empty!8625))

(declare-fun array_inv!7447 (array!21207) Bool)

(assert (=> start!36850 (array_inv!7447 _keys!658)))

(assert (= (and start!36850 res!206606) b!368599))

(assert (= (and b!368599 res!206601) b!368594))

(assert (= (and b!368594 res!206609) b!368598))

(assert (= (and b!368598 res!206602) b!368596))

(assert (= (and b!368596 res!206605) b!368593))

(assert (= (and b!368593 res!206607) b!368597))

(assert (= (and b!368597 res!206600) b!368595))

(assert (= (and b!368595 res!206604) b!368592))

(assert (= (and b!368592 res!206603) b!368600))

(assert (= (and b!368600 res!206608) b!368601))

(assert (= (and b!368591 condMapEmpty!14502) mapIsEmpty!14502))

(assert (= (and b!368591 (not condMapEmpty!14502)) mapNonEmpty!14502))

(get-info :version)

(assert (= (and mapNonEmpty!14502 ((_ is ValueCellFull!3969) mapValue!14502)) b!368603))

(assert (= (and b!368591 ((_ is ValueCellFull!3969) mapDefault!14502)) b!368602))

(assert (= start!36850 b!368591))

(declare-fun m!365183 () Bool)

(assert (=> b!368600 m!365183))

(declare-fun m!365185 () Bool)

(assert (=> start!36850 m!365185))

(declare-fun m!365187 () Bool)

(assert (=> start!36850 m!365187))

(declare-fun m!365189 () Bool)

(assert (=> start!36850 m!365189))

(declare-fun m!365191 () Bool)

(assert (=> mapNonEmpty!14502 m!365191))

(declare-fun m!365193 () Bool)

(assert (=> b!368593 m!365193))

(declare-fun m!365195 () Bool)

(assert (=> b!368601 m!365195))

(declare-fun m!365197 () Bool)

(assert (=> b!368595 m!365197))

(declare-fun m!365199 () Bool)

(assert (=> b!368594 m!365199))

(declare-fun m!365201 () Bool)

(assert (=> b!368598 m!365201))

(declare-fun m!365203 () Bool)

(assert (=> b!368592 m!365203))

(declare-fun m!365205 () Bool)

(assert (=> b!368592 m!365205))

(declare-fun m!365207 () Bool)

(assert (=> b!368597 m!365207))

(check-sat (not b!368593) (not start!36850) (not b!368600) b_and!15219 (not b!368595) (not b!368598) (not b!368594) (not b_next!7977) (not mapNonEmpty!14502) (not b!368601) tp_is_empty!8625 (not b!368592))
(check-sat b_and!15219 (not b_next!7977))
