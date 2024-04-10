; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42394 () Bool)

(assert start!42394)

(declare-fun b_free!11869 () Bool)

(declare-fun b_next!11869 () Bool)

(assert (=> start!42394 (= b_free!11869 (not b_next!11869))))

(declare-fun tp!41640 () Bool)

(declare-fun b_and!20325 () Bool)

(assert (=> start!42394 (= tp!41640 b_and!20325)))

(declare-fun b!473000 () Bool)

(declare-fun e!277423 () Bool)

(declare-fun tp_is_empty!13297 () Bool)

(assert (=> b!473000 (= e!277423 tp_is_empty!13297)))

(declare-fun b!473001 () Bool)

(declare-fun e!277424 () Bool)

(assert (=> b!473001 (= e!277424 true)))

(declare-datatypes ((V!18835 0))(
  ( (V!18836 (val!6693 Int)) )
))
(declare-datatypes ((tuple2!8816 0))(
  ( (tuple2!8817 (_1!4419 (_ BitVec 64)) (_2!4419 V!18835)) )
))
(declare-datatypes ((List!8900 0))(
  ( (Nil!8897) (Cons!8896 (h!9752 tuple2!8816) (t!14870 List!8900)) )
))
(declare-datatypes ((ListLongMap!7729 0))(
  ( (ListLongMap!7730 (toList!3880 List!8900)) )
))
(declare-fun lt!214708 () ListLongMap!7729)

(declare-fun lt!214706 () tuple2!8816)

(declare-fun minValueBefore!38 () V!18835)

(declare-fun +!1720 (ListLongMap!7729 tuple2!8816) ListLongMap!7729)

(assert (=> b!473001 (= (+!1720 lt!214708 lt!214706) (+!1720 (+!1720 lt!214708 (tuple2!8817 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214706))))

(declare-fun minValueAfter!38 () V!18835)

(assert (=> b!473001 (= lt!214706 (tuple2!8817 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13916 0))(
  ( (Unit!13917) )
))
(declare-fun lt!214701 () Unit!13916)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!129 (ListLongMap!7729 (_ BitVec 64) V!18835 V!18835) Unit!13916)

(assert (=> b!473001 (= lt!214701 (addSameAsAddTwiceSameKeyDiffValues!129 lt!214708 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214707 () ListLongMap!7729)

(declare-fun zeroValue!794 () V!18835)

(assert (=> b!473001 (= lt!214708 (+!1720 lt!214707 (tuple2!8817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214703 () ListLongMap!7729)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30353 0))(
  ( (array!30354 (arr!14596 (Array (_ BitVec 32) (_ BitVec 64))) (size!14948 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30353)

(declare-datatypes ((ValueCell!6305 0))(
  ( (ValueCellFull!6305 (v!8984 V!18835)) (EmptyCell!6305) )
))
(declare-datatypes ((array!30355 0))(
  ( (array!30356 (arr!14597 (Array (_ BitVec 32) ValueCell!6305)) (size!14949 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30355)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2249 (array!30353 array!30355 (_ BitVec 32) (_ BitVec 32) V!18835 V!18835 (_ BitVec 32) Int) ListLongMap!7729)

(assert (=> b!473001 (= lt!214703 (getCurrentListMap!2249 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!214705 () ListLongMap!7729)

(assert (=> b!473001 (= lt!214705 (getCurrentListMap!2249 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473002 () Bool)

(declare-fun res!282523 () Bool)

(declare-fun e!277422 () Bool)

(assert (=> b!473002 (=> (not res!282523) (not e!277422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30353 (_ BitVec 32)) Bool)

(assert (=> b!473002 (= res!282523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473003 () Bool)

(declare-fun e!277426 () Bool)

(assert (=> b!473003 (= e!277426 tp_is_empty!13297)))

(declare-fun mapIsEmpty!21658 () Bool)

(declare-fun mapRes!21658 () Bool)

(assert (=> mapIsEmpty!21658 mapRes!21658))

(declare-fun mapNonEmpty!21658 () Bool)

(declare-fun tp!41641 () Bool)

(assert (=> mapNonEmpty!21658 (= mapRes!21658 (and tp!41641 e!277423))))

(declare-fun mapValue!21658 () ValueCell!6305)

(declare-fun mapKey!21658 () (_ BitVec 32))

(declare-fun mapRest!21658 () (Array (_ BitVec 32) ValueCell!6305))

(assert (=> mapNonEmpty!21658 (= (arr!14597 _values!833) (store mapRest!21658 mapKey!21658 mapValue!21658))))

(declare-fun res!282526 () Bool)

(assert (=> start!42394 (=> (not res!282526) (not e!277422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42394 (= res!282526 (validMask!0 mask!1365))))

(assert (=> start!42394 e!277422))

(assert (=> start!42394 tp_is_empty!13297))

(assert (=> start!42394 tp!41640))

(assert (=> start!42394 true))

(declare-fun array_inv!10526 (array!30353) Bool)

(assert (=> start!42394 (array_inv!10526 _keys!1025)))

(declare-fun e!277427 () Bool)

(declare-fun array_inv!10527 (array!30355) Bool)

(assert (=> start!42394 (and (array_inv!10527 _values!833) e!277427)))

(declare-fun b!473004 () Bool)

(declare-fun res!282522 () Bool)

(assert (=> b!473004 (=> (not res!282522) (not e!277422))))

(declare-datatypes ((List!8901 0))(
  ( (Nil!8898) (Cons!8897 (h!9753 (_ BitVec 64)) (t!14871 List!8901)) )
))
(declare-fun arrayNoDuplicates!0 (array!30353 (_ BitVec 32) List!8901) Bool)

(assert (=> b!473004 (= res!282522 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8898))))

(declare-fun b!473005 () Bool)

(declare-fun res!282525 () Bool)

(assert (=> b!473005 (=> (not res!282525) (not e!277422))))

(assert (=> b!473005 (= res!282525 (and (= (size!14949 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14948 _keys!1025) (size!14949 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473006 () Bool)

(assert (=> b!473006 (= e!277427 (and e!277426 mapRes!21658))))

(declare-fun condMapEmpty!21658 () Bool)

(declare-fun mapDefault!21658 () ValueCell!6305)

