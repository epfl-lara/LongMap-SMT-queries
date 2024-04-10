; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73522 () Bool)

(assert start!73522)

(declare-fun b_free!14437 () Bool)

(declare-fun b_next!14437 () Bool)

(assert (=> start!73522 (= b_free!14437 (not b_next!14437))))

(declare-fun tp!50814 () Bool)

(declare-fun b_and!23853 () Bool)

(assert (=> start!73522 (= tp!50814 b_and!23853)))

(declare-fun b!859198 () Bool)

(declare-fun res!583766 () Bool)

(declare-fun e!478823 () Bool)

(assert (=> b!859198 (=> (not res!583766) (not e!478823))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859198 (= res!583766 (validMask!0 mask!1196))))

(declare-fun b!859199 () Bool)

(declare-fun res!583757 () Bool)

(assert (=> b!859199 (=> (not res!583757) (not e!478823))))

(declare-datatypes ((array!49326 0))(
  ( (array!49327 (arr!23694 (Array (_ BitVec 32) (_ BitVec 64))) (size!24134 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49326)

(declare-datatypes ((List!16813 0))(
  ( (Nil!16810) (Cons!16809 (h!17940 (_ BitVec 64)) (t!23516 List!16813)) )
))
(declare-fun arrayNoDuplicates!0 (array!49326 (_ BitVec 32) List!16813) Bool)

(assert (=> b!859199 (= res!583757 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16810))))

(declare-fun b!859200 () Bool)

(declare-fun e!478824 () Bool)

(declare-fun tp_is_empty!16573 () Bool)

(assert (=> b!859200 (= e!478824 tp_is_empty!16573)))

(declare-fun b!859201 () Bool)

(declare-fun res!583763 () Bool)

(assert (=> b!859201 (=> (not res!583763) (not e!478823))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859201 (= res!583763 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24134 _keys!868))))))

(declare-fun mapIsEmpty!26459 () Bool)

(declare-fun mapRes!26459 () Bool)

(assert (=> mapIsEmpty!26459 mapRes!26459))

(declare-fun b!859202 () Bool)

(declare-fun e!478825 () Bool)

(declare-fun e!478828 () Bool)

(assert (=> b!859202 (= e!478825 (not e!478828))))

(declare-fun res!583764 () Bool)

(assert (=> b!859202 (=> res!583764 e!478828)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859202 (= res!583764 (not (validKeyInArray!0 (select (arr!23694 _keys!868) from!1053))))))

(declare-datatypes ((V!27145 0))(
  ( (V!27146 (val!8334 Int)) )
))
(declare-datatypes ((tuple2!11004 0))(
  ( (tuple2!11005 (_1!5513 (_ BitVec 64)) (_2!5513 V!27145)) )
))
(declare-datatypes ((List!16814 0))(
  ( (Nil!16811) (Cons!16810 (h!17941 tuple2!11004) (t!23517 List!16814)) )
))
(declare-datatypes ((ListLongMap!9773 0))(
  ( (ListLongMap!9774 (toList!4902 List!16814)) )
))
(declare-fun lt!387130 () ListLongMap!9773)

(declare-fun lt!387133 () ListLongMap!9773)

(assert (=> b!859202 (= lt!387130 lt!387133)))

(declare-fun lt!387132 () ListLongMap!9773)

(declare-fun v!557 () V!27145)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2255 (ListLongMap!9773 tuple2!11004) ListLongMap!9773)

(assert (=> b!859202 (= lt!387133 (+!2255 lt!387132 (tuple2!11005 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27145)

(declare-fun zeroValue!654 () V!27145)

(declare-datatypes ((ValueCell!7847 0))(
  ( (ValueCellFull!7847 (v!10759 V!27145)) (EmptyCell!7847) )
))
(declare-datatypes ((array!49328 0))(
  ( (array!49329 (arr!23695 (Array (_ BitVec 32) ValueCell!7847)) (size!24135 (_ BitVec 32))) )
))
(declare-fun lt!387129 () array!49328)

(declare-fun getCurrentListMapNoExtraKeys!2881 (array!49326 array!49328 (_ BitVec 32) (_ BitVec 32) V!27145 V!27145 (_ BitVec 32) Int) ListLongMap!9773)

(assert (=> b!859202 (= lt!387130 (getCurrentListMapNoExtraKeys!2881 _keys!868 lt!387129 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49328)

(assert (=> b!859202 (= lt!387132 (getCurrentListMapNoExtraKeys!2881 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29295 0))(
  ( (Unit!29296) )
))
(declare-fun lt!387131 () Unit!29295)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!471 (array!49326 array!49328 (_ BitVec 32) (_ BitVec 32) V!27145 V!27145 (_ BitVec 32) (_ BitVec 64) V!27145 (_ BitVec 32) Int) Unit!29295)

(assert (=> b!859202 (= lt!387131 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!471 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859203 () Bool)

(declare-fun e!478821 () Bool)

(assert (=> b!859203 (= e!478828 e!478821)))

(declare-fun res!583765 () Bool)

(assert (=> b!859203 (=> res!583765 e!478821)))

(assert (=> b!859203 (= res!583765 (not (= (select (arr!23694 _keys!868) from!1053) k!854)))))

(declare-fun lt!387134 () ListLongMap!9773)

(declare-fun get!12484 (ValueCell!7847 V!27145) V!27145)

(declare-fun dynLambda!1094 (Int (_ BitVec 64)) V!27145)

(assert (=> b!859203 (= lt!387134 (+!2255 lt!387133 (tuple2!11005 (select (arr!23694 _keys!868) from!1053) (get!12484 (select (arr!23695 _values!688) from!1053) (dynLambda!1094 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859204 () Bool)

(declare-fun res!583758 () Bool)

(assert (=> b!859204 (=> (not res!583758) (not e!478823))))

(assert (=> b!859204 (= res!583758 (validKeyInArray!0 k!854))))

(declare-fun b!859205 () Bool)

(declare-fun res!583762 () Bool)

(assert (=> b!859205 (=> (not res!583762) (not e!478823))))

(assert (=> b!859205 (= res!583762 (and (= (size!24135 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24134 _keys!868) (size!24135 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859206 () Bool)

(declare-fun e!478822 () Bool)

(assert (=> b!859206 (= e!478822 (and e!478824 mapRes!26459))))

(declare-fun condMapEmpty!26459 () Bool)

(declare-fun mapDefault!26459 () ValueCell!7847)

