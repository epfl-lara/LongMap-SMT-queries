; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41768 () Bool)

(assert start!41768)

(declare-fun b_free!11389 () Bool)

(declare-fun b_next!11389 () Bool)

(assert (=> start!41768 (= b_free!11389 (not b_next!11389))))

(declare-fun tp!40173 () Bool)

(declare-fun b_and!19757 () Bool)

(assert (=> start!41768 (= tp!40173 b_and!19757)))

(declare-fun b!466386 () Bool)

(declare-fun res!278774 () Bool)

(declare-fun e!272689 () Bool)

(assert (=> b!466386 (=> (not res!278774) (not e!272689))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29417 0))(
  ( (array!29418 (arr!14137 (Array (_ BitVec 32) (_ BitVec 64))) (size!14489 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29417)

(declare-datatypes ((V!18195 0))(
  ( (V!18196 (val!6453 Int)) )
))
(declare-datatypes ((ValueCell!6065 0))(
  ( (ValueCellFull!6065 (v!8741 V!18195)) (EmptyCell!6065) )
))
(declare-datatypes ((array!29419 0))(
  ( (array!29420 (arr!14138 (Array (_ BitVec 32) ValueCell!6065)) (size!14490 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29419)

(assert (=> b!466386 (= res!278774 (and (= (size!14490 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14489 _keys!1025) (size!14490 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20911 () Bool)

(declare-fun mapRes!20911 () Bool)

(declare-fun tp!40174 () Bool)

(declare-fun e!272684 () Bool)

(assert (=> mapNonEmpty!20911 (= mapRes!20911 (and tp!40174 e!272684))))

(declare-fun mapKey!20911 () (_ BitVec 32))

(declare-fun mapValue!20911 () ValueCell!6065)

(declare-fun mapRest!20911 () (Array (_ BitVec 32) ValueCell!6065))

(assert (=> mapNonEmpty!20911 (= (arr!14138 _values!833) (store mapRest!20911 mapKey!20911 mapValue!20911))))

(declare-fun b!466387 () Bool)

(declare-fun res!278771 () Bool)

(assert (=> b!466387 (=> (not res!278771) (not e!272689))))

(declare-datatypes ((List!8551 0))(
  ( (Nil!8548) (Cons!8547 (h!9403 (_ BitVec 64)) (t!14503 List!8551)) )
))
(declare-fun arrayNoDuplicates!0 (array!29417 (_ BitVec 32) List!8551) Bool)

(assert (=> b!466387 (= res!278771 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8548))))

(declare-fun b!466388 () Bool)

(declare-fun e!272687 () Bool)

(assert (=> b!466388 (= e!272689 (not e!272687))))

(declare-fun res!278773 () Bool)

(assert (=> b!466388 (=> res!278773 e!272687)))

(assert (=> b!466388 (= res!278773 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8460 0))(
  ( (tuple2!8461 (_1!4241 (_ BitVec 64)) (_2!4241 V!18195)) )
))
(declare-datatypes ((List!8552 0))(
  ( (Nil!8549) (Cons!8548 (h!9404 tuple2!8460) (t!14504 List!8552)) )
))
(declare-datatypes ((ListLongMap!7373 0))(
  ( (ListLongMap!7374 (toList!3702 List!8552)) )
))
(declare-fun lt!210762 () ListLongMap!7373)

(declare-fun lt!210759 () ListLongMap!7373)

(assert (=> b!466388 (= lt!210762 lt!210759)))

(declare-fun minValueBefore!38 () V!18195)

(declare-datatypes ((Unit!13568 0))(
  ( (Unit!13569) )
))
(declare-fun lt!210760 () Unit!13568)

(declare-fun zeroValue!794 () V!18195)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18195)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!59 (array!29417 array!29419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 V!18195 V!18195 (_ BitVec 32) Int) Unit!13568)

(assert (=> b!466388 (= lt!210760 (lemmaNoChangeToArrayThenSameMapNoExtras!59 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1879 (array!29417 array!29419 (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 (_ BitVec 32) Int) ListLongMap!7373)

(assert (=> b!466388 (= lt!210759 (getCurrentListMapNoExtraKeys!1879 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466388 (= lt!210762 (getCurrentListMapNoExtraKeys!1879 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466389 () Bool)

(assert (=> b!466389 (= e!272687 true)))

(declare-fun lt!210758 () ListLongMap!7373)

(declare-fun getCurrentListMap!2152 (array!29417 array!29419 (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 (_ BitVec 32) Int) ListLongMap!7373)

(assert (=> b!466389 (= lt!210758 (getCurrentListMap!2152 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210761 () ListLongMap!7373)

(declare-fun +!1658 (ListLongMap!7373 tuple2!8460) ListLongMap!7373)

(assert (=> b!466389 (= lt!210761 (+!1658 (getCurrentListMap!2152 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8461 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466390 () Bool)

(declare-fun tp_is_empty!12817 () Bool)

(assert (=> b!466390 (= e!272684 tp_is_empty!12817)))

(declare-fun res!278770 () Bool)

(assert (=> start!41768 (=> (not res!278770) (not e!272689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41768 (= res!278770 (validMask!0 mask!1365))))

(assert (=> start!41768 e!272689))

(assert (=> start!41768 tp_is_empty!12817))

(assert (=> start!41768 tp!40173))

(assert (=> start!41768 true))

(declare-fun array_inv!10208 (array!29417) Bool)

(assert (=> start!41768 (array_inv!10208 _keys!1025)))

(declare-fun e!272688 () Bool)

(declare-fun array_inv!10209 (array!29419) Bool)

(assert (=> start!41768 (and (array_inv!10209 _values!833) e!272688)))

(declare-fun b!466391 () Bool)

(declare-fun res!278772 () Bool)

(assert (=> b!466391 (=> (not res!278772) (not e!272689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29417 (_ BitVec 32)) Bool)

(assert (=> b!466391 (= res!278772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466392 () Bool)

(declare-fun e!272685 () Bool)

(assert (=> b!466392 (= e!272685 tp_is_empty!12817)))

(declare-fun mapIsEmpty!20911 () Bool)

(assert (=> mapIsEmpty!20911 mapRes!20911))

(declare-fun b!466393 () Bool)

(assert (=> b!466393 (= e!272688 (and e!272685 mapRes!20911))))

(declare-fun condMapEmpty!20911 () Bool)

(declare-fun mapDefault!20911 () ValueCell!6065)

