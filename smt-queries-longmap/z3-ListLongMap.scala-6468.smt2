; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82650 () Bool)

(assert start!82650)

(declare-fun b_free!18783 () Bool)

(declare-fun b_next!18783 () Bool)

(assert (=> start!82650 (= b_free!18783 (not b_next!18783))))

(declare-fun tp!65468 () Bool)

(declare-fun b_and!30271 () Bool)

(assert (=> start!82650 (= tp!65468 b_and!30271)))

(declare-fun b!963492 () Bool)

(declare-fun e!543256 () Bool)

(declare-fun tp_is_empty!21585 () Bool)

(assert (=> b!963492 (= e!543256 tp_is_empty!21585)))

(declare-fun b!963493 () Bool)

(declare-fun res!644837 () Bool)

(declare-fun e!543257 () Bool)

(assert (=> b!963493 (=> (not res!644837) (not e!543257))))

(declare-datatypes ((array!59263 0))(
  ( (array!59264 (arr!28500 (Array (_ BitVec 32) (_ BitVec 64))) (size!28979 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59263)

(declare-datatypes ((List!19780 0))(
  ( (Nil!19777) (Cons!19776 (h!20938 (_ BitVec 64)) (t!28143 List!19780)) )
))
(declare-fun arrayNoDuplicates!0 (array!59263 (_ BitVec 32) List!19780) Bool)

(assert (=> b!963493 (= res!644837 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19777))))

(declare-fun mapNonEmpty!34372 () Bool)

(declare-fun mapRes!34372 () Bool)

(declare-fun tp!65469 () Bool)

(assert (=> mapNonEmpty!34372 (= mapRes!34372 (and tp!65469 e!543256))))

(declare-datatypes ((V!33763 0))(
  ( (V!33764 (val!10843 Int)) )
))
(declare-datatypes ((ValueCell!10311 0))(
  ( (ValueCellFull!10311 (v!13401 V!33763)) (EmptyCell!10311) )
))
(declare-fun mapRest!34372 () (Array (_ BitVec 32) ValueCell!10311))

(declare-datatypes ((array!59265 0))(
  ( (array!59266 (arr!28501 (Array (_ BitVec 32) ValueCell!10311)) (size!28980 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59265)

(declare-fun mapValue!34372 () ValueCell!10311)

(declare-fun mapKey!34372 () (_ BitVec 32))

(assert (=> mapNonEmpty!34372 (= (arr!28501 _values!1400) (store mapRest!34372 mapKey!34372 mapValue!34372))))

(declare-fun b!963494 () Bool)

(declare-fun res!644835 () Bool)

(assert (=> b!963494 (=> (not res!644835) (not e!543257))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963494 (= res!644835 (and (= (size!28980 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28979 _keys!1686) (size!28980 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963495 () Bool)

(declare-fun e!543259 () Bool)

(assert (=> b!963495 (= e!543259 tp_is_empty!21585)))

(declare-fun b!963496 () Bool)

(declare-fun e!543260 () Bool)

(assert (=> b!963496 (= e!543260 (and e!543259 mapRes!34372))))

(declare-fun condMapEmpty!34372 () Bool)

(declare-fun mapDefault!34372 () ValueCell!10311)

(assert (=> b!963496 (= condMapEmpty!34372 (= (arr!28501 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10311)) mapDefault!34372)))))

(declare-fun b!963497 () Bool)

(declare-fun res!644839 () Bool)

(assert (=> b!963497 (=> (not res!644839) (not e!543257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59263 (_ BitVec 32)) Bool)

(assert (=> b!963497 (= res!644839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963498 () Bool)

(assert (=> b!963498 (= e!543257 (not true))))

(declare-fun minValue!1342 () V!33763)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33763)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13930 0))(
  ( (tuple2!13931 (_1!6976 (_ BitVec 64)) (_2!6976 V!33763)) )
))
(declare-datatypes ((List!19781 0))(
  ( (Nil!19778) (Cons!19777 (h!20939 tuple2!13930) (t!28144 List!19781)) )
))
(declare-datatypes ((ListLongMap!12627 0))(
  ( (ListLongMap!12628 (toList!6329 List!19781)) )
))
(declare-fun contains!5432 (ListLongMap!12627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3562 (array!59263 array!59265 (_ BitVec 32) (_ BitVec 32) V!33763 V!33763 (_ BitVec 32) Int) ListLongMap!12627)

(assert (=> b!963498 (contains!5432 (getCurrentListMap!3562 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28500 _keys!1686) i!803))))

(declare-datatypes ((Unit!32241 0))(
  ( (Unit!32242) )
))
(declare-fun lt!430978 () Unit!32241)

(declare-fun lemmaInListMapFromThenInFromMinusOne!15 (array!59263 array!59265 (_ BitVec 32) (_ BitVec 32) V!33763 V!33763 (_ BitVec 32) (_ BitVec 32) Int) Unit!32241)

(assert (=> b!963498 (= lt!430978 (lemmaInListMapFromThenInFromMinusOne!15 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!644832 () Bool)

(assert (=> start!82650 (=> (not res!644832) (not e!543257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82650 (= res!644832 (validMask!0 mask!2110))))

(assert (=> start!82650 e!543257))

(assert (=> start!82650 true))

(declare-fun array_inv!22081 (array!59265) Bool)

(assert (=> start!82650 (and (array_inv!22081 _values!1400) e!543260)))

(declare-fun array_inv!22082 (array!59263) Bool)

(assert (=> start!82650 (array_inv!22082 _keys!1686)))

(assert (=> start!82650 tp!65468))

(assert (=> start!82650 tp_is_empty!21585))

(declare-fun b!963499 () Bool)

(declare-fun res!644834 () Bool)

(assert (=> b!963499 (=> (not res!644834) (not e!543257))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963499 (= res!644834 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963500 () Bool)

(declare-fun res!644838 () Bool)

(assert (=> b!963500 (=> (not res!644838) (not e!543257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963500 (= res!644838 (validKeyInArray!0 (select (arr!28500 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34372 () Bool)

(assert (=> mapIsEmpty!34372 mapRes!34372))

(declare-fun b!963501 () Bool)

(declare-fun res!644836 () Bool)

(assert (=> b!963501 (=> (not res!644836) (not e!543257))))

(assert (=> b!963501 (= res!644836 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28979 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28979 _keys!1686))))))

(declare-fun b!963502 () Bool)

(declare-fun res!644833 () Bool)

(assert (=> b!963502 (=> (not res!644833) (not e!543257))))

(assert (=> b!963502 (= res!644833 (contains!5432 (getCurrentListMap!3562 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28500 _keys!1686) i!803)))))

(assert (= (and start!82650 res!644832) b!963494))

(assert (= (and b!963494 res!644835) b!963497))

(assert (= (and b!963497 res!644839) b!963493))

(assert (= (and b!963493 res!644837) b!963501))

(assert (= (and b!963501 res!644836) b!963500))

(assert (= (and b!963500 res!644838) b!963502))

(assert (= (and b!963502 res!644833) b!963499))

(assert (= (and b!963499 res!644834) b!963498))

(assert (= (and b!963496 condMapEmpty!34372) mapIsEmpty!34372))

(assert (= (and b!963496 (not condMapEmpty!34372)) mapNonEmpty!34372))

(get-info :version)

(assert (= (and mapNonEmpty!34372 ((_ is ValueCellFull!10311) mapValue!34372)) b!963492))

(assert (= (and b!963496 ((_ is ValueCellFull!10311) mapDefault!34372)) b!963495))

(assert (= start!82650 b!963496))

(declare-fun m!892901 () Bool)

(assert (=> b!963500 m!892901))

(assert (=> b!963500 m!892901))

(declare-fun m!892903 () Bool)

(assert (=> b!963500 m!892903))

(declare-fun m!892905 () Bool)

(assert (=> b!963497 m!892905))

(declare-fun m!892907 () Bool)

(assert (=> b!963493 m!892907))

(declare-fun m!892909 () Bool)

(assert (=> start!82650 m!892909))

(declare-fun m!892911 () Bool)

(assert (=> start!82650 m!892911))

(declare-fun m!892913 () Bool)

(assert (=> start!82650 m!892913))

(declare-fun m!892915 () Bool)

(assert (=> b!963502 m!892915))

(assert (=> b!963502 m!892901))

(assert (=> b!963502 m!892915))

(assert (=> b!963502 m!892901))

(declare-fun m!892917 () Bool)

(assert (=> b!963502 m!892917))

(declare-fun m!892919 () Bool)

(assert (=> b!963498 m!892919))

(assert (=> b!963498 m!892901))

(assert (=> b!963498 m!892919))

(assert (=> b!963498 m!892901))

(declare-fun m!892921 () Bool)

(assert (=> b!963498 m!892921))

(declare-fun m!892923 () Bool)

(assert (=> b!963498 m!892923))

(declare-fun m!892925 () Bool)

(assert (=> mapNonEmpty!34372 m!892925))

(check-sat (not b!963493) (not start!82650) (not b!963498) (not b_next!18783) b_and!30271 (not b!963500) (not b!963497) tp_is_empty!21585 (not mapNonEmpty!34372) (not b!963502))
(check-sat b_and!30271 (not b_next!18783))
