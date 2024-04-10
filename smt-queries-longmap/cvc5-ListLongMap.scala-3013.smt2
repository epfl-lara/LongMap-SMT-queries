; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42412 () Bool)

(assert start!42412)

(declare-fun b_free!11887 () Bool)

(declare-fun b_next!11887 () Bool)

(assert (=> start!42412 (= b_free!11887 (not b_next!11887))))

(declare-fun tp!41694 () Bool)

(declare-fun b_and!20343 () Bool)

(assert (=> start!42412 (= tp!41694 b_and!20343)))

(declare-fun mapIsEmpty!21685 () Bool)

(declare-fun mapRes!21685 () Bool)

(assert (=> mapIsEmpty!21685 mapRes!21685))

(declare-fun b!473216 () Bool)

(declare-fun e!277587 () Bool)

(declare-fun e!277588 () Bool)

(assert (=> b!473216 (= e!277587 (not e!277588))))

(declare-fun res!282659 () Bool)

(assert (=> b!473216 (=> res!282659 e!277588)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473216 (= res!282659 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18859 0))(
  ( (V!18860 (val!6702 Int)) )
))
(declare-datatypes ((tuple2!8828 0))(
  ( (tuple2!8829 (_1!4425 (_ BitVec 64)) (_2!4425 V!18859)) )
))
(declare-datatypes ((List!8911 0))(
  ( (Nil!8908) (Cons!8907 (h!9763 tuple2!8828) (t!14881 List!8911)) )
))
(declare-datatypes ((ListLongMap!7741 0))(
  ( (ListLongMap!7742 (toList!3886 List!8911)) )
))
(declare-fun lt!214920 () ListLongMap!7741)

(declare-fun lt!214921 () ListLongMap!7741)

(assert (=> b!473216 (= lt!214920 lt!214921)))

(declare-fun minValueBefore!38 () V!18859)

(declare-fun zeroValue!794 () V!18859)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13928 0))(
  ( (Unit!13929) )
))
(declare-fun lt!214917 () Unit!13928)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30389 0))(
  ( (array!30390 (arr!14614 (Array (_ BitVec 32) (_ BitVec 64))) (size!14966 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30389)

(declare-datatypes ((ValueCell!6314 0))(
  ( (ValueCellFull!6314 (v!8993 V!18859)) (EmptyCell!6314) )
))
(declare-datatypes ((array!30391 0))(
  ( (array!30392 (arr!14615 (Array (_ BitVec 32) ValueCell!6314)) (size!14967 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30391)

(declare-fun minValueAfter!38 () V!18859)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!226 (array!30389 array!30391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 V!18859 V!18859 (_ BitVec 32) Int) Unit!13928)

(assert (=> b!473216 (= lt!214917 (lemmaNoChangeToArrayThenSameMapNoExtras!226 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2046 (array!30389 array!30391 (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 (_ BitVec 32) Int) ListLongMap!7741)

(assert (=> b!473216 (= lt!214921 (getCurrentListMapNoExtraKeys!2046 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473216 (= lt!214920 (getCurrentListMapNoExtraKeys!2046 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21685 () Bool)

(declare-fun tp!41695 () Bool)

(declare-fun e!277589 () Bool)

(assert (=> mapNonEmpty!21685 (= mapRes!21685 (and tp!41695 e!277589))))

(declare-fun mapKey!21685 () (_ BitVec 32))

(declare-fun mapRest!21685 () (Array (_ BitVec 32) ValueCell!6314))

(declare-fun mapValue!21685 () ValueCell!6314)

(assert (=> mapNonEmpty!21685 (= (arr!14615 _values!833) (store mapRest!21685 mapKey!21685 mapValue!21685))))

(declare-fun res!282660 () Bool)

(assert (=> start!42412 (=> (not res!282660) (not e!277587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42412 (= res!282660 (validMask!0 mask!1365))))

(assert (=> start!42412 e!277587))

(declare-fun tp_is_empty!13315 () Bool)

(assert (=> start!42412 tp_is_empty!13315))

(assert (=> start!42412 tp!41694))

(assert (=> start!42412 true))

(declare-fun array_inv!10544 (array!30389) Bool)

(assert (=> start!42412 (array_inv!10544 _keys!1025)))

(declare-fun e!277584 () Bool)

(declare-fun array_inv!10545 (array!30391) Bool)

(assert (=> start!42412 (and (array_inv!10545 _values!833) e!277584)))

(declare-fun b!473217 () Bool)

(declare-fun e!277586 () Bool)

(assert (=> b!473217 (= e!277586 tp_is_empty!13315)))

(declare-fun b!473218 () Bool)

(assert (=> b!473218 (= e!277588 true)))

(declare-fun lt!214918 () ListLongMap!7741)

(declare-fun lt!214919 () tuple2!8828)

(declare-fun +!1725 (ListLongMap!7741 tuple2!8828) ListLongMap!7741)

(assert (=> b!473218 (= (+!1725 lt!214918 lt!214919) (+!1725 (+!1725 lt!214918 (tuple2!8829 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214919))))

(assert (=> b!473218 (= lt!214919 (tuple2!8829 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214924 () Unit!13928)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!134 (ListLongMap!7741 (_ BitVec 64) V!18859 V!18859) Unit!13928)

(assert (=> b!473218 (= lt!214924 (addSameAsAddTwiceSameKeyDiffValues!134 lt!214918 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473218 (= lt!214918 (+!1725 lt!214920 (tuple2!8829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214922 () ListLongMap!7741)

(declare-fun getCurrentListMap!2254 (array!30389 array!30391 (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 (_ BitVec 32) Int) ListLongMap!7741)

(assert (=> b!473218 (= lt!214922 (getCurrentListMap!2254 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214923 () ListLongMap!7741)

(assert (=> b!473218 (= lt!214923 (getCurrentListMap!2254 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473219 () Bool)

(declare-fun res!282657 () Bool)

(assert (=> b!473219 (=> (not res!282657) (not e!277587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30389 (_ BitVec 32)) Bool)

(assert (=> b!473219 (= res!282657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473220 () Bool)

(assert (=> b!473220 (= e!277589 tp_is_empty!13315)))

(declare-fun b!473221 () Bool)

(declare-fun res!282661 () Bool)

(assert (=> b!473221 (=> (not res!282661) (not e!277587))))

(declare-datatypes ((List!8912 0))(
  ( (Nil!8909) (Cons!8908 (h!9764 (_ BitVec 64)) (t!14882 List!8912)) )
))
(declare-fun arrayNoDuplicates!0 (array!30389 (_ BitVec 32) List!8912) Bool)

(assert (=> b!473221 (= res!282661 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8909))))

(declare-fun b!473222 () Bool)

(assert (=> b!473222 (= e!277584 (and e!277586 mapRes!21685))))

(declare-fun condMapEmpty!21685 () Bool)

(declare-fun mapDefault!21685 () ValueCell!6314)

