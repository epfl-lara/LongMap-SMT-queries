; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41982 () Bool)

(assert start!41982)

(declare-fun b_free!11569 () Bool)

(declare-fun b_next!11569 () Bool)

(assert (=> start!41982 (= b_free!11569 (not b_next!11569))))

(declare-fun tp!40723 () Bool)

(declare-fun b_and!19941 () Bool)

(assert (=> start!41982 (= tp!40723 b_and!19941)))

(declare-fun b!468611 () Bool)

(declare-fun e!274308 () Bool)

(assert (=> b!468611 (= e!274308 true)))

(declare-datatypes ((V!18435 0))(
  ( (V!18436 (val!6543 Int)) )
))
(declare-datatypes ((tuple2!8640 0))(
  ( (tuple2!8641 (_1!4331 (_ BitVec 64)) (_2!4331 V!18435)) )
))
(declare-datatypes ((List!8712 0))(
  ( (Nil!8709) (Cons!8708 (h!9564 tuple2!8640) (t!14661 List!8712)) )
))
(declare-datatypes ((ListLongMap!7543 0))(
  ( (ListLongMap!7544 (toList!3787 List!8712)) )
))
(declare-fun lt!211999 () ListLongMap!7543)

(declare-fun lt!211993 () tuple2!8640)

(declare-fun minValueBefore!38 () V!18435)

(declare-fun +!1717 (ListLongMap!7543 tuple2!8640) ListLongMap!7543)

(assert (=> b!468611 (= (+!1717 lt!211999 lt!211993) (+!1717 (+!1717 lt!211999 (tuple2!8641 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211993))))

(declare-fun minValueAfter!38 () V!18435)

(assert (=> b!468611 (= lt!211993 (tuple2!8641 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13671 0))(
  ( (Unit!13672) )
))
(declare-fun lt!211996 () Unit!13671)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!100 (ListLongMap!7543 (_ BitVec 64) V!18435 V!18435) Unit!13671)

(assert (=> b!468611 (= lt!211996 (addSameAsAddTwiceSameKeyDiffValues!100 lt!211999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18435)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!29749 0))(
  ( (array!29750 (arr!14300 (Array (_ BitVec 32) (_ BitVec 64))) (size!14653 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29749)

(declare-datatypes ((ValueCell!6155 0))(
  ( (ValueCellFull!6155 (v!8826 V!18435)) (EmptyCell!6155) )
))
(declare-datatypes ((array!29751 0))(
  ( (array!29752 (arr!14301 (Array (_ BitVec 32) ValueCell!6155)) (size!14654 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29751)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lt!211998 () ListLongMap!7543)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2153 (array!29749 array!29751 (_ BitVec 32) (_ BitVec 32) V!18435 V!18435 (_ BitVec 32) Int) ListLongMap!7543)

(assert (=> b!468611 (= lt!211998 (getCurrentListMap!2153 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211994 () ListLongMap!7543)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468611 (= lt!211994 (getCurrentListMap!2153 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21190 () Bool)

(declare-fun mapRes!21190 () Bool)

(declare-fun tp!40722 () Bool)

(declare-fun e!274312 () Bool)

(assert (=> mapNonEmpty!21190 (= mapRes!21190 (and tp!40722 e!274312))))

(declare-fun mapValue!21190 () ValueCell!6155)

(declare-fun mapRest!21190 () (Array (_ BitVec 32) ValueCell!6155))

(declare-fun mapKey!21190 () (_ BitVec 32))

(assert (=> mapNonEmpty!21190 (= (arr!14301 _values!833) (store mapRest!21190 mapKey!21190 mapValue!21190))))

(declare-fun b!468612 () Bool)

(declare-fun res!280082 () Bool)

(declare-fun e!274310 () Bool)

(assert (=> b!468612 (=> (not res!280082) (not e!274310))))

(assert (=> b!468612 (= res!280082 (and (= (size!14654 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14653 _keys!1025) (size!14654 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468613 () Bool)

(declare-fun e!274309 () Bool)

(declare-fun tp_is_empty!12997 () Bool)

(assert (=> b!468613 (= e!274309 tp_is_empty!12997)))

(declare-fun res!280085 () Bool)

(assert (=> start!41982 (=> (not res!280085) (not e!274310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41982 (= res!280085 (validMask!0 mask!1365))))

(assert (=> start!41982 e!274310))

(assert (=> start!41982 tp_is_empty!12997))

(assert (=> start!41982 tp!40723))

(assert (=> start!41982 true))

(declare-fun array_inv!10404 (array!29749) Bool)

(assert (=> start!41982 (array_inv!10404 _keys!1025)))

(declare-fun e!274311 () Bool)

(declare-fun array_inv!10405 (array!29751) Bool)

(assert (=> start!41982 (and (array_inv!10405 _values!833) e!274311)))

(declare-fun b!468614 () Bool)

(assert (=> b!468614 (= e!274310 (not e!274308))))

(declare-fun res!280081 () Bool)

(assert (=> b!468614 (=> res!280081 e!274308)))

(assert (=> b!468614 (= res!280081 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211997 () ListLongMap!7543)

(assert (=> b!468614 (= lt!211999 lt!211997)))

(declare-fun lt!211995 () Unit!13671)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!124 (array!29749 array!29751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18435 V!18435 V!18435 V!18435 (_ BitVec 32) Int) Unit!13671)

(assert (=> b!468614 (= lt!211995 (lemmaNoChangeToArrayThenSameMapNoExtras!124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1967 (array!29749 array!29751 (_ BitVec 32) (_ BitVec 32) V!18435 V!18435 (_ BitVec 32) Int) ListLongMap!7543)

(assert (=> b!468614 (= lt!211997 (getCurrentListMapNoExtraKeys!1967 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468614 (= lt!211999 (getCurrentListMapNoExtraKeys!1967 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21190 () Bool)

(assert (=> mapIsEmpty!21190 mapRes!21190))

(declare-fun b!468615 () Bool)

(assert (=> b!468615 (= e!274311 (and e!274309 mapRes!21190))))

(declare-fun condMapEmpty!21190 () Bool)

(declare-fun mapDefault!21190 () ValueCell!6155)

(assert (=> b!468615 (= condMapEmpty!21190 (= (arr!14301 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6155)) mapDefault!21190)))))

(declare-fun b!468616 () Bool)

(declare-fun res!280083 () Bool)

(assert (=> b!468616 (=> (not res!280083) (not e!274310))))

(declare-datatypes ((List!8713 0))(
  ( (Nil!8710) (Cons!8709 (h!9565 (_ BitVec 64)) (t!14662 List!8713)) )
))
(declare-fun arrayNoDuplicates!0 (array!29749 (_ BitVec 32) List!8713) Bool)

(assert (=> b!468616 (= res!280083 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8710))))

(declare-fun b!468617 () Bool)

(declare-fun res!280084 () Bool)

(assert (=> b!468617 (=> (not res!280084) (not e!274310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29749 (_ BitVec 32)) Bool)

(assert (=> b!468617 (= res!280084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468618 () Bool)

(assert (=> b!468618 (= e!274312 tp_is_empty!12997)))

(assert (= (and start!41982 res!280085) b!468612))

(assert (= (and b!468612 res!280082) b!468617))

(assert (= (and b!468617 res!280084) b!468616))

(assert (= (and b!468616 res!280083) b!468614))

(assert (= (and b!468614 (not res!280081)) b!468611))

(assert (= (and b!468615 condMapEmpty!21190) mapIsEmpty!21190))

(assert (= (and b!468615 (not condMapEmpty!21190)) mapNonEmpty!21190))

(get-info :version)

(assert (= (and mapNonEmpty!21190 ((_ is ValueCellFull!6155) mapValue!21190)) b!468618))

(assert (= (and b!468615 ((_ is ValueCellFull!6155) mapDefault!21190)) b!468613))

(assert (= start!41982 b!468615))

(declare-fun m!450197 () Bool)

(assert (=> b!468614 m!450197))

(declare-fun m!450199 () Bool)

(assert (=> b!468614 m!450199))

(declare-fun m!450201 () Bool)

(assert (=> b!468614 m!450201))

(declare-fun m!450203 () Bool)

(assert (=> start!41982 m!450203))

(declare-fun m!450205 () Bool)

(assert (=> start!41982 m!450205))

(declare-fun m!450207 () Bool)

(assert (=> start!41982 m!450207))

(declare-fun m!450209 () Bool)

(assert (=> b!468617 m!450209))

(declare-fun m!450211 () Bool)

(assert (=> b!468611 m!450211))

(declare-fun m!450213 () Bool)

(assert (=> b!468611 m!450213))

(assert (=> b!468611 m!450211))

(declare-fun m!450215 () Bool)

(assert (=> b!468611 m!450215))

(declare-fun m!450217 () Bool)

(assert (=> b!468611 m!450217))

(declare-fun m!450219 () Bool)

(assert (=> b!468611 m!450219))

(declare-fun m!450221 () Bool)

(assert (=> b!468611 m!450221))

(declare-fun m!450223 () Bool)

(assert (=> b!468616 m!450223))

(declare-fun m!450225 () Bool)

(assert (=> mapNonEmpty!21190 m!450225))

(check-sat (not b!468616) (not b!468614) (not b_next!11569) b_and!19941 (not mapNonEmpty!21190) (not b!468617) (not start!41982) (not b!468611) tp_is_empty!12997)
(check-sat b_and!19941 (not b_next!11569))
