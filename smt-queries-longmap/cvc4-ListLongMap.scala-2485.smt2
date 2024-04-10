; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38732 () Bool)

(assert start!38732)

(declare-fun b_free!9269 () Bool)

(declare-fun b_next!9269 () Bool)

(assert (=> start!38732 (= b_free!9269 (not b_next!9269))))

(declare-fun tp!32931 () Bool)

(declare-fun b_and!16655 () Bool)

(assert (=> start!38732 (= tp!32931 b_and!16655)))

(declare-fun b!403318 () Bool)

(declare-fun res!232415 () Bool)

(declare-fun e!242828 () Bool)

(assert (=> b!403318 (=> (not res!232415) (not e!242828))))

(declare-datatypes ((array!24203 0))(
  ( (array!24204 (arr!11551 (Array (_ BitVec 32) (_ BitVec 64))) (size!11903 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24203)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403318 (= res!232415 (or (= (select (arr!11551 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11551 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!14639 0))(
  ( (V!14640 (val!5120 Int)) )
))
(declare-datatypes ((tuple2!6802 0))(
  ( (tuple2!6803 (_1!3412 (_ BitVec 64)) (_2!3412 V!14639)) )
))
(declare-datatypes ((List!6723 0))(
  ( (Nil!6720) (Cons!6719 (h!7575 tuple2!6802) (t!11897 List!6723)) )
))
(declare-datatypes ((ListLongMap!5715 0))(
  ( (ListLongMap!5716 (toList!2873 List!6723)) )
))
(declare-fun call!28472 () ListLongMap!5715)

(declare-fun b!403319 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!28471 () ListLongMap!5715)

(declare-fun v!412 () V!14639)

(declare-fun e!242830 () Bool)

(declare-fun +!1149 (ListLongMap!5715 tuple2!6802) ListLongMap!5715)

(assert (=> b!403319 (= e!242830 (= call!28471 (+!1149 call!28472 (tuple2!6803 k!794 v!412))))))

(declare-fun b!403320 () Bool)

(assert (=> b!403320 (= e!242830 (= call!28472 call!28471))))

(declare-fun minValue!515 () V!14639)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!188033 () array!24203)

(declare-datatypes ((ValueCell!4732 0))(
  ( (ValueCellFull!4732 (v!7367 V!14639)) (EmptyCell!4732) )
))
(declare-datatypes ((array!24205 0))(
  ( (array!24206 (arr!11552 (Array (_ BitVec 32) ValueCell!4732)) (size!11904 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24205)

(declare-fun zeroValue!515 () V!14639)

(declare-fun c!54860 () Bool)

(declare-fun bm!28468 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1083 (array!24203 array!24205 (_ BitVec 32) (_ BitVec 32) V!14639 V!14639 (_ BitVec 32) Int) ListLongMap!5715)

(assert (=> bm!28468 (= call!28471 (getCurrentListMapNoExtraKeys!1083 (ite c!54860 lt!188033 _keys!709) (ite c!54860 (array!24206 (store (arr!11552 _values!549) i!563 (ValueCellFull!4732 v!412)) (size!11904 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403321 () Bool)

(declare-fun res!232419 () Bool)

(assert (=> b!403321 (=> (not res!232419) (not e!242828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403321 (= res!232419 (validMask!0 mask!1025))))

(declare-fun b!403322 () Bool)

(declare-fun e!242831 () Bool)

(declare-fun e!242829 () Bool)

(declare-fun mapRes!16848 () Bool)

(assert (=> b!403322 (= e!242831 (and e!242829 mapRes!16848))))

(declare-fun condMapEmpty!16848 () Bool)

(declare-fun mapDefault!16848 () ValueCell!4732)

