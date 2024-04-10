; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41920 () Bool)

(assert start!41920)

(declare-fun b_free!11509 () Bool)

(declare-fun b_next!11509 () Bool)

(assert (=> start!41920 (= b_free!11509 (not b_next!11509))))

(declare-fun tp!40540 () Bool)

(declare-fun b_and!19897 () Bool)

(assert (=> start!41920 (= tp!40540 b_and!19897)))

(declare-fun b!468015 () Bool)

(declare-fun e!273852 () Bool)

(assert (=> b!468015 (= e!273852 true)))

(declare-datatypes ((V!18355 0))(
  ( (V!18356 (val!6513 Int)) )
))
(declare-fun minValueBefore!38 () V!18355)

(declare-datatypes ((tuple2!8554 0))(
  ( (tuple2!8555 (_1!4288 (_ BitVec 64)) (_2!4288 V!18355)) )
))
(declare-datatypes ((List!8642 0))(
  ( (Nil!8639) (Cons!8638 (h!9494 tuple2!8554) (t!14598 List!8642)) )
))
(declare-datatypes ((ListLongMap!7467 0))(
  ( (ListLongMap!7468 (toList!3749 List!8642)) )
))
(declare-fun lt!211623 () ListLongMap!7467)

(declare-fun zeroValue!794 () V!18355)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((array!29651 0))(
  ( (array!29652 (arr!14252 (Array (_ BitVec 32) (_ BitVec 64))) (size!14604 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29651)

(declare-datatypes ((ValueCell!6125 0))(
  ( (ValueCellFull!6125 (v!8802 V!18355)) (EmptyCell!6125) )
))
(declare-datatypes ((array!29653 0))(
  ( (array!29654 (arr!14253 (Array (_ BitVec 32) ValueCell!6125)) (size!14605 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29653)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2178 (array!29651 array!29653 (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 (_ BitVec 32) Int) ListLongMap!7467)

(assert (=> b!468015 (= lt!211623 (getCurrentListMap!2178 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468016 () Bool)

(declare-fun res!279704 () Bool)

(declare-fun e!273849 () Bool)

(assert (=> b!468016 (=> (not res!279704) (not e!273849))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468016 (= res!279704 (and (= (size!14605 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14604 _keys!1025) (size!14605 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21097 () Bool)

(declare-fun mapRes!21097 () Bool)

(declare-fun tp!40539 () Bool)

(declare-fun e!273851 () Bool)

(assert (=> mapNonEmpty!21097 (= mapRes!21097 (and tp!40539 e!273851))))

(declare-fun mapKey!21097 () (_ BitVec 32))

(declare-fun mapValue!21097 () ValueCell!6125)

(declare-fun mapRest!21097 () (Array (_ BitVec 32) ValueCell!6125))

(assert (=> mapNonEmpty!21097 (= (arr!14253 _values!833) (store mapRest!21097 mapKey!21097 mapValue!21097))))

(declare-fun b!468017 () Bool)

(declare-fun e!273850 () Bool)

(declare-fun tp_is_empty!12937 () Bool)

(assert (=> b!468017 (= e!273850 tp_is_empty!12937)))

(declare-fun b!468018 () Bool)

(declare-fun res!279706 () Bool)

(assert (=> b!468018 (=> (not res!279706) (not e!273849))))

(declare-datatypes ((List!8643 0))(
  ( (Nil!8640) (Cons!8639 (h!9495 (_ BitVec 64)) (t!14599 List!8643)) )
))
(declare-fun arrayNoDuplicates!0 (array!29651 (_ BitVec 32) List!8643) Bool)

(assert (=> b!468018 (= res!279706 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8640))))

(declare-fun b!468014 () Bool)

(assert (=> b!468014 (= e!273849 (not e!273852))))

(declare-fun res!279703 () Bool)

(assert (=> b!468014 (=> res!279703 e!273852)))

(assert (=> b!468014 (= res!279703 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211620 () ListLongMap!7467)

(declare-fun lt!211622 () ListLongMap!7467)

(assert (=> b!468014 (= lt!211620 lt!211622)))

(declare-datatypes ((Unit!13656 0))(
  ( (Unit!13657) )
))
(declare-fun lt!211621 () Unit!13656)

(declare-fun minValueAfter!38 () V!18355)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!102 (array!29651 array!29653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 V!18355 V!18355 (_ BitVec 32) Int) Unit!13656)

(assert (=> b!468014 (= lt!211621 (lemmaNoChangeToArrayThenSameMapNoExtras!102 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1922 (array!29651 array!29653 (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 (_ BitVec 32) Int) ListLongMap!7467)

(assert (=> b!468014 (= lt!211622 (getCurrentListMapNoExtraKeys!1922 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468014 (= lt!211620 (getCurrentListMapNoExtraKeys!1922 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279705 () Bool)

(assert (=> start!41920 (=> (not res!279705) (not e!273849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41920 (= res!279705 (validMask!0 mask!1365))))

(assert (=> start!41920 e!273849))

(assert (=> start!41920 tp_is_empty!12937))

(assert (=> start!41920 tp!40540))

(assert (=> start!41920 true))

(declare-fun array_inv!10290 (array!29651) Bool)

(assert (=> start!41920 (array_inv!10290 _keys!1025)))

(declare-fun e!273853 () Bool)

(declare-fun array_inv!10291 (array!29653) Bool)

(assert (=> start!41920 (and (array_inv!10291 _values!833) e!273853)))

(declare-fun b!468019 () Bool)

(assert (=> b!468019 (= e!273851 tp_is_empty!12937)))

(declare-fun b!468020 () Bool)

(assert (=> b!468020 (= e!273853 (and e!273850 mapRes!21097))))

(declare-fun condMapEmpty!21097 () Bool)

(declare-fun mapDefault!21097 () ValueCell!6125)

