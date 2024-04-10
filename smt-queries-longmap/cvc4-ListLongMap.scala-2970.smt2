; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42080 () Bool)

(assert start!42080)

(declare-fun b_free!11633 () Bool)

(declare-fun b_next!11633 () Bool)

(assert (=> start!42080 (= b_free!11633 (not b_next!11633))))

(declare-fun tp!40917 () Bool)

(declare-fun b_and!20043 () Bool)

(assert (=> start!42080 (= tp!40917 b_and!20043)))

(declare-fun mapIsEmpty!21289 () Bool)

(declare-fun mapRes!21289 () Bool)

(assert (=> mapIsEmpty!21289 mapRes!21289))

(declare-fun mapNonEmpty!21289 () Bool)

(declare-fun tp!40918 () Bool)

(declare-fun e!275170 () Bool)

(assert (=> mapNonEmpty!21289 (= mapRes!21289 (and tp!40918 e!275170))))

(declare-datatypes ((V!18519 0))(
  ( (V!18520 (val!6575 Int)) )
))
(declare-datatypes ((ValueCell!6187 0))(
  ( (ValueCellFull!6187 (v!8865 V!18519)) (EmptyCell!6187) )
))
(declare-datatypes ((array!29893 0))(
  ( (array!29894 (arr!14371 (Array (_ BitVec 32) ValueCell!6187)) (size!14723 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29893)

(declare-fun mapRest!21289 () (Array (_ BitVec 32) ValueCell!6187))

(declare-fun mapKey!21289 () (_ BitVec 32))

(declare-fun mapValue!21289 () ValueCell!6187)

(assert (=> mapNonEmpty!21289 (= (arr!14371 _values!833) (store mapRest!21289 mapKey!21289 mapValue!21289))))

(declare-fun b!469829 () Bool)

(declare-fun res!280770 () Bool)

(declare-fun e!275175 () Bool)

(assert (=> b!469829 (=> (not res!280770) (not e!275175))))

(declare-datatypes ((array!29895 0))(
  ( (array!29896 (arr!14372 (Array (_ BitVec 32) (_ BitVec 64))) (size!14724 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29895)

(declare-datatypes ((List!8735 0))(
  ( (Nil!8732) (Cons!8731 (h!9587 (_ BitVec 64)) (t!14695 List!8735)) )
))
(declare-fun arrayNoDuplicates!0 (array!29895 (_ BitVec 32) List!8735) Bool)

(assert (=> b!469829 (= res!280770 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8732))))

(declare-fun b!469830 () Bool)

(declare-fun e!275172 () Bool)

(assert (=> b!469830 (= e!275172 true)))

(declare-datatypes ((tuple2!8656 0))(
  ( (tuple2!8657 (_1!4339 (_ BitVec 64)) (_2!4339 V!18519)) )
))
(declare-datatypes ((List!8736 0))(
  ( (Nil!8733) (Cons!8732 (h!9588 tuple2!8656) (t!14696 List!8736)) )
))
(declare-datatypes ((ListLongMap!7569 0))(
  ( (ListLongMap!7570 (toList!3800 List!8736)) )
))
(declare-fun lt!213052 () ListLongMap!7569)

(declare-fun lt!213055 () tuple2!8656)

(declare-fun minValueBefore!38 () V!18519)

(declare-fun +!1708 (ListLongMap!7569 tuple2!8656) ListLongMap!7569)

(assert (=> b!469830 (= (+!1708 lt!213052 lt!213055) (+!1708 (+!1708 lt!213052 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213055))))

(declare-fun minValueAfter!38 () V!18519)

(assert (=> b!469830 (= lt!213055 (tuple2!8657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13757 0))(
  ( (Unit!13758) )
))
(declare-fun lt!213051 () Unit!13757)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!121 (ListLongMap!7569 (_ BitVec 64) V!18519 V!18519) Unit!13757)

(assert (=> b!469830 (= lt!213051 (addSameAsAddTwiceSameKeyDiffValues!121 lt!213052 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18519)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!213054 () ListLongMap!7569)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2222 (array!29895 array!29893 (_ BitVec 32) (_ BitVec 32) V!18519 V!18519 (_ BitVec 32) Int) ListLongMap!7569)

(assert (=> b!469830 (= lt!213054 (getCurrentListMap!2222 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!213050 () ListLongMap!7569)

(assert (=> b!469830 (= lt!213050 (getCurrentListMap!2222 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469831 () Bool)

(declare-fun tp_is_empty!13061 () Bool)

(assert (=> b!469831 (= e!275170 tp_is_empty!13061)))

(declare-fun res!280769 () Bool)

(assert (=> start!42080 (=> (not res!280769) (not e!275175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42080 (= res!280769 (validMask!0 mask!1365))))

(assert (=> start!42080 e!275175))

(assert (=> start!42080 tp_is_empty!13061))

(assert (=> start!42080 tp!40917))

(assert (=> start!42080 true))

(declare-fun array_inv!10370 (array!29895) Bool)

(assert (=> start!42080 (array_inv!10370 _keys!1025)))

(declare-fun e!275171 () Bool)

(declare-fun array_inv!10371 (array!29893) Bool)

(assert (=> start!42080 (and (array_inv!10371 _values!833) e!275171)))

(declare-fun b!469832 () Bool)

(declare-fun e!275173 () Bool)

(assert (=> b!469832 (= e!275171 (and e!275173 mapRes!21289))))

(declare-fun condMapEmpty!21289 () Bool)

(declare-fun mapDefault!21289 () ValueCell!6187)

