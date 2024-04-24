; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82786 () Bool)

(assert start!82786)

(declare-fun b_free!18751 () Bool)

(declare-fun b_next!18751 () Bool)

(assert (=> start!82786 (= b_free!18751 (not b_next!18751))))

(declare-fun tp!65374 () Bool)

(declare-fun b_and!30249 () Bool)

(assert (=> start!82786 (= tp!65374 b_and!30249)))

(declare-fun b!963867 () Bool)

(declare-fun res!644796 () Bool)

(declare-fun e!543601 () Bool)

(assert (=> b!963867 (=> (not res!644796) (not e!543601))))

(declare-datatypes ((array!59218 0))(
  ( (array!59219 (arr!28473 (Array (_ BitVec 32) (_ BitVec 64))) (size!28953 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59218)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963867 (= res!644796 (validKeyInArray!0 (select (arr!28473 _keys!1686) i!803)))))

(declare-fun b!963868 () Bool)

(declare-fun res!644794 () Bool)

(assert (=> b!963868 (=> (not res!644794) (not e!543601))))

(declare-datatypes ((List!19740 0))(
  ( (Nil!19737) (Cons!19736 (h!20904 (_ BitVec 64)) (t!28095 List!19740)) )
))
(declare-fun arrayNoDuplicates!0 (array!59218 (_ BitVec 32) List!19740) Bool)

(assert (=> b!963868 (= res!644794 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19737))))

(declare-fun mapNonEmpty!34324 () Bool)

(declare-fun mapRes!34324 () Bool)

(declare-fun tp!65373 () Bool)

(declare-fun e!543602 () Bool)

(assert (=> mapNonEmpty!34324 (= mapRes!34324 (and tp!65373 e!543602))))

(declare-fun mapKey!34324 () (_ BitVec 32))

(declare-datatypes ((V!33721 0))(
  ( (V!33722 (val!10827 Int)) )
))
(declare-datatypes ((ValueCell!10295 0))(
  ( (ValueCellFull!10295 (v!13382 V!33721)) (EmptyCell!10295) )
))
(declare-datatypes ((array!59220 0))(
  ( (array!59221 (arr!28474 (Array (_ BitVec 32) ValueCell!10295)) (size!28954 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59220)

(declare-fun mapRest!34324 () (Array (_ BitVec 32) ValueCell!10295))

(declare-fun mapValue!34324 () ValueCell!10295)

(assert (=> mapNonEmpty!34324 (= (arr!28474 _values!1400) (store mapRest!34324 mapKey!34324 mapValue!34324))))

(declare-fun b!963869 () Bool)

(assert (=> b!963869 (= e!543601 (not true))))

(declare-fun minValue!1342 () V!33721)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33721)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13888 0))(
  ( (tuple2!13889 (_1!6955 (_ BitVec 64)) (_2!6955 V!33721)) )
))
(declare-datatypes ((List!19741 0))(
  ( (Nil!19738) (Cons!19737 (h!20905 tuple2!13888) (t!28096 List!19741)) )
))
(declare-datatypes ((ListLongMap!12587 0))(
  ( (ListLongMap!12588 (toList!6309 List!19741)) )
))
(declare-fun contains!5424 (ListLongMap!12587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3542 (array!59218 array!59220 (_ BitVec 32) (_ BitVec 32) V!33721 V!33721 (_ BitVec 32) Int) ListLongMap!12587)

(assert (=> b!963869 (contains!5424 (getCurrentListMap!3542 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28473 _keys!1686) i!803))))

(declare-datatypes ((Unit!32180 0))(
  ( (Unit!32181) )
))
(declare-fun lt!431291 () Unit!32180)

(declare-fun lemmaInListMapFromThenInFromMinusOne!4 (array!59218 array!59220 (_ BitVec 32) (_ BitVec 32) V!33721 V!33721 (_ BitVec 32) (_ BitVec 32) Int) Unit!32180)

(assert (=> b!963869 (= lt!431291 (lemmaInListMapFromThenInFromMinusOne!4 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963870 () Bool)

(declare-fun res!644797 () Bool)

(assert (=> b!963870 (=> (not res!644797) (not e!543601))))

(assert (=> b!963870 (= res!644797 (and (= (size!28954 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28953 _keys!1686) (size!28954 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963871 () Bool)

(declare-fun res!644799 () Bool)

(assert (=> b!963871 (=> (not res!644799) (not e!543601))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963871 (= res!644799 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963872 () Bool)

(declare-fun tp_is_empty!21553 () Bool)

(assert (=> b!963872 (= e!543602 tp_is_empty!21553)))

(declare-fun b!963873 () Bool)

(declare-fun res!644795 () Bool)

(assert (=> b!963873 (=> (not res!644795) (not e!543601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59218 (_ BitVec 32)) Bool)

(assert (=> b!963873 (= res!644795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963874 () Bool)

(declare-fun res!644798 () Bool)

(assert (=> b!963874 (=> (not res!644798) (not e!543601))))

(assert (=> b!963874 (= res!644798 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28953 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28953 _keys!1686))))))

(declare-fun res!644793 () Bool)

(assert (=> start!82786 (=> (not res!644793) (not e!543601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82786 (= res!644793 (validMask!0 mask!2110))))

(assert (=> start!82786 e!543601))

(assert (=> start!82786 true))

(declare-fun e!543600 () Bool)

(declare-fun array_inv!22125 (array!59220) Bool)

(assert (=> start!82786 (and (array_inv!22125 _values!1400) e!543600)))

(declare-fun array_inv!22126 (array!59218) Bool)

(assert (=> start!82786 (array_inv!22126 _keys!1686)))

(assert (=> start!82786 tp!65374))

(assert (=> start!82786 tp_is_empty!21553))

(declare-fun b!963875 () Bool)

(declare-fun res!644792 () Bool)

(assert (=> b!963875 (=> (not res!644792) (not e!543601))))

(assert (=> b!963875 (= res!644792 (contains!5424 (getCurrentListMap!3542 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28473 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34324 () Bool)

(assert (=> mapIsEmpty!34324 mapRes!34324))

(declare-fun b!963876 () Bool)

(declare-fun e!543598 () Bool)

(assert (=> b!963876 (= e!543600 (and e!543598 mapRes!34324))))

(declare-fun condMapEmpty!34324 () Bool)

(declare-fun mapDefault!34324 () ValueCell!10295)

(assert (=> b!963876 (= condMapEmpty!34324 (= (arr!28474 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10295)) mapDefault!34324)))))

(declare-fun b!963877 () Bool)

(assert (=> b!963877 (= e!543598 tp_is_empty!21553)))

(assert (= (and start!82786 res!644793) b!963870))

(assert (= (and b!963870 res!644797) b!963873))

(assert (= (and b!963873 res!644795) b!963868))

(assert (= (and b!963868 res!644794) b!963874))

(assert (= (and b!963874 res!644798) b!963867))

(assert (= (and b!963867 res!644796) b!963875))

(assert (= (and b!963875 res!644792) b!963871))

(assert (= (and b!963871 res!644799) b!963869))

(assert (= (and b!963876 condMapEmpty!34324) mapIsEmpty!34324))

(assert (= (and b!963876 (not condMapEmpty!34324)) mapNonEmpty!34324))

(get-info :version)

(assert (= (and mapNonEmpty!34324 ((_ is ValueCellFull!10295) mapValue!34324)) b!963872))

(assert (= (and b!963876 ((_ is ValueCellFull!10295) mapDefault!34324)) b!963877))

(assert (= start!82786 b!963876))

(declare-fun m!893779 () Bool)

(assert (=> b!963867 m!893779))

(assert (=> b!963867 m!893779))

(declare-fun m!893781 () Bool)

(assert (=> b!963867 m!893781))

(declare-fun m!893783 () Bool)

(assert (=> b!963869 m!893783))

(assert (=> b!963869 m!893779))

(assert (=> b!963869 m!893783))

(assert (=> b!963869 m!893779))

(declare-fun m!893785 () Bool)

(assert (=> b!963869 m!893785))

(declare-fun m!893787 () Bool)

(assert (=> b!963869 m!893787))

(declare-fun m!893789 () Bool)

(assert (=> b!963868 m!893789))

(declare-fun m!893791 () Bool)

(assert (=> mapNonEmpty!34324 m!893791))

(declare-fun m!893793 () Bool)

(assert (=> start!82786 m!893793))

(declare-fun m!893795 () Bool)

(assert (=> start!82786 m!893795))

(declare-fun m!893797 () Bool)

(assert (=> start!82786 m!893797))

(declare-fun m!893799 () Bool)

(assert (=> b!963875 m!893799))

(assert (=> b!963875 m!893779))

(assert (=> b!963875 m!893799))

(assert (=> b!963875 m!893779))

(declare-fun m!893801 () Bool)

(assert (=> b!963875 m!893801))

(declare-fun m!893803 () Bool)

(assert (=> b!963873 m!893803))

(check-sat tp_is_empty!21553 (not mapNonEmpty!34324) (not b!963873) (not b!963875) (not b!963867) (not start!82786) (not b_next!18751) b_and!30249 (not b!963869) (not b!963868))
(check-sat b_and!30249 (not b_next!18751))
