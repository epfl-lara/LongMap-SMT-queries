; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42484 () Bool)

(assert start!42484)

(declare-fun b_free!11939 () Bool)

(declare-fun b_next!11939 () Bool)

(assert (=> start!42484 (= b_free!11939 (not b_next!11939))))

(declare-fun tp!41854 () Bool)

(declare-fun b_and!20407 () Bool)

(assert (=> start!42484 (= tp!41854 b_and!20407)))

(declare-fun b!474021 () Bool)

(declare-fun e!278170 () Bool)

(declare-fun tp_is_empty!13367 () Bool)

(assert (=> b!474021 (= e!278170 tp_is_empty!13367)))

(declare-fun b!474022 () Bool)

(declare-fun e!278166 () Bool)

(assert (=> b!474022 (= e!278166 true)))

(declare-datatypes ((V!18927 0))(
  ( (V!18928 (val!6728 Int)) )
))
(declare-datatypes ((tuple2!8872 0))(
  ( (tuple2!8873 (_1!4447 (_ BitVec 64)) (_2!4447 V!18927)) )
))
(declare-datatypes ((List!8951 0))(
  ( (Nil!8948) (Cons!8947 (h!9803 tuple2!8872) (t!14923 List!8951)) )
))
(declare-datatypes ((ListLongMap!7785 0))(
  ( (ListLongMap!7786 (toList!3908 List!8951)) )
))
(declare-fun lt!215699 () ListLongMap!7785)

(declare-fun lt!215698 () tuple2!8872)

(declare-fun minValueBefore!38 () V!18927)

(declare-fun +!1743 (ListLongMap!7785 tuple2!8872) ListLongMap!7785)

(assert (=> b!474022 (= (+!1743 lt!215699 lt!215698) (+!1743 (+!1743 lt!215699 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215698))))

(declare-fun minValueAfter!38 () V!18927)

(assert (=> b!474022 (= lt!215698 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13974 0))(
  ( (Unit!13975) )
))
(declare-fun lt!215700 () Unit!13974)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!152 (ListLongMap!7785 (_ BitVec 64) V!18927 V!18927) Unit!13974)

(assert (=> b!474022 (= lt!215700 (addSameAsAddTwiceSameKeyDiffValues!152 lt!215699 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215703 () ListLongMap!7785)

(declare-fun zeroValue!794 () V!18927)

(assert (=> b!474022 (= lt!215699 (+!1743 lt!215703 (tuple2!8873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215701 () ListLongMap!7785)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30489 0))(
  ( (array!30490 (arr!14663 (Array (_ BitVec 32) (_ BitVec 64))) (size!15015 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30489)

(declare-datatypes ((ValueCell!6340 0))(
  ( (ValueCellFull!6340 (v!9020 V!18927)) (EmptyCell!6340) )
))
(declare-datatypes ((array!30491 0))(
  ( (array!30492 (arr!14664 (Array (_ BitVec 32) ValueCell!6340)) (size!15016 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30491)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2272 (array!30489 array!30491 (_ BitVec 32) (_ BitVec 32) V!18927 V!18927 (_ BitVec 32) Int) ListLongMap!7785)

(assert (=> b!474022 (= lt!215701 (getCurrentListMap!2272 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215696 () ListLongMap!7785)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474022 (= lt!215696 (getCurrentListMap!2272 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474023 () Bool)

(declare-fun e!278167 () Bool)

(assert (=> b!474023 (= e!278167 tp_is_empty!13367)))

(declare-fun mapIsEmpty!21766 () Bool)

(declare-fun mapRes!21766 () Bool)

(assert (=> mapIsEmpty!21766 mapRes!21766))

(declare-fun mapNonEmpty!21766 () Bool)

(declare-fun tp!41853 () Bool)

(assert (=> mapNonEmpty!21766 (= mapRes!21766 (and tp!41853 e!278170))))

(declare-fun mapRest!21766 () (Array (_ BitVec 32) ValueCell!6340))

(declare-fun mapKey!21766 () (_ BitVec 32))

(declare-fun mapValue!21766 () ValueCell!6340)

(assert (=> mapNonEmpty!21766 (= (arr!14664 _values!833) (store mapRest!21766 mapKey!21766 mapValue!21766))))

(declare-fun b!474024 () Bool)

(declare-fun res!283128 () Bool)

(declare-fun e!278168 () Bool)

(assert (=> b!474024 (=> (not res!283128) (not e!278168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30489 (_ BitVec 32)) Bool)

(assert (=> b!474024 (= res!283128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474025 () Bool)

(declare-fun res!283129 () Bool)

(assert (=> b!474025 (=> (not res!283129) (not e!278168))))

(declare-datatypes ((List!8952 0))(
  ( (Nil!8949) (Cons!8948 (h!9804 (_ BitVec 64)) (t!14924 List!8952)) )
))
(declare-fun arrayNoDuplicates!0 (array!30489 (_ BitVec 32) List!8952) Bool)

(assert (=> b!474025 (= res!283129 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8949))))

(declare-fun res!283126 () Bool)

(assert (=> start!42484 (=> (not res!283126) (not e!278168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42484 (= res!283126 (validMask!0 mask!1365))))

(assert (=> start!42484 e!278168))

(assert (=> start!42484 tp_is_empty!13367))

(assert (=> start!42484 tp!41854))

(assert (=> start!42484 true))

(declare-fun array_inv!10580 (array!30489) Bool)

(assert (=> start!42484 (array_inv!10580 _keys!1025)))

(declare-fun e!278165 () Bool)

(declare-fun array_inv!10581 (array!30491) Bool)

(assert (=> start!42484 (and (array_inv!10581 _values!833) e!278165)))

(declare-fun b!474026 () Bool)

(assert (=> b!474026 (= e!278165 (and e!278167 mapRes!21766))))

(declare-fun condMapEmpty!21766 () Bool)

(declare-fun mapDefault!21766 () ValueCell!6340)

