; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101498 () Bool)

(assert start!101498)

(declare-fun b_free!26185 () Bool)

(declare-fun b_next!26185 () Bool)

(assert (=> start!101498 (= b_free!26185 (not b_next!26185))))

(declare-fun tp!91577 () Bool)

(declare-fun b_and!43489 () Bool)

(assert (=> start!101498 (= tp!91577 b_and!43489)))

(declare-fun b!1217633 () Bool)

(declare-fun e!691407 () Bool)

(declare-fun tp_is_empty!30889 () Bool)

(assert (=> b!1217633 (= e!691407 tp_is_empty!30889)))

(declare-fun mapNonEmpty!48208 () Bool)

(declare-fun mapRes!48208 () Bool)

(declare-fun tp!91576 () Bool)

(assert (=> mapNonEmpty!48208 (= mapRes!48208 (and tp!91576 e!691407))))

(declare-datatypes ((V!46313 0))(
  ( (V!46314 (val!15501 Int)) )
))
(declare-datatypes ((ValueCell!14735 0))(
  ( (ValueCellFull!14735 (v!18150 V!46313)) (EmptyCell!14735) )
))
(declare-fun mapRest!48208 () (Array (_ BitVec 32) ValueCell!14735))

(declare-fun mapValue!48208 () ValueCell!14735)

(declare-datatypes ((array!78593 0))(
  ( (array!78594 (arr!37925 (Array (_ BitVec 32) ValueCell!14735)) (size!38462 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78593)

(declare-fun mapKey!48208 () (_ BitVec 32))

(assert (=> mapNonEmpty!48208 (= (arr!37925 _values!996) (store mapRest!48208 mapKey!48208 mapValue!48208))))

(declare-fun mapIsEmpty!48208 () Bool)

(assert (=> mapIsEmpty!48208 mapRes!48208))

(declare-fun b!1217634 () Bool)

(declare-fun e!691414 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78595 0))(
  ( (array!78596 (arr!37926 (Array (_ BitVec 32) (_ BitVec 64))) (size!38463 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78595)

(assert (=> b!1217634 (= e!691414 (bvslt from!1455 (size!38463 _keys!1208)))))

(declare-fun zeroValue!944 () V!46313)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553348 () array!78593)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!46313)

(declare-fun lt!553347 () array!78595)

(declare-datatypes ((tuple2!19938 0))(
  ( (tuple2!19939 (_1!9980 (_ BitVec 64)) (_2!9980 V!46313)) )
))
(declare-datatypes ((List!26748 0))(
  ( (Nil!26745) (Cons!26744 (h!27962 tuple2!19938) (t!39905 List!26748)) )
))
(declare-datatypes ((ListLongMap!17915 0))(
  ( (ListLongMap!17916 (toList!8973 List!26748)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5430 (array!78595 array!78593 (_ BitVec 32) (_ BitVec 32) V!46313 V!46313 (_ BitVec 32) Int) ListLongMap!17915)

(declare-fun -!1868 (ListLongMap!17915 (_ BitVec 64)) ListLongMap!17915)

(assert (=> b!1217634 (= (getCurrentListMapNoExtraKeys!5430 lt!553347 lt!553348 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1868 (getCurrentListMapNoExtraKeys!5430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40306 0))(
  ( (Unit!40307) )
))
(declare-fun lt!553346 () Unit!40306)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1083 (array!78595 array!78593 (_ BitVec 32) (_ BitVec 32) V!46313 V!46313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40306)

(assert (=> b!1217634 (= lt!553346 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1083 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217635 () Bool)

(declare-fun res!808190 () Bool)

(declare-fun e!691410 () Bool)

(assert (=> b!1217635 (=> (not res!808190) (not e!691410))))

(assert (=> b!1217635 (= res!808190 (and (= (size!38462 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38463 _keys!1208) (size!38462 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217636 () Bool)

(declare-fun res!808200 () Bool)

(assert (=> b!1217636 (=> (not res!808200) (not e!691410))))

(declare-datatypes ((List!26749 0))(
  ( (Nil!26746) (Cons!26745 (h!27963 (_ BitVec 64)) (t!39906 List!26749)) )
))
(declare-fun arrayNoDuplicates!0 (array!78595 (_ BitVec 32) List!26749) Bool)

(assert (=> b!1217636 (= res!808200 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26746))))

(declare-fun b!1217637 () Bool)

(declare-fun res!808193 () Bool)

(assert (=> b!1217637 (=> (not res!808193) (not e!691410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78595 (_ BitVec 32)) Bool)

(assert (=> b!1217637 (= res!808193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217638 () Bool)

(declare-fun e!691409 () Bool)

(assert (=> b!1217638 (= e!691409 e!691414)))

(declare-fun res!808198 () Bool)

(assert (=> b!1217638 (=> res!808198 e!691414)))

(assert (=> b!1217638 (= res!808198 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553345 () ListLongMap!17915)

(assert (=> b!1217638 (= lt!553345 (getCurrentListMapNoExtraKeys!5430 lt!553347 lt!553348 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3342 (Int (_ BitVec 64)) V!46313)

(assert (=> b!1217638 (= lt!553348 (array!78594 (store (arr!37925 _values!996) i!673 (ValueCellFull!14735 (dynLambda!3342 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38462 _values!996)))))

(declare-fun lt!553349 () ListLongMap!17915)

(assert (=> b!1217638 (= lt!553349 (getCurrentListMapNoExtraKeys!5430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217640 () Bool)

(declare-fun e!691412 () Bool)

(assert (=> b!1217640 (= e!691412 (not e!691409))))

(declare-fun res!808195 () Bool)

(assert (=> b!1217640 (=> res!808195 e!691409)))

(assert (=> b!1217640 (= res!808195 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217640 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553350 () Unit!40306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78595 (_ BitVec 64) (_ BitVec 32)) Unit!40306)

(assert (=> b!1217640 (= lt!553350 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217641 () Bool)

(declare-fun e!691413 () Bool)

(assert (=> b!1217641 (= e!691413 tp_is_empty!30889)))

(declare-fun b!1217642 () Bool)

(declare-fun res!808196 () Bool)

(assert (=> b!1217642 (=> (not res!808196) (not e!691412))))

(assert (=> b!1217642 (= res!808196 (arrayNoDuplicates!0 lt!553347 #b00000000000000000000000000000000 Nil!26746))))

(declare-fun b!1217643 () Bool)

(declare-fun e!691411 () Bool)

(assert (=> b!1217643 (= e!691411 (and e!691413 mapRes!48208))))

(declare-fun condMapEmpty!48208 () Bool)

(declare-fun mapDefault!48208 () ValueCell!14735)

(assert (=> b!1217643 (= condMapEmpty!48208 (= (arr!37925 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14735)) mapDefault!48208)))))

(declare-fun b!1217644 () Bool)

(assert (=> b!1217644 (= e!691410 e!691412)))

(declare-fun res!808191 () Bool)

(assert (=> b!1217644 (=> (not res!808191) (not e!691412))))

(assert (=> b!1217644 (= res!808191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553347 mask!1564))))

(assert (=> b!1217644 (= lt!553347 (array!78596 (store (arr!37926 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38463 _keys!1208)))))

(declare-fun b!1217645 () Bool)

(declare-fun res!808192 () Bool)

(assert (=> b!1217645 (=> (not res!808192) (not e!691410))))

(assert (=> b!1217645 (= res!808192 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38463 _keys!1208))))))

(declare-fun b!1217646 () Bool)

(declare-fun res!808194 () Bool)

(assert (=> b!1217646 (=> (not res!808194) (not e!691410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217646 (= res!808194 (validMask!0 mask!1564))))

(declare-fun b!1217647 () Bool)

(declare-fun res!808199 () Bool)

(assert (=> b!1217647 (=> (not res!808199) (not e!691410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217647 (= res!808199 (validKeyInArray!0 k0!934))))

(declare-fun b!1217639 () Bool)

(declare-fun res!808201 () Bool)

(assert (=> b!1217639 (=> (not res!808201) (not e!691410))))

(assert (=> b!1217639 (= res!808201 (= (select (arr!37926 _keys!1208) i!673) k0!934))))

(declare-fun res!808197 () Bool)

(assert (=> start!101498 (=> (not res!808197) (not e!691410))))

(assert (=> start!101498 (= res!808197 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38463 _keys!1208))))))

(assert (=> start!101498 e!691410))

(assert (=> start!101498 tp_is_empty!30889))

(declare-fun array_inv!28940 (array!78595) Bool)

(assert (=> start!101498 (array_inv!28940 _keys!1208)))

(assert (=> start!101498 true))

(assert (=> start!101498 tp!91577))

(declare-fun array_inv!28941 (array!78593) Bool)

(assert (=> start!101498 (and (array_inv!28941 _values!996) e!691411)))

(assert (= (and start!101498 res!808197) b!1217646))

(assert (= (and b!1217646 res!808194) b!1217635))

(assert (= (and b!1217635 res!808190) b!1217637))

(assert (= (and b!1217637 res!808193) b!1217636))

(assert (= (and b!1217636 res!808200) b!1217645))

(assert (= (and b!1217645 res!808192) b!1217647))

(assert (= (and b!1217647 res!808199) b!1217639))

(assert (= (and b!1217639 res!808201) b!1217644))

(assert (= (and b!1217644 res!808191) b!1217642))

(assert (= (and b!1217642 res!808196) b!1217640))

(assert (= (and b!1217640 (not res!808195)) b!1217638))

(assert (= (and b!1217638 (not res!808198)) b!1217634))

(assert (= (and b!1217643 condMapEmpty!48208) mapIsEmpty!48208))

(assert (= (and b!1217643 (not condMapEmpty!48208)) mapNonEmpty!48208))

(get-info :version)

(assert (= (and mapNonEmpty!48208 ((_ is ValueCellFull!14735) mapValue!48208)) b!1217633))

(assert (= (and b!1217643 ((_ is ValueCellFull!14735) mapDefault!48208)) b!1217641))

(assert (= start!101498 b!1217643))

(declare-fun b_lambda!21855 () Bool)

(assert (=> (not b_lambda!21855) (not b!1217638)))

(declare-fun t!39904 () Bool)

(declare-fun tb!10977 () Bool)

(assert (=> (and start!101498 (= defaultEntry!1004 defaultEntry!1004) t!39904) tb!10977))

(declare-fun result!22559 () Bool)

(assert (=> tb!10977 (= result!22559 tp_is_empty!30889)))

(assert (=> b!1217638 t!39904))

(declare-fun b_and!43491 () Bool)

(assert (= b_and!43489 (and (=> t!39904 result!22559) b_and!43491)))

(declare-fun m!1122699 () Bool)

(assert (=> b!1217640 m!1122699))

(declare-fun m!1122701 () Bool)

(assert (=> b!1217640 m!1122701))

(declare-fun m!1122703 () Bool)

(assert (=> b!1217642 m!1122703))

(declare-fun m!1122705 () Bool)

(assert (=> b!1217644 m!1122705))

(declare-fun m!1122707 () Bool)

(assert (=> b!1217644 m!1122707))

(declare-fun m!1122709 () Bool)

(assert (=> mapNonEmpty!48208 m!1122709))

(declare-fun m!1122711 () Bool)

(assert (=> b!1217637 m!1122711))

(declare-fun m!1122713 () Bool)

(assert (=> b!1217638 m!1122713))

(declare-fun m!1122715 () Bool)

(assert (=> b!1217638 m!1122715))

(declare-fun m!1122717 () Bool)

(assert (=> b!1217638 m!1122717))

(declare-fun m!1122719 () Bool)

(assert (=> b!1217638 m!1122719))

(declare-fun m!1122721 () Bool)

(assert (=> b!1217639 m!1122721))

(declare-fun m!1122723 () Bool)

(assert (=> b!1217636 m!1122723))

(declare-fun m!1122725 () Bool)

(assert (=> start!101498 m!1122725))

(declare-fun m!1122727 () Bool)

(assert (=> start!101498 m!1122727))

(declare-fun m!1122729 () Bool)

(assert (=> b!1217647 m!1122729))

(declare-fun m!1122731 () Bool)

(assert (=> b!1217634 m!1122731))

(declare-fun m!1122733 () Bool)

(assert (=> b!1217634 m!1122733))

(assert (=> b!1217634 m!1122733))

(declare-fun m!1122735 () Bool)

(assert (=> b!1217634 m!1122735))

(declare-fun m!1122737 () Bool)

(assert (=> b!1217634 m!1122737))

(declare-fun m!1122739 () Bool)

(assert (=> b!1217646 m!1122739))

(check-sat (not b_lambda!21855) (not b!1217637) (not b!1217634) b_and!43491 (not start!101498) (not b!1217642) (not b!1217644) (not b_next!26185) (not b!1217646) (not mapNonEmpty!48208) tp_is_empty!30889 (not b!1217638) (not b!1217640) (not b!1217636) (not b!1217647))
(check-sat b_and!43491 (not b_next!26185))
