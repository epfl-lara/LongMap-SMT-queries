; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42292 () Bool)

(assert start!42292)

(declare-fun b_free!11797 () Bool)

(declare-fun b_next!11797 () Bool)

(assert (=> start!42292 (= b_free!11797 (not b_next!11797))))

(declare-fun tp!41418 () Bool)

(declare-fun b_and!20235 () Bool)

(assert (=> start!42292 (= tp!41418 b_and!20235)))

(declare-fun mapIsEmpty!21544 () Bool)

(declare-fun mapRes!21544 () Bool)

(assert (=> mapIsEmpty!21544 mapRes!21544))

(declare-fun res!281909 () Bool)

(declare-fun e!276645 () Bool)

(assert (=> start!42292 (=> (not res!281909) (not e!276645))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42292 (= res!281909 (validMask!0 mask!1365))))

(assert (=> start!42292 e!276645))

(declare-fun tp_is_empty!13225 () Bool)

(assert (=> start!42292 tp_is_empty!13225))

(assert (=> start!42292 tp!41418))

(assert (=> start!42292 true))

(declare-datatypes ((array!30207 0))(
  ( (array!30208 (arr!14525 (Array (_ BitVec 32) (_ BitVec 64))) (size!14877 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30207)

(declare-fun array_inv!10470 (array!30207) Bool)

(assert (=> start!42292 (array_inv!10470 _keys!1025)))

(declare-datatypes ((V!18739 0))(
  ( (V!18740 (val!6657 Int)) )
))
(declare-datatypes ((ValueCell!6269 0))(
  ( (ValueCellFull!6269 (v!8948 V!18739)) (EmptyCell!6269) )
))
(declare-datatypes ((array!30209 0))(
  ( (array!30210 (arr!14526 (Array (_ BitVec 32) ValueCell!6269)) (size!14878 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30209)

(declare-fun e!276642 () Bool)

(declare-fun array_inv!10471 (array!30209) Bool)

(assert (=> start!42292 (and (array_inv!10471 _values!833) e!276642)))

(declare-fun mapNonEmpty!21544 () Bool)

(declare-fun tp!41419 () Bool)

(declare-fun e!276643 () Bool)

(assert (=> mapNonEmpty!21544 (= mapRes!21544 (and tp!41419 e!276643))))

(declare-fun mapValue!21544 () ValueCell!6269)

(declare-fun mapRest!21544 () (Array (_ BitVec 32) ValueCell!6269))

(declare-fun mapKey!21544 () (_ BitVec 32))

(assert (=> mapNonEmpty!21544 (= (arr!14526 _values!833) (store mapRest!21544 mapKey!21544 mapValue!21544))))

(declare-fun b!471919 () Bool)

(assert (=> b!471919 (= e!276645 (not true))))

(declare-datatypes ((tuple2!8762 0))(
  ( (tuple2!8763 (_1!4392 (_ BitVec 64)) (_2!4392 V!18739)) )
))
(declare-datatypes ((List!8845 0))(
  ( (Nil!8842) (Cons!8841 (h!9697 tuple2!8762) (t!14811 List!8845)) )
))
(declare-datatypes ((ListLongMap!7675 0))(
  ( (ListLongMap!7676 (toList!3853 List!8845)) )
))
(declare-fun lt!214097 () ListLongMap!7675)

(declare-fun lt!214096 () ListLongMap!7675)

(assert (=> b!471919 (= lt!214097 lt!214096)))

(declare-fun minValueBefore!38 () V!18739)

(declare-fun zeroValue!794 () V!18739)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13865 0))(
  ( (Unit!13866) )
))
(declare-fun lt!214095 () Unit!13865)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18739)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!196 (array!30207 array!30209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18739 V!18739 V!18739 V!18739 (_ BitVec 32) Int) Unit!13865)

(assert (=> b!471919 (= lt!214095 (lemmaNoChangeToArrayThenSameMapNoExtras!196 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2016 (array!30207 array!30209 (_ BitVec 32) (_ BitVec 32) V!18739 V!18739 (_ BitVec 32) Int) ListLongMap!7675)

(assert (=> b!471919 (= lt!214096 (getCurrentListMapNoExtraKeys!2016 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471919 (= lt!214097 (getCurrentListMapNoExtraKeys!2016 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471920 () Bool)

(declare-fun res!281911 () Bool)

(assert (=> b!471920 (=> (not res!281911) (not e!276645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30207 (_ BitVec 32)) Bool)

(assert (=> b!471920 (= res!281911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471921 () Bool)

(declare-fun e!276644 () Bool)

(assert (=> b!471921 (= e!276642 (and e!276644 mapRes!21544))))

(declare-fun condMapEmpty!21544 () Bool)

(declare-fun mapDefault!21544 () ValueCell!6269)

