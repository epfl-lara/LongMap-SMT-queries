; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42344 () Bool)

(assert start!42344)

(declare-fun b_free!11835 () Bool)

(declare-fun b_next!11835 () Bool)

(assert (=> start!42344 (= b_free!11835 (not b_next!11835))))

(declare-fun tp!41536 () Bool)

(declare-fun b_and!20281 () Bool)

(assert (=> start!42344 (= tp!41536 b_and!20281)))

(declare-fun b!472444 () Bool)

(declare-fun e!277024 () Bool)

(assert (=> b!472444 (= e!277024 true)))

(declare-datatypes ((V!18789 0))(
  ( (V!18790 (val!6676 Int)) )
))
(declare-fun minValueBefore!38 () V!18789)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30283 0))(
  ( (array!30284 (arr!14562 (Array (_ BitVec 32) (_ BitVec 64))) (size!14914 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30283)

(declare-datatypes ((ValueCell!6288 0))(
  ( (ValueCellFull!6288 (v!8967 V!18789)) (EmptyCell!6288) )
))
(declare-datatypes ((array!30285 0))(
  ( (array!30286 (arr!14563 (Array (_ BitVec 32) ValueCell!6288)) (size!14915 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30285)

(declare-fun zeroValue!794 () V!18789)

(declare-datatypes ((tuple2!8794 0))(
  ( (tuple2!8795 (_1!4408 (_ BitVec 64)) (_2!4408 V!18789)) )
))
(declare-datatypes ((List!8875 0))(
  ( (Nil!8872) (Cons!8871 (h!9727 tuple2!8794) (t!14843 List!8875)) )
))
(declare-datatypes ((ListLongMap!7707 0))(
  ( (ListLongMap!7708 (toList!3869 List!8875)) )
))
(declare-fun lt!214350 () ListLongMap!7707)

(declare-fun getCurrentListMap!2239 (array!30283 array!30285 (_ BitVec 32) (_ BitVec 32) V!18789 V!18789 (_ BitVec 32) Int) ListLongMap!7707)

(assert (=> b!472444 (= lt!214350 (getCurrentListMap!2239 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472445 () Bool)

(declare-fun e!277023 () Bool)

(declare-fun tp_is_empty!13263 () Bool)

(assert (=> b!472445 (= e!277023 tp_is_empty!13263)))

(declare-fun b!472446 () Bool)

(declare-fun res!282211 () Bool)

(declare-fun e!277022 () Bool)

(assert (=> b!472446 (=> (not res!282211) (not e!277022))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472446 (= res!282211 (and (= (size!14915 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14914 _keys!1025) (size!14915 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472448 () Bool)

(declare-fun e!277026 () Bool)

(declare-fun e!277025 () Bool)

(declare-fun mapRes!21604 () Bool)

(assert (=> b!472448 (= e!277026 (and e!277025 mapRes!21604))))

(declare-fun condMapEmpty!21604 () Bool)

(declare-fun mapDefault!21604 () ValueCell!6288)

(assert (=> b!472448 (= condMapEmpty!21604 (= (arr!14563 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6288)) mapDefault!21604)))))

(declare-fun mapNonEmpty!21604 () Bool)

(declare-fun tp!41535 () Bool)

(assert (=> mapNonEmpty!21604 (= mapRes!21604 (and tp!41535 e!277023))))

(declare-fun mapRest!21604 () (Array (_ BitVec 32) ValueCell!6288))

(declare-fun mapValue!21604 () ValueCell!6288)

(declare-fun mapKey!21604 () (_ BitVec 32))

(assert (=> mapNonEmpty!21604 (= (arr!14563 _values!833) (store mapRest!21604 mapKey!21604 mapValue!21604))))

(declare-fun b!472449 () Bool)

(assert (=> b!472449 (= e!277022 (not e!277024))))

(declare-fun res!282209 () Bool)

(assert (=> b!472449 (=> res!282209 e!277024)))

(assert (=> b!472449 (= res!282209 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214349 () ListLongMap!7707)

(declare-fun lt!214348 () ListLongMap!7707)

(assert (=> b!472449 (= lt!214349 lt!214348)))

(declare-datatypes ((Unit!13895 0))(
  ( (Unit!13896) )
))
(declare-fun lt!214347 () Unit!13895)

(declare-fun minValueAfter!38 () V!18789)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!211 (array!30283 array!30285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18789 V!18789 V!18789 V!18789 (_ BitVec 32) Int) Unit!13895)

(assert (=> b!472449 (= lt!214347 (lemmaNoChangeToArrayThenSameMapNoExtras!211 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2031 (array!30283 array!30285 (_ BitVec 32) (_ BitVec 32) V!18789 V!18789 (_ BitVec 32) Int) ListLongMap!7707)

(assert (=> b!472449 (= lt!214348 (getCurrentListMapNoExtraKeys!2031 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472449 (= lt!214349 (getCurrentListMapNoExtraKeys!2031 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21604 () Bool)

(assert (=> mapIsEmpty!21604 mapRes!21604))

(declare-fun res!282213 () Bool)

(assert (=> start!42344 (=> (not res!282213) (not e!277022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42344 (= res!282213 (validMask!0 mask!1365))))

(assert (=> start!42344 e!277022))

(assert (=> start!42344 tp_is_empty!13263))

(assert (=> start!42344 tp!41536))

(assert (=> start!42344 true))

(declare-fun array_inv!10500 (array!30283) Bool)

(assert (=> start!42344 (array_inv!10500 _keys!1025)))

(declare-fun array_inv!10501 (array!30285) Bool)

(assert (=> start!42344 (and (array_inv!10501 _values!833) e!277026)))

(declare-fun b!472447 () Bool)

(declare-fun res!282212 () Bool)

(assert (=> b!472447 (=> (not res!282212) (not e!277022))))

(declare-datatypes ((List!8876 0))(
  ( (Nil!8873) (Cons!8872 (h!9728 (_ BitVec 64)) (t!14844 List!8876)) )
))
(declare-fun arrayNoDuplicates!0 (array!30283 (_ BitVec 32) List!8876) Bool)

(assert (=> b!472447 (= res!282212 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8873))))

(declare-fun b!472450 () Bool)

(assert (=> b!472450 (= e!277025 tp_is_empty!13263)))

(declare-fun b!472451 () Bool)

(declare-fun res!282210 () Bool)

(assert (=> b!472451 (=> (not res!282210) (not e!277022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30283 (_ BitVec 32)) Bool)

(assert (=> b!472451 (= res!282210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42344 res!282213) b!472446))

(assert (= (and b!472446 res!282211) b!472451))

(assert (= (and b!472451 res!282210) b!472447))

(assert (= (and b!472447 res!282212) b!472449))

(assert (= (and b!472449 (not res!282209)) b!472444))

(assert (= (and b!472448 condMapEmpty!21604) mapIsEmpty!21604))

(assert (= (and b!472448 (not condMapEmpty!21604)) mapNonEmpty!21604))

(get-info :version)

(assert (= (and mapNonEmpty!21604 ((_ is ValueCellFull!6288) mapValue!21604)) b!472445))

(assert (= (and b!472448 ((_ is ValueCellFull!6288) mapDefault!21604)) b!472450))

(assert (= start!42344 b!472448))

(declare-fun m!454417 () Bool)

(assert (=> b!472449 m!454417))

(declare-fun m!454419 () Bool)

(assert (=> b!472449 m!454419))

(declare-fun m!454421 () Bool)

(assert (=> b!472449 m!454421))

(declare-fun m!454423 () Bool)

(assert (=> b!472444 m!454423))

(declare-fun m!454425 () Bool)

(assert (=> b!472451 m!454425))

(declare-fun m!454427 () Bool)

(assert (=> b!472447 m!454427))

(declare-fun m!454429 () Bool)

(assert (=> mapNonEmpty!21604 m!454429))

(declare-fun m!454431 () Bool)

(assert (=> start!42344 m!454431))

(declare-fun m!454433 () Bool)

(assert (=> start!42344 m!454433))

(declare-fun m!454435 () Bool)

(assert (=> start!42344 m!454435))

(check-sat tp_is_empty!13263 (not b!472444) b_and!20281 (not b_next!11835) (not b!472449) (not b!472451) (not b!472447) (not mapNonEmpty!21604) (not start!42344))
(check-sat b_and!20281 (not b_next!11835))
