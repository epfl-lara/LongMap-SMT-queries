; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42012 () Bool)

(assert start!42012)

(declare-fun b_free!11585 () Bool)

(declare-fun b_next!11585 () Bool)

(assert (=> start!42012 (= b_free!11585 (not b_next!11585))))

(declare-fun tp!40770 () Bool)

(declare-fun b_and!19983 () Bool)

(assert (=> start!42012 (= tp!40770 b_and!19983)))

(declare-fun mapNonEmpty!21214 () Bool)

(declare-fun mapRes!21214 () Bool)

(declare-fun tp!40771 () Bool)

(declare-fun e!274626 () Bool)

(assert (=> mapNonEmpty!21214 (= mapRes!21214 (and tp!40771 e!274626))))

(declare-fun mapKey!21214 () (_ BitVec 32))

(declare-datatypes ((V!18455 0))(
  ( (V!18456 (val!6551 Int)) )
))
(declare-datatypes ((ValueCell!6163 0))(
  ( (ValueCellFull!6163 (v!8840 V!18455)) (EmptyCell!6163) )
))
(declare-datatypes ((array!29799 0))(
  ( (array!29800 (arr!14325 (Array (_ BitVec 32) ValueCell!6163)) (size!14677 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29799)

(declare-fun mapValue!21214 () ValueCell!6163)

(declare-fun mapRest!21214 () (Array (_ BitVec 32) ValueCell!6163))

(assert (=> mapNonEmpty!21214 (= (arr!14325 _values!833) (store mapRest!21214 mapKey!21214 mapValue!21214))))

(declare-fun b!469074 () Bool)

(declare-fun e!274629 () Bool)

(assert (=> b!469074 (= e!274629 true)))

(declare-datatypes ((tuple2!8618 0))(
  ( (tuple2!8619 (_1!4320 (_ BitVec 64)) (_2!4320 V!18455)) )
))
(declare-datatypes ((List!8700 0))(
  ( (Nil!8697) (Cons!8696 (h!9552 tuple2!8618) (t!14658 List!8700)) )
))
(declare-datatypes ((ListLongMap!7531 0))(
  ( (ListLongMap!7532 (toList!3781 List!8700)) )
))
(declare-fun lt!212399 () ListLongMap!7531)

(declare-fun lt!212397 () tuple2!8618)

(declare-fun minValueBefore!38 () V!18455)

(declare-fun +!1691 (ListLongMap!7531 tuple2!8618) ListLongMap!7531)

(assert (=> b!469074 (= (+!1691 lt!212399 lt!212397) (+!1691 (+!1691 lt!212399 (tuple2!8619 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212397))))

(declare-fun minValueAfter!38 () V!18455)

(assert (=> b!469074 (= lt!212397 (tuple2!8619 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13717 0))(
  ( (Unit!13718) )
))
(declare-fun lt!212395 () Unit!13717)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!104 (ListLongMap!7531 (_ BitVec 64) V!18455 V!18455) Unit!13717)

(assert (=> b!469074 (= lt!212395 (addSameAsAddTwiceSameKeyDiffValues!104 lt!212399 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18455)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212398 () ListLongMap!7531)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29801 0))(
  ( (array!29802 (arr!14326 (Array (_ BitVec 32) (_ BitVec 64))) (size!14678 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29801)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2205 (array!29801 array!29799 (_ BitVec 32) (_ BitVec 32) V!18455 V!18455 (_ BitVec 32) Int) ListLongMap!7531)

(assert (=> b!469074 (= lt!212398 (getCurrentListMap!2205 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212400 () ListLongMap!7531)

(assert (=> b!469074 (= lt!212400 (getCurrentListMap!2205 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21214 () Bool)

(assert (=> mapIsEmpty!21214 mapRes!21214))

(declare-fun b!469075 () Bool)

(declare-fun e!274627 () Bool)

(declare-fun tp_is_empty!13013 () Bool)

(assert (=> b!469075 (= e!274627 tp_is_empty!13013)))

(declare-fun b!469076 () Bool)

(declare-fun e!274631 () Bool)

(assert (=> b!469076 (= e!274631 (not e!274629))))

(declare-fun res!280330 () Bool)

(assert (=> b!469076 (=> res!280330 e!274629)))

(assert (=> b!469076 (= res!280330 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212401 () ListLongMap!7531)

(assert (=> b!469076 (= lt!212399 lt!212401)))

(declare-fun lt!212396 () Unit!13717)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!130 (array!29801 array!29799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18455 V!18455 V!18455 V!18455 (_ BitVec 32) Int) Unit!13717)

(assert (=> b!469076 (= lt!212396 (lemmaNoChangeToArrayThenSameMapNoExtras!130 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1950 (array!29801 array!29799 (_ BitVec 32) (_ BitVec 32) V!18455 V!18455 (_ BitVec 32) Int) ListLongMap!7531)

(assert (=> b!469076 (= lt!212401 (getCurrentListMapNoExtraKeys!1950 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469076 (= lt!212399 (getCurrentListMapNoExtraKeys!1950 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469077 () Bool)

(declare-fun res!280331 () Bool)

(assert (=> b!469077 (=> (not res!280331) (not e!274631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29801 (_ BitVec 32)) Bool)

(assert (=> b!469077 (= res!280331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!280333 () Bool)

(assert (=> start!42012 (=> (not res!280333) (not e!274631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42012 (= res!280333 (validMask!0 mask!1365))))

(assert (=> start!42012 e!274631))

(assert (=> start!42012 tp_is_empty!13013))

(assert (=> start!42012 tp!40770))

(assert (=> start!42012 true))

(declare-fun array_inv!10338 (array!29801) Bool)

(assert (=> start!42012 (array_inv!10338 _keys!1025)))

(declare-fun e!274628 () Bool)

(declare-fun array_inv!10339 (array!29799) Bool)

(assert (=> start!42012 (and (array_inv!10339 _values!833) e!274628)))

(declare-fun b!469078 () Bool)

(assert (=> b!469078 (= e!274626 tp_is_empty!13013)))

(declare-fun b!469079 () Bool)

(assert (=> b!469079 (= e!274628 (and e!274627 mapRes!21214))))

(declare-fun condMapEmpty!21214 () Bool)

(declare-fun mapDefault!21214 () ValueCell!6163)

