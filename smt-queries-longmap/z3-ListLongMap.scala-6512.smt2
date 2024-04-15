; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82894 () Bool)

(assert start!82894)

(declare-fun b_free!19039 () Bool)

(declare-fun b_next!19039 () Bool)

(assert (=> start!82894 (= b_free!19039 (not b_next!19039))))

(declare-fun tp!66247 () Bool)

(declare-fun b_and!30501 () Bool)

(assert (=> start!82894 (= tp!66247 b_and!30501)))

(declare-fun b!967243 () Bool)

(declare-fun res!647539 () Bool)

(declare-fun e!545158 () Bool)

(assert (=> b!967243 (=> (not res!647539) (not e!545158))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59698 0))(
  ( (array!59699 (arr!28718 (Array (_ BitVec 32) (_ BitVec 64))) (size!29199 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59698)

(declare-datatypes ((V!34113 0))(
  ( (V!34114 (val!10974 Int)) )
))
(declare-fun minValue!1342 () V!34113)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10442 0))(
  ( (ValueCellFull!10442 (v!13531 V!34113)) (EmptyCell!10442) )
))
(declare-datatypes ((array!59700 0))(
  ( (array!59701 (arr!28719 (Array (_ BitVec 32) ValueCell!10442)) (size!29200 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59700)

(declare-fun zeroValue!1342 () V!34113)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14190 0))(
  ( (tuple2!14191 (_1!7106 (_ BitVec 64)) (_2!7106 V!34113)) )
))
(declare-datatypes ((List!19993 0))(
  ( (Nil!19990) (Cons!19989 (h!21151 tuple2!14190) (t!28347 List!19993)) )
))
(declare-datatypes ((ListLongMap!12877 0))(
  ( (ListLongMap!12878 (toList!6454 List!19993)) )
))
(declare-fun contains!5499 (ListLongMap!12877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3616 (array!59698 array!59700 (_ BitVec 32) (_ BitVec 32) V!34113 V!34113 (_ BitVec 32) Int) ListLongMap!12877)

(assert (=> b!967243 (= res!647539 (contains!5499 (getCurrentListMap!3616 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28718 _keys!1686) i!803)))))

(declare-fun b!967244 () Bool)

(declare-fun e!545157 () Bool)

(declare-fun tp_is_empty!21847 () Bool)

(assert (=> b!967244 (= e!545157 tp_is_empty!21847)))

(declare-fun res!647534 () Bool)

(assert (=> start!82894 (=> (not res!647534) (not e!545158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82894 (= res!647534 (validMask!0 mask!2110))))

(assert (=> start!82894 e!545158))

(assert (=> start!82894 true))

(declare-fun e!545155 () Bool)

(declare-fun array_inv!22301 (array!59700) Bool)

(assert (=> start!82894 (and (array_inv!22301 _values!1400) e!545155)))

(declare-fun array_inv!22302 (array!59698) Bool)

(assert (=> start!82894 (array_inv!22302 _keys!1686)))

(assert (=> start!82894 tp!66247))

(assert (=> start!82894 tp_is_empty!21847))

(declare-fun b!967245 () Bool)

(declare-fun res!647537 () Bool)

(assert (=> b!967245 (=> (not res!647537) (not e!545158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967245 (= res!647537 (validKeyInArray!0 (select (arr!28718 _keys!1686) i!803)))))

(declare-fun b!967246 () Bool)

(declare-fun e!545156 () Bool)

(declare-fun mapRes!34765 () Bool)

(assert (=> b!967246 (= e!545155 (and e!545156 mapRes!34765))))

(declare-fun condMapEmpty!34765 () Bool)

(declare-fun mapDefault!34765 () ValueCell!10442)

(assert (=> b!967246 (= condMapEmpty!34765 (= (arr!28719 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10442)) mapDefault!34765)))))

(declare-fun b!967247 () Bool)

(assert (=> b!967247 (= e!545158 (not true))))

(assert (=> b!967247 (contains!5499 (getCurrentListMap!3616 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28718 _keys!1686) i!803))))

(declare-datatypes ((Unit!32200 0))(
  ( (Unit!32201) )
))
(declare-fun lt!431189 () Unit!32200)

(declare-fun lemmaInListMapFromThenInFromMinusOne!64 (array!59698 array!59700 (_ BitVec 32) (_ BitVec 32) V!34113 V!34113 (_ BitVec 32) (_ BitVec 32) Int) Unit!32200)

(assert (=> b!967247 (= lt!431189 (lemmaInListMapFromThenInFromMinusOne!64 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967248 () Bool)

(declare-fun res!647533 () Bool)

(assert (=> b!967248 (=> (not res!647533) (not e!545158))))

(assert (=> b!967248 (= res!647533 (and (= (size!29200 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29199 _keys!1686) (size!29200 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967249 () Bool)

(declare-fun res!647535 () Bool)

(assert (=> b!967249 (=> (not res!647535) (not e!545158))))

(declare-datatypes ((List!19994 0))(
  ( (Nil!19991) (Cons!19990 (h!21152 (_ BitVec 64)) (t!28348 List!19994)) )
))
(declare-fun arrayNoDuplicates!0 (array!59698 (_ BitVec 32) List!19994) Bool)

(assert (=> b!967249 (= res!647535 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19991))))

(declare-fun b!967250 () Bool)

(declare-fun res!647538 () Bool)

(assert (=> b!967250 (=> (not res!647538) (not e!545158))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967250 (= res!647538 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29199 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29199 _keys!1686))))))

(declare-fun mapNonEmpty!34765 () Bool)

(declare-fun tp!66246 () Bool)

(assert (=> mapNonEmpty!34765 (= mapRes!34765 (and tp!66246 e!545157))))

(declare-fun mapRest!34765 () (Array (_ BitVec 32) ValueCell!10442))

(declare-fun mapKey!34765 () (_ BitVec 32))

(declare-fun mapValue!34765 () ValueCell!10442)

(assert (=> mapNonEmpty!34765 (= (arr!28719 _values!1400) (store mapRest!34765 mapKey!34765 mapValue!34765))))

(declare-fun b!967251 () Bool)

(declare-fun res!647540 () Bool)

(assert (=> b!967251 (=> (not res!647540) (not e!545158))))

(assert (=> b!967251 (= res!647540 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967252 () Bool)

(assert (=> b!967252 (= e!545156 tp_is_empty!21847)))

(declare-fun b!967253 () Bool)

(declare-fun res!647536 () Bool)

(assert (=> b!967253 (=> (not res!647536) (not e!545158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59698 (_ BitVec 32)) Bool)

(assert (=> b!967253 (= res!647536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34765 () Bool)

(assert (=> mapIsEmpty!34765 mapRes!34765))

(assert (= (and start!82894 res!647534) b!967248))

(assert (= (and b!967248 res!647533) b!967253))

(assert (= (and b!967253 res!647536) b!967249))

(assert (= (and b!967249 res!647535) b!967250))

(assert (= (and b!967250 res!647538) b!967245))

(assert (= (and b!967245 res!647537) b!967243))

(assert (= (and b!967243 res!647539) b!967251))

(assert (= (and b!967251 res!647540) b!967247))

(assert (= (and b!967246 condMapEmpty!34765) mapIsEmpty!34765))

(assert (= (and b!967246 (not condMapEmpty!34765)) mapNonEmpty!34765))

(get-info :version)

(assert (= (and mapNonEmpty!34765 ((_ is ValueCellFull!10442) mapValue!34765)) b!967244))

(assert (= (and b!967246 ((_ is ValueCellFull!10442) mapDefault!34765)) b!967252))

(assert (= start!82894 b!967246))

(declare-fun m!895267 () Bool)

(assert (=> b!967249 m!895267))

(declare-fun m!895269 () Bool)

(assert (=> b!967253 m!895269))

(declare-fun m!895271 () Bool)

(assert (=> b!967243 m!895271))

(declare-fun m!895273 () Bool)

(assert (=> b!967243 m!895273))

(assert (=> b!967243 m!895271))

(assert (=> b!967243 m!895273))

(declare-fun m!895275 () Bool)

(assert (=> b!967243 m!895275))

(declare-fun m!895277 () Bool)

(assert (=> start!82894 m!895277))

(declare-fun m!895279 () Bool)

(assert (=> start!82894 m!895279))

(declare-fun m!895281 () Bool)

(assert (=> start!82894 m!895281))

(assert (=> b!967245 m!895273))

(assert (=> b!967245 m!895273))

(declare-fun m!895283 () Bool)

(assert (=> b!967245 m!895283))

(declare-fun m!895285 () Bool)

(assert (=> mapNonEmpty!34765 m!895285))

(declare-fun m!895287 () Bool)

(assert (=> b!967247 m!895287))

(assert (=> b!967247 m!895273))

(assert (=> b!967247 m!895287))

(assert (=> b!967247 m!895273))

(declare-fun m!895289 () Bool)

(assert (=> b!967247 m!895289))

(declare-fun m!895291 () Bool)

(assert (=> b!967247 m!895291))

(check-sat (not start!82894) tp_is_empty!21847 (not b!967245) (not mapNonEmpty!34765) (not b_next!19039) (not b!967247) b_and!30501 (not b!967243) (not b!967253) (not b!967249))
(check-sat b_and!30501 (not b_next!19039))
