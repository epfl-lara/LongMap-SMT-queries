; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73400 () Bool)

(assert start!73400)

(declare-fun b_free!14315 () Bool)

(declare-fun b_next!14315 () Bool)

(assert (=> start!73400 (= b_free!14315 (not b_next!14315))))

(declare-fun tp!50449 () Bool)

(declare-fun b_and!23671 () Bool)

(assert (=> start!73400 (= tp!50449 b_and!23671)))

(declare-fun b!856794 () Bool)

(declare-fun e!477575 () Bool)

(declare-fun tp_is_empty!16451 () Bool)

(assert (=> b!856794 (= e!477575 tp_is_empty!16451)))

(declare-fun res!581961 () Bool)

(declare-fun e!477577 () Bool)

(assert (=> start!73400 (=> (not res!581961) (not e!477577))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49094 0))(
  ( (array!49095 (arr!23578 (Array (_ BitVec 32) (_ BitVec 64))) (size!24018 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49094)

(assert (=> start!73400 (= res!581961 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24018 _keys!868))))))

(assert (=> start!73400 e!477577))

(assert (=> start!73400 tp_is_empty!16451))

(assert (=> start!73400 true))

(assert (=> start!73400 tp!50449))

(declare-fun array_inv!18674 (array!49094) Bool)

(assert (=> start!73400 (array_inv!18674 _keys!868)))

(declare-datatypes ((V!26981 0))(
  ( (V!26982 (val!8273 Int)) )
))
(declare-datatypes ((ValueCell!7786 0))(
  ( (ValueCellFull!7786 (v!10698 V!26981)) (EmptyCell!7786) )
))
(declare-datatypes ((array!49096 0))(
  ( (array!49097 (arr!23579 (Array (_ BitVec 32) ValueCell!7786)) (size!24019 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49096)

(declare-fun e!477579 () Bool)

(declare-fun array_inv!18675 (array!49096) Bool)

(assert (=> start!73400 (and (array_inv!18675 _values!688) e!477579)))

(declare-fun mapNonEmpty!26276 () Bool)

(declare-fun mapRes!26276 () Bool)

(declare-fun tp!50448 () Bool)

(assert (=> mapNonEmpty!26276 (= mapRes!26276 (and tp!50448 e!477575))))

(declare-fun mapValue!26276 () ValueCell!7786)

(declare-fun mapRest!26276 () (Array (_ BitVec 32) ValueCell!7786))

(declare-fun mapKey!26276 () (_ BitVec 32))

(assert (=> mapNonEmpty!26276 (= (arr!23579 _values!688) (store mapRest!26276 mapKey!26276 mapValue!26276))))

(declare-fun b!856795 () Bool)

(declare-fun e!477578 () Bool)

(assert (=> b!856795 (= e!477577 e!477578)))

(declare-fun res!581964 () Bool)

(assert (=> b!856795 (=> (not res!581964) (not e!477578))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856795 (= res!581964 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10910 0))(
  ( (tuple2!10911 (_1!5466 (_ BitVec 64)) (_2!5466 V!26981)) )
))
(declare-datatypes ((List!16720 0))(
  ( (Nil!16717) (Cons!16716 (h!17847 tuple2!10910) (t!23361 List!16720)) )
))
(declare-datatypes ((ListLongMap!9679 0))(
  ( (ListLongMap!9680 (toList!4855 List!16720)) )
))
(declare-fun lt!386077 () ListLongMap!9679)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26981)

(declare-fun zeroValue!654 () V!26981)

(declare-fun lt!386075 () array!49096)

(declare-fun getCurrentListMapNoExtraKeys!2836 (array!49094 array!49096 (_ BitVec 32) (_ BitVec 32) V!26981 V!26981 (_ BitVec 32) Int) ListLongMap!9679)

(assert (=> b!856795 (= lt!386077 (getCurrentListMapNoExtraKeys!2836 _keys!868 lt!386075 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26981)

(assert (=> b!856795 (= lt!386075 (array!49097 (store (arr!23579 _values!688) i!612 (ValueCellFull!7786 v!557)) (size!24019 _values!688)))))

(declare-fun lt!386076 () ListLongMap!9679)

(assert (=> b!856795 (= lt!386076 (getCurrentListMapNoExtraKeys!2836 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856796 () Bool)

(declare-fun res!581969 () Bool)

(assert (=> b!856796 (=> (not res!581969) (not e!477577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49094 (_ BitVec 32)) Bool)

(assert (=> b!856796 (= res!581969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856797 () Bool)

(declare-fun res!581963 () Bool)

(assert (=> b!856797 (=> (not res!581963) (not e!477577))))

(declare-datatypes ((List!16721 0))(
  ( (Nil!16718) (Cons!16717 (h!17848 (_ BitVec 64)) (t!23362 List!16721)) )
))
(declare-fun arrayNoDuplicates!0 (array!49094 (_ BitVec 32) List!16721) Bool)

(assert (=> b!856797 (= res!581963 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16718))))

(declare-fun b!856798 () Bool)

(declare-fun e!477580 () Bool)

(assert (=> b!856798 (= e!477579 (and e!477580 mapRes!26276))))

(declare-fun condMapEmpty!26276 () Bool)

(declare-fun mapDefault!26276 () ValueCell!7786)

