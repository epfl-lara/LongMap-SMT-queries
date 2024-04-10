; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42542 () Bool)

(assert start!42542)

(declare-fun b_free!11977 () Bool)

(declare-fun b_next!11977 () Bool)

(assert (=> start!42542 (= b_free!11977 (not b_next!11977))))

(declare-fun tp!41971 () Bool)

(declare-fun b_and!20457 () Bool)

(assert (=> start!42542 (= tp!41971 b_and!20457)))

(declare-fun b!474647 () Bool)

(declare-fun e!278611 () Bool)

(declare-fun tp_is_empty!13405 () Bool)

(assert (=> b!474647 (= e!278611 tp_is_empty!13405)))

(declare-fun b!474648 () Bool)

(declare-fun res!283480 () Bool)

(declare-fun e!278613 () Bool)

(assert (=> b!474648 (=> (not res!283480) (not e!278613))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30557 0))(
  ( (array!30558 (arr!14696 (Array (_ BitVec 32) (_ BitVec 64))) (size!15048 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30557)

(declare-datatypes ((V!18979 0))(
  ( (V!18980 (val!6747 Int)) )
))
(declare-datatypes ((ValueCell!6359 0))(
  ( (ValueCellFull!6359 (v!9040 V!18979)) (EmptyCell!6359) )
))
(declare-datatypes ((array!30559 0))(
  ( (array!30560 (arr!14697 (Array (_ BitVec 32) ValueCell!6359)) (size!15049 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30559)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474648 (= res!283480 (and (= (size!15049 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15048 _keys!1025) (size!15049 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21826 () Bool)

(declare-fun mapRes!21826 () Bool)

(assert (=> mapIsEmpty!21826 mapRes!21826))

(declare-fun b!474649 () Bool)

(declare-fun res!283479 () Bool)

(assert (=> b!474649 (=> (not res!283479) (not e!278613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30557 (_ BitVec 32)) Bool)

(assert (=> b!474649 (= res!283479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474650 () Bool)

(assert (=> b!474650 (= e!278613 false)))

(declare-fun zeroValue!794 () V!18979)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8898 0))(
  ( (tuple2!8899 (_1!4460 (_ BitVec 64)) (_2!4460 V!18979)) )
))
(declare-datatypes ((List!8974 0))(
  ( (Nil!8971) (Cons!8970 (h!9826 tuple2!8898) (t!14948 List!8974)) )
))
(declare-datatypes ((ListLongMap!7811 0))(
  ( (ListLongMap!7812 (toList!3921 List!8974)) )
))
(declare-fun lt!216250 () ListLongMap!7811)

(declare-fun minValueAfter!38 () V!18979)

(declare-fun getCurrentListMapNoExtraKeys!2078 (array!30557 array!30559 (_ BitVec 32) (_ BitVec 32) V!18979 V!18979 (_ BitVec 32) Int) ListLongMap!7811)

(assert (=> b!474650 (= lt!216250 (getCurrentListMapNoExtraKeys!2078 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18979)

(declare-fun lt!216251 () ListLongMap!7811)

(assert (=> b!474650 (= lt!216251 (getCurrentListMapNoExtraKeys!2078 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21826 () Bool)

(declare-fun tp!41970 () Bool)

(assert (=> mapNonEmpty!21826 (= mapRes!21826 (and tp!41970 e!278611))))

(declare-fun mapRest!21826 () (Array (_ BitVec 32) ValueCell!6359))

(declare-fun mapValue!21826 () ValueCell!6359)

(declare-fun mapKey!21826 () (_ BitVec 32))

(assert (=> mapNonEmpty!21826 (= (arr!14697 _values!833) (store mapRest!21826 mapKey!21826 mapValue!21826))))

(declare-fun b!474651 () Bool)

(declare-fun res!283482 () Bool)

(assert (=> b!474651 (=> (not res!283482) (not e!278613))))

(declare-datatypes ((List!8975 0))(
  ( (Nil!8972) (Cons!8971 (h!9827 (_ BitVec 64)) (t!14949 List!8975)) )
))
(declare-fun arrayNoDuplicates!0 (array!30557 (_ BitVec 32) List!8975) Bool)

(assert (=> b!474651 (= res!283482 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8972))))

(declare-fun res!283481 () Bool)

(assert (=> start!42542 (=> (not res!283481) (not e!278613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42542 (= res!283481 (validMask!0 mask!1365))))

(assert (=> start!42542 e!278613))

(assert (=> start!42542 tp_is_empty!13405))

(assert (=> start!42542 tp!41971))

(assert (=> start!42542 true))

(declare-fun array_inv!10604 (array!30557) Bool)

(assert (=> start!42542 (array_inv!10604 _keys!1025)))

(declare-fun e!278612 () Bool)

(declare-fun array_inv!10605 (array!30559) Bool)

(assert (=> start!42542 (and (array_inv!10605 _values!833) e!278612)))

(declare-fun b!474652 () Bool)

(declare-fun e!278610 () Bool)

(assert (=> b!474652 (= e!278610 tp_is_empty!13405)))

(declare-fun b!474653 () Bool)

(assert (=> b!474653 (= e!278612 (and e!278610 mapRes!21826))))

(declare-fun condMapEmpty!21826 () Bool)

(declare-fun mapDefault!21826 () ValueCell!6359)

