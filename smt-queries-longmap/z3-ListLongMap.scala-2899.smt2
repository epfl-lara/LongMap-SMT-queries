; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41522 () Bool)

(assert start!41522)

(declare-fun b_free!11203 () Bool)

(declare-fun b_next!11203 () Bool)

(assert (=> start!41522 (= b_free!11203 (not b_next!11203))))

(declare-fun tp!39606 () Bool)

(declare-fun b_and!19553 () Bool)

(assert (=> start!41522 (= tp!39606 b_and!19553)))

(declare-fun b!463917 () Bool)

(declare-fun e!270930 () Bool)

(declare-fun e!270933 () Bool)

(declare-fun mapRes!20623 () Bool)

(assert (=> b!463917 (= e!270930 (and e!270933 mapRes!20623))))

(declare-fun condMapEmpty!20623 () Bool)

(declare-datatypes ((V!17947 0))(
  ( (V!17948 (val!6360 Int)) )
))
(declare-datatypes ((ValueCell!5972 0))(
  ( (ValueCellFull!5972 (v!8648 V!17947)) (EmptyCell!5972) )
))
(declare-datatypes ((array!29056 0))(
  ( (array!29057 (arr!13959 (Array (_ BitVec 32) ValueCell!5972)) (size!14311 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29056)

(declare-fun mapDefault!20623 () ValueCell!5972)

(assert (=> b!463917 (= condMapEmpty!20623 (= (arr!13959 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5972)) mapDefault!20623)))))

(declare-fun mapIsEmpty!20623 () Bool)

(assert (=> mapIsEmpty!20623 mapRes!20623))

(declare-fun b!463918 () Bool)

(declare-fun e!270931 () Bool)

(declare-fun tp_is_empty!12631 () Bool)

(assert (=> b!463918 (= e!270931 tp_is_empty!12631)))

(declare-fun b!463919 () Bool)

(declare-fun res!277403 () Bool)

(declare-fun e!270932 () Bool)

(assert (=> b!463919 (=> (not res!277403) (not e!270932))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29058 0))(
  ( (array!29059 (arr!13960 (Array (_ BitVec 32) (_ BitVec 64))) (size!14312 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29058)

(assert (=> b!463919 (= res!277403 (and (= (size!14311 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14312 _keys!1025) (size!14311 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277402 () Bool)

(assert (=> start!41522 (=> (not res!277402) (not e!270932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41522 (= res!277402 (validMask!0 mask!1365))))

(assert (=> start!41522 e!270932))

(assert (=> start!41522 tp_is_empty!12631))

(assert (=> start!41522 tp!39606))

(assert (=> start!41522 true))

(declare-fun array_inv!10166 (array!29058) Bool)

(assert (=> start!41522 (array_inv!10166 _keys!1025)))

(declare-fun array_inv!10167 (array!29056) Bool)

(assert (=> start!41522 (and (array_inv!10167 _values!833) e!270930)))

(declare-fun b!463920 () Bool)

(assert (=> b!463920 (= e!270933 tp_is_empty!12631)))

(declare-fun mapNonEmpty!20623 () Bool)

(declare-fun tp!39607 () Bool)

(assert (=> mapNonEmpty!20623 (= mapRes!20623 (and tp!39607 e!270931))))

(declare-fun mapKey!20623 () (_ BitVec 32))

(declare-fun mapRest!20623 () (Array (_ BitVec 32) ValueCell!5972))

(declare-fun mapValue!20623 () ValueCell!5972)

(assert (=> mapNonEmpty!20623 (= (arr!13959 _values!833) (store mapRest!20623 mapKey!20623 mapValue!20623))))

(declare-fun b!463921 () Bool)

(declare-fun res!277404 () Bool)

(assert (=> b!463921 (=> (not res!277404) (not e!270932))))

(declare-datatypes ((List!8357 0))(
  ( (Nil!8354) (Cons!8353 (h!9209 (_ BitVec 64)) (t!14295 List!8357)) )
))
(declare-fun arrayNoDuplicates!0 (array!29058 (_ BitVec 32) List!8357) Bool)

(assert (=> b!463921 (= res!277404 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8354))))

(declare-fun b!463922 () Bool)

(assert (=> b!463922 (= e!270932 false)))

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!17947)

(declare-datatypes ((tuple2!8276 0))(
  ( (tuple2!8277 (_1!4149 (_ BitVec 64)) (_2!4149 V!17947)) )
))
(declare-datatypes ((List!8358 0))(
  ( (Nil!8355) (Cons!8354 (h!9210 tuple2!8276) (t!14296 List!8358)) )
))
(declare-datatypes ((ListLongMap!7191 0))(
  ( (ListLongMap!7192 (toList!3611 List!8358)) )
))
(declare-fun lt!209546 () ListLongMap!7191)

(declare-fun minValueAfter!38 () V!17947)

(declare-fun getCurrentListMapNoExtraKeys!1838 (array!29058 array!29056 (_ BitVec 32) (_ BitVec 32) V!17947 V!17947 (_ BitVec 32) Int) ListLongMap!7191)

(assert (=> b!463922 (= lt!209546 (getCurrentListMapNoExtraKeys!1838 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17947)

(declare-fun lt!209545 () ListLongMap!7191)

(assert (=> b!463922 (= lt!209545 (getCurrentListMapNoExtraKeys!1838 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463923 () Bool)

(declare-fun res!277405 () Bool)

(assert (=> b!463923 (=> (not res!277405) (not e!270932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29058 (_ BitVec 32)) Bool)

(assert (=> b!463923 (= res!277405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41522 res!277402) b!463919))

(assert (= (and b!463919 res!277403) b!463923))

(assert (= (and b!463923 res!277405) b!463921))

(assert (= (and b!463921 res!277404) b!463922))

(assert (= (and b!463917 condMapEmpty!20623) mapIsEmpty!20623))

(assert (= (and b!463917 (not condMapEmpty!20623)) mapNonEmpty!20623))

(get-info :version)

(assert (= (and mapNonEmpty!20623 ((_ is ValueCellFull!5972) mapValue!20623)) b!463918))

(assert (= (and b!463917 ((_ is ValueCellFull!5972) mapDefault!20623)) b!463920))

(assert (= start!41522 b!463917))

(declare-fun m!446623 () Bool)

(assert (=> b!463921 m!446623))

(declare-fun m!446625 () Bool)

(assert (=> b!463923 m!446625))

(declare-fun m!446627 () Bool)

(assert (=> mapNonEmpty!20623 m!446627))

(declare-fun m!446629 () Bool)

(assert (=> start!41522 m!446629))

(declare-fun m!446631 () Bool)

(assert (=> start!41522 m!446631))

(declare-fun m!446633 () Bool)

(assert (=> start!41522 m!446633))

(declare-fun m!446635 () Bool)

(assert (=> b!463922 m!446635))

(declare-fun m!446637 () Bool)

(assert (=> b!463922 m!446637))

(check-sat tp_is_empty!12631 (not b!463921) (not mapNonEmpty!20623) (not b_next!11203) b_and!19553 (not b!463923) (not start!41522) (not b!463922))
(check-sat b_and!19553 (not b_next!11203))
