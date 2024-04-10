; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73768 () Bool)

(assert start!73768)

(declare-fun b_free!14683 () Bool)

(declare-fun b_next!14683 () Bool)

(assert (=> start!73768 (= b_free!14683 (not b_next!14683))))

(declare-fun tp!51552 () Bool)

(declare-fun b_and!24345 () Bool)

(assert (=> start!73768 (= tp!51552 b_and!24345)))

(declare-fun b!865325 () Bool)

(declare-fun e!482051 () Bool)

(declare-fun tp_is_empty!16819 () Bool)

(assert (=> b!865325 (= e!482051 tp_is_empty!16819)))

(declare-fun b!865326 () Bool)

(declare-fun res!587974 () Bool)

(declare-fun e!482052 () Bool)

(assert (=> b!865326 (=> (not res!587974) (not e!482052))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865326 (= res!587974 (validKeyInArray!0 k!854))))

(declare-fun b!865327 () Bool)

(declare-fun res!587975 () Bool)

(assert (=> b!865327 (=> (not res!587975) (not e!482052))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49798 0))(
  ( (array!49799 (arr!23930 (Array (_ BitVec 32) (_ BitVec 64))) (size!24370 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49798)

(declare-datatypes ((V!27473 0))(
  ( (V!27474 (val!8457 Int)) )
))
(declare-datatypes ((ValueCell!7970 0))(
  ( (ValueCellFull!7970 (v!10882 V!27473)) (EmptyCell!7970) )
))
(declare-datatypes ((array!49800 0))(
  ( (array!49801 (arr!23931 (Array (_ BitVec 32) ValueCell!7970)) (size!24371 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49800)

(assert (=> b!865327 (= res!587975 (and (= (size!24371 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24370 _keys!868) (size!24371 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865328 () Bool)

(declare-fun res!587968 () Bool)

(assert (=> b!865328 (=> (not res!587968) (not e!482052))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865328 (= res!587968 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24370 _keys!868))))))

(declare-fun b!865329 () Bool)

(declare-fun e!482049 () Bool)

(declare-fun mapRes!26828 () Bool)

(assert (=> b!865329 (= e!482049 (and e!482051 mapRes!26828))))

(declare-fun condMapEmpty!26828 () Bool)

(declare-fun mapDefault!26828 () ValueCell!7970)

