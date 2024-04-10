; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73312 () Bool)

(assert start!73312)

(declare-fun b_free!14227 () Bool)

(declare-fun b_next!14227 () Bool)

(assert (=> start!73312 (= b_free!14227 (not b_next!14227))))

(declare-fun tp!50184 () Bool)

(declare-fun b_and!23583 () Bool)

(assert (=> start!73312 (= tp!50184 b_and!23583)))

(declare-fun b!855271 () Bool)

(declare-fun res!580840 () Bool)

(declare-fun e!476844 () Bool)

(assert (=> b!855271 (=> (not res!580840) (not e!476844))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48922 0))(
  ( (array!48923 (arr!23492 (Array (_ BitVec 32) (_ BitVec 64))) (size!23932 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48922)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855271 (= res!580840 (and (= (select (arr!23492 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855272 () Bool)

(declare-fun res!580838 () Bool)

(assert (=> b!855272 (=> (not res!580838) (not e!476844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855272 (= res!580838 (validKeyInArray!0 k!854))))

(declare-fun b!855273 () Bool)

(declare-fun res!580837 () Bool)

(assert (=> b!855273 (=> (not res!580837) (not e!476844))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48922 (_ BitVec 32)) Bool)

(assert (=> b!855273 (= res!580837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855274 () Bool)

(declare-fun res!580841 () Bool)

(assert (=> b!855274 (=> (not res!580841) (not e!476844))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26865 0))(
  ( (V!26866 (val!8229 Int)) )
))
(declare-datatypes ((ValueCell!7742 0))(
  ( (ValueCellFull!7742 (v!10654 V!26865)) (EmptyCell!7742) )
))
(declare-datatypes ((array!48924 0))(
  ( (array!48925 (arr!23493 (Array (_ BitVec 32) ValueCell!7742)) (size!23933 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48924)

(assert (=> b!855274 (= res!580841 (and (= (size!23933 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23932 _keys!868) (size!23933 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855275 () Bool)

(declare-fun res!580835 () Bool)

(assert (=> b!855275 (=> (not res!580835) (not e!476844))))

(assert (=> b!855275 (= res!580835 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23932 _keys!868))))))

(declare-fun b!855277 () Bool)

(declare-fun e!476847 () Bool)

(declare-fun tp_is_empty!16363 () Bool)

(assert (=> b!855277 (= e!476847 tp_is_empty!16363)))

(declare-fun b!855278 () Bool)

(declare-fun e!476845 () Bool)

(assert (=> b!855278 (= e!476845 tp_is_empty!16363)))

(declare-fun b!855279 () Bool)

(declare-fun e!476848 () Bool)

(declare-fun mapRes!26144 () Bool)

(assert (=> b!855279 (= e!476848 (and e!476847 mapRes!26144))))

(declare-fun condMapEmpty!26144 () Bool)

(declare-fun mapDefault!26144 () ValueCell!7742)

