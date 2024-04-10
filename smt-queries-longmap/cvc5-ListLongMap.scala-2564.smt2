; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39202 () Bool)

(assert start!39202)

(declare-fun b_free!9469 () Bool)

(declare-fun b_next!9469 () Bool)

(assert (=> start!39202 (= b_free!9469 (not b_next!9469))))

(declare-fun tp!33936 () Bool)

(declare-fun b_and!16855 () Bool)

(assert (=> start!39202 (= tp!33936 b_and!16855)))

(declare-fun b!413217 () Bool)

(declare-fun e!247135 () Bool)

(declare-fun e!247137 () Bool)

(assert (=> b!413217 (= e!247135 e!247137)))

(declare-fun res!240094 () Bool)

(assert (=> b!413217 (=> (not res!240094) (not e!247137))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413217 (= res!240094 (= from!863 i!563))))

(declare-datatypes ((V!15267 0))(
  ( (V!15268 (val!5355 Int)) )
))
(declare-fun minValue!515 () V!15267)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25099 0))(
  ( (array!25100 (arr!11999 (Array (_ BitVec 32) (_ BitVec 64))) (size!12351 (_ BitVec 32))) )
))
(declare-fun lt!189667 () array!25099)

(declare-datatypes ((ValueCell!4967 0))(
  ( (ValueCellFull!4967 (v!7602 V!15267)) (EmptyCell!4967) )
))
(declare-datatypes ((array!25101 0))(
  ( (array!25102 (arr!12000 (Array (_ BitVec 32) ValueCell!4967)) (size!12352 (_ BitVec 32))) )
))
(declare-fun lt!189666 () array!25101)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15267)

(declare-datatypes ((tuple2!6954 0))(
  ( (tuple2!6955 (_1!3488 (_ BitVec 64)) (_2!3488 V!15267)) )
))
(declare-datatypes ((List!6979 0))(
  ( (Nil!6976) (Cons!6975 (h!7831 tuple2!6954) (t!12153 List!6979)) )
))
(declare-datatypes ((ListLongMap!5867 0))(
  ( (ListLongMap!5868 (toList!2949 List!6979)) )
))
(declare-fun lt!189664 () ListLongMap!5867)

(declare-fun getCurrentListMapNoExtraKeys!1157 (array!25099 array!25101 (_ BitVec 32) (_ BitVec 32) V!15267 V!15267 (_ BitVec 32) Int) ListLongMap!5867)

(assert (=> b!413217 (= lt!189664 (getCurrentListMapNoExtraKeys!1157 lt!189667 lt!189666 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25101)

(declare-fun v!412 () V!15267)

(assert (=> b!413217 (= lt!189666 (array!25102 (store (arr!12000 _values!549) i!563 (ValueCellFull!4967 v!412)) (size!12352 _values!549)))))

(declare-fun _keys!709 () array!25099)

(declare-fun lt!189668 () ListLongMap!5867)

(assert (=> b!413217 (= lt!189668 (getCurrentListMapNoExtraKeys!1157 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413218 () Bool)

(declare-fun res!240089 () Bool)

(declare-fun e!247136 () Bool)

(assert (=> b!413218 (=> (not res!240089) (not e!247136))))

(assert (=> b!413218 (= res!240089 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12351 _keys!709))))))

(declare-fun b!413219 () Bool)

(declare-fun res!240095 () Bool)

(assert (=> b!413219 (=> (not res!240095) (not e!247136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25099 (_ BitVec 32)) Bool)

(assert (=> b!413219 (= res!240095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413220 () Bool)

(declare-fun e!247139 () Bool)

(declare-fun tp_is_empty!10621 () Bool)

(assert (=> b!413220 (= e!247139 tp_is_empty!10621)))

(declare-fun b!413221 () Bool)

(declare-fun res!240093 () Bool)

(assert (=> b!413221 (=> (not res!240093) (not e!247136))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413221 (= res!240093 (validKeyInArray!0 k!794))))

(declare-fun b!413222 () Bool)

(declare-fun e!247134 () Bool)

(declare-fun call!28586 () ListLongMap!5867)

(declare-fun call!28585 () ListLongMap!5867)

(assert (=> b!413222 (= e!247134 (= call!28586 call!28585))))

(declare-fun mapIsEmpty!17553 () Bool)

(declare-fun mapRes!17553 () Bool)

(assert (=> mapIsEmpty!17553 mapRes!17553))

(declare-fun b!413223 () Bool)

(declare-fun +!1161 (ListLongMap!5867 tuple2!6954) ListLongMap!5867)

(assert (=> b!413223 (= e!247134 (= call!28585 (+!1161 call!28586 (tuple2!6955 k!794 v!412))))))

(declare-fun b!413224 () Bool)

(assert (=> b!413224 (= e!247137 (not true))))

(assert (=> b!413224 e!247134))

(declare-fun c!54917 () Bool)

(assert (=> b!413224 (= c!54917 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12228 0))(
  ( (Unit!12229) )
))
(declare-fun lt!189665 () Unit!12228)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!372 (array!25099 array!25101 (_ BitVec 32) (_ BitVec 32) V!15267 V!15267 (_ BitVec 32) (_ BitVec 64) V!15267 (_ BitVec 32) Int) Unit!12228)

(assert (=> b!413224 (= lt!189665 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!372 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413225 () Bool)

(declare-fun res!240088 () Bool)

(assert (=> b!413225 (=> (not res!240088) (not e!247136))))

(declare-datatypes ((List!6980 0))(
  ( (Nil!6977) (Cons!6976 (h!7832 (_ BitVec 64)) (t!12154 List!6980)) )
))
(declare-fun arrayNoDuplicates!0 (array!25099 (_ BitVec 32) List!6980) Bool)

(assert (=> b!413225 (= res!240088 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6977))))

(declare-fun b!413226 () Bool)

(declare-fun res!240096 () Bool)

(assert (=> b!413226 (=> (not res!240096) (not e!247135))))

(assert (=> b!413226 (= res!240096 (arrayNoDuplicates!0 lt!189667 #b00000000000000000000000000000000 Nil!6977))))

(declare-fun b!413227 () Bool)

(declare-fun res!240092 () Bool)

(assert (=> b!413227 (=> (not res!240092) (not e!247136))))

(assert (=> b!413227 (= res!240092 (or (= (select (arr!11999 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11999 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413228 () Bool)

(assert (=> b!413228 (= e!247136 e!247135)))

(declare-fun res!240085 () Bool)

(assert (=> b!413228 (=> (not res!240085) (not e!247135))))

(assert (=> b!413228 (= res!240085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189667 mask!1025))))

(assert (=> b!413228 (= lt!189667 (array!25100 (store (arr!11999 _keys!709) i!563 k!794) (size!12351 _keys!709)))))

(declare-fun b!413229 () Bool)

(declare-fun res!240090 () Bool)

(assert (=> b!413229 (=> (not res!240090) (not e!247136))))

(declare-fun arrayContainsKey!0 (array!25099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413229 (= res!240090 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413230 () Bool)

(declare-fun e!247140 () Bool)

(assert (=> b!413230 (= e!247140 tp_is_empty!10621)))

(declare-fun b!413231 () Bool)

(declare-fun res!240091 () Bool)

(assert (=> b!413231 (=> (not res!240091) (not e!247136))))

(assert (=> b!413231 (= res!240091 (and (= (size!12352 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12351 _keys!709) (size!12352 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17553 () Bool)

(declare-fun tp!33935 () Bool)

(assert (=> mapNonEmpty!17553 (= mapRes!17553 (and tp!33935 e!247140))))

(declare-fun mapValue!17553 () ValueCell!4967)

(declare-fun mapKey!17553 () (_ BitVec 32))

(declare-fun mapRest!17553 () (Array (_ BitVec 32) ValueCell!4967))

(assert (=> mapNonEmpty!17553 (= (arr!12000 _values!549) (store mapRest!17553 mapKey!17553 mapValue!17553))))

(declare-fun b!413232 () Bool)

(declare-fun res!240084 () Bool)

(assert (=> b!413232 (=> (not res!240084) (not e!247135))))

(assert (=> b!413232 (= res!240084 (bvsle from!863 i!563))))

(declare-fun b!413233 () Bool)

(declare-fun e!247133 () Bool)

(assert (=> b!413233 (= e!247133 (and e!247139 mapRes!17553))))

(declare-fun condMapEmpty!17553 () Bool)

(declare-fun mapDefault!17553 () ValueCell!4967)

