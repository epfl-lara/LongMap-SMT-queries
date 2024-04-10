; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41912 () Bool)

(assert start!41912)

(declare-fun b_free!11501 () Bool)

(declare-fun b_next!11501 () Bool)

(assert (=> start!41912 (= b_free!11501 (not b_next!11501))))

(declare-fun tp!40515 () Bool)

(declare-fun b_and!19889 () Bool)

(assert (=> start!41912 (= tp!40515 b_and!19889)))

(declare-fun mapNonEmpty!21085 () Bool)

(declare-fun mapRes!21085 () Bool)

(declare-fun tp!40516 () Bool)

(declare-fun e!273781 () Bool)

(assert (=> mapNonEmpty!21085 (= mapRes!21085 (and tp!40516 e!273781))))

(declare-datatypes ((V!18343 0))(
  ( (V!18344 (val!6509 Int)) )
))
(declare-datatypes ((ValueCell!6121 0))(
  ( (ValueCellFull!6121 (v!8798 V!18343)) (EmptyCell!6121) )
))
(declare-fun mapRest!21085 () (Array (_ BitVec 32) ValueCell!6121))

(declare-fun mapValue!21085 () ValueCell!6121)

(declare-fun mapKey!21085 () (_ BitVec 32))

(declare-datatypes ((array!29635 0))(
  ( (array!29636 (arr!14244 (Array (_ BitVec 32) ValueCell!6121)) (size!14596 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29635)

(assert (=> mapNonEmpty!21085 (= (arr!14244 _values!833) (store mapRest!21085 mapKey!21085 mapValue!21085))))

(declare-fun b!467918 () Bool)

(declare-fun res!279644 () Bool)

(declare-fun e!273780 () Bool)

(assert (=> b!467918 (=> (not res!279644) (not e!273780))))

(declare-datatypes ((array!29637 0))(
  ( (array!29638 (arr!14245 (Array (_ BitVec 32) (_ BitVec 64))) (size!14597 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29637)

(declare-datatypes ((List!8634 0))(
  ( (Nil!8631) (Cons!8630 (h!9486 (_ BitVec 64)) (t!14590 List!8634)) )
))
(declare-fun arrayNoDuplicates!0 (array!29637 (_ BitVec 32) List!8634) Bool)

(assert (=> b!467918 (= res!279644 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8631))))

(declare-fun mapIsEmpty!21085 () Bool)

(assert (=> mapIsEmpty!21085 mapRes!21085))

(declare-fun b!467919 () Bool)

(declare-fun e!273779 () Bool)

(declare-fun tp_is_empty!12929 () Bool)

(assert (=> b!467919 (= e!273779 tp_is_empty!12929)))

(declare-fun b!467921 () Bool)

(declare-fun e!273777 () Bool)

(assert (=> b!467921 (= e!273777 true)))

(declare-fun minValueBefore!38 () V!18343)

(declare-fun zeroValue!794 () V!18343)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8546 0))(
  ( (tuple2!8547 (_1!4284 (_ BitVec 64)) (_2!4284 V!18343)) )
))
(declare-datatypes ((List!8635 0))(
  ( (Nil!8632) (Cons!8631 (h!9487 tuple2!8546) (t!14591 List!8635)) )
))
(declare-datatypes ((ListLongMap!7459 0))(
  ( (ListLongMap!7460 (toList!3745 List!8635)) )
))
(declare-fun lt!211572 () ListLongMap!7459)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2174 (array!29637 array!29635 (_ BitVec 32) (_ BitVec 32) V!18343 V!18343 (_ BitVec 32) Int) ListLongMap!7459)

(assert (=> b!467921 (= lt!211572 (getCurrentListMap!2174 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467922 () Bool)

(assert (=> b!467922 (= e!273780 (not e!273777))))

(declare-fun res!279645 () Bool)

(assert (=> b!467922 (=> res!279645 e!273777)))

(assert (=> b!467922 (= res!279645 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211573 () ListLongMap!7459)

(declare-fun lt!211574 () ListLongMap!7459)

(assert (=> b!467922 (= lt!211573 lt!211574)))

(declare-datatypes ((Unit!13650 0))(
  ( (Unit!13651) )
))
(declare-fun lt!211575 () Unit!13650)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18343)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!99 (array!29637 array!29635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18343 V!18343 V!18343 V!18343 (_ BitVec 32) Int) Unit!13650)

(assert (=> b!467922 (= lt!211575 (lemmaNoChangeToArrayThenSameMapNoExtras!99 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1919 (array!29637 array!29635 (_ BitVec 32) (_ BitVec 32) V!18343 V!18343 (_ BitVec 32) Int) ListLongMap!7459)

(assert (=> b!467922 (= lt!211574 (getCurrentListMapNoExtraKeys!1919 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467922 (= lt!211573 (getCurrentListMapNoExtraKeys!1919 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467923 () Bool)

(declare-fun res!279643 () Bool)

(assert (=> b!467923 (=> (not res!279643) (not e!273780))))

(assert (=> b!467923 (= res!279643 (and (= (size!14596 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14597 _keys!1025) (size!14596 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467920 () Bool)

(declare-fun e!273776 () Bool)

(assert (=> b!467920 (= e!273776 (and e!273779 mapRes!21085))))

(declare-fun condMapEmpty!21085 () Bool)

(declare-fun mapDefault!21085 () ValueCell!6121)

