; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73676 () Bool)

(assert start!73676)

(declare-fun b_free!14591 () Bool)

(declare-fun b_next!14591 () Bool)

(assert (=> start!73676 (= b_free!14591 (not b_next!14591))))

(declare-fun tp!51277 () Bool)

(declare-fun b_and!24161 () Bool)

(assert (=> start!73676 (= tp!51277 b_and!24161)))

(declare-fun mapNonEmpty!26690 () Bool)

(declare-fun mapRes!26690 () Bool)

(declare-fun tp!51276 () Bool)

(declare-fun e!480806 () Bool)

(assert (=> mapNonEmpty!26690 (= mapRes!26690 (and tp!51276 e!480806))))

(declare-fun mapKey!26690 () (_ BitVec 32))

(declare-datatypes ((V!27349 0))(
  ( (V!27350 (val!8411 Int)) )
))
(declare-datatypes ((ValueCell!7924 0))(
  ( (ValueCellFull!7924 (v!10836 V!27349)) (EmptyCell!7924) )
))
(declare-fun mapValue!26690 () ValueCell!7924)

(declare-datatypes ((array!49616 0))(
  ( (array!49617 (arr!23839 (Array (_ BitVec 32) ValueCell!7924)) (size!24279 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49616)

(declare-fun mapRest!26690 () (Array (_ BitVec 32) ValueCell!7924))

(assert (=> mapNonEmpty!26690 (= (arr!23839 _values!688) (store mapRest!26690 mapKey!26690 mapValue!26690))))

(declare-fun b!863025 () Bool)

(declare-fun res!586452 () Bool)

(declare-fun e!480805 () Bool)

(assert (=> b!863025 (=> (not res!586452) (not e!480805))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49618 0))(
  ( (array!49619 (arr!23840 (Array (_ BitVec 32) (_ BitVec 64))) (size!24280 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49618)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!863025 (= res!586452 (and (= (select (arr!23840 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863026 () Bool)

(declare-fun e!480807 () Bool)

(declare-fun e!480804 () Bool)

(assert (=> b!863026 (= e!480807 e!480804)))

(declare-fun res!586457 () Bool)

(assert (=> b!863026 (=> res!586457 e!480804)))

(assert (=> b!863026 (= res!586457 (= k!854 (select (arr!23840 _keys!868) from!1053)))))

(assert (=> b!863026 (not (= (select (arr!23840 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29489 0))(
  ( (Unit!29490) )
))
(declare-fun lt!389834 () Unit!29489)

(declare-fun e!480808 () Unit!29489)

(assert (=> b!863026 (= lt!389834 e!480808)))

(declare-fun c!92107 () Bool)

(assert (=> b!863026 (= c!92107 (= (select (arr!23840 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11128 0))(
  ( (tuple2!11129 (_1!5575 (_ BitVec 64)) (_2!5575 V!27349)) )
))
(declare-datatypes ((List!16938 0))(
  ( (Nil!16935) (Cons!16934 (h!18065 tuple2!11128) (t!23795 List!16938)) )
))
(declare-datatypes ((ListLongMap!9897 0))(
  ( (ListLongMap!9898 (toList!4964 List!16938)) )
))
(declare-fun lt!389840 () ListLongMap!9897)

(declare-fun lt!389836 () ListLongMap!9897)

(assert (=> b!863026 (= lt!389840 lt!389836)))

(declare-fun lt!389843 () ListLongMap!9897)

(declare-fun lt!389839 () tuple2!11128)

(declare-fun +!2313 (ListLongMap!9897 tuple2!11128) ListLongMap!9897)

(assert (=> b!863026 (= lt!389836 (+!2313 lt!389843 lt!389839))))

(declare-fun lt!389837 () V!27349)

(assert (=> b!863026 (= lt!389839 (tuple2!11129 (select (arr!23840 _keys!868) from!1053) lt!389837))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12584 (ValueCell!7924 V!27349) V!27349)

(declare-fun dynLambda!1144 (Int (_ BitVec 64)) V!27349)

(assert (=> b!863026 (= lt!389837 (get!12584 (select (arr!23839 _values!688) from!1053) (dynLambda!1144 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!586455 () Bool)

(assert (=> start!73676 (=> (not res!586455) (not e!480805))))

(assert (=> start!73676 (= res!586455 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24280 _keys!868))))))

(assert (=> start!73676 e!480805))

(declare-fun tp_is_empty!16727 () Bool)

(assert (=> start!73676 tp_is_empty!16727))

(assert (=> start!73676 true))

(assert (=> start!73676 tp!51277))

(declare-fun array_inv!18860 (array!49618) Bool)

(assert (=> start!73676 (array_inv!18860 _keys!868)))

(declare-fun e!480810 () Bool)

(declare-fun array_inv!18861 (array!49616) Bool)

(assert (=> start!73676 (and (array_inv!18861 _values!688) e!480810)))

(declare-fun b!863027 () Bool)

(declare-fun res!586458 () Bool)

(assert (=> b!863027 (=> (not res!586458) (not e!480805))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!863027 (= res!586458 (and (= (size!24279 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24280 _keys!868) (size!24279 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863028 () Bool)

(declare-fun res!586459 () Bool)

(assert (=> b!863028 (=> (not res!586459) (not e!480805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863028 (= res!586459 (validMask!0 mask!1196))))

(declare-fun b!863029 () Bool)

(declare-fun e!480809 () Bool)

(assert (=> b!863029 (= e!480810 (and e!480809 mapRes!26690))))

(declare-fun condMapEmpty!26690 () Bool)

(declare-fun mapDefault!26690 () ValueCell!7924)

