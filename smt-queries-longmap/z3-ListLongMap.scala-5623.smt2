; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73504 () Bool)

(assert start!73504)

(declare-fun b_free!14437 () Bool)

(declare-fun b_next!14437 () Bool)

(assert (=> start!73504 (= b_free!14437 (not b_next!14437))))

(declare-fun tp!50815 () Bool)

(declare-fun b_and!23827 () Bool)

(assert (=> start!73504 (= tp!50815 b_and!23827)))

(declare-fun b!858959 () Bool)

(declare-fun e!478677 () Bool)

(assert (=> b!858959 (= e!478677 true)))

(declare-datatypes ((array!49311 0))(
  ( (array!49312 (arr!23687 (Array (_ BitVec 32) (_ BitVec 64))) (size!24129 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49311)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!16811 0))(
  ( (Nil!16808) (Cons!16807 (h!17938 (_ BitVec 64)) (t!23505 List!16811)) )
))
(declare-fun arrayNoDuplicates!0 (array!49311 (_ BitVec 32) List!16811) Bool)

(assert (=> b!858959 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16808)))

(declare-datatypes ((Unit!29219 0))(
  ( (Unit!29220) )
))
(declare-fun lt!386895 () Unit!29219)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49311 (_ BitVec 32) (_ BitVec 32)) Unit!29219)

(assert (=> b!858959 (= lt!386895 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858960 () Bool)

(declare-fun e!478675 () Bool)

(declare-fun e!478678 () Bool)

(assert (=> b!858960 (= e!478675 e!478678)))

(declare-fun res!583647 () Bool)

(assert (=> b!858960 (=> (not res!583647) (not e!478678))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858960 (= res!583647 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27145 0))(
  ( (V!27146 (val!8334 Int)) )
))
(declare-datatypes ((ValueCell!7847 0))(
  ( (ValueCellFull!7847 (v!10753 V!27145)) (EmptyCell!7847) )
))
(declare-datatypes ((array!49313 0))(
  ( (array!49314 (arr!23688 (Array (_ BitVec 32) ValueCell!7847)) (size!24130 (_ BitVec 32))) )
))
(declare-fun lt!386900 () array!49313)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11010 0))(
  ( (tuple2!11011 (_1!5516 (_ BitVec 64)) (_2!5516 V!27145)) )
))
(declare-datatypes ((List!16812 0))(
  ( (Nil!16809) (Cons!16808 (h!17939 tuple2!11010) (t!23506 List!16812)) )
))
(declare-datatypes ((ListLongMap!9769 0))(
  ( (ListLongMap!9770 (toList!4900 List!16812)) )
))
(declare-fun lt!386897 () ListLongMap!9769)

(declare-fun minValue!654 () V!27145)

(declare-fun zeroValue!654 () V!27145)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2905 (array!49311 array!49313 (_ BitVec 32) (_ BitVec 32) V!27145 V!27145 (_ BitVec 32) Int) ListLongMap!9769)

(assert (=> b!858960 (= lt!386897 (getCurrentListMapNoExtraKeys!2905 _keys!868 lt!386900 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27145)

(declare-fun _values!688 () array!49313)

(assert (=> b!858960 (= lt!386900 (array!49314 (store (arr!23688 _values!688) i!612 (ValueCellFull!7847 v!557)) (size!24130 _values!688)))))

(declare-fun lt!386899 () ListLongMap!9769)

(assert (=> b!858960 (= lt!386899 (getCurrentListMapNoExtraKeys!2905 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26459 () Bool)

(declare-fun mapRes!26459 () Bool)

(declare-fun tp!50816 () Bool)

(declare-fun e!478676 () Bool)

(assert (=> mapNonEmpty!26459 (= mapRes!26459 (and tp!50816 e!478676))))

(declare-fun mapRest!26459 () (Array (_ BitVec 32) ValueCell!7847))

(declare-fun mapValue!26459 () ValueCell!7847)

(declare-fun mapKey!26459 () (_ BitVec 32))

(assert (=> mapNonEmpty!26459 (= (arr!23688 _values!688) (store mapRest!26459 mapKey!26459 mapValue!26459))))

(declare-fun b!858961 () Bool)

(declare-fun e!478680 () Bool)

(assert (=> b!858961 (= e!478678 (not e!478680))))

(declare-fun res!583646 () Bool)

(assert (=> b!858961 (=> res!583646 e!478680)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858961 (= res!583646 (not (validKeyInArray!0 (select (arr!23687 _keys!868) from!1053))))))

(declare-fun lt!386896 () ListLongMap!9769)

(declare-fun lt!386894 () ListLongMap!9769)

(assert (=> b!858961 (= lt!386896 lt!386894)))

(declare-fun lt!386898 () ListLongMap!9769)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2274 (ListLongMap!9769 tuple2!11010) ListLongMap!9769)

(assert (=> b!858961 (= lt!386894 (+!2274 lt!386898 (tuple2!11011 k0!854 v!557)))))

(assert (=> b!858961 (= lt!386896 (getCurrentListMapNoExtraKeys!2905 _keys!868 lt!386900 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858961 (= lt!386898 (getCurrentListMapNoExtraKeys!2905 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386893 () Unit!29219)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!467 (array!49311 array!49313 (_ BitVec 32) (_ BitVec 32) V!27145 V!27145 (_ BitVec 32) (_ BitVec 64) V!27145 (_ BitVec 32) Int) Unit!29219)

(assert (=> b!858961 (= lt!386893 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!467 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858962 () Bool)

(declare-fun res!583650 () Bool)

(assert (=> b!858962 (=> (not res!583650) (not e!478675))))

(assert (=> b!858962 (= res!583650 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24129 _keys!868))))))

(declare-fun b!858963 () Bool)

(assert (=> b!858963 (= e!478680 e!478677)))

(declare-fun res!583652 () Bool)

(assert (=> b!858963 (=> res!583652 e!478677)))

(assert (=> b!858963 (= res!583652 (not (= (select (arr!23687 _keys!868) from!1053) k0!854)))))

(declare-fun get!12483 (ValueCell!7847 V!27145) V!27145)

(declare-fun dynLambda!1090 (Int (_ BitVec 64)) V!27145)

(assert (=> b!858963 (= lt!386897 (+!2274 lt!386894 (tuple2!11011 (select (arr!23687 _keys!868) from!1053) (get!12483 (select (arr!23688 _values!688) from!1053) (dynLambda!1090 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858964 () Bool)

(declare-fun res!583654 () Bool)

(assert (=> b!858964 (=> (not res!583654) (not e!478675))))

(assert (=> b!858964 (= res!583654 (and (= (select (arr!23687 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858966 () Bool)

(declare-fun e!478679 () Bool)

(declare-fun tp_is_empty!16573 () Bool)

(assert (=> b!858966 (= e!478679 tp_is_empty!16573)))

(declare-fun b!858967 () Bool)

(declare-fun res!583648 () Bool)

(assert (=> b!858967 (=> (not res!583648) (not e!478675))))

(assert (=> b!858967 (= res!583648 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16808))))

(declare-fun b!858968 () Bool)

(declare-fun res!583655 () Bool)

(assert (=> b!858968 (=> (not res!583655) (not e!478675))))

(assert (=> b!858968 (= res!583655 (and (= (size!24130 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24129 _keys!868) (size!24130 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858969 () Bool)

(assert (=> b!858969 (= e!478676 tp_is_empty!16573)))

(declare-fun mapIsEmpty!26459 () Bool)

(assert (=> mapIsEmpty!26459 mapRes!26459))

(declare-fun b!858970 () Bool)

(declare-fun res!583656 () Bool)

(assert (=> b!858970 (=> (not res!583656) (not e!478675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858970 (= res!583656 (validMask!0 mask!1196))))

(declare-fun res!583653 () Bool)

(assert (=> start!73504 (=> (not res!583653) (not e!478675))))

(assert (=> start!73504 (= res!583653 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24129 _keys!868))))))

(assert (=> start!73504 e!478675))

(assert (=> start!73504 tp_is_empty!16573))

(assert (=> start!73504 true))

(assert (=> start!73504 tp!50815))

(declare-fun array_inv!18818 (array!49311) Bool)

(assert (=> start!73504 (array_inv!18818 _keys!868)))

(declare-fun e!478674 () Bool)

(declare-fun array_inv!18819 (array!49313) Bool)

(assert (=> start!73504 (and (array_inv!18819 _values!688) e!478674)))

(declare-fun b!858965 () Bool)

(declare-fun res!583649 () Bool)

(assert (=> b!858965 (=> (not res!583649) (not e!478675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49311 (_ BitVec 32)) Bool)

(assert (=> b!858965 (= res!583649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858971 () Bool)

(assert (=> b!858971 (= e!478674 (and e!478679 mapRes!26459))))

(declare-fun condMapEmpty!26459 () Bool)

(declare-fun mapDefault!26459 () ValueCell!7847)

(assert (=> b!858971 (= condMapEmpty!26459 (= (arr!23688 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7847)) mapDefault!26459)))))

(declare-fun b!858972 () Bool)

(declare-fun res!583651 () Bool)

(assert (=> b!858972 (=> (not res!583651) (not e!478675))))

(assert (=> b!858972 (= res!583651 (validKeyInArray!0 k0!854))))

(assert (= (and start!73504 res!583653) b!858970))

(assert (= (and b!858970 res!583656) b!858968))

(assert (= (and b!858968 res!583655) b!858965))

(assert (= (and b!858965 res!583649) b!858967))

(assert (= (and b!858967 res!583648) b!858962))

(assert (= (and b!858962 res!583650) b!858972))

(assert (= (and b!858972 res!583651) b!858964))

(assert (= (and b!858964 res!583654) b!858960))

(assert (= (and b!858960 res!583647) b!858961))

(assert (= (and b!858961 (not res!583646)) b!858963))

(assert (= (and b!858963 (not res!583652)) b!858959))

(assert (= (and b!858971 condMapEmpty!26459) mapIsEmpty!26459))

(assert (= (and b!858971 (not condMapEmpty!26459)) mapNonEmpty!26459))

(get-info :version)

(assert (= (and mapNonEmpty!26459 ((_ is ValueCellFull!7847) mapValue!26459)) b!858969))

(assert (= (and b!858971 ((_ is ValueCellFull!7847) mapDefault!26459)) b!858966))

(assert (= start!73504 b!858971))

(declare-fun b_lambda!11771 () Bool)

(assert (=> (not b_lambda!11771) (not b!858963)))

(declare-fun t!23504 () Bool)

(declare-fun tb!4551 () Bool)

(assert (=> (and start!73504 (= defaultEntry!696 defaultEntry!696) t!23504) tb!4551))

(declare-fun result!8721 () Bool)

(assert (=> tb!4551 (= result!8721 tp_is_empty!16573)))

(assert (=> b!858963 t!23504))

(declare-fun b_and!23829 () Bool)

(assert (= b_and!23827 (and (=> t!23504 result!8721) b_and!23829)))

(declare-fun m!799185 () Bool)

(assert (=> b!858959 m!799185))

(declare-fun m!799187 () Bool)

(assert (=> b!858959 m!799187))

(declare-fun m!799189 () Bool)

(assert (=> b!858970 m!799189))

(declare-fun m!799191 () Bool)

(assert (=> b!858964 m!799191))

(declare-fun m!799193 () Bool)

(assert (=> start!73504 m!799193))

(declare-fun m!799195 () Bool)

(assert (=> start!73504 m!799195))

(declare-fun m!799197 () Bool)

(assert (=> b!858961 m!799197))

(declare-fun m!799199 () Bool)

(assert (=> b!858961 m!799199))

(declare-fun m!799201 () Bool)

(assert (=> b!858961 m!799201))

(declare-fun m!799203 () Bool)

(assert (=> b!858961 m!799203))

(assert (=> b!858961 m!799201))

(declare-fun m!799205 () Bool)

(assert (=> b!858961 m!799205))

(declare-fun m!799207 () Bool)

(assert (=> b!858961 m!799207))

(declare-fun m!799209 () Bool)

(assert (=> b!858972 m!799209))

(declare-fun m!799211 () Bool)

(assert (=> b!858963 m!799211))

(declare-fun m!799213 () Bool)

(assert (=> b!858963 m!799213))

(declare-fun m!799215 () Bool)

(assert (=> b!858963 m!799215))

(declare-fun m!799217 () Bool)

(assert (=> b!858963 m!799217))

(assert (=> b!858963 m!799213))

(assert (=> b!858963 m!799201))

(assert (=> b!858963 m!799215))

(declare-fun m!799219 () Bool)

(assert (=> b!858965 m!799219))

(declare-fun m!799221 () Bool)

(assert (=> b!858960 m!799221))

(declare-fun m!799223 () Bool)

(assert (=> b!858960 m!799223))

(declare-fun m!799225 () Bool)

(assert (=> b!858960 m!799225))

(declare-fun m!799227 () Bool)

(assert (=> b!858967 m!799227))

(declare-fun m!799229 () Bool)

(assert (=> mapNonEmpty!26459 m!799229))

(check-sat (not b!858970) (not mapNonEmpty!26459) (not b!858959) (not b!858972) (not b!858961) (not b_lambda!11771) b_and!23829 (not b_next!14437) (not b!858963) tp_is_empty!16573 (not b!858960) (not b!858967) (not b!858965) (not start!73504))
(check-sat b_and!23829 (not b_next!14437))
