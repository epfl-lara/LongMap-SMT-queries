; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73540 () Bool)

(assert start!73540)

(declare-fun b_free!14287 () Bool)

(declare-fun b_next!14287 () Bool)

(assert (=> start!73540 (= b_free!14287 (not b_next!14287))))

(declare-fun tp!50365 () Bool)

(declare-fun b_and!23653 () Bool)

(assert (=> start!73540 (= tp!50365 b_and!23653)))

(declare-fun b!857193 () Bool)

(declare-fun res!581932 () Bool)

(declare-fun e!477906 () Bool)

(assert (=> b!857193 (=> (not res!581932) (not e!477906))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857193 (= res!581932 (validMask!0 mask!1196))))

(declare-fun b!857194 () Bool)

(declare-fun e!477905 () Bool)

(declare-fun tp_is_empty!16423 () Bool)

(assert (=> b!857194 (= e!477905 tp_is_empty!16423)))

(declare-fun b!857195 () Bool)

(declare-fun res!581928 () Bool)

(assert (=> b!857195 (=> (not res!581928) (not e!477906))))

(declare-datatypes ((array!49087 0))(
  ( (array!49088 (arr!23570 (Array (_ BitVec 32) (_ BitVec 64))) (size!24011 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49087)

(declare-datatypes ((List!16655 0))(
  ( (Nil!16652) (Cons!16651 (h!17788 (_ BitVec 64)) (t!23288 List!16655)) )
))
(declare-fun arrayNoDuplicates!0 (array!49087 (_ BitVec 32) List!16655) Bool)

(assert (=> b!857195 (= res!581928 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16652))))

(declare-fun b!857196 () Bool)

(declare-fun res!581929 () Bool)

(assert (=> b!857196 (=> (not res!581929) (not e!477906))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26945 0))(
  ( (V!26946 (val!8259 Int)) )
))
(declare-datatypes ((ValueCell!7772 0))(
  ( (ValueCellFull!7772 (v!10684 V!26945)) (EmptyCell!7772) )
))
(declare-datatypes ((array!49089 0))(
  ( (array!49090 (arr!23571 (Array (_ BitVec 32) ValueCell!7772)) (size!24012 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49089)

(assert (=> b!857196 (= res!581929 (and (= (size!24012 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24011 _keys!868) (size!24012 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857197 () Bool)

(declare-fun res!581935 () Bool)

(assert (=> b!857197 (=> (not res!581935) (not e!477906))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857197 (= res!581935 (validKeyInArray!0 k0!854))))

(declare-fun b!857198 () Bool)

(declare-fun e!477910 () Bool)

(assert (=> b!857198 (= e!477906 e!477910)))

(declare-fun res!581927 () Bool)

(assert (=> b!857198 (=> (not res!581927) (not e!477910))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857198 (= res!581927 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386267 () array!49089)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10810 0))(
  ( (tuple2!10811 (_1!5416 (_ BitVec 64)) (_2!5416 V!26945)) )
))
(declare-datatypes ((List!16656 0))(
  ( (Nil!16653) (Cons!16652 (h!17789 tuple2!10810) (t!23289 List!16656)) )
))
(declare-datatypes ((ListLongMap!9581 0))(
  ( (ListLongMap!9582 (toList!4806 List!16656)) )
))
(declare-fun lt!386270 () ListLongMap!9581)

(declare-fun minValue!654 () V!26945)

(declare-fun zeroValue!654 () V!26945)

(declare-fun getCurrentListMapNoExtraKeys!2862 (array!49087 array!49089 (_ BitVec 32) (_ BitVec 32) V!26945 V!26945 (_ BitVec 32) Int) ListLongMap!9581)

(assert (=> b!857198 (= lt!386270 (getCurrentListMapNoExtraKeys!2862 _keys!868 lt!386267 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26945)

(assert (=> b!857198 (= lt!386267 (array!49090 (store (arr!23571 _values!688) i!612 (ValueCellFull!7772 v!557)) (size!24012 _values!688)))))

(declare-fun lt!386269 () ListLongMap!9581)

(assert (=> b!857198 (= lt!386269 (getCurrentListMapNoExtraKeys!2862 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857199 () Bool)

(declare-fun res!581931 () Bool)

(assert (=> b!857199 (=> (not res!581931) (not e!477906))))

(assert (=> b!857199 (= res!581931 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24011 _keys!868))))))

(declare-fun b!857200 () Bool)

(declare-fun e!477908 () Bool)

(assert (=> b!857200 (= e!477908 tp_is_empty!16423)))

(declare-fun b!857201 () Bool)

(assert (=> b!857201 (= e!477910 (not true))))

(declare-fun +!2220 (ListLongMap!9581 tuple2!10810) ListLongMap!9581)

(assert (=> b!857201 (= (getCurrentListMapNoExtraKeys!2862 _keys!868 lt!386267 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2220 (getCurrentListMapNoExtraKeys!2862 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10811 k0!854 v!557)))))

(declare-datatypes ((Unit!29196 0))(
  ( (Unit!29197) )
))
(declare-fun lt!386268 () Unit!29196)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!418 (array!49087 array!49089 (_ BitVec 32) (_ BitVec 32) V!26945 V!26945 (_ BitVec 32) (_ BitVec 64) V!26945 (_ BitVec 32) Int) Unit!29196)

(assert (=> b!857201 (= lt!386268 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!418 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857202 () Bool)

(declare-fun res!581933 () Bool)

(assert (=> b!857202 (=> (not res!581933) (not e!477906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49087 (_ BitVec 32)) Bool)

(assert (=> b!857202 (= res!581933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857203 () Bool)

(declare-fun res!581930 () Bool)

(assert (=> b!857203 (=> (not res!581930) (not e!477906))))

(assert (=> b!857203 (= res!581930 (and (= (select (arr!23570 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857204 () Bool)

(declare-fun e!477909 () Bool)

(declare-fun mapRes!26234 () Bool)

(assert (=> b!857204 (= e!477909 (and e!477905 mapRes!26234))))

(declare-fun condMapEmpty!26234 () Bool)

(declare-fun mapDefault!26234 () ValueCell!7772)

(assert (=> b!857204 (= condMapEmpty!26234 (= (arr!23571 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7772)) mapDefault!26234)))))

(declare-fun res!581934 () Bool)

(assert (=> start!73540 (=> (not res!581934) (not e!477906))))

(assert (=> start!73540 (= res!581934 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24011 _keys!868))))))

(assert (=> start!73540 e!477906))

(assert (=> start!73540 tp_is_empty!16423))

(assert (=> start!73540 true))

(assert (=> start!73540 tp!50365))

(declare-fun array_inv!18726 (array!49087) Bool)

(assert (=> start!73540 (array_inv!18726 _keys!868)))

(declare-fun array_inv!18727 (array!49089) Bool)

(assert (=> start!73540 (and (array_inv!18727 _values!688) e!477909)))

(declare-fun mapIsEmpty!26234 () Bool)

(assert (=> mapIsEmpty!26234 mapRes!26234))

(declare-fun mapNonEmpty!26234 () Bool)

(declare-fun tp!50366 () Bool)

(assert (=> mapNonEmpty!26234 (= mapRes!26234 (and tp!50366 e!477908))))

(declare-fun mapValue!26234 () ValueCell!7772)

(declare-fun mapKey!26234 () (_ BitVec 32))

(declare-fun mapRest!26234 () (Array (_ BitVec 32) ValueCell!7772))

(assert (=> mapNonEmpty!26234 (= (arr!23571 _values!688) (store mapRest!26234 mapKey!26234 mapValue!26234))))

(assert (= (and start!73540 res!581934) b!857193))

(assert (= (and b!857193 res!581932) b!857196))

(assert (= (and b!857196 res!581929) b!857202))

(assert (= (and b!857202 res!581933) b!857195))

(assert (= (and b!857195 res!581928) b!857199))

(assert (= (and b!857199 res!581931) b!857197))

(assert (= (and b!857197 res!581935) b!857203))

(assert (= (and b!857203 res!581930) b!857198))

(assert (= (and b!857198 res!581927) b!857201))

(assert (= (and b!857204 condMapEmpty!26234) mapIsEmpty!26234))

(assert (= (and b!857204 (not condMapEmpty!26234)) mapNonEmpty!26234))

(get-info :version)

(assert (= (and mapNonEmpty!26234 ((_ is ValueCellFull!7772) mapValue!26234)) b!857200))

(assert (= (and b!857204 ((_ is ValueCellFull!7772) mapDefault!26234)) b!857194))

(assert (= start!73540 b!857204))

(declare-fun m!798551 () Bool)

(assert (=> start!73540 m!798551))

(declare-fun m!798553 () Bool)

(assert (=> start!73540 m!798553))

(declare-fun m!798555 () Bool)

(assert (=> b!857193 m!798555))

(declare-fun m!798557 () Bool)

(assert (=> b!857195 m!798557))

(declare-fun m!798559 () Bool)

(assert (=> mapNonEmpty!26234 m!798559))

(declare-fun m!798561 () Bool)

(assert (=> b!857202 m!798561))

(declare-fun m!798563 () Bool)

(assert (=> b!857201 m!798563))

(declare-fun m!798565 () Bool)

(assert (=> b!857201 m!798565))

(assert (=> b!857201 m!798565))

(declare-fun m!798567 () Bool)

(assert (=> b!857201 m!798567))

(declare-fun m!798569 () Bool)

(assert (=> b!857201 m!798569))

(declare-fun m!798571 () Bool)

(assert (=> b!857203 m!798571))

(declare-fun m!798573 () Bool)

(assert (=> b!857198 m!798573))

(declare-fun m!798575 () Bool)

(assert (=> b!857198 m!798575))

(declare-fun m!798577 () Bool)

(assert (=> b!857198 m!798577))

(declare-fun m!798579 () Bool)

(assert (=> b!857197 m!798579))

(check-sat (not b_next!14287) (not b!857198) (not b!857197) (not mapNonEmpty!26234) (not start!73540) (not b!857202) tp_is_empty!16423 (not b!857193) (not b!857195) (not b!857201) b_and!23653)
(check-sat b_and!23653 (not b_next!14287))
