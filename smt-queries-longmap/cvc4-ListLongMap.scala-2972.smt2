; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42092 () Bool)

(assert start!42092)

(declare-fun b_free!11645 () Bool)

(declare-fun b_next!11645 () Bool)

(assert (=> start!42092 (= b_free!11645 (not b_next!11645))))

(declare-fun tp!40953 () Bool)

(declare-fun b_and!20055 () Bool)

(assert (=> start!42092 (= tp!40953 b_and!20055)))

(declare-fun b!469973 () Bool)

(declare-fun e!275283 () Bool)

(declare-datatypes ((array!29917 0))(
  ( (array!29918 (arr!14383 (Array (_ BitVec 32) (_ BitVec 64))) (size!14735 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29917)

(assert (=> b!469973 (= e!275283 (bvsle #b00000000000000000000000000000000 (size!14735 _keys!1025)))))

(declare-datatypes ((V!18535 0))(
  ( (V!18536 (val!6581 Int)) )
))
(declare-datatypes ((tuple2!8668 0))(
  ( (tuple2!8669 (_1!4345 (_ BitVec 64)) (_2!4345 V!18535)) )
))
(declare-datatypes ((List!8745 0))(
  ( (Nil!8742) (Cons!8741 (h!9597 tuple2!8668) (t!14705 List!8745)) )
))
(declare-datatypes ((ListLongMap!7581 0))(
  ( (ListLongMap!7582 (toList!3806 List!8745)) )
))
(declare-fun lt!213179 () ListLongMap!7581)

(declare-fun lt!213180 () tuple2!8668)

(declare-fun minValueBefore!38 () V!18535)

(declare-fun +!1713 (ListLongMap!7581 tuple2!8668) ListLongMap!7581)

(assert (=> b!469973 (= (+!1713 lt!213179 lt!213180) (+!1713 (+!1713 lt!213179 (tuple2!8669 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213180))))

(declare-fun minValueAfter!38 () V!18535)

(assert (=> b!469973 (= lt!213180 (tuple2!8669 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13769 0))(
  ( (Unit!13770) )
))
(declare-fun lt!213177 () Unit!13769)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!126 (ListLongMap!7581 (_ BitVec 64) V!18535 V!18535) Unit!13769)

(assert (=> b!469973 (= lt!213177 (addSameAsAddTwiceSameKeyDiffValues!126 lt!213179 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18535)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!213178 () ListLongMap!7581)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6193 0))(
  ( (ValueCellFull!6193 (v!8871 V!18535)) (EmptyCell!6193) )
))
(declare-datatypes ((array!29919 0))(
  ( (array!29920 (arr!14384 (Array (_ BitVec 32) ValueCell!6193)) (size!14736 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29919)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2227 (array!29917 array!29919 (_ BitVec 32) (_ BitVec 32) V!18535 V!18535 (_ BitVec 32) Int) ListLongMap!7581)

(assert (=> b!469973 (= lt!213178 (getCurrentListMap!2227 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!213181 () ListLongMap!7581)

(assert (=> b!469973 (= lt!213181 (getCurrentListMap!2227 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469974 () Bool)

(declare-fun e!275278 () Bool)

(declare-fun tp_is_empty!13073 () Bool)

(assert (=> b!469974 (= e!275278 tp_is_empty!13073)))

(declare-fun b!469975 () Bool)

(declare-fun res!280860 () Bool)

(declare-fun e!275280 () Bool)

(assert (=> b!469975 (=> (not res!280860) (not e!275280))))

(declare-datatypes ((List!8746 0))(
  ( (Nil!8743) (Cons!8742 (h!9598 (_ BitVec 64)) (t!14706 List!8746)) )
))
(declare-fun arrayNoDuplicates!0 (array!29917 (_ BitVec 32) List!8746) Bool)

(assert (=> b!469975 (= res!280860 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8743))))

(declare-fun b!469977 () Bool)

(declare-fun res!280859 () Bool)

(assert (=> b!469977 (=> (not res!280859) (not e!275280))))

(assert (=> b!469977 (= res!280859 (and (= (size!14736 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14735 _keys!1025) (size!14736 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469978 () Bool)

(declare-fun e!275281 () Bool)

(declare-fun mapRes!21307 () Bool)

(assert (=> b!469978 (= e!275281 (and e!275278 mapRes!21307))))

(declare-fun condMapEmpty!21307 () Bool)

(declare-fun mapDefault!21307 () ValueCell!6193)

