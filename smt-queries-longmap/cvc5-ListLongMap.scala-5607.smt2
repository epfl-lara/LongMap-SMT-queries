; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73426 () Bool)

(assert start!73426)

(declare-fun b_free!14341 () Bool)

(declare-fun b_next!14341 () Bool)

(assert (=> start!73426 (= b_free!14341 (not b_next!14341))))

(declare-fun tp!50527 () Bool)

(declare-fun b_and!23697 () Bool)

(assert (=> start!73426 (= tp!50527 b_and!23697)))

(declare-fun b!857262 () Bool)

(declare-fun res!582314 () Bool)

(declare-fun e!477812 () Bool)

(assert (=> b!857262 (=> (not res!582314) (not e!477812))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857262 (= res!582314 (validMask!0 mask!1196))))

(declare-fun b!857263 () Bool)

(declare-fun res!582316 () Bool)

(assert (=> b!857263 (=> (not res!582316) (not e!477812))))

(declare-datatypes ((array!49146 0))(
  ( (array!49147 (arr!23604 (Array (_ BitVec 32) (_ BitVec 64))) (size!24044 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49146)

(declare-datatypes ((List!16740 0))(
  ( (Nil!16737) (Cons!16736 (h!17867 (_ BitVec 64)) (t!23381 List!16740)) )
))
(declare-fun arrayNoDuplicates!0 (array!49146 (_ BitVec 32) List!16740) Bool)

(assert (=> b!857263 (= res!582316 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16737))))

(declare-fun b!857264 () Bool)

(declare-fun e!477810 () Bool)

(declare-fun tp_is_empty!16477 () Bool)

(assert (=> b!857264 (= e!477810 tp_is_empty!16477)))

(declare-fun b!857265 () Bool)

(declare-fun e!477814 () Bool)

(assert (=> b!857265 (= e!477814 tp_is_empty!16477)))

(declare-fun b!857266 () Bool)

(declare-fun res!582317 () Bool)

(assert (=> b!857266 (=> (not res!582317) (not e!477812))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27017 0))(
  ( (V!27018 (val!8286 Int)) )
))
(declare-datatypes ((ValueCell!7799 0))(
  ( (ValueCellFull!7799 (v!10711 V!27017)) (EmptyCell!7799) )
))
(declare-datatypes ((array!49148 0))(
  ( (array!49149 (arr!23605 (Array (_ BitVec 32) ValueCell!7799)) (size!24045 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49148)

(assert (=> b!857266 (= res!582317 (and (= (size!24045 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24044 _keys!868) (size!24045 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857267 () Bool)

(declare-fun res!582318 () Bool)

(assert (=> b!857267 (=> (not res!582318) (not e!477812))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857267 (= res!582318 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24044 _keys!868))))))

(declare-fun mapNonEmpty!26315 () Bool)

(declare-fun mapRes!26315 () Bool)

(declare-fun tp!50526 () Bool)

(assert (=> mapNonEmpty!26315 (= mapRes!26315 (and tp!50526 e!477810))))

(declare-fun mapKey!26315 () (_ BitVec 32))

(declare-fun mapRest!26315 () (Array (_ BitVec 32) ValueCell!7799))

(declare-fun mapValue!26315 () ValueCell!7799)

(assert (=> mapNonEmpty!26315 (= (arr!23605 _values!688) (store mapRest!26315 mapKey!26315 mapValue!26315))))

(declare-fun b!857268 () Bool)

(declare-fun e!477811 () Bool)

(assert (=> b!857268 (= e!477812 e!477811)))

(declare-fun res!582313 () Bool)

(assert (=> b!857268 (=> (not res!582313) (not e!477811))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857268 (= res!582313 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!27017)

(declare-fun zeroValue!654 () V!27017)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10932 0))(
  ( (tuple2!10933 (_1!5477 (_ BitVec 64)) (_2!5477 V!27017)) )
))
(declare-datatypes ((List!16741 0))(
  ( (Nil!16738) (Cons!16737 (h!17868 tuple2!10932) (t!23382 List!16741)) )
))
(declare-datatypes ((ListLongMap!9701 0))(
  ( (ListLongMap!9702 (toList!4866 List!16741)) )
))
(declare-fun lt!386232 () ListLongMap!9701)

(declare-fun lt!386231 () array!49148)

(declare-fun getCurrentListMapNoExtraKeys!2847 (array!49146 array!49148 (_ BitVec 32) (_ BitVec 32) V!27017 V!27017 (_ BitVec 32) Int) ListLongMap!9701)

(assert (=> b!857268 (= lt!386232 (getCurrentListMapNoExtraKeys!2847 _keys!868 lt!386231 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27017)

(assert (=> b!857268 (= lt!386231 (array!49149 (store (arr!23605 _values!688) i!612 (ValueCellFull!7799 v!557)) (size!24045 _values!688)))))

(declare-fun lt!386230 () ListLongMap!9701)

(assert (=> b!857268 (= lt!386230 (getCurrentListMapNoExtraKeys!2847 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857269 () Bool)

(declare-fun res!582315 () Bool)

(assert (=> b!857269 (=> (not res!582315) (not e!477812))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!857269 (= res!582315 (and (= (select (arr!23604 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!857270 () Bool)

(declare-fun res!582320 () Bool)

(assert (=> b!857270 (=> (not res!582320) (not e!477812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857270 (= res!582320 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!26315 () Bool)

(assert (=> mapIsEmpty!26315 mapRes!26315))

(declare-fun res!582312 () Bool)

(assert (=> start!73426 (=> (not res!582312) (not e!477812))))

(assert (=> start!73426 (= res!582312 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24044 _keys!868))))))

(assert (=> start!73426 e!477812))

(assert (=> start!73426 tp_is_empty!16477))

(assert (=> start!73426 true))

(assert (=> start!73426 tp!50527))

(declare-fun array_inv!18692 (array!49146) Bool)

(assert (=> start!73426 (array_inv!18692 _keys!868)))

(declare-fun e!477813 () Bool)

(declare-fun array_inv!18693 (array!49148) Bool)

(assert (=> start!73426 (and (array_inv!18693 _values!688) e!477813)))

(declare-fun b!857271 () Bool)

(assert (=> b!857271 (= e!477811 (not true))))

(declare-fun +!2220 (ListLongMap!9701 tuple2!10932) ListLongMap!9701)

(assert (=> b!857271 (= (getCurrentListMapNoExtraKeys!2847 _keys!868 lt!386231 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2220 (getCurrentListMapNoExtraKeys!2847 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10933 k!854 v!557)))))

(declare-datatypes ((Unit!29227 0))(
  ( (Unit!29228) )
))
(declare-fun lt!386233 () Unit!29227)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!441 (array!49146 array!49148 (_ BitVec 32) (_ BitVec 32) V!27017 V!27017 (_ BitVec 32) (_ BitVec 64) V!27017 (_ BitVec 32) Int) Unit!29227)

(assert (=> b!857271 (= lt!386233 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!441 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857272 () Bool)

(declare-fun res!582319 () Bool)

(assert (=> b!857272 (=> (not res!582319) (not e!477812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49146 (_ BitVec 32)) Bool)

(assert (=> b!857272 (= res!582319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857273 () Bool)

(assert (=> b!857273 (= e!477813 (and e!477814 mapRes!26315))))

(declare-fun condMapEmpty!26315 () Bool)

(declare-fun mapDefault!26315 () ValueCell!7799)

