; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42112 () Bool)

(assert start!42112)

(declare-fun b_free!11659 () Bool)

(declare-fun b_next!11659 () Bool)

(assert (=> start!42112 (= b_free!11659 (not b_next!11659))))

(declare-fun tp!40998 () Bool)

(declare-fun b_and!20091 () Bool)

(assert (=> start!42112 (= tp!40998 b_and!20091)))

(declare-fun res!281014 () Bool)

(declare-fun e!275460 () Bool)

(assert (=> start!42112 (=> (not res!281014) (not e!275460))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42112 (= res!281014 (validMask!0 mask!1365))))

(assert (=> start!42112 e!275460))

(declare-fun tp_is_empty!13087 () Bool)

(assert (=> start!42112 tp_is_empty!13087))

(assert (=> start!42112 tp!40998))

(assert (=> start!42112 true))

(declare-datatypes ((array!29932 0))(
  ( (array!29933 (arr!14389 (Array (_ BitVec 32) (_ BitVec 64))) (size!14741 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29932)

(declare-fun array_inv!10472 (array!29932) Bool)

(assert (=> start!42112 (array_inv!10472 _keys!1025)))

(declare-datatypes ((V!18555 0))(
  ( (V!18556 (val!6588 Int)) )
))
(declare-datatypes ((ValueCell!6200 0))(
  ( (ValueCellFull!6200 (v!8880 V!18555)) (EmptyCell!6200) )
))
(declare-datatypes ((array!29934 0))(
  ( (array!29935 (arr!14390 (Array (_ BitVec 32) ValueCell!6200)) (size!14742 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29934)

(declare-fun e!275461 () Bool)

(declare-fun array_inv!10473 (array!29934) Bool)

(assert (=> start!42112 (and (array_inv!10473 _values!833) e!275461)))

(declare-fun b!470239 () Bool)

(declare-fun e!275457 () Bool)

(assert (=> b!470239 (= e!275457 tp_is_empty!13087)))

(declare-fun b!470240 () Bool)

(declare-fun res!281012 () Bool)

(assert (=> b!470240 (=> (not res!281012) (not e!275460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29932 (_ BitVec 32)) Bool)

(assert (=> b!470240 (= res!281012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21331 () Bool)

(declare-fun mapRes!21331 () Bool)

(declare-fun tp!40999 () Bool)

(declare-fun e!275458 () Bool)

(assert (=> mapNonEmpty!21331 (= mapRes!21331 (and tp!40999 e!275458))))

(declare-fun mapValue!21331 () ValueCell!6200)

(declare-fun mapRest!21331 () (Array (_ BitVec 32) ValueCell!6200))

(declare-fun mapKey!21331 () (_ BitVec 32))

(assert (=> mapNonEmpty!21331 (= (arr!14390 _values!833) (store mapRest!21331 mapKey!21331 mapValue!21331))))

(declare-fun b!470241 () Bool)

(assert (=> b!470241 (= e!275461 (and e!275457 mapRes!21331))))

(declare-fun condMapEmpty!21331 () Bool)

(declare-fun mapDefault!21331 () ValueCell!6200)

(assert (=> b!470241 (= condMapEmpty!21331 (= (arr!14390 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6200)) mapDefault!21331)))))

(declare-fun mapIsEmpty!21331 () Bool)

(assert (=> mapIsEmpty!21331 mapRes!21331))

(declare-fun b!470242 () Bool)

(declare-fun res!281015 () Bool)

(assert (=> b!470242 (=> (not res!281015) (not e!275460))))

(declare-datatypes ((List!8671 0))(
  ( (Nil!8668) (Cons!8667 (h!9523 (_ BitVec 64)) (t!14625 List!8671)) )
))
(declare-fun arrayNoDuplicates!0 (array!29932 (_ BitVec 32) List!8671) Bool)

(assert (=> b!470242 (= res!281015 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8668))))

(declare-fun b!470243 () Bool)

(declare-fun res!281013 () Bool)

(assert (=> b!470243 (=> (not res!281013) (not e!275460))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470243 (= res!281013 (and (= (size!14742 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14741 _keys!1025) (size!14742 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470244 () Bool)

(assert (=> b!470244 (= e!275458 tp_is_empty!13087)))

(declare-fun b!470245 () Bool)

(assert (=> b!470245 (= e!275460 (not true))))

(declare-datatypes ((tuple2!8598 0))(
  ( (tuple2!8599 (_1!4310 (_ BitVec 64)) (_2!4310 V!18555)) )
))
(declare-datatypes ((List!8672 0))(
  ( (Nil!8669) (Cons!8668 (h!9524 tuple2!8598) (t!14626 List!8672)) )
))
(declare-datatypes ((ListLongMap!7513 0))(
  ( (ListLongMap!7514 (toList!3772 List!8672)) )
))
(declare-fun lt!213408 () ListLongMap!7513)

(declare-fun lt!213407 () ListLongMap!7513)

(assert (=> b!470245 (= lt!213408 lt!213407)))

(declare-datatypes ((Unit!13757 0))(
  ( (Unit!13758) )
))
(declare-fun lt!213406 () Unit!13757)

(declare-fun minValueBefore!38 () V!18555)

(declare-fun zeroValue!794 () V!18555)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18555)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!147 (array!29932 array!29934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18555 V!18555 V!18555 V!18555 (_ BitVec 32) Int) Unit!13757)

(assert (=> b!470245 (= lt!213406 (lemmaNoChangeToArrayThenSameMapNoExtras!147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1987 (array!29932 array!29934 (_ BitVec 32) (_ BitVec 32) V!18555 V!18555 (_ BitVec 32) Int) ListLongMap!7513)

(assert (=> b!470245 (= lt!213407 (getCurrentListMapNoExtraKeys!1987 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470245 (= lt!213408 (getCurrentListMapNoExtraKeys!1987 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42112 res!281014) b!470243))

(assert (= (and b!470243 res!281013) b!470240))

(assert (= (and b!470240 res!281012) b!470242))

(assert (= (and b!470242 res!281015) b!470245))

(assert (= (and b!470241 condMapEmpty!21331) mapIsEmpty!21331))

(assert (= (and b!470241 (not condMapEmpty!21331)) mapNonEmpty!21331))

(get-info :version)

(assert (= (and mapNonEmpty!21331 ((_ is ValueCellFull!6200) mapValue!21331)) b!470244))

(assert (= (and b!470241 ((_ is ValueCellFull!6200) mapDefault!21331)) b!470239))

(assert (= start!42112 b!470241))

(declare-fun m!452791 () Bool)

(assert (=> b!470242 m!452791))

(declare-fun m!452793 () Bool)

(assert (=> b!470245 m!452793))

(declare-fun m!452795 () Bool)

(assert (=> b!470245 m!452795))

(declare-fun m!452797 () Bool)

(assert (=> b!470245 m!452797))

(declare-fun m!452799 () Bool)

(assert (=> start!42112 m!452799))

(declare-fun m!452801 () Bool)

(assert (=> start!42112 m!452801))

(declare-fun m!452803 () Bool)

(assert (=> start!42112 m!452803))

(declare-fun m!452805 () Bool)

(assert (=> b!470240 m!452805))

(declare-fun m!452807 () Bool)

(assert (=> mapNonEmpty!21331 m!452807))

(check-sat (not b!470240) (not b!470242) b_and!20091 tp_is_empty!13087 (not start!42112) (not b!470245) (not mapNonEmpty!21331) (not b_next!11659))
(check-sat b_and!20091 (not b_next!11659))
