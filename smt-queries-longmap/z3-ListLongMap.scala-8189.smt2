; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100236 () Bool)

(assert start!100236)

(declare-fun b_free!25579 () Bool)

(declare-fun b_next!25579 () Bool)

(assert (=> start!100236 (= b_free!25579 (not b_next!25579))))

(declare-fun tp!89450 () Bool)

(declare-fun b_and!42027 () Bool)

(assert (=> start!100236 (= tp!89450 b_and!42027)))

(declare-fun b!1192569 () Bool)

(declare-fun res!792864 () Bool)

(declare-fun e!678022 () Bool)

(assert (=> b!1192569 (=> (not res!792864) (not e!678022))))

(declare-datatypes ((array!77053 0))(
  ( (array!77054 (arr!37170 (Array (_ BitVec 32) (_ BitVec 64))) (size!37707 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77053)

(declare-datatypes ((List!26196 0))(
  ( (Nil!26193) (Cons!26192 (h!27410 (_ BitVec 64)) (t!38759 List!26196)) )
))
(declare-fun arrayNoDuplicates!0 (array!77053 (_ BitVec 32) List!26196) Bool)

(assert (=> b!1192569 (= res!792864 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26193))))

(declare-fun b!1192570 () Bool)

(declare-fun res!792867 () Bool)

(assert (=> b!1192570 (=> (not res!792867) (not e!678022))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192570 (= res!792867 (validKeyInArray!0 k0!934))))

(declare-fun b!1192571 () Bool)

(declare-fun res!792869 () Bool)

(assert (=> b!1192571 (=> (not res!792869) (not e!678022))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45273 0))(
  ( (V!45274 (val!15111 Int)) )
))
(declare-datatypes ((ValueCell!14345 0))(
  ( (ValueCellFull!14345 (v!17745 V!45273)) (EmptyCell!14345) )
))
(declare-datatypes ((array!77055 0))(
  ( (array!77056 (arr!37171 (Array (_ BitVec 32) ValueCell!14345)) (size!37708 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77055)

(assert (=> b!1192571 (= res!792869 (and (= (size!37708 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37707 _keys!1208) (size!37708 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192572 () Bool)

(declare-fun e!678019 () Bool)

(assert (=> b!1192572 (= e!678022 e!678019)))

(declare-fun res!792868 () Bool)

(assert (=> b!1192572 (=> (not res!792868) (not e!678019))))

(declare-fun lt!542256 () array!77053)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77053 (_ BitVec 32)) Bool)

(assert (=> b!1192572 (= res!792868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542256 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192572 (= lt!542256 (array!77054 (store (arr!37170 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37707 _keys!1208)))))

(declare-fun b!1192573 () Bool)

(declare-fun e!678025 () Bool)

(declare-fun tp_is_empty!30109 () Bool)

(assert (=> b!1192573 (= e!678025 tp_is_empty!30109)))

(declare-fun b!1192574 () Bool)

(declare-fun res!792872 () Bool)

(assert (=> b!1192574 (=> (not res!792872) (not e!678022))))

(assert (=> b!1192574 (= res!792872 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37707 _keys!1208))))))

(declare-fun b!1192575 () Bool)

(declare-fun res!792871 () Bool)

(assert (=> b!1192575 (=> (not res!792871) (not e!678022))))

(assert (=> b!1192575 (= res!792871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192576 () Bool)

(declare-fun e!678026 () Bool)

(declare-fun e!678023 () Bool)

(declare-fun mapRes!46991 () Bool)

(assert (=> b!1192576 (= e!678026 (and e!678023 mapRes!46991))))

(declare-fun condMapEmpty!46991 () Bool)

(declare-fun mapDefault!46991 () ValueCell!14345)

(assert (=> b!1192576 (= condMapEmpty!46991 (= (arr!37171 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14345)) mapDefault!46991)))))

(declare-fun b!1192577 () Bool)

(declare-fun res!792866 () Bool)

(assert (=> b!1192577 (=> (not res!792866) (not e!678022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192577 (= res!792866 (validMask!0 mask!1564))))

(declare-fun b!1192578 () Bool)

(declare-fun e!678020 () Bool)

(declare-fun e!678024 () Bool)

(assert (=> b!1192578 (= e!678020 e!678024)))

(declare-fun res!792874 () Bool)

(assert (=> b!1192578 (=> res!792874 e!678024)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192578 (= res!792874 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45273)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19452 0))(
  ( (tuple2!19453 (_1!9737 (_ BitVec 64)) (_2!9737 V!45273)) )
))
(declare-datatypes ((List!26197 0))(
  ( (Nil!26194) (Cons!26193 (h!27411 tuple2!19452) (t!38760 List!26197)) )
))
(declare-datatypes ((ListLongMap!17429 0))(
  ( (ListLongMap!17430 (toList!8730 List!26197)) )
))
(declare-fun lt!542259 () ListLongMap!17429)

(declare-fun minValue!944 () V!45273)

(declare-fun lt!542255 () array!77055)

(declare-fun getCurrentListMapNoExtraKeys!5198 (array!77053 array!77055 (_ BitVec 32) (_ BitVec 32) V!45273 V!45273 (_ BitVec 32) Int) ListLongMap!17429)

(assert (=> b!1192578 (= lt!542259 (getCurrentListMapNoExtraKeys!5198 lt!542256 lt!542255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3152 (Int (_ BitVec 64)) V!45273)

(assert (=> b!1192578 (= lt!542255 (array!77056 (store (arr!37171 _values!996) i!673 (ValueCellFull!14345 (dynLambda!3152 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37708 _values!996)))))

(declare-fun lt!542260 () ListLongMap!17429)

(assert (=> b!1192578 (= lt!542260 (getCurrentListMapNoExtraKeys!5198 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192579 () Bool)

(declare-fun res!792873 () Bool)

(assert (=> b!1192579 (=> (not res!792873) (not e!678022))))

(assert (=> b!1192579 (= res!792873 (= (select (arr!37170 _keys!1208) i!673) k0!934))))

(declare-fun b!1192580 () Bool)

(assert (=> b!1192580 (= e!678019 (not e!678020))))

(declare-fun res!792870 () Bool)

(assert (=> b!1192580 (=> res!792870 e!678020)))

(assert (=> b!1192580 (= res!792870 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192580 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39501 0))(
  ( (Unit!39502) )
))
(declare-fun lt!542257 () Unit!39501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77053 (_ BitVec 64) (_ BitVec 32)) Unit!39501)

(assert (=> b!1192580 (= lt!542257 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192581 () Bool)

(declare-fun res!792875 () Bool)

(assert (=> b!1192581 (=> (not res!792875) (not e!678019))))

(assert (=> b!1192581 (= res!792875 (arrayNoDuplicates!0 lt!542256 #b00000000000000000000000000000000 Nil!26193))))

(declare-fun b!1192582 () Bool)

(assert (=> b!1192582 (= e!678024 true)))

(declare-fun -!1739 (ListLongMap!17429 (_ BitVec 64)) ListLongMap!17429)

(assert (=> b!1192582 (= (getCurrentListMapNoExtraKeys!5198 lt!542256 lt!542255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1739 (getCurrentListMapNoExtraKeys!5198 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542258 () Unit!39501)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!954 (array!77053 array!77055 (_ BitVec 32) (_ BitVec 32) V!45273 V!45273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39501)

(assert (=> b!1192582 (= lt!542258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!954 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192583 () Bool)

(assert (=> b!1192583 (= e!678023 tp_is_empty!30109)))

(declare-fun res!792865 () Bool)

(assert (=> start!100236 (=> (not res!792865) (not e!678022))))

(assert (=> start!100236 (= res!792865 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37707 _keys!1208))))))

(assert (=> start!100236 e!678022))

(assert (=> start!100236 tp_is_empty!30109))

(declare-fun array_inv!28408 (array!77053) Bool)

(assert (=> start!100236 (array_inv!28408 _keys!1208)))

(assert (=> start!100236 true))

(assert (=> start!100236 tp!89450))

(declare-fun array_inv!28409 (array!77055) Bool)

(assert (=> start!100236 (and (array_inv!28409 _values!996) e!678026)))

(declare-fun mapIsEmpty!46991 () Bool)

(assert (=> mapIsEmpty!46991 mapRes!46991))

(declare-fun mapNonEmpty!46991 () Bool)

(declare-fun tp!89451 () Bool)

(assert (=> mapNonEmpty!46991 (= mapRes!46991 (and tp!89451 e!678025))))

(declare-fun mapValue!46991 () ValueCell!14345)

(declare-fun mapRest!46991 () (Array (_ BitVec 32) ValueCell!14345))

(declare-fun mapKey!46991 () (_ BitVec 32))

(assert (=> mapNonEmpty!46991 (= (arr!37171 _values!996) (store mapRest!46991 mapKey!46991 mapValue!46991))))

(assert (= (and start!100236 res!792865) b!1192577))

(assert (= (and b!1192577 res!792866) b!1192571))

(assert (= (and b!1192571 res!792869) b!1192575))

(assert (= (and b!1192575 res!792871) b!1192569))

(assert (= (and b!1192569 res!792864) b!1192574))

(assert (= (and b!1192574 res!792872) b!1192570))

(assert (= (and b!1192570 res!792867) b!1192579))

(assert (= (and b!1192579 res!792873) b!1192572))

(assert (= (and b!1192572 res!792868) b!1192581))

(assert (= (and b!1192581 res!792875) b!1192580))

(assert (= (and b!1192580 (not res!792870)) b!1192578))

(assert (= (and b!1192578 (not res!792874)) b!1192582))

(assert (= (and b!1192576 condMapEmpty!46991) mapIsEmpty!46991))

(assert (= (and b!1192576 (not condMapEmpty!46991)) mapNonEmpty!46991))

(get-info :version)

(assert (= (and mapNonEmpty!46991 ((_ is ValueCellFull!14345) mapValue!46991)) b!1192573))

(assert (= (and b!1192576 ((_ is ValueCellFull!14345) mapDefault!46991)) b!1192583))

(assert (= start!100236 b!1192576))

(declare-fun b_lambda!20717 () Bool)

(assert (=> (not b_lambda!20717) (not b!1192578)))

(declare-fun t!38758 () Bool)

(declare-fun tb!10383 () Bool)

(assert (=> (and start!100236 (= defaultEntry!1004 defaultEntry!1004) t!38758) tb!10383))

(declare-fun result!21341 () Bool)

(assert (=> tb!10383 (= result!21341 tp_is_empty!30109)))

(assert (=> b!1192578 t!38758))

(declare-fun b_and!42029 () Bool)

(assert (= b_and!42027 (and (=> t!38758 result!21341) b_and!42029)))

(declare-fun m!1101333 () Bool)

(assert (=> b!1192570 m!1101333))

(declare-fun m!1101335 () Bool)

(assert (=> b!1192572 m!1101335))

(declare-fun m!1101337 () Bool)

(assert (=> b!1192572 m!1101337))

(declare-fun m!1101339 () Bool)

(assert (=> b!1192575 m!1101339))

(declare-fun m!1101341 () Bool)

(assert (=> b!1192579 m!1101341))

(declare-fun m!1101343 () Bool)

(assert (=> b!1192569 m!1101343))

(declare-fun m!1101345 () Bool)

(assert (=> mapNonEmpty!46991 m!1101345))

(declare-fun m!1101347 () Bool)

(assert (=> b!1192582 m!1101347))

(declare-fun m!1101349 () Bool)

(assert (=> b!1192582 m!1101349))

(assert (=> b!1192582 m!1101349))

(declare-fun m!1101351 () Bool)

(assert (=> b!1192582 m!1101351))

(declare-fun m!1101353 () Bool)

(assert (=> b!1192582 m!1101353))

(declare-fun m!1101355 () Bool)

(assert (=> start!100236 m!1101355))

(declare-fun m!1101357 () Bool)

(assert (=> start!100236 m!1101357))

(declare-fun m!1101359 () Bool)

(assert (=> b!1192578 m!1101359))

(declare-fun m!1101361 () Bool)

(assert (=> b!1192578 m!1101361))

(declare-fun m!1101363 () Bool)

(assert (=> b!1192578 m!1101363))

(declare-fun m!1101365 () Bool)

(assert (=> b!1192578 m!1101365))

(declare-fun m!1101367 () Bool)

(assert (=> b!1192577 m!1101367))

(declare-fun m!1101369 () Bool)

(assert (=> b!1192580 m!1101369))

(declare-fun m!1101371 () Bool)

(assert (=> b!1192580 m!1101371))

(declare-fun m!1101373 () Bool)

(assert (=> b!1192581 m!1101373))

(check-sat (not b_lambda!20717) (not start!100236) (not b!1192582) (not b_next!25579) (not b!1192580) (not b!1192577) (not b!1192575) b_and!42029 tp_is_empty!30109 (not b!1192581) (not b!1192570) (not b!1192572) (not b!1192578) (not b!1192569) (not mapNonEmpty!46991))
(check-sat b_and!42029 (not b_next!25579))
