; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42062 () Bool)

(assert start!42062)

(declare-fun b_free!11615 () Bool)

(declare-fun b_next!11615 () Bool)

(assert (=> start!42062 (= b_free!11615 (not b_next!11615))))

(declare-fun tp!40864 () Bool)

(declare-fun b_and!20025 () Bool)

(assert (=> start!42062 (= tp!40864 b_and!20025)))

(declare-fun b!469613 () Bool)

(declare-fun res!280635 () Bool)

(declare-fun e!275008 () Bool)

(assert (=> b!469613 (=> (not res!280635) (not e!275008))))

(declare-datatypes ((array!29857 0))(
  ( (array!29858 (arr!14353 (Array (_ BitVec 32) (_ BitVec 64))) (size!14705 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29857)

(declare-datatypes ((List!8723 0))(
  ( (Nil!8720) (Cons!8719 (h!9575 (_ BitVec 64)) (t!14683 List!8723)) )
))
(declare-fun arrayNoDuplicates!0 (array!29857 (_ BitVec 32) List!8723) Bool)

(assert (=> b!469613 (= res!280635 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8720))))

(declare-fun b!469614 () Bool)

(declare-fun e!275010 () Bool)

(assert (=> b!469614 (= e!275010 true)))

(declare-datatypes ((V!18495 0))(
  ( (V!18496 (val!6566 Int)) )
))
(declare-datatypes ((tuple2!8644 0))(
  ( (tuple2!8645 (_1!4333 (_ BitVec 64)) (_2!4333 V!18495)) )
))
(declare-datatypes ((List!8724 0))(
  ( (Nil!8721) (Cons!8720 (h!9576 tuple2!8644) (t!14684 List!8724)) )
))
(declare-datatypes ((ListLongMap!7557 0))(
  ( (ListLongMap!7558 (toList!3794 List!8724)) )
))
(declare-fun lt!212866 () ListLongMap!7557)

(declare-fun lt!212862 () tuple2!8644)

(declare-fun minValueBefore!38 () V!18495)

(declare-fun +!1702 (ListLongMap!7557 tuple2!8644) ListLongMap!7557)

(assert (=> b!469614 (= (+!1702 lt!212866 lt!212862) (+!1702 (+!1702 lt!212866 (tuple2!8645 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212862))))

(declare-fun minValueAfter!38 () V!18495)

(assert (=> b!469614 (= lt!212862 (tuple2!8645 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13745 0))(
  ( (Unit!13746) )
))
(declare-fun lt!212864 () Unit!13745)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!115 (ListLongMap!7557 (_ BitVec 64) V!18495 V!18495) Unit!13745)

(assert (=> b!469614 (= lt!212864 (addSameAsAddTwiceSameKeyDiffValues!115 lt!212866 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18495)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212867 () ListLongMap!7557)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6178 0))(
  ( (ValueCellFull!6178 (v!8856 V!18495)) (EmptyCell!6178) )
))
(declare-datatypes ((array!29859 0))(
  ( (array!29860 (arr!14354 (Array (_ BitVec 32) ValueCell!6178)) (size!14706 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29859)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2216 (array!29857 array!29859 (_ BitVec 32) (_ BitVec 32) V!18495 V!18495 (_ BitVec 32) Int) ListLongMap!7557)

(assert (=> b!469614 (= lt!212867 (getCurrentListMap!2216 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212865 () ListLongMap!7557)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469614 (= lt!212865 (getCurrentListMap!2216 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469616 () Bool)

(declare-fun res!280636 () Bool)

(assert (=> b!469616 (=> (not res!280636) (not e!275008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29857 (_ BitVec 32)) Bool)

(assert (=> b!469616 (= res!280636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469617 () Bool)

(declare-fun e!275011 () Bool)

(declare-fun tp_is_empty!13043 () Bool)

(assert (=> b!469617 (= e!275011 tp_is_empty!13043)))

(declare-fun b!469618 () Bool)

(declare-fun res!280632 () Bool)

(assert (=> b!469618 (=> (not res!280632) (not e!275008))))

(assert (=> b!469618 (= res!280632 (and (= (size!14706 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14705 _keys!1025) (size!14706 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21262 () Bool)

(declare-fun mapRes!21262 () Bool)

(declare-fun tp!40863 () Bool)

(declare-fun e!275013 () Bool)

(assert (=> mapNonEmpty!21262 (= mapRes!21262 (and tp!40863 e!275013))))

(declare-fun mapRest!21262 () (Array (_ BitVec 32) ValueCell!6178))

(declare-fun mapValue!21262 () ValueCell!6178)

(declare-fun mapKey!21262 () (_ BitVec 32))

(assert (=> mapNonEmpty!21262 (= (arr!14354 _values!833) (store mapRest!21262 mapKey!21262 mapValue!21262))))

(declare-fun mapIsEmpty!21262 () Bool)

(assert (=> mapIsEmpty!21262 mapRes!21262))

(declare-fun b!469615 () Bool)

(assert (=> b!469615 (= e!275013 tp_is_empty!13043)))

(declare-fun res!280634 () Bool)

(assert (=> start!42062 (=> (not res!280634) (not e!275008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42062 (= res!280634 (validMask!0 mask!1365))))

(assert (=> start!42062 e!275008))

(assert (=> start!42062 tp_is_empty!13043))

(assert (=> start!42062 tp!40864))

(assert (=> start!42062 true))

(declare-fun array_inv!10360 (array!29857) Bool)

(assert (=> start!42062 (array_inv!10360 _keys!1025)))

(declare-fun e!275012 () Bool)

(declare-fun array_inv!10361 (array!29859) Bool)

(assert (=> start!42062 (and (array_inv!10361 _values!833) e!275012)))

(declare-fun b!469619 () Bool)

(assert (=> b!469619 (= e!275012 (and e!275011 mapRes!21262))))

(declare-fun condMapEmpty!21262 () Bool)

(declare-fun mapDefault!21262 () ValueCell!6178)

