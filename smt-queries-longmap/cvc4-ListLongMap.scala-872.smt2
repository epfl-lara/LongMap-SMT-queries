; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20332 () Bool)

(assert start!20332)

(declare-fun b_free!4991 () Bool)

(declare-fun b_next!4991 () Bool)

(assert (=> start!20332 (= b_free!4991 (not b_next!4991))))

(declare-fun tp!18004 () Bool)

(declare-fun b_and!11737 () Bool)

(assert (=> start!20332 (= tp!18004 b_and!11737)))

(declare-fun mapIsEmpty!8339 () Bool)

(declare-fun mapRes!8339 () Bool)

(assert (=> mapIsEmpty!8339 mapRes!8339))

(declare-fun b!200466 () Bool)

(declare-fun e!131456 () Bool)

(declare-fun tp_is_empty!4847 () Bool)

(assert (=> b!200466 (= e!131456 tp_is_empty!4847)))

(declare-fun b!200467 () Bool)

(declare-fun e!131454 () Bool)

(declare-fun e!131455 () Bool)

(assert (=> b!200467 (= e!131454 (not e!131455))))

(declare-fun res!95528 () Bool)

(assert (=> b!200467 (=> res!95528 e!131455)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200467 (= res!95528 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6109 0))(
  ( (V!6110 (val!2468 Int)) )
))
(declare-datatypes ((ValueCell!2080 0))(
  ( (ValueCellFull!2080 (v!4438 V!6109)) (EmptyCell!2080) )
))
(declare-datatypes ((array!8925 0))(
  ( (array!8926 (arr!4213 (Array (_ BitVec 32) ValueCell!2080)) (size!4538 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8925)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6109)

(declare-datatypes ((tuple2!3730 0))(
  ( (tuple2!3731 (_1!1876 (_ BitVec 64)) (_2!1876 V!6109)) )
))
(declare-datatypes ((List!2646 0))(
  ( (Nil!2643) (Cons!2642 (h!3284 tuple2!3730) (t!7577 List!2646)) )
))
(declare-datatypes ((ListLongMap!2643 0))(
  ( (ListLongMap!2644 (toList!1337 List!2646)) )
))
(declare-fun lt!99087 () ListLongMap!2643)

(declare-datatypes ((array!8927 0))(
  ( (array!8928 (arr!4214 (Array (_ BitVec 32) (_ BitVec 64))) (size!4539 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8927)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6109)

(declare-fun getCurrentListMap!927 (array!8927 array!8925 (_ BitVec 32) (_ BitVec 32) V!6109 V!6109 (_ BitVec 32) Int) ListLongMap!2643)

(assert (=> b!200467 (= lt!99087 (getCurrentListMap!927 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99081 () array!8925)

(declare-fun lt!99084 () ListLongMap!2643)

(assert (=> b!200467 (= lt!99084 (getCurrentListMap!927 _keys!825 lt!99081 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99075 () ListLongMap!2643)

(declare-fun lt!99073 () ListLongMap!2643)

(assert (=> b!200467 (and (= lt!99075 lt!99073) (= lt!99073 lt!99075))))

(declare-fun lt!99076 () ListLongMap!2643)

(declare-fun lt!99078 () tuple2!3730)

(declare-fun +!364 (ListLongMap!2643 tuple2!3730) ListLongMap!2643)

(assert (=> b!200467 (= lt!99073 (+!364 lt!99076 lt!99078))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6109)

(assert (=> b!200467 (= lt!99078 (tuple2!3731 k!843 v!520))))

(declare-datatypes ((Unit!6028 0))(
  ( (Unit!6029) )
))
(declare-fun lt!99077 () Unit!6028)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!40 (array!8927 array!8925 (_ BitVec 32) (_ BitVec 32) V!6109 V!6109 (_ BitVec 32) (_ BitVec 64) V!6109 (_ BitVec 32) Int) Unit!6028)

(assert (=> b!200467 (= lt!99077 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!40 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!301 (array!8927 array!8925 (_ BitVec 32) (_ BitVec 32) V!6109 V!6109 (_ BitVec 32) Int) ListLongMap!2643)

(assert (=> b!200467 (= lt!99075 (getCurrentListMapNoExtraKeys!301 _keys!825 lt!99081 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200467 (= lt!99081 (array!8926 (store (arr!4213 _values!649) i!601 (ValueCellFull!2080 v!520)) (size!4538 _values!649)))))

(assert (=> b!200467 (= lt!99076 (getCurrentListMapNoExtraKeys!301 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200468 () Bool)

(declare-fun res!95527 () Bool)

(assert (=> b!200468 (=> (not res!95527) (not e!131454))))

(assert (=> b!200468 (= res!95527 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4539 _keys!825))))))

(declare-fun b!200470 () Bool)

(declare-fun res!95522 () Bool)

(assert (=> b!200470 (=> (not res!95522) (not e!131454))))

(assert (=> b!200470 (= res!95522 (= (select (arr!4214 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8339 () Bool)

(declare-fun tp!18005 () Bool)

(declare-fun e!131453 () Bool)

(assert (=> mapNonEmpty!8339 (= mapRes!8339 (and tp!18005 e!131453))))

(declare-fun mapRest!8339 () (Array (_ BitVec 32) ValueCell!2080))

(declare-fun mapKey!8339 () (_ BitVec 32))

(declare-fun mapValue!8339 () ValueCell!2080)

(assert (=> mapNonEmpty!8339 (= (arr!4213 _values!649) (store mapRest!8339 mapKey!8339 mapValue!8339))))

(declare-fun b!200471 () Bool)

(declare-fun res!95530 () Bool)

(assert (=> b!200471 (=> (not res!95530) (not e!131454))))

(declare-datatypes ((List!2647 0))(
  ( (Nil!2644) (Cons!2643 (h!3285 (_ BitVec 64)) (t!7578 List!2647)) )
))
(declare-fun arrayNoDuplicates!0 (array!8927 (_ BitVec 32) List!2647) Bool)

(assert (=> b!200471 (= res!95530 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2644))))

(declare-fun b!200472 () Bool)

(declare-fun e!131459 () Bool)

(assert (=> b!200472 (= e!131459 (and e!131456 mapRes!8339))))

(declare-fun condMapEmpty!8339 () Bool)

(declare-fun mapDefault!8339 () ValueCell!2080)

