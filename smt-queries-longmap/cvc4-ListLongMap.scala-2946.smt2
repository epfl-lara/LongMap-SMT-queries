; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41900 () Bool)

(assert start!41900)

(declare-fun b_free!11489 () Bool)

(declare-fun b_next!11489 () Bool)

(assert (=> start!41900 (= b_free!11489 (not b_next!11489))))

(declare-fun tp!40480 () Bool)

(declare-fun b_and!19877 () Bool)

(assert (=> start!41900 (= tp!40480 b_and!19877)))

(declare-fun b!467774 () Bool)

(declare-fun e!273672 () Bool)

(declare-fun e!273673 () Bool)

(assert (=> b!467774 (= e!273672 (not e!273673))))

(declare-fun res!279554 () Bool)

(assert (=> b!467774 (=> res!279554 e!273673)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467774 (= res!279554 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18327 0))(
  ( (V!18328 (val!6503 Int)) )
))
(declare-datatypes ((tuple2!8536 0))(
  ( (tuple2!8537 (_1!4279 (_ BitVec 64)) (_2!4279 V!18327)) )
))
(declare-datatypes ((List!8623 0))(
  ( (Nil!8620) (Cons!8619 (h!9475 tuple2!8536) (t!14579 List!8623)) )
))
(declare-datatypes ((ListLongMap!7449 0))(
  ( (ListLongMap!7450 (toList!3740 List!8623)) )
))
(declare-fun lt!211500 () ListLongMap!7449)

(declare-fun lt!211502 () ListLongMap!7449)

(assert (=> b!467774 (= lt!211500 lt!211502)))

(declare-datatypes ((Unit!13640 0))(
  ( (Unit!13641) )
))
(declare-fun lt!211501 () Unit!13640)

(declare-fun minValueBefore!38 () V!18327)

(declare-fun zeroValue!794 () V!18327)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29611 0))(
  ( (array!29612 (arr!14232 (Array (_ BitVec 32) (_ BitVec 64))) (size!14584 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29611)

(declare-datatypes ((ValueCell!6115 0))(
  ( (ValueCellFull!6115 (v!8792 V!18327)) (EmptyCell!6115) )
))
(declare-datatypes ((array!29613 0))(
  ( (array!29614 (arr!14233 (Array (_ BitVec 32) ValueCell!6115)) (size!14585 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29613)

(declare-fun minValueAfter!38 () V!18327)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!94 (array!29611 array!29613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18327 V!18327 V!18327 V!18327 (_ BitVec 32) Int) Unit!13640)

(assert (=> b!467774 (= lt!211501 (lemmaNoChangeToArrayThenSameMapNoExtras!94 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1914 (array!29611 array!29613 (_ BitVec 32) (_ BitVec 32) V!18327 V!18327 (_ BitVec 32) Int) ListLongMap!7449)

(assert (=> b!467774 (= lt!211502 (getCurrentListMapNoExtraKeys!1914 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467774 (= lt!211500 (getCurrentListMapNoExtraKeys!1914 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21067 () Bool)

(declare-fun mapRes!21067 () Bool)

(assert (=> mapIsEmpty!21067 mapRes!21067))

(declare-fun b!467775 () Bool)

(declare-fun res!279555 () Bool)

(assert (=> b!467775 (=> (not res!279555) (not e!273672))))

(assert (=> b!467775 (= res!279555 (and (= (size!14585 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14584 _keys!1025) (size!14585 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467776 () Bool)

(assert (=> b!467776 (= e!273673 true)))

(declare-fun lt!211503 () ListLongMap!7449)

(declare-fun getCurrentListMap!2169 (array!29611 array!29613 (_ BitVec 32) (_ BitVec 32) V!18327 V!18327 (_ BitVec 32) Int) ListLongMap!7449)

(assert (=> b!467776 (= lt!211503 (getCurrentListMap!2169 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21067 () Bool)

(declare-fun tp!40479 () Bool)

(declare-fun e!273669 () Bool)

(assert (=> mapNonEmpty!21067 (= mapRes!21067 (and tp!40479 e!273669))))

(declare-fun mapRest!21067 () (Array (_ BitVec 32) ValueCell!6115))

(declare-fun mapValue!21067 () ValueCell!6115)

(declare-fun mapKey!21067 () (_ BitVec 32))

(assert (=> mapNonEmpty!21067 (= (arr!14233 _values!833) (store mapRest!21067 mapKey!21067 mapValue!21067))))

(declare-fun b!467778 () Bool)

(declare-fun res!279553 () Bool)

(assert (=> b!467778 (=> (not res!279553) (not e!273672))))

(declare-datatypes ((List!8624 0))(
  ( (Nil!8621) (Cons!8620 (h!9476 (_ BitVec 64)) (t!14580 List!8624)) )
))
(declare-fun arrayNoDuplicates!0 (array!29611 (_ BitVec 32) List!8624) Bool)

(assert (=> b!467778 (= res!279553 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8621))))

(declare-fun b!467779 () Bool)

(declare-fun res!279552 () Bool)

(assert (=> b!467779 (=> (not res!279552) (not e!273672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29611 (_ BitVec 32)) Bool)

(assert (=> b!467779 (= res!279552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!279556 () Bool)

(assert (=> start!41900 (=> (not res!279556) (not e!273672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41900 (= res!279556 (validMask!0 mask!1365))))

(assert (=> start!41900 e!273672))

(declare-fun tp_is_empty!12917 () Bool)

(assert (=> start!41900 tp_is_empty!12917))

(assert (=> start!41900 tp!40480))

(assert (=> start!41900 true))

(declare-fun array_inv!10272 (array!29611) Bool)

(assert (=> start!41900 (array_inv!10272 _keys!1025)))

(declare-fun e!273668 () Bool)

(declare-fun array_inv!10273 (array!29613) Bool)

(assert (=> start!41900 (and (array_inv!10273 _values!833) e!273668)))

(declare-fun b!467777 () Bool)

(assert (=> b!467777 (= e!273669 tp_is_empty!12917)))

(declare-fun b!467780 () Bool)

(declare-fun e!273671 () Bool)

(assert (=> b!467780 (= e!273671 tp_is_empty!12917)))

(declare-fun b!467781 () Bool)

(assert (=> b!467781 (= e!273668 (and e!273671 mapRes!21067))))

(declare-fun condMapEmpty!21067 () Bool)

(declare-fun mapDefault!21067 () ValueCell!6115)

