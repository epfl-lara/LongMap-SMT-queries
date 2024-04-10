; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20664 () Bool)

(assert start!20664)

(declare-fun b_free!5323 () Bool)

(declare-fun b_next!5323 () Bool)

(assert (=> start!20664 (= b_free!5323 (not b_next!5323))))

(declare-fun tp!19001 () Bool)

(declare-fun b_and!12069 () Bool)

(assert (=> start!20664 (= tp!19001 b_and!12069)))

(declare-fun b!206456 () Bool)

(declare-fun e!134938 () Bool)

(declare-fun tp_is_empty!5179 () Bool)

(assert (=> b!206456 (= e!134938 tp_is_empty!5179)))

(declare-fun b!206457 () Bool)

(declare-fun res!100019 () Bool)

(declare-fun e!134939 () Bool)

(assert (=> b!206457 (=> (not res!100019) (not e!134939))))

(declare-datatypes ((array!9569 0))(
  ( (array!9570 (arr!4535 (Array (_ BitVec 32) (_ BitVec 64))) (size!4860 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9569)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206457 (= res!100019 (= (select (arr!4535 _keys!825) i!601) k!843))))

(declare-fun b!206458 () Bool)

(declare-fun res!100023 () Bool)

(assert (=> b!206458 (=> (not res!100023) (not e!134939))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6553 0))(
  ( (V!6554 (val!2634 Int)) )
))
(declare-datatypes ((ValueCell!2246 0))(
  ( (ValueCellFull!2246 (v!4604 V!6553)) (EmptyCell!2246) )
))
(declare-datatypes ((array!9571 0))(
  ( (array!9572 (arr!4536 (Array (_ BitVec 32) ValueCell!2246)) (size!4861 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9571)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206458 (= res!100023 (and (= (size!4861 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4860 _keys!825) (size!4861 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206459 () Bool)

(assert (=> b!206459 (= e!134939 (not true))))

(declare-datatypes ((tuple2!4002 0))(
  ( (tuple2!4003 (_1!2012 (_ BitVec 64)) (_2!2012 V!6553)) )
))
(declare-datatypes ((List!2893 0))(
  ( (Nil!2890) (Cons!2889 (h!3531 tuple2!4002) (t!7824 List!2893)) )
))
(declare-datatypes ((ListLongMap!2915 0))(
  ( (ListLongMap!2916 (toList!1473 List!2893)) )
))
(declare-fun lt!105587 () ListLongMap!2915)

(declare-fun zeroValue!615 () V!6553)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6553)

(declare-fun getCurrentListMap!1040 (array!9569 array!9571 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) Int) ListLongMap!2915)

(assert (=> b!206459 (= lt!105587 (getCurrentListMap!1040 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105586 () ListLongMap!2915)

(declare-fun lt!105584 () array!9571)

(assert (=> b!206459 (= lt!105586 (getCurrentListMap!1040 _keys!825 lt!105584 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105588 () ListLongMap!2915)

(declare-fun lt!105583 () ListLongMap!2915)

(assert (=> b!206459 (and (= lt!105588 lt!105583) (= lt!105583 lt!105588))))

(declare-fun v!520 () V!6553)

(declare-fun lt!105585 () ListLongMap!2915)

(declare-fun +!500 (ListLongMap!2915 tuple2!4002) ListLongMap!2915)

(assert (=> b!206459 (= lt!105583 (+!500 lt!105585 (tuple2!4003 k!843 v!520)))))

(declare-datatypes ((Unit!6288 0))(
  ( (Unit!6289) )
))
(declare-fun lt!105582 () Unit!6288)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!153 (array!9569 array!9571 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) (_ BitVec 64) V!6553 (_ BitVec 32) Int) Unit!6288)

(assert (=> b!206459 (= lt!105582 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!153 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!414 (array!9569 array!9571 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) Int) ListLongMap!2915)

(assert (=> b!206459 (= lt!105588 (getCurrentListMapNoExtraKeys!414 _keys!825 lt!105584 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206459 (= lt!105584 (array!9572 (store (arr!4536 _values!649) i!601 (ValueCellFull!2246 v!520)) (size!4861 _values!649)))))

(assert (=> b!206459 (= lt!105585 (getCurrentListMapNoExtraKeys!414 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206460 () Bool)

(declare-fun e!134936 () Bool)

(assert (=> b!206460 (= e!134936 tp_is_empty!5179)))

(declare-fun b!206461 () Bool)

(declare-fun res!100024 () Bool)

(assert (=> b!206461 (=> (not res!100024) (not e!134939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206461 (= res!100024 (validKeyInArray!0 k!843))))

(declare-fun res!100022 () Bool)

(assert (=> start!20664 (=> (not res!100022) (not e!134939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20664 (= res!100022 (validMask!0 mask!1149))))

(assert (=> start!20664 e!134939))

(declare-fun e!134935 () Bool)

(declare-fun array_inv!2999 (array!9571) Bool)

(assert (=> start!20664 (and (array_inv!2999 _values!649) e!134935)))

(assert (=> start!20664 true))

(assert (=> start!20664 tp_is_empty!5179))

(declare-fun array_inv!3000 (array!9569) Bool)

(assert (=> start!20664 (array_inv!3000 _keys!825)))

(assert (=> start!20664 tp!19001))

(declare-fun b!206462 () Bool)

(declare-fun res!100021 () Bool)

(assert (=> b!206462 (=> (not res!100021) (not e!134939))))

(declare-datatypes ((List!2894 0))(
  ( (Nil!2891) (Cons!2890 (h!3532 (_ BitVec 64)) (t!7825 List!2894)) )
))
(declare-fun arrayNoDuplicates!0 (array!9569 (_ BitVec 32) List!2894) Bool)

(assert (=> b!206462 (= res!100021 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2891))))

(declare-fun mapNonEmpty!8837 () Bool)

(declare-fun mapRes!8837 () Bool)

(declare-fun tp!19000 () Bool)

(assert (=> mapNonEmpty!8837 (= mapRes!8837 (and tp!19000 e!134936))))

(declare-fun mapValue!8837 () ValueCell!2246)

(declare-fun mapKey!8837 () (_ BitVec 32))

(declare-fun mapRest!8837 () (Array (_ BitVec 32) ValueCell!2246))

(assert (=> mapNonEmpty!8837 (= (arr!4536 _values!649) (store mapRest!8837 mapKey!8837 mapValue!8837))))

(declare-fun b!206463 () Bool)

(assert (=> b!206463 (= e!134935 (and e!134938 mapRes!8837))))

(declare-fun condMapEmpty!8837 () Bool)

(declare-fun mapDefault!8837 () ValueCell!2246)

