; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73150 () Bool)

(assert start!73150)

(declare-fun b_free!14065 () Bool)

(declare-fun b_next!14065 () Bool)

(assert (=> start!73150 (= b_free!14065 (not b_next!14065))))

(declare-fun tp!49699 () Bool)

(declare-fun b_and!23289 () Bool)

(assert (=> start!73150 (= tp!49699 b_and!23289)))

(declare-fun b!851682 () Bool)

(declare-fun res!578502 () Bool)

(declare-fun e!475042 () Bool)

(assert (=> b!851682 (=> (not res!578502) (not e!475042))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48600 0))(
  ( (array!48601 (arr!23331 (Array (_ BitVec 32) (_ BitVec 64))) (size!23771 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48600)

(declare-datatypes ((V!26649 0))(
  ( (V!26650 (val!8148 Int)) )
))
(declare-datatypes ((ValueCell!7661 0))(
  ( (ValueCellFull!7661 (v!10573 V!26649)) (EmptyCell!7661) )
))
(declare-datatypes ((array!48602 0))(
  ( (array!48603 (arr!23332 (Array (_ BitVec 32) ValueCell!7661)) (size!23772 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48602)

(assert (=> b!851682 (= res!578502 (and (= (size!23772 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23771 _keys!868) (size!23772 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25901 () Bool)

(declare-fun mapRes!25901 () Bool)

(assert (=> mapIsEmpty!25901 mapRes!25901))

(declare-fun b!851683 () Bool)

(declare-fun res!578501 () Bool)

(assert (=> b!851683 (=> (not res!578501) (not e!475042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48600 (_ BitVec 32)) Bool)

(assert (=> b!851683 (= res!578501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10690 0))(
  ( (tuple2!10691 (_1!5356 (_ BitVec 64)) (_2!5356 V!26649)) )
))
(declare-datatypes ((List!16526 0))(
  ( (Nil!16523) (Cons!16522 (h!17653 tuple2!10690) (t!23037 List!16526)) )
))
(declare-datatypes ((ListLongMap!9459 0))(
  ( (ListLongMap!9460 (toList!4745 List!16526)) )
))
(declare-fun call!38050 () ListLongMap!9459)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26649)

(declare-fun zeroValue!654 () V!26649)

(declare-fun bm!38047 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2727 (array!48600 array!48602 (_ BitVec 32) (_ BitVec 32) V!26649 V!26649 (_ BitVec 32) Int) ListLongMap!9459)

(assert (=> bm!38047 (= call!38050 (getCurrentListMapNoExtraKeys!2727 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851684 () Bool)

(declare-fun e!475048 () Bool)

(assert (=> b!851684 (= e!475042 e!475048)))

(declare-fun res!578505 () Bool)

(assert (=> b!851684 (=> (not res!578505) (not e!475048))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851684 (= res!578505 (= from!1053 i!612))))

(declare-fun lt!383619 () ListLongMap!9459)

(declare-fun lt!383615 () array!48602)

(assert (=> b!851684 (= lt!383619 (getCurrentListMapNoExtraKeys!2727 _keys!868 lt!383615 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26649)

(assert (=> b!851684 (= lt!383615 (array!48603 (store (arr!23332 _values!688) i!612 (ValueCellFull!7661 v!557)) (size!23772 _values!688)))))

(declare-fun lt!383616 () ListLongMap!9459)

(assert (=> b!851684 (= lt!383616 (getCurrentListMapNoExtraKeys!2727 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25901 () Bool)

(declare-fun tp!49698 () Bool)

(declare-fun e!475045 () Bool)

(assert (=> mapNonEmpty!25901 (= mapRes!25901 (and tp!49698 e!475045))))

(declare-fun mapValue!25901 () ValueCell!7661)

(declare-fun mapRest!25901 () (Array (_ BitVec 32) ValueCell!7661))

(declare-fun mapKey!25901 () (_ BitVec 32))

(assert (=> mapNonEmpty!25901 (= (arr!23332 _values!688) (store mapRest!25901 mapKey!25901 mapValue!25901))))

(declare-fun res!578506 () Bool)

(assert (=> start!73150 (=> (not res!578506) (not e!475042))))

(assert (=> start!73150 (= res!578506 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23771 _keys!868))))))

(assert (=> start!73150 e!475042))

(declare-fun tp_is_empty!16201 () Bool)

(assert (=> start!73150 tp_is_empty!16201))

(assert (=> start!73150 true))

(assert (=> start!73150 tp!49699))

(declare-fun array_inv!18506 (array!48600) Bool)

(assert (=> start!73150 (array_inv!18506 _keys!868)))

(declare-fun e!475046 () Bool)

(declare-fun array_inv!18507 (array!48602) Bool)

(assert (=> start!73150 (and (array_inv!18507 _values!688) e!475046)))

(declare-fun b!851685 () Bool)

(declare-fun res!578498 () Bool)

(assert (=> b!851685 (=> (not res!578498) (not e!475042))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!851685 (= res!578498 (and (= (select (arr!23331 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!851686 () Bool)

(declare-fun res!578499 () Bool)

(assert (=> b!851686 (=> (not res!578499) (not e!475042))))

(declare-datatypes ((List!16527 0))(
  ( (Nil!16524) (Cons!16523 (h!17654 (_ BitVec 64)) (t!23038 List!16527)) )
))
(declare-fun arrayNoDuplicates!0 (array!48600 (_ BitVec 32) List!16527) Bool)

(assert (=> b!851686 (= res!578499 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16524))))

(declare-fun call!38051 () ListLongMap!9459)

(declare-fun bm!38048 () Bool)

(assert (=> bm!38048 (= call!38051 (getCurrentListMapNoExtraKeys!2727 _keys!868 lt!383615 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851687 () Bool)

(declare-fun e!475043 () Bool)

(assert (=> b!851687 (= e!475043 (= call!38051 call!38050))))

(declare-fun b!851688 () Bool)

(declare-fun +!2144 (ListLongMap!9459 tuple2!10690) ListLongMap!9459)

(assert (=> b!851688 (= e!475043 (= call!38051 (+!2144 call!38050 (tuple2!10691 k!854 v!557))))))

(declare-fun b!851689 () Bool)

(assert (=> b!851689 (= e!475045 tp_is_empty!16201)))

(declare-fun b!851690 () Bool)

(declare-fun res!578507 () Bool)

(assert (=> b!851690 (=> (not res!578507) (not e!475042))))

(assert (=> b!851690 (= res!578507 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23771 _keys!868))))))

(declare-fun b!851691 () Bool)

(declare-fun e!475041 () Bool)

(assert (=> b!851691 (= e!475046 (and e!475041 mapRes!25901))))

(declare-fun condMapEmpty!25901 () Bool)

(declare-fun mapDefault!25901 () ValueCell!7661)

