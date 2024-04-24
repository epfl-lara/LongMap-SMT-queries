; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81986 () Bool)

(assert start!81986)

(declare-fun b_free!18313 () Bool)

(declare-fun b_next!18313 () Bool)

(assert (=> start!81986 (= b_free!18313 (not b_next!18313))))

(declare-fun tp!63640 () Bool)

(declare-fun b_and!29809 () Bool)

(assert (=> start!81986 (= tp!63640 b_and!29809)))

(declare-fun b!955006 () Bool)

(declare-fun res!639258 () Bool)

(declare-fun e!538118 () Bool)

(assert (=> b!955006 (=> (not res!639258) (not e!538118))))

(declare-datatypes ((array!57874 0))(
  ( (array!57875 (arr!27812 (Array (_ BitVec 32) (_ BitVec 64))) (size!28292 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57874)

(declare-datatypes ((List!19367 0))(
  ( (Nil!19364) (Cons!19363 (h!20531 (_ BitVec 64)) (t!27720 List!19367)) )
))
(declare-fun arrayNoDuplicates!0 (array!57874 (_ BitVec 32) List!19367) Bool)

(assert (=> b!955006 (= res!639258 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19364))))

(declare-fun mapIsEmpty!33247 () Bool)

(declare-fun mapRes!33247 () Bool)

(assert (=> mapIsEmpty!33247 mapRes!33247))

(declare-fun b!955007 () Bool)

(declare-fun res!639256 () Bool)

(assert (=> b!955007 (=> (not res!639256) (not e!538118))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32793 0))(
  ( (V!32794 (val!10479 Int)) )
))
(declare-datatypes ((ValueCell!9947 0))(
  ( (ValueCellFull!9947 (v!13031 V!32793)) (EmptyCell!9947) )
))
(declare-datatypes ((array!57876 0))(
  ( (array!57877 (arr!27813 (Array (_ BitVec 32) ValueCell!9947)) (size!28293 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57876)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955007 (= res!639256 (and (= (size!28293 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28292 _keys!1441) (size!28293 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33247 () Bool)

(declare-fun tp!63639 () Bool)

(declare-fun e!538117 () Bool)

(assert (=> mapNonEmpty!33247 (= mapRes!33247 (and tp!63639 e!538117))))

(declare-fun mapValue!33247 () ValueCell!9947)

(declare-fun mapRest!33247 () (Array (_ BitVec 32) ValueCell!9947))

(declare-fun mapKey!33247 () (_ BitVec 32))

(assert (=> mapNonEmpty!33247 (= (arr!27813 _values!1197) (store mapRest!33247 mapKey!33247 mapValue!33247))))

(declare-fun b!955009 () Bool)

(declare-fun e!538116 () Bool)

(declare-fun e!538120 () Bool)

(assert (=> b!955009 (= e!538116 (and e!538120 mapRes!33247))))

(declare-fun condMapEmpty!33247 () Bool)

(declare-fun mapDefault!33247 () ValueCell!9947)

(assert (=> b!955009 (= condMapEmpty!33247 (= (arr!27813 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9947)) mapDefault!33247)))))

(declare-fun b!955010 () Bool)

(declare-fun res!639257 () Bool)

(assert (=> b!955010 (=> (not res!639257) (not e!538118))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!955010 (= res!639257 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28292 _keys!1441))))))

(declare-fun b!955011 () Bool)

(declare-fun res!639255 () Bool)

(assert (=> b!955011 (=> (not res!639255) (not e!538118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57874 (_ BitVec 32)) Bool)

(assert (=> b!955011 (= res!639255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639259 () Bool)

(assert (=> start!81986 (=> (not res!639259) (not e!538118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81986 (= res!639259 (validMask!0 mask!1823))))

(assert (=> start!81986 e!538118))

(assert (=> start!81986 true))

(declare-fun tp_is_empty!20857 () Bool)

(assert (=> start!81986 tp_is_empty!20857))

(declare-fun array_inv!21663 (array!57874) Bool)

(assert (=> start!81986 (array_inv!21663 _keys!1441)))

(declare-fun array_inv!21664 (array!57876) Bool)

(assert (=> start!81986 (and (array_inv!21664 _values!1197) e!538116)))

(assert (=> start!81986 tp!63640))

(declare-fun b!955008 () Bool)

(declare-fun res!639260 () Bool)

(assert (=> b!955008 (=> (not res!639260) (not e!538118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955008 (= res!639260 (validKeyInArray!0 (select (arr!27812 _keys!1441) i!735)))))

(declare-fun b!955012 () Bool)

(assert (=> b!955012 (= e!538120 tp_is_empty!20857)))

(declare-fun b!955013 () Bool)

(assert (=> b!955013 (= e!538117 tp_is_empty!20857)))

(declare-fun b!955014 () Bool)

(assert (=> b!955014 (= e!538118 false)))

(declare-fun zeroValue!1139 () V!32793)

(declare-fun minValue!1139 () V!32793)

(declare-fun defaultEntry!1205 () Int)

(declare-fun lt!430224 () Bool)

(declare-datatypes ((tuple2!13578 0))(
  ( (tuple2!13579 (_1!6800 (_ BitVec 64)) (_2!6800 V!32793)) )
))
(declare-datatypes ((List!19368 0))(
  ( (Nil!19365) (Cons!19364 (h!20532 tuple2!13578) (t!27721 List!19368)) )
))
(declare-datatypes ((ListLongMap!12277 0))(
  ( (ListLongMap!12278 (toList!6154 List!19368)) )
))
(declare-fun contains!5263 (ListLongMap!12277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3387 (array!57874 array!57876 (_ BitVec 32) (_ BitVec 32) V!32793 V!32793 (_ BitVec 32) Int) ListLongMap!12277)

(assert (=> b!955014 (= lt!430224 (contains!5263 (getCurrentListMap!3387 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27812 _keys!1441) i!735)))))

(assert (= (and start!81986 res!639259) b!955007))

(assert (= (and b!955007 res!639256) b!955011))

(assert (= (and b!955011 res!639255) b!955006))

(assert (= (and b!955006 res!639258) b!955010))

(assert (= (and b!955010 res!639257) b!955008))

(assert (= (and b!955008 res!639260) b!955014))

(assert (= (and b!955009 condMapEmpty!33247) mapIsEmpty!33247))

(assert (= (and b!955009 (not condMapEmpty!33247)) mapNonEmpty!33247))

(get-info :version)

(assert (= (and mapNonEmpty!33247 ((_ is ValueCellFull!9947) mapValue!33247)) b!955013))

(assert (= (and b!955009 ((_ is ValueCellFull!9947) mapDefault!33247)) b!955012))

(assert (= start!81986 b!955009))

(declare-fun m!887217 () Bool)

(assert (=> b!955006 m!887217))

(declare-fun m!887219 () Bool)

(assert (=> start!81986 m!887219))

(declare-fun m!887221 () Bool)

(assert (=> start!81986 m!887221))

(declare-fun m!887223 () Bool)

(assert (=> start!81986 m!887223))

(declare-fun m!887225 () Bool)

(assert (=> b!955008 m!887225))

(assert (=> b!955008 m!887225))

(declare-fun m!887227 () Bool)

(assert (=> b!955008 m!887227))

(declare-fun m!887229 () Bool)

(assert (=> b!955014 m!887229))

(assert (=> b!955014 m!887225))

(assert (=> b!955014 m!887229))

(assert (=> b!955014 m!887225))

(declare-fun m!887231 () Bool)

(assert (=> b!955014 m!887231))

(declare-fun m!887233 () Bool)

(assert (=> b!955011 m!887233))

(declare-fun m!887235 () Bool)

(assert (=> mapNonEmpty!33247 m!887235))

(check-sat b_and!29809 (not b!955006) (not b!955011) (not start!81986) (not mapNonEmpty!33247) tp_is_empty!20857 (not b!955014) (not b_next!18313) (not b!955008))
(check-sat b_and!29809 (not b_next!18313))
