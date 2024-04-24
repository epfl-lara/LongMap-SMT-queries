; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37596 () Bool)

(assert start!37596)

(declare-fun b_free!8737 () Bool)

(declare-fun b_next!8737 () Bool)

(assert (=> start!37596 (= b_free!8737 (not b_next!8737))))

(declare-fun tp!30926 () Bool)

(declare-fun b_and!15993 () Bool)

(assert (=> start!37596 (= tp!30926 b_and!15993)))

(declare-fun b!384714 () Bool)

(declare-fun e!233538 () Bool)

(declare-fun tp_is_empty!9385 () Bool)

(assert (=> b!384714 (= e!233538 tp_is_empty!9385)))

(declare-fun b!384715 () Bool)

(declare-fun res!219349 () Bool)

(declare-fun e!233535 () Bool)

(assert (=> b!384715 (=> (not res!219349) (not e!233535))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22664 0))(
  ( (array!22665 (arr!10800 (Array (_ BitVec 32) (_ BitVec 64))) (size!11152 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22664)

(assert (=> b!384715 (= res!219349 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11152 _keys!658))))))

(declare-fun b!384716 () Bool)

(declare-fun res!219353 () Bool)

(assert (=> b!384716 (=> (not res!219353) (not e!233535))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384716 (= res!219353 (validKeyInArray!0 k0!778))))

(declare-fun b!384717 () Bool)

(declare-fun res!219350 () Bool)

(assert (=> b!384717 (=> (not res!219350) (not e!233535))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22664 (_ BitVec 32)) Bool)

(assert (=> b!384717 (= res!219350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384718 () Bool)

(declare-fun res!219358 () Bool)

(assert (=> b!384718 (=> (not res!219358) (not e!233535))))

(assert (=> b!384718 (= res!219358 (or (= (select (arr!10800 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10800 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!219355 () Bool)

(assert (=> start!37596 (=> (not res!219355) (not e!233535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37596 (= res!219355 (validMask!0 mask!970))))

(assert (=> start!37596 e!233535))

(declare-datatypes ((V!13619 0))(
  ( (V!13620 (val!4737 Int)) )
))
(declare-datatypes ((ValueCell!4349 0))(
  ( (ValueCellFull!4349 (v!6935 V!13619)) (EmptyCell!4349) )
))
(declare-datatypes ((array!22666 0))(
  ( (array!22667 (arr!10801 (Array (_ BitVec 32) ValueCell!4349)) (size!11153 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22666)

(declare-fun e!233540 () Bool)

(declare-fun array_inv!7988 (array!22666) Bool)

(assert (=> start!37596 (and (array_inv!7988 _values!506) e!233540)))

(assert (=> start!37596 tp!30926))

(assert (=> start!37596 true))

(assert (=> start!37596 tp_is_empty!9385))

(declare-fun array_inv!7989 (array!22664) Bool)

(assert (=> start!37596 (array_inv!7989 _keys!658)))

(declare-fun mapNonEmpty!15642 () Bool)

(declare-fun mapRes!15642 () Bool)

(declare-fun tp!30927 () Bool)

(assert (=> mapNonEmpty!15642 (= mapRes!15642 (and tp!30927 e!233538))))

(declare-fun mapRest!15642 () (Array (_ BitVec 32) ValueCell!4349))

(declare-fun mapKey!15642 () (_ BitVec 32))

(declare-fun mapValue!15642 () ValueCell!4349)

(assert (=> mapNonEmpty!15642 (= (arr!10801 _values!506) (store mapRest!15642 mapKey!15642 mapValue!15642))))

(declare-fun b!384719 () Bool)

(declare-fun e!233536 () Bool)

(assert (=> b!384719 (= e!233536 true)))

(declare-datatypes ((tuple2!6250 0))(
  ( (tuple2!6251 (_1!3136 (_ BitVec 64)) (_2!3136 V!13619)) )
))
(declare-datatypes ((List!6087 0))(
  ( (Nil!6084) (Cons!6083 (h!6939 tuple2!6250) (t!11229 List!6087)) )
))
(declare-datatypes ((ListLongMap!5165 0))(
  ( (ListLongMap!5166 (toList!2598 List!6087)) )
))
(declare-fun lt!181158 () ListLongMap!5165)

(declare-fun lt!181167 () ListLongMap!5165)

(declare-fun lt!181164 () tuple2!6250)

(declare-fun +!990 (ListLongMap!5165 tuple2!6250) ListLongMap!5165)

(assert (=> b!384719 (= lt!181158 (+!990 lt!181167 lt!181164))))

(declare-fun lt!181159 () ListLongMap!5165)

(declare-fun lt!181160 () ListLongMap!5165)

(assert (=> b!384719 (= lt!181159 lt!181160)))

(declare-fun mapIsEmpty!15642 () Bool)

(assert (=> mapIsEmpty!15642 mapRes!15642))

(declare-fun b!384720 () Bool)

(declare-fun res!219359 () Bool)

(assert (=> b!384720 (=> (not res!219359) (not e!233535))))

(declare-datatypes ((List!6088 0))(
  ( (Nil!6085) (Cons!6084 (h!6940 (_ BitVec 64)) (t!11230 List!6088)) )
))
(declare-fun arrayNoDuplicates!0 (array!22664 (_ BitVec 32) List!6088) Bool)

(assert (=> b!384720 (= res!219359 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6085))))

(declare-fun b!384721 () Bool)

(declare-fun res!219351 () Bool)

(assert (=> b!384721 (=> (not res!219351) (not e!233535))))

(declare-fun arrayContainsKey!0 (array!22664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384721 (= res!219351 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384722 () Bool)

(declare-fun e!233537 () Bool)

(assert (=> b!384722 (= e!233535 e!233537)))

(declare-fun res!219356 () Bool)

(assert (=> b!384722 (=> (not res!219356) (not e!233537))))

(declare-fun lt!181165 () array!22664)

(assert (=> b!384722 (= res!219356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181165 mask!970))))

(assert (=> b!384722 (= lt!181165 (array!22665 (store (arr!10800 _keys!658) i!548 k0!778) (size!11152 _keys!658)))))

(declare-fun b!384723 () Bool)

(declare-fun e!233539 () Bool)

(assert (=> b!384723 (= e!233540 (and e!233539 mapRes!15642))))

(declare-fun condMapEmpty!15642 () Bool)

(declare-fun mapDefault!15642 () ValueCell!4349)

(assert (=> b!384723 (= condMapEmpty!15642 (= (arr!10801 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4349)) mapDefault!15642)))))

(declare-fun b!384724 () Bool)

(declare-fun res!219352 () Bool)

(assert (=> b!384724 (=> (not res!219352) (not e!233535))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384724 (= res!219352 (and (= (size!11153 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11152 _keys!658) (size!11153 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384725 () Bool)

(assert (=> b!384725 (= e!233539 tp_is_empty!9385)))

(declare-fun b!384726 () Bool)

(declare-fun res!219357 () Bool)

(assert (=> b!384726 (=> (not res!219357) (not e!233537))))

(assert (=> b!384726 (= res!219357 (arrayNoDuplicates!0 lt!181165 #b00000000000000000000000000000000 Nil!6085))))

(declare-fun b!384727 () Bool)

(assert (=> b!384727 (= e!233537 (not e!233536))))

(declare-fun res!219354 () Bool)

(assert (=> b!384727 (=> res!219354 e!233536)))

(declare-fun lt!181166 () Bool)

(assert (=> b!384727 (= res!219354 (or (and (not lt!181166) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181166) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181166)))))

(assert (=> b!384727 (= lt!181166 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13619)

(declare-fun minValue!472 () V!13619)

(declare-fun getCurrentListMap!2028 (array!22664 array!22666 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) Int) ListLongMap!5165)

(assert (=> b!384727 (= lt!181167 (getCurrentListMap!2028 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181162 () array!22666)

(assert (=> b!384727 (= lt!181159 (getCurrentListMap!2028 lt!181165 lt!181162 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181168 () ListLongMap!5165)

(assert (=> b!384727 (and (= lt!181160 lt!181168) (= lt!181168 lt!181160))))

(declare-fun lt!181163 () ListLongMap!5165)

(assert (=> b!384727 (= lt!181168 (+!990 lt!181163 lt!181164))))

(declare-fun v!373 () V!13619)

(assert (=> b!384727 (= lt!181164 (tuple2!6251 k0!778 v!373))))

(declare-datatypes ((Unit!11851 0))(
  ( (Unit!11852) )
))
(declare-fun lt!181161 () Unit!11851)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!215 (array!22664 array!22666 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) (_ BitVec 64) V!13619 (_ BitVec 32) Int) Unit!11851)

(assert (=> b!384727 (= lt!181161 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!215 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!875 (array!22664 array!22666 (_ BitVec 32) (_ BitVec 32) V!13619 V!13619 (_ BitVec 32) Int) ListLongMap!5165)

(assert (=> b!384727 (= lt!181160 (getCurrentListMapNoExtraKeys!875 lt!181165 lt!181162 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384727 (= lt!181162 (array!22667 (store (arr!10801 _values!506) i!548 (ValueCellFull!4349 v!373)) (size!11153 _values!506)))))

(assert (=> b!384727 (= lt!181163 (getCurrentListMapNoExtraKeys!875 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37596 res!219355) b!384724))

(assert (= (and b!384724 res!219352) b!384717))

(assert (= (and b!384717 res!219350) b!384720))

(assert (= (and b!384720 res!219359) b!384715))

(assert (= (and b!384715 res!219349) b!384716))

(assert (= (and b!384716 res!219353) b!384718))

(assert (= (and b!384718 res!219358) b!384721))

(assert (= (and b!384721 res!219351) b!384722))

(assert (= (and b!384722 res!219356) b!384726))

(assert (= (and b!384726 res!219357) b!384727))

(assert (= (and b!384727 (not res!219354)) b!384719))

(assert (= (and b!384723 condMapEmpty!15642) mapIsEmpty!15642))

(assert (= (and b!384723 (not condMapEmpty!15642)) mapNonEmpty!15642))

(get-info :version)

(assert (= (and mapNonEmpty!15642 ((_ is ValueCellFull!4349) mapValue!15642)) b!384714))

(assert (= (and b!384723 ((_ is ValueCellFull!4349) mapDefault!15642)) b!384725))

(assert (= start!37596 b!384723))

(declare-fun m!381665 () Bool)

(assert (=> b!384717 m!381665))

(declare-fun m!381667 () Bool)

(assert (=> b!384727 m!381667))

(declare-fun m!381669 () Bool)

(assert (=> b!384727 m!381669))

(declare-fun m!381671 () Bool)

(assert (=> b!384727 m!381671))

(declare-fun m!381673 () Bool)

(assert (=> b!384727 m!381673))

(declare-fun m!381675 () Bool)

(assert (=> b!384727 m!381675))

(declare-fun m!381677 () Bool)

(assert (=> b!384727 m!381677))

(declare-fun m!381679 () Bool)

(assert (=> b!384727 m!381679))

(declare-fun m!381681 () Bool)

(assert (=> b!384719 m!381681))

(declare-fun m!381683 () Bool)

(assert (=> b!384718 m!381683))

(declare-fun m!381685 () Bool)

(assert (=> start!37596 m!381685))

(declare-fun m!381687 () Bool)

(assert (=> start!37596 m!381687))

(declare-fun m!381689 () Bool)

(assert (=> start!37596 m!381689))

(declare-fun m!381691 () Bool)

(assert (=> b!384722 m!381691))

(declare-fun m!381693 () Bool)

(assert (=> b!384722 m!381693))

(declare-fun m!381695 () Bool)

(assert (=> b!384716 m!381695))

(declare-fun m!381697 () Bool)

(assert (=> mapNonEmpty!15642 m!381697))

(declare-fun m!381699 () Bool)

(assert (=> b!384720 m!381699))

(declare-fun m!381701 () Bool)

(assert (=> b!384726 m!381701))

(declare-fun m!381703 () Bool)

(assert (=> b!384721 m!381703))

(check-sat (not start!37596) (not b!384716) (not b!384722) (not b!384717) (not b_next!8737) (not mapNonEmpty!15642) (not b!384720) (not b!384719) (not b!384726) (not b!384727) (not b!384721) tp_is_empty!9385 b_and!15993)
(check-sat b_and!15993 (not b_next!8737))
