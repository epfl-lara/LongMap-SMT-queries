; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81902 () Bool)

(assert start!81902)

(declare-fun b_free!18415 () Bool)

(declare-fun b_next!18415 () Bool)

(assert (=> start!81902 (= b_free!18415 (not b_next!18415))))

(declare-fun tp!63946 () Bool)

(declare-fun b_and!29875 () Bool)

(assert (=> start!81902 (= tp!63946 b_and!29875)))

(declare-fun b!955288 () Bool)

(declare-fun res!639768 () Bool)

(declare-fun e!538151 () Bool)

(assert (=> b!955288 (=> (not res!639768) (not e!538151))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57978 0))(
  ( (array!57979 (arr!27869 (Array (_ BitVec 32) (_ BitVec 64))) (size!28350 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57978)

(declare-datatypes ((V!32929 0))(
  ( (V!32930 (val!10530 Int)) )
))
(declare-datatypes ((ValueCell!9998 0))(
  ( (ValueCellFull!9998 (v!13084 V!32929)) (EmptyCell!9998) )
))
(declare-datatypes ((array!57980 0))(
  ( (array!57981 (arr!27870 (Array (_ BitVec 32) ValueCell!9998)) (size!28351 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57980)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955288 (= res!639768 (and (= (size!28351 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28350 _keys!1441) (size!28351 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639767 () Bool)

(assert (=> start!81902 (=> (not res!639767) (not e!538151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81902 (= res!639767 (validMask!0 mask!1823))))

(assert (=> start!81902 e!538151))

(assert (=> start!81902 true))

(declare-fun tp_is_empty!20959 () Bool)

(assert (=> start!81902 tp_is_empty!20959))

(declare-fun array_inv!21693 (array!57978) Bool)

(assert (=> start!81902 (array_inv!21693 _keys!1441)))

(declare-fun e!538154 () Bool)

(declare-fun array_inv!21694 (array!57980) Bool)

(assert (=> start!81902 (and (array_inv!21694 _values!1197) e!538154)))

(assert (=> start!81902 tp!63946))

(declare-fun mapNonEmpty!33400 () Bool)

(declare-fun mapRes!33400 () Bool)

(declare-fun tp!63945 () Bool)

(declare-fun e!538155 () Bool)

(assert (=> mapNonEmpty!33400 (= mapRes!33400 (and tp!63945 e!538155))))

(declare-fun mapKey!33400 () (_ BitVec 32))

(declare-fun mapRest!33400 () (Array (_ BitVec 32) ValueCell!9998))

(declare-fun mapValue!33400 () ValueCell!9998)

(assert (=> mapNonEmpty!33400 (= (arr!27870 _values!1197) (store mapRest!33400 mapKey!33400 mapValue!33400))))

(declare-fun b!955289 () Bool)

(declare-fun res!639771 () Bool)

(assert (=> b!955289 (=> (not res!639771) (not e!538151))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955289 (= res!639771 (validKeyInArray!0 (select (arr!27869 _keys!1441) i!735)))))

(declare-fun b!955290 () Bool)

(declare-fun e!538153 () Bool)

(assert (=> b!955290 (= e!538154 (and e!538153 mapRes!33400))))

(declare-fun condMapEmpty!33400 () Bool)

(declare-fun mapDefault!33400 () ValueCell!9998)

(assert (=> b!955290 (= condMapEmpty!33400 (= (arr!27870 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9998)) mapDefault!33400)))))

(declare-fun b!955291 () Bool)

(assert (=> b!955291 (= e!538153 tp_is_empty!20959)))

(declare-fun b!955292 () Bool)

(declare-fun res!639769 () Bool)

(assert (=> b!955292 (=> (not res!639769) (not e!538151))))

(declare-datatypes ((List!19453 0))(
  ( (Nil!19450) (Cons!19449 (h!20611 (_ BitVec 64)) (t!27805 List!19453)) )
))
(declare-fun arrayNoDuplicates!0 (array!57978 (_ BitVec 32) List!19453) Bool)

(assert (=> b!955292 (= res!639769 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19450))))

(declare-fun b!955293 () Bool)

(declare-fun res!639766 () Bool)

(assert (=> b!955293 (=> (not res!639766) (not e!538151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57978 (_ BitVec 32)) Bool)

(assert (=> b!955293 (= res!639766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955294 () Bool)

(declare-fun res!639770 () Bool)

(assert (=> b!955294 (=> (not res!639770) (not e!538151))))

(declare-fun zeroValue!1139 () V!32929)

(declare-fun minValue!1139 () V!32929)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13714 0))(
  ( (tuple2!13715 (_1!6868 (_ BitVec 64)) (_2!6868 V!32929)) )
))
(declare-datatypes ((List!19454 0))(
  ( (Nil!19451) (Cons!19450 (h!20612 tuple2!13714) (t!27806 List!19454)) )
))
(declare-datatypes ((ListLongMap!12401 0))(
  ( (ListLongMap!12402 (toList!6216 List!19454)) )
))
(declare-fun contains!5257 (ListLongMap!12401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3378 (array!57978 array!57980 (_ BitVec 32) (_ BitVec 32) V!32929 V!32929 (_ BitVec 32) Int) ListLongMap!12401)

(assert (=> b!955294 (= res!639770 (contains!5257 (getCurrentListMap!3378 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27869 _keys!1441) i!735)))))

(declare-fun b!955295 () Bool)

(assert (=> b!955295 (= e!538151 (not true))))

(assert (=> b!955295 (contains!5257 (getCurrentListMap!3378 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27869 _keys!1441) i!735))))

(declare-datatypes ((Unit!31982 0))(
  ( (Unit!31983) )
))
(declare-fun lt!429780 () Unit!31982)

(declare-fun lemmaInListMapFromThenFromZero!10 (array!57978 array!57980 (_ BitVec 32) (_ BitVec 32) V!32929 V!32929 (_ BitVec 32) (_ BitVec 32) Int) Unit!31982)

(assert (=> b!955295 (= lt!429780 (lemmaInListMapFromThenFromZero!10 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapIsEmpty!33400 () Bool)

(assert (=> mapIsEmpty!33400 mapRes!33400))

(declare-fun b!955296 () Bool)

(assert (=> b!955296 (= e!538155 tp_is_empty!20959)))

(declare-fun b!955297 () Bool)

(declare-fun res!639772 () Bool)

(assert (=> b!955297 (=> (not res!639772) (not e!538151))))

(assert (=> b!955297 (= res!639772 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28350 _keys!1441))))))

(assert (= (and start!81902 res!639767) b!955288))

(assert (= (and b!955288 res!639768) b!955293))

(assert (= (and b!955293 res!639766) b!955292))

(assert (= (and b!955292 res!639769) b!955297))

(assert (= (and b!955297 res!639772) b!955289))

(assert (= (and b!955289 res!639771) b!955294))

(assert (= (and b!955294 res!639770) b!955295))

(assert (= (and b!955290 condMapEmpty!33400) mapIsEmpty!33400))

(assert (= (and b!955290 (not condMapEmpty!33400)) mapNonEmpty!33400))

(get-info :version)

(assert (= (and mapNonEmpty!33400 ((_ is ValueCellFull!9998) mapValue!33400)) b!955296))

(assert (= (and b!955290 ((_ is ValueCellFull!9998) mapDefault!33400)) b!955291))

(assert (= start!81902 b!955290))

(declare-fun m!886275 () Bool)

(assert (=> mapNonEmpty!33400 m!886275))

(declare-fun m!886277 () Bool)

(assert (=> b!955295 m!886277))

(declare-fun m!886279 () Bool)

(assert (=> b!955295 m!886279))

(assert (=> b!955295 m!886277))

(assert (=> b!955295 m!886279))

(declare-fun m!886281 () Bool)

(assert (=> b!955295 m!886281))

(declare-fun m!886283 () Bool)

(assert (=> b!955295 m!886283))

(declare-fun m!886285 () Bool)

(assert (=> start!81902 m!886285))

(declare-fun m!886287 () Bool)

(assert (=> start!81902 m!886287))

(declare-fun m!886289 () Bool)

(assert (=> start!81902 m!886289))

(declare-fun m!886291 () Bool)

(assert (=> b!955294 m!886291))

(assert (=> b!955294 m!886279))

(assert (=> b!955294 m!886291))

(assert (=> b!955294 m!886279))

(declare-fun m!886293 () Bool)

(assert (=> b!955294 m!886293))

(assert (=> b!955289 m!886279))

(assert (=> b!955289 m!886279))

(declare-fun m!886295 () Bool)

(assert (=> b!955289 m!886295))

(declare-fun m!886297 () Bool)

(assert (=> b!955293 m!886297))

(declare-fun m!886299 () Bool)

(assert (=> b!955292 m!886299))

(check-sat (not b!955289) (not b!955292) b_and!29875 (not start!81902) (not b_next!18415) (not b!955293) tp_is_empty!20959 (not b!955294) (not mapNonEmpty!33400) (not b!955295))
(check-sat b_and!29875 (not b_next!18415))
