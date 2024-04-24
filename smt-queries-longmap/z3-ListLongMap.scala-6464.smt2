; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82792 () Bool)

(assert start!82792)

(declare-fun b_free!18757 () Bool)

(declare-fun b_next!18757 () Bool)

(assert (=> start!82792 (= b_free!18757 (not b_next!18757))))

(declare-fun tp!65392 () Bool)

(declare-fun b_and!30255 () Bool)

(assert (=> start!82792 (= tp!65392 b_and!30255)))

(declare-fun mapNonEmpty!34333 () Bool)

(declare-fun mapRes!34333 () Bool)

(declare-fun tp!65391 () Bool)

(declare-fun e!543645 () Bool)

(assert (=> mapNonEmpty!34333 (= mapRes!34333 (and tp!65391 e!543645))))

(declare-datatypes ((V!33729 0))(
  ( (V!33730 (val!10830 Int)) )
))
(declare-datatypes ((ValueCell!10298 0))(
  ( (ValueCellFull!10298 (v!13385 V!33729)) (EmptyCell!10298) )
))
(declare-fun mapRest!34333 () (Array (_ BitVec 32) ValueCell!10298))

(declare-datatypes ((array!59230 0))(
  ( (array!59231 (arr!28479 (Array (_ BitVec 32) ValueCell!10298)) (size!28959 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59230)

(declare-fun mapValue!34333 () ValueCell!10298)

(declare-fun mapKey!34333 () (_ BitVec 32))

(assert (=> mapNonEmpty!34333 (= (arr!28479 _values!1400) (store mapRest!34333 mapKey!34333 mapValue!34333))))

(declare-fun b!963966 () Bool)

(declare-fun res!644867 () Bool)

(declare-fun e!543643 () Bool)

(assert (=> b!963966 (=> (not res!644867) (not e!543643))))

(declare-datatypes ((array!59232 0))(
  ( (array!59233 (arr!28480 (Array (_ BitVec 32) (_ BitVec 64))) (size!28960 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59232)

(declare-datatypes ((List!19744 0))(
  ( (Nil!19741) (Cons!19740 (h!20908 (_ BitVec 64)) (t!28099 List!19744)) )
))
(declare-fun arrayNoDuplicates!0 (array!59232 (_ BitVec 32) List!19744) Bool)

(assert (=> b!963966 (= res!644867 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19741))))

(declare-fun b!963967 () Bool)

(declare-fun res!644870 () Bool)

(assert (=> b!963967 (=> (not res!644870) (not e!543643))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59232 (_ BitVec 32)) Bool)

(assert (=> b!963967 (= res!644870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34333 () Bool)

(assert (=> mapIsEmpty!34333 mapRes!34333))

(declare-fun b!963968 () Bool)

(assert (=> b!963968 (= e!543643 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33729)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33729)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13892 0))(
  ( (tuple2!13893 (_1!6957 (_ BitVec 64)) (_2!6957 V!33729)) )
))
(declare-datatypes ((List!19745 0))(
  ( (Nil!19742) (Cons!19741 (h!20909 tuple2!13892) (t!28100 List!19745)) )
))
(declare-datatypes ((ListLongMap!12591 0))(
  ( (ListLongMap!12592 (toList!6311 List!19745)) )
))
(declare-fun contains!5426 (ListLongMap!12591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3544 (array!59232 array!59230 (_ BitVec 32) (_ BitVec 32) V!33729 V!33729 (_ BitVec 32) Int) ListLongMap!12591)

(assert (=> b!963968 (contains!5426 (getCurrentListMap!3544 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28480 _keys!1686) i!803))))

(declare-datatypes ((Unit!32184 0))(
  ( (Unit!32185) )
))
(declare-fun lt!431300 () Unit!32184)

(declare-fun lemmaInListMapFromThenInFromMinusOne!6 (array!59232 array!59230 (_ BitVec 32) (_ BitVec 32) V!33729 V!33729 (_ BitVec 32) (_ BitVec 32) Int) Unit!32184)

(assert (=> b!963968 (= lt!431300 (lemmaInListMapFromThenInFromMinusOne!6 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963969 () Bool)

(declare-fun res!644871 () Bool)

(assert (=> b!963969 (=> (not res!644871) (not e!543643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963969 (= res!644871 (validKeyInArray!0 (select (arr!28480 _keys!1686) i!803)))))

(declare-fun b!963970 () Bool)

(declare-fun res!644868 () Bool)

(assert (=> b!963970 (=> (not res!644868) (not e!543643))))

(assert (=> b!963970 (= res!644868 (contains!5426 (getCurrentListMap!3544 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28480 _keys!1686) i!803)))))

(declare-fun b!963972 () Bool)

(declare-fun e!543646 () Bool)

(declare-fun tp_is_empty!21559 () Bool)

(assert (=> b!963972 (= e!543646 tp_is_empty!21559)))

(declare-fun b!963973 () Bool)

(declare-fun res!644869 () Bool)

(assert (=> b!963973 (=> (not res!644869) (not e!543643))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963973 (= res!644869 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28960 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28960 _keys!1686))))))

(declare-fun b!963974 () Bool)

(assert (=> b!963974 (= e!543645 tp_is_empty!21559)))

(declare-fun res!644865 () Bool)

(assert (=> start!82792 (=> (not res!644865) (not e!543643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82792 (= res!644865 (validMask!0 mask!2110))))

(assert (=> start!82792 e!543643))

(assert (=> start!82792 true))

(declare-fun e!543647 () Bool)

(declare-fun array_inv!22127 (array!59230) Bool)

(assert (=> start!82792 (and (array_inv!22127 _values!1400) e!543647)))

(declare-fun array_inv!22128 (array!59232) Bool)

(assert (=> start!82792 (array_inv!22128 _keys!1686)))

(assert (=> start!82792 tp!65392))

(assert (=> start!82792 tp_is_empty!21559))

(declare-fun b!963971 () Bool)

(assert (=> b!963971 (= e!543647 (and e!543646 mapRes!34333))))

(declare-fun condMapEmpty!34333 () Bool)

(declare-fun mapDefault!34333 () ValueCell!10298)

(assert (=> b!963971 (= condMapEmpty!34333 (= (arr!28479 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10298)) mapDefault!34333)))))

(declare-fun b!963975 () Bool)

(declare-fun res!644866 () Bool)

(assert (=> b!963975 (=> (not res!644866) (not e!543643))))

(assert (=> b!963975 (= res!644866 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963976 () Bool)

(declare-fun res!644864 () Bool)

(assert (=> b!963976 (=> (not res!644864) (not e!543643))))

(assert (=> b!963976 (= res!644864 (and (= (size!28959 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28960 _keys!1686) (size!28959 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82792 res!644865) b!963976))

(assert (= (and b!963976 res!644864) b!963967))

(assert (= (and b!963967 res!644870) b!963966))

(assert (= (and b!963966 res!644867) b!963973))

(assert (= (and b!963973 res!644869) b!963969))

(assert (= (and b!963969 res!644871) b!963970))

(assert (= (and b!963970 res!644868) b!963975))

(assert (= (and b!963975 res!644866) b!963968))

(assert (= (and b!963971 condMapEmpty!34333) mapIsEmpty!34333))

(assert (= (and b!963971 (not condMapEmpty!34333)) mapNonEmpty!34333))

(get-info :version)

(assert (= (and mapNonEmpty!34333 ((_ is ValueCellFull!10298) mapValue!34333)) b!963974))

(assert (= (and b!963971 ((_ is ValueCellFull!10298) mapDefault!34333)) b!963972))

(assert (= start!82792 b!963971))

(declare-fun m!893857 () Bool)

(assert (=> b!963969 m!893857))

(assert (=> b!963969 m!893857))

(declare-fun m!893859 () Bool)

(assert (=> b!963969 m!893859))

(declare-fun m!893861 () Bool)

(assert (=> b!963966 m!893861))

(declare-fun m!893863 () Bool)

(assert (=> mapNonEmpty!34333 m!893863))

(declare-fun m!893865 () Bool)

(assert (=> start!82792 m!893865))

(declare-fun m!893867 () Bool)

(assert (=> start!82792 m!893867))

(declare-fun m!893869 () Bool)

(assert (=> start!82792 m!893869))

(declare-fun m!893871 () Bool)

(assert (=> b!963967 m!893871))

(declare-fun m!893873 () Bool)

(assert (=> b!963968 m!893873))

(assert (=> b!963968 m!893857))

(assert (=> b!963968 m!893873))

(assert (=> b!963968 m!893857))

(declare-fun m!893875 () Bool)

(assert (=> b!963968 m!893875))

(declare-fun m!893877 () Bool)

(assert (=> b!963968 m!893877))

(declare-fun m!893879 () Bool)

(assert (=> b!963970 m!893879))

(assert (=> b!963970 m!893857))

(assert (=> b!963970 m!893879))

(assert (=> b!963970 m!893857))

(declare-fun m!893881 () Bool)

(assert (=> b!963970 m!893881))

(check-sat tp_is_empty!21559 (not b!963968) (not mapNonEmpty!34333) (not b_next!18757) (not b!963970) (not start!82792) b_and!30255 (not b!963967) (not b!963969) (not b!963966))
(check-sat b_and!30255 (not b_next!18757))
