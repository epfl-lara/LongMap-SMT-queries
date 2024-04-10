; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73316 () Bool)

(assert start!73316)

(declare-fun b_free!14231 () Bool)

(declare-fun b_next!14231 () Bool)

(assert (=> start!73316 (= b_free!14231 (not b_next!14231))))

(declare-fun tp!50197 () Bool)

(declare-fun b_and!23587 () Bool)

(assert (=> start!73316 (= tp!50197 b_and!23587)))

(declare-fun b!855337 () Bool)

(declare-fun res!580882 () Bool)

(declare-fun e!476874 () Bool)

(assert (=> b!855337 (=> (not res!580882) (not e!476874))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48930 0))(
  ( (array!48931 (arr!23496 (Array (_ BitVec 32) (_ BitVec 64))) (size!23936 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48930)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855337 (= res!580882 (and (= (select (arr!23496 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855338 () Bool)

(declare-fun res!580884 () Bool)

(assert (=> b!855338 (=> (not res!580884) (not e!476874))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855338 (= res!580884 (validMask!0 mask!1196))))

(declare-fun b!855339 () Bool)

(declare-fun res!580889 () Bool)

(assert (=> b!855339 (=> (not res!580889) (not e!476874))))

(declare-datatypes ((V!26869 0))(
  ( (V!26870 (val!8231 Int)) )
))
(declare-datatypes ((ValueCell!7744 0))(
  ( (ValueCellFull!7744 (v!10656 V!26869)) (EmptyCell!7744) )
))
(declare-datatypes ((array!48932 0))(
  ( (array!48933 (arr!23497 (Array (_ BitVec 32) ValueCell!7744)) (size!23937 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48932)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!855339 (= res!580889 (and (= (size!23937 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23936 _keys!868) (size!23937 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855340 () Bool)

(declare-fun res!580883 () Bool)

(assert (=> b!855340 (=> (not res!580883) (not e!476874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48930 (_ BitVec 32)) Bool)

(assert (=> b!855340 (= res!580883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855341 () Bool)

(declare-fun res!580887 () Bool)

(assert (=> b!855341 (=> (not res!580887) (not e!476874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855341 (= res!580887 (validKeyInArray!0 k!854))))

(declare-fun b!855343 () Bool)

(declare-fun res!580886 () Bool)

(assert (=> b!855343 (=> (not res!580886) (not e!476874))))

(assert (=> b!855343 (= res!580886 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23936 _keys!868))))))

(declare-fun b!855344 () Bool)

(declare-fun res!580885 () Bool)

(assert (=> b!855344 (=> (not res!580885) (not e!476874))))

(declare-datatypes ((List!16658 0))(
  ( (Nil!16655) (Cons!16654 (h!17785 (_ BitVec 64)) (t!23299 List!16658)) )
))
(declare-fun arrayNoDuplicates!0 (array!48930 (_ BitVec 32) List!16658) Bool)

(assert (=> b!855344 (= res!580885 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16655))))

(declare-fun b!855345 () Bool)

(assert (=> b!855345 (= e!476874 false)))

(declare-datatypes ((tuple2!10846 0))(
  ( (tuple2!10847 (_1!5434 (_ BitVec 64)) (_2!5434 V!26869)) )
))
(declare-datatypes ((List!16659 0))(
  ( (Nil!16656) (Cons!16655 (h!17786 tuple2!10846) (t!23300 List!16659)) )
))
(declare-datatypes ((ListLongMap!9615 0))(
  ( (ListLongMap!9616 (toList!4823 List!16659)) )
))
(declare-fun lt!385681 () ListLongMap!9615)

(declare-fun v!557 () V!26869)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26869)

(declare-fun zeroValue!654 () V!26869)

(declare-fun getCurrentListMapNoExtraKeys!2804 (array!48930 array!48932 (_ BitVec 32) (_ BitVec 32) V!26869 V!26869 (_ BitVec 32) Int) ListLongMap!9615)

(assert (=> b!855345 (= lt!385681 (getCurrentListMapNoExtraKeys!2804 _keys!868 (array!48933 (store (arr!23497 _values!688) i!612 (ValueCellFull!7744 v!557)) (size!23937 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385680 () ListLongMap!9615)

(assert (=> b!855345 (= lt!385680 (getCurrentListMapNoExtraKeys!2804 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855346 () Bool)

(declare-fun e!476875 () Bool)

(declare-fun e!476876 () Bool)

(declare-fun mapRes!26150 () Bool)

(assert (=> b!855346 (= e!476875 (and e!476876 mapRes!26150))))

(declare-fun condMapEmpty!26150 () Bool)

(declare-fun mapDefault!26150 () ValueCell!7744)

