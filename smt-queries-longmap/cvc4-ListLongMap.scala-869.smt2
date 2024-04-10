; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20314 () Bool)

(assert start!20314)

(declare-fun b_free!4973 () Bool)

(declare-fun b_next!4973 () Bool)

(assert (=> start!20314 (= b_free!4973 (not b_next!4973))))

(declare-fun tp!17951 () Bool)

(declare-fun b_and!11719 () Bool)

(assert (=> start!20314 (= tp!17951 b_and!11719)))

(declare-fun b!200144 () Bool)

(declare-fun res!95286 () Bool)

(declare-fun e!131279 () Bool)

(assert (=> b!200144 (=> (not res!95286) (not e!131279))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200144 (= res!95286 (validKeyInArray!0 k!843))))

(declare-fun b!200145 () Bool)

(declare-fun res!95287 () Bool)

(assert (=> b!200145 (=> (not res!95287) (not e!131279))))

(declare-datatypes ((array!8893 0))(
  ( (array!8894 (arr!4197 (Array (_ BitVec 32) (_ BitVec 64))) (size!4522 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8893)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200145 (= res!95287 (= (select (arr!4197 _keys!825) i!601) k!843))))

(declare-fun res!95282 () Bool)

(assert (=> start!20314 (=> (not res!95282) (not e!131279))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20314 (= res!95282 (validMask!0 mask!1149))))

(assert (=> start!20314 e!131279))

(declare-datatypes ((V!6085 0))(
  ( (V!6086 (val!2459 Int)) )
))
(declare-datatypes ((ValueCell!2071 0))(
  ( (ValueCellFull!2071 (v!4429 V!6085)) (EmptyCell!2071) )
))
(declare-datatypes ((array!8895 0))(
  ( (array!8896 (arr!4198 (Array (_ BitVec 32) ValueCell!2071)) (size!4523 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8895)

(declare-fun e!131277 () Bool)

(declare-fun array_inv!2763 (array!8895) Bool)

(assert (=> start!20314 (and (array_inv!2763 _values!649) e!131277)))

(assert (=> start!20314 true))

(declare-fun tp_is_empty!4829 () Bool)

(assert (=> start!20314 tp_is_empty!4829))

(declare-fun array_inv!2764 (array!8893) Bool)

(assert (=> start!20314 (array_inv!2764 _keys!825)))

(assert (=> start!20314 tp!17951))

(declare-fun b!200146 () Bool)

(assert (=> b!200146 (= e!131279 (not (bvsle #b00000000000000000000000000000000 (size!4522 _keys!825))))))

(declare-datatypes ((tuple2!3716 0))(
  ( (tuple2!3717 (_1!1869 (_ BitVec 64)) (_2!1869 V!6085)) )
))
(declare-datatypes ((List!2633 0))(
  ( (Nil!2630) (Cons!2629 (h!3271 tuple2!3716) (t!7564 List!2633)) )
))
(declare-datatypes ((ListLongMap!2629 0))(
  ( (ListLongMap!2630 (toList!1330 List!2633)) )
))
(declare-fun lt!98743 () ListLongMap!2629)

(declare-fun lt!98745 () array!8895)

(declare-fun zeroValue!615 () V!6085)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6085)

(declare-fun getCurrentListMap!921 (array!8893 array!8895 (_ BitVec 32) (_ BitVec 32) V!6085 V!6085 (_ BitVec 32) Int) ListLongMap!2629)

(assert (=> b!200146 (= lt!98743 (getCurrentListMap!921 _keys!825 lt!98745 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98742 () ListLongMap!2629)

(declare-fun lt!98744 () ListLongMap!2629)

(assert (=> b!200146 (and (= lt!98742 lt!98744) (= lt!98744 lt!98742))))

(declare-fun v!520 () V!6085)

(declare-fun lt!98741 () ListLongMap!2629)

(declare-fun +!357 (ListLongMap!2629 tuple2!3716) ListLongMap!2629)

(assert (=> b!200146 (= lt!98744 (+!357 lt!98741 (tuple2!3717 k!843 v!520)))))

(declare-datatypes ((Unit!6016 0))(
  ( (Unit!6017) )
))
(declare-fun lt!98740 () Unit!6016)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!34 (array!8893 array!8895 (_ BitVec 32) (_ BitVec 32) V!6085 V!6085 (_ BitVec 32) (_ BitVec 64) V!6085 (_ BitVec 32) Int) Unit!6016)

(assert (=> b!200146 (= lt!98740 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!34 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!295 (array!8893 array!8895 (_ BitVec 32) (_ BitVec 32) V!6085 V!6085 (_ BitVec 32) Int) ListLongMap!2629)

(assert (=> b!200146 (= lt!98742 (getCurrentListMapNoExtraKeys!295 _keys!825 lt!98745 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200146 (= lt!98745 (array!8896 (store (arr!4198 _values!649) i!601 (ValueCellFull!2071 v!520)) (size!4523 _values!649)))))

(assert (=> b!200146 (= lt!98741 (getCurrentListMapNoExtraKeys!295 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200147 () Bool)

(declare-fun res!95285 () Bool)

(assert (=> b!200147 (=> (not res!95285) (not e!131279))))

(assert (=> b!200147 (= res!95285 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4522 _keys!825))))))

(declare-fun mapIsEmpty!8312 () Bool)

(declare-fun mapRes!8312 () Bool)

(assert (=> mapIsEmpty!8312 mapRes!8312))

(declare-fun b!200148 () Bool)

(declare-fun e!131276 () Bool)

(assert (=> b!200148 (= e!131277 (and e!131276 mapRes!8312))))

(declare-fun condMapEmpty!8312 () Bool)

(declare-fun mapDefault!8312 () ValueCell!2071)

