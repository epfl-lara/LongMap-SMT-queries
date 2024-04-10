; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41938 () Bool)

(assert start!41938)

(declare-fun b_free!11527 () Bool)

(declare-fun b_next!11527 () Bool)

(assert (=> start!41938 (= b_free!11527 (not b_next!11527))))

(declare-fun tp!40593 () Bool)

(declare-fun b_and!19915 () Bool)

(assert (=> start!41938 (= tp!40593 b_and!19915)))

(declare-fun res!279838 () Bool)

(declare-fun e!274013 () Bool)

(assert (=> start!41938 (=> (not res!279838) (not e!274013))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41938 (= res!279838 (validMask!0 mask!1365))))

(assert (=> start!41938 e!274013))

(declare-fun tp_is_empty!12955 () Bool)

(assert (=> start!41938 tp_is_empty!12955))

(assert (=> start!41938 tp!40593))

(assert (=> start!41938 true))

(declare-datatypes ((array!29685 0))(
  ( (array!29686 (arr!14269 (Array (_ BitVec 32) (_ BitVec 64))) (size!14621 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29685)

(declare-fun array_inv!10302 (array!29685) Bool)

(assert (=> start!41938 (array_inv!10302 _keys!1025)))

(declare-datatypes ((V!18379 0))(
  ( (V!18380 (val!6522 Int)) )
))
(declare-datatypes ((ValueCell!6134 0))(
  ( (ValueCellFull!6134 (v!8811 V!18379)) (EmptyCell!6134) )
))
(declare-datatypes ((array!29687 0))(
  ( (array!29688 (arr!14270 (Array (_ BitVec 32) ValueCell!6134)) (size!14622 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29687)

(declare-fun e!274010 () Bool)

(declare-fun array_inv!10303 (array!29687) Bool)

(assert (=> start!41938 (and (array_inv!10303 _values!833) e!274010)))

(declare-fun b!468230 () Bool)

(declare-fun e!274014 () Bool)

(assert (=> b!468230 (= e!274014 tp_is_empty!12955)))

(declare-fun b!468231 () Bool)

(declare-fun e!274015 () Bool)

(assert (=> b!468231 (= e!274013 (not e!274015))))

(declare-fun res!279840 () Bool)

(assert (=> b!468231 (=> res!279840 e!274015)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468231 (= res!279840 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8568 0))(
  ( (tuple2!8569 (_1!4295 (_ BitVec 64)) (_2!4295 V!18379)) )
))
(declare-datatypes ((List!8656 0))(
  ( (Nil!8653) (Cons!8652 (h!9508 tuple2!8568) (t!14612 List!8656)) )
))
(declare-datatypes ((ListLongMap!7481 0))(
  ( (ListLongMap!7482 (toList!3756 List!8656)) )
))
(declare-fun lt!211730 () ListLongMap!7481)

(declare-fun lt!211729 () ListLongMap!7481)

(assert (=> b!468231 (= lt!211730 lt!211729)))

(declare-fun minValueBefore!38 () V!18379)

(declare-fun zeroValue!794 () V!18379)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13668 0))(
  ( (Unit!13669) )
))
(declare-fun lt!211731 () Unit!13668)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18379)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!108 (array!29685 array!29687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 V!18379 V!18379 (_ BitVec 32) Int) Unit!13668)

(assert (=> b!468231 (= lt!211731 (lemmaNoChangeToArrayThenSameMapNoExtras!108 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1928 (array!29685 array!29687 (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 (_ BitVec 32) Int) ListLongMap!7481)

(assert (=> b!468231 (= lt!211729 (getCurrentListMapNoExtraKeys!1928 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468231 (= lt!211730 (getCurrentListMapNoExtraKeys!1928 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21124 () Bool)

(declare-fun mapRes!21124 () Bool)

(declare-fun tp!40594 () Bool)

(assert (=> mapNonEmpty!21124 (= mapRes!21124 (and tp!40594 e!274014))))

(declare-fun mapValue!21124 () ValueCell!6134)

(declare-fun mapKey!21124 () (_ BitVec 32))

(declare-fun mapRest!21124 () (Array (_ BitVec 32) ValueCell!6134))

(assert (=> mapNonEmpty!21124 (= (arr!14270 _values!833) (store mapRest!21124 mapKey!21124 mapValue!21124))))

(declare-fun b!468232 () Bool)

(assert (=> b!468232 (= e!274015 true)))

(declare-fun lt!211728 () ListLongMap!7481)

(declare-fun getCurrentListMap!2184 (array!29685 array!29687 (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 (_ BitVec 32) Int) ListLongMap!7481)

(assert (=> b!468232 (= lt!211728 (getCurrentListMap!2184 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21124 () Bool)

(assert (=> mapIsEmpty!21124 mapRes!21124))

(declare-fun b!468233 () Bool)

(declare-fun res!279841 () Bool)

(assert (=> b!468233 (=> (not res!279841) (not e!274013))))

(assert (=> b!468233 (= res!279841 (and (= (size!14622 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14621 _keys!1025) (size!14622 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468234 () Bool)

(declare-fun e!274011 () Bool)

(assert (=> b!468234 (= e!274011 tp_is_empty!12955)))

(declare-fun b!468235 () Bool)

(declare-fun res!279837 () Bool)

(assert (=> b!468235 (=> (not res!279837) (not e!274013))))

(declare-datatypes ((List!8657 0))(
  ( (Nil!8654) (Cons!8653 (h!9509 (_ BitVec 64)) (t!14613 List!8657)) )
))
(declare-fun arrayNoDuplicates!0 (array!29685 (_ BitVec 32) List!8657) Bool)

(assert (=> b!468235 (= res!279837 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8654))))

(declare-fun b!468236 () Bool)

(declare-fun res!279839 () Bool)

(assert (=> b!468236 (=> (not res!279839) (not e!274013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29685 (_ BitVec 32)) Bool)

(assert (=> b!468236 (= res!279839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468237 () Bool)

(assert (=> b!468237 (= e!274010 (and e!274011 mapRes!21124))))

(declare-fun condMapEmpty!21124 () Bool)

(declare-fun mapDefault!21124 () ValueCell!6134)

