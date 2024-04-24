; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83974 () Bool)

(assert start!83974)

(declare-fun b_free!19615 () Bool)

(declare-fun b_next!19615 () Bool)

(assert (=> start!83974 (= b_free!19615 (not b_next!19615))))

(declare-fun tp!68287 () Bool)

(declare-fun b_and!31329 () Bool)

(assert (=> start!83974 (= tp!68287 b_and!31329)))

(declare-fun mapNonEmpty!35942 () Bool)

(declare-fun mapRes!35942 () Bool)

(declare-fun tp!68288 () Bool)

(declare-fun e!552378 () Bool)

(assert (=> mapNonEmpty!35942 (= mapRes!35942 (and tp!68288 e!552378))))

(declare-fun mapKey!35942 () (_ BitVec 32))

(declare-datatypes ((V!35129 0))(
  ( (V!35130 (val!11355 Int)) )
))
(declare-datatypes ((ValueCell!10823 0))(
  ( (ValueCellFull!10823 (v!13914 V!35129)) (EmptyCell!10823) )
))
(declare-datatypes ((array!61268 0))(
  ( (array!61269 (arr!29487 (Array (_ BitVec 32) ValueCell!10823)) (size!29967 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61268)

(declare-fun mapRest!35942 () (Array (_ BitVec 32) ValueCell!10823))

(declare-fun mapValue!35942 () ValueCell!10823)

(assert (=> mapNonEmpty!35942 (= (arr!29487 _values!1278) (store mapRest!35942 mapKey!35942 mapValue!35942))))

(declare-fun mapIsEmpty!35942 () Bool)

(assert (=> mapIsEmpty!35942 mapRes!35942))

(declare-fun res!655381 () Bool)

(declare-fun e!552376 () Bool)

(assert (=> start!83974 (=> (not res!655381) (not e!552376))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83974 (= res!655381 (validMask!0 mask!1948))))

(assert (=> start!83974 e!552376))

(assert (=> start!83974 true))

(declare-fun tp_is_empty!22609 () Bool)

(assert (=> start!83974 tp_is_empty!22609))

(declare-fun e!552375 () Bool)

(declare-fun array_inv!22839 (array!61268) Bool)

(assert (=> start!83974 (and (array_inv!22839 _values!1278) e!552375)))

(assert (=> start!83974 tp!68287))

(declare-datatypes ((array!61270 0))(
  ( (array!61271 (arr!29488 (Array (_ BitVec 32) (_ BitVec 64))) (size!29968 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61270)

(declare-fun array_inv!22840 (array!61270) Bool)

(assert (=> start!83974 (array_inv!22840 _keys!1544)))

(declare-fun b!979716 () Bool)

(assert (=> b!979716 (= e!552376 (not true))))

(declare-datatypes ((tuple2!14570 0))(
  ( (tuple2!14571 (_1!7296 (_ BitVec 64)) (_2!7296 V!35129)) )
))
(declare-datatypes ((List!20431 0))(
  ( (Nil!20428) (Cons!20427 (h!21595 tuple2!14570) (t!28994 List!20431)) )
))
(declare-datatypes ((ListLongMap!13269 0))(
  ( (ListLongMap!13270 (toList!6650 List!20431)) )
))
(declare-fun lt!434309 () ListLongMap!13269)

(declare-fun lt!434307 () tuple2!14570)

(declare-fun lt!434310 () tuple2!14570)

(declare-fun +!2965 (ListLongMap!13269 tuple2!14570) ListLongMap!13269)

(assert (=> b!979716 (= (+!2965 (+!2965 lt!434309 lt!434307) lt!434310) (+!2965 (+!2965 lt!434309 lt!434310) lt!434307))))

(declare-fun lt!434308 () V!35129)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979716 (= lt!434310 (tuple2!14571 (select (arr!29488 _keys!1544) from!1932) lt!434308))))

(declare-fun minValue!1220 () V!35129)

(assert (=> b!979716 (= lt!434307 (tuple2!14571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32510 0))(
  ( (Unit!32511) )
))
(declare-fun lt!434306 () Unit!32510)

(declare-fun addCommutativeForDiffKeys!572 (ListLongMap!13269 (_ BitVec 64) V!35129 (_ BitVec 64) V!35129) Unit!32510)

(assert (=> b!979716 (= lt!434306 (addCommutativeForDiffKeys!572 lt!434309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29488 _keys!1544) from!1932) lt!434308))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15295 (ValueCell!10823 V!35129) V!35129)

(declare-fun dynLambda!1760 (Int (_ BitVec 64)) V!35129)

(assert (=> b!979716 (= lt!434308 (get!15295 (select (arr!29487 _values!1278) from!1932) (dynLambda!1760 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35129)

(declare-fun getCurrentListMapNoExtraKeys!3398 (array!61270 array!61268 (_ BitVec 32) (_ BitVec 32) V!35129 V!35129 (_ BitVec 32) Int) ListLongMap!13269)

(assert (=> b!979716 (= lt!434309 (+!2965 (getCurrentListMapNoExtraKeys!3398 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!979717 () Bool)

(declare-fun res!655383 () Bool)

(assert (=> b!979717 (=> (not res!655383) (not e!552376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61270 (_ BitVec 32)) Bool)

(assert (=> b!979717 (= res!655383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979718 () Bool)

(declare-fun res!655386 () Bool)

(assert (=> b!979718 (=> (not res!655386) (not e!552376))))

(assert (=> b!979718 (= res!655386 (and (= (size!29967 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29968 _keys!1544) (size!29967 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979719 () Bool)

(declare-fun res!655384 () Bool)

(assert (=> b!979719 (=> (not res!655384) (not e!552376))))

(declare-datatypes ((List!20432 0))(
  ( (Nil!20429) (Cons!20428 (h!21596 (_ BitVec 64)) (t!28995 List!20432)) )
))
(declare-fun arrayNoDuplicates!0 (array!61270 (_ BitVec 32) List!20432) Bool)

(assert (=> b!979719 (= res!655384 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20429))))

(declare-fun b!979720 () Bool)

(declare-fun e!552377 () Bool)

(assert (=> b!979720 (= e!552377 tp_is_empty!22609)))

(declare-fun b!979721 () Bool)

(declare-fun res!655385 () Bool)

(assert (=> b!979721 (=> (not res!655385) (not e!552376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979721 (= res!655385 (validKeyInArray!0 (select (arr!29488 _keys!1544) from!1932)))))

(declare-fun b!979722 () Bool)

(assert (=> b!979722 (= e!552378 tp_is_empty!22609)))

(declare-fun b!979723 () Bool)

(declare-fun res!655382 () Bool)

(assert (=> b!979723 (=> (not res!655382) (not e!552376))))

(assert (=> b!979723 (= res!655382 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979724 () Bool)

(assert (=> b!979724 (= e!552375 (and e!552377 mapRes!35942))))

(declare-fun condMapEmpty!35942 () Bool)

(declare-fun mapDefault!35942 () ValueCell!10823)

(assert (=> b!979724 (= condMapEmpty!35942 (= (arr!29487 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10823)) mapDefault!35942)))))

(declare-fun b!979725 () Bool)

(declare-fun res!655387 () Bool)

(assert (=> b!979725 (=> (not res!655387) (not e!552376))))

(assert (=> b!979725 (= res!655387 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29968 _keys!1544))))))

(assert (= (and start!83974 res!655381) b!979718))

(assert (= (and b!979718 res!655386) b!979717))

(assert (= (and b!979717 res!655383) b!979719))

(assert (= (and b!979719 res!655384) b!979725))

(assert (= (and b!979725 res!655387) b!979721))

(assert (= (and b!979721 res!655385) b!979723))

(assert (= (and b!979723 res!655382) b!979716))

(assert (= (and b!979724 condMapEmpty!35942) mapIsEmpty!35942))

(assert (= (and b!979724 (not condMapEmpty!35942)) mapNonEmpty!35942))

(get-info :version)

(assert (= (and mapNonEmpty!35942 ((_ is ValueCellFull!10823) mapValue!35942)) b!979722))

(assert (= (and b!979724 ((_ is ValueCellFull!10823) mapDefault!35942)) b!979720))

(assert (= start!83974 b!979724))

(declare-fun b_lambda!14673 () Bool)

(assert (=> (not b_lambda!14673) (not b!979716)))

(declare-fun t!28993 () Bool)

(declare-fun tb!6413 () Bool)

(assert (=> (and start!83974 (= defaultEntry!1281 defaultEntry!1281) t!28993) tb!6413))

(declare-fun result!12823 () Bool)

(assert (=> tb!6413 (= result!12823 tp_is_empty!22609)))

(assert (=> b!979716 t!28993))

(declare-fun b_and!31331 () Bool)

(assert (= b_and!31329 (and (=> t!28993 result!12823) b_and!31331)))

(declare-fun m!907301 () Bool)

(assert (=> b!979717 m!907301))

(declare-fun m!907303 () Bool)

(assert (=> b!979716 m!907303))

(declare-fun m!907305 () Bool)

(assert (=> b!979716 m!907305))

(declare-fun m!907307 () Bool)

(assert (=> b!979716 m!907307))

(declare-fun m!907309 () Bool)

(assert (=> b!979716 m!907309))

(declare-fun m!907311 () Bool)

(assert (=> b!979716 m!907311))

(assert (=> b!979716 m!907309))

(declare-fun m!907313 () Bool)

(assert (=> b!979716 m!907313))

(declare-fun m!907315 () Bool)

(assert (=> b!979716 m!907315))

(declare-fun m!907317 () Bool)

(assert (=> b!979716 m!907317))

(assert (=> b!979716 m!907315))

(assert (=> b!979716 m!907305))

(assert (=> b!979716 m!907311))

(declare-fun m!907319 () Bool)

(assert (=> b!979716 m!907319))

(declare-fun m!907321 () Bool)

(assert (=> b!979716 m!907321))

(assert (=> b!979716 m!907303))

(assert (=> b!979716 m!907321))

(declare-fun m!907323 () Bool)

(assert (=> b!979716 m!907323))

(assert (=> b!979721 m!907315))

(assert (=> b!979721 m!907315))

(declare-fun m!907325 () Bool)

(assert (=> b!979721 m!907325))

(declare-fun m!907327 () Bool)

(assert (=> b!979719 m!907327))

(declare-fun m!907329 () Bool)

(assert (=> start!83974 m!907329))

(declare-fun m!907331 () Bool)

(assert (=> start!83974 m!907331))

(declare-fun m!907333 () Bool)

(assert (=> start!83974 m!907333))

(declare-fun m!907335 () Bool)

(assert (=> mapNonEmpty!35942 m!907335))

(check-sat (not b!979716) (not b!979721) tp_is_empty!22609 (not b!979717) (not start!83974) (not mapNonEmpty!35942) b_and!31331 (not b!979719) (not b_lambda!14673) (not b_next!19615))
(check-sat b_and!31331 (not b_next!19615))
