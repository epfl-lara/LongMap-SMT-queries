; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41914 () Bool)

(assert start!41914)

(declare-fun b_free!11503 () Bool)

(declare-fun b_next!11503 () Bool)

(assert (=> start!41914 (= b_free!11503 (not b_next!11503))))

(declare-fun tp!40521 () Bool)

(declare-fun b_and!19891 () Bool)

(assert (=> start!41914 (= tp!40521 b_and!19891)))

(declare-fun b!467942 () Bool)

(declare-fun e!273798 () Bool)

(declare-fun e!273797 () Bool)

(assert (=> b!467942 (= e!273798 (not e!273797))))

(declare-fun res!279659 () Bool)

(assert (=> b!467942 (=> res!279659 e!273797)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467942 (= res!279659 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18347 0))(
  ( (V!18348 (val!6510 Int)) )
))
(declare-datatypes ((tuple2!8548 0))(
  ( (tuple2!8549 (_1!4285 (_ BitVec 64)) (_2!4285 V!18347)) )
))
(declare-datatypes ((List!8636 0))(
  ( (Nil!8633) (Cons!8632 (h!9488 tuple2!8548) (t!14592 List!8636)) )
))
(declare-datatypes ((ListLongMap!7461 0))(
  ( (ListLongMap!7462 (toList!3746 List!8636)) )
))
(declare-fun lt!211586 () ListLongMap!7461)

(declare-fun lt!211585 () ListLongMap!7461)

(assert (=> b!467942 (= lt!211586 lt!211585)))

(declare-fun minValueBefore!38 () V!18347)

(declare-datatypes ((Unit!13652 0))(
  ( (Unit!13653) )
))
(declare-fun lt!211584 () Unit!13652)

(declare-fun zeroValue!794 () V!18347)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29639 0))(
  ( (array!29640 (arr!14246 (Array (_ BitVec 32) (_ BitVec 64))) (size!14598 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29639)

(declare-datatypes ((ValueCell!6122 0))(
  ( (ValueCellFull!6122 (v!8799 V!18347)) (EmptyCell!6122) )
))
(declare-datatypes ((array!29641 0))(
  ( (array!29642 (arr!14247 (Array (_ BitVec 32) ValueCell!6122)) (size!14599 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29641)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18347)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!100 (array!29639 array!29641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 V!18347 V!18347 (_ BitVec 32) Int) Unit!13652)

(assert (=> b!467942 (= lt!211584 (lemmaNoChangeToArrayThenSameMapNoExtras!100 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1920 (array!29639 array!29641 (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 (_ BitVec 32) Int) ListLongMap!7461)

(assert (=> b!467942 (= lt!211585 (getCurrentListMapNoExtraKeys!1920 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467942 (= lt!211586 (getCurrentListMapNoExtraKeys!1920 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467943 () Bool)

(declare-fun res!279661 () Bool)

(assert (=> b!467943 (=> (not res!279661) (not e!273798))))

(assert (=> b!467943 (= res!279661 (and (= (size!14599 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14598 _keys!1025) (size!14599 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21088 () Bool)

(declare-fun mapRes!21088 () Bool)

(declare-fun tp!40522 () Bool)

(declare-fun e!273796 () Bool)

(assert (=> mapNonEmpty!21088 (= mapRes!21088 (and tp!40522 e!273796))))

(declare-fun mapValue!21088 () ValueCell!6122)

(declare-fun mapKey!21088 () (_ BitVec 32))

(declare-fun mapRest!21088 () (Array (_ BitVec 32) ValueCell!6122))

(assert (=> mapNonEmpty!21088 (= (arr!14247 _values!833) (store mapRest!21088 mapKey!21088 mapValue!21088))))

(declare-fun b!467944 () Bool)

(declare-fun res!279660 () Bool)

(assert (=> b!467944 (=> (not res!279660) (not e!273798))))

(declare-datatypes ((List!8637 0))(
  ( (Nil!8634) (Cons!8633 (h!9489 (_ BitVec 64)) (t!14593 List!8637)) )
))
(declare-fun arrayNoDuplicates!0 (array!29639 (_ BitVec 32) List!8637) Bool)

(assert (=> b!467944 (= res!279660 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8634))))

(declare-fun b!467945 () Bool)

(declare-fun res!279658 () Bool)

(assert (=> b!467945 (=> (not res!279658) (not e!273798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29639 (_ BitVec 32)) Bool)

(assert (=> b!467945 (= res!279658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467946 () Bool)

(assert (=> b!467946 (= e!273797 true)))

(declare-fun lt!211587 () ListLongMap!7461)

(declare-fun getCurrentListMap!2175 (array!29639 array!29641 (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 (_ BitVec 32) Int) ListLongMap!7461)

(assert (=> b!467946 (= lt!211587 (getCurrentListMap!2175 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279657 () Bool)

(assert (=> start!41914 (=> (not res!279657) (not e!273798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41914 (= res!279657 (validMask!0 mask!1365))))

(assert (=> start!41914 e!273798))

(declare-fun tp_is_empty!12931 () Bool)

(assert (=> start!41914 tp_is_empty!12931))

(assert (=> start!41914 tp!40521))

(assert (=> start!41914 true))

(declare-fun array_inv!10284 (array!29639) Bool)

(assert (=> start!41914 (array_inv!10284 _keys!1025)))

(declare-fun e!273795 () Bool)

(declare-fun array_inv!10285 (array!29641) Bool)

(assert (=> start!41914 (and (array_inv!10285 _values!833) e!273795)))

(declare-fun b!467947 () Bool)

(declare-fun e!273799 () Bool)

(assert (=> b!467947 (= e!273799 tp_is_empty!12931)))

(declare-fun mapIsEmpty!21088 () Bool)

(assert (=> mapIsEmpty!21088 mapRes!21088))

(declare-fun b!467948 () Bool)

(assert (=> b!467948 (= e!273795 (and e!273799 mapRes!21088))))

(declare-fun condMapEmpty!21088 () Bool)

(declare-fun mapDefault!21088 () ValueCell!6122)

