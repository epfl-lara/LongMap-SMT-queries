; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81904 () Bool)

(assert start!81904)

(declare-fun b_free!18399 () Bool)

(declare-fun b_next!18399 () Bool)

(assert (=> start!81904 (= b_free!18399 (not b_next!18399))))

(declare-fun tp!63897 () Bool)

(declare-fun b_and!29885 () Bool)

(assert (=> start!81904 (= tp!63897 b_and!29885)))

(declare-fun mapIsEmpty!33376 () Bool)

(declare-fun mapRes!33376 () Bool)

(assert (=> mapIsEmpty!33376 mapRes!33376))

(declare-fun b!955287 () Bool)

(declare-fun res!639713 () Bool)

(declare-fun e!538182 () Bool)

(assert (=> b!955287 (=> (not res!639713) (not e!538182))))

(declare-datatypes ((array!57991 0))(
  ( (array!57992 (arr!27875 (Array (_ BitVec 32) (_ BitVec 64))) (size!28354 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57991)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57991 (_ BitVec 32)) Bool)

(assert (=> b!955287 (= res!639713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955289 () Bool)

(declare-fun res!639711 () Bool)

(assert (=> b!955289 (=> (not res!639711) (not e!538182))))

(declare-datatypes ((List!19427 0))(
  ( (Nil!19424) (Cons!19423 (h!20585 (_ BitVec 64)) (t!27788 List!19427)) )
))
(declare-fun arrayNoDuplicates!0 (array!57991 (_ BitVec 32) List!19427) Bool)

(assert (=> b!955289 (= res!639711 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19424))))

(declare-fun b!955290 () Bool)

(declare-fun res!639714 () Bool)

(assert (=> b!955290 (=> (not res!639714) (not e!538182))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!955290 (= res!639714 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28354 _keys!1441))))))

(declare-fun b!955291 () Bool)

(declare-fun res!639708 () Bool)

(assert (=> b!955291 (=> (not res!639708) (not e!538182))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32907 0))(
  ( (V!32908 (val!10522 Int)) )
))
(declare-fun zeroValue!1139 () V!32907)

(declare-datatypes ((ValueCell!9990 0))(
  ( (ValueCellFull!9990 (v!13077 V!32907)) (EmptyCell!9990) )
))
(declare-datatypes ((array!57993 0))(
  ( (array!57994 (arr!27876 (Array (_ BitVec 32) ValueCell!9990)) (size!28355 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57993)

(declare-fun minValue!1139 () V!32907)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13652 0))(
  ( (tuple2!13653 (_1!6837 (_ BitVec 64)) (_2!6837 V!32907)) )
))
(declare-datatypes ((List!19428 0))(
  ( (Nil!19425) (Cons!19424 (h!20586 tuple2!13652) (t!27789 List!19428)) )
))
(declare-datatypes ((ListLongMap!12349 0))(
  ( (ListLongMap!12350 (toList!6190 List!19428)) )
))
(declare-fun contains!5288 (ListLongMap!12349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3423 (array!57991 array!57993 (_ BitVec 32) (_ BitVec 32) V!32907 V!32907 (_ BitVec 32) Int) ListLongMap!12349)

(assert (=> b!955291 (= res!639708 (contains!5288 (getCurrentListMap!3423 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27875 _keys!1441) i!735)))))

(declare-fun b!955292 () Bool)

(declare-fun e!538179 () Bool)

(declare-fun tp_is_empty!20943 () Bool)

(assert (=> b!955292 (= e!538179 tp_is_empty!20943)))

(declare-fun b!955293 () Bool)

(assert (=> b!955293 (= e!538182 (not true))))

(assert (=> b!955293 (contains!5288 (getCurrentListMap!3423 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27875 _keys!1441) i!735))))

(declare-datatypes ((Unit!32101 0))(
  ( (Unit!32102) )
))
(declare-fun lt!429992 () Unit!32101)

(declare-fun lemmaInListMapFromThenFromZero!5 (array!57991 array!57993 (_ BitVec 32) (_ BitVec 32) V!32907 V!32907 (_ BitVec 32) (_ BitVec 32) Int) Unit!32101)

(assert (=> b!955293 (= lt!429992 (lemmaInListMapFromThenFromZero!5 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955294 () Bool)

(declare-fun res!639712 () Bool)

(assert (=> b!955294 (=> (not res!639712) (not e!538182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955294 (= res!639712 (validKeyInArray!0 (select (arr!27875 _keys!1441) i!735)))))

(declare-fun b!955295 () Bool)

(declare-fun e!538183 () Bool)

(declare-fun e!538181 () Bool)

(assert (=> b!955295 (= e!538183 (and e!538181 mapRes!33376))))

(declare-fun condMapEmpty!33376 () Bool)

(declare-fun mapDefault!33376 () ValueCell!9990)

(assert (=> b!955295 (= condMapEmpty!33376 (= (arr!27876 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9990)) mapDefault!33376)))))

(declare-fun mapNonEmpty!33376 () Bool)

(declare-fun tp!63896 () Bool)

(assert (=> mapNonEmpty!33376 (= mapRes!33376 (and tp!63896 e!538179))))

(declare-fun mapValue!33376 () ValueCell!9990)

(declare-fun mapRest!33376 () (Array (_ BitVec 32) ValueCell!9990))

(declare-fun mapKey!33376 () (_ BitVec 32))

(assert (=> mapNonEmpty!33376 (= (arr!27876 _values!1197) (store mapRest!33376 mapKey!33376 mapValue!33376))))

(declare-fun b!955296 () Bool)

(declare-fun res!639709 () Bool)

(assert (=> b!955296 (=> (not res!639709) (not e!538182))))

(assert (=> b!955296 (= res!639709 (and (= (size!28355 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28354 _keys!1441) (size!28355 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955288 () Bool)

(assert (=> b!955288 (= e!538181 tp_is_empty!20943)))

(declare-fun res!639710 () Bool)

(assert (=> start!81904 (=> (not res!639710) (not e!538182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81904 (= res!639710 (validMask!0 mask!1823))))

(assert (=> start!81904 e!538182))

(assert (=> start!81904 true))

(assert (=> start!81904 tp_is_empty!20943))

(declare-fun array_inv!21635 (array!57991) Bool)

(assert (=> start!81904 (array_inv!21635 _keys!1441)))

(declare-fun array_inv!21636 (array!57993) Bool)

(assert (=> start!81904 (and (array_inv!21636 _values!1197) e!538183)))

(assert (=> start!81904 tp!63897))

(assert (= (and start!81904 res!639710) b!955296))

(assert (= (and b!955296 res!639709) b!955287))

(assert (= (and b!955287 res!639713) b!955289))

(assert (= (and b!955289 res!639711) b!955290))

(assert (= (and b!955290 res!639714) b!955294))

(assert (= (and b!955294 res!639712) b!955291))

(assert (= (and b!955291 res!639708) b!955293))

(assert (= (and b!955295 condMapEmpty!33376) mapIsEmpty!33376))

(assert (= (and b!955295 (not condMapEmpty!33376)) mapNonEmpty!33376))

(get-info :version)

(assert (= (and mapNonEmpty!33376 ((_ is ValueCellFull!9990) mapValue!33376)) b!955292))

(assert (= (and b!955295 ((_ is ValueCellFull!9990) mapDefault!33376)) b!955288))

(assert (= start!81904 b!955295))

(declare-fun m!886825 () Bool)

(assert (=> b!955294 m!886825))

(assert (=> b!955294 m!886825))

(declare-fun m!886827 () Bool)

(assert (=> b!955294 m!886827))

(declare-fun m!886829 () Bool)

(assert (=> b!955291 m!886829))

(assert (=> b!955291 m!886825))

(assert (=> b!955291 m!886829))

(assert (=> b!955291 m!886825))

(declare-fun m!886831 () Bool)

(assert (=> b!955291 m!886831))

(declare-fun m!886833 () Bool)

(assert (=> mapNonEmpty!33376 m!886833))

(declare-fun m!886835 () Bool)

(assert (=> b!955287 m!886835))

(declare-fun m!886837 () Bool)

(assert (=> b!955293 m!886837))

(assert (=> b!955293 m!886825))

(assert (=> b!955293 m!886837))

(assert (=> b!955293 m!886825))

(declare-fun m!886839 () Bool)

(assert (=> b!955293 m!886839))

(declare-fun m!886841 () Bool)

(assert (=> b!955293 m!886841))

(declare-fun m!886843 () Bool)

(assert (=> b!955289 m!886843))

(declare-fun m!886845 () Bool)

(assert (=> start!81904 m!886845))

(declare-fun m!886847 () Bool)

(assert (=> start!81904 m!886847))

(declare-fun m!886849 () Bool)

(assert (=> start!81904 m!886849))

(check-sat (not b!955291) (not b!955293) (not start!81904) tp_is_empty!20943 (not b!955294) b_and!29885 (not b!955287) (not b!955289) (not mapNonEmpty!33376) (not b_next!18399))
(check-sat b_and!29885 (not b_next!18399))
