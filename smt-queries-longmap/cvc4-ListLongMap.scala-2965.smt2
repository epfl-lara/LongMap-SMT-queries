; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42050 () Bool)

(assert start!42050)

(declare-fun b_free!11603 () Bool)

(declare-fun b_next!11603 () Bool)

(assert (=> start!42050 (= b_free!11603 (not b_next!11603))))

(declare-fun tp!40827 () Bool)

(declare-fun b_and!20013 () Bool)

(assert (=> start!42050 (= tp!40827 b_and!20013)))

(declare-fun b!469469 () Bool)

(declare-fun e!274901 () Bool)

(declare-fun tp_is_empty!13031 () Bool)

(assert (=> b!469469 (= e!274901 tp_is_empty!13031)))

(declare-fun b!469470 () Bool)

(declare-fun res!280545 () Bool)

(declare-fun e!274905 () Bool)

(assert (=> b!469470 (=> (not res!280545) (not e!274905))))

(declare-datatypes ((array!29835 0))(
  ( (array!29836 (arr!14342 (Array (_ BitVec 32) (_ BitVec 64))) (size!14694 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29835)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29835 (_ BitVec 32)) Bool)

(assert (=> b!469470 (= res!280545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469471 () Bool)

(declare-fun e!274900 () Bool)

(assert (=> b!469471 (= e!274900 true)))

(declare-datatypes ((V!18479 0))(
  ( (V!18480 (val!6560 Int)) )
))
(declare-datatypes ((tuple2!8634 0))(
  ( (tuple2!8635 (_1!4328 (_ BitVec 64)) (_2!4328 V!18479)) )
))
(declare-datatypes ((List!8713 0))(
  ( (Nil!8710) (Cons!8709 (h!9565 tuple2!8634) (t!14673 List!8713)) )
))
(declare-datatypes ((ListLongMap!7547 0))(
  ( (ListLongMap!7548 (toList!3789 List!8713)) )
))
(declare-fun lt!212736 () ListLongMap!7547)

(declare-fun lt!212741 () tuple2!8634)

(declare-fun minValueBefore!38 () V!18479)

(declare-fun +!1697 (ListLongMap!7547 tuple2!8634) ListLongMap!7547)

(assert (=> b!469471 (= (+!1697 lt!212736 lt!212741) (+!1697 (+!1697 lt!212736 (tuple2!8635 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212741))))

(declare-fun minValueAfter!38 () V!18479)

(assert (=> b!469471 (= lt!212741 (tuple2!8635 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13735 0))(
  ( (Unit!13736) )
))
(declare-fun lt!212735 () Unit!13735)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!110 (ListLongMap!7547 (_ BitVec 64) V!18479 V!18479) Unit!13735)

(assert (=> b!469471 (= lt!212735 (addSameAsAddTwiceSameKeyDiffValues!110 lt!212736 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18479)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212738 () ListLongMap!7547)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6172 0))(
  ( (ValueCellFull!6172 (v!8850 V!18479)) (EmptyCell!6172) )
))
(declare-datatypes ((array!29837 0))(
  ( (array!29838 (arr!14343 (Array (_ BitVec 32) ValueCell!6172)) (size!14695 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29837)

(declare-fun getCurrentListMap!2211 (array!29835 array!29837 (_ BitVec 32) (_ BitVec 32) V!18479 V!18479 (_ BitVec 32) Int) ListLongMap!7547)

(assert (=> b!469471 (= lt!212738 (getCurrentListMap!2211 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212737 () ListLongMap!7547)

(assert (=> b!469471 (= lt!212737 (getCurrentListMap!2211 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21244 () Bool)

(declare-fun mapRes!21244 () Bool)

(assert (=> mapIsEmpty!21244 mapRes!21244))

(declare-fun res!280544 () Bool)

(assert (=> start!42050 (=> (not res!280544) (not e!274905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42050 (= res!280544 (validMask!0 mask!1365))))

(assert (=> start!42050 e!274905))

(assert (=> start!42050 tp_is_empty!13031))

(assert (=> start!42050 tp!40827))

(assert (=> start!42050 true))

(declare-fun array_inv!10350 (array!29835) Bool)

(assert (=> start!42050 (array_inv!10350 _keys!1025)))

(declare-fun e!274904 () Bool)

(declare-fun array_inv!10351 (array!29837) Bool)

(assert (=> start!42050 (and (array_inv!10351 _values!833) e!274904)))

(declare-fun b!469472 () Bool)

(assert (=> b!469472 (= e!274905 (not e!274900))))

(declare-fun res!280543 () Bool)

(assert (=> b!469472 (=> res!280543 e!274900)))

(assert (=> b!469472 (= res!280543 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212740 () ListLongMap!7547)

(assert (=> b!469472 (= lt!212736 lt!212740)))

(declare-fun lt!212739 () Unit!13735)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!137 (array!29835 array!29837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18479 V!18479 V!18479 V!18479 (_ BitVec 32) Int) Unit!13735)

(assert (=> b!469472 (= lt!212739 (lemmaNoChangeToArrayThenSameMapNoExtras!137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1957 (array!29835 array!29837 (_ BitVec 32) (_ BitVec 32) V!18479 V!18479 (_ BitVec 32) Int) ListLongMap!7547)

(assert (=> b!469472 (= lt!212740 (getCurrentListMapNoExtraKeys!1957 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469472 (= lt!212736 (getCurrentListMapNoExtraKeys!1957 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469473 () Bool)

(declare-fun res!280546 () Bool)

(assert (=> b!469473 (=> (not res!280546) (not e!274905))))

(declare-datatypes ((List!8714 0))(
  ( (Nil!8711) (Cons!8710 (h!9566 (_ BitVec 64)) (t!14674 List!8714)) )
))
(declare-fun arrayNoDuplicates!0 (array!29835 (_ BitVec 32) List!8714) Bool)

(assert (=> b!469473 (= res!280546 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8711))))

(declare-fun b!469474 () Bool)

(declare-fun res!280542 () Bool)

(assert (=> b!469474 (=> (not res!280542) (not e!274905))))

(assert (=> b!469474 (= res!280542 (and (= (size!14695 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14694 _keys!1025) (size!14695 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21244 () Bool)

(declare-fun tp!40828 () Bool)

(assert (=> mapNonEmpty!21244 (= mapRes!21244 (and tp!40828 e!274901))))

(declare-fun mapValue!21244 () ValueCell!6172)

(declare-fun mapKey!21244 () (_ BitVec 32))

(declare-fun mapRest!21244 () (Array (_ BitVec 32) ValueCell!6172))

(assert (=> mapNonEmpty!21244 (= (arr!14343 _values!833) (store mapRest!21244 mapKey!21244 mapValue!21244))))

(declare-fun b!469475 () Bool)

(declare-fun e!274902 () Bool)

(assert (=> b!469475 (= e!274902 tp_is_empty!13031)))

(declare-fun b!469476 () Bool)

(assert (=> b!469476 (= e!274904 (and e!274902 mapRes!21244))))

(declare-fun condMapEmpty!21244 () Bool)

(declare-fun mapDefault!21244 () ValueCell!6172)

