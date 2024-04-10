; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38552 () Bool)

(assert start!38552)

(declare-fun b_free!9089 () Bool)

(declare-fun b_next!9089 () Bool)

(assert (=> start!38552 (= b_free!9089 (not b_next!9089))))

(declare-fun tp!32390 () Bool)

(declare-fun b_and!16475 () Bool)

(assert (=> start!38552 (= tp!32390 b_and!16475)))

(declare-datatypes ((V!14399 0))(
  ( (V!14400 (val!5030 Int)) )
))
(declare-datatypes ((tuple2!6654 0))(
  ( (tuple2!6655 (_1!3338 (_ BitVec 64)) (_2!3338 V!14399)) )
))
(declare-datatypes ((List!6581 0))(
  ( (Nil!6578) (Cons!6577 (h!7433 tuple2!6654) (t!11755 List!6581)) )
))
(declare-datatypes ((ListLongMap!5567 0))(
  ( (ListLongMap!5568 (toList!2799 List!6581)) )
))
(declare-fun call!27931 () ListLongMap!5567)

(declare-fun e!240941 () Bool)

(declare-fun b!398728 () Bool)

(declare-fun v!412 () V!14399)

(declare-fun call!27932 () ListLongMap!5567)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1089 (ListLongMap!5567 tuple2!6654) ListLongMap!5567)

(assert (=> b!398728 (= e!240941 (= call!27932 (+!1089 call!27931 (tuple2!6655 k!794 v!412))))))

(declare-fun b!398729 () Bool)

(declare-fun e!240942 () Bool)

(assert (=> b!398729 (= e!240942 (not true))))

(assert (=> b!398729 e!240941))

(declare-fun c!54590 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398729 (= c!54590 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14399)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12084 0))(
  ( (Unit!12085) )
))
(declare-fun lt!187493 () Unit!12084)

(declare-datatypes ((ValueCell!4642 0))(
  ( (ValueCellFull!4642 (v!7277 V!14399)) (EmptyCell!4642) )
))
(declare-datatypes ((array!23853 0))(
  ( (array!23854 (arr!11376 (Array (_ BitVec 32) ValueCell!4642)) (size!11728 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23853)

(declare-fun zeroValue!515 () V!14399)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23855 0))(
  ( (array!23856 (arr!11377 (Array (_ BitVec 32) (_ BitVec 64))) (size!11729 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23855)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!300 (array!23855 array!23853 (_ BitVec 32) (_ BitVec 32) V!14399 V!14399 (_ BitVec 32) (_ BitVec 64) V!14399 (_ BitVec 32) Int) Unit!12084)

(assert (=> b!398729 (= lt!187493 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!300 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398730 () Bool)

(declare-fun e!240936 () Bool)

(declare-fun tp_is_empty!9971 () Bool)

(assert (=> b!398730 (= e!240936 tp_is_empty!9971)))

(declare-fun b!398731 () Bool)

(declare-fun e!240939 () Bool)

(declare-fun e!240940 () Bool)

(declare-fun mapRes!16578 () Bool)

(assert (=> b!398731 (= e!240939 (and e!240940 mapRes!16578))))

(declare-fun condMapEmpty!16578 () Bool)

(declare-fun mapDefault!16578 () ValueCell!4642)

