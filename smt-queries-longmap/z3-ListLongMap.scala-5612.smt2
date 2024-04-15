; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73438 () Bool)

(assert start!73438)

(declare-fun b_free!14371 () Bool)

(declare-fun b_next!14371 () Bool)

(assert (=> start!73438 (= b_free!14371 (not b_next!14371))))

(declare-fun tp!50618 () Bool)

(declare-fun b_and!23701 () Bool)

(assert (=> start!73438 (= tp!50618 b_and!23701)))

(declare-fun b!857565 () Bool)

(declare-fun res!582617 () Bool)

(declare-fun e!477933 () Bool)

(assert (=> b!857565 (=> (not res!582617) (not e!477933))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49183 0))(
  ( (array!49184 (arr!23623 (Array (_ BitVec 32) (_ BitVec 64))) (size!24065 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49183)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857565 (= res!582617 (and (= (select (arr!23623 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857566 () Bool)

(declare-fun e!477934 () Bool)

(declare-fun tp_is_empty!16507 () Bool)

(assert (=> b!857566 (= e!477934 tp_is_empty!16507)))

(declare-fun b!857567 () Bool)

(declare-fun res!582612 () Bool)

(assert (=> b!857567 (=> (not res!582612) (not e!477933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857567 (= res!582612 (validKeyInArray!0 k0!854))))

(declare-fun b!857568 () Bool)

(declare-fun res!582618 () Bool)

(assert (=> b!857568 (=> (not res!582618) (not e!477933))))

(assert (=> b!857568 (= res!582618 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24065 _keys!868))))))

(declare-fun mapNonEmpty!26360 () Bool)

(declare-fun mapRes!26360 () Bool)

(declare-fun tp!50617 () Bool)

(declare-fun e!477935 () Bool)

(assert (=> mapNonEmpty!26360 (= mapRes!26360 (and tp!50617 e!477935))))

(declare-datatypes ((V!27057 0))(
  ( (V!27058 (val!8301 Int)) )
))
(declare-datatypes ((ValueCell!7814 0))(
  ( (ValueCellFull!7814 (v!10720 V!27057)) (EmptyCell!7814) )
))
(declare-fun mapRest!26360 () (Array (_ BitVec 32) ValueCell!7814))

(declare-datatypes ((array!49185 0))(
  ( (array!49186 (arr!23624 (Array (_ BitVec 32) ValueCell!7814)) (size!24066 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49185)

(declare-fun mapValue!26360 () ValueCell!7814)

(declare-fun mapKey!26360 () (_ BitVec 32))

(assert (=> mapNonEmpty!26360 (= (arr!23624 _values!688) (store mapRest!26360 mapKey!26360 mapValue!26360))))

(declare-fun b!857569 () Bool)

(declare-fun res!582615 () Bool)

(assert (=> b!857569 (=> (not res!582615) (not e!477933))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49183 (_ BitVec 32)) Bool)

(assert (=> b!857569 (= res!582615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857571 () Bool)

(declare-fun res!582609 () Bool)

(assert (=> b!857571 (=> (not res!582609) (not e!477933))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!857571 (= res!582609 (and (= (size!24066 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24065 _keys!868) (size!24066 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857572 () Bool)

(declare-fun e!477939 () Bool)

(assert (=> b!857572 (= e!477939 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24065 _keys!868))))))

(declare-fun b!857573 () Bool)

(declare-fun res!582611 () Bool)

(assert (=> b!857573 (=> (not res!582611) (not e!477933))))

(declare-datatypes ((List!16761 0))(
  ( (Nil!16758) (Cons!16757 (h!17888 (_ BitVec 64)) (t!23393 List!16761)) )
))
(declare-fun arrayNoDuplicates!0 (array!49183 (_ BitVec 32) List!16761) Bool)

(assert (=> b!857573 (= res!582611 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16758))))

(declare-fun b!857574 () Bool)

(declare-fun e!477936 () Bool)

(assert (=> b!857574 (= e!477936 (not e!477939))))

(declare-fun res!582616 () Bool)

(assert (=> b!857574 (=> res!582616 e!477939)))

(assert (=> b!857574 (= res!582616 (not (validKeyInArray!0 (select (arr!23623 _keys!868) from!1053))))))

(declare-fun v!557 () V!27057)

(declare-fun minValue!654 () V!27057)

(declare-fun zeroValue!654 () V!27057)

(declare-fun lt!386174 () array!49185)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10956 0))(
  ( (tuple2!10957 (_1!5489 (_ BitVec 64)) (_2!5489 V!27057)) )
))
(declare-datatypes ((List!16762 0))(
  ( (Nil!16759) (Cons!16758 (h!17889 tuple2!10956) (t!23394 List!16762)) )
))
(declare-datatypes ((ListLongMap!9715 0))(
  ( (ListLongMap!9716 (toList!4873 List!16762)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2880 (array!49183 array!49185 (_ BitVec 32) (_ BitVec 32) V!27057 V!27057 (_ BitVec 32) Int) ListLongMap!9715)

(declare-fun +!2249 (ListLongMap!9715 tuple2!10956) ListLongMap!9715)

(assert (=> b!857574 (= (getCurrentListMapNoExtraKeys!2880 _keys!868 lt!386174 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2249 (getCurrentListMapNoExtraKeys!2880 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10957 k0!854 v!557)))))

(declare-datatypes ((Unit!29167 0))(
  ( (Unit!29168) )
))
(declare-fun lt!386176 () Unit!29167)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!446 (array!49183 array!49185 (_ BitVec 32) (_ BitVec 32) V!27057 V!27057 (_ BitVec 32) (_ BitVec 64) V!27057 (_ BitVec 32) Int) Unit!29167)

(assert (=> b!857574 (= lt!386176 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!446 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857575 () Bool)

(declare-fun e!477938 () Bool)

(assert (=> b!857575 (= e!477938 (and e!477934 mapRes!26360))))

(declare-fun condMapEmpty!26360 () Bool)

(declare-fun mapDefault!26360 () ValueCell!7814)

(assert (=> b!857575 (= condMapEmpty!26360 (= (arr!23624 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7814)) mapDefault!26360)))))

(declare-fun b!857576 () Bool)

(assert (=> b!857576 (= e!477933 e!477936)))

(declare-fun res!582610 () Bool)

(assert (=> b!857576 (=> (not res!582610) (not e!477936))))

(assert (=> b!857576 (= res!582610 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386177 () ListLongMap!9715)

(assert (=> b!857576 (= lt!386177 (getCurrentListMapNoExtraKeys!2880 _keys!868 lt!386174 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857576 (= lt!386174 (array!49186 (store (arr!23624 _values!688) i!612 (ValueCellFull!7814 v!557)) (size!24066 _values!688)))))

(declare-fun lt!386175 () ListLongMap!9715)

(assert (=> b!857576 (= lt!386175 (getCurrentListMapNoExtraKeys!2880 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857577 () Bool)

(assert (=> b!857577 (= e!477935 tp_is_empty!16507)))

(declare-fun mapIsEmpty!26360 () Bool)

(assert (=> mapIsEmpty!26360 mapRes!26360))

(declare-fun res!582614 () Bool)

(assert (=> start!73438 (=> (not res!582614) (not e!477933))))

(assert (=> start!73438 (= res!582614 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24065 _keys!868))))))

(assert (=> start!73438 e!477933))

(assert (=> start!73438 tp_is_empty!16507))

(assert (=> start!73438 true))

(assert (=> start!73438 tp!50618))

(declare-fun array_inv!18772 (array!49183) Bool)

(assert (=> start!73438 (array_inv!18772 _keys!868)))

(declare-fun array_inv!18773 (array!49185) Bool)

(assert (=> start!73438 (and (array_inv!18773 _values!688) e!477938)))

(declare-fun b!857570 () Bool)

(declare-fun res!582613 () Bool)

(assert (=> b!857570 (=> (not res!582613) (not e!477933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857570 (= res!582613 (validMask!0 mask!1196))))

(assert (= (and start!73438 res!582614) b!857570))

(assert (= (and b!857570 res!582613) b!857571))

(assert (= (and b!857571 res!582609) b!857569))

(assert (= (and b!857569 res!582615) b!857573))

(assert (= (and b!857573 res!582611) b!857568))

(assert (= (and b!857568 res!582618) b!857567))

(assert (= (and b!857567 res!582612) b!857565))

(assert (= (and b!857565 res!582617) b!857576))

(assert (= (and b!857576 res!582610) b!857574))

(assert (= (and b!857574 (not res!582616)) b!857572))

(assert (= (and b!857575 condMapEmpty!26360) mapIsEmpty!26360))

(assert (= (and b!857575 (not condMapEmpty!26360)) mapNonEmpty!26360))

(get-info :version)

(assert (= (and mapNonEmpty!26360 ((_ is ValueCellFull!7814) mapValue!26360)) b!857577))

(assert (= (and b!857575 ((_ is ValueCellFull!7814) mapDefault!26360)) b!857566))

(assert (= start!73438 b!857575))

(declare-fun m!797763 () Bool)

(assert (=> start!73438 m!797763))

(declare-fun m!797765 () Bool)

(assert (=> start!73438 m!797765))

(declare-fun m!797767 () Bool)

(assert (=> b!857570 m!797767))

(declare-fun m!797769 () Bool)

(assert (=> b!857574 m!797769))

(declare-fun m!797771 () Bool)

(assert (=> b!857574 m!797771))

(assert (=> b!857574 m!797769))

(declare-fun m!797773 () Bool)

(assert (=> b!857574 m!797773))

(declare-fun m!797775 () Bool)

(assert (=> b!857574 m!797775))

(assert (=> b!857574 m!797773))

(declare-fun m!797777 () Bool)

(assert (=> b!857574 m!797777))

(declare-fun m!797779 () Bool)

(assert (=> b!857574 m!797779))

(declare-fun m!797781 () Bool)

(assert (=> b!857569 m!797781))

(declare-fun m!797783 () Bool)

(assert (=> b!857576 m!797783))

(declare-fun m!797785 () Bool)

(assert (=> b!857576 m!797785))

(declare-fun m!797787 () Bool)

(assert (=> b!857576 m!797787))

(declare-fun m!797789 () Bool)

(assert (=> mapNonEmpty!26360 m!797789))

(declare-fun m!797791 () Bool)

(assert (=> b!857565 m!797791))

(declare-fun m!797793 () Bool)

(assert (=> b!857573 m!797793))

(declare-fun m!797795 () Bool)

(assert (=> b!857567 m!797795))

(check-sat (not b!857574) (not b!857569) b_and!23701 (not b!857573) (not mapNonEmpty!26360) (not b_next!14371) (not start!73438) (not b!857576) (not b!857567) (not b!857570) tp_is_empty!16507)
(check-sat b_and!23701 (not b_next!14371))
