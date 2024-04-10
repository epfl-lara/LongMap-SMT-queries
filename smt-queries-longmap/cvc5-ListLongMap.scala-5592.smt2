; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73336 () Bool)

(assert start!73336)

(declare-fun b_free!14251 () Bool)

(declare-fun b_next!14251 () Bool)

(assert (=> start!73336 (= b_free!14251 (not b_next!14251))))

(declare-fun tp!50257 () Bool)

(declare-fun b_and!23607 () Bool)

(assert (=> start!73336 (= tp!50257 b_and!23607)))

(declare-fun b!855667 () Bool)

(declare-fun e!477024 () Bool)

(assert (=> b!855667 (= e!477024 false)))

(declare-datatypes ((V!26897 0))(
  ( (V!26898 (val!8241 Int)) )
))
(declare-fun v!557 () V!26897)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48970 0))(
  ( (array!48971 (arr!23516 (Array (_ BitVec 32) (_ BitVec 64))) (size!23956 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48970)

(declare-datatypes ((tuple2!10862 0))(
  ( (tuple2!10863 (_1!5442 (_ BitVec 64)) (_2!5442 V!26897)) )
))
(declare-datatypes ((List!16675 0))(
  ( (Nil!16672) (Cons!16671 (h!17802 tuple2!10862) (t!23316 List!16675)) )
))
(declare-datatypes ((ListLongMap!9631 0))(
  ( (ListLongMap!9632 (toList!4831 List!16675)) )
))
(declare-fun lt!385741 () ListLongMap!9631)

(declare-datatypes ((ValueCell!7754 0))(
  ( (ValueCellFull!7754 (v!10666 V!26897)) (EmptyCell!7754) )
))
(declare-datatypes ((array!48972 0))(
  ( (array!48973 (arr!23517 (Array (_ BitVec 32) ValueCell!7754)) (size!23957 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48972)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26897)

(declare-fun zeroValue!654 () V!26897)

(declare-fun getCurrentListMapNoExtraKeys!2812 (array!48970 array!48972 (_ BitVec 32) (_ BitVec 32) V!26897 V!26897 (_ BitVec 32) Int) ListLongMap!9631)

(assert (=> b!855667 (= lt!385741 (getCurrentListMapNoExtraKeys!2812 _keys!868 (array!48973 (store (arr!23517 _values!688) i!612 (ValueCellFull!7754 v!557)) (size!23957 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385740 () ListLongMap!9631)

(assert (=> b!855667 (= lt!385740 (getCurrentListMapNoExtraKeys!2812 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855668 () Bool)

(declare-fun e!477027 () Bool)

(declare-fun tp_is_empty!16387 () Bool)

(assert (=> b!855668 (= e!477027 tp_is_empty!16387)))

(declare-fun b!855669 () Bool)

(declare-fun res!581129 () Bool)

(assert (=> b!855669 (=> (not res!581129) (not e!477024))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855669 (= res!581129 (validKeyInArray!0 k!854))))

(declare-fun b!855670 () Bool)

(declare-fun res!581125 () Bool)

(assert (=> b!855670 (=> (not res!581125) (not e!477024))))

(assert (=> b!855670 (= res!581125 (and (= (size!23957 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23956 _keys!868) (size!23957 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26180 () Bool)

(declare-fun mapRes!26180 () Bool)

(assert (=> mapIsEmpty!26180 mapRes!26180))

(declare-fun b!855671 () Bool)

(declare-fun res!581123 () Bool)

(assert (=> b!855671 (=> (not res!581123) (not e!477024))))

(assert (=> b!855671 (= res!581123 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23956 _keys!868))))))

(declare-fun b!855672 () Bool)

(declare-fun res!581124 () Bool)

(assert (=> b!855672 (=> (not res!581124) (not e!477024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48970 (_ BitVec 32)) Bool)

(assert (=> b!855672 (= res!581124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!581128 () Bool)

(assert (=> start!73336 (=> (not res!581128) (not e!477024))))

(assert (=> start!73336 (= res!581128 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23956 _keys!868))))))

(assert (=> start!73336 e!477024))

(assert (=> start!73336 tp_is_empty!16387))

(assert (=> start!73336 true))

(assert (=> start!73336 tp!50257))

(declare-fun array_inv!18634 (array!48970) Bool)

(assert (=> start!73336 (array_inv!18634 _keys!868)))

(declare-fun e!477026 () Bool)

(declare-fun array_inv!18635 (array!48972) Bool)

(assert (=> start!73336 (and (array_inv!18635 _values!688) e!477026)))

(declare-fun b!855673 () Bool)

(declare-fun e!477025 () Bool)

(assert (=> b!855673 (= e!477025 tp_is_empty!16387)))

(declare-fun b!855674 () Bool)

(declare-fun res!581127 () Bool)

(assert (=> b!855674 (=> (not res!581127) (not e!477024))))

(assert (=> b!855674 (= res!581127 (and (= (select (arr!23516 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855675 () Bool)

(declare-fun res!581126 () Bool)

(assert (=> b!855675 (=> (not res!581126) (not e!477024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855675 (= res!581126 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26180 () Bool)

(declare-fun tp!50256 () Bool)

(assert (=> mapNonEmpty!26180 (= mapRes!26180 (and tp!50256 e!477025))))

(declare-fun mapKey!26180 () (_ BitVec 32))

(declare-fun mapRest!26180 () (Array (_ BitVec 32) ValueCell!7754))

(declare-fun mapValue!26180 () ValueCell!7754)

(assert (=> mapNonEmpty!26180 (= (arr!23517 _values!688) (store mapRest!26180 mapKey!26180 mapValue!26180))))

(declare-fun b!855676 () Bool)

(declare-fun res!581122 () Bool)

(assert (=> b!855676 (=> (not res!581122) (not e!477024))))

(declare-datatypes ((List!16676 0))(
  ( (Nil!16673) (Cons!16672 (h!17803 (_ BitVec 64)) (t!23317 List!16676)) )
))
(declare-fun arrayNoDuplicates!0 (array!48970 (_ BitVec 32) List!16676) Bool)

(assert (=> b!855676 (= res!581122 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16673))))

(declare-fun b!855677 () Bool)

(assert (=> b!855677 (= e!477026 (and e!477027 mapRes!26180))))

(declare-fun condMapEmpty!26180 () Bool)

(declare-fun mapDefault!26180 () ValueCell!7754)

