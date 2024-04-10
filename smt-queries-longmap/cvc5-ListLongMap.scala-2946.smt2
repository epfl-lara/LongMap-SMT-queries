; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41896 () Bool)

(assert start!41896)

(declare-fun b_free!11485 () Bool)

(declare-fun b_next!11485 () Bool)

(assert (=> start!41896 (= b_free!11485 (not b_next!11485))))

(declare-fun tp!40467 () Bool)

(declare-fun b_and!19873 () Bool)

(assert (=> start!41896 (= tp!40467 b_and!19873)))

(declare-fun mapNonEmpty!21061 () Bool)

(declare-fun mapRes!21061 () Bool)

(declare-fun tp!40468 () Bool)

(declare-fun e!273632 () Bool)

(assert (=> mapNonEmpty!21061 (= mapRes!21061 (and tp!40468 e!273632))))

(declare-datatypes ((V!18323 0))(
  ( (V!18324 (val!6501 Int)) )
))
(declare-datatypes ((ValueCell!6113 0))(
  ( (ValueCellFull!6113 (v!8790 V!18323)) (EmptyCell!6113) )
))
(declare-fun mapRest!21061 () (Array (_ BitVec 32) ValueCell!6113))

(declare-fun mapKey!21061 () (_ BitVec 32))

(declare-datatypes ((array!29603 0))(
  ( (array!29604 (arr!14228 (Array (_ BitVec 32) ValueCell!6113)) (size!14580 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29603)

(declare-fun mapValue!21061 () ValueCell!6113)

(assert (=> mapNonEmpty!21061 (= (arr!14228 _values!833) (store mapRest!21061 mapKey!21061 mapValue!21061))))

(declare-fun b!467726 () Bool)

(declare-fun e!273636 () Bool)

(declare-fun tp_is_empty!12913 () Bool)

(assert (=> b!467726 (= e!273636 tp_is_empty!12913)))

(declare-fun mapIsEmpty!21061 () Bool)

(assert (=> mapIsEmpty!21061 mapRes!21061))

(declare-fun b!467727 () Bool)

(assert (=> b!467727 (= e!273632 tp_is_empty!12913)))

(declare-fun b!467728 () Bool)

(declare-fun res!279522 () Bool)

(declare-fun e!273637 () Bool)

(assert (=> b!467728 (=> (not res!279522) (not e!273637))))

(declare-datatypes ((array!29605 0))(
  ( (array!29606 (arr!14229 (Array (_ BitVec 32) (_ BitVec 64))) (size!14581 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29605)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29605 (_ BitVec 32)) Bool)

(assert (=> b!467728 (= res!279522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467729 () Bool)

(declare-fun e!273633 () Bool)

(assert (=> b!467729 (= e!273633 true)))

(declare-fun minValueBefore!38 () V!18323)

(declare-datatypes ((tuple2!8532 0))(
  ( (tuple2!8533 (_1!4277 (_ BitVec 64)) (_2!4277 V!18323)) )
))
(declare-datatypes ((List!8619 0))(
  ( (Nil!8616) (Cons!8615 (h!9471 tuple2!8532) (t!14575 List!8619)) )
))
(declare-datatypes ((ListLongMap!7445 0))(
  ( (ListLongMap!7446 (toList!3738 List!8619)) )
))
(declare-fun lt!211476 () ListLongMap!7445)

(declare-fun zeroValue!794 () V!18323)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2167 (array!29605 array!29603 (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 (_ BitVec 32) Int) ListLongMap!7445)

(assert (=> b!467729 (= lt!211476 (getCurrentListMap!2167 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467730 () Bool)

(declare-fun res!279523 () Bool)

(assert (=> b!467730 (=> (not res!279523) (not e!273637))))

(declare-datatypes ((List!8620 0))(
  ( (Nil!8617) (Cons!8616 (h!9472 (_ BitVec 64)) (t!14576 List!8620)) )
))
(declare-fun arrayNoDuplicates!0 (array!29605 (_ BitVec 32) List!8620) Bool)

(assert (=> b!467730 (= res!279523 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8617))))

(declare-fun b!467731 () Bool)

(declare-fun res!279524 () Bool)

(assert (=> b!467731 (=> (not res!279524) (not e!273637))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467731 (= res!279524 (and (= (size!14580 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14581 _keys!1025) (size!14580 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279526 () Bool)

(assert (=> start!41896 (=> (not res!279526) (not e!273637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41896 (= res!279526 (validMask!0 mask!1365))))

(assert (=> start!41896 e!273637))

(assert (=> start!41896 tp_is_empty!12913))

(assert (=> start!41896 tp!40467))

(assert (=> start!41896 true))

(declare-fun array_inv!10268 (array!29605) Bool)

(assert (=> start!41896 (array_inv!10268 _keys!1025)))

(declare-fun e!273635 () Bool)

(declare-fun array_inv!10269 (array!29603) Bool)

(assert (=> start!41896 (and (array_inv!10269 _values!833) e!273635)))

(declare-fun b!467732 () Bool)

(assert (=> b!467732 (= e!273637 (not e!273633))))

(declare-fun res!279525 () Bool)

(assert (=> b!467732 (=> res!279525 e!273633)))

(assert (=> b!467732 (= res!279525 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211479 () ListLongMap!7445)

(declare-fun lt!211477 () ListLongMap!7445)

(assert (=> b!467732 (= lt!211479 lt!211477)))

(declare-datatypes ((Unit!13636 0))(
  ( (Unit!13637) )
))
(declare-fun lt!211478 () Unit!13636)

(declare-fun minValueAfter!38 () V!18323)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!92 (array!29605 array!29603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 V!18323 V!18323 (_ BitVec 32) Int) Unit!13636)

(assert (=> b!467732 (= lt!211478 (lemmaNoChangeToArrayThenSameMapNoExtras!92 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1912 (array!29605 array!29603 (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 (_ BitVec 32) Int) ListLongMap!7445)

(assert (=> b!467732 (= lt!211477 (getCurrentListMapNoExtraKeys!1912 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467732 (= lt!211479 (getCurrentListMapNoExtraKeys!1912 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467733 () Bool)

(assert (=> b!467733 (= e!273635 (and e!273636 mapRes!21061))))

(declare-fun condMapEmpty!21061 () Bool)

(declare-fun mapDefault!21061 () ValueCell!6113)

