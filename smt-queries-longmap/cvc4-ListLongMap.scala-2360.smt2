; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37626 () Bool)

(assert start!37626)

(declare-fun b_free!8753 () Bool)

(declare-fun b_next!8753 () Bool)

(assert (=> start!37626 (= b_free!8753 (not b_next!8753))))

(declare-fun tp!30974 () Bool)

(declare-fun b_and!15995 () Bool)

(assert (=> start!37626 (= tp!30974 b_and!15995)))

(declare-fun b!385099 () Bool)

(declare-fun e!233736 () Bool)

(assert (=> b!385099 (= e!233736 true)))

(declare-datatypes ((V!13639 0))(
  ( (V!13640 (val!4745 Int)) )
))
(declare-datatypes ((tuple2!6392 0))(
  ( (tuple2!6393 (_1!3207 (_ BitVec 64)) (_2!3207 V!13639)) )
))
(declare-datatypes ((List!6227 0))(
  ( (Nil!6224) (Cons!6223 (h!7079 tuple2!6392) (t!11377 List!6227)) )
))
(declare-datatypes ((ListLongMap!5305 0))(
  ( (ListLongMap!5306 (toList!2668 List!6227)) )
))
(declare-fun lt!181404 () ListLongMap!5305)

(declare-fun lt!181409 () ListLongMap!5305)

(declare-fun lt!181403 () tuple2!6392)

(declare-fun +!1003 (ListLongMap!5305 tuple2!6392) ListLongMap!5305)

(assert (=> b!385099 (= lt!181404 (+!1003 lt!181409 lt!181403))))

(declare-fun lt!181405 () ListLongMap!5305)

(declare-fun lt!181410 () ListLongMap!5305)

(assert (=> b!385099 (= lt!181405 lt!181410)))

(declare-fun b!385100 () Bool)

(declare-fun res!219626 () Bool)

(declare-fun e!233739 () Bool)

(assert (=> b!385100 (=> (not res!219626) (not e!233739))))

(declare-datatypes ((ValueCell!4357 0))(
  ( (ValueCellFull!4357 (v!6942 V!13639)) (EmptyCell!4357) )
))
(declare-datatypes ((array!22703 0))(
  ( (array!22704 (arr!10820 (Array (_ BitVec 32) ValueCell!4357)) (size!11172 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22703)

(declare-datatypes ((array!22705 0))(
  ( (array!22706 (arr!10821 (Array (_ BitVec 32) (_ BitVec 64))) (size!11173 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22705)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385100 (= res!219626 (and (= (size!11172 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11173 _keys!658) (size!11172 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385101 () Bool)

(declare-fun e!233738 () Bool)

(declare-fun e!233737 () Bool)

(declare-fun mapRes!15666 () Bool)

(assert (=> b!385101 (= e!233738 (and e!233737 mapRes!15666))))

(declare-fun condMapEmpty!15666 () Bool)

(declare-fun mapDefault!15666 () ValueCell!4357)

