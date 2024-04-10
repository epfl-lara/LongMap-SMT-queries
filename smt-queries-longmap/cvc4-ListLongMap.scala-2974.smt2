; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42124 () Bool)

(assert start!42124)

(declare-fun b_free!11657 () Bool)

(declare-fun b_next!11657 () Bool)

(assert (=> start!42124 (= b_free!11657 (not b_next!11657))))

(declare-fun tp!40993 () Bool)

(declare-fun b_and!20079 () Bool)

(assert (=> start!42124 (= tp!40993 b_and!20079)))

(declare-fun b!470279 () Bool)

(declare-fun res!281009 () Bool)

(declare-fun e!275482 () Bool)

(assert (=> b!470279 (=> (not res!281009) (not e!275482))))

(declare-datatypes ((array!29941 0))(
  ( (array!29942 (arr!14394 (Array (_ BitVec 32) (_ BitVec 64))) (size!14746 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29941)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29941 (_ BitVec 32)) Bool)

(assert (=> b!470279 (= res!281009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470280 () Bool)

(declare-fun res!281007 () Bool)

(assert (=> b!470280 (=> (not res!281007) (not e!275482))))

(declare-datatypes ((List!8753 0))(
  ( (Nil!8750) (Cons!8749 (h!9605 (_ BitVec 64)) (t!14715 List!8753)) )
))
(declare-fun arrayNoDuplicates!0 (array!29941 (_ BitVec 32) List!8753) Bool)

(assert (=> b!470280 (= res!281007 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8750))))

(declare-fun mapNonEmpty!21328 () Bool)

(declare-fun mapRes!21328 () Bool)

(declare-fun tp!40992 () Bool)

(declare-fun e!275484 () Bool)

(assert (=> mapNonEmpty!21328 (= mapRes!21328 (and tp!40992 e!275484))))

(declare-fun mapKey!21328 () (_ BitVec 32))

(declare-datatypes ((V!18551 0))(
  ( (V!18552 (val!6587 Int)) )
))
(declare-datatypes ((ValueCell!6199 0))(
  ( (ValueCellFull!6199 (v!8878 V!18551)) (EmptyCell!6199) )
))
(declare-fun mapRest!21328 () (Array (_ BitVec 32) ValueCell!6199))

(declare-datatypes ((array!29943 0))(
  ( (array!29944 (arr!14395 (Array (_ BitVec 32) ValueCell!6199)) (size!14747 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29943)

(declare-fun mapValue!21328 () ValueCell!6199)

(assert (=> mapNonEmpty!21328 (= (arr!14395 _values!833) (store mapRest!21328 mapKey!21328 mapValue!21328))))

(declare-fun mapIsEmpty!21328 () Bool)

(assert (=> mapIsEmpty!21328 mapRes!21328))

(declare-fun b!470281 () Bool)

(assert (=> b!470281 (= e!275482 (not true))))

(declare-datatypes ((tuple2!8674 0))(
  ( (tuple2!8675 (_1!4348 (_ BitVec 64)) (_2!4348 V!18551)) )
))
(declare-datatypes ((List!8754 0))(
  ( (Nil!8751) (Cons!8750 (h!9606 tuple2!8674) (t!14716 List!8754)) )
))
(declare-datatypes ((ListLongMap!7587 0))(
  ( (ListLongMap!7588 (toList!3809 List!8754)) )
))
(declare-fun lt!213386 () ListLongMap!7587)

(declare-fun lt!213387 () ListLongMap!7587)

(assert (=> b!470281 (= lt!213386 lt!213387)))

(declare-fun minValueBefore!38 () V!18551)

(declare-fun zeroValue!794 () V!18551)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13777 0))(
  ( (Unit!13778) )
))
(declare-fun lt!213385 () Unit!13777)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18551)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!152 (array!29941 array!29943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18551 V!18551 V!18551 V!18551 (_ BitVec 32) Int) Unit!13777)

(assert (=> b!470281 (= lt!213385 (lemmaNoChangeToArrayThenSameMapNoExtras!152 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1972 (array!29941 array!29943 (_ BitVec 32) (_ BitVec 32) V!18551 V!18551 (_ BitVec 32) Int) ListLongMap!7587)

(assert (=> b!470281 (= lt!213387 (getCurrentListMapNoExtraKeys!1972 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470281 (= lt!213386 (getCurrentListMapNoExtraKeys!1972 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281008 () Bool)

(assert (=> start!42124 (=> (not res!281008) (not e!275482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42124 (= res!281008 (validMask!0 mask!1365))))

(assert (=> start!42124 e!275482))

(declare-fun tp_is_empty!13085 () Bool)

(assert (=> start!42124 tp_is_empty!13085))

(assert (=> start!42124 tp!40993))

(assert (=> start!42124 true))

(declare-fun array_inv!10384 (array!29941) Bool)

(assert (=> start!42124 (array_inv!10384 _keys!1025)))

(declare-fun e!275485 () Bool)

(declare-fun array_inv!10385 (array!29943) Bool)

(assert (=> start!42124 (and (array_inv!10385 _values!833) e!275485)))

(declare-fun b!470282 () Bool)

(declare-fun e!275483 () Bool)

(assert (=> b!470282 (= e!275485 (and e!275483 mapRes!21328))))

(declare-fun condMapEmpty!21328 () Bool)

(declare-fun mapDefault!21328 () ValueCell!6199)

