; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73562 () Bool)

(assert start!73562)

(declare-fun b_free!14477 () Bool)

(declare-fun b_next!14477 () Bool)

(assert (=> start!73562 (= b_free!14477 (not b_next!14477))))

(declare-fun tp!50934 () Bool)

(declare-fun b_and!23933 () Bool)

(assert (=> start!73562 (= tp!50934 b_and!23933)))

(declare-fun res!584575 () Bool)

(declare-fun e!479362 () Bool)

(assert (=> start!73562 (=> (not res!584575) (not e!479362))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49402 0))(
  ( (array!49403 (arr!23732 (Array (_ BitVec 32) (_ BitVec 64))) (size!24172 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49402)

(assert (=> start!73562 (= res!584575 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24172 _keys!868))))))

(assert (=> start!73562 e!479362))

(declare-fun tp_is_empty!16613 () Bool)

(assert (=> start!73562 tp_is_empty!16613))

(assert (=> start!73562 true))

(assert (=> start!73562 tp!50934))

(declare-fun array_inv!18786 (array!49402) Bool)

(assert (=> start!73562 (array_inv!18786 _keys!868)))

(declare-datatypes ((V!27197 0))(
  ( (V!27198 (val!8354 Int)) )
))
(declare-datatypes ((ValueCell!7867 0))(
  ( (ValueCellFull!7867 (v!10779 V!27197)) (EmptyCell!7867) )
))
(declare-datatypes ((array!49404 0))(
  ( (array!49405 (arr!23733 (Array (_ BitVec 32) ValueCell!7867)) (size!24173 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49404)

(declare-fun e!479357 () Bool)

(declare-fun array_inv!18787 (array!49404) Bool)

(assert (=> start!73562 (and (array_inv!18787 _values!688) e!479357)))

(declare-fun b!860237 () Bool)

(declare-fun res!584581 () Bool)

(assert (=> b!860237 (=> (not res!584581) (not e!479362))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860237 (= res!584581 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24172 _keys!868))))))

(declare-fun b!860238 () Bool)

(declare-fun e!479359 () Bool)

(declare-fun e!479356 () Bool)

(assert (=> b!860238 (= e!479359 e!479356)))

(declare-fun res!584583 () Bool)

(assert (=> b!860238 (=> res!584583 e!479356)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!860238 (= res!584583 (not (= (select (arr!23732 _keys!868) from!1053) k!854)))))

(declare-datatypes ((tuple2!11040 0))(
  ( (tuple2!11041 (_1!5531 (_ BitVec 64)) (_2!5531 V!27197)) )
))
(declare-datatypes ((List!16847 0))(
  ( (Nil!16844) (Cons!16843 (h!17974 tuple2!11040) (t!23590 List!16847)) )
))
(declare-datatypes ((ListLongMap!9809 0))(
  ( (ListLongMap!9810 (toList!4920 List!16847)) )
))
(declare-fun lt!387721 () ListLongMap!9809)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387724 () ListLongMap!9809)

(declare-fun +!2272 (ListLongMap!9809 tuple2!11040) ListLongMap!9809)

(declare-fun get!12510 (ValueCell!7867 V!27197) V!27197)

(declare-fun dynLambda!1108 (Int (_ BitVec 64)) V!27197)

(assert (=> b!860238 (= lt!387724 (+!2272 lt!387721 (tuple2!11041 (select (arr!23732 _keys!868) from!1053) (get!12510 (select (arr!23733 _values!688) from!1053) (dynLambda!1108 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26519 () Bool)

(declare-fun mapRes!26519 () Bool)

(assert (=> mapIsEmpty!26519 mapRes!26519))

(declare-fun b!860239 () Bool)

(declare-fun e!479358 () Bool)

(assert (=> b!860239 (= e!479358 true)))

(declare-fun lt!387716 () Bool)

(declare-datatypes ((List!16848 0))(
  ( (Nil!16845) (Cons!16844 (h!17975 (_ BitVec 64)) (t!23591 List!16848)) )
))
(declare-fun contains!4231 (List!16848 (_ BitVec 64)) Bool)

(assert (=> b!860239 (= lt!387716 (contains!4231 Nil!16845 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860240 () Bool)

(declare-fun e!479355 () Bool)

(assert (=> b!860240 (= e!479355 tp_is_empty!16613)))

(declare-fun mapNonEmpty!26519 () Bool)

(declare-fun tp!50935 () Bool)

(assert (=> mapNonEmpty!26519 (= mapRes!26519 (and tp!50935 e!479355))))

(declare-fun mapRest!26519 () (Array (_ BitVec 32) ValueCell!7867))

(declare-fun mapKey!26519 () (_ BitVec 32))

(declare-fun mapValue!26519 () ValueCell!7867)

(assert (=> mapNonEmpty!26519 (= (arr!23733 _values!688) (store mapRest!26519 mapKey!26519 mapValue!26519))))

(declare-fun b!860241 () Bool)

(declare-fun res!584582 () Bool)

(assert (=> b!860241 (=> (not res!584582) (not e!479362))))

(declare-fun arrayNoDuplicates!0 (array!49402 (_ BitVec 32) List!16848) Bool)

(assert (=> b!860241 (= res!584582 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16845))))

(declare-fun b!860242 () Bool)

(declare-fun res!584578 () Bool)

(assert (=> b!860242 (=> (not res!584578) (not e!479362))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!860242 (= res!584578 (and (= (size!24173 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24172 _keys!868) (size!24173 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860243 () Bool)

(declare-fun e!479361 () Bool)

(assert (=> b!860243 (= e!479361 tp_is_empty!16613)))

(declare-fun b!860244 () Bool)

(declare-fun res!584584 () Bool)

(assert (=> b!860244 (=> res!584584 e!479358)))

(assert (=> b!860244 (= res!584584 (contains!4231 Nil!16845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860245 () Bool)

(declare-fun res!584587 () Bool)

(assert (=> b!860245 (=> (not res!584587) (not e!479362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860245 (= res!584587 (validMask!0 mask!1196))))

(declare-fun b!860246 () Bool)

(assert (=> b!860246 (= e!479357 (and e!479361 mapRes!26519))))

(declare-fun condMapEmpty!26519 () Bool)

(declare-fun mapDefault!26519 () ValueCell!7867)

