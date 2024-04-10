; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42058 () Bool)

(assert start!42058)

(declare-fun b_free!11611 () Bool)

(declare-fun b_next!11611 () Bool)

(assert (=> start!42058 (= b_free!11611 (not b_next!11611))))

(declare-fun tp!40852 () Bool)

(declare-fun b_and!20021 () Bool)

(assert (=> start!42058 (= tp!40852 b_and!20021)))

(declare-fun b!469565 () Bool)

(declare-fun e!274973 () Bool)

(declare-fun e!274976 () Bool)

(assert (=> b!469565 (= e!274973 (not e!274976))))

(declare-fun res!280602 () Bool)

(assert (=> b!469565 (=> res!280602 e!274976)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469565 (= res!280602 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18491 0))(
  ( (V!18492 (val!6564 Int)) )
))
(declare-datatypes ((tuple2!8640 0))(
  ( (tuple2!8641 (_1!4331 (_ BitVec 64)) (_2!4331 V!18491)) )
))
(declare-datatypes ((List!8719 0))(
  ( (Nil!8716) (Cons!8715 (h!9571 tuple2!8640) (t!14679 List!8719)) )
))
(declare-datatypes ((ListLongMap!7553 0))(
  ( (ListLongMap!7554 (toList!3792 List!8719)) )
))
(declare-fun lt!212823 () ListLongMap!7553)

(declare-fun lt!212824 () ListLongMap!7553)

(assert (=> b!469565 (= lt!212823 lt!212824)))

(declare-fun minValueBefore!38 () V!18491)

(declare-fun zeroValue!794 () V!18491)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29849 0))(
  ( (array!29850 (arr!14349 (Array (_ BitVec 32) (_ BitVec 64))) (size!14701 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29849)

(declare-datatypes ((Unit!13741 0))(
  ( (Unit!13742) )
))
(declare-fun lt!212821 () Unit!13741)

(declare-datatypes ((ValueCell!6176 0))(
  ( (ValueCellFull!6176 (v!8854 V!18491)) (EmptyCell!6176) )
))
(declare-datatypes ((array!29851 0))(
  ( (array!29852 (arr!14350 (Array (_ BitVec 32) ValueCell!6176)) (size!14702 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29851)

(declare-fun minValueAfter!38 () V!18491)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!140 (array!29849 array!29851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 V!18491 V!18491 (_ BitVec 32) Int) Unit!13741)

(assert (=> b!469565 (= lt!212821 (lemmaNoChangeToArrayThenSameMapNoExtras!140 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1960 (array!29849 array!29851 (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 (_ BitVec 32) Int) ListLongMap!7553)

(assert (=> b!469565 (= lt!212824 (getCurrentListMapNoExtraKeys!1960 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469565 (= lt!212823 (getCurrentListMapNoExtraKeys!1960 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469566 () Bool)

(declare-fun e!274975 () Bool)

(declare-fun tp_is_empty!13039 () Bool)

(assert (=> b!469566 (= e!274975 tp_is_empty!13039)))

(declare-fun b!469567 () Bool)

(declare-fun e!274977 () Bool)

(assert (=> b!469567 (= e!274977 tp_is_empty!13039)))

(declare-fun b!469568 () Bool)

(declare-fun res!280605 () Bool)

(assert (=> b!469568 (=> (not res!280605) (not e!274973))))

(declare-datatypes ((List!8720 0))(
  ( (Nil!8717) (Cons!8716 (h!9572 (_ BitVec 64)) (t!14680 List!8720)) )
))
(declare-fun arrayNoDuplicates!0 (array!29849 (_ BitVec 32) List!8720) Bool)

(assert (=> b!469568 (= res!280605 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8717))))

(declare-fun res!280604 () Bool)

(assert (=> start!42058 (=> (not res!280604) (not e!274973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42058 (= res!280604 (validMask!0 mask!1365))))

(assert (=> start!42058 e!274973))

(assert (=> start!42058 tp_is_empty!13039))

(assert (=> start!42058 tp!40852))

(assert (=> start!42058 true))

(declare-fun array_inv!10356 (array!29849) Bool)

(assert (=> start!42058 (array_inv!10356 _keys!1025)))

(declare-fun e!274974 () Bool)

(declare-fun array_inv!10357 (array!29851) Bool)

(assert (=> start!42058 (and (array_inv!10357 _values!833) e!274974)))

(declare-fun b!469569 () Bool)

(declare-fun res!280603 () Bool)

(assert (=> b!469569 (=> (not res!280603) (not e!274973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29849 (_ BitVec 32)) Bool)

(assert (=> b!469569 (= res!280603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21256 () Bool)

(declare-fun mapRes!21256 () Bool)

(assert (=> mapIsEmpty!21256 mapRes!21256))

(declare-fun b!469570 () Bool)

(assert (=> b!469570 (= e!274976 true)))

(declare-fun lt!212819 () tuple2!8640)

(declare-fun +!1700 (ListLongMap!7553 tuple2!8640) ListLongMap!7553)

(assert (=> b!469570 (= (+!1700 lt!212823 lt!212819) (+!1700 (+!1700 lt!212823 (tuple2!8641 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212819))))

(assert (=> b!469570 (= lt!212819 (tuple2!8641 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212820 () Unit!13741)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!113 (ListLongMap!7553 (_ BitVec 64) V!18491 V!18491) Unit!13741)

(assert (=> b!469570 (= lt!212820 (addSameAsAddTwiceSameKeyDiffValues!113 lt!212823 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212822 () ListLongMap!7553)

(declare-fun getCurrentListMap!2214 (array!29849 array!29851 (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 (_ BitVec 32) Int) ListLongMap!7553)

(assert (=> b!469570 (= lt!212822 (getCurrentListMap!2214 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212825 () ListLongMap!7553)

(assert (=> b!469570 (= lt!212825 (getCurrentListMap!2214 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469571 () Bool)

(assert (=> b!469571 (= e!274974 (and e!274977 mapRes!21256))))

(declare-fun condMapEmpty!21256 () Bool)

(declare-fun mapDefault!21256 () ValueCell!6176)

