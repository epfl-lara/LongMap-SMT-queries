; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20688 () Bool)

(assert start!20688)

(declare-fun b_free!5347 () Bool)

(declare-fun b_next!5347 () Bool)

(assert (=> start!20688 (= b_free!5347 (not b_next!5347))))

(declare-fun tp!19073 () Bool)

(declare-fun b_and!12093 () Bool)

(assert (=> start!20688 (= tp!19073 b_and!12093)))

(declare-fun b!206816 () Bool)

(declare-fun e!135118 () Bool)

(declare-fun tp_is_empty!5203 () Bool)

(assert (=> b!206816 (= e!135118 tp_is_empty!5203)))

(declare-fun b!206817 () Bool)

(declare-fun res!100276 () Bool)

(declare-fun e!135117 () Bool)

(assert (=> b!206817 (=> (not res!100276) (not e!135117))))

(declare-datatypes ((array!9615 0))(
  ( (array!9616 (arr!4558 (Array (_ BitVec 32) (_ BitVec 64))) (size!4883 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9615)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6585 0))(
  ( (V!6586 (val!2646 Int)) )
))
(declare-datatypes ((ValueCell!2258 0))(
  ( (ValueCellFull!2258 (v!4616 V!6585)) (EmptyCell!2258) )
))
(declare-datatypes ((array!9617 0))(
  ( (array!9618 (arr!4559 (Array (_ BitVec 32) ValueCell!2258)) (size!4884 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9617)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206817 (= res!100276 (and (= (size!4884 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4883 _keys!825) (size!4884 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100270 () Bool)

(assert (=> start!20688 (=> (not res!100270) (not e!135117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20688 (= res!100270 (validMask!0 mask!1149))))

(assert (=> start!20688 e!135117))

(declare-fun e!135119 () Bool)

(declare-fun array_inv!3015 (array!9617) Bool)

(assert (=> start!20688 (and (array_inv!3015 _values!649) e!135119)))

(assert (=> start!20688 true))

(assert (=> start!20688 tp_is_empty!5203))

(declare-fun array_inv!3016 (array!9615) Bool)

(assert (=> start!20688 (array_inv!3016 _keys!825)))

(assert (=> start!20688 tp!19073))

(declare-fun b!206818 () Bool)

(declare-fun res!100274 () Bool)

(assert (=> b!206818 (=> (not res!100274) (not e!135117))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206818 (= res!100274 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8873 () Bool)

(declare-fun mapRes!8873 () Bool)

(declare-fun tp!19072 () Bool)

(assert (=> mapNonEmpty!8873 (= mapRes!8873 (and tp!19072 e!135118))))

(declare-fun mapValue!8873 () ValueCell!2258)

(declare-fun mapKey!8873 () (_ BitVec 32))

(declare-fun mapRest!8873 () (Array (_ BitVec 32) ValueCell!2258))

(assert (=> mapNonEmpty!8873 (= (arr!4559 _values!649) (store mapRest!8873 mapKey!8873 mapValue!8873))))

(declare-fun b!206819 () Bool)

(declare-fun e!135116 () Bool)

(assert (=> b!206819 (= e!135116 tp_is_empty!5203)))

(declare-fun b!206820 () Bool)

(declare-fun res!100272 () Bool)

(assert (=> b!206820 (=> (not res!100272) (not e!135117))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206820 (= res!100272 (= (select (arr!4558 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!8873 () Bool)

(assert (=> mapIsEmpty!8873 mapRes!8873))

(declare-fun b!206821 () Bool)

(declare-fun res!100271 () Bool)

(assert (=> b!206821 (=> (not res!100271) (not e!135117))))

(assert (=> b!206821 (= res!100271 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4883 _keys!825))))))

(declare-fun b!206822 () Bool)

(assert (=> b!206822 (= e!135117 (not true))))

(declare-datatypes ((tuple2!4018 0))(
  ( (tuple2!4019 (_1!2020 (_ BitVec 64)) (_2!2020 V!6585)) )
))
(declare-datatypes ((List!2908 0))(
  ( (Nil!2905) (Cons!2904 (h!3546 tuple2!4018) (t!7839 List!2908)) )
))
(declare-datatypes ((ListLongMap!2931 0))(
  ( (ListLongMap!2932 (toList!1481 List!2908)) )
))
(declare-fun lt!105836 () ListLongMap!2931)

(declare-fun zeroValue!615 () V!6585)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6585)

(declare-fun getCurrentListMap!1048 (array!9615 array!9617 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) Int) ListLongMap!2931)

(assert (=> b!206822 (= lt!105836 (getCurrentListMap!1048 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105835 () ListLongMap!2931)

(declare-fun lt!105838 () array!9617)

(assert (=> b!206822 (= lt!105835 (getCurrentListMap!1048 _keys!825 lt!105838 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105837 () ListLongMap!2931)

(declare-fun lt!105839 () ListLongMap!2931)

(assert (=> b!206822 (and (= lt!105837 lt!105839) (= lt!105839 lt!105837))))

(declare-fun v!520 () V!6585)

(declare-fun lt!105834 () ListLongMap!2931)

(declare-fun +!508 (ListLongMap!2931 tuple2!4018) ListLongMap!2931)

(assert (=> b!206822 (= lt!105839 (+!508 lt!105834 (tuple2!4019 k!843 v!520)))))

(declare-datatypes ((Unit!6304 0))(
  ( (Unit!6305) )
))
(declare-fun lt!105840 () Unit!6304)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!161 (array!9615 array!9617 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) (_ BitVec 64) V!6585 (_ BitVec 32) Int) Unit!6304)

(assert (=> b!206822 (= lt!105840 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!161 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!422 (array!9615 array!9617 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) Int) ListLongMap!2931)

(assert (=> b!206822 (= lt!105837 (getCurrentListMapNoExtraKeys!422 _keys!825 lt!105838 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206822 (= lt!105838 (array!9618 (store (arr!4559 _values!649) i!601 (ValueCellFull!2258 v!520)) (size!4884 _values!649)))))

(assert (=> b!206822 (= lt!105834 (getCurrentListMapNoExtraKeys!422 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206823 () Bool)

(declare-fun res!100275 () Bool)

(assert (=> b!206823 (=> (not res!100275) (not e!135117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9615 (_ BitVec 32)) Bool)

(assert (=> b!206823 (= res!100275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206824 () Bool)

(declare-fun res!100273 () Bool)

(assert (=> b!206824 (=> (not res!100273) (not e!135117))))

(declare-datatypes ((List!2909 0))(
  ( (Nil!2906) (Cons!2905 (h!3547 (_ BitVec 64)) (t!7840 List!2909)) )
))
(declare-fun arrayNoDuplicates!0 (array!9615 (_ BitVec 32) List!2909) Bool)

(assert (=> b!206824 (= res!100273 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2906))))

(declare-fun b!206825 () Bool)

(assert (=> b!206825 (= e!135119 (and e!135116 mapRes!8873))))

(declare-fun condMapEmpty!8873 () Bool)

(declare-fun mapDefault!8873 () ValueCell!2258)

