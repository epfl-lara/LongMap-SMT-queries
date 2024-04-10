; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20292 () Bool)

(assert start!20292)

(declare-fun b_free!4951 () Bool)

(declare-fun b_next!4951 () Bool)

(assert (=> start!20292 (= b_free!4951 (not b_next!4951))))

(declare-fun tp!17885 () Bool)

(declare-fun b_and!11697 () Bool)

(assert (=> start!20292 (= tp!17885 b_and!11697)))

(declare-fun b!199814 () Bool)

(declare-fun res!95053 () Bool)

(declare-fun e!131114 () Bool)

(assert (=> b!199814 (=> (not res!95053) (not e!131114))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199814 (= res!95053 (validKeyInArray!0 k!843))))

(declare-fun b!199815 () Bool)

(declare-fun e!131110 () Bool)

(declare-fun tp_is_empty!4807 () Bool)

(assert (=> b!199815 (= e!131110 tp_is_empty!4807)))

(declare-fun b!199816 () Bool)

(declare-fun res!95056 () Bool)

(assert (=> b!199816 (=> (not res!95056) (not e!131114))))

(declare-datatypes ((array!8851 0))(
  ( (array!8852 (arr!4176 (Array (_ BitVec 32) (_ BitVec 64))) (size!4501 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8851)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8851 (_ BitVec 32)) Bool)

(assert (=> b!199816 (= res!95056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199817 () Bool)

(declare-fun res!95051 () Bool)

(assert (=> b!199817 (=> (not res!95051) (not e!131114))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6057 0))(
  ( (V!6058 (val!2448 Int)) )
))
(declare-datatypes ((ValueCell!2060 0))(
  ( (ValueCellFull!2060 (v!4418 V!6057)) (EmptyCell!2060) )
))
(declare-datatypes ((array!8853 0))(
  ( (array!8854 (arr!4177 (Array (_ BitVec 32) ValueCell!2060)) (size!4502 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8853)

(assert (=> b!199817 (= res!95051 (and (= (size!4502 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4501 _keys!825) (size!4502 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!95050 () Bool)

(assert (=> start!20292 (=> (not res!95050) (not e!131114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20292 (= res!95050 (validMask!0 mask!1149))))

(assert (=> start!20292 e!131114))

(declare-fun e!131112 () Bool)

(declare-fun array_inv!2745 (array!8853) Bool)

(assert (=> start!20292 (and (array_inv!2745 _values!649) e!131112)))

(assert (=> start!20292 true))

(assert (=> start!20292 tp_is_empty!4807))

(declare-fun array_inv!2746 (array!8851) Bool)

(assert (=> start!20292 (array_inv!2746 _keys!825)))

(assert (=> start!20292 tp!17885))

(declare-fun b!199818 () Bool)

(assert (=> b!199818 (= e!131114 (not true))))

(declare-fun lt!98542 () array!8853)

(declare-datatypes ((tuple2!3700 0))(
  ( (tuple2!3701 (_1!1861 (_ BitVec 64)) (_2!1861 V!6057)) )
))
(declare-datatypes ((List!2617 0))(
  ( (Nil!2614) (Cons!2613 (h!3255 tuple2!3700) (t!7548 List!2617)) )
))
(declare-datatypes ((ListLongMap!2613 0))(
  ( (ListLongMap!2614 (toList!1322 List!2617)) )
))
(declare-fun lt!98543 () ListLongMap!2613)

(declare-fun zeroValue!615 () V!6057)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6057)

(declare-fun getCurrentListMap!913 (array!8851 array!8853 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) Int) ListLongMap!2613)

(assert (=> b!199818 (= lt!98543 (getCurrentListMap!913 _keys!825 lt!98542 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98546 () ListLongMap!2613)

(declare-fun lt!98544 () ListLongMap!2613)

(assert (=> b!199818 (and (= lt!98546 lt!98544) (= lt!98544 lt!98546))))

(declare-fun v!520 () V!6057)

(declare-fun lt!98545 () ListLongMap!2613)

(declare-fun +!349 (ListLongMap!2613 tuple2!3700) ListLongMap!2613)

(assert (=> b!199818 (= lt!98544 (+!349 lt!98545 (tuple2!3701 k!843 v!520)))))

(declare-datatypes ((Unit!6000 0))(
  ( (Unit!6001) )
))
(declare-fun lt!98547 () Unit!6000)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!26 (array!8851 array!8853 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) (_ BitVec 64) V!6057 (_ BitVec 32) Int) Unit!6000)

(assert (=> b!199818 (= lt!98547 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!26 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!287 (array!8851 array!8853 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) Int) ListLongMap!2613)

(assert (=> b!199818 (= lt!98546 (getCurrentListMapNoExtraKeys!287 _keys!825 lt!98542 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199818 (= lt!98542 (array!8854 (store (arr!4177 _values!649) i!601 (ValueCellFull!2060 v!520)) (size!4502 _values!649)))))

(assert (=> b!199818 (= lt!98545 (getCurrentListMapNoExtraKeys!287 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199819 () Bool)

(declare-fun res!95054 () Bool)

(assert (=> b!199819 (=> (not res!95054) (not e!131114))))

(assert (=> b!199819 (= res!95054 (= (select (arr!4176 _keys!825) i!601) k!843))))

(declare-fun b!199820 () Bool)

(declare-fun e!131113 () Bool)

(assert (=> b!199820 (= e!131113 tp_is_empty!4807)))

(declare-fun b!199821 () Bool)

(declare-fun mapRes!8279 () Bool)

(assert (=> b!199821 (= e!131112 (and e!131113 mapRes!8279))))

(declare-fun condMapEmpty!8279 () Bool)

(declare-fun mapDefault!8279 () ValueCell!2060)

