; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82638 () Bool)

(assert start!82638)

(declare-fun b_free!18771 () Bool)

(declare-fun b_next!18771 () Bool)

(assert (=> start!82638 (= b_free!18771 (not b_next!18771))))

(declare-fun tp!65433 () Bool)

(declare-fun b_and!30259 () Bool)

(assert (=> start!82638 (= tp!65433 b_and!30259)))

(declare-fun b!963294 () Bool)

(declare-fun e!543166 () Bool)

(declare-fun e!543168 () Bool)

(declare-fun mapRes!34354 () Bool)

(assert (=> b!963294 (= e!543166 (and e!543168 mapRes!34354))))

(declare-fun condMapEmpty!34354 () Bool)

(declare-datatypes ((V!33747 0))(
  ( (V!33748 (val!10837 Int)) )
))
(declare-datatypes ((ValueCell!10305 0))(
  ( (ValueCellFull!10305 (v!13395 V!33747)) (EmptyCell!10305) )
))
(declare-datatypes ((array!59241 0))(
  ( (array!59242 (arr!28489 (Array (_ BitVec 32) ValueCell!10305)) (size!28968 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59241)

(declare-fun mapDefault!34354 () ValueCell!10305)

(assert (=> b!963294 (= condMapEmpty!34354 (= (arr!28489 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10305)) mapDefault!34354)))))

(declare-fun b!963295 () Bool)

(declare-fun res!644691 () Bool)

(declare-fun e!543170 () Bool)

(assert (=> b!963295 (=> (not res!644691) (not e!543170))))

(declare-datatypes ((array!59243 0))(
  ( (array!59244 (arr!28490 (Array (_ BitVec 32) (_ BitVec 64))) (size!28969 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59243)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963295 (= res!644691 (validKeyInArray!0 (select (arr!28490 _keys!1686) i!803)))))

(declare-fun b!963296 () Bool)

(declare-fun res!644695 () Bool)

(assert (=> b!963296 (=> (not res!644695) (not e!543170))))

(declare-datatypes ((List!19773 0))(
  ( (Nil!19770) (Cons!19769 (h!20931 (_ BitVec 64)) (t!28136 List!19773)) )
))
(declare-fun arrayNoDuplicates!0 (array!59243 (_ BitVec 32) List!19773) Bool)

(assert (=> b!963296 (= res!644695 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19770))))

(declare-fun b!963297 () Bool)

(declare-fun res!644689 () Bool)

(assert (=> b!963297 (=> (not res!644689) (not e!543170))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!963297 (= res!644689 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28969 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28969 _keys!1686))))))

(declare-fun mapIsEmpty!34354 () Bool)

(assert (=> mapIsEmpty!34354 mapRes!34354))

(declare-fun b!963298 () Bool)

(declare-fun res!644690 () Bool)

(assert (=> b!963298 (=> (not res!644690) (not e!543170))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33747)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33747)

(declare-datatypes ((tuple2!13922 0))(
  ( (tuple2!13923 (_1!6972 (_ BitVec 64)) (_2!6972 V!33747)) )
))
(declare-datatypes ((List!19774 0))(
  ( (Nil!19771) (Cons!19770 (h!20932 tuple2!13922) (t!28137 List!19774)) )
))
(declare-datatypes ((ListLongMap!12619 0))(
  ( (ListLongMap!12620 (toList!6325 List!19774)) )
))
(declare-fun contains!5428 (ListLongMap!12619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3558 (array!59243 array!59241 (_ BitVec 32) (_ BitVec 32) V!33747 V!33747 (_ BitVec 32) Int) ListLongMap!12619)

(assert (=> b!963298 (= res!644690 (contains!5428 (getCurrentListMap!3558 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28490 _keys!1686) i!803)))))

(declare-fun b!963299 () Bool)

(assert (=> b!963299 (= e!543170 (not true))))

(assert (=> b!963299 (contains!5428 (getCurrentListMap!3558 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28490 _keys!1686) i!803))))

(declare-datatypes ((Unit!32233 0))(
  ( (Unit!32234) )
))
(declare-fun lt!430960 () Unit!32233)

(declare-fun lemmaInListMapFromThenInFromMinusOne!11 (array!59243 array!59241 (_ BitVec 32) (_ BitVec 32) V!33747 V!33747 (_ BitVec 32) (_ BitVec 32) Int) Unit!32233)

(assert (=> b!963299 (= lt!430960 (lemmaInListMapFromThenInFromMinusOne!11 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963301 () Bool)

(declare-fun res!644694 () Bool)

(assert (=> b!963301 (=> (not res!644694) (not e!543170))))

(assert (=> b!963301 (= res!644694 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963302 () Bool)

(declare-fun e!543169 () Bool)

(declare-fun tp_is_empty!21573 () Bool)

(assert (=> b!963302 (= e!543169 tp_is_empty!21573)))

(declare-fun b!963303 () Bool)

(declare-fun res!644693 () Bool)

(assert (=> b!963303 (=> (not res!644693) (not e!543170))))

(assert (=> b!963303 (= res!644693 (and (= (size!28968 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28969 _keys!1686) (size!28968 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34354 () Bool)

(declare-fun tp!65432 () Bool)

(assert (=> mapNonEmpty!34354 (= mapRes!34354 (and tp!65432 e!543169))))

(declare-fun mapKey!34354 () (_ BitVec 32))

(declare-fun mapRest!34354 () (Array (_ BitVec 32) ValueCell!10305))

(declare-fun mapValue!34354 () ValueCell!10305)

(assert (=> mapNonEmpty!34354 (= (arr!28489 _values!1400) (store mapRest!34354 mapKey!34354 mapValue!34354))))

(declare-fun b!963304 () Bool)

(declare-fun res!644688 () Bool)

(assert (=> b!963304 (=> (not res!644688) (not e!543170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59243 (_ BitVec 32)) Bool)

(assert (=> b!963304 (= res!644688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!644692 () Bool)

(assert (=> start!82638 (=> (not res!644692) (not e!543170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82638 (= res!644692 (validMask!0 mask!2110))))

(assert (=> start!82638 e!543170))

(assert (=> start!82638 true))

(declare-fun array_inv!22073 (array!59241) Bool)

(assert (=> start!82638 (and (array_inv!22073 _values!1400) e!543166)))

(declare-fun array_inv!22074 (array!59243) Bool)

(assert (=> start!82638 (array_inv!22074 _keys!1686)))

(assert (=> start!82638 tp!65433))

(assert (=> start!82638 tp_is_empty!21573))

(declare-fun b!963300 () Bool)

(assert (=> b!963300 (= e!543168 tp_is_empty!21573)))

(assert (= (and start!82638 res!644692) b!963303))

(assert (= (and b!963303 res!644693) b!963304))

(assert (= (and b!963304 res!644688) b!963296))

(assert (= (and b!963296 res!644695) b!963297))

(assert (= (and b!963297 res!644689) b!963295))

(assert (= (and b!963295 res!644691) b!963298))

(assert (= (and b!963298 res!644690) b!963301))

(assert (= (and b!963301 res!644694) b!963299))

(assert (= (and b!963294 condMapEmpty!34354) mapIsEmpty!34354))

(assert (= (and b!963294 (not condMapEmpty!34354)) mapNonEmpty!34354))

(get-info :version)

(assert (= (and mapNonEmpty!34354 ((_ is ValueCellFull!10305) mapValue!34354)) b!963302))

(assert (= (and b!963294 ((_ is ValueCellFull!10305) mapDefault!34354)) b!963300))

(assert (= start!82638 b!963294))

(declare-fun m!892745 () Bool)

(assert (=> b!963304 m!892745))

(declare-fun m!892747 () Bool)

(assert (=> mapNonEmpty!34354 m!892747))

(declare-fun m!892749 () Bool)

(assert (=> b!963295 m!892749))

(assert (=> b!963295 m!892749))

(declare-fun m!892751 () Bool)

(assert (=> b!963295 m!892751))

(declare-fun m!892753 () Bool)

(assert (=> b!963296 m!892753))

(declare-fun m!892755 () Bool)

(assert (=> b!963298 m!892755))

(assert (=> b!963298 m!892749))

(assert (=> b!963298 m!892755))

(assert (=> b!963298 m!892749))

(declare-fun m!892757 () Bool)

(assert (=> b!963298 m!892757))

(declare-fun m!892759 () Bool)

(assert (=> start!82638 m!892759))

(declare-fun m!892761 () Bool)

(assert (=> start!82638 m!892761))

(declare-fun m!892763 () Bool)

(assert (=> start!82638 m!892763))

(declare-fun m!892765 () Bool)

(assert (=> b!963299 m!892765))

(assert (=> b!963299 m!892749))

(assert (=> b!963299 m!892765))

(assert (=> b!963299 m!892749))

(declare-fun m!892767 () Bool)

(assert (=> b!963299 m!892767))

(declare-fun m!892769 () Bool)

(assert (=> b!963299 m!892769))

(check-sat (not b!963298) (not mapNonEmpty!34354) (not start!82638) (not b!963299) (not b!963304) (not b_next!18771) tp_is_empty!21573 b_and!30259 (not b!963296) (not b!963295))
(check-sat b_and!30259 (not b_next!18771))
