; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41972 () Bool)

(assert start!41972)

(declare-fun b_free!11545 () Bool)

(declare-fun b_next!11545 () Bool)

(assert (=> start!41972 (= b_free!11545 (not b_next!11545))))

(declare-fun tp!40651 () Bool)

(declare-fun b_and!19943 () Bool)

(assert (=> start!41972 (= tp!40651 b_and!19943)))

(declare-fun b!468594 () Bool)

(declare-fun e!274266 () Bool)

(declare-fun tp_is_empty!12973 () Bool)

(assert (=> b!468594 (= e!274266 tp_is_empty!12973)))

(declare-fun b!468595 () Bool)

(declare-fun e!274270 () Bool)

(assert (=> b!468595 (= e!274270 tp_is_empty!12973)))

(declare-fun res!280033 () Bool)

(declare-fun e!274267 () Bool)

(assert (=> start!41972 (=> (not res!280033) (not e!274267))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41972 (= res!280033 (validMask!0 mask!1365))))

(assert (=> start!41972 e!274267))

(assert (=> start!41972 tp_is_empty!12973))

(assert (=> start!41972 tp!40651))

(assert (=> start!41972 true))

(declare-datatypes ((array!29723 0))(
  ( (array!29724 (arr!14287 (Array (_ BitVec 32) (_ BitVec 64))) (size!14639 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29723)

(declare-fun array_inv!10314 (array!29723) Bool)

(assert (=> start!41972 (array_inv!10314 _keys!1025)))

(declare-datatypes ((V!18403 0))(
  ( (V!18404 (val!6531 Int)) )
))
(declare-datatypes ((ValueCell!6143 0))(
  ( (ValueCellFull!6143 (v!8820 V!18403)) (EmptyCell!6143) )
))
(declare-datatypes ((array!29725 0))(
  ( (array!29726 (arr!14288 (Array (_ BitVec 32) ValueCell!6143)) (size!14640 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29725)

(declare-fun e!274271 () Bool)

(declare-fun array_inv!10315 (array!29725) Bool)

(assert (=> start!41972 (and (array_inv!10315 _values!833) e!274271)))

(declare-fun b!468596 () Bool)

(declare-fun e!274268 () Bool)

(assert (=> b!468596 (= e!274267 (not e!274268))))

(declare-fun res!280032 () Bool)

(assert (=> b!468596 (=> res!280032 e!274268)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468596 (= res!280032 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8586 0))(
  ( (tuple2!8587 (_1!4304 (_ BitVec 64)) (_2!4304 V!18403)) )
))
(declare-datatypes ((List!8671 0))(
  ( (Nil!8668) (Cons!8667 (h!9523 tuple2!8586) (t!14629 List!8671)) )
))
(declare-datatypes ((ListLongMap!7499 0))(
  ( (ListLongMap!7500 (toList!3765 List!8671)) )
))
(declare-fun lt!211976 () ListLongMap!7499)

(declare-fun lt!211978 () ListLongMap!7499)

(assert (=> b!468596 (= lt!211976 lt!211978)))

(declare-fun minValueBefore!38 () V!18403)

(declare-fun zeroValue!794 () V!18403)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13685 0))(
  ( (Unit!13686) )
))
(declare-fun lt!211980 () Unit!13685)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18403)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!115 (array!29723 array!29725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 V!18403 V!18403 (_ BitVec 32) Int) Unit!13685)

(assert (=> b!468596 (= lt!211980 (lemmaNoChangeToArrayThenSameMapNoExtras!115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1935 (array!29723 array!29725 (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 (_ BitVec 32) Int) ListLongMap!7499)

(assert (=> b!468596 (= lt!211978 (getCurrentListMapNoExtraKeys!1935 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468596 (= lt!211976 (getCurrentListMapNoExtraKeys!1935 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21154 () Bool)

(declare-fun mapRes!21154 () Bool)

(assert (=> mapIsEmpty!21154 mapRes!21154))

(declare-fun b!468597 () Bool)

(assert (=> b!468597 (= e!274268 true)))

(declare-fun lt!211975 () tuple2!8586)

(declare-fun +!1677 (ListLongMap!7499 tuple2!8586) ListLongMap!7499)

(assert (=> b!468597 (= (+!1677 lt!211976 lt!211975) (+!1677 (+!1677 lt!211976 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211975))))

(assert (=> b!468597 (= lt!211975 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!211981 () Unit!13685)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!90 (ListLongMap!7499 (_ BitVec 64) V!18403 V!18403) Unit!13685)

(assert (=> b!468597 (= lt!211981 (addSameAsAddTwiceSameKeyDiffValues!90 lt!211976 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!211979 () ListLongMap!7499)

(declare-fun getCurrentListMap!2191 (array!29723 array!29725 (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 (_ BitVec 32) Int) ListLongMap!7499)

(assert (=> b!468597 (= lt!211979 (getCurrentListMap!2191 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211977 () ListLongMap!7499)

(assert (=> b!468597 (= lt!211977 (getCurrentListMap!2191 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468598 () Bool)

(declare-fun res!280031 () Bool)

(assert (=> b!468598 (=> (not res!280031) (not e!274267))))

(declare-datatypes ((List!8672 0))(
  ( (Nil!8669) (Cons!8668 (h!9524 (_ BitVec 64)) (t!14630 List!8672)) )
))
(declare-fun arrayNoDuplicates!0 (array!29723 (_ BitVec 32) List!8672) Bool)

(assert (=> b!468598 (= res!280031 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8669))))

(declare-fun b!468599 () Bool)

(declare-fun res!280034 () Bool)

(assert (=> b!468599 (=> (not res!280034) (not e!274267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29723 (_ BitVec 32)) Bool)

(assert (=> b!468599 (= res!280034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468600 () Bool)

(assert (=> b!468600 (= e!274271 (and e!274270 mapRes!21154))))

(declare-fun condMapEmpty!21154 () Bool)

(declare-fun mapDefault!21154 () ValueCell!6143)

