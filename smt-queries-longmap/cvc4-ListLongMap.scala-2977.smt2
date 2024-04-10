; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42142 () Bool)

(assert start!42142)

(declare-fun b_free!11675 () Bool)

(declare-fun b_next!11675 () Bool)

(assert (=> start!42142 (= b_free!11675 (not b_next!11675))))

(declare-fun tp!41047 () Bool)

(declare-fun b_and!20097 () Bool)

(assert (=> start!42142 (= tp!41047 b_and!20097)))

(declare-fun b!470468 () Bool)

(declare-fun e!275618 () Bool)

(declare-fun tp_is_empty!13103 () Bool)

(assert (=> b!470468 (= e!275618 tp_is_empty!13103)))

(declare-fun b!470469 () Bool)

(declare-fun res!281115 () Bool)

(declare-fun e!275620 () Bool)

(assert (=> b!470469 (=> (not res!281115) (not e!275620))))

(declare-datatypes ((array!29977 0))(
  ( (array!29978 (arr!14412 (Array (_ BitVec 32) (_ BitVec 64))) (size!14764 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29977)

(declare-datatypes ((List!8769 0))(
  ( (Nil!8766) (Cons!8765 (h!9621 (_ BitVec 64)) (t!14731 List!8769)) )
))
(declare-fun arrayNoDuplicates!0 (array!29977 (_ BitVec 32) List!8769) Bool)

(assert (=> b!470469 (= res!281115 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8766))))

(declare-fun mapNonEmpty!21355 () Bool)

(declare-fun mapRes!21355 () Bool)

(declare-fun tp!41046 () Bool)

(assert (=> mapNonEmpty!21355 (= mapRes!21355 (and tp!41046 e!275618))))

(declare-datatypes ((V!18575 0))(
  ( (V!18576 (val!6596 Int)) )
))
(declare-datatypes ((ValueCell!6208 0))(
  ( (ValueCellFull!6208 (v!8887 V!18575)) (EmptyCell!6208) )
))
(declare-datatypes ((array!29979 0))(
  ( (array!29980 (arr!14413 (Array (_ BitVec 32) ValueCell!6208)) (size!14765 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29979)

(declare-fun mapValue!21355 () ValueCell!6208)

(declare-fun mapKey!21355 () (_ BitVec 32))

(declare-fun mapRest!21355 () (Array (_ BitVec 32) ValueCell!6208))

(assert (=> mapNonEmpty!21355 (= (arr!14413 _values!833) (store mapRest!21355 mapKey!21355 mapValue!21355))))

(declare-fun res!281116 () Bool)

(assert (=> start!42142 (=> (not res!281116) (not e!275620))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42142 (= res!281116 (validMask!0 mask!1365))))

(assert (=> start!42142 e!275620))

(assert (=> start!42142 tp_is_empty!13103))

(assert (=> start!42142 tp!41047))

(assert (=> start!42142 true))

(declare-fun array_inv!10400 (array!29977) Bool)

(assert (=> start!42142 (array_inv!10400 _keys!1025)))

(declare-fun e!275616 () Bool)

(declare-fun array_inv!10401 (array!29979) Bool)

(assert (=> start!42142 (and (array_inv!10401 _values!833) e!275616)))

(declare-fun b!470470 () Bool)

(declare-fun res!281118 () Bool)

(assert (=> b!470470 (=> (not res!281118) (not e!275620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29977 (_ BitVec 32)) Bool)

(assert (=> b!470470 (= res!281118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470471 () Bool)

(declare-fun e!275619 () Bool)

(assert (=> b!470471 (= e!275619 tp_is_empty!13103)))

(declare-fun b!470472 () Bool)

(declare-fun res!281117 () Bool)

(assert (=> b!470472 (=> (not res!281117) (not e!275620))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470472 (= res!281117 (and (= (size!14765 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14764 _keys!1025) (size!14765 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470473 () Bool)

(assert (=> b!470473 (= e!275620 (not true))))

(declare-datatypes ((tuple2!8690 0))(
  ( (tuple2!8691 (_1!4356 (_ BitVec 64)) (_2!4356 V!18575)) )
))
(declare-datatypes ((List!8770 0))(
  ( (Nil!8767) (Cons!8766 (h!9622 tuple2!8690) (t!14732 List!8770)) )
))
(declare-datatypes ((ListLongMap!7603 0))(
  ( (ListLongMap!7604 (toList!3817 List!8770)) )
))
(declare-fun lt!213468 () ListLongMap!7603)

(declare-fun lt!213466 () ListLongMap!7603)

(assert (=> b!470473 (= lt!213468 lt!213466)))

(declare-fun minValueBefore!38 () V!18575)

(declare-fun zeroValue!794 () V!18575)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13793 0))(
  ( (Unit!13794) )
))
(declare-fun lt!213467 () Unit!13793)

(declare-fun minValueAfter!38 () V!18575)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!160 (array!29977 array!29979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18575 V!18575 V!18575 V!18575 (_ BitVec 32) Int) Unit!13793)

(assert (=> b!470473 (= lt!213467 (lemmaNoChangeToArrayThenSameMapNoExtras!160 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1980 (array!29977 array!29979 (_ BitVec 32) (_ BitVec 32) V!18575 V!18575 (_ BitVec 32) Int) ListLongMap!7603)

(assert (=> b!470473 (= lt!213466 (getCurrentListMapNoExtraKeys!1980 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470473 (= lt!213468 (getCurrentListMapNoExtraKeys!1980 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470474 () Bool)

(assert (=> b!470474 (= e!275616 (and e!275619 mapRes!21355))))

(declare-fun condMapEmpty!21355 () Bool)

(declare-fun mapDefault!21355 () ValueCell!6208)

