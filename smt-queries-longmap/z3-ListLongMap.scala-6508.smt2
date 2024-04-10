; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82890 () Bool)

(assert start!82890)

(declare-fun b_free!19017 () Bool)

(declare-fun b_next!19017 () Bool)

(assert (=> start!82890 (= b_free!19017 (not b_next!19017))))

(declare-fun tp!66180 () Bool)

(declare-fun b_and!30505 () Bool)

(assert (=> start!82890 (= tp!66180 b_and!30505)))

(declare-fun b!967119 () Bool)

(declare-fun e!545140 () Bool)

(declare-fun tp_is_empty!21825 () Bool)

(assert (=> b!967119 (= e!545140 tp_is_empty!21825)))

(declare-fun b!967120 () Bool)

(declare-fun e!545141 () Bool)

(declare-fun mapRes!34732 () Bool)

(assert (=> b!967120 (= e!545141 (and e!545140 mapRes!34732))))

(declare-fun condMapEmpty!34732 () Bool)

(declare-datatypes ((V!34083 0))(
  ( (V!34084 (val!10963 Int)) )
))
(declare-datatypes ((ValueCell!10431 0))(
  ( (ValueCellFull!10431 (v!13521 V!34083)) (EmptyCell!10431) )
))
(declare-datatypes ((array!59725 0))(
  ( (array!59726 (arr!28731 (Array (_ BitVec 32) ValueCell!10431)) (size!29210 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59725)

(declare-fun mapDefault!34732 () ValueCell!10431)

(assert (=> b!967120 (= condMapEmpty!34732 (= (arr!28731 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10431)) mapDefault!34732)))))

(declare-fun res!647381 () Bool)

(declare-fun e!545138 () Bool)

(assert (=> start!82890 (=> (not res!647381) (not e!545138))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82890 (= res!647381 (validMask!0 mask!2110))))

(assert (=> start!82890 e!545138))

(assert (=> start!82890 true))

(declare-fun array_inv!22251 (array!59725) Bool)

(assert (=> start!82890 (and (array_inv!22251 _values!1400) e!545141)))

(declare-datatypes ((array!59727 0))(
  ( (array!59728 (arr!28732 (Array (_ BitVec 32) (_ BitVec 64))) (size!29211 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59727)

(declare-fun array_inv!22252 (array!59727) Bool)

(assert (=> start!82890 (array_inv!22252 _keys!1686)))

(assert (=> start!82890 tp!66180))

(assert (=> start!82890 tp_is_empty!21825))

(declare-fun b!967121 () Bool)

(declare-fun res!647380 () Bool)

(assert (=> b!967121 (=> (not res!647380) (not e!545138))))

(declare-datatypes ((List!19946 0))(
  ( (Nil!19943) (Cons!19942 (h!21104 (_ BitVec 64)) (t!28309 List!19946)) )
))
(declare-fun arrayNoDuplicates!0 (array!59727 (_ BitVec 32) List!19946) Bool)

(assert (=> b!967121 (= res!647380 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19943))))

(declare-fun b!967122 () Bool)

(declare-fun res!647382 () Bool)

(assert (=> b!967122 (=> (not res!647382) (not e!545138))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967122 (= res!647382 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29211 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29211 _keys!1686))))))

(declare-fun b!967123 () Bool)

(declare-fun res!647385 () Bool)

(assert (=> b!967123 (=> (not res!647385) (not e!545138))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967123 (= res!647385 (and (= (size!29210 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29211 _keys!1686) (size!29210 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967124 () Bool)

(declare-fun e!545137 () Bool)

(assert (=> b!967124 (= e!545137 tp_is_empty!21825)))

(declare-fun b!967125 () Bool)

(declare-fun res!647386 () Bool)

(assert (=> b!967125 (=> (not res!647386) (not e!545138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967125 (= res!647386 (validKeyInArray!0 (select (arr!28732 _keys!1686) i!803)))))

(declare-fun b!967126 () Bool)

(assert (=> b!967126 (= e!545138 (not true))))

(declare-fun minValue!1342 () V!34083)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34083)

(declare-datatypes ((tuple2!14098 0))(
  ( (tuple2!14099 (_1!7060 (_ BitVec 64)) (_2!7060 V!34083)) )
))
(declare-datatypes ((List!19947 0))(
  ( (Nil!19944) (Cons!19943 (h!21105 tuple2!14098) (t!28310 List!19947)) )
))
(declare-datatypes ((ListLongMap!12795 0))(
  ( (ListLongMap!12796 (toList!6413 List!19947)) )
))
(declare-fun contains!5514 (ListLongMap!12795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3646 (array!59727 array!59725 (_ BitVec 32) (_ BitVec 32) V!34083 V!34083 (_ BitVec 32) Int) ListLongMap!12795)

(assert (=> b!967126 (contains!5514 (getCurrentListMap!3646 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28732 _keys!1686) i!803))))

(declare-datatypes ((Unit!32311 0))(
  ( (Unit!32312) )
))
(declare-fun lt!431392 () Unit!32311)

(declare-fun lemmaInListMapFromThenInFromMinusOne!50 (array!59727 array!59725 (_ BitVec 32) (_ BitVec 32) V!34083 V!34083 (_ BitVec 32) (_ BitVec 32) Int) Unit!32311)

(assert (=> b!967126 (= lt!431392 (lemmaInListMapFromThenInFromMinusOne!50 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34732 () Bool)

(assert (=> mapIsEmpty!34732 mapRes!34732))

(declare-fun b!967127 () Bool)

(declare-fun res!647379 () Bool)

(assert (=> b!967127 (=> (not res!647379) (not e!545138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59727 (_ BitVec 32)) Bool)

(assert (=> b!967127 (= res!647379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34732 () Bool)

(declare-fun tp!66179 () Bool)

(assert (=> mapNonEmpty!34732 (= mapRes!34732 (and tp!66179 e!545137))))

(declare-fun mapKey!34732 () (_ BitVec 32))

(declare-fun mapValue!34732 () ValueCell!10431)

(declare-fun mapRest!34732 () (Array (_ BitVec 32) ValueCell!10431))

(assert (=> mapNonEmpty!34732 (= (arr!28731 _values!1400) (store mapRest!34732 mapKey!34732 mapValue!34732))))

(declare-fun b!967128 () Bool)

(declare-fun res!647383 () Bool)

(assert (=> b!967128 (=> (not res!647383) (not e!545138))))

(assert (=> b!967128 (= res!647383 (contains!5514 (getCurrentListMap!3646 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28732 _keys!1686) i!803)))))

(declare-fun b!967129 () Bool)

(declare-fun res!647384 () Bool)

(assert (=> b!967129 (=> (not res!647384) (not e!545138))))

(assert (=> b!967129 (= res!647384 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!82890 res!647381) b!967123))

(assert (= (and b!967123 res!647385) b!967127))

(assert (= (and b!967127 res!647379) b!967121))

(assert (= (and b!967121 res!647380) b!967122))

(assert (= (and b!967122 res!647382) b!967125))

(assert (= (and b!967125 res!647386) b!967128))

(assert (= (and b!967128 res!647383) b!967129))

(assert (= (and b!967129 res!647384) b!967126))

(assert (= (and b!967120 condMapEmpty!34732) mapIsEmpty!34732))

(assert (= (and b!967120 (not condMapEmpty!34732)) mapNonEmpty!34732))

(get-info :version)

(assert (= (and mapNonEmpty!34732 ((_ is ValueCellFull!10431) mapValue!34732)) b!967124))

(assert (= (and b!967120 ((_ is ValueCellFull!10431) mapDefault!34732)) b!967119))

(assert (= start!82890 b!967120))

(declare-fun m!895739 () Bool)

(assert (=> b!967125 m!895739))

(assert (=> b!967125 m!895739))

(declare-fun m!895741 () Bool)

(assert (=> b!967125 m!895741))

(declare-fun m!895743 () Bool)

(assert (=> b!967128 m!895743))

(assert (=> b!967128 m!895739))

(assert (=> b!967128 m!895743))

(assert (=> b!967128 m!895739))

(declare-fun m!895745 () Bool)

(assert (=> b!967128 m!895745))

(declare-fun m!895747 () Bool)

(assert (=> mapNonEmpty!34732 m!895747))

(declare-fun m!895749 () Bool)

(assert (=> b!967121 m!895749))

(declare-fun m!895751 () Bool)

(assert (=> start!82890 m!895751))

(declare-fun m!895753 () Bool)

(assert (=> start!82890 m!895753))

(declare-fun m!895755 () Bool)

(assert (=> start!82890 m!895755))

(declare-fun m!895757 () Bool)

(assert (=> b!967126 m!895757))

(assert (=> b!967126 m!895739))

(assert (=> b!967126 m!895757))

(assert (=> b!967126 m!895739))

(declare-fun m!895759 () Bool)

(assert (=> b!967126 m!895759))

(declare-fun m!895761 () Bool)

(assert (=> b!967126 m!895761))

(declare-fun m!895763 () Bool)

(assert (=> b!967127 m!895763))

(check-sat b_and!30505 (not b!967126) (not b!967128) (not b!967127) (not mapNonEmpty!34732) (not b_next!19017) (not b!967125) (not b!967121) tp_is_empty!21825 (not start!82890))
(check-sat b_and!30505 (not b_next!19017))
