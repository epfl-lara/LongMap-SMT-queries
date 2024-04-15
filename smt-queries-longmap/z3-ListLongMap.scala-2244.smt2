; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36912 () Bool)

(assert start!36912)

(declare-fun b_free!8053 () Bool)

(declare-fun b_next!8053 () Bool)

(assert (=> start!36912 (= b_free!8053 (not b_next!8053))))

(declare-fun tp!28875 () Bool)

(declare-fun b_and!15269 () Bool)

(assert (=> start!36912 (= tp!28875 b_and!15269)))

(declare-fun b!369802 () Bool)

(declare-fun e!225913 () Bool)

(declare-fun tp_is_empty!8701 () Bool)

(assert (=> b!369802 (= e!225913 tp_is_empty!8701)))

(declare-fun b!369803 () Bool)

(declare-fun e!225912 () Bool)

(assert (=> b!369803 (= e!225912 false)))

(declare-datatypes ((array!21333 0))(
  ( (array!21334 (arr!10135 (Array (_ BitVec 32) (_ BitVec 64))) (size!10488 (_ BitVec 32))) )
))
(declare-fun lt!169648 () array!21333)

(declare-datatypes ((V!12707 0))(
  ( (V!12708 (val!4395 Int)) )
))
(declare-datatypes ((ValueCell!4007 0))(
  ( (ValueCellFull!4007 (v!6586 V!12707)) (EmptyCell!4007) )
))
(declare-datatypes ((array!21335 0))(
  ( (array!21336 (arr!10136 (Array (_ BitVec 32) ValueCell!4007)) (size!10489 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21335)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5798 0))(
  ( (tuple2!5799 (_1!2910 (_ BitVec 64)) (_2!2910 V!12707)) )
))
(declare-datatypes ((List!5629 0))(
  ( (Nil!5626) (Cons!5625 (h!6481 tuple2!5798) (t!10770 List!5629)) )
))
(declare-datatypes ((ListLongMap!4701 0))(
  ( (ListLongMap!4702 (toList!2366 List!5629)) )
))
(declare-fun lt!169649 () ListLongMap!4701)

(declare-fun zeroValue!472 () V!12707)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12707)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12707)

(declare-fun getCurrentListMapNoExtraKeys!657 (array!21333 array!21335 (_ BitVec 32) (_ BitVec 32) V!12707 V!12707 (_ BitVec 32) Int) ListLongMap!4701)

(assert (=> b!369803 (= lt!169649 (getCurrentListMapNoExtraKeys!657 lt!169648 (array!21336 (store (arr!10136 _values!506) i!548 (ValueCellFull!4007 v!373)) (size!10489 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169650 () ListLongMap!4701)

(declare-fun _keys!658 () array!21333)

(assert (=> b!369803 (= lt!169650 (getCurrentListMapNoExtraKeys!657 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369804 () Bool)

(declare-fun res!207614 () Bool)

(assert (=> b!369804 (=> (not res!207614) (not e!225912))))

(declare-datatypes ((List!5630 0))(
  ( (Nil!5627) (Cons!5626 (h!6482 (_ BitVec 64)) (t!10771 List!5630)) )
))
(declare-fun arrayNoDuplicates!0 (array!21333 (_ BitVec 32) List!5630) Bool)

(assert (=> b!369804 (= res!207614 (arrayNoDuplicates!0 lt!169648 #b00000000000000000000000000000000 Nil!5627))))

(declare-fun b!369805 () Bool)

(declare-fun res!207617 () Bool)

(declare-fun e!225914 () Bool)

(assert (=> b!369805 (=> (not res!207617) (not e!225914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21333 (_ BitVec 32)) Bool)

(assert (=> b!369805 (= res!207617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369806 () Bool)

(declare-fun e!225917 () Bool)

(assert (=> b!369806 (= e!225917 tp_is_empty!8701)))

(declare-fun b!369807 () Bool)

(assert (=> b!369807 (= e!225914 e!225912)))

(declare-fun res!207616 () Bool)

(assert (=> b!369807 (=> (not res!207616) (not e!225912))))

(assert (=> b!369807 (= res!207616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169648 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!369807 (= lt!169648 (array!21334 (store (arr!10135 _keys!658) i!548 k0!778) (size!10488 _keys!658)))))

(declare-fun b!369808 () Bool)

(declare-fun res!207611 () Bool)

(assert (=> b!369808 (=> (not res!207611) (not e!225914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369808 (= res!207611 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14616 () Bool)

(declare-fun mapRes!14616 () Bool)

(declare-fun tp!28874 () Bool)

(assert (=> mapNonEmpty!14616 (= mapRes!14616 (and tp!28874 e!225917))))

(declare-fun mapRest!14616 () (Array (_ BitVec 32) ValueCell!4007))

(declare-fun mapKey!14616 () (_ BitVec 32))

(declare-fun mapValue!14616 () ValueCell!4007)

(assert (=> mapNonEmpty!14616 (= (arr!10136 _values!506) (store mapRest!14616 mapKey!14616 mapValue!14616))))

(declare-fun b!369809 () Bool)

(declare-fun res!207613 () Bool)

(assert (=> b!369809 (=> (not res!207613) (not e!225914))))

(assert (=> b!369809 (= res!207613 (or (= (select (arr!10135 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10135 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369811 () Bool)

(declare-fun res!207620 () Bool)

(assert (=> b!369811 (=> (not res!207620) (not e!225914))))

(assert (=> b!369811 (= res!207620 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10488 _keys!658))))))

(declare-fun b!369812 () Bool)

(declare-fun res!207618 () Bool)

(assert (=> b!369812 (=> (not res!207618) (not e!225914))))

(declare-fun arrayContainsKey!0 (array!21333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369812 (= res!207618 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369813 () Bool)

(declare-fun res!207615 () Bool)

(assert (=> b!369813 (=> (not res!207615) (not e!225914))))

(assert (=> b!369813 (= res!207615 (and (= (size!10489 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10488 _keys!658) (size!10489 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!207619 () Bool)

(assert (=> start!36912 (=> (not res!207619) (not e!225914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36912 (= res!207619 (validMask!0 mask!970))))

(assert (=> start!36912 e!225914))

(declare-fun e!225915 () Bool)

(declare-fun array_inv!7498 (array!21335) Bool)

(assert (=> start!36912 (and (array_inv!7498 _values!506) e!225915)))

(assert (=> start!36912 tp!28875))

(assert (=> start!36912 true))

(assert (=> start!36912 tp_is_empty!8701))

(declare-fun array_inv!7499 (array!21333) Bool)

(assert (=> start!36912 (array_inv!7499 _keys!658)))

(declare-fun b!369810 () Bool)

(assert (=> b!369810 (= e!225915 (and e!225913 mapRes!14616))))

(declare-fun condMapEmpty!14616 () Bool)

(declare-fun mapDefault!14616 () ValueCell!4007)

(assert (=> b!369810 (= condMapEmpty!14616 (= (arr!10136 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4007)) mapDefault!14616)))))

(declare-fun b!369814 () Bool)

(declare-fun res!207612 () Bool)

(assert (=> b!369814 (=> (not res!207612) (not e!225914))))

(assert (=> b!369814 (= res!207612 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5627))))

(declare-fun mapIsEmpty!14616 () Bool)

(assert (=> mapIsEmpty!14616 mapRes!14616))

(assert (= (and start!36912 res!207619) b!369813))

(assert (= (and b!369813 res!207615) b!369805))

(assert (= (and b!369805 res!207617) b!369814))

(assert (= (and b!369814 res!207612) b!369811))

(assert (= (and b!369811 res!207620) b!369808))

(assert (= (and b!369808 res!207611) b!369809))

(assert (= (and b!369809 res!207613) b!369812))

(assert (= (and b!369812 res!207618) b!369807))

(assert (= (and b!369807 res!207616) b!369804))

(assert (= (and b!369804 res!207614) b!369803))

(assert (= (and b!369810 condMapEmpty!14616) mapIsEmpty!14616))

(assert (= (and b!369810 (not condMapEmpty!14616)) mapNonEmpty!14616))

(get-info :version)

(assert (= (and mapNonEmpty!14616 ((_ is ValueCellFull!4007) mapValue!14616)) b!369806))

(assert (= (and b!369810 ((_ is ValueCellFull!4007) mapDefault!14616)) b!369802))

(assert (= start!36912 b!369810))

(declare-fun m!365579 () Bool)

(assert (=> b!369808 m!365579))

(declare-fun m!365581 () Bool)

(assert (=> b!369812 m!365581))

(declare-fun m!365583 () Bool)

(assert (=> b!369807 m!365583))

(declare-fun m!365585 () Bool)

(assert (=> b!369807 m!365585))

(declare-fun m!365587 () Bool)

(assert (=> start!36912 m!365587))

(declare-fun m!365589 () Bool)

(assert (=> start!36912 m!365589))

(declare-fun m!365591 () Bool)

(assert (=> start!36912 m!365591))

(declare-fun m!365593 () Bool)

(assert (=> b!369814 m!365593))

(declare-fun m!365595 () Bool)

(assert (=> b!369804 m!365595))

(declare-fun m!365597 () Bool)

(assert (=> mapNonEmpty!14616 m!365597))

(declare-fun m!365599 () Bool)

(assert (=> b!369809 m!365599))

(declare-fun m!365601 () Bool)

(assert (=> b!369805 m!365601))

(declare-fun m!365603 () Bool)

(assert (=> b!369803 m!365603))

(declare-fun m!365605 () Bool)

(assert (=> b!369803 m!365605))

(declare-fun m!365607 () Bool)

(assert (=> b!369803 m!365607))

(check-sat (not start!36912) (not b!369805) (not b!369812) (not b!369807) (not b!369804) (not b!369808) (not b!369814) b_and!15269 tp_is_empty!8701 (not mapNonEmpty!14616) (not b_next!8053) (not b!369803))
(check-sat b_and!15269 (not b_next!8053))
