; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20736 () Bool)

(assert start!20736)

(declare-fun b_free!5395 () Bool)

(declare-fun b_next!5395 () Bool)

(assert (=> start!20736 (= b_free!5395 (not b_next!5395))))

(declare-fun tp!19217 () Bool)

(declare-fun b_and!12141 () Bool)

(assert (=> start!20736 (= tp!19217 b_and!12141)))

(declare-fun b!207536 () Bool)

(declare-fun res!100774 () Bool)

(declare-fun e!135477 () Bool)

(assert (=> b!207536 (=> (not res!100774) (not e!135477))))

(declare-datatypes ((array!9709 0))(
  ( (array!9710 (arr!4605 (Array (_ BitVec 32) (_ BitVec 64))) (size!4930 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9709)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6649 0))(
  ( (V!6650 (val!2670 Int)) )
))
(declare-datatypes ((ValueCell!2282 0))(
  ( (ValueCellFull!2282 (v!4640 V!6649)) (EmptyCell!2282) )
))
(declare-datatypes ((array!9711 0))(
  ( (array!9712 (arr!4606 (Array (_ BitVec 32) ValueCell!2282)) (size!4931 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9711)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207536 (= res!100774 (and (= (size!4931 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4930 _keys!825) (size!4931 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8945 () Bool)

(declare-fun mapRes!8945 () Bool)

(assert (=> mapIsEmpty!8945 mapRes!8945))

(declare-fun b!207537 () Bool)

(declare-fun res!100775 () Bool)

(assert (=> b!207537 (=> (not res!100775) (not e!135477))))

(declare-datatypes ((List!2944 0))(
  ( (Nil!2941) (Cons!2940 (h!3582 (_ BitVec 64)) (t!7875 List!2944)) )
))
(declare-fun arrayNoDuplicates!0 (array!9709 (_ BitVec 32) List!2944) Bool)

(assert (=> b!207537 (= res!100775 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2941))))

(declare-fun b!207538 () Bool)

(declare-fun e!135479 () Bool)

(declare-fun tp_is_empty!5251 () Bool)

(assert (=> b!207538 (= e!135479 tp_is_empty!5251)))

(declare-fun b!207539 () Bool)

(assert (=> b!207539 (= e!135477 (not true))))

(declare-datatypes ((tuple2!4052 0))(
  ( (tuple2!4053 (_1!2037 (_ BitVec 64)) (_2!2037 V!6649)) )
))
(declare-datatypes ((List!2945 0))(
  ( (Nil!2942) (Cons!2941 (h!3583 tuple2!4052) (t!7876 List!2945)) )
))
(declare-datatypes ((ListLongMap!2965 0))(
  ( (ListLongMap!2966 (toList!1498 List!2945)) )
))
(declare-fun lt!106351 () ListLongMap!2965)

(declare-fun zeroValue!615 () V!6649)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6649)

(declare-fun getCurrentListMap!1065 (array!9709 array!9711 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) Int) ListLongMap!2965)

(assert (=> b!207539 (= lt!106351 (getCurrentListMap!1065 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106350 () array!9711)

(declare-fun lt!106353 () ListLongMap!2965)

(assert (=> b!207539 (= lt!106353 (getCurrentListMap!1065 _keys!825 lt!106350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106347 () ListLongMap!2965)

(declare-fun lt!106352 () ListLongMap!2965)

(assert (=> b!207539 (and (= lt!106347 lt!106352) (= lt!106352 lt!106347))))

(declare-fun lt!106349 () ListLongMap!2965)

(declare-fun v!520 () V!6649)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!525 (ListLongMap!2965 tuple2!4052) ListLongMap!2965)

(assert (=> b!207539 (= lt!106352 (+!525 lt!106349 (tuple2!4053 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6338 0))(
  ( (Unit!6339) )
))
(declare-fun lt!106348 () Unit!6338)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!178 (array!9709 array!9711 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) (_ BitVec 64) V!6649 (_ BitVec 32) Int) Unit!6338)

(assert (=> b!207539 (= lt!106348 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!178 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!439 (array!9709 array!9711 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) Int) ListLongMap!2965)

(assert (=> b!207539 (= lt!106347 (getCurrentListMapNoExtraKeys!439 _keys!825 lt!106350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207539 (= lt!106350 (array!9712 (store (arr!4606 _values!649) i!601 (ValueCellFull!2282 v!520)) (size!4931 _values!649)))))

(assert (=> b!207539 (= lt!106349 (getCurrentListMapNoExtraKeys!439 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!100778 () Bool)

(assert (=> start!20736 (=> (not res!100778) (not e!135477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20736 (= res!100778 (validMask!0 mask!1149))))

(assert (=> start!20736 e!135477))

(declare-fun e!135475 () Bool)

(declare-fun array_inv!3051 (array!9711) Bool)

(assert (=> start!20736 (and (array_inv!3051 _values!649) e!135475)))

(assert (=> start!20736 true))

(assert (=> start!20736 tp_is_empty!5251))

(declare-fun array_inv!3052 (array!9709) Bool)

(assert (=> start!20736 (array_inv!3052 _keys!825)))

(assert (=> start!20736 tp!19217))

(declare-fun b!207540 () Bool)

(declare-fun res!100780 () Bool)

(assert (=> b!207540 (=> (not res!100780) (not e!135477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9709 (_ BitVec 32)) Bool)

(assert (=> b!207540 (= res!100780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207541 () Bool)

(assert (=> b!207541 (= e!135475 (and e!135479 mapRes!8945))))

(declare-fun condMapEmpty!8945 () Bool)

(declare-fun mapDefault!8945 () ValueCell!2282)

