; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99690 () Bool)

(assert start!99690)

(declare-fun b_free!25269 () Bool)

(declare-fun b_next!25269 () Bool)

(assert (=> start!99690 (= b_free!25269 (not b_next!25269))))

(declare-fun tp!88521 () Bool)

(declare-fun b_and!41405 () Bool)

(assert (=> start!99690 (= tp!88521 b_and!41405)))

(declare-fun b!1182625 () Bool)

(declare-fun e!672381 () Bool)

(declare-fun e!672372 () Bool)

(assert (=> b!1182625 (= e!672381 e!672372)))

(declare-fun res!785960 () Bool)

(assert (=> b!1182625 (=> res!785960 e!672372)))

(declare-datatypes ((array!76401 0))(
  ( (array!76402 (arr!36850 (Array (_ BitVec 32) (_ BitVec 64))) (size!37386 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76401)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182625 (= res!785960 (not (validKeyInArray!0 (select (arr!36850 _keys!1208) from!1455))))))

(declare-datatypes ((V!44859 0))(
  ( (V!44860 (val!14956 Int)) )
))
(declare-datatypes ((tuple2!19170 0))(
  ( (tuple2!19171 (_1!9596 (_ BitVec 64)) (_2!9596 V!44859)) )
))
(declare-datatypes ((List!25910 0))(
  ( (Nil!25907) (Cons!25906 (h!27115 tuple2!19170) (t!38171 List!25910)) )
))
(declare-datatypes ((ListLongMap!17139 0))(
  ( (ListLongMap!17140 (toList!8585 List!25910)) )
))
(declare-fun lt!535428 () ListLongMap!17139)

(declare-fun lt!535420 () ListLongMap!17139)

(assert (=> b!1182625 (= lt!535428 lt!535420)))

(declare-fun lt!535434 () ListLongMap!17139)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1622 (ListLongMap!17139 (_ BitVec 64)) ListLongMap!17139)

(assert (=> b!1182625 (= lt!535420 (-!1622 lt!535434 k0!934))))

(declare-fun zeroValue!944 () V!44859)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14190 0))(
  ( (ValueCellFull!14190 (v!17594 V!44859)) (EmptyCell!14190) )
))
(declare-datatypes ((array!76403 0))(
  ( (array!76404 (arr!36851 (Array (_ BitVec 32) ValueCell!14190)) (size!37387 (_ BitVec 32))) )
))
(declare-fun lt!535424 () array!76403)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!535432 () array!76401)

(declare-fun minValue!944 () V!44859)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5036 (array!76401 array!76403 (_ BitVec 32) (_ BitVec 32) V!44859 V!44859 (_ BitVec 32) Int) ListLongMap!17139)

(assert (=> b!1182625 (= lt!535428 (getCurrentListMapNoExtraKeys!5036 lt!535432 lt!535424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76403)

(assert (=> b!1182625 (= lt!535434 (getCurrentListMapNoExtraKeys!5036 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39129 0))(
  ( (Unit!39130) )
))
(declare-fun lt!535430 () Unit!39129)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!844 (array!76401 array!76403 (_ BitVec 32) (_ BitVec 32) V!44859 V!44859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39129)

(assert (=> b!1182625 (= lt!535430 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!844 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182626 () Bool)

(declare-fun e!672377 () Bool)

(declare-fun e!672379 () Bool)

(assert (=> b!1182626 (= e!672377 (not e!672379))))

(declare-fun res!785955 () Bool)

(assert (=> b!1182626 (=> res!785955 e!672379)))

(assert (=> b!1182626 (= res!785955 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182626 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535433 () Unit!39129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76401 (_ BitVec 64) (_ BitVec 32)) Unit!39129)

(assert (=> b!1182626 (= lt!535433 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182627 () Bool)

(declare-fun res!785962 () Bool)

(declare-fun e!672374 () Bool)

(assert (=> b!1182627 (=> (not res!785962) (not e!672374))))

(assert (=> b!1182627 (= res!785962 (= (select (arr!36850 _keys!1208) i!673) k0!934))))

(declare-fun b!1182628 () Bool)

(declare-fun e!672378 () Unit!39129)

(declare-fun Unit!39131 () Unit!39129)

(assert (=> b!1182628 (= e!672378 Unit!39131)))

(declare-fun lt!535429 () Unit!39129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39129)

(assert (=> b!1182628 (= lt!535429 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182628 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535426 () Unit!39129)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76401 (_ BitVec 32) (_ BitVec 32)) Unit!39129)

(assert (=> b!1182628 (= lt!535426 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25911 0))(
  ( (Nil!25908) (Cons!25907 (h!27116 (_ BitVec 64)) (t!38172 List!25911)) )
))
(declare-fun arrayNoDuplicates!0 (array!76401 (_ BitVec 32) List!25911) Bool)

(assert (=> b!1182628 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25908)))

(declare-fun lt!535427 () Unit!39129)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76401 (_ BitVec 64) (_ BitVec 32) List!25911) Unit!39129)

(assert (=> b!1182628 (= lt!535427 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25908))))

(assert (=> b!1182628 false))

(declare-fun e!672371 () Bool)

(declare-fun b!1182629 () Bool)

(assert (=> b!1182629 (= e!672371 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182630 () Bool)

(declare-fun e!672380 () Bool)

(assert (=> b!1182630 (= e!672380 e!672371)))

(declare-fun res!785967 () Bool)

(assert (=> b!1182630 (=> res!785967 e!672371)))

(assert (=> b!1182630 (= res!785967 (not (= (select (arr!36850 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182631 () Bool)

(declare-fun res!785957 () Bool)

(assert (=> b!1182631 (=> (not res!785957) (not e!672374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182631 (= res!785957 (validMask!0 mask!1564))))

(declare-fun b!1182632 () Bool)

(assert (=> b!1182632 (= e!672379 e!672381)))

(declare-fun res!785956 () Bool)

(assert (=> b!1182632 (=> res!785956 e!672381)))

(assert (=> b!1182632 (= res!785956 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!535435 () ListLongMap!17139)

(assert (=> b!1182632 (= lt!535435 (getCurrentListMapNoExtraKeys!5036 lt!535432 lt!535424 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535423 () V!44859)

(assert (=> b!1182632 (= lt!535424 (array!76404 (store (arr!36851 _values!996) i!673 (ValueCellFull!14190 lt!535423)) (size!37387 _values!996)))))

(declare-fun dynLambda!2991 (Int (_ BitVec 64)) V!44859)

(assert (=> b!1182632 (= lt!535423 (dynLambda!2991 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535425 () ListLongMap!17139)

(assert (=> b!1182632 (= lt!535425 (getCurrentListMapNoExtraKeys!5036 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182633 () Bool)

(declare-fun Unit!39132 () Unit!39129)

(assert (=> b!1182633 (= e!672378 Unit!39132)))

(declare-fun b!1182634 () Bool)

(declare-fun res!785966 () Bool)

(assert (=> b!1182634 (=> (not res!785966) (not e!672374))))

(assert (=> b!1182634 (= res!785966 (and (= (size!37387 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37386 _keys!1208) (size!37387 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182635 () Bool)

(declare-fun e!672382 () Bool)

(declare-fun tp_is_empty!29799 () Bool)

(assert (=> b!1182635 (= e!672382 tp_is_empty!29799)))

(declare-fun b!1182636 () Bool)

(declare-fun res!785963 () Bool)

(assert (=> b!1182636 (=> (not res!785963) (not e!672374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76401 (_ BitVec 32)) Bool)

(assert (=> b!1182636 (= res!785963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!785958 () Bool)

(assert (=> start!99690 (=> (not res!785958) (not e!672374))))

(assert (=> start!99690 (= res!785958 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37386 _keys!1208))))))

(assert (=> start!99690 e!672374))

(assert (=> start!99690 tp_is_empty!29799))

(declare-fun array_inv!28134 (array!76401) Bool)

(assert (=> start!99690 (array_inv!28134 _keys!1208)))

(assert (=> start!99690 true))

(assert (=> start!99690 tp!88521))

(declare-fun e!672376 () Bool)

(declare-fun array_inv!28135 (array!76403) Bool)

(assert (=> start!99690 (and (array_inv!28135 _values!996) e!672376)))

(declare-fun b!1182637 () Bool)

(declare-fun res!785959 () Bool)

(assert (=> b!1182637 (=> (not res!785959) (not e!672377))))

(assert (=> b!1182637 (= res!785959 (arrayNoDuplicates!0 lt!535432 #b00000000000000000000000000000000 Nil!25908))))

(declare-fun b!1182638 () Bool)

(assert (=> b!1182638 (= e!672374 e!672377)))

(declare-fun res!785968 () Bool)

(assert (=> b!1182638 (=> (not res!785968) (not e!672377))))

(assert (=> b!1182638 (= res!785968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535432 mask!1564))))

(assert (=> b!1182638 (= lt!535432 (array!76402 (store (arr!36850 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37386 _keys!1208)))))

(declare-fun b!1182639 () Bool)

(assert (=> b!1182639 (= e!672372 true)))

(declare-fun lt!535431 () ListLongMap!17139)

(declare-fun lt!535436 () ListLongMap!17139)

(assert (=> b!1182639 (= (-!1622 lt!535431 k0!934) lt!535436)))

(declare-fun lt!535419 () Unit!39129)

(declare-fun lt!535421 () V!44859)

(declare-fun addRemoveCommutativeForDiffKeys!151 (ListLongMap!17139 (_ BitVec 64) V!44859 (_ BitVec 64)) Unit!39129)

(assert (=> b!1182639 (= lt!535419 (addRemoveCommutativeForDiffKeys!151 lt!535434 (select (arr!36850 _keys!1208) from!1455) lt!535421 k0!934))))

(assert (=> b!1182639 (and (= lt!535425 lt!535431) (= lt!535420 lt!535428))))

(declare-fun lt!535437 () tuple2!19170)

(declare-fun +!3888 (ListLongMap!17139 tuple2!19170) ListLongMap!17139)

(assert (=> b!1182639 (= lt!535431 (+!3888 lt!535434 lt!535437))))

(assert (=> b!1182639 (not (= (select (arr!36850 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535422 () Unit!39129)

(assert (=> b!1182639 (= lt!535422 e!672378)))

(declare-fun c!117027 () Bool)

(assert (=> b!1182639 (= c!117027 (= (select (arr!36850 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182639 e!672380))

(declare-fun res!785964 () Bool)

(assert (=> b!1182639 (=> (not res!785964) (not e!672380))))

(assert (=> b!1182639 (= res!785964 (= lt!535435 lt!535436))))

(assert (=> b!1182639 (= lt!535436 (+!3888 lt!535420 lt!535437))))

(assert (=> b!1182639 (= lt!535437 (tuple2!19171 (select (arr!36850 _keys!1208) from!1455) lt!535421))))

(declare-fun get!18851 (ValueCell!14190 V!44859) V!44859)

(assert (=> b!1182639 (= lt!535421 (get!18851 (select (arr!36851 _values!996) from!1455) lt!535423))))

(declare-fun mapNonEmpty!46526 () Bool)

(declare-fun mapRes!46526 () Bool)

(declare-fun tp!88520 () Bool)

(assert (=> mapNonEmpty!46526 (= mapRes!46526 (and tp!88520 e!672382))))

(declare-fun mapKey!46526 () (_ BitVec 32))

(declare-fun mapRest!46526 () (Array (_ BitVec 32) ValueCell!14190))

(declare-fun mapValue!46526 () ValueCell!14190)

(assert (=> mapNonEmpty!46526 (= (arr!36851 _values!996) (store mapRest!46526 mapKey!46526 mapValue!46526))))

(declare-fun b!1182640 () Bool)

(declare-fun e!672373 () Bool)

(assert (=> b!1182640 (= e!672376 (and e!672373 mapRes!46526))))

(declare-fun condMapEmpty!46526 () Bool)

(declare-fun mapDefault!46526 () ValueCell!14190)

(assert (=> b!1182640 (= condMapEmpty!46526 (= (arr!36851 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14190)) mapDefault!46526)))))

(declare-fun b!1182641 () Bool)

(assert (=> b!1182641 (= e!672373 tp_is_empty!29799)))

(declare-fun b!1182642 () Bool)

(declare-fun res!785961 () Bool)

(assert (=> b!1182642 (=> (not res!785961) (not e!672374))))

(assert (=> b!1182642 (= res!785961 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25908))))

(declare-fun mapIsEmpty!46526 () Bool)

(assert (=> mapIsEmpty!46526 mapRes!46526))

(declare-fun b!1182643 () Bool)

(declare-fun res!785954 () Bool)

(assert (=> b!1182643 (=> (not res!785954) (not e!672374))))

(assert (=> b!1182643 (= res!785954 (validKeyInArray!0 k0!934))))

(declare-fun b!1182644 () Bool)

(declare-fun res!785965 () Bool)

(assert (=> b!1182644 (=> (not res!785965) (not e!672374))))

(assert (=> b!1182644 (= res!785965 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37386 _keys!1208))))))

(assert (= (and start!99690 res!785958) b!1182631))

(assert (= (and b!1182631 res!785957) b!1182634))

(assert (= (and b!1182634 res!785966) b!1182636))

(assert (= (and b!1182636 res!785963) b!1182642))

(assert (= (and b!1182642 res!785961) b!1182644))

(assert (= (and b!1182644 res!785965) b!1182643))

(assert (= (and b!1182643 res!785954) b!1182627))

(assert (= (and b!1182627 res!785962) b!1182638))

(assert (= (and b!1182638 res!785968) b!1182637))

(assert (= (and b!1182637 res!785959) b!1182626))

(assert (= (and b!1182626 (not res!785955)) b!1182632))

(assert (= (and b!1182632 (not res!785956)) b!1182625))

(assert (= (and b!1182625 (not res!785960)) b!1182639))

(assert (= (and b!1182639 res!785964) b!1182630))

(assert (= (and b!1182630 (not res!785967)) b!1182629))

(assert (= (and b!1182639 c!117027) b!1182628))

(assert (= (and b!1182639 (not c!117027)) b!1182633))

(assert (= (and b!1182640 condMapEmpty!46526) mapIsEmpty!46526))

(assert (= (and b!1182640 (not condMapEmpty!46526)) mapNonEmpty!46526))

(get-info :version)

(assert (= (and mapNonEmpty!46526 ((_ is ValueCellFull!14190) mapValue!46526)) b!1182635))

(assert (= (and b!1182640 ((_ is ValueCellFull!14190) mapDefault!46526)) b!1182641))

(assert (= start!99690 b!1182640))

(declare-fun b_lambda!20413 () Bool)

(assert (=> (not b_lambda!20413) (not b!1182632)))

(declare-fun t!38170 () Bool)

(declare-fun tb!10081 () Bool)

(assert (=> (and start!99690 (= defaultEntry!1004 defaultEntry!1004) t!38170) tb!10081))

(declare-fun result!20729 () Bool)

(assert (=> tb!10081 (= result!20729 tp_is_empty!29799)))

(assert (=> b!1182632 t!38170))

(declare-fun b_and!41407 () Bool)

(assert (= b_and!41405 (and (=> t!38170 result!20729) b_and!41407)))

(declare-fun m!1090675 () Bool)

(assert (=> b!1182637 m!1090675))

(declare-fun m!1090677 () Bool)

(assert (=> b!1182642 m!1090677))

(declare-fun m!1090679 () Bool)

(assert (=> b!1182629 m!1090679))

(declare-fun m!1090681 () Bool)

(assert (=> b!1182627 m!1090681))

(declare-fun m!1090683 () Bool)

(assert (=> b!1182638 m!1090683))

(declare-fun m!1090685 () Bool)

(assert (=> b!1182638 m!1090685))

(declare-fun m!1090687 () Bool)

(assert (=> start!99690 m!1090687))

(declare-fun m!1090689 () Bool)

(assert (=> start!99690 m!1090689))

(declare-fun m!1090691 () Bool)

(assert (=> b!1182628 m!1090691))

(declare-fun m!1090693 () Bool)

(assert (=> b!1182628 m!1090693))

(declare-fun m!1090695 () Bool)

(assert (=> b!1182628 m!1090695))

(declare-fun m!1090697 () Bool)

(assert (=> b!1182628 m!1090697))

(declare-fun m!1090699 () Bool)

(assert (=> b!1182628 m!1090699))

(declare-fun m!1090701 () Bool)

(assert (=> b!1182626 m!1090701))

(declare-fun m!1090703 () Bool)

(assert (=> b!1182626 m!1090703))

(declare-fun m!1090705 () Bool)

(assert (=> b!1182630 m!1090705))

(declare-fun m!1090707 () Bool)

(assert (=> b!1182636 m!1090707))

(declare-fun m!1090709 () Bool)

(assert (=> b!1182631 m!1090709))

(declare-fun m!1090711 () Bool)

(assert (=> b!1182639 m!1090711))

(declare-fun m!1090713 () Bool)

(assert (=> b!1182639 m!1090713))

(declare-fun m!1090715 () Bool)

(assert (=> b!1182639 m!1090715))

(assert (=> b!1182639 m!1090713))

(declare-fun m!1090717 () Bool)

(assert (=> b!1182639 m!1090717))

(declare-fun m!1090719 () Bool)

(assert (=> b!1182639 m!1090719))

(assert (=> b!1182639 m!1090705))

(declare-fun m!1090721 () Bool)

(assert (=> b!1182639 m!1090721))

(assert (=> b!1182639 m!1090705))

(declare-fun m!1090723 () Bool)

(assert (=> b!1182643 m!1090723))

(declare-fun m!1090725 () Bool)

(assert (=> b!1182625 m!1090725))

(declare-fun m!1090727 () Bool)

(assert (=> b!1182625 m!1090727))

(assert (=> b!1182625 m!1090705))

(declare-fun m!1090729 () Bool)

(assert (=> b!1182625 m!1090729))

(assert (=> b!1182625 m!1090705))

(declare-fun m!1090731 () Bool)

(assert (=> b!1182625 m!1090731))

(declare-fun m!1090733 () Bool)

(assert (=> b!1182625 m!1090733))

(declare-fun m!1090735 () Bool)

(assert (=> b!1182632 m!1090735))

(declare-fun m!1090737 () Bool)

(assert (=> b!1182632 m!1090737))

(declare-fun m!1090739 () Bool)

(assert (=> b!1182632 m!1090739))

(declare-fun m!1090741 () Bool)

(assert (=> b!1182632 m!1090741))

(declare-fun m!1090743 () Bool)

(assert (=> mapNonEmpty!46526 m!1090743))

(check-sat (not b!1182637) (not start!99690) (not mapNonEmpty!46526) (not b!1182626) (not b!1182642) b_and!41407 (not b!1182643) (not b!1182628) (not b!1182638) (not b_next!25269) (not b!1182625) (not b!1182639) (not b!1182636) (not b!1182631) (not b!1182632) (not b!1182629) tp_is_empty!29799 (not b_lambda!20413))
(check-sat b_and!41407 (not b_next!25269))
