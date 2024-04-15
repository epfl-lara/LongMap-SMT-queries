; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112684 () Bool)

(assert start!112684)

(declare-fun b_free!31021 () Bool)

(declare-fun b_next!31021 () Bool)

(assert (=> start!112684 (= b_free!31021 (not b_next!31021))))

(declare-fun tp!108704 () Bool)

(declare-fun b_and!49961 () Bool)

(assert (=> start!112684 (= tp!108704 b_and!49961)))

(declare-fun b!1336639 () Bool)

(declare-fun res!887071 () Bool)

(declare-fun e!761149 () Bool)

(assert (=> b!1336639 (=> (not res!887071) (not e!761149))))

(declare-datatypes ((array!90667 0))(
  ( (array!90668 (arr!43799 (Array (_ BitVec 32) (_ BitVec 64))) (size!44351 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90667)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90667 (_ BitVec 32)) Bool)

(assert (=> b!1336639 (= res!887071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336640 () Bool)

(declare-fun e!761148 () Bool)

(declare-fun tp_is_empty!36931 () Bool)

(assert (=> b!1336640 (= e!761148 tp_is_empty!36931)))

(declare-fun b!1336641 () Bool)

(declare-fun res!887068 () Bool)

(assert (=> b!1336641 (=> (not res!887068) (not e!761149))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336641 (= res!887068 (validKeyInArray!0 (select (arr!43799 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!57074 () Bool)

(declare-fun mapRes!57074 () Bool)

(declare-fun tp!108705 () Bool)

(assert (=> mapNonEmpty!57074 (= mapRes!57074 (and tp!108705 e!761148))))

(declare-datatypes ((V!54345 0))(
  ( (V!54346 (val!18540 Int)) )
))
(declare-datatypes ((ValueCell!17567 0))(
  ( (ValueCellFull!17567 (v!21179 V!54345)) (EmptyCell!17567) )
))
(declare-fun mapRest!57074 () (Array (_ BitVec 32) ValueCell!17567))

(declare-fun mapValue!57074 () ValueCell!17567)

(declare-fun mapKey!57074 () (_ BitVec 32))

(declare-datatypes ((array!90669 0))(
  ( (array!90670 (arr!43800 (Array (_ BitVec 32) ValueCell!17567)) (size!44352 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90669)

(assert (=> mapNonEmpty!57074 (= (arr!43800 _values!1320) (store mapRest!57074 mapKey!57074 mapValue!57074))))

(declare-fun b!1336643 () Bool)

(declare-fun res!887073 () Bool)

(assert (=> b!1336643 (=> (not res!887073) (not e!761149))))

(declare-datatypes ((List!31107 0))(
  ( (Nil!31104) (Cons!31103 (h!32312 (_ BitVec 64)) (t!45401 List!31107)) )
))
(declare-fun arrayNoDuplicates!0 (array!90667 (_ BitVec 32) List!31107) Bool)

(assert (=> b!1336643 (= res!887073 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31104))))

(declare-fun b!1336644 () Bool)

(assert (=> b!1336644 (= e!761149 (not true))))

(declare-datatypes ((tuple2!23976 0))(
  ( (tuple2!23977 (_1!11999 (_ BitVec 64)) (_2!11999 V!54345)) )
))
(declare-datatypes ((List!31108 0))(
  ( (Nil!31105) (Cons!31104 (h!32313 tuple2!23976) (t!45402 List!31108)) )
))
(declare-datatypes ((ListLongMap!21633 0))(
  ( (ListLongMap!21634 (toList!10832 List!31108)) )
))
(declare-fun lt!592639 () ListLongMap!21633)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8926 (ListLongMap!21633 (_ BitVec 64)) Bool)

(assert (=> b!1336644 (contains!8926 lt!592639 k0!1153)))

(declare-fun lt!592638 () V!54345)

(declare-datatypes ((Unit!43735 0))(
  ( (Unit!43736) )
))
(declare-fun lt!592637 () Unit!43735)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!310 ((_ BitVec 64) (_ BitVec 64) V!54345 ListLongMap!21633) Unit!43735)

(assert (=> b!1336644 (= lt!592637 (lemmaInListMapAfterAddingDiffThenInBefore!310 k0!1153 (select (arr!43799 _keys!1590) from!1980) lt!592638 lt!592639))))

(declare-fun lt!592640 () ListLongMap!21633)

(assert (=> b!1336644 (contains!8926 lt!592640 k0!1153)))

(declare-fun lt!592636 () Unit!43735)

(declare-fun minValue!1262 () V!54345)

(assert (=> b!1336644 (= lt!592636 (lemmaInListMapAfterAddingDiffThenInBefore!310 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592640))))

(declare-fun +!4765 (ListLongMap!21633 tuple2!23976) ListLongMap!21633)

(assert (=> b!1336644 (= lt!592640 (+!4765 lt!592639 (tuple2!23977 (select (arr!43799 _keys!1590) from!1980) lt!592638)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!22105 (ValueCell!17567 V!54345) V!54345)

(declare-fun dynLambda!3695 (Int (_ BitVec 64)) V!54345)

(assert (=> b!1336644 (= lt!592638 (get!22105 (select (arr!43800 _values!1320) from!1980) (dynLambda!3695 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54345)

(declare-fun getCurrentListMapNoExtraKeys!6408 (array!90667 array!90669 (_ BitVec 32) (_ BitVec 32) V!54345 V!54345 (_ BitVec 32) Int) ListLongMap!21633)

(assert (=> b!1336644 (= lt!592639 (getCurrentListMapNoExtraKeys!6408 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336645 () Bool)

(declare-fun res!887075 () Bool)

(assert (=> b!1336645 (=> (not res!887075) (not e!761149))))

(assert (=> b!1336645 (= res!887075 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336646 () Bool)

(declare-fun res!887076 () Bool)

(assert (=> b!1336646 (=> (not res!887076) (not e!761149))))

(assert (=> b!1336646 (= res!887076 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44351 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336647 () Bool)

(declare-fun res!887070 () Bool)

(assert (=> b!1336647 (=> (not res!887070) (not e!761149))))

(declare-fun getCurrentListMap!5685 (array!90667 array!90669 (_ BitVec 32) (_ BitVec 32) V!54345 V!54345 (_ BitVec 32) Int) ListLongMap!21633)

(assert (=> b!1336647 (= res!887070 (contains!8926 (getCurrentListMap!5685 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!57074 () Bool)

(assert (=> mapIsEmpty!57074 mapRes!57074))

(declare-fun b!1336642 () Bool)

(declare-fun res!887072 () Bool)

(assert (=> b!1336642 (=> (not res!887072) (not e!761149))))

(assert (=> b!1336642 (= res!887072 (and (= (size!44352 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44351 _keys!1590) (size!44352 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!887074 () Bool)

(assert (=> start!112684 (=> (not res!887074) (not e!761149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112684 (= res!887074 (validMask!0 mask!1998))))

(assert (=> start!112684 e!761149))

(declare-fun e!761151 () Bool)

(declare-fun array_inv!33225 (array!90669) Bool)

(assert (=> start!112684 (and (array_inv!33225 _values!1320) e!761151)))

(assert (=> start!112684 true))

(declare-fun array_inv!33226 (array!90667) Bool)

(assert (=> start!112684 (array_inv!33226 _keys!1590)))

(assert (=> start!112684 tp!108704))

(assert (=> start!112684 tp_is_empty!36931))

(declare-fun b!1336648 () Bool)

(declare-fun e!761150 () Bool)

(assert (=> b!1336648 (= e!761150 tp_is_empty!36931)))

(declare-fun b!1336649 () Bool)

(assert (=> b!1336649 (= e!761151 (and e!761150 mapRes!57074))))

(declare-fun condMapEmpty!57074 () Bool)

(declare-fun mapDefault!57074 () ValueCell!17567)

(assert (=> b!1336649 (= condMapEmpty!57074 (= (arr!43800 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17567)) mapDefault!57074)))))

(declare-fun b!1336650 () Bool)

(declare-fun res!887069 () Bool)

(assert (=> b!1336650 (=> (not res!887069) (not e!761149))))

(assert (=> b!1336650 (= res!887069 (not (= (select (arr!43799 _keys!1590) from!1980) k0!1153)))))

(assert (= (and start!112684 res!887074) b!1336642))

(assert (= (and b!1336642 res!887072) b!1336639))

(assert (= (and b!1336639 res!887071) b!1336643))

(assert (= (and b!1336643 res!887073) b!1336646))

(assert (= (and b!1336646 res!887076) b!1336647))

(assert (= (and b!1336647 res!887070) b!1336650))

(assert (= (and b!1336650 res!887069) b!1336641))

(assert (= (and b!1336641 res!887068) b!1336645))

(assert (= (and b!1336645 res!887075) b!1336644))

(assert (= (and b!1336649 condMapEmpty!57074) mapIsEmpty!57074))

(assert (= (and b!1336649 (not condMapEmpty!57074)) mapNonEmpty!57074))

(get-info :version)

(assert (= (and mapNonEmpty!57074 ((_ is ValueCellFull!17567) mapValue!57074)) b!1336640))

(assert (= (and b!1336649 ((_ is ValueCellFull!17567) mapDefault!57074)) b!1336648))

(assert (= start!112684 b!1336649))

(declare-fun b_lambda!24169 () Bool)

(assert (=> (not b_lambda!24169) (not b!1336644)))

(declare-fun t!45400 () Bool)

(declare-fun tb!12097 () Bool)

(assert (=> (and start!112684 (= defaultEntry!1323 defaultEntry!1323) t!45400) tb!12097))

(declare-fun result!25275 () Bool)

(assert (=> tb!12097 (= result!25275 tp_is_empty!36931)))

(assert (=> b!1336644 t!45400))

(declare-fun b_and!49963 () Bool)

(assert (= b_and!49961 (and (=> t!45400 result!25275) b_and!49963)))

(declare-fun m!1224253 () Bool)

(assert (=> b!1336639 m!1224253))

(declare-fun m!1224255 () Bool)

(assert (=> b!1336647 m!1224255))

(assert (=> b!1336647 m!1224255))

(declare-fun m!1224257 () Bool)

(assert (=> b!1336647 m!1224257))

(declare-fun m!1224259 () Bool)

(assert (=> b!1336643 m!1224259))

(declare-fun m!1224261 () Bool)

(assert (=> b!1336641 m!1224261))

(assert (=> b!1336641 m!1224261))

(declare-fun m!1224263 () Bool)

(assert (=> b!1336641 m!1224263))

(declare-fun m!1224265 () Bool)

(assert (=> b!1336644 m!1224265))

(assert (=> b!1336644 m!1224261))

(declare-fun m!1224267 () Bool)

(assert (=> b!1336644 m!1224267))

(declare-fun m!1224269 () Bool)

(assert (=> b!1336644 m!1224269))

(declare-fun m!1224271 () Bool)

(assert (=> b!1336644 m!1224271))

(declare-fun m!1224273 () Bool)

(assert (=> b!1336644 m!1224273))

(assert (=> b!1336644 m!1224261))

(assert (=> b!1336644 m!1224273))

(assert (=> b!1336644 m!1224265))

(declare-fun m!1224275 () Bool)

(assert (=> b!1336644 m!1224275))

(declare-fun m!1224277 () Bool)

(assert (=> b!1336644 m!1224277))

(declare-fun m!1224279 () Bool)

(assert (=> b!1336644 m!1224279))

(declare-fun m!1224281 () Bool)

(assert (=> b!1336644 m!1224281))

(declare-fun m!1224283 () Bool)

(assert (=> start!112684 m!1224283))

(declare-fun m!1224285 () Bool)

(assert (=> start!112684 m!1224285))

(declare-fun m!1224287 () Bool)

(assert (=> start!112684 m!1224287))

(declare-fun m!1224289 () Bool)

(assert (=> mapNonEmpty!57074 m!1224289))

(assert (=> b!1336650 m!1224261))

(check-sat (not b!1336644) tp_is_empty!36931 (not mapNonEmpty!57074) (not b!1336643) (not start!112684) (not b_lambda!24169) b_and!49963 (not b!1336647) (not b_next!31021) (not b!1336639) (not b!1336641))
(check-sat b_and!49963 (not b_next!31021))
