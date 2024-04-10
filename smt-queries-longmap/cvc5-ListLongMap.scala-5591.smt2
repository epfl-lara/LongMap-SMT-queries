; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73330 () Bool)

(assert start!73330)

(declare-fun b_free!14245 () Bool)

(declare-fun b_next!14245 () Bool)

(assert (=> start!73330 (= b_free!14245 (not b_next!14245))))

(declare-fun tp!50239 () Bool)

(declare-fun b_and!23601 () Bool)

(assert (=> start!73330 (= tp!50239 b_and!23601)))

(declare-fun b!855568 () Bool)

(declare-fun res!581055 () Bool)

(declare-fun e!476983 () Bool)

(assert (=> b!855568 (=> (not res!581055) (not e!476983))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855568 (= res!581055 (validMask!0 mask!1196))))

(declare-fun b!855569 () Bool)

(declare-fun res!581053 () Bool)

(assert (=> b!855569 (=> (not res!581053) (not e!476983))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855569 (= res!581053 (validKeyInArray!0 k!854))))

(declare-fun b!855570 () Bool)

(declare-fun res!581052 () Bool)

(assert (=> b!855570 (=> (not res!581052) (not e!476983))))

(declare-datatypes ((array!48958 0))(
  ( (array!48959 (arr!23510 (Array (_ BitVec 32) (_ BitVec 64))) (size!23950 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48958)

(declare-datatypes ((List!16669 0))(
  ( (Nil!16666) (Cons!16665 (h!17796 (_ BitVec 64)) (t!23310 List!16669)) )
))
(declare-fun arrayNoDuplicates!0 (array!48958 (_ BitVec 32) List!16669) Bool)

(assert (=> b!855570 (= res!581052 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16666))))

(declare-fun b!855571 () Bool)

(declare-fun res!581051 () Bool)

(assert (=> b!855571 (=> (not res!581051) (not e!476983))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855571 (= res!581051 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23950 _keys!868))))))

(declare-fun mapNonEmpty!26171 () Bool)

(declare-fun mapRes!26171 () Bool)

(declare-fun tp!50238 () Bool)

(declare-fun e!476981 () Bool)

(assert (=> mapNonEmpty!26171 (= mapRes!26171 (and tp!50238 e!476981))))

(declare-datatypes ((V!26889 0))(
  ( (V!26890 (val!8238 Int)) )
))
(declare-datatypes ((ValueCell!7751 0))(
  ( (ValueCellFull!7751 (v!10663 V!26889)) (EmptyCell!7751) )
))
(declare-fun mapValue!26171 () ValueCell!7751)

(declare-fun mapRest!26171 () (Array (_ BitVec 32) ValueCell!7751))

(declare-fun mapKey!26171 () (_ BitVec 32))

(declare-datatypes ((array!48960 0))(
  ( (array!48961 (arr!23511 (Array (_ BitVec 32) ValueCell!7751)) (size!23951 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48960)

(assert (=> mapNonEmpty!26171 (= (arr!23511 _values!688) (store mapRest!26171 mapKey!26171 mapValue!26171))))

(declare-fun b!855572 () Bool)

(declare-fun res!581050 () Bool)

(assert (=> b!855572 (=> (not res!581050) (not e!476983))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855572 (= res!581050 (and (= (select (arr!23510 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855573 () Bool)

(assert (=> b!855573 (= e!476983 false)))

(declare-fun v!557 () V!26889)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10856 0))(
  ( (tuple2!10857 (_1!5439 (_ BitVec 64)) (_2!5439 V!26889)) )
))
(declare-datatypes ((List!16670 0))(
  ( (Nil!16667) (Cons!16666 (h!17797 tuple2!10856) (t!23311 List!16670)) )
))
(declare-datatypes ((ListLongMap!9625 0))(
  ( (ListLongMap!9626 (toList!4828 List!16670)) )
))
(declare-fun lt!385723 () ListLongMap!9625)

(declare-fun minValue!654 () V!26889)

(declare-fun zeroValue!654 () V!26889)

(declare-fun getCurrentListMapNoExtraKeys!2809 (array!48958 array!48960 (_ BitVec 32) (_ BitVec 32) V!26889 V!26889 (_ BitVec 32) Int) ListLongMap!9625)

(assert (=> b!855573 (= lt!385723 (getCurrentListMapNoExtraKeys!2809 _keys!868 (array!48961 (store (arr!23511 _values!688) i!612 (ValueCellFull!7751 v!557)) (size!23951 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385722 () ListLongMap!9625)

(assert (=> b!855573 (= lt!385722 (getCurrentListMapNoExtraKeys!2809 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581056 () Bool)

(assert (=> start!73330 (=> (not res!581056) (not e!476983))))

(assert (=> start!73330 (= res!581056 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23950 _keys!868))))))

(assert (=> start!73330 e!476983))

(declare-fun tp_is_empty!16381 () Bool)

(assert (=> start!73330 tp_is_empty!16381))

(assert (=> start!73330 true))

(assert (=> start!73330 tp!50239))

(declare-fun array_inv!18628 (array!48958) Bool)

(assert (=> start!73330 (array_inv!18628 _keys!868)))

(declare-fun e!476979 () Bool)

(declare-fun array_inv!18629 (array!48960) Bool)

(assert (=> start!73330 (and (array_inv!18629 _values!688) e!476979)))

(declare-fun mapIsEmpty!26171 () Bool)

(assert (=> mapIsEmpty!26171 mapRes!26171))

(declare-fun b!855574 () Bool)

(assert (=> b!855574 (= e!476981 tp_is_empty!16381)))

(declare-fun b!855575 () Bool)

(declare-fun res!581057 () Bool)

(assert (=> b!855575 (=> (not res!581057) (not e!476983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48958 (_ BitVec 32)) Bool)

(assert (=> b!855575 (= res!581057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855576 () Bool)

(declare-fun e!476980 () Bool)

(assert (=> b!855576 (= e!476980 tp_is_empty!16381)))

(declare-fun b!855577 () Bool)

(declare-fun res!581054 () Bool)

(assert (=> b!855577 (=> (not res!581054) (not e!476983))))

(assert (=> b!855577 (= res!581054 (and (= (size!23951 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23950 _keys!868) (size!23951 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855578 () Bool)

(assert (=> b!855578 (= e!476979 (and e!476980 mapRes!26171))))

(declare-fun condMapEmpty!26171 () Bool)

(declare-fun mapDefault!26171 () ValueCell!7751)

