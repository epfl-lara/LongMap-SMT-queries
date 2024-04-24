; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82082 () Bool)

(assert start!82082)

(declare-fun b_free!18409 () Bool)

(declare-fun b_next!18409 () Bool)

(assert (=> start!82082 (= b_free!18409 (not b_next!18409))))

(declare-fun tp!63928 () Bool)

(declare-fun b_and!29905 () Bool)

(assert (=> start!82082 (= tp!63928 b_and!29905)))

(declare-fun res!640160 () Bool)

(declare-fun e!538837 () Bool)

(assert (=> start!82082 (=> (not res!640160) (not e!538837))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82082 (= res!640160 (validMask!0 mask!1823))))

(assert (=> start!82082 e!538837))

(assert (=> start!82082 true))

(declare-fun tp_is_empty!20953 () Bool)

(assert (=> start!82082 tp_is_empty!20953))

(declare-datatypes ((array!58058 0))(
  ( (array!58059 (arr!27904 (Array (_ BitVec 32) (_ BitVec 64))) (size!28384 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58058)

(declare-fun array_inv!21731 (array!58058) Bool)

(assert (=> start!82082 (array_inv!21731 _keys!1441)))

(declare-datatypes ((V!32921 0))(
  ( (V!32922 (val!10527 Int)) )
))
(declare-datatypes ((ValueCell!9995 0))(
  ( (ValueCellFull!9995 (v!13079 V!32921)) (EmptyCell!9995) )
))
(declare-datatypes ((array!58060 0))(
  ( (array!58061 (arr!27905 (Array (_ BitVec 32) ValueCell!9995)) (size!28385 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58060)

(declare-fun e!538836 () Bool)

(declare-fun array_inv!21732 (array!58060) Bool)

(assert (=> start!82082 (and (array_inv!21732 _values!1197) e!538836)))

(assert (=> start!82082 tp!63928))

(declare-fun b!956340 () Bool)

(declare-fun e!538838 () Bool)

(assert (=> b!956340 (= e!538838 tp_is_empty!20953)))

(declare-fun b!956341 () Bool)

(declare-fun res!640158 () Bool)

(assert (=> b!956341 (=> (not res!640158) (not e!538837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58058 (_ BitVec 32)) Bool)

(assert (=> b!956341 (= res!640158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956342 () Bool)

(declare-fun res!640162 () Bool)

(assert (=> b!956342 (=> (not res!640162) (not e!538837))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!956342 (= res!640162 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28384 _keys!1441))))))

(declare-fun b!956343 () Bool)

(declare-fun e!538839 () Bool)

(assert (=> b!956343 (= e!538839 tp_is_empty!20953)))

(declare-fun b!956344 () Bool)

(declare-fun res!640163 () Bool)

(assert (=> b!956344 (=> (not res!640163) (not e!538837))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956344 (= res!640163 (and (= (size!28385 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28384 _keys!1441) (size!28385 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956345 () Bool)

(declare-fun mapRes!33391 () Bool)

(assert (=> b!956345 (= e!538836 (and e!538839 mapRes!33391))))

(declare-fun condMapEmpty!33391 () Bool)

(declare-fun mapDefault!33391 () ValueCell!9995)

(assert (=> b!956345 (= condMapEmpty!33391 (= (arr!27905 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9995)) mapDefault!33391)))))

(declare-fun b!956346 () Bool)

(assert (=> b!956346 (= e!538837 (not true))))

(declare-fun zeroValue!1139 () V!32921)

(declare-fun minValue!1139 () V!32921)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13656 0))(
  ( (tuple2!13657 (_1!6839 (_ BitVec 64)) (_2!6839 V!32921)) )
))
(declare-datatypes ((List!19438 0))(
  ( (Nil!19435) (Cons!19434 (h!20602 tuple2!13656) (t!27791 List!19438)) )
))
(declare-datatypes ((ListLongMap!12355 0))(
  ( (ListLongMap!12356 (toList!6193 List!19438)) )
))
(declare-fun contains!5302 (ListLongMap!12355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3426 (array!58058 array!58060 (_ BitVec 32) (_ BitVec 32) V!32921 V!32921 (_ BitVec 32) Int) ListLongMap!12355)

(assert (=> b!956346 (contains!5302 (getCurrentListMap!3426 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27904 _keys!1441) i!735))))

(declare-datatypes ((Unit!32088 0))(
  ( (Unit!32089) )
))
(declare-fun lt!430368 () Unit!32088)

(declare-fun lemmaInListMapFromThenFromZero!9 (array!58058 array!58060 (_ BitVec 32) (_ BitVec 32) V!32921 V!32921 (_ BitVec 32) (_ BitVec 32) Int) Unit!32088)

(assert (=> b!956346 (= lt!430368 (lemmaInListMapFromThenFromZero!9 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956347 () Bool)

(declare-fun res!640159 () Bool)

(assert (=> b!956347 (=> (not res!640159) (not e!538837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956347 (= res!640159 (validKeyInArray!0 (select (arr!27904 _keys!1441) i!735)))))

(declare-fun b!956348 () Bool)

(declare-fun res!640157 () Bool)

(assert (=> b!956348 (=> (not res!640157) (not e!538837))))

(assert (=> b!956348 (= res!640157 (contains!5302 (getCurrentListMap!3426 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27904 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33391 () Bool)

(assert (=> mapIsEmpty!33391 mapRes!33391))

(declare-fun b!956349 () Bool)

(declare-fun res!640161 () Bool)

(assert (=> b!956349 (=> (not res!640161) (not e!538837))))

(declare-datatypes ((List!19439 0))(
  ( (Nil!19436) (Cons!19435 (h!20603 (_ BitVec 64)) (t!27792 List!19439)) )
))
(declare-fun arrayNoDuplicates!0 (array!58058 (_ BitVec 32) List!19439) Bool)

(assert (=> b!956349 (= res!640161 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19436))))

(declare-fun mapNonEmpty!33391 () Bool)

(declare-fun tp!63927 () Bool)

(assert (=> mapNonEmpty!33391 (= mapRes!33391 (and tp!63927 e!538838))))

(declare-fun mapKey!33391 () (_ BitVec 32))

(declare-fun mapRest!33391 () (Array (_ BitVec 32) ValueCell!9995))

(declare-fun mapValue!33391 () ValueCell!9995)

(assert (=> mapNonEmpty!33391 (= (arr!27905 _values!1197) (store mapRest!33391 mapKey!33391 mapValue!33391))))

(assert (= (and start!82082 res!640160) b!956344))

(assert (= (and b!956344 res!640163) b!956341))

(assert (= (and b!956341 res!640158) b!956349))

(assert (= (and b!956349 res!640161) b!956342))

(assert (= (and b!956342 res!640162) b!956347))

(assert (= (and b!956347 res!640159) b!956348))

(assert (= (and b!956348 res!640157) b!956346))

(assert (= (and b!956345 condMapEmpty!33391) mapIsEmpty!33391))

(assert (= (and b!956345 (not condMapEmpty!33391)) mapNonEmpty!33391))

(get-info :version)

(assert (= (and mapNonEmpty!33391 ((_ is ValueCellFull!9995) mapValue!33391)) b!956340))

(assert (= (and b!956345 ((_ is ValueCellFull!9995) mapDefault!33391)) b!956343))

(assert (= start!82082 b!956345))

(declare-fun m!888249 () Bool)

(assert (=> start!82082 m!888249))

(declare-fun m!888251 () Bool)

(assert (=> start!82082 m!888251))

(declare-fun m!888253 () Bool)

(assert (=> start!82082 m!888253))

(declare-fun m!888255 () Bool)

(assert (=> b!956347 m!888255))

(assert (=> b!956347 m!888255))

(declare-fun m!888257 () Bool)

(assert (=> b!956347 m!888257))

(declare-fun m!888259 () Bool)

(assert (=> b!956341 m!888259))

(declare-fun m!888261 () Bool)

(assert (=> b!956346 m!888261))

(assert (=> b!956346 m!888255))

(assert (=> b!956346 m!888261))

(assert (=> b!956346 m!888255))

(declare-fun m!888263 () Bool)

(assert (=> b!956346 m!888263))

(declare-fun m!888265 () Bool)

(assert (=> b!956346 m!888265))

(declare-fun m!888267 () Bool)

(assert (=> b!956349 m!888267))

(declare-fun m!888269 () Bool)

(assert (=> mapNonEmpty!33391 m!888269))

(declare-fun m!888271 () Bool)

(assert (=> b!956348 m!888271))

(assert (=> b!956348 m!888255))

(assert (=> b!956348 m!888271))

(assert (=> b!956348 m!888255))

(declare-fun m!888273 () Bool)

(assert (=> b!956348 m!888273))

(check-sat (not b!956348) (not b!956341) (not mapNonEmpty!33391) (not b!956347) tp_is_empty!20953 (not start!82082) (not b!956349) (not b!956346) (not b_next!18409) b_and!29905)
(check-sat b_and!29905 (not b_next!18409))
