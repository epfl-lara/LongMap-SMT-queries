; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37688 () Bool)

(assert start!37688)

(declare-fun b_free!8791 () Bool)

(declare-fun b_next!8791 () Bool)

(assert (=> start!37688 (= b_free!8791 (not b_next!8791))))

(declare-fun tp!31125 () Bool)

(declare-fun b_and!16033 () Bool)

(assert (=> start!37688 (= tp!31125 b_and!16033)))

(declare-fun b!386129 () Bool)

(declare-fun e!234286 () Bool)

(declare-fun tp_is_empty!9463 () Bool)

(assert (=> b!386129 (= e!234286 tp_is_empty!9463)))

(declare-fun b!386130 () Bool)

(declare-fun e!234288 () Bool)

(assert (=> b!386130 (= e!234288 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!13723 0))(
  ( (V!13724 (val!4776 Int)) )
))
(declare-datatypes ((tuple2!6420 0))(
  ( (tuple2!6421 (_1!3221 (_ BitVec 64)) (_2!3221 V!13723)) )
))
(declare-datatypes ((List!6266 0))(
  ( (Nil!6263) (Cons!6262 (h!7118 tuple2!6420) (t!11416 List!6266)) )
))
(declare-datatypes ((ListLongMap!5333 0))(
  ( (ListLongMap!5334 (toList!2682 List!6266)) )
))
(declare-fun lt!181737 () ListLongMap!5333)

(declare-datatypes ((array!22825 0))(
  ( (array!22826 (arr!10881 (Array (_ BitVec 32) (_ BitVec 64))) (size!11233 (_ BitVec 32))) )
))
(declare-fun lt!181736 () array!22825)

(declare-fun zeroValue!472 () V!13723)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13723)

(declare-datatypes ((ValueCell!4388 0))(
  ( (ValueCellFull!4388 (v!6973 V!13723)) (EmptyCell!4388) )
))
(declare-datatypes ((array!22827 0))(
  ( (array!22828 (arr!10882 (Array (_ BitVec 32) ValueCell!4388)) (size!11234 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22827)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13723)

(declare-fun getCurrentListMapNoExtraKeys!911 (array!22825 array!22827 (_ BitVec 32) (_ BitVec 32) V!13723 V!13723 (_ BitVec 32) Int) ListLongMap!5333)

(assert (=> b!386130 (= lt!181737 (getCurrentListMapNoExtraKeys!911 lt!181736 (array!22828 (store (arr!10882 _values!506) i!548 (ValueCellFull!4388 v!373)) (size!11234 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181735 () ListLongMap!5333)

(declare-fun _keys!658 () array!22825)

(assert (=> b!386130 (= lt!181735 (getCurrentListMapNoExtraKeys!911 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386131 () Bool)

(declare-fun res!220376 () Bool)

(declare-fun e!234289 () Bool)

(assert (=> b!386131 (=> (not res!220376) (not e!234289))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386131 (= res!220376 (validKeyInArray!0 k!778))))

(declare-fun b!386132 () Bool)

(declare-fun res!220370 () Bool)

(assert (=> b!386132 (=> (not res!220370) (not e!234289))))

(assert (=> b!386132 (= res!220370 (and (= (size!11234 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11233 _keys!658) (size!11234 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386133 () Bool)

(declare-fun res!220367 () Bool)

(assert (=> b!386133 (=> (not res!220367) (not e!234289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22825 (_ BitVec 32)) Bool)

(assert (=> b!386133 (= res!220367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386134 () Bool)

(declare-fun res!220374 () Bool)

(assert (=> b!386134 (=> (not res!220374) (not e!234289))))

(declare-fun arrayContainsKey!0 (array!22825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386134 (= res!220374 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386135 () Bool)

(declare-fun res!220372 () Bool)

(assert (=> b!386135 (=> (not res!220372) (not e!234289))))

(declare-datatypes ((List!6267 0))(
  ( (Nil!6264) (Cons!6263 (h!7119 (_ BitVec 64)) (t!11417 List!6267)) )
))
(declare-fun arrayNoDuplicates!0 (array!22825 (_ BitVec 32) List!6267) Bool)

(assert (=> b!386135 (= res!220372 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6264))))

(declare-fun mapNonEmpty!15759 () Bool)

(declare-fun mapRes!15759 () Bool)

(declare-fun tp!31124 () Bool)

(declare-fun e!234287 () Bool)

(assert (=> mapNonEmpty!15759 (= mapRes!15759 (and tp!31124 e!234287))))

(declare-fun mapRest!15759 () (Array (_ BitVec 32) ValueCell!4388))

(declare-fun mapKey!15759 () (_ BitVec 32))

(declare-fun mapValue!15759 () ValueCell!4388)

(assert (=> mapNonEmpty!15759 (= (arr!10882 _values!506) (store mapRest!15759 mapKey!15759 mapValue!15759))))

(declare-fun b!386136 () Bool)

(declare-fun res!220369 () Bool)

(assert (=> b!386136 (=> (not res!220369) (not e!234289))))

(assert (=> b!386136 (= res!220369 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11233 _keys!658))))))

(declare-fun mapIsEmpty!15759 () Bool)

(assert (=> mapIsEmpty!15759 mapRes!15759))

(declare-fun b!386137 () Bool)

(assert (=> b!386137 (= e!234289 e!234288)))

(declare-fun res!220368 () Bool)

(assert (=> b!386137 (=> (not res!220368) (not e!234288))))

(assert (=> b!386137 (= res!220368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181736 mask!970))))

(assert (=> b!386137 (= lt!181736 (array!22826 (store (arr!10881 _keys!658) i!548 k!778) (size!11233 _keys!658)))))

(declare-fun b!386138 () Bool)

(declare-fun res!220371 () Bool)

(assert (=> b!386138 (=> (not res!220371) (not e!234288))))

(assert (=> b!386138 (= res!220371 (arrayNoDuplicates!0 lt!181736 #b00000000000000000000000000000000 Nil!6264))))

(declare-fun b!386139 () Bool)

(assert (=> b!386139 (= e!234287 tp_is_empty!9463)))

(declare-fun b!386140 () Bool)

(declare-fun res!220375 () Bool)

(assert (=> b!386140 (=> (not res!220375) (not e!234289))))

(assert (=> b!386140 (= res!220375 (or (= (select (arr!10881 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10881 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386141 () Bool)

(declare-fun e!234290 () Bool)

(assert (=> b!386141 (= e!234290 (and e!234286 mapRes!15759))))

(declare-fun condMapEmpty!15759 () Bool)

(declare-fun mapDefault!15759 () ValueCell!4388)

