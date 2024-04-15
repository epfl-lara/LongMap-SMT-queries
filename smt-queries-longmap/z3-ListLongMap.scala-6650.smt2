; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83854 () Bool)

(assert start!83854)

(declare-fun b_free!19681 () Bool)

(declare-fun b_next!19681 () Bool)

(assert (=> start!83854 (= b_free!19681 (not b_next!19681))))

(declare-fun tp!68485 () Bool)

(declare-fun b_and!31425 () Bool)

(assert (=> start!83854 (= tp!68485 b_and!31425)))

(declare-fun b!979722 () Bool)

(declare-fun e!552231 () Bool)

(declare-fun tp_is_empty!22675 () Bool)

(assert (=> b!979722 (= e!552231 tp_is_empty!22675)))

(declare-fun b!979723 () Bool)

(declare-fun e!552232 () Bool)

(assert (=> b!979723 (= e!552232 tp_is_empty!22675)))

(declare-fun b!979724 () Bool)

(declare-fun res!655718 () Bool)

(declare-fun e!552234 () Bool)

(assert (=> b!979724 (=> (not res!655718) (not e!552234))))

(declare-datatypes ((array!61286 0))(
  ( (array!61287 (arr!29501 (Array (_ BitVec 32) (_ BitVec 64))) (size!29982 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61286)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979724 (= res!655718 (validKeyInArray!0 (select (arr!29501 _keys!1544) from!1932)))))

(declare-fun b!979725 () Bool)

(declare-fun res!655719 () Bool)

(assert (=> b!979725 (=> (not res!655719) (not e!552234))))

(declare-datatypes ((List!20501 0))(
  ( (Nil!20498) (Cons!20497 (h!21659 (_ BitVec 64)) (t!29129 List!20501)) )
))
(declare-fun arrayNoDuplicates!0 (array!61286 (_ BitVec 32) List!20501) Bool)

(assert (=> b!979725 (= res!655719 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20498))))

(declare-fun res!655716 () Bool)

(assert (=> start!83854 (=> (not res!655716) (not e!552234))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83854 (= res!655716 (validMask!0 mask!1948))))

(assert (=> start!83854 e!552234))

(assert (=> start!83854 true))

(assert (=> start!83854 tp_is_empty!22675))

(declare-datatypes ((V!35217 0))(
  ( (V!35218 (val!11388 Int)) )
))
(declare-datatypes ((ValueCell!10856 0))(
  ( (ValueCellFull!10856 (v!13949 V!35217)) (EmptyCell!10856) )
))
(declare-datatypes ((array!61288 0))(
  ( (array!61289 (arr!29502 (Array (_ BitVec 32) ValueCell!10856)) (size!29983 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61288)

(declare-fun e!552233 () Bool)

(declare-fun array_inv!22835 (array!61288) Bool)

(assert (=> start!83854 (and (array_inv!22835 _values!1278) e!552233)))

(assert (=> start!83854 tp!68485))

(declare-fun array_inv!22836 (array!61286) Bool)

(assert (=> start!83854 (array_inv!22836 _keys!1544)))

(declare-fun b!979726 () Bool)

(declare-fun res!655714 () Bool)

(assert (=> b!979726 (=> (not res!655714) (not e!552234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61286 (_ BitVec 32)) Bool)

(assert (=> b!979726 (= res!655714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979727 () Bool)

(declare-fun e!552236 () Bool)

(assert (=> b!979727 (= e!552234 (not e!552236))))

(declare-fun res!655717 () Bool)

(assert (=> b!979727 (=> res!655717 e!552236)))

(assert (=> b!979727 (= res!655717 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29501 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14676 0))(
  ( (tuple2!14677 (_1!7349 (_ BitVec 64)) (_2!7349 V!35217)) )
))
(declare-datatypes ((List!20502 0))(
  ( (Nil!20499) (Cons!20498 (h!21660 tuple2!14676) (t!29130 List!20502)) )
))
(declare-datatypes ((ListLongMap!13363 0))(
  ( (ListLongMap!13364 (toList!6697 List!20502)) )
))
(declare-fun lt!434670 () ListLongMap!13363)

(declare-fun lt!434673 () tuple2!14676)

(declare-fun lt!434666 () ListLongMap!13363)

(declare-fun lt!434667 () tuple2!14676)

(declare-fun +!2997 (ListLongMap!13363 tuple2!14676) ListLongMap!13363)

(assert (=> b!979727 (= (+!2997 lt!434666 lt!434667) (+!2997 lt!434670 lt!434673))))

(declare-fun lt!434671 () ListLongMap!13363)

(assert (=> b!979727 (= lt!434670 (+!2997 lt!434671 lt!434667))))

(declare-fun lt!434669 () V!35217)

(assert (=> b!979727 (= lt!434667 (tuple2!14677 (select (arr!29501 _keys!1544) from!1932) lt!434669))))

(assert (=> b!979727 (= lt!434666 (+!2997 lt!434671 lt!434673))))

(declare-fun minValue!1220 () V!35217)

(assert (=> b!979727 (= lt!434673 (tuple2!14677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32460 0))(
  ( (Unit!32461) )
))
(declare-fun lt!434668 () Unit!32460)

(declare-fun addCommutativeForDiffKeys!601 (ListLongMap!13363 (_ BitVec 64) V!35217 (_ BitVec 64) V!35217) Unit!32460)

(assert (=> b!979727 (= lt!434668 (addCommutativeForDiffKeys!601 lt!434671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29501 _keys!1544) from!1932) lt!434669))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15303 (ValueCell!10856 V!35217) V!35217)

(declare-fun dynLambda!1745 (Int (_ BitVec 64)) V!35217)

(assert (=> b!979727 (= lt!434669 (get!15303 (select (arr!29502 _values!1278) from!1932) (dynLambda!1745 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434665 () ListLongMap!13363)

(declare-fun lt!434664 () tuple2!14676)

(assert (=> b!979727 (= lt!434671 (+!2997 lt!434665 lt!434664))))

(declare-fun zeroValue!1220 () V!35217)

(assert (=> b!979727 (= lt!434664 (tuple2!14677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3412 (array!61286 array!61288 (_ BitVec 32) (_ BitVec 32) V!35217 V!35217 (_ BitVec 32) Int) ListLongMap!13363)

(assert (=> b!979727 (= lt!434665 (getCurrentListMapNoExtraKeys!3412 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979728 () Bool)

(declare-fun res!655715 () Bool)

(assert (=> b!979728 (=> (not res!655715) (not e!552234))))

(assert (=> b!979728 (= res!655715 (and (= (size!29983 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29982 _keys!1544) (size!29983 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979729 () Bool)

(declare-fun res!655713 () Bool)

(assert (=> b!979729 (=> (not res!655713) (not e!552234))))

(assert (=> b!979729 (= res!655713 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979730 () Bool)

(declare-fun mapRes!36041 () Bool)

(assert (=> b!979730 (= e!552233 (and e!552231 mapRes!36041))))

(declare-fun condMapEmpty!36041 () Bool)

(declare-fun mapDefault!36041 () ValueCell!10856)

(assert (=> b!979730 (= condMapEmpty!36041 (= (arr!29502 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10856)) mapDefault!36041)))))

(declare-fun b!979731 () Bool)

(declare-fun res!655712 () Bool)

(assert (=> b!979731 (=> (not res!655712) (not e!552234))))

(assert (=> b!979731 (= res!655712 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29982 _keys!1544))))))

(declare-fun b!979732 () Bool)

(assert (=> b!979732 (= e!552236 true)))

(assert (=> b!979732 (= lt!434670 (+!2997 (+!2997 lt!434665 lt!434667) lt!434664))))

(declare-fun lt!434672 () Unit!32460)

(assert (=> b!979732 (= lt!434672 (addCommutativeForDiffKeys!601 lt!434665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29501 _keys!1544) from!1932) lt!434669))))

(declare-fun mapIsEmpty!36041 () Bool)

(assert (=> mapIsEmpty!36041 mapRes!36041))

(declare-fun mapNonEmpty!36041 () Bool)

(declare-fun tp!68486 () Bool)

(assert (=> mapNonEmpty!36041 (= mapRes!36041 (and tp!68486 e!552232))))

(declare-fun mapKey!36041 () (_ BitVec 32))

(declare-fun mapValue!36041 () ValueCell!10856)

(declare-fun mapRest!36041 () (Array (_ BitVec 32) ValueCell!10856))

(assert (=> mapNonEmpty!36041 (= (arr!29502 _values!1278) (store mapRest!36041 mapKey!36041 mapValue!36041))))

(assert (= (and start!83854 res!655716) b!979728))

(assert (= (and b!979728 res!655715) b!979726))

(assert (= (and b!979726 res!655714) b!979725))

(assert (= (and b!979725 res!655719) b!979731))

(assert (= (and b!979731 res!655712) b!979724))

(assert (= (and b!979724 res!655718) b!979729))

(assert (= (and b!979729 res!655713) b!979727))

(assert (= (and b!979727 (not res!655717)) b!979732))

(assert (= (and b!979730 condMapEmpty!36041) mapIsEmpty!36041))

(assert (= (and b!979730 (not condMapEmpty!36041)) mapNonEmpty!36041))

(get-info :version)

(assert (= (and mapNonEmpty!36041 ((_ is ValueCellFull!10856) mapValue!36041)) b!979723))

(assert (= (and b!979730 ((_ is ValueCellFull!10856) mapDefault!36041)) b!979722))

(assert (= start!83854 b!979730))

(declare-fun b_lambda!14707 () Bool)

(assert (=> (not b_lambda!14707) (not b!979727)))

(declare-fun t!29128 () Bool)

(declare-fun tb!6479 () Bool)

(assert (=> (and start!83854 (= defaultEntry!1281 defaultEntry!1281) t!29128) tb!6479))

(declare-fun result!12955 () Bool)

(assert (=> tb!6479 (= result!12955 tp_is_empty!22675)))

(assert (=> b!979727 t!29128))

(declare-fun b_and!31427 () Bool)

(assert (= b_and!31425 (and (=> t!29128 result!12955) b_and!31427)))

(declare-fun m!906617 () Bool)

(assert (=> b!979726 m!906617))

(declare-fun m!906619 () Bool)

(assert (=> b!979725 m!906619))

(declare-fun m!906621 () Bool)

(assert (=> b!979727 m!906621))

(declare-fun m!906623 () Bool)

(assert (=> b!979727 m!906623))

(declare-fun m!906625 () Bool)

(assert (=> b!979727 m!906625))

(declare-fun m!906627 () Bool)

(assert (=> b!979727 m!906627))

(declare-fun m!906629 () Bool)

(assert (=> b!979727 m!906629))

(declare-fun m!906631 () Bool)

(assert (=> b!979727 m!906631))

(declare-fun m!906633 () Bool)

(assert (=> b!979727 m!906633))

(assert (=> b!979727 m!906621))

(declare-fun m!906635 () Bool)

(assert (=> b!979727 m!906635))

(declare-fun m!906637 () Bool)

(assert (=> b!979727 m!906637))

(declare-fun m!906639 () Bool)

(assert (=> b!979727 m!906639))

(assert (=> b!979727 m!906623))

(assert (=> b!979727 m!906639))

(declare-fun m!906641 () Bool)

(assert (=> b!979727 m!906641))

(declare-fun m!906643 () Bool)

(assert (=> mapNonEmpty!36041 m!906643))

(assert (=> b!979724 m!906621))

(assert (=> b!979724 m!906621))

(declare-fun m!906645 () Bool)

(assert (=> b!979724 m!906645))

(declare-fun m!906647 () Bool)

(assert (=> b!979732 m!906647))

(assert (=> b!979732 m!906647))

(declare-fun m!906649 () Bool)

(assert (=> b!979732 m!906649))

(assert (=> b!979732 m!906621))

(assert (=> b!979732 m!906621))

(declare-fun m!906651 () Bool)

(assert (=> b!979732 m!906651))

(declare-fun m!906653 () Bool)

(assert (=> start!83854 m!906653))

(declare-fun m!906655 () Bool)

(assert (=> start!83854 m!906655))

(declare-fun m!906657 () Bool)

(assert (=> start!83854 m!906657))

(check-sat tp_is_empty!22675 (not b!979726) (not b!979727) (not b!979732) (not start!83854) (not b_next!19681) (not b!979724) b_and!31427 (not b!979725) (not b_lambda!14707) (not mapNonEmpty!36041))
(check-sat b_and!31427 (not b_next!19681))
