; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42006 () Bool)

(assert start!42006)

(declare-fun b_free!11579 () Bool)

(declare-fun b_next!11579 () Bool)

(assert (=> start!42006 (= b_free!11579 (not b_next!11579))))

(declare-fun tp!40753 () Bool)

(declare-fun b_and!19977 () Bool)

(assert (=> start!42006 (= tp!40753 b_and!19977)))

(declare-fun mapNonEmpty!21205 () Bool)

(declare-fun mapRes!21205 () Bool)

(declare-fun tp!40752 () Bool)

(declare-fun e!274576 () Bool)

(assert (=> mapNonEmpty!21205 (= mapRes!21205 (and tp!40752 e!274576))))

(declare-fun mapKey!21205 () (_ BitVec 32))

(declare-datatypes ((V!18447 0))(
  ( (V!18448 (val!6548 Int)) )
))
(declare-datatypes ((ValueCell!6160 0))(
  ( (ValueCellFull!6160 (v!8837 V!18447)) (EmptyCell!6160) )
))
(declare-fun mapRest!21205 () (Array (_ BitVec 32) ValueCell!6160))

(declare-datatypes ((array!29787 0))(
  ( (array!29788 (arr!14319 (Array (_ BitVec 32) ValueCell!6160)) (size!14671 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29787)

(declare-fun mapValue!21205 () ValueCell!6160)

(assert (=> mapNonEmpty!21205 (= (arr!14319 _values!833) (store mapRest!21205 mapKey!21205 mapValue!21205))))

(declare-fun mapIsEmpty!21205 () Bool)

(assert (=> mapIsEmpty!21205 mapRes!21205))

(declare-fun b!469002 () Bool)

(declare-fun e!274573 () Bool)

(declare-fun e!274577 () Bool)

(assert (=> b!469002 (= e!274573 (not e!274577))))

(declare-fun res!280287 () Bool)

(assert (=> b!469002 (=> res!280287 e!274577)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469002 (= res!280287 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8612 0))(
  ( (tuple2!8613 (_1!4317 (_ BitVec 64)) (_2!4317 V!18447)) )
))
(declare-datatypes ((List!8696 0))(
  ( (Nil!8693) (Cons!8692 (h!9548 tuple2!8612) (t!14654 List!8696)) )
))
(declare-datatypes ((ListLongMap!7525 0))(
  ( (ListLongMap!7526 (toList!3778 List!8696)) )
))
(declare-fun lt!212338 () ListLongMap!7525)

(declare-fun lt!212337 () ListLongMap!7525)

(assert (=> b!469002 (= lt!212338 lt!212337)))

(declare-fun minValueBefore!38 () V!18447)

(declare-fun zeroValue!794 () V!18447)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13711 0))(
  ( (Unit!13712) )
))
(declare-fun lt!212334 () Unit!13711)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29789 0))(
  ( (array!29790 (arr!14320 (Array (_ BitVec 32) (_ BitVec 64))) (size!14672 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29789)

(declare-fun minValueAfter!38 () V!18447)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!127 (array!29789 array!29787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18447 V!18447 V!18447 V!18447 (_ BitVec 32) Int) Unit!13711)

(assert (=> b!469002 (= lt!212334 (lemmaNoChangeToArrayThenSameMapNoExtras!127 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1947 (array!29789 array!29787 (_ BitVec 32) (_ BitVec 32) V!18447 V!18447 (_ BitVec 32) Int) ListLongMap!7525)

(assert (=> b!469002 (= lt!212337 (getCurrentListMapNoExtraKeys!1947 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469002 (= lt!212338 (getCurrentListMapNoExtraKeys!1947 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469003 () Bool)

(assert (=> b!469003 (= e!274577 true)))

(declare-fun lt!212332 () tuple2!8612)

(declare-fun +!1688 (ListLongMap!7525 tuple2!8612) ListLongMap!7525)

(assert (=> b!469003 (= (+!1688 lt!212338 lt!212332) (+!1688 (+!1688 lt!212338 (tuple2!8613 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212332))))

(assert (=> b!469003 (= lt!212332 (tuple2!8613 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212335 () Unit!13711)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!101 (ListLongMap!7525 (_ BitVec 64) V!18447 V!18447) Unit!13711)

(assert (=> b!469003 (= lt!212335 (addSameAsAddTwiceSameKeyDiffValues!101 lt!212338 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212336 () ListLongMap!7525)

(declare-fun getCurrentListMap!2202 (array!29789 array!29787 (_ BitVec 32) (_ BitVec 32) V!18447 V!18447 (_ BitVec 32) Int) ListLongMap!7525)

(assert (=> b!469003 (= lt!212336 (getCurrentListMap!2202 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212333 () ListLongMap!7525)

(assert (=> b!469003 (= lt!212333 (getCurrentListMap!2202 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469004 () Bool)

(declare-fun tp_is_empty!13007 () Bool)

(assert (=> b!469004 (= e!274576 tp_is_empty!13007)))

(declare-fun b!469005 () Bool)

(declare-fun e!274575 () Bool)

(declare-fun e!274572 () Bool)

(assert (=> b!469005 (= e!274575 (and e!274572 mapRes!21205))))

(declare-fun condMapEmpty!21205 () Bool)

(declare-fun mapDefault!21205 () ValueCell!6160)

