; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40930 () Bool)

(assert start!40930)

(declare-fun b_free!10865 () Bool)

(declare-fun b_next!10865 () Bool)

(assert (=> start!40930 (= b_free!10865 (not b_next!10865))))

(declare-fun tp!38421 () Bool)

(declare-fun b_and!19007 () Bool)

(assert (=> start!40930 (= tp!38421 b_and!19007)))

(declare-fun b!455087 () Bool)

(declare-fun res!271291 () Bool)

(declare-fun e!266139 () Bool)

(assert (=> b!455087 (=> (not res!271291) (not e!266139))))

(declare-datatypes ((array!28209 0))(
  ( (array!28210 (arr!13548 (Array (_ BitVec 32) (_ BitVec 64))) (size!13900 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28209)

(declare-datatypes ((List!8161 0))(
  ( (Nil!8158) (Cons!8157 (h!9013 (_ BitVec 64)) (t!13989 List!8161)) )
))
(declare-fun arrayNoDuplicates!0 (array!28209 (_ BitVec 32) List!8161) Bool)

(assert (=> b!455087 (= res!271291 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8158))))

(declare-fun b!455088 () Bool)

(declare-fun res!271286 () Bool)

(assert (=> b!455088 (=> (not res!271286) (not e!266139))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28209 (_ BitVec 32)) Bool)

(assert (=> b!455088 (= res!271286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455089 () Bool)

(declare-fun res!271284 () Bool)

(assert (=> b!455089 (=> (not res!271284) (not e!266139))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455089 (= res!271284 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19945 () Bool)

(declare-fun mapRes!19945 () Bool)

(declare-fun tp!38422 () Bool)

(declare-fun e!266143 () Bool)

(assert (=> mapNonEmpty!19945 (= mapRes!19945 (and tp!38422 e!266143))))

(declare-datatypes ((V!17375 0))(
  ( (V!17376 (val!6146 Int)) )
))
(declare-datatypes ((ValueCell!5758 0))(
  ( (ValueCellFull!5758 (v!8412 V!17375)) (EmptyCell!5758) )
))
(declare-datatypes ((array!28211 0))(
  ( (array!28212 (arr!13549 (Array (_ BitVec 32) ValueCell!5758)) (size!13901 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28211)

(declare-fun mapRest!19945 () (Array (_ BitVec 32) ValueCell!5758))

(declare-fun mapKey!19945 () (_ BitVec 32))

(declare-fun mapValue!19945 () ValueCell!5758)

(assert (=> mapNonEmpty!19945 (= (arr!13549 _values!549) (store mapRest!19945 mapKey!19945 mapValue!19945))))

(declare-fun b!455090 () Bool)

(declare-fun res!271294 () Bool)

(assert (=> b!455090 (=> (not res!271294) (not e!266139))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455090 (= res!271294 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13900 _keys!709))))))

(declare-fun b!455091 () Bool)

(declare-fun e!266140 () Bool)

(assert (=> b!455091 (= e!266140 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!8098 0))(
  ( (tuple2!8099 (_1!4060 (_ BitVec 64)) (_2!4060 V!17375)) )
))
(declare-datatypes ((List!8162 0))(
  ( (Nil!8159) (Cons!8158 (h!9014 tuple2!8098) (t!13990 List!8162)) )
))
(declare-datatypes ((ListLongMap!7011 0))(
  ( (ListLongMap!7012 (toList!3521 List!8162)) )
))
(declare-fun lt!206265 () ListLongMap!7011)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17375)

(declare-fun v!412 () V!17375)

(declare-fun minValue!515 () V!17375)

(declare-fun lt!206267 () array!28209)

(declare-fun getCurrentListMapNoExtraKeys!1704 (array!28209 array!28211 (_ BitVec 32) (_ BitVec 32) V!17375 V!17375 (_ BitVec 32) Int) ListLongMap!7011)

(assert (=> b!455091 (= lt!206265 (getCurrentListMapNoExtraKeys!1704 lt!206267 (array!28212 (store (arr!13549 _values!549) i!563 (ValueCellFull!5758 v!412)) (size!13901 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206266 () ListLongMap!7011)

(assert (=> b!455091 (= lt!206266 (getCurrentListMapNoExtraKeys!1704 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455093 () Bool)

(assert (=> b!455093 (= e!266139 e!266140)))

(declare-fun res!271289 () Bool)

(assert (=> b!455093 (=> (not res!271289) (not e!266140))))

(assert (=> b!455093 (= res!271289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206267 mask!1025))))

(assert (=> b!455093 (= lt!206267 (array!28210 (store (arr!13548 _keys!709) i!563 k!794) (size!13900 _keys!709)))))

(declare-fun b!455094 () Bool)

(declare-fun res!271290 () Bool)

(assert (=> b!455094 (=> (not res!271290) (not e!266140))))

(assert (=> b!455094 (= res!271290 (bvsle from!863 i!563))))

(declare-fun b!455095 () Bool)

(declare-fun res!271287 () Bool)

(assert (=> b!455095 (=> (not res!271287) (not e!266140))))

(assert (=> b!455095 (= res!271287 (arrayNoDuplicates!0 lt!206267 #b00000000000000000000000000000000 Nil!8158))))

(declare-fun b!455096 () Bool)

(declare-fun e!266138 () Bool)

(declare-fun e!266141 () Bool)

(assert (=> b!455096 (= e!266138 (and e!266141 mapRes!19945))))

(declare-fun condMapEmpty!19945 () Bool)

(declare-fun mapDefault!19945 () ValueCell!5758)

