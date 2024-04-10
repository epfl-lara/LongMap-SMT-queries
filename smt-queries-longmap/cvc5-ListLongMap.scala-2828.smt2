; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40932 () Bool)

(assert start!40932)

(declare-fun b_free!10867 () Bool)

(declare-fun b_next!10867 () Bool)

(assert (=> start!40932 (= b_free!10867 (not b_next!10867))))

(declare-fun tp!38428 () Bool)

(declare-fun b_and!19009 () Bool)

(assert (=> start!40932 (= tp!38428 b_and!19009)))

(declare-fun b!455132 () Bool)

(declare-fun res!271320 () Bool)

(declare-fun e!266160 () Bool)

(assert (=> b!455132 (=> (not res!271320) (not e!266160))))

(declare-datatypes ((array!28213 0))(
  ( (array!28214 (arr!13550 (Array (_ BitVec 32) (_ BitVec 64))) (size!13902 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28213)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17379 0))(
  ( (V!17380 (val!6147 Int)) )
))
(declare-datatypes ((ValueCell!5759 0))(
  ( (ValueCellFull!5759 (v!8413 V!17379)) (EmptyCell!5759) )
))
(declare-datatypes ((array!28215 0))(
  ( (array!28216 (arr!13551 (Array (_ BitVec 32) ValueCell!5759)) (size!13903 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28215)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!455132 (= res!271320 (and (= (size!13903 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13902 _keys!709) (size!13903 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455133 () Bool)

(declare-fun res!271322 () Bool)

(declare-fun e!266156 () Bool)

(assert (=> b!455133 (=> (not res!271322) (not e!266156))))

(declare-fun lt!206275 () array!28213)

(declare-datatypes ((List!8163 0))(
  ( (Nil!8160) (Cons!8159 (h!9015 (_ BitVec 64)) (t!13991 List!8163)) )
))
(declare-fun arrayNoDuplicates!0 (array!28213 (_ BitVec 32) List!8163) Bool)

(assert (=> b!455133 (= res!271322 (arrayNoDuplicates!0 lt!206275 #b00000000000000000000000000000000 Nil!8160))))

(declare-fun b!455134 () Bool)

(declare-fun res!271323 () Bool)

(assert (=> b!455134 (=> (not res!271323) (not e!266160))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455134 (= res!271323 (or (= (select (arr!13550 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13550 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455135 () Bool)

(declare-fun res!271328 () Bool)

(assert (=> b!455135 (=> (not res!271328) (not e!266160))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455135 (= res!271328 (validKeyInArray!0 k!794))))

(declare-fun b!455136 () Bool)

(declare-fun res!271331 () Bool)

(assert (=> b!455136 (=> (not res!271331) (not e!266156))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!455136 (= res!271331 (bvsle from!863 i!563))))

(declare-fun b!455137 () Bool)

(declare-fun e!266159 () Bool)

(declare-fun tp_is_empty!12205 () Bool)

(assert (=> b!455137 (= e!266159 tp_is_empty!12205)))

(declare-fun mapIsEmpty!19948 () Bool)

(declare-fun mapRes!19948 () Bool)

(assert (=> mapIsEmpty!19948 mapRes!19948))

(declare-fun mapNonEmpty!19948 () Bool)

(declare-fun tp!38427 () Bool)

(declare-fun e!266157 () Bool)

(assert (=> mapNonEmpty!19948 (= mapRes!19948 (and tp!38427 e!266157))))

(declare-fun mapRest!19948 () (Array (_ BitVec 32) ValueCell!5759))

(declare-fun mapValue!19948 () ValueCell!5759)

(declare-fun mapKey!19948 () (_ BitVec 32))

(assert (=> mapNonEmpty!19948 (= (arr!13551 _values!549) (store mapRest!19948 mapKey!19948 mapValue!19948))))

(declare-fun b!455138 () Bool)

(assert (=> b!455138 (= e!266160 e!266156)))

(declare-fun res!271321 () Bool)

(assert (=> b!455138 (=> (not res!271321) (not e!266156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28213 (_ BitVec 32)) Bool)

(assert (=> b!455138 (= res!271321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206275 mask!1025))))

(assert (=> b!455138 (= lt!206275 (array!28214 (store (arr!13550 _keys!709) i!563 k!794) (size!13902 _keys!709)))))

(declare-fun b!455139 () Bool)

(declare-fun res!271326 () Bool)

(assert (=> b!455139 (=> (not res!271326) (not e!266160))))

(declare-fun arrayContainsKey!0 (array!28213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455139 (= res!271326 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!455140 () Bool)

(declare-fun res!271325 () Bool)

(assert (=> b!455140 (=> (not res!271325) (not e!266160))))

(assert (=> b!455140 (= res!271325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455141 () Bool)

(declare-fun res!271330 () Bool)

(assert (=> b!455141 (=> (not res!271330) (not e!266160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455141 (= res!271330 (validMask!0 mask!1025))))

(declare-fun res!271327 () Bool)

(assert (=> start!40932 (=> (not res!271327) (not e!266160))))

(assert (=> start!40932 (= res!271327 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13902 _keys!709))))))

(assert (=> start!40932 e!266160))

(assert (=> start!40932 tp_is_empty!12205))

(assert (=> start!40932 tp!38428))

(assert (=> start!40932 true))

(declare-fun e!266161 () Bool)

(declare-fun array_inv!9816 (array!28215) Bool)

(assert (=> start!40932 (and (array_inv!9816 _values!549) e!266161)))

(declare-fun array_inv!9817 (array!28213) Bool)

(assert (=> start!40932 (array_inv!9817 _keys!709)))

(declare-fun b!455142 () Bool)

(declare-fun res!271324 () Bool)

(assert (=> b!455142 (=> (not res!271324) (not e!266160))))

(assert (=> b!455142 (= res!271324 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13902 _keys!709))))))

(declare-fun b!455143 () Bool)

(assert (=> b!455143 (= e!266156 false)))

(declare-fun minValue!515 () V!17379)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17379)

(declare-datatypes ((tuple2!8100 0))(
  ( (tuple2!8101 (_1!4061 (_ BitVec 64)) (_2!4061 V!17379)) )
))
(declare-datatypes ((List!8164 0))(
  ( (Nil!8161) (Cons!8160 (h!9016 tuple2!8100) (t!13992 List!8164)) )
))
(declare-datatypes ((ListLongMap!7013 0))(
  ( (ListLongMap!7014 (toList!3522 List!8164)) )
))
(declare-fun lt!206276 () ListLongMap!7013)

(declare-fun v!412 () V!17379)

(declare-fun getCurrentListMapNoExtraKeys!1705 (array!28213 array!28215 (_ BitVec 32) (_ BitVec 32) V!17379 V!17379 (_ BitVec 32) Int) ListLongMap!7013)

(assert (=> b!455143 (= lt!206276 (getCurrentListMapNoExtraKeys!1705 lt!206275 (array!28216 (store (arr!13551 _values!549) i!563 (ValueCellFull!5759 v!412)) (size!13903 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206274 () ListLongMap!7013)

(assert (=> b!455143 (= lt!206274 (getCurrentListMapNoExtraKeys!1705 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455144 () Bool)

(assert (=> b!455144 (= e!266161 (and e!266159 mapRes!19948))))

(declare-fun condMapEmpty!19948 () Bool)

(declare-fun mapDefault!19948 () ValueCell!5759)

