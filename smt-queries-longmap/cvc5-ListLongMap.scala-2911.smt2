; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41622 () Bool)

(assert start!41622)

(declare-fun b_free!11275 () Bool)

(declare-fun b_next!11275 () Bool)

(assert (=> start!41622 (= b_free!11275 (not b_next!11275))))

(declare-fun tp!39825 () Bool)

(declare-fun b_and!19623 () Bool)

(assert (=> start!41622 (= tp!39825 b_and!19623)))

(declare-fun b!464819 () Bool)

(declare-fun res!277873 () Bool)

(declare-fun e!271566 () Bool)

(assert (=> b!464819 (=> (not res!277873) (not e!271566))))

(declare-datatypes ((array!29191 0))(
  ( (array!29192 (arr!14026 (Array (_ BitVec 32) (_ BitVec 64))) (size!14378 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29191)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29191 (_ BitVec 32)) Bool)

(assert (=> b!464819 (= res!277873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464820 () Bool)

(assert (=> b!464820 (= e!271566 (not true))))

(declare-datatypes ((V!18043 0))(
  ( (V!18044 (val!6396 Int)) )
))
(declare-datatypes ((tuple2!8378 0))(
  ( (tuple2!8379 (_1!4200 (_ BitVec 64)) (_2!4200 V!18043)) )
))
(declare-datatypes ((List!8471 0))(
  ( (Nil!8468) (Cons!8467 (h!9323 tuple2!8378) (t!14419 List!8471)) )
))
(declare-datatypes ((ListLongMap!7291 0))(
  ( (ListLongMap!7292 (toList!3661 List!8471)) )
))
(declare-fun lt!209881 () ListLongMap!7291)

(declare-fun lt!209883 () ListLongMap!7291)

(assert (=> b!464820 (= lt!209881 lt!209883)))

(declare-fun minValueBefore!38 () V!18043)

(declare-fun zeroValue!794 () V!18043)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13490 0))(
  ( (Unit!13491) )
))
(declare-fun lt!209882 () Unit!13490)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6008 0))(
  ( (ValueCellFull!6008 (v!8683 V!18043)) (EmptyCell!6008) )
))
(declare-datatypes ((array!29193 0))(
  ( (array!29194 (arr!14027 (Array (_ BitVec 32) ValueCell!6008)) (size!14379 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29193)

(declare-fun minValueAfter!38 () V!18043)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!21 (array!29191 array!29193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18043 V!18043 V!18043 V!18043 (_ BitVec 32) Int) Unit!13490)

(assert (=> b!464820 (= lt!209882 (lemmaNoChangeToArrayThenSameMapNoExtras!21 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1841 (array!29191 array!29193 (_ BitVec 32) (_ BitVec 32) V!18043 V!18043 (_ BitVec 32) Int) ListLongMap!7291)

(assert (=> b!464820 (= lt!209883 (getCurrentListMapNoExtraKeys!1841 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464820 (= lt!209881 (getCurrentListMapNoExtraKeys!1841 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464821 () Bool)

(declare-fun res!277874 () Bool)

(assert (=> b!464821 (=> (not res!277874) (not e!271566))))

(assert (=> b!464821 (= res!277874 (and (= (size!14379 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14378 _keys!1025) (size!14379 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277872 () Bool)

(assert (=> start!41622 (=> (not res!277872) (not e!271566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41622 (= res!277872 (validMask!0 mask!1365))))

(assert (=> start!41622 e!271566))

(declare-fun tp_is_empty!12703 () Bool)

(assert (=> start!41622 tp_is_empty!12703))

(assert (=> start!41622 tp!39825))

(assert (=> start!41622 true))

(declare-fun array_inv!10128 (array!29191) Bool)

(assert (=> start!41622 (array_inv!10128 _keys!1025)))

(declare-fun e!271565 () Bool)

(declare-fun array_inv!10129 (array!29193) Bool)

(assert (=> start!41622 (and (array_inv!10129 _values!833) e!271565)))

(declare-fun b!464822 () Bool)

(declare-fun e!271567 () Bool)

(assert (=> b!464822 (= e!271567 tp_is_empty!12703)))

(declare-fun b!464823 () Bool)

(declare-fun e!271564 () Bool)

(assert (=> b!464823 (= e!271564 tp_is_empty!12703)))

(declare-fun mapIsEmpty!20734 () Bool)

(declare-fun mapRes!20734 () Bool)

(assert (=> mapIsEmpty!20734 mapRes!20734))

(declare-fun mapNonEmpty!20734 () Bool)

(declare-fun tp!39826 () Bool)

(assert (=> mapNonEmpty!20734 (= mapRes!20734 (and tp!39826 e!271564))))

(declare-fun mapRest!20734 () (Array (_ BitVec 32) ValueCell!6008))

(declare-fun mapValue!20734 () ValueCell!6008)

(declare-fun mapKey!20734 () (_ BitVec 32))

(assert (=> mapNonEmpty!20734 (= (arr!14027 _values!833) (store mapRest!20734 mapKey!20734 mapValue!20734))))

(declare-fun b!464824 () Bool)

(assert (=> b!464824 (= e!271565 (and e!271567 mapRes!20734))))

(declare-fun condMapEmpty!20734 () Bool)

(declare-fun mapDefault!20734 () ValueCell!6008)

