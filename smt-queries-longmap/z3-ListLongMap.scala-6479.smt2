; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82716 () Bool)

(assert start!82716)

(declare-fun b_free!18849 () Bool)

(declare-fun b_next!18849 () Bool)

(assert (=> start!82716 (= b_free!18849 (not b_next!18849))))

(declare-fun tp!65667 () Bool)

(declare-fun b_and!30337 () Bool)

(assert (=> start!82716 (= tp!65667 b_and!30337)))

(declare-fun b!964640 () Bool)

(declare-fun res!645687 () Bool)

(declare-fun e!543812 () Bool)

(assert (=> b!964640 (=> (not res!645687) (not e!543812))))

(declare-datatypes ((array!59389 0))(
  ( (array!59390 (arr!28563 (Array (_ BitVec 32) (_ BitVec 64))) (size!29042 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59389)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59389 (_ BitVec 32)) Bool)

(assert (=> b!964640 (= res!645687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964641 () Bool)

(declare-fun res!645686 () Bool)

(assert (=> b!964641 (=> (not res!645686) (not e!543812))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964641 (= res!645686 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964642 () Bool)

(declare-fun res!645691 () Bool)

(assert (=> b!964642 (=> (not res!645691) (not e!543812))))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964642 (= res!645691 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29042 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29042 _keys!1686))))))

(declare-fun mapNonEmpty!34471 () Bool)

(declare-fun mapRes!34471 () Bool)

(declare-fun tp!65666 () Bool)

(declare-fun e!543814 () Bool)

(assert (=> mapNonEmpty!34471 (= mapRes!34471 (and tp!65666 e!543814))))

(declare-datatypes ((V!33851 0))(
  ( (V!33852 (val!10876 Int)) )
))
(declare-datatypes ((ValueCell!10344 0))(
  ( (ValueCellFull!10344 (v!13434 V!33851)) (EmptyCell!10344) )
))
(declare-fun mapValue!34471 () ValueCell!10344)

(declare-fun mapRest!34471 () (Array (_ BitVec 32) ValueCell!10344))

(declare-datatypes ((array!59391 0))(
  ( (array!59392 (arr!28564 (Array (_ BitVec 32) ValueCell!10344)) (size!29043 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59391)

(declare-fun mapKey!34471 () (_ BitVec 32))

(assert (=> mapNonEmpty!34471 (= (arr!28564 _values!1400) (store mapRest!34471 mapKey!34471 mapValue!34471))))

(declare-fun res!645685 () Bool)

(assert (=> start!82716 (=> (not res!645685) (not e!543812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82716 (= res!645685 (validMask!0 mask!2110))))

(assert (=> start!82716 e!543812))

(assert (=> start!82716 true))

(declare-fun e!543811 () Bool)

(declare-fun array_inv!22117 (array!59391) Bool)

(assert (=> start!82716 (and (array_inv!22117 _values!1400) e!543811)))

(declare-fun array_inv!22118 (array!59389) Bool)

(assert (=> start!82716 (array_inv!22118 _keys!1686)))

(assert (=> start!82716 tp!65667))

(declare-fun tp_is_empty!21651 () Bool)

(assert (=> start!82716 tp_is_empty!21651))

(declare-fun b!964643 () Bool)

(declare-fun e!543810 () Bool)

(assert (=> b!964643 (= e!543811 (and e!543810 mapRes!34471))))

(declare-fun condMapEmpty!34471 () Bool)

(declare-fun mapDefault!34471 () ValueCell!10344)

(assert (=> b!964643 (= condMapEmpty!34471 (= (arr!28564 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10344)) mapDefault!34471)))))

(declare-fun b!964644 () Bool)

(declare-fun e!543815 () Bool)

(assert (=> b!964644 (= e!543812 (not e!543815))))

(declare-fun res!645689 () Bool)

(assert (=> b!964644 (=> res!645689 e!543815)))

(assert (=> b!964644 (= res!645689 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29042 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33851)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33851)

(declare-datatypes ((tuple2!13978 0))(
  ( (tuple2!13979 (_1!7000 (_ BitVec 64)) (_2!7000 V!33851)) )
))
(declare-datatypes ((List!19823 0))(
  ( (Nil!19820) (Cons!19819 (h!20981 tuple2!13978) (t!28186 List!19823)) )
))
(declare-datatypes ((ListLongMap!12675 0))(
  ( (ListLongMap!12676 (toList!6353 List!19823)) )
))
(declare-fun contains!5456 (ListLongMap!12675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3586 (array!59389 array!59391 (_ BitVec 32) (_ BitVec 32) V!33851 V!33851 (_ BitVec 32) Int) ListLongMap!12675)

(assert (=> b!964644 (contains!5456 (getCurrentListMap!3586 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28563 _keys!1686) i!803))))

(declare-datatypes ((Unit!32287 0))(
  ( (Unit!32288) )
))
(declare-fun lt!431136 () Unit!32287)

(declare-fun lemmaInListMapFromThenInFromMinusOne!38 (array!59389 array!59391 (_ BitVec 32) (_ BitVec 32) V!33851 V!33851 (_ BitVec 32) (_ BitVec 32) Int) Unit!32287)

(assert (=> b!964644 (= lt!431136 (lemmaInListMapFromThenInFromMinusOne!38 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964645 () Bool)

(assert (=> b!964645 (= e!543810 tp_is_empty!21651)))

(declare-fun b!964646 () Bool)

(declare-fun res!645683 () Bool)

(assert (=> b!964646 (=> (not res!645683) (not e!543812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964646 (= res!645683 (validKeyInArray!0 (select (arr!28563 _keys!1686) i!803)))))

(declare-fun b!964647 () Bool)

(declare-fun res!645688 () Bool)

(assert (=> b!964647 (=> (not res!645688) (not e!543812))))

(assert (=> b!964647 (= res!645688 (contains!5456 (getCurrentListMap!3586 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28563 _keys!1686) i!803)))))

(declare-fun b!964648 () Bool)

(declare-fun res!645684 () Bool)

(assert (=> b!964648 (=> (not res!645684) (not e!543812))))

(declare-datatypes ((List!19824 0))(
  ( (Nil!19821) (Cons!19820 (h!20982 (_ BitVec 64)) (t!28187 List!19824)) )
))
(declare-fun arrayNoDuplicates!0 (array!59389 (_ BitVec 32) List!19824) Bool)

(assert (=> b!964648 (= res!645684 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19821))))

(declare-fun b!964649 () Bool)

(declare-fun res!645690 () Bool)

(assert (=> b!964649 (=> (not res!645690) (not e!543812))))

(assert (=> b!964649 (= res!645690 (and (= (size!29043 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29042 _keys!1686) (size!29043 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34471 () Bool)

(assert (=> mapIsEmpty!34471 mapRes!34471))

(declare-fun b!964650 () Bool)

(assert (=> b!964650 (= e!543814 tp_is_empty!21651)))

(declare-fun b!964651 () Bool)

(assert (=> b!964651 (= e!543815 true)))

(assert (=> b!964651 (contains!5456 (getCurrentListMap!3586 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28563 _keys!1686) i!803))))

(declare-fun lt!431137 () Unit!32287)

(declare-fun lemmaInListMapFromThenInFromSmaller!35 (array!59389 array!59391 (_ BitVec 32) (_ BitVec 32) V!33851 V!33851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32287)

(assert (=> b!964651 (= lt!431137 (lemmaInListMapFromThenInFromSmaller!35 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(assert (= (and start!82716 res!645685) b!964649))

(assert (= (and b!964649 res!645690) b!964640))

(assert (= (and b!964640 res!645687) b!964648))

(assert (= (and b!964648 res!645684) b!964642))

(assert (= (and b!964642 res!645691) b!964646))

(assert (= (and b!964646 res!645683) b!964647))

(assert (= (and b!964647 res!645688) b!964641))

(assert (= (and b!964641 res!645686) b!964644))

(assert (= (and b!964644 (not res!645689)) b!964651))

(assert (= (and b!964643 condMapEmpty!34471) mapIsEmpty!34471))

(assert (= (and b!964643 (not condMapEmpty!34471)) mapNonEmpty!34471))

(get-info :version)

(assert (= (and mapNonEmpty!34471 ((_ is ValueCellFull!10344) mapValue!34471)) b!964650))

(assert (= (and b!964643 ((_ is ValueCellFull!10344) mapDefault!34471)) b!964645))

(assert (= start!82716 b!964643))

(declare-fun m!893873 () Bool)

(assert (=> start!82716 m!893873))

(declare-fun m!893875 () Bool)

(assert (=> start!82716 m!893875))

(declare-fun m!893877 () Bool)

(assert (=> start!82716 m!893877))

(declare-fun m!893879 () Bool)

(assert (=> b!964651 m!893879))

(declare-fun m!893881 () Bool)

(assert (=> b!964651 m!893881))

(assert (=> b!964651 m!893879))

(assert (=> b!964651 m!893881))

(declare-fun m!893883 () Bool)

(assert (=> b!964651 m!893883))

(declare-fun m!893885 () Bool)

(assert (=> b!964651 m!893885))

(declare-fun m!893887 () Bool)

(assert (=> b!964647 m!893887))

(assert (=> b!964647 m!893881))

(assert (=> b!964647 m!893887))

(assert (=> b!964647 m!893881))

(declare-fun m!893889 () Bool)

(assert (=> b!964647 m!893889))

(declare-fun m!893891 () Bool)

(assert (=> mapNonEmpty!34471 m!893891))

(assert (=> b!964646 m!893881))

(assert (=> b!964646 m!893881))

(declare-fun m!893893 () Bool)

(assert (=> b!964646 m!893893))

(declare-fun m!893895 () Bool)

(assert (=> b!964648 m!893895))

(declare-fun m!893897 () Bool)

(assert (=> b!964640 m!893897))

(declare-fun m!893899 () Bool)

(assert (=> b!964644 m!893899))

(assert (=> b!964644 m!893881))

(assert (=> b!964644 m!893899))

(assert (=> b!964644 m!893881))

(declare-fun m!893901 () Bool)

(assert (=> b!964644 m!893901))

(declare-fun m!893903 () Bool)

(assert (=> b!964644 m!893903))

(check-sat (not b_next!18849) (not b!964640) (not b!964644) (not mapNonEmpty!34471) (not start!82716) (not b!964651) (not b!964647) (not b!964646) tp_is_empty!21651 (not b!964648) b_and!30337)
(check-sat b_and!30337 (not b_next!18849))
