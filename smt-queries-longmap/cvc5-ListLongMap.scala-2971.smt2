; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42082 () Bool)

(assert start!42082)

(declare-fun b_free!11635 () Bool)

(declare-fun b_next!11635 () Bool)

(assert (=> start!42082 (= b_free!11635 (not b_next!11635))))

(declare-fun tp!40923 () Bool)

(declare-fun b_and!20045 () Bool)

(assert (=> start!42082 (= tp!40923 b_and!20045)))

(declare-fun b!469853 () Bool)

(declare-fun res!280783 () Bool)

(declare-fun e!275191 () Bool)

(assert (=> b!469853 (=> (not res!280783) (not e!275191))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29897 0))(
  ( (array!29898 (arr!14373 (Array (_ BitVec 32) (_ BitVec 64))) (size!14725 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29897)

(declare-datatypes ((V!18523 0))(
  ( (V!18524 (val!6576 Int)) )
))
(declare-datatypes ((ValueCell!6188 0))(
  ( (ValueCellFull!6188 (v!8866 V!18523)) (EmptyCell!6188) )
))
(declare-datatypes ((array!29899 0))(
  ( (array!29900 (arr!14374 (Array (_ BitVec 32) ValueCell!6188)) (size!14726 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29899)

(assert (=> b!469853 (= res!280783 (and (= (size!14726 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14725 _keys!1025) (size!14726 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469854 () Bool)

(declare-fun e!275192 () Bool)

(assert (=> b!469854 (= e!275191 (not e!275192))))

(declare-fun res!280785 () Bool)

(assert (=> b!469854 (=> res!280785 e!275192)))

(assert (=> b!469854 (= res!280785 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8658 0))(
  ( (tuple2!8659 (_1!4340 (_ BitVec 64)) (_2!4340 V!18523)) )
))
(declare-datatypes ((List!8737 0))(
  ( (Nil!8734) (Cons!8733 (h!9589 tuple2!8658) (t!14697 List!8737)) )
))
(declare-datatypes ((ListLongMap!7571 0))(
  ( (ListLongMap!7572 (toList!3801 List!8737)) )
))
(declare-fun lt!213071 () ListLongMap!7571)

(declare-fun lt!213075 () ListLongMap!7571)

(assert (=> b!469854 (= lt!213071 lt!213075)))

(declare-fun minValueBefore!38 () V!18523)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18523)

(declare-datatypes ((Unit!13759 0))(
  ( (Unit!13760) )
))
(declare-fun lt!213074 () Unit!13759)

(declare-fun minValueAfter!38 () V!18523)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!146 (array!29897 array!29899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 V!18523 V!18523 (_ BitVec 32) Int) Unit!13759)

(assert (=> b!469854 (= lt!213074 (lemmaNoChangeToArrayThenSameMapNoExtras!146 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1966 (array!29897 array!29899 (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 (_ BitVec 32) Int) ListLongMap!7571)

(assert (=> b!469854 (= lt!213075 (getCurrentListMapNoExtraKeys!1966 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469854 (= lt!213071 (getCurrentListMapNoExtraKeys!1966 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21292 () Bool)

(declare-fun mapRes!21292 () Bool)

(assert (=> mapIsEmpty!21292 mapRes!21292))

(declare-fun mapNonEmpty!21292 () Bool)

(declare-fun tp!40924 () Bool)

(declare-fun e!275189 () Bool)

(assert (=> mapNonEmpty!21292 (= mapRes!21292 (and tp!40924 e!275189))))

(declare-fun mapRest!21292 () (Array (_ BitVec 32) ValueCell!6188))

(declare-fun mapValue!21292 () ValueCell!6188)

(declare-fun mapKey!21292 () (_ BitVec 32))

(assert (=> mapNonEmpty!21292 (= (arr!14374 _values!833) (store mapRest!21292 mapKey!21292 mapValue!21292))))

(declare-fun b!469855 () Bool)

(declare-fun res!280786 () Bool)

(assert (=> b!469855 (=> (not res!280786) (not e!275191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29897 (_ BitVec 32)) Bool)

(assert (=> b!469855 (= res!280786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469856 () Bool)

(declare-fun e!275188 () Bool)

(declare-fun tp_is_empty!13063 () Bool)

(assert (=> b!469856 (= e!275188 tp_is_empty!13063)))

(declare-fun b!469858 () Bool)

(assert (=> b!469858 (= e!275192 true)))

(declare-fun lt!213076 () tuple2!8658)

(declare-fun +!1709 (ListLongMap!7571 tuple2!8658) ListLongMap!7571)

(assert (=> b!469858 (= (+!1709 lt!213071 lt!213076) (+!1709 (+!1709 lt!213071 (tuple2!8659 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213076))))

(assert (=> b!469858 (= lt!213076 (tuple2!8659 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!213072 () Unit!13759)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!122 (ListLongMap!7571 (_ BitVec 64) V!18523 V!18523) Unit!13759)

(assert (=> b!469858 (= lt!213072 (addSameAsAddTwiceSameKeyDiffValues!122 lt!213071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!213077 () ListLongMap!7571)

(declare-fun getCurrentListMap!2223 (array!29897 array!29899 (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 (_ BitVec 32) Int) ListLongMap!7571)

(assert (=> b!469858 (= lt!213077 (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213073 () ListLongMap!7571)

(assert (=> b!469858 (= lt!213073 (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469859 () Bool)

(declare-fun e!275193 () Bool)

(assert (=> b!469859 (= e!275193 (and e!275188 mapRes!21292))))

(declare-fun condMapEmpty!21292 () Bool)

(declare-fun mapDefault!21292 () ValueCell!6188)

