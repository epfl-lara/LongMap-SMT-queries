; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41698 () Bool)

(assert start!41698)

(declare-fun b_free!11337 () Bool)

(declare-fun b_next!11337 () Bool)

(assert (=> start!41698 (= b_free!11337 (not b_next!11337))))

(declare-fun tp!40014 () Bool)

(declare-fun b_and!19693 () Bool)

(assert (=> start!41698 (= tp!40014 b_and!19693)))

(declare-fun res!278302 () Bool)

(declare-fun e!272110 () Bool)

(assert (=> start!41698 (=> (not res!278302) (not e!272110))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41698 (= res!278302 (validMask!0 mask!1365))))

(assert (=> start!41698 e!272110))

(declare-fun tp_is_empty!12765 () Bool)

(assert (=> start!41698 tp_is_empty!12765))

(assert (=> start!41698 tp!40014))

(assert (=> start!41698 true))

(declare-datatypes ((array!29311 0))(
  ( (array!29312 (arr!14085 (Array (_ BitVec 32) (_ BitVec 64))) (size!14437 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29311)

(declare-fun array_inv!10176 (array!29311) Bool)

(assert (=> start!41698 (array_inv!10176 _keys!1025)))

(declare-datatypes ((V!18125 0))(
  ( (V!18126 (val!6427 Int)) )
))
(declare-datatypes ((ValueCell!6039 0))(
  ( (ValueCellFull!6039 (v!8714 V!18125)) (EmptyCell!6039) )
))
(declare-datatypes ((array!29313 0))(
  ( (array!29314 (arr!14086 (Array (_ BitVec 32) ValueCell!6039)) (size!14438 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29313)

(declare-fun e!272107 () Bool)

(declare-fun array_inv!10177 (array!29313) Bool)

(assert (=> start!41698 (and (array_inv!10177 _values!833) e!272107)))

(declare-fun b!465578 () Bool)

(declare-fun e!272109 () Bool)

(assert (=> b!465578 (= e!272109 tp_is_empty!12765)))

(declare-fun b!465579 () Bool)

(declare-fun res!278299 () Bool)

(assert (=> b!465579 (=> (not res!278299) (not e!272110))))

(declare-datatypes ((List!8513 0))(
  ( (Nil!8510) (Cons!8509 (h!9365 (_ BitVec 64)) (t!14463 List!8513)) )
))
(declare-fun arrayNoDuplicates!0 (array!29311 (_ BitVec 32) List!8513) Bool)

(assert (=> b!465579 (= res!278299 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8510))))

(declare-fun b!465580 () Bool)

(declare-fun e!272106 () Bool)

(assert (=> b!465580 (= e!272110 (not e!272106))))

(declare-fun res!278298 () Bool)

(assert (=> b!465580 (=> res!278298 e!272106)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465580 (= res!278298 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8420 0))(
  ( (tuple2!8421 (_1!4221 (_ BitVec 64)) (_2!4221 V!18125)) )
))
(declare-datatypes ((List!8514 0))(
  ( (Nil!8511) (Cons!8510 (h!9366 tuple2!8420) (t!14464 List!8514)) )
))
(declare-datatypes ((ListLongMap!7333 0))(
  ( (ListLongMap!7334 (toList!3682 List!8514)) )
))
(declare-fun lt!210250 () ListLongMap!7333)

(declare-fun lt!210246 () ListLongMap!7333)

(assert (=> b!465580 (= lt!210250 lt!210246)))

(declare-fun minValueBefore!38 () V!18125)

(declare-fun zeroValue!794 () V!18125)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18125)

(declare-datatypes ((Unit!13532 0))(
  ( (Unit!13533) )
))
(declare-fun lt!210249 () Unit!13532)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!42 (array!29311 array!29313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18125 V!18125 V!18125 V!18125 (_ BitVec 32) Int) Unit!13532)

(assert (=> b!465580 (= lt!210249 (lemmaNoChangeToArrayThenSameMapNoExtras!42 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1862 (array!29311 array!29313 (_ BitVec 32) (_ BitVec 32) V!18125 V!18125 (_ BitVec 32) Int) ListLongMap!7333)

(assert (=> b!465580 (= lt!210246 (getCurrentListMapNoExtraKeys!1862 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465580 (= lt!210250 (getCurrentListMapNoExtraKeys!1862 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20830 () Bool)

(declare-fun mapRes!20830 () Bool)

(assert (=> mapIsEmpty!20830 mapRes!20830))

(declare-fun b!465581 () Bool)

(declare-fun e!272108 () Bool)

(assert (=> b!465581 (= e!272108 tp_is_empty!12765)))

(declare-fun b!465582 () Bool)

(assert (=> b!465582 (= e!272107 (and e!272109 mapRes!20830))))

(declare-fun condMapEmpty!20830 () Bool)

(declare-fun mapDefault!20830 () ValueCell!6039)

(assert (=> b!465582 (= condMapEmpty!20830 (= (arr!14086 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6039)) mapDefault!20830)))))

(declare-fun b!465583 () Bool)

(declare-fun res!278301 () Bool)

(assert (=> b!465583 (=> (not res!278301) (not e!272110))))

(assert (=> b!465583 (= res!278301 (and (= (size!14438 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14437 _keys!1025) (size!14438 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465584 () Bool)

(declare-fun res!278300 () Bool)

(assert (=> b!465584 (=> (not res!278300) (not e!272110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29311 (_ BitVec 32)) Bool)

(assert (=> b!465584 (= res!278300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20830 () Bool)

(declare-fun tp!40015 () Bool)

(assert (=> mapNonEmpty!20830 (= mapRes!20830 (and tp!40015 e!272108))))

(declare-fun mapValue!20830 () ValueCell!6039)

(declare-fun mapRest!20830 () (Array (_ BitVec 32) ValueCell!6039))

(declare-fun mapKey!20830 () (_ BitVec 32))

(assert (=> mapNonEmpty!20830 (= (arr!14086 _values!833) (store mapRest!20830 mapKey!20830 mapValue!20830))))

(declare-fun b!465585 () Bool)

(assert (=> b!465585 (= e!272106 true)))

(declare-fun lt!210248 () ListLongMap!7333)

(declare-fun getCurrentListMap!2137 (array!29311 array!29313 (_ BitVec 32) (_ BitVec 32) V!18125 V!18125 (_ BitVec 32) Int) ListLongMap!7333)

(assert (=> b!465585 (= lt!210248 (getCurrentListMap!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210247 () ListLongMap!7333)

(declare-fun +!1643 (ListLongMap!7333 tuple2!8420) ListLongMap!7333)

(assert (=> b!465585 (= lt!210247 (+!1643 (getCurrentListMap!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8421 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and start!41698 res!278302) b!465583))

(assert (= (and b!465583 res!278301) b!465584))

(assert (= (and b!465584 res!278300) b!465579))

(assert (= (and b!465579 res!278299) b!465580))

(assert (= (and b!465580 (not res!278298)) b!465585))

(assert (= (and b!465582 condMapEmpty!20830) mapIsEmpty!20830))

(assert (= (and b!465582 (not condMapEmpty!20830)) mapNonEmpty!20830))

(get-info :version)

(assert (= (and mapNonEmpty!20830 ((_ is ValueCellFull!6039) mapValue!20830)) b!465581))

(assert (= (and b!465582 ((_ is ValueCellFull!6039) mapDefault!20830)) b!465578))

(assert (= start!41698 b!465582))

(declare-fun m!447809 () Bool)

(assert (=> b!465585 m!447809))

(declare-fun m!447811 () Bool)

(assert (=> b!465585 m!447811))

(assert (=> b!465585 m!447811))

(declare-fun m!447813 () Bool)

(assert (=> b!465585 m!447813))

(declare-fun m!447815 () Bool)

(assert (=> start!41698 m!447815))

(declare-fun m!447817 () Bool)

(assert (=> start!41698 m!447817))

(declare-fun m!447819 () Bool)

(assert (=> start!41698 m!447819))

(declare-fun m!447821 () Bool)

(assert (=> b!465584 m!447821))

(declare-fun m!447823 () Bool)

(assert (=> b!465580 m!447823))

(declare-fun m!447825 () Bool)

(assert (=> b!465580 m!447825))

(declare-fun m!447827 () Bool)

(assert (=> b!465580 m!447827))

(declare-fun m!447829 () Bool)

(assert (=> b!465579 m!447829))

(declare-fun m!447831 () Bool)

(assert (=> mapNonEmpty!20830 m!447831))

(check-sat tp_is_empty!12765 (not b!465579) (not b!465584) (not b!465580) (not start!41698) b_and!19693 (not mapNonEmpty!20830) (not b!465585) (not b_next!11337))
(check-sat b_and!19693 (not b_next!11337))
