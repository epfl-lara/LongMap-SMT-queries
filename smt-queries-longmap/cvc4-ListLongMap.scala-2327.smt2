; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37428 () Bool)

(assert start!37428)

(declare-fun b_free!8555 () Bool)

(declare-fun b_next!8555 () Bool)

(assert (=> start!37428 (= b_free!8555 (not b_next!8555))))

(declare-fun tp!30381 () Bool)

(declare-fun b_and!15797 () Bool)

(assert (=> start!37428 (= tp!30381 b_and!15797)))

(declare-fun b!380932 () Bool)

(declare-fun res!216341 () Bool)

(declare-fun e!231650 () Bool)

(assert (=> b!380932 (=> (not res!216341) (not e!231650))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22325 0))(
  ( (array!22326 (arr!10631 (Array (_ BitVec 32) (_ BitVec 64))) (size!10983 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22325)

(assert (=> b!380932 (= res!216341 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10983 _keys!658))))))

(declare-fun b!380933 () Bool)

(declare-fun res!216348 () Bool)

(assert (=> b!380933 (=> (not res!216348) (not e!231650))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380933 (= res!216348 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!15369 () Bool)

(declare-fun mapRes!15369 () Bool)

(assert (=> mapIsEmpty!15369 mapRes!15369))

(declare-fun b!380934 () Bool)

(declare-fun res!216349 () Bool)

(assert (=> b!380934 (=> (not res!216349) (not e!231650))))

(declare-fun arrayContainsKey!0 (array!22325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380934 (= res!216349 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380935 () Bool)

(declare-fun e!231652 () Bool)

(assert (=> b!380935 (= e!231650 e!231652)))

(declare-fun res!216346 () Bool)

(assert (=> b!380935 (=> (not res!216346) (not e!231652))))

(declare-fun lt!178458 () array!22325)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22325 (_ BitVec 32)) Bool)

(assert (=> b!380935 (= res!216346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178458 mask!970))))

(assert (=> b!380935 (= lt!178458 (array!22326 (store (arr!10631 _keys!658) i!548 k!778) (size!10983 _keys!658)))))

(declare-fun b!380936 () Bool)

(declare-fun e!231649 () Bool)

(declare-fun tp_is_empty!9203 () Bool)

(assert (=> b!380936 (= e!231649 tp_is_empty!9203)))

(declare-fun b!380937 () Bool)

(declare-fun res!216343 () Bool)

(assert (=> b!380937 (=> (not res!216343) (not e!231650))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13375 0))(
  ( (V!13376 (val!4646 Int)) )
))
(declare-datatypes ((ValueCell!4258 0))(
  ( (ValueCellFull!4258 (v!6843 V!13375)) (EmptyCell!4258) )
))
(declare-datatypes ((array!22327 0))(
  ( (array!22328 (arr!10632 (Array (_ BitVec 32) ValueCell!4258)) (size!10984 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22327)

(assert (=> b!380937 (= res!216343 (and (= (size!10984 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10983 _keys!658) (size!10984 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380938 () Bool)

(declare-fun e!231648 () Bool)

(assert (=> b!380938 (= e!231648 true)))

(declare-datatypes ((tuple2!6234 0))(
  ( (tuple2!6235 (_1!3128 (_ BitVec 64)) (_2!3128 V!13375)) )
))
(declare-datatypes ((List!6068 0))(
  ( (Nil!6065) (Cons!6064 (h!6920 tuple2!6234) (t!11218 List!6068)) )
))
(declare-datatypes ((ListLongMap!5147 0))(
  ( (ListLongMap!5148 (toList!2589 List!6068)) )
))
(declare-fun lt!178457 () ListLongMap!5147)

(declare-fun lt!178459 () ListLongMap!5147)

(assert (=> b!380938 (= lt!178457 lt!178459)))

(declare-fun res!216347 () Bool)

(assert (=> start!37428 (=> (not res!216347) (not e!231650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37428 (= res!216347 (validMask!0 mask!970))))

(assert (=> start!37428 e!231650))

(declare-fun e!231653 () Bool)

(declare-fun array_inv!7828 (array!22327) Bool)

(assert (=> start!37428 (and (array_inv!7828 _values!506) e!231653)))

(assert (=> start!37428 tp!30381))

(assert (=> start!37428 true))

(assert (=> start!37428 tp_is_empty!9203))

(declare-fun array_inv!7829 (array!22325) Bool)

(assert (=> start!37428 (array_inv!7829 _keys!658)))

(declare-fun b!380939 () Bool)

(assert (=> b!380939 (= e!231652 (not e!231648))))

(declare-fun res!216342 () Bool)

(assert (=> b!380939 (=> res!216342 e!231648)))

(declare-fun lt!178456 () Bool)

(assert (=> b!380939 (= res!216342 (or (and (not lt!178456) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178456) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178456)))))

(assert (=> b!380939 (= lt!178456 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!178454 () ListLongMap!5147)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13375)

(declare-fun minValue!472 () V!13375)

(declare-fun getCurrentListMap!2005 (array!22325 array!22327 (_ BitVec 32) (_ BitVec 32) V!13375 V!13375 (_ BitVec 32) Int) ListLongMap!5147)

(assert (=> b!380939 (= lt!178454 (getCurrentListMap!2005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178453 () array!22327)

(assert (=> b!380939 (= lt!178457 (getCurrentListMap!2005 lt!178458 lt!178453 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178461 () ListLongMap!5147)

(assert (=> b!380939 (and (= lt!178459 lt!178461) (= lt!178461 lt!178459))))

(declare-fun v!373 () V!13375)

(declare-fun lt!178455 () ListLongMap!5147)

(declare-fun +!935 (ListLongMap!5147 tuple2!6234) ListLongMap!5147)

(assert (=> b!380939 (= lt!178461 (+!935 lt!178455 (tuple2!6235 k!778 v!373)))))

(declare-datatypes ((Unit!11764 0))(
  ( (Unit!11765) )
))
(declare-fun lt!178460 () Unit!11764)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!163 (array!22325 array!22327 (_ BitVec 32) (_ BitVec 32) V!13375 V!13375 (_ BitVec 32) (_ BitVec 64) V!13375 (_ BitVec 32) Int) Unit!11764)

(assert (=> b!380939 (= lt!178460 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!163 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!839 (array!22325 array!22327 (_ BitVec 32) (_ BitVec 32) V!13375 V!13375 (_ BitVec 32) Int) ListLongMap!5147)

(assert (=> b!380939 (= lt!178459 (getCurrentListMapNoExtraKeys!839 lt!178458 lt!178453 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380939 (= lt!178453 (array!22328 (store (arr!10632 _values!506) i!548 (ValueCellFull!4258 v!373)) (size!10984 _values!506)))))

(assert (=> b!380939 (= lt!178455 (getCurrentListMapNoExtraKeys!839 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380940 () Bool)

(declare-fun res!216344 () Bool)

(assert (=> b!380940 (=> (not res!216344) (not e!231650))))

(assert (=> b!380940 (= res!216344 (or (= (select (arr!10631 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10631 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15369 () Bool)

(declare-fun tp!30380 () Bool)

(assert (=> mapNonEmpty!15369 (= mapRes!15369 (and tp!30380 e!231649))))

(declare-fun mapRest!15369 () (Array (_ BitVec 32) ValueCell!4258))

(declare-fun mapKey!15369 () (_ BitVec 32))

(declare-fun mapValue!15369 () ValueCell!4258)

(assert (=> mapNonEmpty!15369 (= (arr!10632 _values!506) (store mapRest!15369 mapKey!15369 mapValue!15369))))

(declare-fun b!380941 () Bool)

(declare-fun res!216350 () Bool)

(assert (=> b!380941 (=> (not res!216350) (not e!231650))))

(declare-datatypes ((List!6069 0))(
  ( (Nil!6066) (Cons!6065 (h!6921 (_ BitVec 64)) (t!11219 List!6069)) )
))
(declare-fun arrayNoDuplicates!0 (array!22325 (_ BitVec 32) List!6069) Bool)

(assert (=> b!380941 (= res!216350 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6066))))

(declare-fun b!380942 () Bool)

(declare-fun e!231651 () Bool)

(assert (=> b!380942 (= e!231653 (and e!231651 mapRes!15369))))

(declare-fun condMapEmpty!15369 () Bool)

(declare-fun mapDefault!15369 () ValueCell!4258)

