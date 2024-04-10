; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84030 () Bool)

(assert start!84030)

(declare-fun b_free!19785 () Bool)

(declare-fun b_next!19785 () Bool)

(assert (=> start!84030 (= b_free!19785 (not b_next!19785))))

(declare-fun tp!68878 () Bool)

(declare-fun b_and!31653 () Bool)

(assert (=> start!84030 (= tp!68878 b_and!31653)))

(declare-fun b!982279 () Bool)

(declare-fun e!553716 () Bool)

(declare-fun e!553715 () Bool)

(assert (=> b!982279 (= e!553716 e!553715)))

(declare-fun res!657335 () Bool)

(assert (=> b!982279 (=> (not res!657335) (not e!553715))))

(declare-datatypes ((array!61659 0))(
  ( (array!61660 (arr!29687 (Array (_ BitVec 32) (_ BitVec 64))) (size!30166 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61659)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982279 (= res!657335 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29687 _keys!1544) from!1932))))))

(declare-datatypes ((V!35427 0))(
  ( (V!35428 (val!11467 Int)) )
))
(declare-datatypes ((ValueCell!10935 0))(
  ( (ValueCellFull!10935 (v!14029 V!35427)) (EmptyCell!10935) )
))
(declare-datatypes ((array!61661 0))(
  ( (array!61662 (arr!29688 (Array (_ BitVec 32) ValueCell!10935)) (size!30167 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61661)

(declare-fun lt!436070 () V!35427)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15395 (ValueCell!10935 V!35427) V!35427)

(declare-fun dynLambda!1790 (Int (_ BitVec 64)) V!35427)

(assert (=> b!982279 (= lt!436070 (get!15395 (select (arr!29688 _values!1278) from!1932) (dynLambda!1790 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35427)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14686 0))(
  ( (tuple2!14687 (_1!7354 (_ BitVec 64)) (_2!7354 V!35427)) )
))
(declare-datatypes ((List!20567 0))(
  ( (Nil!20564) (Cons!20563 (h!21725 tuple2!14686) (t!29302 List!20567)) )
))
(declare-datatypes ((ListLongMap!13383 0))(
  ( (ListLongMap!13384 (toList!6707 List!20567)) )
))
(declare-fun lt!436068 () ListLongMap!13383)

(declare-fun zeroValue!1220 () V!35427)

(declare-fun getCurrentListMapNoExtraKeys!3407 (array!61659 array!61661 (_ BitVec 32) (_ BitVec 32) V!35427 V!35427 (_ BitVec 32) Int) ListLongMap!13383)

(assert (=> b!982279 (= lt!436068 (getCurrentListMapNoExtraKeys!3407 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982280 () Bool)

(declare-fun res!657331 () Bool)

(assert (=> b!982280 (=> (not res!657331) (not e!553716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982280 (= res!657331 (validKeyInArray!0 (select (arr!29687 _keys!1544) from!1932)))))

(declare-fun b!982281 () Bool)

(declare-fun res!657338 () Bool)

(assert (=> b!982281 (=> (not res!657338) (not e!553716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61659 (_ BitVec 32)) Bool)

(assert (=> b!982281 (= res!657338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36278 () Bool)

(declare-fun mapRes!36278 () Bool)

(declare-fun tp!68877 () Bool)

(declare-fun e!553713 () Bool)

(assert (=> mapNonEmpty!36278 (= mapRes!36278 (and tp!68877 e!553713))))

(declare-fun mapKey!36278 () (_ BitVec 32))

(declare-fun mapRest!36278 () (Array (_ BitVec 32) ValueCell!10935))

(declare-fun mapValue!36278 () ValueCell!10935)

(assert (=> mapNonEmpty!36278 (= (arr!29688 _values!1278) (store mapRest!36278 mapKey!36278 mapValue!36278))))

(declare-fun b!982282 () Bool)

(assert (=> b!982282 (= e!553715 (not (bvsle from!1932 (size!30166 _keys!1544))))))

(declare-fun lt!436069 () tuple2!14686)

(declare-fun lt!436067 () tuple2!14686)

(declare-fun +!3005 (ListLongMap!13383 tuple2!14686) ListLongMap!13383)

(assert (=> b!982282 (= (+!3005 (+!3005 lt!436068 lt!436069) lt!436067) (+!3005 (+!3005 lt!436068 lt!436067) lt!436069))))

(assert (=> b!982282 (= lt!436067 (tuple2!14687 (select (arr!29687 _keys!1544) from!1932) lt!436070))))

(assert (=> b!982282 (= lt!436069 (tuple2!14687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32649 0))(
  ( (Unit!32650) )
))
(declare-fun lt!436066 () Unit!32649)

(declare-fun addCommutativeForDiffKeys!633 (ListLongMap!13383 (_ BitVec 64) V!35427 (_ BitVec 64) V!35427) Unit!32649)

(assert (=> b!982282 (= lt!436066 (addCommutativeForDiffKeys!633 lt!436068 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29687 _keys!1544) from!1932) lt!436070))))

(declare-fun b!982283 () Bool)

(declare-fun e!553714 () Bool)

(declare-fun tp_is_empty!22833 () Bool)

(assert (=> b!982283 (= e!553714 tp_is_empty!22833)))

(declare-fun mapIsEmpty!36278 () Bool)

(assert (=> mapIsEmpty!36278 mapRes!36278))

(declare-fun b!982284 () Bool)

(declare-fun res!657334 () Bool)

(assert (=> b!982284 (=> (not res!657334) (not e!553716))))

(assert (=> b!982284 (= res!657334 (and (= (size!30167 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30166 _keys!1544) (size!30167 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982285 () Bool)

(declare-fun e!553712 () Bool)

(assert (=> b!982285 (= e!553712 (and e!553714 mapRes!36278))))

(declare-fun condMapEmpty!36278 () Bool)

(declare-fun mapDefault!36278 () ValueCell!10935)

(assert (=> b!982285 (= condMapEmpty!36278 (= (arr!29688 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10935)) mapDefault!36278)))))

(declare-fun b!982286 () Bool)

(declare-fun res!657337 () Bool)

(assert (=> b!982286 (=> (not res!657337) (not e!553716))))

(assert (=> b!982286 (= res!657337 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30166 _keys!1544))))))

(declare-fun b!982287 () Bool)

(assert (=> b!982287 (= e!553713 tp_is_empty!22833)))

(declare-fun b!982289 () Bool)

(declare-fun res!657336 () Bool)

(assert (=> b!982289 (=> (not res!657336) (not e!553716))))

(declare-datatypes ((List!20568 0))(
  ( (Nil!20565) (Cons!20564 (h!21726 (_ BitVec 64)) (t!29303 List!20568)) )
))
(declare-fun arrayNoDuplicates!0 (array!61659 (_ BitVec 32) List!20568) Bool)

(assert (=> b!982289 (= res!657336 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20565))))

(declare-fun b!982288 () Bool)

(declare-fun res!657332 () Bool)

(assert (=> b!982288 (=> (not res!657332) (not e!553716))))

(assert (=> b!982288 (= res!657332 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!657333 () Bool)

(assert (=> start!84030 (=> (not res!657333) (not e!553716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84030 (= res!657333 (validMask!0 mask!1948))))

(assert (=> start!84030 e!553716))

(assert (=> start!84030 true))

(assert (=> start!84030 tp_is_empty!22833))

(declare-fun array_inv!22957 (array!61661) Bool)

(assert (=> start!84030 (and (array_inv!22957 _values!1278) e!553712)))

(assert (=> start!84030 tp!68878))

(declare-fun array_inv!22958 (array!61659) Bool)

(assert (=> start!84030 (array_inv!22958 _keys!1544)))

(assert (= (and start!84030 res!657333) b!982284))

(assert (= (and b!982284 res!657334) b!982281))

(assert (= (and b!982281 res!657338) b!982289))

(assert (= (and b!982289 res!657336) b!982286))

(assert (= (and b!982286 res!657337) b!982280))

(assert (= (and b!982280 res!657331) b!982288))

(assert (= (and b!982288 res!657332) b!982279))

(assert (= (and b!982279 res!657335) b!982282))

(assert (= (and b!982285 condMapEmpty!36278) mapIsEmpty!36278))

(assert (= (and b!982285 (not condMapEmpty!36278)) mapNonEmpty!36278))

(get-info :version)

(assert (= (and mapNonEmpty!36278 ((_ is ValueCellFull!10935) mapValue!36278)) b!982287))

(assert (= (and b!982285 ((_ is ValueCellFull!10935) mapDefault!36278)) b!982283))

(assert (= start!84030 b!982285))

(declare-fun b_lambda!14823 () Bool)

(assert (=> (not b_lambda!14823) (not b!982279)))

(declare-fun t!29301 () Bool)

(declare-fun tb!6585 () Bool)

(assert (=> (and start!84030 (= defaultEntry!1281 defaultEntry!1281) t!29301) tb!6585))

(declare-fun result!13159 () Bool)

(assert (=> tb!6585 (= result!13159 tp_is_empty!22833)))

(assert (=> b!982279 t!29301))

(declare-fun b_and!31655 () Bool)

(assert (= b_and!31653 (and (=> t!29301 result!13159) b_and!31655)))

(declare-fun m!909623 () Bool)

(assert (=> b!982281 m!909623))

(declare-fun m!909625 () Bool)

(assert (=> b!982279 m!909625))

(declare-fun m!909627 () Bool)

(assert (=> b!982279 m!909627))

(declare-fun m!909629 () Bool)

(assert (=> b!982279 m!909629))

(declare-fun m!909631 () Bool)

(assert (=> b!982279 m!909631))

(assert (=> b!982279 m!909627))

(assert (=> b!982279 m!909631))

(declare-fun m!909633 () Bool)

(assert (=> b!982279 m!909633))

(declare-fun m!909635 () Bool)

(assert (=> mapNonEmpty!36278 m!909635))

(declare-fun m!909637 () Bool)

(assert (=> b!982289 m!909637))

(assert (=> b!982280 m!909625))

(assert (=> b!982280 m!909625))

(declare-fun m!909639 () Bool)

(assert (=> b!982280 m!909639))

(declare-fun m!909641 () Bool)

(assert (=> start!84030 m!909641))

(declare-fun m!909643 () Bool)

(assert (=> start!84030 m!909643))

(declare-fun m!909645 () Bool)

(assert (=> start!84030 m!909645))

(declare-fun m!909647 () Bool)

(assert (=> b!982282 m!909647))

(declare-fun m!909649 () Bool)

(assert (=> b!982282 m!909649))

(assert (=> b!982282 m!909625))

(assert (=> b!982282 m!909647))

(declare-fun m!909651 () Bool)

(assert (=> b!982282 m!909651))

(assert (=> b!982282 m!909649))

(declare-fun m!909653 () Bool)

(assert (=> b!982282 m!909653))

(assert (=> b!982282 m!909625))

(declare-fun m!909655 () Bool)

(assert (=> b!982282 m!909655))

(check-sat (not b!982282) (not b_lambda!14823) b_and!31655 tp_is_empty!22833 (not mapNonEmpty!36278) (not start!84030) (not b!982280) (not b!982279) (not b_next!19785) (not b!982281) (not b!982289))
(check-sat b_and!31655 (not b_next!19785))
