; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37730 () Bool)

(assert start!37730)

(declare-fun b_free!8833 () Bool)

(declare-fun b_next!8833 () Bool)

(assert (=> start!37730 (= b_free!8833 (not b_next!8833))))

(declare-fun tp!31250 () Bool)

(declare-fun b_and!16075 () Bool)

(assert (=> start!37730 (= tp!31250 b_and!16075)))

(declare-fun b!386948 () Bool)

(declare-fun e!234668 () Bool)

(declare-fun e!234667 () Bool)

(assert (=> b!386948 (= e!234668 e!234667)))

(declare-fun res!221004 () Bool)

(assert (=> b!386948 (=> (not res!221004) (not e!234667))))

(declare-datatypes ((array!22903 0))(
  ( (array!22904 (arr!10920 (Array (_ BitVec 32) (_ BitVec 64))) (size!11272 (_ BitVec 32))) )
))
(declare-fun lt!181924 () array!22903)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22903 (_ BitVec 32)) Bool)

(assert (=> b!386948 (= res!221004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181924 mask!970))))

(declare-fun _keys!658 () array!22903)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!386948 (= lt!181924 (array!22904 (store (arr!10920 _keys!658) i!548 k!778) (size!11272 _keys!658)))))

(declare-fun b!386949 () Bool)

(declare-fun res!220999 () Bool)

(assert (=> b!386949 (=> (not res!220999) (not e!234667))))

(declare-datatypes ((List!6297 0))(
  ( (Nil!6294) (Cons!6293 (h!7149 (_ BitVec 64)) (t!11447 List!6297)) )
))
(declare-fun arrayNoDuplicates!0 (array!22903 (_ BitVec 32) List!6297) Bool)

(assert (=> b!386949 (= res!220999 (arrayNoDuplicates!0 lt!181924 #b00000000000000000000000000000000 Nil!6294))))

(declare-fun mapNonEmpty!15822 () Bool)

(declare-fun mapRes!15822 () Bool)

(declare-fun tp!31251 () Bool)

(declare-fun e!234663 () Bool)

(assert (=> mapNonEmpty!15822 (= mapRes!15822 (and tp!31251 e!234663))))

(declare-datatypes ((V!13779 0))(
  ( (V!13780 (val!4797 Int)) )
))
(declare-datatypes ((ValueCell!4409 0))(
  ( (ValueCellFull!4409 (v!6994 V!13779)) (EmptyCell!4409) )
))
(declare-datatypes ((array!22905 0))(
  ( (array!22906 (arr!10921 (Array (_ BitVec 32) ValueCell!4409)) (size!11273 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22905)

(declare-fun mapRest!15822 () (Array (_ BitVec 32) ValueCell!4409))

(declare-fun mapValue!15822 () ValueCell!4409)

(declare-fun mapKey!15822 () (_ BitVec 32))

(assert (=> mapNonEmpty!15822 (= (arr!10921 _values!506) (store mapRest!15822 mapKey!15822 mapValue!15822))))

(declare-fun mapIsEmpty!15822 () Bool)

(assert (=> mapIsEmpty!15822 mapRes!15822))

(declare-fun b!386950 () Bool)

(declare-fun res!221003 () Bool)

(assert (=> b!386950 (=> (not res!221003) (not e!234668))))

(assert (=> b!386950 (= res!221003 (or (= (select (arr!10920 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10920 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!220998 () Bool)

(assert (=> start!37730 (=> (not res!220998) (not e!234668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37730 (= res!220998 (validMask!0 mask!970))))

(assert (=> start!37730 e!234668))

(declare-fun e!234665 () Bool)

(declare-fun array_inv!8034 (array!22905) Bool)

(assert (=> start!37730 (and (array_inv!8034 _values!506) e!234665)))

(assert (=> start!37730 tp!31250))

(assert (=> start!37730 true))

(declare-fun tp_is_empty!9505 () Bool)

(assert (=> start!37730 tp_is_empty!9505))

(declare-fun array_inv!8035 (array!22903) Bool)

(assert (=> start!37730 (array_inv!8035 _keys!658)))

(declare-fun b!386951 () Bool)

(assert (=> b!386951 (= e!234667 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13779)

(declare-datatypes ((tuple2!6448 0))(
  ( (tuple2!6449 (_1!3235 (_ BitVec 64)) (_2!3235 V!13779)) )
))
(declare-datatypes ((List!6298 0))(
  ( (Nil!6295) (Cons!6294 (h!7150 tuple2!6448) (t!11448 List!6298)) )
))
(declare-datatypes ((ListLongMap!5361 0))(
  ( (ListLongMap!5362 (toList!2696 List!6298)) )
))
(declare-fun lt!181925 () ListLongMap!5361)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13779)

(declare-fun minValue!472 () V!13779)

(declare-fun getCurrentListMapNoExtraKeys!925 (array!22903 array!22905 (_ BitVec 32) (_ BitVec 32) V!13779 V!13779 (_ BitVec 32) Int) ListLongMap!5361)

(assert (=> b!386951 (= lt!181925 (getCurrentListMapNoExtraKeys!925 lt!181924 (array!22906 (store (arr!10921 _values!506) i!548 (ValueCellFull!4409 v!373)) (size!11273 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181926 () ListLongMap!5361)

(assert (=> b!386951 (= lt!181926 (getCurrentListMapNoExtraKeys!925 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386952 () Bool)

(declare-fun res!221006 () Bool)

(assert (=> b!386952 (=> (not res!221006) (not e!234668))))

(declare-fun arrayContainsKey!0 (array!22903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386952 (= res!221006 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386953 () Bool)

(declare-fun e!234664 () Bool)

(assert (=> b!386953 (= e!234664 tp_is_empty!9505)))

(declare-fun b!386954 () Bool)

(assert (=> b!386954 (= e!234663 tp_is_empty!9505)))

(declare-fun b!386955 () Bool)

(declare-fun res!220997 () Bool)

(assert (=> b!386955 (=> (not res!220997) (not e!234668))))

(assert (=> b!386955 (= res!220997 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11272 _keys!658))))))

(declare-fun b!386956 () Bool)

(assert (=> b!386956 (= e!234665 (and e!234664 mapRes!15822))))

(declare-fun condMapEmpty!15822 () Bool)

(declare-fun mapDefault!15822 () ValueCell!4409)

