; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73502 () Bool)

(assert start!73502)

(declare-fun b_free!14417 () Bool)

(declare-fun b_next!14417 () Bool)

(assert (=> start!73502 (= b_free!14417 (not b_next!14417))))

(declare-fun tp!50754 () Bool)

(declare-fun b_and!23813 () Bool)

(assert (=> start!73502 (= tp!50754 b_and!23813)))

(declare-fun b!858758 () Bool)

(declare-fun e!478581 () Bool)

(declare-fun tp_is_empty!16553 () Bool)

(assert (=> b!858758 (= e!478581 tp_is_empty!16553)))

(declare-fun res!583427 () Bool)

(declare-fun e!478586 () Bool)

(assert (=> start!73502 (=> (not res!583427) (not e!478586))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49290 0))(
  ( (array!49291 (arr!23676 (Array (_ BitVec 32) (_ BitVec 64))) (size!24116 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49290)

(assert (=> start!73502 (= res!583427 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24116 _keys!868))))))

(assert (=> start!73502 e!478586))

(assert (=> start!73502 tp_is_empty!16553))

(assert (=> start!73502 true))

(assert (=> start!73502 tp!50754))

(declare-fun array_inv!18752 (array!49290) Bool)

(assert (=> start!73502 (array_inv!18752 _keys!868)))

(declare-datatypes ((V!27117 0))(
  ( (V!27118 (val!8324 Int)) )
))
(declare-datatypes ((ValueCell!7837 0))(
  ( (ValueCellFull!7837 (v!10749 V!27117)) (EmptyCell!7837) )
))
(declare-datatypes ((array!49292 0))(
  ( (array!49293 (arr!23677 (Array (_ BitVec 32) ValueCell!7837)) (size!24117 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49292)

(declare-fun e!478584 () Bool)

(declare-fun array_inv!18753 (array!49292) Bool)

(assert (=> start!73502 (and (array_inv!18753 _values!688) e!478584)))

(declare-fun b!858759 () Bool)

(declare-fun res!583434 () Bool)

(assert (=> b!858759 (=> (not res!583434) (not e!478586))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!858759 (= res!583434 (and (= (select (arr!23676 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858760 () Bool)

(declare-fun res!583432 () Bool)

(assert (=> b!858760 (=> (not res!583432) (not e!478586))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!858760 (= res!583432 (and (= (size!24117 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24116 _keys!868) (size!24117 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858761 () Bool)

(declare-fun res!583428 () Bool)

(assert (=> b!858761 (=> (not res!583428) (not e!478586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49290 (_ BitVec 32)) Bool)

(assert (=> b!858761 (= res!583428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858762 () Bool)

(declare-fun e!478582 () Bool)

(declare-fun e!478588 () Bool)

(assert (=> b!858762 (= e!478582 (not e!478588))))

(declare-fun res!583429 () Bool)

(assert (=> b!858762 (=> res!583429 e!478588)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858762 (= res!583429 (not (validKeyInArray!0 (select (arr!23676 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10990 0))(
  ( (tuple2!10991 (_1!5506 (_ BitVec 64)) (_2!5506 V!27117)) )
))
(declare-datatypes ((List!16798 0))(
  ( (Nil!16795) (Cons!16794 (h!17925 tuple2!10990) (t!23481 List!16798)) )
))
(declare-datatypes ((ListLongMap!9759 0))(
  ( (ListLongMap!9760 (toList!4895 List!16798)) )
))
(declare-fun lt!386895 () ListLongMap!9759)

(declare-fun lt!386889 () ListLongMap!9759)

(assert (=> b!858762 (= lt!386895 lt!386889)))

(declare-fun v!557 () V!27117)

(declare-fun lt!386893 () ListLongMap!9759)

(declare-fun +!2248 (ListLongMap!9759 tuple2!10990) ListLongMap!9759)

(assert (=> b!858762 (= lt!386889 (+!2248 lt!386893 (tuple2!10991 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386891 () array!49292)

(declare-fun minValue!654 () V!27117)

(declare-fun zeroValue!654 () V!27117)

(declare-fun getCurrentListMapNoExtraKeys!2875 (array!49290 array!49292 (_ BitVec 32) (_ BitVec 32) V!27117 V!27117 (_ BitVec 32) Int) ListLongMap!9759)

(assert (=> b!858762 (= lt!386895 (getCurrentListMapNoExtraKeys!2875 _keys!868 lt!386891 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858762 (= lt!386893 (getCurrentListMapNoExtraKeys!2875 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29279 0))(
  ( (Unit!29280) )
))
(declare-fun lt!386890 () Unit!29279)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!465 (array!49290 array!49292 (_ BitVec 32) (_ BitVec 32) V!27117 V!27117 (_ BitVec 32) (_ BitVec 64) V!27117 (_ BitVec 32) Int) Unit!29279)

(assert (=> b!858762 (= lt!386890 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!465 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858763 () Bool)

(declare-fun e!478587 () Bool)

(assert (=> b!858763 (= e!478587 tp_is_empty!16553)))

(declare-fun b!858764 () Bool)

(declare-fun res!583431 () Bool)

(assert (=> b!858764 (=> (not res!583431) (not e!478586))))

(declare-datatypes ((List!16799 0))(
  ( (Nil!16796) (Cons!16795 (h!17926 (_ BitVec 64)) (t!23482 List!16799)) )
))
(declare-fun arrayNoDuplicates!0 (array!49290 (_ BitVec 32) List!16799) Bool)

(assert (=> b!858764 (= res!583431 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16796))))

(declare-fun mapIsEmpty!26429 () Bool)

(declare-fun mapRes!26429 () Bool)

(assert (=> mapIsEmpty!26429 mapRes!26429))

(declare-fun b!858765 () Bool)

(declare-fun res!583430 () Bool)

(assert (=> b!858765 (=> (not res!583430) (not e!478586))))

(assert (=> b!858765 (= res!583430 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26429 () Bool)

(declare-fun tp!50755 () Bool)

(assert (=> mapNonEmpty!26429 (= mapRes!26429 (and tp!50755 e!478587))))

(declare-fun mapRest!26429 () (Array (_ BitVec 32) ValueCell!7837))

(declare-fun mapValue!26429 () ValueCell!7837)

(declare-fun mapKey!26429 () (_ BitVec 32))

(assert (=> mapNonEmpty!26429 (= (arr!23677 _values!688) (store mapRest!26429 mapKey!26429 mapValue!26429))))

(declare-fun b!858766 () Bool)

(declare-fun e!478585 () Bool)

(assert (=> b!858766 (= e!478588 e!478585)))

(declare-fun res!583426 () Bool)

(assert (=> b!858766 (=> res!583426 e!478585)))

(assert (=> b!858766 (= res!583426 (not (= (select (arr!23676 _keys!868) from!1053) k!854)))))

(declare-fun lt!386896 () ListLongMap!9759)

(declare-fun get!12470 (ValueCell!7837 V!27117) V!27117)

(declare-fun dynLambda!1088 (Int (_ BitVec 64)) V!27117)

(assert (=> b!858766 (= lt!386896 (+!2248 lt!386889 (tuple2!10991 (select (arr!23676 _keys!868) from!1053) (get!12470 (select (arr!23677 _values!688) from!1053) (dynLambda!1088 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858767 () Bool)

(assert (=> b!858767 (= e!478584 (and e!478581 mapRes!26429))))

(declare-fun condMapEmpty!26429 () Bool)

(declare-fun mapDefault!26429 () ValueCell!7837)

