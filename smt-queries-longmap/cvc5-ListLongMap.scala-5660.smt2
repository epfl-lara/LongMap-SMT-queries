; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73744 () Bool)

(assert start!73744)

(declare-fun b_free!14659 () Bool)

(declare-fun b_next!14659 () Bool)

(assert (=> start!73744 (= b_free!14659 (not b_next!14659))))

(declare-fun tp!51481 () Bool)

(declare-fun b_and!24297 () Bool)

(assert (=> start!73744 (= tp!51481 b_and!24297)))

(declare-fun b!864725 () Bool)

(declare-fun res!587574 () Bool)

(declare-fun e!481724 () Bool)

(assert (=> b!864725 (=> (not res!587574) (not e!481724))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49750 0))(
  ( (array!49751 (arr!23906 (Array (_ BitVec 32) (_ BitVec 64))) (size!24346 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49750)

(declare-datatypes ((V!27441 0))(
  ( (V!27442 (val!8445 Int)) )
))
(declare-datatypes ((ValueCell!7958 0))(
  ( (ValueCellFull!7958 (v!10870 V!27441)) (EmptyCell!7958) )
))
(declare-datatypes ((array!49752 0))(
  ( (array!49753 (arr!23907 (Array (_ BitVec 32) ValueCell!7958)) (size!24347 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49752)

(assert (=> b!864725 (= res!587574 (and (= (size!24347 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24346 _keys!868) (size!24347 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864726 () Bool)

(declare-fun e!481721 () Bool)

(declare-fun e!481727 () Bool)

(assert (=> b!864726 (= e!481721 e!481727)))

(declare-fun res!587573 () Bool)

(assert (=> b!864726 (=> res!587573 e!481727)))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864726 (= res!587573 (= k!854 (select (arr!23906 _keys!868) from!1053)))))

(assert (=> b!864726 (not (= (select (arr!23906 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29593 0))(
  ( (Unit!29594) )
))
(declare-fun lt!391466 () Unit!29593)

(declare-fun e!481728 () Unit!29593)

(assert (=> b!864726 (= lt!391466 e!481728)))

(declare-fun c!92209 () Bool)

(assert (=> b!864726 (= c!92209 (= (select (arr!23906 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11186 0))(
  ( (tuple2!11187 (_1!5604 (_ BitVec 64)) (_2!5604 V!27441)) )
))
(declare-datatypes ((List!16990 0))(
  ( (Nil!16987) (Cons!16986 (h!18117 tuple2!11186) (t!23915 List!16990)) )
))
(declare-datatypes ((ListLongMap!9955 0))(
  ( (ListLongMap!9956 (toList!4993 List!16990)) )
))
(declare-fun lt!391475 () ListLongMap!9955)

(declare-fun lt!391472 () ListLongMap!9955)

(assert (=> b!864726 (= lt!391475 lt!391472)))

(declare-fun lt!391479 () ListLongMap!9955)

(declare-fun lt!391477 () tuple2!11186)

(declare-fun +!2342 (ListLongMap!9955 tuple2!11186) ListLongMap!9955)

(assert (=> b!864726 (= lt!391472 (+!2342 lt!391479 lt!391477))))

(declare-fun lt!391470 () V!27441)

(assert (=> b!864726 (= lt!391477 (tuple2!11187 (select (arr!23906 _keys!868) from!1053) lt!391470))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12631 (ValueCell!7958 V!27441) V!27441)

(declare-fun dynLambda!1167 (Int (_ BitVec 64)) V!27441)

(assert (=> b!864726 (= lt!391470 (get!12631 (select (arr!23907 _values!688) from!1053) (dynLambda!1167 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864727 () Bool)

(declare-fun res!587579 () Bool)

(assert (=> b!864727 (=> (not res!587579) (not e!481724))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864727 (= res!587579 (and (= (select (arr!23906 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!864728 () Bool)

(declare-fun res!587582 () Bool)

(assert (=> b!864728 (=> (not res!587582) (not e!481724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864728 (= res!587582 (validMask!0 mask!1196))))

(declare-fun b!864729 () Bool)

(declare-fun e!481726 () Bool)

(declare-fun e!481725 () Bool)

(declare-fun mapRes!26792 () Bool)

(assert (=> b!864729 (= e!481726 (and e!481725 mapRes!26792))))

(declare-fun condMapEmpty!26792 () Bool)

(declare-fun mapDefault!26792 () ValueCell!7958)

