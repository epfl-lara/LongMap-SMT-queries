; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37698 () Bool)

(assert start!37698)

(declare-fun b_free!8801 () Bool)

(declare-fun b_next!8801 () Bool)

(assert (=> start!37698 (= b_free!8801 (not b_next!8801))))

(declare-fun tp!31154 () Bool)

(declare-fun b_and!16043 () Bool)

(assert (=> start!37698 (= tp!31154 b_and!16043)))

(declare-fun b!386324 () Bool)

(declare-fun e!234380 () Bool)

(declare-fun tp_is_empty!9473 () Bool)

(assert (=> b!386324 (= e!234380 tp_is_empty!9473)))

(declare-fun b!386325 () Bool)

(declare-fun e!234375 () Bool)

(assert (=> b!386325 (= e!234375 tp_is_empty!9473)))

(declare-fun res!220521 () Bool)

(declare-fun e!234376 () Bool)

(assert (=> start!37698 (=> (not res!220521) (not e!234376))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37698 (= res!220521 (validMask!0 mask!970))))

(assert (=> start!37698 e!234376))

(declare-datatypes ((V!13735 0))(
  ( (V!13736 (val!4781 Int)) )
))
(declare-datatypes ((ValueCell!4393 0))(
  ( (ValueCellFull!4393 (v!6978 V!13735)) (EmptyCell!4393) )
))
(declare-datatypes ((array!22843 0))(
  ( (array!22844 (arr!10890 (Array (_ BitVec 32) ValueCell!4393)) (size!11242 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22843)

(declare-fun e!234379 () Bool)

(declare-fun array_inv!8012 (array!22843) Bool)

(assert (=> start!37698 (and (array_inv!8012 _values!506) e!234379)))

(assert (=> start!37698 tp!31154))

(assert (=> start!37698 true))

(assert (=> start!37698 tp_is_empty!9473))

(declare-datatypes ((array!22845 0))(
  ( (array!22846 (arr!10891 (Array (_ BitVec 32) (_ BitVec 64))) (size!11243 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22845)

(declare-fun array_inv!8013 (array!22845) Bool)

(assert (=> start!37698 (array_inv!8013 _keys!658)))

(declare-fun b!386326 () Bool)

(declare-fun res!220519 () Bool)

(assert (=> b!386326 (=> (not res!220519) (not e!234376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22845 (_ BitVec 32)) Bool)

(assert (=> b!386326 (= res!220519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15774 () Bool)

(declare-fun mapRes!15774 () Bool)

(assert (=> mapIsEmpty!15774 mapRes!15774))

(declare-fun b!386327 () Bool)

(declare-fun res!220520 () Bool)

(assert (=> b!386327 (=> (not res!220520) (not e!234376))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386327 (= res!220520 (or (= (select (arr!10891 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10891 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386328 () Bool)

(declare-fun res!220518 () Bool)

(assert (=> b!386328 (=> (not res!220518) (not e!234376))))

(declare-datatypes ((List!6274 0))(
  ( (Nil!6271) (Cons!6270 (h!7126 (_ BitVec 64)) (t!11424 List!6274)) )
))
(declare-fun arrayNoDuplicates!0 (array!22845 (_ BitVec 32) List!6274) Bool)

(assert (=> b!386328 (= res!220518 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6271))))

(declare-fun b!386329 () Bool)

(declare-fun res!220517 () Bool)

(assert (=> b!386329 (=> (not res!220517) (not e!234376))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386329 (= res!220517 (validKeyInArray!0 k!778))))

(declare-fun b!386330 () Bool)

(declare-fun e!234377 () Bool)

(assert (=> b!386330 (= e!234376 e!234377)))

(declare-fun res!220522 () Bool)

(assert (=> b!386330 (=> (not res!220522) (not e!234377))))

(declare-fun lt!181781 () array!22845)

(assert (=> b!386330 (= res!220522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181781 mask!970))))

(assert (=> b!386330 (= lt!181781 (array!22846 (store (arr!10891 _keys!658) i!548 k!778) (size!11243 _keys!658)))))

(declare-fun mapNonEmpty!15774 () Bool)

(declare-fun tp!31155 () Bool)

(assert (=> mapNonEmpty!15774 (= mapRes!15774 (and tp!31155 e!234380))))

(declare-fun mapValue!15774 () ValueCell!4393)

(declare-fun mapRest!15774 () (Array (_ BitVec 32) ValueCell!4393))

(declare-fun mapKey!15774 () (_ BitVec 32))

(assert (=> mapNonEmpty!15774 (= (arr!10890 _values!506) (store mapRest!15774 mapKey!15774 mapValue!15774))))

(declare-fun b!386331 () Bool)

(declare-fun res!220526 () Bool)

(assert (=> b!386331 (=> (not res!220526) (not e!234376))))

(declare-fun arrayContainsKey!0 (array!22845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386331 (= res!220526 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386332 () Bool)

(declare-fun res!220524 () Bool)

(assert (=> b!386332 (=> (not res!220524) (not e!234376))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386332 (= res!220524 (and (= (size!11242 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11243 _keys!658) (size!11242 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386333 () Bool)

(assert (=> b!386333 (= e!234379 (and e!234375 mapRes!15774))))

(declare-fun condMapEmpty!15774 () Bool)

(declare-fun mapDefault!15774 () ValueCell!4393)

