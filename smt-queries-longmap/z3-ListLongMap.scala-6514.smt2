; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83092 () Bool)

(assert start!83092)

(declare-fun b_free!19051 () Bool)

(declare-fun b_next!19051 () Bool)

(assert (=> start!83092 (= b_free!19051 (not b_next!19051))))

(declare-fun tp!66282 () Bool)

(declare-fun b_and!30549 () Bool)

(assert (=> start!83092 (= tp!66282 b_and!30549)))

(declare-fun b!968583 () Bool)

(declare-fun e!545975 () Bool)

(declare-fun e!545974 () Bool)

(declare-fun mapRes!34783 () Bool)

(assert (=> b!968583 (= e!545975 (and e!545974 mapRes!34783))))

(declare-fun condMapEmpty!34783 () Bool)

(declare-datatypes ((V!34129 0))(
  ( (V!34130 (val!10980 Int)) )
))
(declare-datatypes ((ValueCell!10448 0))(
  ( (ValueCellFull!10448 (v!13535 V!34129)) (EmptyCell!10448) )
))
(declare-datatypes ((array!59812 0))(
  ( (array!59813 (arr!28770 (Array (_ BitVec 32) ValueCell!10448)) (size!29250 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59812)

(declare-fun mapDefault!34783 () ValueCell!10448)

(assert (=> b!968583 (= condMapEmpty!34783 (= (arr!28770 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10448)) mapDefault!34783)))))

(declare-fun b!968584 () Bool)

(declare-fun res!648138 () Bool)

(declare-fun e!545976 () Bool)

(assert (=> b!968584 (=> (not res!648138) (not e!545976))))

(declare-datatypes ((array!59814 0))(
  ( (array!59815 (arr!28771 (Array (_ BitVec 32) (_ BitVec 64))) (size!29251 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59814)

(declare-datatypes ((List!19962 0))(
  ( (Nil!19959) (Cons!19958 (h!21126 (_ BitVec 64)) (t!28317 List!19962)) )
))
(declare-fun arrayNoDuplicates!0 (array!59814 (_ BitVec 32) List!19962) Bool)

(assert (=> b!968584 (= res!648138 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19959))))

(declare-fun b!968585 () Bool)

(declare-fun res!648135 () Bool)

(assert (=> b!968585 (=> (not res!648135) (not e!545976))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34129)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34129)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14116 0))(
  ( (tuple2!14117 (_1!7069 (_ BitVec 64)) (_2!7069 V!34129)) )
))
(declare-datatypes ((List!19963 0))(
  ( (Nil!19960) (Cons!19959 (h!21127 tuple2!14116) (t!28318 List!19963)) )
))
(declare-datatypes ((ListLongMap!12815 0))(
  ( (ListLongMap!12816 (toList!6423 List!19963)) )
))
(declare-fun contains!5535 (ListLongMap!12815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3656 (array!59814 array!59812 (_ BitVec 32) (_ BitVec 32) V!34129 V!34129 (_ BitVec 32) Int) ListLongMap!12815)

(assert (=> b!968585 (= res!648135 (contains!5535 (getCurrentListMap!3656 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28771 _keys!1686) i!803)))))

(declare-fun b!968586 () Bool)

(declare-fun res!648133 () Bool)

(assert (=> b!968586 (=> (not res!648133) (not e!545976))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968586 (= res!648133 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968587 () Bool)

(declare-fun res!648136 () Bool)

(assert (=> b!968587 (=> (not res!648136) (not e!545976))))

(assert (=> b!968587 (= res!648136 (and (= (size!29250 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29251 _keys!1686) (size!29250 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34783 () Bool)

(assert (=> mapIsEmpty!34783 mapRes!34783))

(declare-fun res!648132 () Bool)

(assert (=> start!83092 (=> (not res!648132) (not e!545976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83092 (= res!648132 (validMask!0 mask!2110))))

(assert (=> start!83092 e!545976))

(assert (=> start!83092 true))

(declare-fun array_inv!22335 (array!59812) Bool)

(assert (=> start!83092 (and (array_inv!22335 _values!1400) e!545975)))

(declare-fun array_inv!22336 (array!59814) Bool)

(assert (=> start!83092 (array_inv!22336 _keys!1686)))

(assert (=> start!83092 tp!66282))

(declare-fun tp_is_empty!21859 () Bool)

(assert (=> start!83092 tp_is_empty!21859))

(declare-fun mapNonEmpty!34783 () Bool)

(declare-fun tp!66283 () Bool)

(declare-fun e!545978 () Bool)

(assert (=> mapNonEmpty!34783 (= mapRes!34783 (and tp!66283 e!545978))))

(declare-fun mapKey!34783 () (_ BitVec 32))

(declare-fun mapValue!34783 () ValueCell!10448)

(declare-fun mapRest!34783 () (Array (_ BitVec 32) ValueCell!10448))

(assert (=> mapNonEmpty!34783 (= (arr!28770 _values!1400) (store mapRest!34783 mapKey!34783 mapValue!34783))))

(declare-fun b!968588 () Bool)

(declare-fun res!648137 () Bool)

(assert (=> b!968588 (=> (not res!648137) (not e!545976))))

(assert (=> b!968588 (= res!648137 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29251 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29251 _keys!1686))))))

(declare-fun b!968589 () Bool)

(declare-fun res!648131 () Bool)

(assert (=> b!968589 (=> (not res!648131) (not e!545976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59814 (_ BitVec 32)) Bool)

(assert (=> b!968589 (= res!648131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968590 () Bool)

(assert (=> b!968590 (= e!545974 tp_is_empty!21859)))

(declare-fun b!968591 () Bool)

(assert (=> b!968591 (= e!545978 tp_is_empty!21859)))

(declare-fun b!968592 () Bool)

(declare-fun res!648134 () Bool)

(assert (=> b!968592 (=> (not res!648134) (not e!545976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968592 (= res!648134 (validKeyInArray!0 (select (arr!28771 _keys!1686) i!803)))))

(declare-fun b!968593 () Bool)

(assert (=> b!968593 (= e!545976 (not true))))

(assert (=> b!968593 (contains!5535 (getCurrentListMap!3656 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28771 _keys!1686) i!803))))

(declare-datatypes ((Unit!32300 0))(
  ( (Unit!32301) )
))
(declare-fun lt!431804 () Unit!32300)

(declare-fun lemmaInListMapFromThenInFromMinusOne!61 (array!59814 array!59812 (_ BitVec 32) (_ BitVec 32) V!34129 V!34129 (_ BitVec 32) (_ BitVec 32) Int) Unit!32300)

(assert (=> b!968593 (= lt!431804 (lemmaInListMapFromThenInFromMinusOne!61 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(assert (= (and start!83092 res!648132) b!968587))

(assert (= (and b!968587 res!648136) b!968589))

(assert (= (and b!968589 res!648131) b!968584))

(assert (= (and b!968584 res!648138) b!968588))

(assert (= (and b!968588 res!648137) b!968592))

(assert (= (and b!968592 res!648134) b!968585))

(assert (= (and b!968585 res!648135) b!968586))

(assert (= (and b!968586 res!648133) b!968593))

(assert (= (and b!968583 condMapEmpty!34783) mapIsEmpty!34783))

(assert (= (and b!968583 (not condMapEmpty!34783)) mapNonEmpty!34783))

(get-info :version)

(assert (= (and mapNonEmpty!34783 ((_ is ValueCellFull!10448) mapValue!34783)) b!968591))

(assert (= (and b!968583 ((_ is ValueCellFull!10448) mapDefault!34783)) b!968590))

(assert (= start!83092 b!968583))

(declare-fun m!897475 () Bool)

(assert (=> start!83092 m!897475))

(declare-fun m!897477 () Bool)

(assert (=> start!83092 m!897477))

(declare-fun m!897479 () Bool)

(assert (=> start!83092 m!897479))

(declare-fun m!897481 () Bool)

(assert (=> b!968592 m!897481))

(assert (=> b!968592 m!897481))

(declare-fun m!897483 () Bool)

(assert (=> b!968592 m!897483))

(declare-fun m!897485 () Bool)

(assert (=> b!968585 m!897485))

(assert (=> b!968585 m!897481))

(assert (=> b!968585 m!897485))

(assert (=> b!968585 m!897481))

(declare-fun m!897487 () Bool)

(assert (=> b!968585 m!897487))

(declare-fun m!897489 () Bool)

(assert (=> b!968593 m!897489))

(assert (=> b!968593 m!897481))

(assert (=> b!968593 m!897489))

(assert (=> b!968593 m!897481))

(declare-fun m!897491 () Bool)

(assert (=> b!968593 m!897491))

(declare-fun m!897493 () Bool)

(assert (=> b!968593 m!897493))

(declare-fun m!897495 () Bool)

(assert (=> b!968584 m!897495))

(declare-fun m!897497 () Bool)

(assert (=> mapNonEmpty!34783 m!897497))

(declare-fun m!897499 () Bool)

(assert (=> b!968589 m!897499))

(check-sat (not b!968585) (not b!968589) (not start!83092) (not b!968592) (not b_next!19051) (not b!968584) (not mapNonEmpty!34783) b_and!30549 (not b!968593) tp_is_empty!21859)
(check-sat b_and!30549 (not b_next!19051))
