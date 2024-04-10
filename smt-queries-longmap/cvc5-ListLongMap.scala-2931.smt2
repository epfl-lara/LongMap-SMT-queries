; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41774 () Bool)

(assert start!41774)

(declare-fun b_free!11395 () Bool)

(declare-fun b_next!11395 () Bool)

(assert (=> start!41774 (= b_free!11395 (not b_next!11395))))

(declare-fun tp!40192 () Bool)

(declare-fun b_and!19763 () Bool)

(assert (=> start!41774 (= tp!40192 b_and!19763)))

(declare-fun b!466458 () Bool)

(declare-fun e!272739 () Bool)

(assert (=> b!466458 (= e!272739 true)))

(declare-datatypes ((V!18203 0))(
  ( (V!18204 (val!6456 Int)) )
))
(declare-fun zeroValue!794 () V!18203)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8466 0))(
  ( (tuple2!8467 (_1!4244 (_ BitVec 64)) (_2!4244 V!18203)) )
))
(declare-datatypes ((List!8557 0))(
  ( (Nil!8554) (Cons!8553 (h!9409 tuple2!8466) (t!14509 List!8557)) )
))
(declare-datatypes ((ListLongMap!7379 0))(
  ( (ListLongMap!7380 (toList!3705 List!8557)) )
))
(declare-fun lt!210806 () ListLongMap!7379)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29429 0))(
  ( (array!29430 (arr!14143 (Array (_ BitVec 32) (_ BitVec 64))) (size!14495 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29429)

(declare-datatypes ((ValueCell!6068 0))(
  ( (ValueCellFull!6068 (v!8744 V!18203)) (EmptyCell!6068) )
))
(declare-datatypes ((array!29431 0))(
  ( (array!29432 (arr!14144 (Array (_ BitVec 32) ValueCell!6068)) (size!14496 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29431)

(declare-fun minValueAfter!38 () V!18203)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2155 (array!29429 array!29431 (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 (_ BitVec 32) Int) ListLongMap!7379)

(assert (=> b!466458 (= lt!210806 (getCurrentListMap!2155 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18203)

(declare-fun lt!210803 () ListLongMap!7379)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1661 (ListLongMap!7379 tuple2!8466) ListLongMap!7379)

(assert (=> b!466458 (= lt!210803 (+!1661 (getCurrentListMap!2155 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8467 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466459 () Bool)

(declare-fun res!278815 () Bool)

(declare-fun e!272743 () Bool)

(assert (=> b!466459 (=> (not res!278815) (not e!272743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29429 (_ BitVec 32)) Bool)

(assert (=> b!466459 (= res!278815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466460 () Bool)

(declare-fun e!272740 () Bool)

(declare-fun tp_is_empty!12823 () Bool)

(assert (=> b!466460 (= e!272740 tp_is_empty!12823)))

(declare-fun mapNonEmpty!20920 () Bool)

(declare-fun mapRes!20920 () Bool)

(declare-fun tp!40191 () Bool)

(assert (=> mapNonEmpty!20920 (= mapRes!20920 (and tp!40191 e!272740))))

(declare-fun mapValue!20920 () ValueCell!6068)

(declare-fun mapRest!20920 () (Array (_ BitVec 32) ValueCell!6068))

(declare-fun mapKey!20920 () (_ BitVec 32))

(assert (=> mapNonEmpty!20920 (= (arr!14144 _values!833) (store mapRest!20920 mapKey!20920 mapValue!20920))))

(declare-fun mapIsEmpty!20920 () Bool)

(assert (=> mapIsEmpty!20920 mapRes!20920))

(declare-fun b!466461 () Bool)

(assert (=> b!466461 (= e!272743 (not e!272739))))

(declare-fun res!278817 () Bool)

(assert (=> b!466461 (=> res!278817 e!272739)))

(assert (=> b!466461 (= res!278817 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210804 () ListLongMap!7379)

(declare-fun lt!210807 () ListLongMap!7379)

(assert (=> b!466461 (= lt!210804 lt!210807)))

(declare-datatypes ((Unit!13574 0))(
  ( (Unit!13575) )
))
(declare-fun lt!210805 () Unit!13574)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!62 (array!29429 array!29431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 V!18203 V!18203 (_ BitVec 32) Int) Unit!13574)

(assert (=> b!466461 (= lt!210805 (lemmaNoChangeToArrayThenSameMapNoExtras!62 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1882 (array!29429 array!29431 (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 (_ BitVec 32) Int) ListLongMap!7379)

(assert (=> b!466461 (= lt!210807 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466461 (= lt!210804 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!278818 () Bool)

(assert (=> start!41774 (=> (not res!278818) (not e!272743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41774 (= res!278818 (validMask!0 mask!1365))))

(assert (=> start!41774 e!272743))

(assert (=> start!41774 tp_is_empty!12823))

(assert (=> start!41774 tp!40192))

(assert (=> start!41774 true))

(declare-fun array_inv!10212 (array!29429) Bool)

(assert (=> start!41774 (array_inv!10212 _keys!1025)))

(declare-fun e!272741 () Bool)

(declare-fun array_inv!10213 (array!29431) Bool)

(assert (=> start!41774 (and (array_inv!10213 _values!833) e!272741)))

(declare-fun b!466462 () Bool)

(declare-fun res!278816 () Bool)

(assert (=> b!466462 (=> (not res!278816) (not e!272743))))

(assert (=> b!466462 (= res!278816 (and (= (size!14496 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14495 _keys!1025) (size!14496 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466463 () Bool)

(declare-fun e!272742 () Bool)

(assert (=> b!466463 (= e!272741 (and e!272742 mapRes!20920))))

(declare-fun condMapEmpty!20920 () Bool)

(declare-fun mapDefault!20920 () ValueCell!6068)

