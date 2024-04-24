; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83992 () Bool)

(assert start!83992)

(declare-fun b_free!19633 () Bool)

(declare-fun b_next!19633 () Bool)

(assert (=> start!83992 (= b_free!19633 (not b_next!19633))))

(declare-fun tp!68341 () Bool)

(declare-fun b_and!31365 () Bool)

(assert (=> start!83992 (= tp!68341 b_and!31365)))

(declare-fun b!980024 () Bool)

(declare-fun e!552531 () Bool)

(assert (=> b!980024 (= e!552531 true)))

(declare-datatypes ((V!35153 0))(
  ( (V!35154 (val!11364 Int)) )
))
(declare-datatypes ((tuple2!14584 0))(
  ( (tuple2!14585 (_1!7303 (_ BitVec 64)) (_2!7303 V!35153)) )
))
(declare-fun lt!434550 () tuple2!14584)

(declare-datatypes ((List!20444 0))(
  ( (Nil!20441) (Cons!20440 (h!21608 tuple2!14584) (t!29025 List!20444)) )
))
(declare-datatypes ((ListLongMap!13283 0))(
  ( (ListLongMap!13284 (toList!6657 List!20444)) )
))
(declare-fun lt!434549 () ListLongMap!13283)

(declare-fun lt!434541 () ListLongMap!13283)

(declare-fun lt!434545 () tuple2!14584)

(declare-fun +!2972 (ListLongMap!13283 tuple2!14584) ListLongMap!13283)

(assert (=> b!980024 (= lt!434549 (+!2972 (+!2972 lt!434541 lt!434550) lt!434545))))

(declare-fun lt!434548 () V!35153)

(declare-datatypes ((Unit!32524 0))(
  ( (Unit!32525) )
))
(declare-fun lt!434542 () Unit!32524)

(declare-fun zeroValue!1220 () V!35153)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61300 0))(
  ( (array!61301 (arr!29503 (Array (_ BitVec 32) (_ BitVec 64))) (size!29983 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61300)

(declare-fun addCommutativeForDiffKeys!579 (ListLongMap!13283 (_ BitVec 64) V!35153 (_ BitVec 64) V!35153) Unit!32524)

(assert (=> b!980024 (= lt!434542 (addCommutativeForDiffKeys!579 lt!434541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29503 _keys!1544) from!1932) lt!434548))))

(declare-fun mapNonEmpty!35969 () Bool)

(declare-fun mapRes!35969 () Bool)

(declare-fun tp!68342 () Bool)

(declare-fun e!552533 () Bool)

(assert (=> mapNonEmpty!35969 (= mapRes!35969 (and tp!68342 e!552533))))

(declare-datatypes ((ValueCell!10832 0))(
  ( (ValueCellFull!10832 (v!13923 V!35153)) (EmptyCell!10832) )
))
(declare-fun mapRest!35969 () (Array (_ BitVec 32) ValueCell!10832))

(declare-fun mapKey!35969 () (_ BitVec 32))

(declare-fun mapValue!35969 () ValueCell!10832)

(declare-datatypes ((array!61302 0))(
  ( (array!61303 (arr!29504 (Array (_ BitVec 32) ValueCell!10832)) (size!29984 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61302)

(assert (=> mapNonEmpty!35969 (= (arr!29504 _values!1278) (store mapRest!35969 mapKey!35969 mapValue!35969))))

(declare-fun b!980025 () Bool)

(declare-fun e!552530 () Bool)

(declare-fun e!552534 () Bool)

(assert (=> b!980025 (= e!552530 (and e!552534 mapRes!35969))))

(declare-fun condMapEmpty!35969 () Bool)

(declare-fun mapDefault!35969 () ValueCell!10832)

(assert (=> b!980025 (= condMapEmpty!35969 (= (arr!29504 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10832)) mapDefault!35969)))))

(declare-fun b!980026 () Bool)

(declare-fun res!655594 () Bool)

(declare-fun e!552529 () Bool)

(assert (=> b!980026 (=> (not res!655594) (not e!552529))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980026 (= res!655594 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!35969 () Bool)

(assert (=> mapIsEmpty!35969 mapRes!35969))

(declare-fun b!980027 () Bool)

(declare-fun tp_is_empty!22627 () Bool)

(assert (=> b!980027 (= e!552534 tp_is_empty!22627)))

(declare-fun res!655593 () Bool)

(assert (=> start!83992 (=> (not res!655593) (not e!552529))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83992 (= res!655593 (validMask!0 mask!1948))))

(assert (=> start!83992 e!552529))

(assert (=> start!83992 true))

(assert (=> start!83992 tp_is_empty!22627))

(declare-fun array_inv!22849 (array!61302) Bool)

(assert (=> start!83992 (and (array_inv!22849 _values!1278) e!552530)))

(assert (=> start!83992 tp!68341))

(declare-fun array_inv!22850 (array!61300) Bool)

(assert (=> start!83992 (array_inv!22850 _keys!1544)))

(declare-fun b!980028 () Bool)

(declare-fun res!655597 () Bool)

(assert (=> b!980028 (=> (not res!655597) (not e!552529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980028 (= res!655597 (validKeyInArray!0 (select (arr!29503 _keys!1544) from!1932)))))

(declare-fun b!980029 () Bool)

(assert (=> b!980029 (= e!552533 tp_is_empty!22627)))

(declare-fun b!980030 () Bool)

(declare-fun res!655596 () Bool)

(assert (=> b!980030 (=> (not res!655596) (not e!552529))))

(declare-datatypes ((List!20445 0))(
  ( (Nil!20442) (Cons!20441 (h!21609 (_ BitVec 64)) (t!29026 List!20445)) )
))
(declare-fun arrayNoDuplicates!0 (array!61300 (_ BitVec 32) List!20445) Bool)

(assert (=> b!980030 (= res!655596 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20442))))

(declare-fun b!980031 () Bool)

(assert (=> b!980031 (= e!552529 (not e!552531))))

(declare-fun res!655590 () Bool)

(assert (=> b!980031 (=> res!655590 e!552531)))

(assert (=> b!980031 (= res!655590 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29503 _keys!1544) from!1932)))))

(declare-fun lt!434544 () ListLongMap!13283)

(declare-fun lt!434547 () tuple2!14584)

(assert (=> b!980031 (= (+!2972 lt!434544 lt!434550) (+!2972 lt!434549 lt!434547))))

(declare-fun lt!434543 () ListLongMap!13283)

(assert (=> b!980031 (= lt!434549 (+!2972 lt!434543 lt!434550))))

(assert (=> b!980031 (= lt!434550 (tuple2!14585 (select (arr!29503 _keys!1544) from!1932) lt!434548))))

(assert (=> b!980031 (= lt!434544 (+!2972 lt!434543 lt!434547))))

(declare-fun minValue!1220 () V!35153)

(assert (=> b!980031 (= lt!434547 (tuple2!14585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434546 () Unit!32524)

(assert (=> b!980031 (= lt!434546 (addCommutativeForDiffKeys!579 lt!434543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29503 _keys!1544) from!1932) lt!434548))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15308 (ValueCell!10832 V!35153) V!35153)

(declare-fun dynLambda!1767 (Int (_ BitVec 64)) V!35153)

(assert (=> b!980031 (= lt!434548 (get!15308 (select (arr!29504 _values!1278) from!1932) (dynLambda!1767 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980031 (= lt!434543 (+!2972 lt!434541 lt!434545))))

(assert (=> b!980031 (= lt!434545 (tuple2!14585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3405 (array!61300 array!61302 (_ BitVec 32) (_ BitVec 32) V!35153 V!35153 (_ BitVec 32) Int) ListLongMap!13283)

(assert (=> b!980031 (= lt!434541 (getCurrentListMapNoExtraKeys!3405 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980032 () Bool)

(declare-fun res!655591 () Bool)

(assert (=> b!980032 (=> (not res!655591) (not e!552529))))

(assert (=> b!980032 (= res!655591 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29983 _keys!1544))))))

(declare-fun b!980033 () Bool)

(declare-fun res!655595 () Bool)

(assert (=> b!980033 (=> (not res!655595) (not e!552529))))

(assert (=> b!980033 (= res!655595 (and (= (size!29984 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29983 _keys!1544) (size!29984 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980034 () Bool)

(declare-fun res!655592 () Bool)

(assert (=> b!980034 (=> (not res!655592) (not e!552529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61300 (_ BitVec 32)) Bool)

(assert (=> b!980034 (= res!655592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83992 res!655593) b!980033))

(assert (= (and b!980033 res!655595) b!980034))

(assert (= (and b!980034 res!655592) b!980030))

(assert (= (and b!980030 res!655596) b!980032))

(assert (= (and b!980032 res!655591) b!980028))

(assert (= (and b!980028 res!655597) b!980026))

(assert (= (and b!980026 res!655594) b!980031))

(assert (= (and b!980031 (not res!655590)) b!980024))

(assert (= (and b!980025 condMapEmpty!35969) mapIsEmpty!35969))

(assert (= (and b!980025 (not condMapEmpty!35969)) mapNonEmpty!35969))

(get-info :version)

(assert (= (and mapNonEmpty!35969 ((_ is ValueCellFull!10832) mapValue!35969)) b!980029))

(assert (= (and b!980025 ((_ is ValueCellFull!10832) mapDefault!35969)) b!980027))

(assert (= start!83992 b!980025))

(declare-fun b_lambda!14691 () Bool)

(assert (=> (not b_lambda!14691) (not b!980031)))

(declare-fun t!29024 () Bool)

(declare-fun tb!6431 () Bool)

(assert (=> (and start!83992 (= defaultEntry!1281 defaultEntry!1281) t!29024) tb!6431))

(declare-fun result!12859 () Bool)

(assert (=> tb!6431 (= result!12859 tp_is_empty!22627)))

(assert (=> b!980031 t!29024))

(declare-fun b_and!31367 () Bool)

(assert (= b_and!31365 (and (=> t!29024 result!12859) b_and!31367)))

(declare-fun m!907661 () Bool)

(assert (=> mapNonEmpty!35969 m!907661))

(declare-fun m!907663 () Bool)

(assert (=> start!83992 m!907663))

(declare-fun m!907665 () Bool)

(assert (=> start!83992 m!907665))

(declare-fun m!907667 () Bool)

(assert (=> start!83992 m!907667))

(declare-fun m!907669 () Bool)

(assert (=> b!980030 m!907669))

(declare-fun m!907671 () Bool)

(assert (=> b!980034 m!907671))

(declare-fun m!907673 () Bool)

(assert (=> b!980024 m!907673))

(assert (=> b!980024 m!907673))

(declare-fun m!907675 () Bool)

(assert (=> b!980024 m!907675))

(declare-fun m!907677 () Bool)

(assert (=> b!980024 m!907677))

(assert (=> b!980024 m!907677))

(declare-fun m!907679 () Bool)

(assert (=> b!980024 m!907679))

(declare-fun m!907681 () Bool)

(assert (=> b!980031 m!907681))

(assert (=> b!980031 m!907677))

(declare-fun m!907683 () Bool)

(assert (=> b!980031 m!907683))

(declare-fun m!907685 () Bool)

(assert (=> b!980031 m!907685))

(assert (=> b!980031 m!907677))

(declare-fun m!907687 () Bool)

(assert (=> b!980031 m!907687))

(declare-fun m!907689 () Bool)

(assert (=> b!980031 m!907689))

(declare-fun m!907691 () Bool)

(assert (=> b!980031 m!907691))

(declare-fun m!907693 () Bool)

(assert (=> b!980031 m!907693))

(declare-fun m!907695 () Bool)

(assert (=> b!980031 m!907695))

(declare-fun m!907697 () Bool)

(assert (=> b!980031 m!907697))

(assert (=> b!980031 m!907683))

(assert (=> b!980031 m!907697))

(declare-fun m!907699 () Bool)

(assert (=> b!980031 m!907699))

(assert (=> b!980028 m!907677))

(assert (=> b!980028 m!907677))

(declare-fun m!907701 () Bool)

(assert (=> b!980028 m!907701))

(check-sat (not b!980024) (not b!980031) b_and!31367 tp_is_empty!22627 (not b!980030) (not b_lambda!14691) (not start!83992) (not b!980034) (not mapNonEmpty!35969) (not b_next!19633) (not b!980028))
(check-sat b_and!31367 (not b_next!19633))
