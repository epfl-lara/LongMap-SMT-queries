; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20272 () Bool)

(assert start!20272)

(declare-fun b_free!4931 () Bool)

(declare-fun b_next!4931 () Bool)

(assert (=> start!20272 (= b_free!4931 (not b_next!4931))))

(declare-fun tp!17825 () Bool)

(declare-fun b_and!11677 () Bool)

(assert (=> start!20272 (= tp!17825 b_and!11677)))

(declare-fun b!199514 () Bool)

(declare-fun e!130963 () Bool)

(declare-fun tp_is_empty!4787 () Bool)

(assert (=> b!199514 (= e!130963 tp_is_empty!4787)))

(declare-fun b!199515 () Bool)

(declare-fun res!94841 () Bool)

(declare-fun e!130961 () Bool)

(assert (=> b!199515 (=> (not res!94841) (not e!130961))))

(declare-datatypes ((array!8815 0))(
  ( (array!8816 (arr!4158 (Array (_ BitVec 32) (_ BitVec 64))) (size!4483 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8815)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199515 (= res!94841 (= (select (arr!4158 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8249 () Bool)

(declare-fun mapRes!8249 () Bool)

(declare-fun tp!17824 () Bool)

(assert (=> mapNonEmpty!8249 (= mapRes!8249 (and tp!17824 e!130963))))

(declare-fun mapKey!8249 () (_ BitVec 32))

(declare-datatypes ((V!6029 0))(
  ( (V!6030 (val!2438 Int)) )
))
(declare-datatypes ((ValueCell!2050 0))(
  ( (ValueCellFull!2050 (v!4408 V!6029)) (EmptyCell!2050) )
))
(declare-fun mapRest!8249 () (Array (_ BitVec 32) ValueCell!2050))

(declare-datatypes ((array!8817 0))(
  ( (array!8818 (arr!4159 (Array (_ BitVec 32) ValueCell!2050)) (size!4484 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8817)

(declare-fun mapValue!8249 () ValueCell!2050)

(assert (=> mapNonEmpty!8249 (= (arr!4159 _values!649) (store mapRest!8249 mapKey!8249 mapValue!8249))))

(declare-fun b!199516 () Bool)

(declare-fun res!94840 () Bool)

(assert (=> b!199516 (=> (not res!94840) (not e!130961))))

(assert (=> b!199516 (= res!94840 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4483 _keys!825))))))

(declare-fun b!199517 () Bool)

(declare-fun res!94845 () Bool)

(assert (=> b!199517 (=> (not res!94845) (not e!130961))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!199517 (= res!94845 (and (= (size!4484 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4483 _keys!825) (size!4484 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199518 () Bool)

(assert (=> b!199518 (= e!130961 (not true))))

(declare-fun lt!98365 () array!8817)

(declare-datatypes ((tuple2!3688 0))(
  ( (tuple2!3689 (_1!1855 (_ BitVec 64)) (_2!1855 V!6029)) )
))
(declare-datatypes ((List!2606 0))(
  ( (Nil!2603) (Cons!2602 (h!3244 tuple2!3688) (t!7537 List!2606)) )
))
(declare-datatypes ((ListLongMap!2601 0))(
  ( (ListLongMap!2602 (toList!1316 List!2606)) )
))
(declare-fun lt!98362 () ListLongMap!2601)

(declare-fun zeroValue!615 () V!6029)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6029)

(declare-fun getCurrentListMap!907 (array!8815 array!8817 (_ BitVec 32) (_ BitVec 32) V!6029 V!6029 (_ BitVec 32) Int) ListLongMap!2601)

(assert (=> b!199518 (= lt!98362 (getCurrentListMap!907 _keys!825 lt!98365 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98367 () ListLongMap!2601)

(declare-fun lt!98366 () ListLongMap!2601)

(assert (=> b!199518 (and (= lt!98367 lt!98366) (= lt!98366 lt!98367))))

(declare-fun lt!98364 () ListLongMap!2601)

(declare-fun v!520 () V!6029)

(declare-fun +!343 (ListLongMap!2601 tuple2!3688) ListLongMap!2601)

(assert (=> b!199518 (= lt!98366 (+!343 lt!98364 (tuple2!3689 k!843 v!520)))))

(declare-datatypes ((Unit!5988 0))(
  ( (Unit!5989) )
))
(declare-fun lt!98363 () Unit!5988)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!20 (array!8815 array!8817 (_ BitVec 32) (_ BitVec 32) V!6029 V!6029 (_ BitVec 32) (_ BitVec 64) V!6029 (_ BitVec 32) Int) Unit!5988)

(assert (=> b!199518 (= lt!98363 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!20 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!281 (array!8815 array!8817 (_ BitVec 32) (_ BitVec 32) V!6029 V!6029 (_ BitVec 32) Int) ListLongMap!2601)

(assert (=> b!199518 (= lt!98367 (getCurrentListMapNoExtraKeys!281 _keys!825 lt!98365 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199518 (= lt!98365 (array!8818 (store (arr!4159 _values!649) i!601 (ValueCellFull!2050 v!520)) (size!4484 _values!649)))))

(assert (=> b!199518 (= lt!98364 (getCurrentListMapNoExtraKeys!281 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199519 () Bool)

(declare-fun res!94843 () Bool)

(assert (=> b!199519 (=> (not res!94843) (not e!130961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8815 (_ BitVec 32)) Bool)

(assert (=> b!199519 (= res!94843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94844 () Bool)

(assert (=> start!20272 (=> (not res!94844) (not e!130961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20272 (= res!94844 (validMask!0 mask!1149))))

(assert (=> start!20272 e!130961))

(declare-fun e!130962 () Bool)

(declare-fun array_inv!2731 (array!8817) Bool)

(assert (=> start!20272 (and (array_inv!2731 _values!649) e!130962)))

(assert (=> start!20272 true))

(assert (=> start!20272 tp_is_empty!4787))

(declare-fun array_inv!2732 (array!8815) Bool)

(assert (=> start!20272 (array_inv!2732 _keys!825)))

(assert (=> start!20272 tp!17825))

(declare-fun b!199520 () Bool)

(declare-fun res!94846 () Bool)

(assert (=> b!199520 (=> (not res!94846) (not e!130961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199520 (= res!94846 (validKeyInArray!0 k!843))))

(declare-fun b!199521 () Bool)

(declare-fun e!130960 () Bool)

(assert (=> b!199521 (= e!130962 (and e!130960 mapRes!8249))))

(declare-fun condMapEmpty!8249 () Bool)

(declare-fun mapDefault!8249 () ValueCell!2050)

