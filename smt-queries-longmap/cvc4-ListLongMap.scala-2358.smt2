; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37614 () Bool)

(assert start!37614)

(declare-fun b_free!8741 () Bool)

(declare-fun b_next!8741 () Bool)

(assert (=> start!37614 (= b_free!8741 (not b_next!8741))))

(declare-fun tp!30939 () Bool)

(declare-fun b_and!15983 () Bool)

(assert (=> start!37614 (= tp!30939 b_and!15983)))

(declare-fun mapIsEmpty!15648 () Bool)

(declare-fun mapRes!15648 () Bool)

(assert (=> mapIsEmpty!15648 mapRes!15648))

(declare-fun b!384848 () Bool)

(declare-fun res!219421 () Bool)

(declare-fun e!233614 () Bool)

(assert (=> b!384848 (=> (not res!219421) (not e!233614))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22679 0))(
  ( (array!22680 (arr!10808 (Array (_ BitVec 32) (_ BitVec 64))) (size!11160 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22679)

(assert (=> b!384848 (= res!219421 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11160 _keys!658))))))

(declare-fun b!384849 () Bool)

(declare-fun res!219422 () Bool)

(assert (=> b!384849 (=> (not res!219422) (not e!233614))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13623 0))(
  ( (V!13624 (val!4739 Int)) )
))
(declare-datatypes ((ValueCell!4351 0))(
  ( (ValueCellFull!4351 (v!6936 V!13623)) (EmptyCell!4351) )
))
(declare-datatypes ((array!22681 0))(
  ( (array!22682 (arr!10809 (Array (_ BitVec 32) ValueCell!4351)) (size!11161 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22681)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!384849 (= res!219422 (and (= (size!11161 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11160 _keys!658) (size!11161 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384850 () Bool)

(declare-fun res!219418 () Bool)

(assert (=> b!384850 (=> (not res!219418) (not e!233614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22679 (_ BitVec 32)) Bool)

(assert (=> b!384850 (= res!219418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384851 () Bool)

(declare-fun e!233612 () Bool)

(declare-fun tp_is_empty!9389 () Bool)

(assert (=> b!384851 (= e!233612 tp_is_empty!9389)))

(declare-fun b!384852 () Bool)

(declare-fun res!219425 () Bool)

(declare-fun e!233611 () Bool)

(assert (=> b!384852 (=> (not res!219425) (not e!233611))))

(declare-fun lt!181214 () array!22679)

(declare-datatypes ((List!6217 0))(
  ( (Nil!6214) (Cons!6213 (h!7069 (_ BitVec 64)) (t!11367 List!6217)) )
))
(declare-fun arrayNoDuplicates!0 (array!22679 (_ BitVec 32) List!6217) Bool)

(assert (=> b!384852 (= res!219425 (arrayNoDuplicates!0 lt!181214 #b00000000000000000000000000000000 Nil!6214))))

(declare-fun b!384853 () Bool)

(declare-fun e!233610 () Bool)

(assert (=> b!384853 (= e!233610 true)))

(declare-datatypes ((tuple2!6382 0))(
  ( (tuple2!6383 (_1!3202 (_ BitVec 64)) (_2!3202 V!13623)) )
))
(declare-datatypes ((List!6218 0))(
  ( (Nil!6215) (Cons!6214 (h!7070 tuple2!6382) (t!11368 List!6218)) )
))
(declare-datatypes ((ListLongMap!5295 0))(
  ( (ListLongMap!5296 (toList!2663 List!6218)) )
))
(declare-fun lt!181206 () ListLongMap!5295)

(declare-fun lt!181215 () ListLongMap!5295)

(declare-fun lt!181213 () tuple2!6382)

(declare-fun +!998 (ListLongMap!5295 tuple2!6382) ListLongMap!5295)

(assert (=> b!384853 (= lt!181206 (+!998 lt!181215 lt!181213))))

(declare-fun lt!181205 () ListLongMap!5295)

(declare-fun lt!181209 () ListLongMap!5295)

(assert (=> b!384853 (= lt!181205 lt!181209)))

(declare-fun b!384854 () Bool)

(declare-fun res!219424 () Bool)

(assert (=> b!384854 (=> (not res!219424) (not e!233614))))

(assert (=> b!384854 (= res!219424 (or (= (select (arr!10808 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10808 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384855 () Bool)

(declare-fun res!219427 () Bool)

(assert (=> b!384855 (=> (not res!219427) (not e!233614))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384855 (= res!219427 (validKeyInArray!0 k!778))))

(declare-fun b!384856 () Bool)

(declare-fun e!233609 () Bool)

(assert (=> b!384856 (= e!233609 tp_is_empty!9389)))

(declare-fun mapNonEmpty!15648 () Bool)

(declare-fun tp!30938 () Bool)

(assert (=> mapNonEmpty!15648 (= mapRes!15648 (and tp!30938 e!233612))))

(declare-fun mapKey!15648 () (_ BitVec 32))

(declare-fun mapRest!15648 () (Array (_ BitVec 32) ValueCell!4351))

(declare-fun mapValue!15648 () ValueCell!4351)

(assert (=> mapNonEmpty!15648 (= (arr!10809 _values!506) (store mapRest!15648 mapKey!15648 mapValue!15648))))

(declare-fun b!384857 () Bool)

(declare-fun e!233613 () Bool)

(assert (=> b!384857 (= e!233613 (and e!233609 mapRes!15648))))

(declare-fun condMapEmpty!15648 () Bool)

(declare-fun mapDefault!15648 () ValueCell!4351)

