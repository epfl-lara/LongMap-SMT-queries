; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42128 () Bool)

(assert start!42128)

(declare-fun b_free!11661 () Bool)

(declare-fun b_next!11661 () Bool)

(assert (=> start!42128 (= b_free!11661 (not b_next!11661))))

(declare-fun tp!41005 () Bool)

(declare-fun b_and!20083 () Bool)

(assert (=> start!42128 (= tp!41005 b_and!20083)))

(declare-fun b!470321 () Bool)

(declare-fun res!281034 () Bool)

(declare-fun e!275513 () Bool)

(assert (=> b!470321 (=> (not res!281034) (not e!275513))))

(declare-datatypes ((array!29949 0))(
  ( (array!29950 (arr!14398 (Array (_ BitVec 32) (_ BitVec 64))) (size!14750 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29949)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29949 (_ BitVec 32)) Bool)

(assert (=> b!470321 (= res!281034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21334 () Bool)

(declare-fun mapRes!21334 () Bool)

(declare-fun tp!41004 () Bool)

(declare-fun e!275511 () Bool)

(assert (=> mapNonEmpty!21334 (= mapRes!21334 (and tp!41004 e!275511))))

(declare-datatypes ((V!18557 0))(
  ( (V!18558 (val!6589 Int)) )
))
(declare-datatypes ((ValueCell!6201 0))(
  ( (ValueCellFull!6201 (v!8880 V!18557)) (EmptyCell!6201) )
))
(declare-fun mapRest!21334 () (Array (_ BitVec 32) ValueCell!6201))

(declare-datatypes ((array!29951 0))(
  ( (array!29952 (arr!14399 (Array (_ BitVec 32) ValueCell!6201)) (size!14751 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29951)

(declare-fun mapValue!21334 () ValueCell!6201)

(declare-fun mapKey!21334 () (_ BitVec 32))

(assert (=> mapNonEmpty!21334 (= (arr!14399 _values!833) (store mapRest!21334 mapKey!21334 mapValue!21334))))

(declare-fun b!470322 () Bool)

(declare-fun res!281033 () Bool)

(assert (=> b!470322 (=> (not res!281033) (not e!275513))))

(declare-datatypes ((List!8756 0))(
  ( (Nil!8753) (Cons!8752 (h!9608 (_ BitVec 64)) (t!14718 List!8756)) )
))
(declare-fun arrayNoDuplicates!0 (array!29949 (_ BitVec 32) List!8756) Bool)

(assert (=> b!470322 (= res!281033 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8753))))

(declare-fun res!281032 () Bool)

(assert (=> start!42128 (=> (not res!281032) (not e!275513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42128 (= res!281032 (validMask!0 mask!1365))))

(assert (=> start!42128 e!275513))

(declare-fun tp_is_empty!13089 () Bool)

(assert (=> start!42128 tp_is_empty!13089))

(assert (=> start!42128 tp!41005))

(assert (=> start!42128 true))

(declare-fun array_inv!10388 (array!29949) Bool)

(assert (=> start!42128 (array_inv!10388 _keys!1025)))

(declare-fun e!275515 () Bool)

(declare-fun array_inv!10389 (array!29951) Bool)

(assert (=> start!42128 (and (array_inv!10389 _values!833) e!275515)))

(declare-fun b!470323 () Bool)

(assert (=> b!470323 (= e!275511 tp_is_empty!13089)))

(declare-fun b!470324 () Bool)

(declare-fun e!275514 () Bool)

(assert (=> b!470324 (= e!275514 tp_is_empty!13089)))

(declare-fun b!470325 () Bool)

(assert (=> b!470325 (= e!275515 (and e!275514 mapRes!21334))))

(declare-fun condMapEmpty!21334 () Bool)

(declare-fun mapDefault!21334 () ValueCell!6201)

(assert (=> b!470325 (= condMapEmpty!21334 (= (arr!14399 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6201)) mapDefault!21334)))))

(declare-fun b!470326 () Bool)

(assert (=> b!470326 (= e!275513 (not true))))

(declare-datatypes ((tuple2!8676 0))(
  ( (tuple2!8677 (_1!4349 (_ BitVec 64)) (_2!4349 V!18557)) )
))
(declare-datatypes ((List!8757 0))(
  ( (Nil!8754) (Cons!8753 (h!9609 tuple2!8676) (t!14719 List!8757)) )
))
(declare-datatypes ((ListLongMap!7589 0))(
  ( (ListLongMap!7590 (toList!3810 List!8757)) )
))
(declare-fun lt!213403 () ListLongMap!7589)

(declare-fun lt!213404 () ListLongMap!7589)

(assert (=> b!470326 (= lt!213403 lt!213404)))

(declare-fun minValueBefore!38 () V!18557)

(declare-fun zeroValue!794 () V!18557)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13779 0))(
  ( (Unit!13780) )
))
(declare-fun lt!213405 () Unit!13779)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18557)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!153 (array!29949 array!29951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18557 V!18557 V!18557 V!18557 (_ BitVec 32) Int) Unit!13779)

(assert (=> b!470326 (= lt!213405 (lemmaNoChangeToArrayThenSameMapNoExtras!153 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1973 (array!29949 array!29951 (_ BitVec 32) (_ BitVec 32) V!18557 V!18557 (_ BitVec 32) Int) ListLongMap!7589)

(assert (=> b!470326 (= lt!213404 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470326 (= lt!213403 (getCurrentListMapNoExtraKeys!1973 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470327 () Bool)

(declare-fun res!281031 () Bool)

(assert (=> b!470327 (=> (not res!281031) (not e!275513))))

(assert (=> b!470327 (= res!281031 (and (= (size!14751 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14750 _keys!1025) (size!14751 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21334 () Bool)

(assert (=> mapIsEmpty!21334 mapRes!21334))

(assert (= (and start!42128 res!281032) b!470327))

(assert (= (and b!470327 res!281031) b!470321))

(assert (= (and b!470321 res!281034) b!470322))

(assert (= (and b!470322 res!281033) b!470326))

(assert (= (and b!470325 condMapEmpty!21334) mapIsEmpty!21334))

(assert (= (and b!470325 (not condMapEmpty!21334)) mapNonEmpty!21334))

(get-info :version)

(assert (= (and mapNonEmpty!21334 ((_ is ValueCellFull!6201) mapValue!21334)) b!470323))

(assert (= (and b!470325 ((_ is ValueCellFull!6201) mapDefault!21334)) b!470324))

(assert (= start!42128 b!470325))

(declare-fun m!452627 () Bool)

(assert (=> mapNonEmpty!21334 m!452627))

(declare-fun m!452629 () Bool)

(assert (=> b!470326 m!452629))

(declare-fun m!452631 () Bool)

(assert (=> b!470326 m!452631))

(declare-fun m!452633 () Bool)

(assert (=> b!470326 m!452633))

(declare-fun m!452635 () Bool)

(assert (=> b!470321 m!452635))

(declare-fun m!452637 () Bool)

(assert (=> start!42128 m!452637))

(declare-fun m!452639 () Bool)

(assert (=> start!42128 m!452639))

(declare-fun m!452641 () Bool)

(assert (=> start!42128 m!452641))

(declare-fun m!452643 () Bool)

(assert (=> b!470322 m!452643))

(check-sat (not b!470326) (not mapNonEmpty!21334) (not b!470321) (not b!470322) b_and!20083 tp_is_empty!13089 (not b_next!11661) (not start!42128))
(check-sat b_and!20083 (not b_next!11661))
