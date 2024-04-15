; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82930 () Bool)

(assert start!82930)

(declare-fun b_free!19075 () Bool)

(declare-fun b_next!19075 () Bool)

(assert (=> start!82930 (= b_free!19075 (not b_next!19075))))

(declare-fun tp!66355 () Bool)

(declare-fun b_and!30537 () Bool)

(assert (=> start!82930 (= tp!66355 b_and!30537)))

(declare-fun mapIsEmpty!34819 () Bool)

(declare-fun mapRes!34819 () Bool)

(assert (=> mapIsEmpty!34819 mapRes!34819))

(declare-fun b!967840 () Bool)

(declare-fun res!647969 () Bool)

(declare-fun e!545427 () Bool)

(assert (=> b!967840 (=> (not res!647969) (not e!545427))))

(declare-datatypes ((array!59768 0))(
  ( (array!59769 (arr!28753 (Array (_ BitVec 32) (_ BitVec 64))) (size!29234 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59768)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967840 (= res!647969 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29234 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29234 _keys!1686))))))

(declare-fun b!967841 () Bool)

(declare-fun res!647975 () Bool)

(assert (=> b!967841 (=> (not res!647975) (not e!545427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967841 (= res!647975 (validKeyInArray!0 (select (arr!28753 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34819 () Bool)

(declare-fun tp!66354 () Bool)

(declare-fun e!545430 () Bool)

(assert (=> mapNonEmpty!34819 (= mapRes!34819 (and tp!66354 e!545430))))

(declare-datatypes ((V!34161 0))(
  ( (V!34162 (val!10992 Int)) )
))
(declare-datatypes ((ValueCell!10460 0))(
  ( (ValueCellFull!10460 (v!13549 V!34161)) (EmptyCell!10460) )
))
(declare-fun mapValue!34819 () ValueCell!10460)

(declare-fun mapRest!34819 () (Array (_ BitVec 32) ValueCell!10460))

(declare-datatypes ((array!59770 0))(
  ( (array!59771 (arr!28754 (Array (_ BitVec 32) ValueCell!10460)) (size!29235 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59770)

(declare-fun mapKey!34819 () (_ BitVec 32))

(assert (=> mapNonEmpty!34819 (= (arr!28754 _values!1400) (store mapRest!34819 mapKey!34819 mapValue!34819))))

(declare-fun b!967842 () Bool)

(declare-fun res!647973 () Bool)

(assert (=> b!967842 (=> (not res!647973) (not e!545427))))

(declare-fun minValue!1342 () V!34161)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34161)

(declare-datatypes ((tuple2!14218 0))(
  ( (tuple2!14219 (_1!7120 (_ BitVec 64)) (_2!7120 V!34161)) )
))
(declare-datatypes ((List!20017 0))(
  ( (Nil!20014) (Cons!20013 (h!21175 tuple2!14218) (t!28371 List!20017)) )
))
(declare-datatypes ((ListLongMap!12905 0))(
  ( (ListLongMap!12906 (toList!6468 List!20017)) )
))
(declare-fun contains!5513 (ListLongMap!12905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3630 (array!59768 array!59770 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) Int) ListLongMap!12905)

(assert (=> b!967842 (= res!647973 (contains!5513 (getCurrentListMap!3630 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28753 _keys!1686) i!803)))))

(declare-fun b!967843 () Bool)

(declare-fun e!545426 () Bool)

(assert (=> b!967843 (= e!545426 (bvsge i!803 #b00000000000000000000000000000000))))

(assert (=> b!967843 (contains!5513 (getCurrentListMap!3630 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28753 _keys!1686) i!803))))

(declare-datatypes ((Unit!32222 0))(
  ( (Unit!32223) )
))
(declare-fun lt!431246 () Unit!32222)

(declare-fun lemmaInListMapFromThenInFromSmaller!43 (array!59768 array!59770 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32222)

(assert (=> b!967843 (= lt!431246 (lemmaInListMapFromThenInFromSmaller!43 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!967844 () Bool)

(declare-fun res!647972 () Bool)

(assert (=> b!967844 (=> (not res!647972) (not e!545427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59768 (_ BitVec 32)) Bool)

(assert (=> b!967844 (= res!647972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967845 () Bool)

(declare-fun res!647968 () Bool)

(assert (=> b!967845 (=> (not res!647968) (not e!545427))))

(assert (=> b!967845 (= res!647968 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967839 () Bool)

(declare-fun tp_is_empty!21883 () Bool)

(assert (=> b!967839 (= e!545430 tp_is_empty!21883)))

(declare-fun res!647967 () Bool)

(assert (=> start!82930 (=> (not res!647967) (not e!545427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82930 (= res!647967 (validMask!0 mask!2110))))

(assert (=> start!82930 e!545427))

(assert (=> start!82930 true))

(declare-fun e!545429 () Bool)

(declare-fun array_inv!22327 (array!59770) Bool)

(assert (=> start!82930 (and (array_inv!22327 _values!1400) e!545429)))

(declare-fun array_inv!22328 (array!59768) Bool)

(assert (=> start!82930 (array_inv!22328 _keys!1686)))

(assert (=> start!82930 tp!66355))

(assert (=> start!82930 tp_is_empty!21883))

(declare-fun b!967846 () Bool)

(assert (=> b!967846 (= e!545427 (not e!545426))))

(declare-fun res!647971 () Bool)

(assert (=> b!967846 (=> res!647971 e!545426)))

(assert (=> b!967846 (= res!647971 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29234 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!967846 (contains!5513 (getCurrentListMap!3630 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28753 _keys!1686) i!803))))

(declare-fun lt!431245 () Unit!32222)

(declare-fun lemmaInListMapFromThenInFromMinusOne!75 (array!59768 array!59770 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) (_ BitVec 32) Int) Unit!32222)

(assert (=> b!967846 (= lt!431245 (lemmaInListMapFromThenInFromMinusOne!75 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967847 () Bool)

(declare-fun res!647974 () Bool)

(assert (=> b!967847 (=> (not res!647974) (not e!545427))))

(assert (=> b!967847 (= res!647974 (and (= (size!29235 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29234 _keys!1686) (size!29235 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967848 () Bool)

(declare-fun res!647970 () Bool)

(assert (=> b!967848 (=> (not res!647970) (not e!545427))))

(declare-datatypes ((List!20018 0))(
  ( (Nil!20015) (Cons!20014 (h!21176 (_ BitVec 64)) (t!28372 List!20018)) )
))
(declare-fun arrayNoDuplicates!0 (array!59768 (_ BitVec 32) List!20018) Bool)

(assert (=> b!967848 (= res!647970 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!20015))))

(declare-fun b!967849 () Bool)

(declare-fun e!545431 () Bool)

(assert (=> b!967849 (= e!545431 tp_is_empty!21883)))

(declare-fun b!967850 () Bool)

(assert (=> b!967850 (= e!545429 (and e!545431 mapRes!34819))))

(declare-fun condMapEmpty!34819 () Bool)

(declare-fun mapDefault!34819 () ValueCell!10460)

(assert (=> b!967850 (= condMapEmpty!34819 (= (arr!28754 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10460)) mapDefault!34819)))))

(assert (= (and start!82930 res!647967) b!967847))

(assert (= (and b!967847 res!647974) b!967844))

(assert (= (and b!967844 res!647972) b!967848))

(assert (= (and b!967848 res!647970) b!967840))

(assert (= (and b!967840 res!647969) b!967841))

(assert (= (and b!967841 res!647975) b!967842))

(assert (= (and b!967842 res!647973) b!967845))

(assert (= (and b!967845 res!647968) b!967846))

(assert (= (and b!967846 (not res!647971)) b!967843))

(assert (= (and b!967850 condMapEmpty!34819) mapIsEmpty!34819))

(assert (= (and b!967850 (not condMapEmpty!34819)) mapNonEmpty!34819))

(get-info :version)

(assert (= (and mapNonEmpty!34819 ((_ is ValueCellFull!10460) mapValue!34819)) b!967839))

(assert (= (and b!967850 ((_ is ValueCellFull!10460) mapDefault!34819)) b!967849))

(assert (= start!82930 b!967850))

(declare-fun m!895735 () Bool)

(assert (=> b!967842 m!895735))

(declare-fun m!895737 () Bool)

(assert (=> b!967842 m!895737))

(assert (=> b!967842 m!895735))

(assert (=> b!967842 m!895737))

(declare-fun m!895739 () Bool)

(assert (=> b!967842 m!895739))

(assert (=> b!967841 m!895737))

(assert (=> b!967841 m!895737))

(declare-fun m!895741 () Bool)

(assert (=> b!967841 m!895741))

(declare-fun m!895743 () Bool)

(assert (=> b!967843 m!895743))

(assert (=> b!967843 m!895737))

(assert (=> b!967843 m!895743))

(assert (=> b!967843 m!895737))

(declare-fun m!895745 () Bool)

(assert (=> b!967843 m!895745))

(declare-fun m!895747 () Bool)

(assert (=> b!967843 m!895747))

(declare-fun m!895749 () Bool)

(assert (=> b!967844 m!895749))

(declare-fun m!895751 () Bool)

(assert (=> b!967846 m!895751))

(assert (=> b!967846 m!895737))

(assert (=> b!967846 m!895751))

(assert (=> b!967846 m!895737))

(declare-fun m!895753 () Bool)

(assert (=> b!967846 m!895753))

(declare-fun m!895755 () Bool)

(assert (=> b!967846 m!895755))

(declare-fun m!895757 () Bool)

(assert (=> b!967848 m!895757))

(declare-fun m!895759 () Bool)

(assert (=> mapNonEmpty!34819 m!895759))

(declare-fun m!895761 () Bool)

(assert (=> start!82930 m!895761))

(declare-fun m!895763 () Bool)

(assert (=> start!82930 m!895763))

(declare-fun m!895765 () Bool)

(assert (=> start!82930 m!895765))

(check-sat (not b!967843) b_and!30537 (not b!967841) (not b!967844) tp_is_empty!21883 (not b!967846) (not b!967842) (not b!967848) (not mapNonEmpty!34819) (not start!82930) (not b_next!19075))
(check-sat b_and!30537 (not b_next!19075))
