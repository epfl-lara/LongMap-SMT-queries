; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83110 () Bool)

(assert start!83110)

(declare-fun b_free!19069 () Bool)

(declare-fun b_next!19069 () Bool)

(assert (=> start!83110 (= b_free!19069 (not b_next!19069))))

(declare-fun tp!66336 () Bool)

(declare-fun b_and!30567 () Bool)

(assert (=> start!83110 (= tp!66336 b_and!30567)))

(declare-fun b!968880 () Bool)

(declare-fun res!648353 () Bool)

(declare-fun e!546110 () Bool)

(assert (=> b!968880 (=> (not res!648353) (not e!546110))))

(declare-datatypes ((array!59844 0))(
  ( (array!59845 (arr!28786 (Array (_ BitVec 32) (_ BitVec 64))) (size!29266 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59844)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59844 (_ BitVec 32)) Bool)

(assert (=> b!968880 (= res!648353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968881 () Bool)

(declare-fun res!648347 () Bool)

(assert (=> b!968881 (=> (not res!648347) (not e!546110))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968881 (= res!648347 (validKeyInArray!0 (select (arr!28786 _keys!1686) i!803)))))

(declare-fun b!968882 () Bool)

(declare-fun e!546109 () Bool)

(declare-fun tp_is_empty!21877 () Bool)

(assert (=> b!968882 (= e!546109 tp_is_empty!21877)))

(declare-fun mapNonEmpty!34810 () Bool)

(declare-fun mapRes!34810 () Bool)

(declare-fun tp!66337 () Bool)

(assert (=> mapNonEmpty!34810 (= mapRes!34810 (and tp!66337 e!546109))))

(declare-datatypes ((V!34153 0))(
  ( (V!34154 (val!10989 Int)) )
))
(declare-datatypes ((ValueCell!10457 0))(
  ( (ValueCellFull!10457 (v!13544 V!34153)) (EmptyCell!10457) )
))
(declare-fun mapValue!34810 () ValueCell!10457)

(declare-datatypes ((array!59846 0))(
  ( (array!59847 (arr!28787 (Array (_ BitVec 32) ValueCell!10457)) (size!29267 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59846)

(declare-fun mapRest!34810 () (Array (_ BitVec 32) ValueCell!10457))

(declare-fun mapKey!34810 () (_ BitVec 32))

(assert (=> mapNonEmpty!34810 (= (arr!28787 _values!1400) (store mapRest!34810 mapKey!34810 mapValue!34810))))

(declare-fun b!968883 () Bool)

(declare-fun res!648348 () Bool)

(assert (=> b!968883 (=> (not res!648348) (not e!546110))))

(declare-datatypes ((List!19973 0))(
  ( (Nil!19970) (Cons!19969 (h!21137 (_ BitVec 64)) (t!28328 List!19973)) )
))
(declare-fun arrayNoDuplicates!0 (array!59844 (_ BitVec 32) List!19973) Bool)

(assert (=> b!968883 (= res!648348 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19970))))

(declare-fun b!968884 () Bool)

(declare-fun e!546113 () Bool)

(declare-fun e!546111 () Bool)

(assert (=> b!968884 (= e!546113 (and e!546111 mapRes!34810))))

(declare-fun condMapEmpty!34810 () Bool)

(declare-fun mapDefault!34810 () ValueCell!10457)

(assert (=> b!968884 (= condMapEmpty!34810 (= (arr!28787 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10457)) mapDefault!34810)))))

(declare-fun res!648351 () Bool)

(assert (=> start!83110 (=> (not res!648351) (not e!546110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83110 (= res!648351 (validMask!0 mask!2110))))

(assert (=> start!83110 e!546110))

(assert (=> start!83110 true))

(declare-fun array_inv!22345 (array!59846) Bool)

(assert (=> start!83110 (and (array_inv!22345 _values!1400) e!546113)))

(declare-fun array_inv!22346 (array!59844) Bool)

(assert (=> start!83110 (array_inv!22346 _keys!1686)))

(assert (=> start!83110 tp!66336))

(assert (=> start!83110 tp_is_empty!21877))

(declare-fun b!968885 () Bool)

(assert (=> b!968885 (= e!546111 tp_is_empty!21877)))

(declare-fun mapIsEmpty!34810 () Bool)

(assert (=> mapIsEmpty!34810 mapRes!34810))

(declare-fun b!968886 () Bool)

(declare-fun res!648352 () Bool)

(assert (=> b!968886 (=> (not res!648352) (not e!546110))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968886 (= res!648352 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29266 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29266 _keys!1686))))))

(declare-fun b!968887 () Bool)

(declare-fun res!648350 () Bool)

(assert (=> b!968887 (=> (not res!648350) (not e!546110))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!968887 (= res!648350 (and (= (size!29267 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29266 _keys!1686) (size!29267 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968888 () Bool)

(declare-fun res!648354 () Bool)

(assert (=> b!968888 (=> (not res!648354) (not e!546110))))

(assert (=> b!968888 (= res!648354 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968889 () Bool)

(assert (=> b!968889 (= e!546110 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29266 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001)) (bvslt (bvsub (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159) (bvsub from!2084 newFrom!159)))))))

(declare-fun minValue!1342 () V!34153)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34153)

(declare-datatypes ((tuple2!14128 0))(
  ( (tuple2!14129 (_1!7075 (_ BitVec 64)) (_2!7075 V!34153)) )
))
(declare-datatypes ((List!19974 0))(
  ( (Nil!19971) (Cons!19970 (h!21138 tuple2!14128) (t!28329 List!19974)) )
))
(declare-datatypes ((ListLongMap!12827 0))(
  ( (ListLongMap!12828 (toList!6429 List!19974)) )
))
(declare-fun contains!5541 (ListLongMap!12827 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3662 (array!59844 array!59846 (_ BitVec 32) (_ BitVec 32) V!34153 V!34153 (_ BitVec 32) Int) ListLongMap!12827)

(assert (=> b!968889 (contains!5541 (getCurrentListMap!3662 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28786 _keys!1686) i!803))))

(declare-datatypes ((Unit!32312 0))(
  ( (Unit!32313) )
))
(declare-fun lt!431831 () Unit!32312)

(declare-fun lemmaInListMapFromThenInFromMinusOne!67 (array!59844 array!59846 (_ BitVec 32) (_ BitVec 32) V!34153 V!34153 (_ BitVec 32) (_ BitVec 32) Int) Unit!32312)

(assert (=> b!968889 (= lt!431831 (lemmaInListMapFromThenInFromMinusOne!67 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968890 () Bool)

(declare-fun res!648349 () Bool)

(assert (=> b!968890 (=> (not res!648349) (not e!546110))))

(assert (=> b!968890 (= res!648349 (contains!5541 (getCurrentListMap!3662 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28786 _keys!1686) i!803)))))

(assert (= (and start!83110 res!648351) b!968887))

(assert (= (and b!968887 res!648350) b!968880))

(assert (= (and b!968880 res!648353) b!968883))

(assert (= (and b!968883 res!648348) b!968886))

(assert (= (and b!968886 res!648352) b!968881))

(assert (= (and b!968881 res!648347) b!968890))

(assert (= (and b!968890 res!648349) b!968888))

(assert (= (and b!968888 res!648354) b!968889))

(assert (= (and b!968884 condMapEmpty!34810) mapIsEmpty!34810))

(assert (= (and b!968884 (not condMapEmpty!34810)) mapNonEmpty!34810))

(get-info :version)

(assert (= (and mapNonEmpty!34810 ((_ is ValueCellFull!10457) mapValue!34810)) b!968882))

(assert (= (and b!968884 ((_ is ValueCellFull!10457) mapDefault!34810)) b!968885))

(assert (= start!83110 b!968884))

(declare-fun m!897709 () Bool)

(assert (=> b!968890 m!897709))

(declare-fun m!897711 () Bool)

(assert (=> b!968890 m!897711))

(assert (=> b!968890 m!897709))

(assert (=> b!968890 m!897711))

(declare-fun m!897713 () Bool)

(assert (=> b!968890 m!897713))

(declare-fun m!897715 () Bool)

(assert (=> start!83110 m!897715))

(declare-fun m!897717 () Bool)

(assert (=> start!83110 m!897717))

(declare-fun m!897719 () Bool)

(assert (=> start!83110 m!897719))

(declare-fun m!897721 () Bool)

(assert (=> b!968880 m!897721))

(declare-fun m!897723 () Bool)

(assert (=> b!968889 m!897723))

(assert (=> b!968889 m!897711))

(assert (=> b!968889 m!897723))

(assert (=> b!968889 m!897711))

(declare-fun m!897725 () Bool)

(assert (=> b!968889 m!897725))

(declare-fun m!897727 () Bool)

(assert (=> b!968889 m!897727))

(declare-fun m!897729 () Bool)

(assert (=> mapNonEmpty!34810 m!897729))

(declare-fun m!897731 () Bool)

(assert (=> b!968883 m!897731))

(assert (=> b!968881 m!897711))

(assert (=> b!968881 m!897711))

(declare-fun m!897733 () Bool)

(assert (=> b!968881 m!897733))

(check-sat (not start!83110) (not b!968889) (not b_next!19069) (not b!968880) (not b!968881) (not b!968890) b_and!30567 (not b!968883) (not mapNonEmpty!34810) tp_is_empty!21877)
(check-sat b_and!30567 (not b_next!19069))
