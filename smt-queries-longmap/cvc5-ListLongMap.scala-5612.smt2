; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73456 () Bool)

(assert start!73456)

(declare-fun b_free!14371 () Bool)

(declare-fun b_next!14371 () Bool)

(assert (=> start!73456 (= b_free!14371 (not b_next!14371))))

(declare-fun tp!50616 () Bool)

(declare-fun b_and!23727 () Bool)

(assert (=> start!73456 (= tp!50616 b_and!23727)))

(declare-fun mapNonEmpty!26360 () Bool)

(declare-fun mapRes!26360 () Bool)

(declare-fun tp!50617 () Bool)

(declare-fun e!478083 () Bool)

(assert (=> mapNonEmpty!26360 (= mapRes!26360 (and tp!50617 e!478083))))

(declare-datatypes ((V!27057 0))(
  ( (V!27058 (val!8301 Int)) )
))
(declare-datatypes ((ValueCell!7814 0))(
  ( (ValueCellFull!7814 (v!10726 V!27057)) (EmptyCell!7814) )
))
(declare-fun mapValue!26360 () ValueCell!7814)

(declare-fun mapRest!26360 () (Array (_ BitVec 32) ValueCell!7814))

(declare-fun mapKey!26360 () (_ BitVec 32))

(declare-datatypes ((array!49204 0))(
  ( (array!49205 (arr!23633 (Array (_ BitVec 32) ValueCell!7814)) (size!24073 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49204)

(assert (=> mapNonEmpty!26360 (= (arr!23633 _values!688) (store mapRest!26360 mapKey!26360 mapValue!26360))))

(declare-fun b!857804 () Bool)

(declare-fun res!582721 () Bool)

(declare-fun e!478081 () Bool)

(assert (=> b!857804 (=> (not res!582721) (not e!478081))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49206 0))(
  ( (array!49207 (arr!23634 (Array (_ BitVec 32) (_ BitVec 64))) (size!24074 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49206)

(assert (=> b!857804 (= res!582721 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24074 _keys!868))))))

(declare-fun b!857805 () Bool)

(declare-fun e!478087 () Bool)

(assert (=> b!857805 (= e!478081 e!478087)))

(declare-fun res!582726 () Bool)

(assert (=> b!857805 (=> (not res!582726) (not e!478087))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857805 (= res!582726 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386413 () array!49204)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10954 0))(
  ( (tuple2!10955 (_1!5488 (_ BitVec 64)) (_2!5488 V!27057)) )
))
(declare-datatypes ((List!16762 0))(
  ( (Nil!16759) (Cons!16758 (h!17889 tuple2!10954) (t!23403 List!16762)) )
))
(declare-datatypes ((ListLongMap!9723 0))(
  ( (ListLongMap!9724 (toList!4877 List!16762)) )
))
(declare-fun lt!386412 () ListLongMap!9723)

(declare-fun minValue!654 () V!27057)

(declare-fun zeroValue!654 () V!27057)

(declare-fun getCurrentListMapNoExtraKeys!2858 (array!49206 array!49204 (_ BitVec 32) (_ BitVec 32) V!27057 V!27057 (_ BitVec 32) Int) ListLongMap!9723)

(assert (=> b!857805 (= lt!386412 (getCurrentListMapNoExtraKeys!2858 _keys!868 lt!386413 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27057)

(assert (=> b!857805 (= lt!386413 (array!49205 (store (arr!23633 _values!688) i!612 (ValueCellFull!7814 v!557)) (size!24073 _values!688)))))

(declare-fun lt!386411 () ListLongMap!9723)

(assert (=> b!857805 (= lt!386411 (getCurrentListMapNoExtraKeys!2858 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857806 () Bool)

(declare-fun res!582723 () Bool)

(assert (=> b!857806 (=> (not res!582723) (not e!478081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857806 (= res!582723 (validMask!0 mask!1196))))

(declare-fun b!857807 () Bool)

(declare-fun e!478085 () Bool)

(assert (=> b!857807 (= e!478085 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24074 _keys!868))))))

(declare-fun res!582727 () Bool)

(assert (=> start!73456 (=> (not res!582727) (not e!478081))))

(assert (=> start!73456 (= res!582727 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24074 _keys!868))))))

(assert (=> start!73456 e!478081))

(declare-fun tp_is_empty!16507 () Bool)

(assert (=> start!73456 tp_is_empty!16507))

(assert (=> start!73456 true))

(assert (=> start!73456 tp!50616))

(declare-fun array_inv!18718 (array!49206) Bool)

(assert (=> start!73456 (array_inv!18718 _keys!868)))

(declare-fun e!478086 () Bool)

(declare-fun array_inv!18719 (array!49204) Bool)

(assert (=> start!73456 (and (array_inv!18719 _values!688) e!478086)))

(declare-fun b!857808 () Bool)

(declare-fun e!478084 () Bool)

(assert (=> b!857808 (= e!478084 tp_is_empty!16507)))

(declare-fun b!857809 () Bool)

(assert (=> b!857809 (= e!478086 (and e!478084 mapRes!26360))))

(declare-fun condMapEmpty!26360 () Bool)

(declare-fun mapDefault!26360 () ValueCell!7814)

