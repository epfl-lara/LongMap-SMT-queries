; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38542 () Bool)

(assert start!38542)

(declare-fun b_free!9079 () Bool)

(declare-fun b_next!9079 () Bool)

(assert (=> start!38542 (= b_free!9079 (not b_next!9079))))

(declare-fun tp!32361 () Bool)

(declare-fun b_and!16465 () Bool)

(assert (=> start!38542 (= tp!32361 b_and!16465)))

(declare-fun b!398473 () Bool)

(declare-fun e!240833 () Bool)

(declare-fun e!240831 () Bool)

(assert (=> b!398473 (= e!240833 e!240831)))

(declare-fun res!228997 () Bool)

(assert (=> b!398473 (=> (not res!228997) (not e!240831))))

(declare-datatypes ((array!23833 0))(
  ( (array!23834 (arr!11366 (Array (_ BitVec 32) (_ BitVec 64))) (size!11718 (_ BitVec 32))) )
))
(declare-fun lt!187463 () array!23833)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23833 (_ BitVec 32)) Bool)

(assert (=> b!398473 (= res!228997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187463 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!23833)

(assert (=> b!398473 (= lt!187463 (array!23834 (store (arr!11366 _keys!709) i!563 k!794) (size!11718 _keys!709)))))

(declare-fun b!398474 () Bool)

(declare-fun res!229005 () Bool)

(assert (=> b!398474 (=> (not res!229005) (not e!240833))))

(assert (=> b!398474 (= res!229005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-datatypes ((V!14387 0))(
  ( (V!14388 (val!5025 Int)) )
))
(declare-fun minValue!515 () V!14387)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4637 0))(
  ( (ValueCellFull!4637 (v!7272 V!14387)) (EmptyCell!4637) )
))
(declare-datatypes ((array!23835 0))(
  ( (array!23836 (arr!11367 (Array (_ BitVec 32) ValueCell!4637)) (size!11719 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23835)

(declare-datatypes ((tuple2!6644 0))(
  ( (tuple2!6645 (_1!3333 (_ BitVec 64)) (_2!3333 V!14387)) )
))
(declare-datatypes ((List!6572 0))(
  ( (Nil!6569) (Cons!6568 (h!7424 tuple2!6644) (t!11746 List!6572)) )
))
(declare-datatypes ((ListLongMap!5557 0))(
  ( (ListLongMap!5558 (toList!2794 List!6572)) )
))
(declare-fun call!27902 () ListLongMap!5557)

(declare-fun bm!27898 () Bool)

(declare-fun v!412 () V!14387)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54575 () Bool)

(declare-fun zeroValue!515 () V!14387)

(declare-fun getCurrentListMapNoExtraKeys!1013 (array!23833 array!23835 (_ BitVec 32) (_ BitVec 32) V!14387 V!14387 (_ BitVec 32) Int) ListLongMap!5557)

(assert (=> bm!27898 (= call!27902 (getCurrentListMapNoExtraKeys!1013 (ite c!54575 _keys!709 lt!187463) (ite c!54575 _values!549 (array!23836 (store (arr!11367 _values!549) i!563 (ValueCellFull!4637 v!412)) (size!11719 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398475 () Bool)

(declare-fun res!229004 () Bool)

(assert (=> b!398475 (=> (not res!229004) (not e!240833))))

(declare-fun arrayContainsKey!0 (array!23833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398475 (= res!229004 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun bm!27899 () Bool)

(declare-fun call!27901 () ListLongMap!5557)

(assert (=> bm!27899 (= call!27901 (getCurrentListMapNoExtraKeys!1013 (ite c!54575 lt!187463 _keys!709) (ite c!54575 (array!23836 (store (arr!11367 _values!549) i!563 (ValueCellFull!4637 v!412)) (size!11719 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398476 () Bool)

(declare-fun res!229003 () Bool)

(assert (=> b!398476 (=> (not res!229003) (not e!240833))))

(declare-datatypes ((List!6573 0))(
  ( (Nil!6570) (Cons!6569 (h!7425 (_ BitVec 64)) (t!11747 List!6573)) )
))
(declare-fun arrayNoDuplicates!0 (array!23833 (_ BitVec 32) List!6573) Bool)

(assert (=> b!398476 (= res!229003 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6570))))

(declare-fun res!229002 () Bool)

(assert (=> start!38542 (=> (not res!229002) (not e!240833))))

(assert (=> start!38542 (= res!229002 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11718 _keys!709))))))

(assert (=> start!38542 e!240833))

(declare-fun tp_is_empty!9961 () Bool)

(assert (=> start!38542 tp_is_empty!9961))

(assert (=> start!38542 tp!32361))

(assert (=> start!38542 true))

(declare-fun e!240836 () Bool)

(declare-fun array_inv!8332 (array!23835) Bool)

(assert (=> start!38542 (and (array_inv!8332 _values!549) e!240836)))

(declare-fun array_inv!8333 (array!23833) Bool)

(assert (=> start!38542 (array_inv!8333 _keys!709)))

(declare-fun mapIsEmpty!16563 () Bool)

(declare-fun mapRes!16563 () Bool)

(assert (=> mapIsEmpty!16563 mapRes!16563))

(declare-fun b!398477 () Bool)

(declare-fun res!228996 () Bool)

(assert (=> b!398477 (=> (not res!228996) (not e!240833))))

(assert (=> b!398477 (= res!228996 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11718 _keys!709))))))

(declare-fun b!398478 () Bool)

(declare-fun e!240835 () Bool)

(assert (=> b!398478 (= e!240835 (= call!27902 call!27901))))

(declare-fun b!398479 () Bool)

(assert (=> b!398479 (= e!240831 (not true))))

(assert (=> b!398479 e!240835))

(assert (=> b!398479 (= c!54575 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12078 0))(
  ( (Unit!12079) )
))
(declare-fun lt!187462 () Unit!12078)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!297 (array!23833 array!23835 (_ BitVec 32) (_ BitVec 32) V!14387 V!14387 (_ BitVec 32) (_ BitVec 64) V!14387 (_ BitVec 32) Int) Unit!12078)

(assert (=> b!398479 (= lt!187462 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!297 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16563 () Bool)

(declare-fun tp!32360 () Bool)

(declare-fun e!240837 () Bool)

(assert (=> mapNonEmpty!16563 (= mapRes!16563 (and tp!32360 e!240837))))

(declare-fun mapValue!16563 () ValueCell!4637)

(declare-fun mapKey!16563 () (_ BitVec 32))

(declare-fun mapRest!16563 () (Array (_ BitVec 32) ValueCell!4637))

(assert (=> mapNonEmpty!16563 (= (arr!11367 _values!549) (store mapRest!16563 mapKey!16563 mapValue!16563))))

(declare-fun b!398480 () Bool)

(declare-fun e!240832 () Bool)

(assert (=> b!398480 (= e!240836 (and e!240832 mapRes!16563))))

(declare-fun condMapEmpty!16563 () Bool)

(declare-fun mapDefault!16563 () ValueCell!4637)

