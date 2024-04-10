; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37776 () Bool)

(assert start!37776)

(declare-fun b_free!8879 () Bool)

(declare-fun b_next!8879 () Bool)

(assert (=> start!37776 (= b_free!8879 (not b_next!8879))))

(declare-fun tp!31389 () Bool)

(declare-fun b_and!16121 () Bool)

(assert (=> start!37776 (= tp!31389 b_and!16121)))

(declare-fun b!387845 () Bool)

(declare-fun res!221687 () Bool)

(declare-fun e!235082 () Bool)

(assert (=> b!387845 (=> (not res!221687) (not e!235082))))

(declare-datatypes ((array!22993 0))(
  ( (array!22994 (arr!10965 (Array (_ BitVec 32) (_ BitVec 64))) (size!11317 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22993)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387845 (= res!221687 (or (= (select (arr!10965 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10965 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387846 () Bool)

(declare-fun res!221689 () Bool)

(declare-fun e!235080 () Bool)

(assert (=> b!387846 (=> (not res!221689) (not e!235080))))

(declare-fun lt!182133 () array!22993)

(declare-datatypes ((List!6330 0))(
  ( (Nil!6327) (Cons!6326 (h!7182 (_ BitVec 64)) (t!11480 List!6330)) )
))
(declare-fun arrayNoDuplicates!0 (array!22993 (_ BitVec 32) List!6330) Bool)

(assert (=> b!387846 (= res!221689 (arrayNoDuplicates!0 lt!182133 #b00000000000000000000000000000000 Nil!6327))))

(declare-fun b!387847 () Bool)

(declare-fun res!221694 () Bool)

(assert (=> b!387847 (=> (not res!221694) (not e!235082))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13839 0))(
  ( (V!13840 (val!4820 Int)) )
))
(declare-datatypes ((ValueCell!4432 0))(
  ( (ValueCellFull!4432 (v!7017 V!13839)) (EmptyCell!4432) )
))
(declare-datatypes ((array!22995 0))(
  ( (array!22996 (arr!10966 (Array (_ BitVec 32) ValueCell!4432)) (size!11318 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22995)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!387847 (= res!221694 (and (= (size!11318 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11317 _keys!658) (size!11318 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387848 () Bool)

(declare-fun res!221691 () Bool)

(assert (=> b!387848 (=> (not res!221691) (not e!235082))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387848 (= res!221691 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!387849 () Bool)

(declare-fun e!235081 () Bool)

(declare-fun tp_is_empty!9551 () Bool)

(assert (=> b!387849 (= e!235081 tp_is_empty!9551)))

(declare-fun b!387850 () Bool)

(declare-fun res!221693 () Bool)

(assert (=> b!387850 (=> (not res!221693) (not e!235082))))

(assert (=> b!387850 (= res!221693 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6327))))

(declare-fun b!387851 () Bool)

(declare-fun res!221688 () Bool)

(assert (=> b!387851 (=> (not res!221688) (not e!235082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387851 (= res!221688 (validKeyInArray!0 k!778))))

(declare-fun b!387852 () Bool)

(declare-fun e!235078 () Bool)

(assert (=> b!387852 (= e!235078 tp_is_empty!9551)))

(declare-fun mapIsEmpty!15891 () Bool)

(declare-fun mapRes!15891 () Bool)

(assert (=> mapIsEmpty!15891 mapRes!15891))

(declare-fun b!387853 () Bool)

(assert (=> b!387853 (= e!235080 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun v!373 () V!13839)

(declare-datatypes ((tuple2!6478 0))(
  ( (tuple2!6479 (_1!3250 (_ BitVec 64)) (_2!3250 V!13839)) )
))
(declare-datatypes ((List!6331 0))(
  ( (Nil!6328) (Cons!6327 (h!7183 tuple2!6478) (t!11481 List!6331)) )
))
(declare-datatypes ((ListLongMap!5391 0))(
  ( (ListLongMap!5392 (toList!2711 List!6331)) )
))
(declare-fun lt!182132 () ListLongMap!5391)

(declare-fun zeroValue!472 () V!13839)

(declare-fun minValue!472 () V!13839)

(declare-fun getCurrentListMapNoExtraKeys!940 (array!22993 array!22995 (_ BitVec 32) (_ BitVec 32) V!13839 V!13839 (_ BitVec 32) Int) ListLongMap!5391)

(assert (=> b!387853 (= lt!182132 (getCurrentListMapNoExtraKeys!940 lt!182133 (array!22996 (store (arr!10966 _values!506) i!548 (ValueCellFull!4432 v!373)) (size!11318 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182131 () ListLongMap!5391)

(assert (=> b!387853 (= lt!182131 (getCurrentListMapNoExtraKeys!940 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387854 () Bool)

(declare-fun res!221696 () Bool)

(assert (=> b!387854 (=> (not res!221696) (not e!235082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22993 (_ BitVec 32)) Bool)

(assert (=> b!387854 (= res!221696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387855 () Bool)

(declare-fun e!235077 () Bool)

(assert (=> b!387855 (= e!235077 (and e!235078 mapRes!15891))))

(declare-fun condMapEmpty!15891 () Bool)

(declare-fun mapDefault!15891 () ValueCell!4432)

