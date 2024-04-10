; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42148 () Bool)

(assert start!42148)

(declare-fun b_free!11681 () Bool)

(declare-fun b_next!11681 () Bool)

(assert (=> start!42148 (= b_free!11681 (not b_next!11681))))

(declare-fun tp!41065 () Bool)

(declare-fun b_and!20103 () Bool)

(assert (=> start!42148 (= tp!41065 b_and!20103)))

(declare-fun mapNonEmpty!21364 () Bool)

(declare-fun mapRes!21364 () Bool)

(declare-fun tp!41064 () Bool)

(declare-fun e!275663 () Bool)

(assert (=> mapNonEmpty!21364 (= mapRes!21364 (and tp!41064 e!275663))))

(declare-fun mapKey!21364 () (_ BitVec 32))

(declare-datatypes ((V!18583 0))(
  ( (V!18584 (val!6599 Int)) )
))
(declare-datatypes ((ValueCell!6211 0))(
  ( (ValueCellFull!6211 (v!8890 V!18583)) (EmptyCell!6211) )
))
(declare-fun mapValue!21364 () ValueCell!6211)

(declare-datatypes ((array!29989 0))(
  ( (array!29990 (arr!14418 (Array (_ BitVec 32) ValueCell!6211)) (size!14770 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29989)

(declare-fun mapRest!21364 () (Array (_ BitVec 32) ValueCell!6211))

(assert (=> mapNonEmpty!21364 (= (arr!14418 _values!833) (store mapRest!21364 mapKey!21364 mapValue!21364))))

(declare-fun b!470531 () Bool)

(declare-fun res!281152 () Bool)

(declare-fun e!275662 () Bool)

(assert (=> b!470531 (=> (not res!281152) (not e!275662))))

(declare-datatypes ((array!29991 0))(
  ( (array!29992 (arr!14419 (Array (_ BitVec 32) (_ BitVec 64))) (size!14771 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29991)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29991 (_ BitVec 32)) Bool)

(assert (=> b!470531 (= res!281152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470532 () Bool)

(assert (=> b!470532 (= e!275662 (not true))))

(declare-datatypes ((tuple2!8694 0))(
  ( (tuple2!8695 (_1!4358 (_ BitVec 64)) (_2!4358 V!18583)) )
))
(declare-datatypes ((List!8774 0))(
  ( (Nil!8771) (Cons!8770 (h!9626 tuple2!8694) (t!14736 List!8774)) )
))
(declare-datatypes ((ListLongMap!7607 0))(
  ( (ListLongMap!7608 (toList!3819 List!8774)) )
))
(declare-fun lt!213495 () ListLongMap!7607)

(declare-fun lt!213493 () ListLongMap!7607)

(assert (=> b!470532 (= lt!213495 lt!213493)))

(declare-fun minValueBefore!38 () V!18583)

(declare-fun zeroValue!794 () V!18583)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13797 0))(
  ( (Unit!13798) )
))
(declare-fun lt!213494 () Unit!13797)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18583)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!162 (array!29991 array!29989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18583 V!18583 V!18583 V!18583 (_ BitVec 32) Int) Unit!13797)

(assert (=> b!470532 (= lt!213494 (lemmaNoChangeToArrayThenSameMapNoExtras!162 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1982 (array!29991 array!29989 (_ BitVec 32) (_ BitVec 32) V!18583 V!18583 (_ BitVec 32) Int) ListLongMap!7607)

(assert (=> b!470532 (= lt!213493 (getCurrentListMapNoExtraKeys!1982 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470532 (= lt!213495 (getCurrentListMapNoExtraKeys!1982 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21364 () Bool)

(assert (=> mapIsEmpty!21364 mapRes!21364))

(declare-fun b!470533 () Bool)

(declare-fun e!275665 () Bool)

(declare-fun tp_is_empty!13109 () Bool)

(assert (=> b!470533 (= e!275665 tp_is_empty!13109)))

(declare-fun b!470534 () Bool)

(declare-fun res!281153 () Bool)

(assert (=> b!470534 (=> (not res!281153) (not e!275662))))

(declare-datatypes ((List!8775 0))(
  ( (Nil!8772) (Cons!8771 (h!9627 (_ BitVec 64)) (t!14737 List!8775)) )
))
(declare-fun arrayNoDuplicates!0 (array!29991 (_ BitVec 32) List!8775) Bool)

(assert (=> b!470534 (= res!281153 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8772))))

(declare-fun b!470535 () Bool)

(declare-fun e!275664 () Bool)

(assert (=> b!470535 (= e!275664 (and e!275665 mapRes!21364))))

(declare-fun condMapEmpty!21364 () Bool)

(declare-fun mapDefault!21364 () ValueCell!6211)

