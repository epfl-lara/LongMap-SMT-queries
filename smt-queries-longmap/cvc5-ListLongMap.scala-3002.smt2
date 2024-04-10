; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42330 () Bool)

(assert start!42330)

(declare-fun b_free!11821 () Bool)

(declare-fun b_next!11821 () Bool)

(assert (=> start!42330 (= b_free!11821 (not b_next!11821))))

(declare-fun tp!41494 () Bool)

(declare-fun b_and!20267 () Bool)

(assert (=> start!42330 (= tp!41494 b_and!20267)))

(declare-fun res!282105 () Bool)

(declare-fun e!276900 () Bool)

(assert (=> start!42330 (=> (not res!282105) (not e!276900))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42330 (= res!282105 (validMask!0 mask!1365))))

(assert (=> start!42330 e!276900))

(declare-fun tp_is_empty!13249 () Bool)

(assert (=> start!42330 tp_is_empty!13249))

(assert (=> start!42330 tp!41494))

(assert (=> start!42330 true))

(declare-datatypes ((array!30255 0))(
  ( (array!30256 (arr!14548 (Array (_ BitVec 32) (_ BitVec 64))) (size!14900 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30255)

(declare-fun array_inv!10488 (array!30255) Bool)

(assert (=> start!42330 (array_inv!10488 _keys!1025)))

(declare-datatypes ((V!18771 0))(
  ( (V!18772 (val!6669 Int)) )
))
(declare-datatypes ((ValueCell!6281 0))(
  ( (ValueCellFull!6281 (v!8960 V!18771)) (EmptyCell!6281) )
))
(declare-datatypes ((array!30257 0))(
  ( (array!30258 (arr!14549 (Array (_ BitVec 32) ValueCell!6281)) (size!14901 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30257)

(declare-fun e!276899 () Bool)

(declare-fun array_inv!10489 (array!30257) Bool)

(assert (=> start!42330 (and (array_inv!10489 _values!833) e!276899)))

(declare-fun b!472276 () Bool)

(declare-fun e!276897 () Bool)

(assert (=> b!472276 (= e!276897 tp_is_empty!13249)))

(declare-fun mapNonEmpty!21583 () Bool)

(declare-fun mapRes!21583 () Bool)

(declare-fun tp!41493 () Bool)

(assert (=> mapNonEmpty!21583 (= mapRes!21583 (and tp!41493 e!276897))))

(declare-fun mapValue!21583 () ValueCell!6281)

(declare-fun mapRest!21583 () (Array (_ BitVec 32) ValueCell!6281))

(declare-fun mapKey!21583 () (_ BitVec 32))

(assert (=> mapNonEmpty!21583 (= (arr!14549 _values!833) (store mapRest!21583 mapKey!21583 mapValue!21583))))

(declare-fun b!472277 () Bool)

(declare-fun res!282108 () Bool)

(assert (=> b!472277 (=> (not res!282108) (not e!276900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30255 (_ BitVec 32)) Bool)

(assert (=> b!472277 (= res!282108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472278 () Bool)

(declare-fun e!276896 () Bool)

(assert (=> b!472278 (= e!276896 tp_is_empty!13249)))

(declare-fun b!472279 () Bool)

(declare-fun e!276898 () Bool)

(assert (=> b!472279 (= e!276898 true)))

(declare-fun minValueBefore!38 () V!18771)

(declare-fun zeroValue!794 () V!18771)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8780 0))(
  ( (tuple2!8781 (_1!4401 (_ BitVec 64)) (_2!4401 V!18771)) )
))
(declare-datatypes ((List!8863 0))(
  ( (Nil!8860) (Cons!8859 (h!9715 tuple2!8780) (t!14831 List!8863)) )
))
(declare-datatypes ((ListLongMap!7693 0))(
  ( (ListLongMap!7694 (toList!3862 List!8863)) )
))
(declare-fun lt!214263 () ListLongMap!7693)

(declare-fun getCurrentListMap!2233 (array!30255 array!30257 (_ BitVec 32) (_ BitVec 32) V!18771 V!18771 (_ BitVec 32) Int) ListLongMap!7693)

(assert (=> b!472279 (= lt!214263 (getCurrentListMap!2233 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21583 () Bool)

(assert (=> mapIsEmpty!21583 mapRes!21583))

(declare-fun b!472280 () Bool)

(assert (=> b!472280 (= e!276899 (and e!276896 mapRes!21583))))

(declare-fun condMapEmpty!21583 () Bool)

(declare-fun mapDefault!21583 () ValueCell!6281)

