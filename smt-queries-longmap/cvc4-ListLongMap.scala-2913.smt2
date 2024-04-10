; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41638 () Bool)

(assert start!41638)

(declare-fun b_free!11291 () Bool)

(declare-fun b_next!11291 () Bool)

(assert (=> start!41638 (= b_free!11291 (not b_next!11291))))

(declare-fun tp!39873 () Bool)

(declare-fun b_and!19639 () Bool)

(assert (=> start!41638 (= tp!39873 b_and!19639)))

(declare-fun b!464987 () Bool)

(declare-fun res!277968 () Bool)

(declare-fun e!271686 () Bool)

(assert (=> b!464987 (=> (not res!277968) (not e!271686))))

(declare-datatypes ((array!29223 0))(
  ( (array!29224 (arr!14042 (Array (_ BitVec 32) (_ BitVec 64))) (size!14394 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29223)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29223 (_ BitVec 32)) Bool)

(assert (=> b!464987 (= res!277968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464988 () Bool)

(declare-fun res!277971 () Bool)

(assert (=> b!464988 (=> (not res!277971) (not e!271686))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18063 0))(
  ( (V!18064 (val!6404 Int)) )
))
(declare-datatypes ((ValueCell!6016 0))(
  ( (ValueCellFull!6016 (v!8691 V!18063)) (EmptyCell!6016) )
))
(declare-datatypes ((array!29225 0))(
  ( (array!29226 (arr!14043 (Array (_ BitVec 32) ValueCell!6016)) (size!14395 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29225)

(assert (=> b!464988 (= res!277971 (and (= (size!14395 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14394 _keys!1025) (size!14395 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277970 () Bool)

(assert (=> start!41638 (=> (not res!277970) (not e!271686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41638 (= res!277970 (validMask!0 mask!1365))))

(assert (=> start!41638 e!271686))

(declare-fun tp_is_empty!12719 () Bool)

(assert (=> start!41638 tp_is_empty!12719))

(assert (=> start!41638 tp!39873))

(assert (=> start!41638 true))

(declare-fun array_inv!10144 (array!29223) Bool)

(assert (=> start!41638 (array_inv!10144 _keys!1025)))

(declare-fun e!271685 () Bool)

(declare-fun array_inv!10145 (array!29225) Bool)

(assert (=> start!41638 (and (array_inv!10145 _values!833) e!271685)))

(declare-fun b!464989 () Bool)

(assert (=> b!464989 (= e!271686 (not true))))

(declare-datatypes ((tuple2!8392 0))(
  ( (tuple2!8393 (_1!4207 (_ BitVec 64)) (_2!4207 V!18063)) )
))
(declare-datatypes ((List!8483 0))(
  ( (Nil!8480) (Cons!8479 (h!9335 tuple2!8392) (t!14431 List!8483)) )
))
(declare-datatypes ((ListLongMap!7305 0))(
  ( (ListLongMap!7306 (toList!3668 List!8483)) )
))
(declare-fun lt!209954 () ListLongMap!7305)

(declare-fun lt!209953 () ListLongMap!7305)

(assert (=> b!464989 (= lt!209954 lt!209953)))

(declare-fun minValueBefore!38 () V!18063)

(declare-fun zeroValue!794 () V!18063)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13504 0))(
  ( (Unit!13505) )
))
(declare-fun lt!209955 () Unit!13504)

(declare-fun minValueAfter!38 () V!18063)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!28 (array!29223 array!29225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18063 V!18063 V!18063 V!18063 (_ BitVec 32) Int) Unit!13504)

(assert (=> b!464989 (= lt!209955 (lemmaNoChangeToArrayThenSameMapNoExtras!28 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1848 (array!29223 array!29225 (_ BitVec 32) (_ BitVec 32) V!18063 V!18063 (_ BitVec 32) Int) ListLongMap!7305)

(assert (=> b!464989 (= lt!209953 (getCurrentListMapNoExtraKeys!1848 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464989 (= lt!209954 (getCurrentListMapNoExtraKeys!1848 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20758 () Bool)

(declare-fun mapRes!20758 () Bool)

(assert (=> mapIsEmpty!20758 mapRes!20758))

(declare-fun b!464990 () Bool)

(declare-fun e!271687 () Bool)

(assert (=> b!464990 (= e!271687 tp_is_empty!12719)))

(declare-fun b!464991 () Bool)

(declare-fun res!277969 () Bool)

(assert (=> b!464991 (=> (not res!277969) (not e!271686))))

(declare-datatypes ((List!8484 0))(
  ( (Nil!8481) (Cons!8480 (h!9336 (_ BitVec 64)) (t!14432 List!8484)) )
))
(declare-fun arrayNoDuplicates!0 (array!29223 (_ BitVec 32) List!8484) Bool)

(assert (=> b!464991 (= res!277969 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8481))))

(declare-fun b!464992 () Bool)

(declare-fun e!271684 () Bool)

(assert (=> b!464992 (= e!271684 tp_is_empty!12719)))

(declare-fun mapNonEmpty!20758 () Bool)

(declare-fun tp!39874 () Bool)

(assert (=> mapNonEmpty!20758 (= mapRes!20758 (and tp!39874 e!271687))))

(declare-fun mapRest!20758 () (Array (_ BitVec 32) ValueCell!6016))

(declare-fun mapKey!20758 () (_ BitVec 32))

(declare-fun mapValue!20758 () ValueCell!6016)

(assert (=> mapNonEmpty!20758 (= (arr!14043 _values!833) (store mapRest!20758 mapKey!20758 mapValue!20758))))

(declare-fun b!464993 () Bool)

(assert (=> b!464993 (= e!271685 (and e!271684 mapRes!20758))))

(declare-fun condMapEmpty!20758 () Bool)

(declare-fun mapDefault!20758 () ValueCell!6016)

