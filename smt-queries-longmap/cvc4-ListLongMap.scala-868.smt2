; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20308 () Bool)

(assert start!20308)

(declare-fun b_free!4967 () Bool)

(declare-fun b_next!4967 () Bool)

(assert (=> start!20308 (= b_free!4967 (not b_next!4967))))

(declare-fun tp!17933 () Bool)

(declare-fun b_and!11713 () Bool)

(assert (=> start!20308 (= tp!17933 b_and!11713)))

(declare-fun b!200054 () Bool)

(declare-fun res!95219 () Bool)

(declare-fun e!131232 () Bool)

(assert (=> b!200054 (=> (not res!95219) (not e!131232))))

(declare-datatypes ((array!8883 0))(
  ( (array!8884 (arr!4192 (Array (_ BitVec 32) (_ BitVec 64))) (size!4517 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8883)

(declare-datatypes ((List!2629 0))(
  ( (Nil!2626) (Cons!2625 (h!3267 (_ BitVec 64)) (t!7560 List!2629)) )
))
(declare-fun arrayNoDuplicates!0 (array!8883 (_ BitVec 32) List!2629) Bool)

(assert (=> b!200054 (= res!95219 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2626))))

(declare-fun b!200055 () Bool)

(declare-fun res!95223 () Bool)

(assert (=> b!200055 (=> (not res!95223) (not e!131232))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200055 (= res!95223 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4517 _keys!825))))))

(declare-fun b!200056 () Bool)

(declare-fun res!95221 () Bool)

(assert (=> b!200056 (=> (not res!95221) (not e!131232))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6077 0))(
  ( (V!6078 (val!2456 Int)) )
))
(declare-datatypes ((ValueCell!2068 0))(
  ( (ValueCellFull!2068 (v!4426 V!6077)) (EmptyCell!2068) )
))
(declare-datatypes ((array!8885 0))(
  ( (array!8886 (arr!4193 (Array (_ BitVec 32) ValueCell!2068)) (size!4518 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8885)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200056 (= res!95221 (and (= (size!4518 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4517 _keys!825) (size!4518 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200057 () Bool)

(declare-fun res!95218 () Bool)

(assert (=> b!200057 (=> (not res!95218) (not e!131232))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200057 (= res!95218 (validKeyInArray!0 k!843))))

(declare-fun res!95224 () Bool)

(assert (=> start!20308 (=> (not res!95224) (not e!131232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20308 (= res!95224 (validMask!0 mask!1149))))

(assert (=> start!20308 e!131232))

(declare-fun e!131231 () Bool)

(declare-fun array_inv!2759 (array!8885) Bool)

(assert (=> start!20308 (and (array_inv!2759 _values!649) e!131231)))

(assert (=> start!20308 true))

(declare-fun tp_is_empty!4823 () Bool)

(assert (=> start!20308 tp_is_empty!4823))

(declare-fun array_inv!2760 (array!8883) Bool)

(assert (=> start!20308 (array_inv!2760 _keys!825)))

(assert (=> start!20308 tp!17933))

(declare-fun b!200058 () Bool)

(declare-fun res!95222 () Bool)

(assert (=> b!200058 (=> (not res!95222) (not e!131232))))

(assert (=> b!200058 (= res!95222 (= (select (arr!4192 _keys!825) i!601) k!843))))

(declare-fun b!200059 () Bool)

(declare-fun e!131233 () Bool)

(assert (=> b!200059 (= e!131233 tp_is_empty!4823)))

(declare-fun b!200060 () Bool)

(assert (=> b!200060 (= e!131232 (not true))))

(declare-fun lt!98689 () array!8885)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6077)

(declare-fun zeroValue!615 () V!6077)

(declare-datatypes ((tuple2!3712 0))(
  ( (tuple2!3713 (_1!1867 (_ BitVec 64)) (_2!1867 V!6077)) )
))
(declare-datatypes ((List!2630 0))(
  ( (Nil!2627) (Cons!2626 (h!3268 tuple2!3712) (t!7561 List!2630)) )
))
(declare-datatypes ((ListLongMap!2625 0))(
  ( (ListLongMap!2626 (toList!1328 List!2630)) )
))
(declare-fun lt!98688 () ListLongMap!2625)

(declare-fun getCurrentListMap!919 (array!8883 array!8885 (_ BitVec 32) (_ BitVec 32) V!6077 V!6077 (_ BitVec 32) Int) ListLongMap!2625)

(assert (=> b!200060 (= lt!98688 (getCurrentListMap!919 _keys!825 lt!98689 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98691 () ListLongMap!2625)

(declare-fun lt!98686 () ListLongMap!2625)

(assert (=> b!200060 (and (= lt!98691 lt!98686) (= lt!98686 lt!98691))))

(declare-fun lt!98690 () ListLongMap!2625)

(declare-fun v!520 () V!6077)

(declare-fun +!355 (ListLongMap!2625 tuple2!3712) ListLongMap!2625)

(assert (=> b!200060 (= lt!98686 (+!355 lt!98690 (tuple2!3713 k!843 v!520)))))

(declare-datatypes ((Unit!6012 0))(
  ( (Unit!6013) )
))
(declare-fun lt!98687 () Unit!6012)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!32 (array!8883 array!8885 (_ BitVec 32) (_ BitVec 32) V!6077 V!6077 (_ BitVec 32) (_ BitVec 64) V!6077 (_ BitVec 32) Int) Unit!6012)

(assert (=> b!200060 (= lt!98687 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!32 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!293 (array!8883 array!8885 (_ BitVec 32) (_ BitVec 32) V!6077 V!6077 (_ BitVec 32) Int) ListLongMap!2625)

(assert (=> b!200060 (= lt!98691 (getCurrentListMapNoExtraKeys!293 _keys!825 lt!98689 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200060 (= lt!98689 (array!8886 (store (arr!4193 _values!649) i!601 (ValueCellFull!2068 v!520)) (size!4518 _values!649)))))

(assert (=> b!200060 (= lt!98690 (getCurrentListMapNoExtraKeys!293 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8303 () Bool)

(declare-fun mapRes!8303 () Bool)

(declare-fun tp!17932 () Bool)

(assert (=> mapNonEmpty!8303 (= mapRes!8303 (and tp!17932 e!131233))))

(declare-fun mapKey!8303 () (_ BitVec 32))

(declare-fun mapRest!8303 () (Array (_ BitVec 32) ValueCell!2068))

(declare-fun mapValue!8303 () ValueCell!2068)

(assert (=> mapNonEmpty!8303 (= (arr!4193 _values!649) (store mapRest!8303 mapKey!8303 mapValue!8303))))

(declare-fun b!200061 () Bool)

(declare-fun res!95220 () Bool)

(assert (=> b!200061 (=> (not res!95220) (not e!131232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8883 (_ BitVec 32)) Bool)

(assert (=> b!200061 (= res!95220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200062 () Bool)

(declare-fun e!131230 () Bool)

(assert (=> b!200062 (= e!131230 tp_is_empty!4823)))

(declare-fun b!200063 () Bool)

(assert (=> b!200063 (= e!131231 (and e!131230 mapRes!8303))))

(declare-fun condMapEmpty!8303 () Bool)

(declare-fun mapDefault!8303 () ValueCell!2068)

