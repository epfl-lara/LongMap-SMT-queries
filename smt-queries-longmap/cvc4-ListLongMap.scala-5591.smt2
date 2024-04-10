; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73334 () Bool)

(assert start!73334)

(declare-fun b_free!14249 () Bool)

(declare-fun b_next!14249 () Bool)

(assert (=> start!73334 (= b_free!14249 (not b_next!14249))))

(declare-fun tp!50251 () Bool)

(declare-fun b_and!23605 () Bool)

(assert (=> start!73334 (= tp!50251 b_and!23605)))

(declare-fun b!855634 () Bool)

(declare-fun e!477013 () Bool)

(declare-fun tp_is_empty!16385 () Bool)

(assert (=> b!855634 (= e!477013 tp_is_empty!16385)))

(declare-fun b!855635 () Bool)

(declare-fun e!477011 () Bool)

(assert (=> b!855635 (= e!477011 false)))

(declare-datatypes ((V!26893 0))(
  ( (V!26894 (val!8240 Int)) )
))
(declare-fun v!557 () V!26893)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10860 0))(
  ( (tuple2!10861 (_1!5441 (_ BitVec 64)) (_2!5441 V!26893)) )
))
(declare-datatypes ((List!16673 0))(
  ( (Nil!16670) (Cons!16669 (h!17800 tuple2!10860) (t!23314 List!16673)) )
))
(declare-datatypes ((ListLongMap!9629 0))(
  ( (ListLongMap!9630 (toList!4830 List!16673)) )
))
(declare-fun lt!385734 () ListLongMap!9629)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48966 0))(
  ( (array!48967 (arr!23514 (Array (_ BitVec 32) (_ BitVec 64))) (size!23954 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48966)

(declare-datatypes ((ValueCell!7753 0))(
  ( (ValueCellFull!7753 (v!10665 V!26893)) (EmptyCell!7753) )
))
(declare-datatypes ((array!48968 0))(
  ( (array!48969 (arr!23515 (Array (_ BitVec 32) ValueCell!7753)) (size!23955 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48968)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26893)

(declare-fun zeroValue!654 () V!26893)

(declare-fun getCurrentListMapNoExtraKeys!2811 (array!48966 array!48968 (_ BitVec 32) (_ BitVec 32) V!26893 V!26893 (_ BitVec 32) Int) ListLongMap!9629)

(assert (=> b!855635 (= lt!385734 (getCurrentListMapNoExtraKeys!2811 _keys!868 (array!48969 (store (arr!23515 _values!688) i!612 (ValueCellFull!7753 v!557)) (size!23955 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385735 () ListLongMap!9629)

(assert (=> b!855635 (= lt!385735 (getCurrentListMapNoExtraKeys!2811 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855636 () Bool)

(declare-fun res!581102 () Bool)

(assert (=> b!855636 (=> (not res!581102) (not e!477011))))

(assert (=> b!855636 (= res!581102 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23954 _keys!868))))))

(declare-fun b!855637 () Bool)

(declare-fun res!581099 () Bool)

(assert (=> b!855637 (=> (not res!581099) (not e!477011))))

(declare-datatypes ((List!16674 0))(
  ( (Nil!16671) (Cons!16670 (h!17801 (_ BitVec 64)) (t!23315 List!16674)) )
))
(declare-fun arrayNoDuplicates!0 (array!48966 (_ BitVec 32) List!16674) Bool)

(assert (=> b!855637 (= res!581099 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16671))))

(declare-fun res!581105 () Bool)

(assert (=> start!73334 (=> (not res!581105) (not e!477011))))

(assert (=> start!73334 (= res!581105 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23954 _keys!868))))))

(assert (=> start!73334 e!477011))

(assert (=> start!73334 tp_is_empty!16385))

(assert (=> start!73334 true))

(assert (=> start!73334 tp!50251))

(declare-fun array_inv!18632 (array!48966) Bool)

(assert (=> start!73334 (array_inv!18632 _keys!868)))

(declare-fun e!477010 () Bool)

(declare-fun array_inv!18633 (array!48968) Bool)

(assert (=> start!73334 (and (array_inv!18633 _values!688) e!477010)))

(declare-fun b!855638 () Bool)

(declare-fun res!581101 () Bool)

(assert (=> b!855638 (=> (not res!581101) (not e!477011))))

(assert (=> b!855638 (= res!581101 (and (= (size!23955 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23954 _keys!868) (size!23955 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855639 () Bool)

(declare-fun res!581104 () Bool)

(assert (=> b!855639 (=> (not res!581104) (not e!477011))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!855639 (= res!581104 (and (= (select (arr!23514 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855640 () Bool)

(declare-fun res!581103 () Bool)

(assert (=> b!855640 (=> (not res!581103) (not e!477011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855640 (= res!581103 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26177 () Bool)

(declare-fun mapRes!26177 () Bool)

(assert (=> mapIsEmpty!26177 mapRes!26177))

(declare-fun b!855641 () Bool)

(declare-fun res!581098 () Bool)

(assert (=> b!855641 (=> (not res!581098) (not e!477011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855641 (= res!581098 (validKeyInArray!0 k!854))))

(declare-fun b!855642 () Bool)

(declare-fun res!581100 () Bool)

(assert (=> b!855642 (=> (not res!581100) (not e!477011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48966 (_ BitVec 32)) Bool)

(assert (=> b!855642 (= res!581100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855643 () Bool)

(declare-fun e!477012 () Bool)

(assert (=> b!855643 (= e!477012 tp_is_empty!16385)))

(declare-fun b!855644 () Bool)

(assert (=> b!855644 (= e!477010 (and e!477012 mapRes!26177))))

(declare-fun condMapEmpty!26177 () Bool)

(declare-fun mapDefault!26177 () ValueCell!7753)

