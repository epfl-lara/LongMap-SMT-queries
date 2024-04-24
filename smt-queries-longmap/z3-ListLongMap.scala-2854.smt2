; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41140 () Bool)

(assert start!41140)

(declare-fun b_free!11023 () Bool)

(declare-fun b_next!11023 () Bool)

(assert (=> start!41140 (= b_free!11023 (not b_next!11023))))

(declare-fun tp!38905 () Bool)

(declare-fun b_and!19295 () Bool)

(assert (=> start!41140 (= tp!38905 b_and!19295)))

(declare-fun b!459458 () Bool)

(declare-fun e!268154 () Bool)

(declare-fun tp_is_empty!12361 () Bool)

(assert (=> b!459458 (= e!268154 tp_is_empty!12361)))

(declare-fun b!459459 () Bool)

(declare-datatypes ((Unit!13345 0))(
  ( (Unit!13346) )
))
(declare-fun e!268150 () Unit!13345)

(declare-fun Unit!13347 () Unit!13345)

(assert (=> b!459459 (= e!268150 Unit!13347)))

(declare-fun b!459460 () Bool)

(declare-fun e!268152 () Bool)

(declare-fun e!268155 () Bool)

(assert (=> b!459460 (= e!268152 e!268155)))

(declare-fun res!274626 () Bool)

(assert (=> b!459460 (=> (not res!274626) (not e!268155))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459460 (= res!274626 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17587 0))(
  ( (V!17588 (val!6225 Int)) )
))
(declare-fun minValue!515 () V!17587)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!28516 0))(
  ( (array!28517 (arr!13698 (Array (_ BitVec 32) (_ BitVec 64))) (size!14050 (_ BitVec 32))) )
))
(declare-fun lt!207917 () array!28516)

(declare-datatypes ((tuple2!8128 0))(
  ( (tuple2!8129 (_1!4075 (_ BitVec 64)) (_2!4075 V!17587)) )
))
(declare-datatypes ((List!8196 0))(
  ( (Nil!8193) (Cons!8192 (h!9048 tuple2!8128) (t!14090 List!8196)) )
))
(declare-datatypes ((ListLongMap!7043 0))(
  ( (ListLongMap!7044 (toList!3537 List!8196)) )
))
(declare-fun lt!207919 () ListLongMap!7043)

(declare-fun zeroValue!515 () V!17587)

(declare-datatypes ((ValueCell!5837 0))(
  ( (ValueCellFull!5837 (v!8504 V!17587)) (EmptyCell!5837) )
))
(declare-datatypes ((array!28518 0))(
  ( (array!28519 (arr!13699 (Array (_ BitVec 32) ValueCell!5837)) (size!14051 (_ BitVec 32))) )
))
(declare-fun lt!207920 () array!28518)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1766 (array!28516 array!28518 (_ BitVec 32) (_ BitVec 32) V!17587 V!17587 (_ BitVec 32) Int) ListLongMap!7043)

(assert (=> b!459460 (= lt!207919 (getCurrentListMapNoExtraKeys!1766 lt!207917 lt!207920 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28518)

(declare-fun v!412 () V!17587)

(assert (=> b!459460 (= lt!207920 (array!28519 (store (arr!13699 _values!549) i!563 (ValueCellFull!5837 v!412)) (size!14051 _values!549)))))

(declare-fun lt!207916 () ListLongMap!7043)

(declare-fun _keys!709 () array!28516)

(assert (=> b!459460 (= lt!207916 (getCurrentListMapNoExtraKeys!1766 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459461 () Bool)

(declare-fun res!274621 () Bool)

(declare-fun e!268153 () Bool)

(assert (=> b!459461 (=> (not res!274621) (not e!268153))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459461 (= res!274621 (validKeyInArray!0 k0!794))))

(declare-fun b!459462 () Bool)

(declare-fun res!274620 () Bool)

(assert (=> b!459462 (=> (not res!274620) (not e!268152))))

(declare-datatypes ((List!8197 0))(
  ( (Nil!8194) (Cons!8193 (h!9049 (_ BitVec 64)) (t!14091 List!8197)) )
))
(declare-fun arrayNoDuplicates!0 (array!28516 (_ BitVec 32) List!8197) Bool)

(assert (=> b!459462 (= res!274620 (arrayNoDuplicates!0 lt!207917 #b00000000000000000000000000000000 Nil!8194))))

(declare-fun b!459463 () Bool)

(declare-fun res!274623 () Bool)

(assert (=> b!459463 (=> (not res!274623) (not e!268152))))

(assert (=> b!459463 (= res!274623 (bvsle from!863 i!563))))

(declare-fun b!459464 () Bool)

(declare-fun res!274628 () Bool)

(assert (=> b!459464 (=> (not res!274628) (not e!268153))))

(declare-fun arrayContainsKey!0 (array!28516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459464 (= res!274628 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459465 () Bool)

(declare-fun res!274629 () Bool)

(assert (=> b!459465 (=> (not res!274629) (not e!268153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459465 (= res!274629 (validMask!0 mask!1025))))

(declare-fun b!459467 () Bool)

(declare-fun res!274627 () Bool)

(assert (=> b!459467 (=> (not res!274627) (not e!268153))))

(assert (=> b!459467 (= res!274627 (or (= (select (arr!13698 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13698 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459468 () Bool)

(assert (=> b!459468 (= e!268153 e!268152)))

(declare-fun res!274617 () Bool)

(assert (=> b!459468 (=> (not res!274617) (not e!268152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28516 (_ BitVec 32)) Bool)

(assert (=> b!459468 (= res!274617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207917 mask!1025))))

(assert (=> b!459468 (= lt!207917 (array!28517 (store (arr!13698 _keys!709) i!563 k0!794) (size!14050 _keys!709)))))

(declare-fun mapNonEmpty!20191 () Bool)

(declare-fun mapRes!20191 () Bool)

(declare-fun tp!38904 () Bool)

(assert (=> mapNonEmpty!20191 (= mapRes!20191 (and tp!38904 e!268154))))

(declare-fun mapRest!20191 () (Array (_ BitVec 32) ValueCell!5837))

(declare-fun mapValue!20191 () ValueCell!5837)

(declare-fun mapKey!20191 () (_ BitVec 32))

(assert (=> mapNonEmpty!20191 (= (arr!13699 _values!549) (store mapRest!20191 mapKey!20191 mapValue!20191))))

(declare-fun b!459469 () Bool)

(declare-fun e!268147 () Bool)

(declare-fun e!268148 () Bool)

(assert (=> b!459469 (= e!268147 (and e!268148 mapRes!20191))))

(declare-fun condMapEmpty!20191 () Bool)

(declare-fun mapDefault!20191 () ValueCell!5837)

(assert (=> b!459469 (= condMapEmpty!20191 (= (arr!13699 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5837)) mapDefault!20191)))))

(declare-fun res!274616 () Bool)

(assert (=> start!41140 (=> (not res!274616) (not e!268153))))

(assert (=> start!41140 (= res!274616 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14050 _keys!709))))))

(assert (=> start!41140 e!268153))

(assert (=> start!41140 tp_is_empty!12361))

(assert (=> start!41140 tp!38905))

(assert (=> start!41140 true))

(declare-fun array_inv!9988 (array!28518) Bool)

(assert (=> start!41140 (and (array_inv!9988 _values!549) e!268147)))

(declare-fun array_inv!9989 (array!28516) Bool)

(assert (=> start!41140 (array_inv!9989 _keys!709)))

(declare-fun b!459466 () Bool)

(declare-fun res!274622 () Bool)

(assert (=> b!459466 (=> (not res!274622) (not e!268153))))

(assert (=> b!459466 (= res!274622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459470 () Bool)

(declare-fun res!274619 () Bool)

(assert (=> b!459470 (=> (not res!274619) (not e!268153))))

(assert (=> b!459470 (= res!274619 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14050 _keys!709))))))

(declare-fun b!459471 () Bool)

(declare-fun Unit!13348 () Unit!13345)

(assert (=> b!459471 (= e!268150 Unit!13348)))

(declare-fun lt!207923 () Unit!13345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28516 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13345)

(assert (=> b!459471 (= lt!207923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459471 false))

(declare-fun b!459472 () Bool)

(declare-fun e!268151 () Bool)

(assert (=> b!459472 (= e!268155 (not e!268151))))

(declare-fun res!274624 () Bool)

(assert (=> b!459472 (=> res!274624 e!268151)))

(assert (=> b!459472 (= res!274624 (not (validKeyInArray!0 (select (arr!13698 _keys!709) from!863))))))

(declare-fun lt!207922 () ListLongMap!7043)

(declare-fun lt!207914 () ListLongMap!7043)

(assert (=> b!459472 (= lt!207922 lt!207914)))

(declare-fun lt!207918 () ListLongMap!7043)

(declare-fun +!1614 (ListLongMap!7043 tuple2!8128) ListLongMap!7043)

(assert (=> b!459472 (= lt!207914 (+!1614 lt!207918 (tuple2!8129 k0!794 v!412)))))

(assert (=> b!459472 (= lt!207922 (getCurrentListMapNoExtraKeys!1766 lt!207917 lt!207920 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459472 (= lt!207918 (getCurrentListMapNoExtraKeys!1766 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207921 () Unit!13345)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!771 (array!28516 array!28518 (_ BitVec 32) (_ BitVec 32) V!17587 V!17587 (_ BitVec 32) (_ BitVec 64) V!17587 (_ BitVec 32) Int) Unit!13345)

(assert (=> b!459472 (= lt!207921 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459473 () Bool)

(declare-fun res!274625 () Bool)

(assert (=> b!459473 (=> (not res!274625) (not e!268153))))

(assert (=> b!459473 (= res!274625 (and (= (size!14051 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14050 _keys!709) (size!14051 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459474 () Bool)

(assert (=> b!459474 (= e!268151 (bvslt from!863 (size!14051 _values!549)))))

(assert (=> b!459474 (not (= (select (arr!13698 _keys!709) from!863) k0!794))))

(declare-fun lt!207915 () Unit!13345)

(assert (=> b!459474 (= lt!207915 e!268150)))

(declare-fun c!56456 () Bool)

(assert (=> b!459474 (= c!56456 (= (select (arr!13698 _keys!709) from!863) k0!794))))

(declare-fun get!6762 (ValueCell!5837 V!17587) V!17587)

(declare-fun dynLambda!894 (Int (_ BitVec 64)) V!17587)

(assert (=> b!459474 (= lt!207919 (+!1614 lt!207914 (tuple2!8129 (select (arr!13698 _keys!709) from!863) (get!6762 (select (arr!13699 _values!549) from!863) (dynLambda!894 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459475 () Bool)

(assert (=> b!459475 (= e!268148 tp_is_empty!12361)))

(declare-fun b!459476 () Bool)

(declare-fun res!274618 () Bool)

(assert (=> b!459476 (=> (not res!274618) (not e!268153))))

(assert (=> b!459476 (= res!274618 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8194))))

(declare-fun mapIsEmpty!20191 () Bool)

(assert (=> mapIsEmpty!20191 mapRes!20191))

(assert (= (and start!41140 res!274616) b!459465))

(assert (= (and b!459465 res!274629) b!459473))

(assert (= (and b!459473 res!274625) b!459466))

(assert (= (and b!459466 res!274622) b!459476))

(assert (= (and b!459476 res!274618) b!459470))

(assert (= (and b!459470 res!274619) b!459461))

(assert (= (and b!459461 res!274621) b!459467))

(assert (= (and b!459467 res!274627) b!459464))

(assert (= (and b!459464 res!274628) b!459468))

(assert (= (and b!459468 res!274617) b!459462))

(assert (= (and b!459462 res!274620) b!459463))

(assert (= (and b!459463 res!274623) b!459460))

(assert (= (and b!459460 res!274626) b!459472))

(assert (= (and b!459472 (not res!274624)) b!459474))

(assert (= (and b!459474 c!56456) b!459471))

(assert (= (and b!459474 (not c!56456)) b!459459))

(assert (= (and b!459469 condMapEmpty!20191) mapIsEmpty!20191))

(assert (= (and b!459469 (not condMapEmpty!20191)) mapNonEmpty!20191))

(get-info :version)

(assert (= (and mapNonEmpty!20191 ((_ is ValueCellFull!5837) mapValue!20191)) b!459458))

(assert (= (and b!459469 ((_ is ValueCellFull!5837) mapDefault!20191)) b!459475))

(assert (= start!41140 b!459469))

(declare-fun b_lambda!9871 () Bool)

(assert (=> (not b_lambda!9871) (not b!459474)))

(declare-fun t!14089 () Bool)

(declare-fun tb!3851 () Bool)

(assert (=> (and start!41140 (= defaultEntry!557 defaultEntry!557) t!14089) tb!3851))

(declare-fun result!7255 () Bool)

(assert (=> tb!3851 (= result!7255 tp_is_empty!12361)))

(assert (=> b!459474 t!14089))

(declare-fun b_and!19297 () Bool)

(assert (= b_and!19295 (and (=> t!14089 result!7255) b_and!19297)))

(declare-fun m!442973 () Bool)

(assert (=> b!459466 m!442973))

(declare-fun m!442975 () Bool)

(assert (=> mapNonEmpty!20191 m!442975))

(declare-fun m!442977 () Bool)

(assert (=> b!459464 m!442977))

(declare-fun m!442979 () Bool)

(assert (=> b!459471 m!442979))

(declare-fun m!442981 () Bool)

(assert (=> b!459476 m!442981))

(declare-fun m!442983 () Bool)

(assert (=> b!459461 m!442983))

(declare-fun m!442985 () Bool)

(assert (=> b!459472 m!442985))

(declare-fun m!442987 () Bool)

(assert (=> b!459472 m!442987))

(assert (=> b!459472 m!442985))

(declare-fun m!442989 () Bool)

(assert (=> b!459472 m!442989))

(declare-fun m!442991 () Bool)

(assert (=> b!459472 m!442991))

(declare-fun m!442993 () Bool)

(assert (=> b!459472 m!442993))

(declare-fun m!442995 () Bool)

(assert (=> b!459472 m!442995))

(declare-fun m!442997 () Bool)

(assert (=> b!459468 m!442997))

(declare-fun m!442999 () Bool)

(assert (=> b!459468 m!442999))

(declare-fun m!443001 () Bool)

(assert (=> b!459465 m!443001))

(assert (=> b!459474 m!442985))

(declare-fun m!443003 () Bool)

(assert (=> b!459474 m!443003))

(declare-fun m!443005 () Bool)

(assert (=> b!459474 m!443005))

(declare-fun m!443007 () Bool)

(assert (=> b!459474 m!443007))

(assert (=> b!459474 m!443007))

(assert (=> b!459474 m!443003))

(declare-fun m!443009 () Bool)

(assert (=> b!459474 m!443009))

(declare-fun m!443011 () Bool)

(assert (=> b!459462 m!443011))

(declare-fun m!443013 () Bool)

(assert (=> b!459460 m!443013))

(declare-fun m!443015 () Bool)

(assert (=> b!459460 m!443015))

(declare-fun m!443017 () Bool)

(assert (=> b!459460 m!443017))

(declare-fun m!443019 () Bool)

(assert (=> b!459467 m!443019))

(declare-fun m!443021 () Bool)

(assert (=> start!41140 m!443021))

(declare-fun m!443023 () Bool)

(assert (=> start!41140 m!443023))

(check-sat (not b!459472) (not b!459466) (not b!459465) (not b!459474) b_and!19297 (not b!459461) (not start!41140) (not mapNonEmpty!20191) (not b!459464) (not b!459460) (not b!459471) tp_is_empty!12361 (not b!459468) (not b_lambda!9871) (not b!459476) (not b_next!11023) (not b!459462))
(check-sat b_and!19297 (not b_next!11023))
