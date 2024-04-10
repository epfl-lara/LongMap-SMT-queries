; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41554 () Bool)

(assert start!41554)

(declare-fun b_free!11221 () Bool)

(declare-fun b_next!11221 () Bool)

(assert (=> start!41554 (= b_free!11221 (not b_next!11221))))

(declare-fun tp!39661 () Bool)

(declare-fun b_and!19561 () Bool)

(assert (=> start!41554 (= tp!39661 b_and!19561)))

(declare-fun b!464167 () Bool)

(declare-fun res!277519 () Bool)

(declare-fun e!271107 () Bool)

(assert (=> b!464167 (=> (not res!277519) (not e!271107))))

(declare-datatypes ((array!29087 0))(
  ( (array!29088 (arr!13975 (Array (_ BitVec 32) (_ BitVec 64))) (size!14327 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29087)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29087 (_ BitVec 32)) Bool)

(assert (=> b!464167 (= res!277519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464168 () Bool)

(declare-fun res!277518 () Bool)

(assert (=> b!464168 (=> (not res!277518) (not e!271107))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17971 0))(
  ( (V!17972 (val!6369 Int)) )
))
(declare-datatypes ((ValueCell!5981 0))(
  ( (ValueCellFull!5981 (v!8656 V!17971)) (EmptyCell!5981) )
))
(declare-datatypes ((array!29089 0))(
  ( (array!29090 (arr!13976 (Array (_ BitVec 32) ValueCell!5981)) (size!14328 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29089)

(assert (=> b!464168 (= res!277518 (and (= (size!14328 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14327 _keys!1025) (size!14328 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277517 () Bool)

(assert (=> start!41554 (=> (not res!277517) (not e!271107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41554 (= res!277517 (validMask!0 mask!1365))))

(assert (=> start!41554 e!271107))

(declare-fun tp_is_empty!12649 () Bool)

(assert (=> start!41554 tp_is_empty!12649))

(assert (=> start!41554 tp!39661))

(assert (=> start!41554 true))

(declare-fun array_inv!10096 (array!29087) Bool)

(assert (=> start!41554 (array_inv!10096 _keys!1025)))

(declare-fun e!271106 () Bool)

(declare-fun array_inv!10097 (array!29089) Bool)

(assert (=> start!41554 (and (array_inv!10097 _values!833) e!271106)))

(declare-fun b!464169 () Bool)

(declare-fun res!277520 () Bool)

(assert (=> b!464169 (=> (not res!277520) (not e!271107))))

(declare-datatypes ((List!8436 0))(
  ( (Nil!8433) (Cons!8432 (h!9288 (_ BitVec 64)) (t!14382 List!8436)) )
))
(declare-fun arrayNoDuplicates!0 (array!29087 (_ BitVec 32) List!8436) Bool)

(assert (=> b!464169 (= res!277520 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8433))))

(declare-fun mapNonEmpty!20650 () Bool)

(declare-fun mapRes!20650 () Bool)

(declare-fun tp!39660 () Bool)

(declare-fun e!271104 () Bool)

(assert (=> mapNonEmpty!20650 (= mapRes!20650 (and tp!39660 e!271104))))

(declare-fun mapRest!20650 () (Array (_ BitVec 32) ValueCell!5981))

(declare-fun mapValue!20650 () ValueCell!5981)

(declare-fun mapKey!20650 () (_ BitVec 32))

(assert (=> mapNonEmpty!20650 (= (arr!13976 _values!833) (store mapRest!20650 mapKey!20650 mapValue!20650))))

(declare-fun b!464170 () Bool)

(assert (=> b!464170 (= e!271107 (not true))))

(declare-datatypes ((tuple2!8342 0))(
  ( (tuple2!8343 (_1!4182 (_ BitVec 64)) (_2!4182 V!17971)) )
))
(declare-datatypes ((List!8437 0))(
  ( (Nil!8434) (Cons!8433 (h!9289 tuple2!8342) (t!14383 List!8437)) )
))
(declare-datatypes ((ListLongMap!7255 0))(
  ( (ListLongMap!7256 (toList!3643 List!8437)) )
))
(declare-fun lt!209599 () ListLongMap!7255)

(declare-fun lt!209600 () ListLongMap!7255)

(assert (=> b!464170 (= lt!209599 lt!209600)))

(declare-datatypes ((Unit!13454 0))(
  ( (Unit!13455) )
))
(declare-fun lt!209598 () Unit!13454)

(declare-fun minValueBefore!38 () V!17971)

(declare-fun zeroValue!794 () V!17971)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17971)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!3 (array!29087 array!29089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17971 V!17971 V!17971 V!17971 (_ BitVec 32) Int) Unit!13454)

(assert (=> b!464170 (= lt!209598 (lemmaNoChangeToArrayThenSameMapNoExtras!3 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1823 (array!29087 array!29089 (_ BitVec 32) (_ BitVec 32) V!17971 V!17971 (_ BitVec 32) Int) ListLongMap!7255)

(assert (=> b!464170 (= lt!209600 (getCurrentListMapNoExtraKeys!1823 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464170 (= lt!209599 (getCurrentListMapNoExtraKeys!1823 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464171 () Bool)

(assert (=> b!464171 (= e!271104 tp_is_empty!12649)))

(declare-fun b!464172 () Bool)

(declare-fun e!271105 () Bool)

(assert (=> b!464172 (= e!271105 tp_is_empty!12649)))

(declare-fun b!464173 () Bool)

(assert (=> b!464173 (= e!271106 (and e!271105 mapRes!20650))))

(declare-fun condMapEmpty!20650 () Bool)

(declare-fun mapDefault!20650 () ValueCell!5981)

