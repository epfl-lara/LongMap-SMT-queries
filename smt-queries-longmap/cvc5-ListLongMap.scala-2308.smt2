; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37310 () Bool)

(assert start!37310)

(declare-fun b_free!8437 () Bool)

(declare-fun b_next!8437 () Bool)

(assert (=> start!37310 (= b_free!8437 (not b_next!8437))))

(declare-fun tp!30027 () Bool)

(declare-fun b_and!15679 () Bool)

(assert (=> start!37310 (= tp!30027 b_and!15679)))

(declare-fun b!378278 () Bool)

(declare-fun res!214228 () Bool)

(declare-fun e!230244 () Bool)

(assert (=> b!378278 (=> (not res!214228) (not e!230244))))

(declare-datatypes ((array!22095 0))(
  ( (array!22096 (arr!10516 (Array (_ BitVec 32) (_ BitVec 64))) (size!10868 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22095)

(declare-datatypes ((List!5962 0))(
  ( (Nil!5959) (Cons!5958 (h!6814 (_ BitVec 64)) (t!11112 List!5962)) )
))
(declare-fun arrayNoDuplicates!0 (array!22095 (_ BitVec 32) List!5962) Bool)

(assert (=> b!378278 (= res!214228 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5959))))

(declare-fun b!378279 () Bool)

(declare-fun e!230246 () Bool)

(assert (=> b!378279 (= e!230244 e!230246)))

(declare-fun res!214219 () Bool)

(assert (=> b!378279 (=> (not res!214219) (not e!230246))))

(declare-fun lt!176214 () array!22095)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22095 (_ BitVec 32)) Bool)

(assert (=> b!378279 (= res!214219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176214 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378279 (= lt!176214 (array!22096 (store (arr!10516 _keys!658) i!548 k!778) (size!10868 _keys!658)))))

(declare-fun b!378280 () Bool)

(declare-fun res!214222 () Bool)

(assert (=> b!378280 (=> (not res!214222) (not e!230246))))

(assert (=> b!378280 (= res!214222 (arrayNoDuplicates!0 lt!176214 #b00000000000000000000000000000000 Nil!5959))))

(declare-fun b!378281 () Bool)

(declare-fun e!230242 () Bool)

(declare-fun tp_is_empty!9085 () Bool)

(assert (=> b!378281 (= e!230242 tp_is_empty!9085)))

(declare-fun mapNonEmpty!15192 () Bool)

(declare-fun mapRes!15192 () Bool)

(declare-fun tp!30026 () Bool)

(declare-fun e!230240 () Bool)

(assert (=> mapNonEmpty!15192 (= mapRes!15192 (and tp!30026 e!230240))))

(declare-datatypes ((V!13219 0))(
  ( (V!13220 (val!4587 Int)) )
))
(declare-datatypes ((ValueCell!4199 0))(
  ( (ValueCellFull!4199 (v!6784 V!13219)) (EmptyCell!4199) )
))
(declare-datatypes ((array!22097 0))(
  ( (array!22098 (arr!10517 (Array (_ BitVec 32) ValueCell!4199)) (size!10869 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22097)

(declare-fun mapKey!15192 () (_ BitVec 32))

(declare-fun mapValue!15192 () ValueCell!4199)

(declare-fun mapRest!15192 () (Array (_ BitVec 32) ValueCell!4199))

(assert (=> mapNonEmpty!15192 (= (arr!10517 _values!506) (store mapRest!15192 mapKey!15192 mapValue!15192))))

(declare-fun b!378282 () Bool)

(declare-fun res!214223 () Bool)

(assert (=> b!378282 (=> (not res!214223) (not e!230244))))

(declare-fun arrayContainsKey!0 (array!22095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378282 (= res!214223 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15192 () Bool)

(assert (=> mapIsEmpty!15192 mapRes!15192))

(declare-fun b!378284 () Bool)

(assert (=> b!378284 (= e!230240 tp_is_empty!9085)))

(declare-datatypes ((tuple2!6124 0))(
  ( (tuple2!6125 (_1!3073 (_ BitVec 64)) (_2!3073 V!13219)) )
))
(declare-datatypes ((List!5963 0))(
  ( (Nil!5960) (Cons!5959 (h!6815 tuple2!6124) (t!11113 List!5963)) )
))
(declare-datatypes ((ListLongMap!5037 0))(
  ( (ListLongMap!5038 (toList!2534 List!5963)) )
))
(declare-fun lt!176217 () ListLongMap!5037)

(declare-fun e!230241 () Bool)

(declare-fun lt!176212 () ListLongMap!5037)

(declare-fun b!378285 () Bool)

(declare-fun lt!176213 () tuple2!6124)

(declare-fun +!880 (ListLongMap!5037 tuple2!6124) ListLongMap!5037)

(assert (=> b!378285 (= e!230241 (= lt!176212 (+!880 lt!176217 lt!176213)))))

(declare-fun b!378286 () Bool)

(declare-fun res!214226 () Bool)

(assert (=> b!378286 (=> (not res!214226) (not e!230244))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378286 (= res!214226 (and (= (size!10869 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10868 _keys!658) (size!10869 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378287 () Bool)

(declare-fun res!214224 () Bool)

(assert (=> b!378287 (=> (not res!214224) (not e!230244))))

(assert (=> b!378287 (= res!214224 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10868 _keys!658))))))

(declare-fun b!378288 () Bool)

(declare-fun res!214220 () Bool)

(assert (=> b!378288 (=> (not res!214220) (not e!230244))))

(assert (=> b!378288 (= res!214220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378289 () Bool)

(declare-fun e!230239 () Bool)

(assert (=> b!378289 (= e!230246 (not e!230239))))

(declare-fun res!214221 () Bool)

(assert (=> b!378289 (=> res!214221 e!230239)))

(assert (=> b!378289 (= res!214221 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13219)

(declare-fun minValue!472 () V!13219)

(declare-fun getCurrentListMap!1960 (array!22095 array!22097 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) Int) ListLongMap!5037)

(assert (=> b!378289 (= lt!176212 (getCurrentListMap!1960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176220 () array!22097)

(declare-fun lt!176216 () ListLongMap!5037)

(assert (=> b!378289 (= lt!176216 (getCurrentListMap!1960 lt!176214 lt!176220 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176215 () ListLongMap!5037)

(declare-fun lt!176219 () ListLongMap!5037)

(assert (=> b!378289 (and (= lt!176215 lt!176219) (= lt!176219 lt!176215))))

(declare-fun v!373 () V!13219)

(assert (=> b!378289 (= lt!176219 (+!880 lt!176217 (tuple2!6125 k!778 v!373)))))

(declare-datatypes ((Unit!11660 0))(
  ( (Unit!11661) )
))
(declare-fun lt!176218 () Unit!11660)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!118 (array!22095 array!22097 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) (_ BitVec 64) V!13219 (_ BitVec 32) Int) Unit!11660)

(assert (=> b!378289 (= lt!176218 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!118 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!794 (array!22095 array!22097 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) Int) ListLongMap!5037)

(assert (=> b!378289 (= lt!176215 (getCurrentListMapNoExtraKeys!794 lt!176214 lt!176220 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378289 (= lt!176220 (array!22098 (store (arr!10517 _values!506) i!548 (ValueCellFull!4199 v!373)) (size!10869 _values!506)))))

(assert (=> b!378289 (= lt!176217 (getCurrentListMapNoExtraKeys!794 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378290 () Bool)

(declare-fun res!214218 () Bool)

(assert (=> b!378290 (=> (not res!214218) (not e!230244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378290 (= res!214218 (validKeyInArray!0 k!778))))

(declare-fun b!378291 () Bool)

(assert (=> b!378291 (= e!230239 true)))

(assert (=> b!378291 e!230241))

(declare-fun res!214229 () Bool)

(assert (=> b!378291 (=> (not res!214229) (not e!230241))))

(assert (=> b!378291 (= res!214229 (= lt!176216 (+!880 lt!176215 lt!176213)))))

(assert (=> b!378291 (= lt!176213 (tuple2!6125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378292 () Bool)

(declare-fun e!230245 () Bool)

(assert (=> b!378292 (= e!230245 (and e!230242 mapRes!15192))))

(declare-fun condMapEmpty!15192 () Bool)

(declare-fun mapDefault!15192 () ValueCell!4199)

