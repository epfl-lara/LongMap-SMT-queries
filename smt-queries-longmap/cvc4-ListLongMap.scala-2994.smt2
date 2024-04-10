; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42272 () Bool)

(assert start!42272)

(declare-fun b_free!11777 () Bool)

(declare-fun b_next!11777 () Bool)

(assert (=> start!42272 (= b_free!11777 (not b_next!11777))))

(declare-fun tp!41359 () Bool)

(declare-fun b_and!20215 () Bool)

(assert (=> start!42272 (= tp!41359 b_and!20215)))

(declare-fun b!471709 () Bool)

(declare-fun res!281790 () Bool)

(declare-fun e!276495 () Bool)

(assert (=> b!471709 (=> (not res!281790) (not e!276495))))

(declare-datatypes ((array!30171 0))(
  ( (array!30172 (arr!14507 (Array (_ BitVec 32) (_ BitVec 64))) (size!14859 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30171)

(declare-datatypes ((List!8831 0))(
  ( (Nil!8828) (Cons!8827 (h!9683 (_ BitVec 64)) (t!14797 List!8831)) )
))
(declare-fun arrayNoDuplicates!0 (array!30171 (_ BitVec 32) List!8831) Bool)

(assert (=> b!471709 (= res!281790 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8828))))

(declare-fun mapNonEmpty!21514 () Bool)

(declare-fun mapRes!21514 () Bool)

(declare-fun tp!41358 () Bool)

(declare-fun e!276494 () Bool)

(assert (=> mapNonEmpty!21514 (= mapRes!21514 (and tp!41358 e!276494))))

(declare-datatypes ((V!18711 0))(
  ( (V!18712 (val!6647 Int)) )
))
(declare-datatypes ((ValueCell!6259 0))(
  ( (ValueCellFull!6259 (v!8938 V!18711)) (EmptyCell!6259) )
))
(declare-datatypes ((array!30173 0))(
  ( (array!30174 (arr!14508 (Array (_ BitVec 32) ValueCell!6259)) (size!14860 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30173)

(declare-fun mapKey!21514 () (_ BitVec 32))

(declare-fun mapRest!21514 () (Array (_ BitVec 32) ValueCell!6259))

(declare-fun mapValue!21514 () ValueCell!6259)

(assert (=> mapNonEmpty!21514 (= (arr!14508 _values!833) (store mapRest!21514 mapKey!21514 mapValue!21514))))

(declare-fun b!471710 () Bool)

(assert (=> b!471710 (= e!276495 (not true))))

(declare-datatypes ((tuple2!8748 0))(
  ( (tuple2!8749 (_1!4385 (_ BitVec 64)) (_2!4385 V!18711)) )
))
(declare-datatypes ((List!8832 0))(
  ( (Nil!8829) (Cons!8828 (h!9684 tuple2!8748) (t!14798 List!8832)) )
))
(declare-datatypes ((ListLongMap!7661 0))(
  ( (ListLongMap!7662 (toList!3846 List!8832)) )
))
(declare-fun lt!214007 () ListLongMap!7661)

(declare-fun lt!214005 () ListLongMap!7661)

(assert (=> b!471710 (= lt!214007 lt!214005)))

(declare-fun minValueBefore!38 () V!18711)

(declare-fun zeroValue!794 () V!18711)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13851 0))(
  ( (Unit!13852) )
))
(declare-fun lt!214006 () Unit!13851)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18711)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!189 (array!30171 array!30173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18711 V!18711 V!18711 V!18711 (_ BitVec 32) Int) Unit!13851)

(assert (=> b!471710 (= lt!214006 (lemmaNoChangeToArrayThenSameMapNoExtras!189 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2009 (array!30171 array!30173 (_ BitVec 32) (_ BitVec 32) V!18711 V!18711 (_ BitVec 32) Int) ListLongMap!7661)

(assert (=> b!471710 (= lt!214005 (getCurrentListMapNoExtraKeys!2009 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471710 (= lt!214007 (getCurrentListMapNoExtraKeys!2009 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471711 () Bool)

(declare-fun e!276493 () Bool)

(declare-fun tp_is_empty!13205 () Bool)

(assert (=> b!471711 (= e!276493 tp_is_empty!13205)))

(declare-fun b!471712 () Bool)

(declare-fun e!276492 () Bool)

(assert (=> b!471712 (= e!276492 (and e!276493 mapRes!21514))))

(declare-fun condMapEmpty!21514 () Bool)

(declare-fun mapDefault!21514 () ValueCell!6259)

