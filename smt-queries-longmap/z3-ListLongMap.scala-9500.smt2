; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112666 () Bool)

(assert start!112666)

(declare-fun b_free!31003 () Bool)

(declare-fun b_next!31003 () Bool)

(assert (=> start!112666 (= b_free!31003 (not b_next!31003))))

(declare-fun tp!108650 () Bool)

(declare-fun b_and!49925 () Bool)

(assert (=> start!112666 (= tp!108650 b_and!49925)))

(declare-fun b!1336297 () Bool)

(declare-fun res!886827 () Bool)

(declare-fun e!761013 () Bool)

(assert (=> b!1336297 (=> (not res!886827) (not e!761013))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90633 0))(
  ( (array!90634 (arr!43782 (Array (_ BitVec 32) (_ BitVec 64))) (size!44334 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90633)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336297 (= res!886827 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44334 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336298 () Bool)

(declare-fun res!886831 () Bool)

(assert (=> b!1336298 (=> (not res!886831) (not e!761013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336298 (= res!886831 (validKeyInArray!0 (select (arr!43782 _keys!1590) from!1980)))))

(declare-fun b!1336299 () Bool)

(declare-fun res!886829 () Bool)

(assert (=> b!1336299 (=> (not res!886829) (not e!761013))))

(declare-datatypes ((V!54321 0))(
  ( (V!54322 (val!18531 Int)) )
))
(declare-datatypes ((ValueCell!17558 0))(
  ( (ValueCellFull!17558 (v!21170 V!54321)) (EmptyCell!17558) )
))
(declare-datatypes ((array!90635 0))(
  ( (array!90636 (arr!43783 (Array (_ BitVec 32) ValueCell!17558)) (size!44335 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90635)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54321)

(declare-fun zeroValue!1262 () V!54321)

(declare-datatypes ((tuple2!23964 0))(
  ( (tuple2!23965 (_1!11993 (_ BitVec 64)) (_2!11993 V!54321)) )
))
(declare-datatypes ((List!31097 0))(
  ( (Nil!31094) (Cons!31093 (h!32302 tuple2!23964) (t!45373 List!31097)) )
))
(declare-datatypes ((ListLongMap!21621 0))(
  ( (ListLongMap!21622 (toList!10826 List!31097)) )
))
(declare-fun contains!8920 (ListLongMap!21621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5680 (array!90633 array!90635 (_ BitVec 32) (_ BitVec 32) V!54321 V!54321 (_ BitVec 32) Int) ListLongMap!21621)

(assert (=> b!1336299 (= res!886829 (contains!8920 (getCurrentListMap!5680 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336300 () Bool)

(declare-fun res!886832 () Bool)

(assert (=> b!1336300 (=> (not res!886832) (not e!761013))))

(assert (=> b!1336300 (= res!886832 (and (= (size!44335 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44334 _keys!1590) (size!44335 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336301 () Bool)

(declare-fun e!761014 () Bool)

(declare-fun tp_is_empty!36913 () Bool)

(assert (=> b!1336301 (= e!761014 tp_is_empty!36913)))

(declare-fun b!1336303 () Bool)

(assert (=> b!1336303 (= e!761013 (not (bvslt from!1980 (size!44335 _values!1320))))))

(declare-fun lt!592577 () ListLongMap!21621)

(assert (=> b!1336303 (contains!8920 lt!592577 k0!1153)))

(declare-datatypes ((Unit!43723 0))(
  ( (Unit!43724) )
))
(declare-fun lt!592576 () Unit!43723)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!304 ((_ BitVec 64) (_ BitVec 64) V!54321 ListLongMap!21621) Unit!43723)

(assert (=> b!1336303 (= lt!592576 (lemmaInListMapAfterAddingDiffThenInBefore!304 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592577))))

(declare-fun +!4759 (ListLongMap!21621 tuple2!23964) ListLongMap!21621)

(declare-fun getCurrentListMapNoExtraKeys!6402 (array!90633 array!90635 (_ BitVec 32) (_ BitVec 32) V!54321 V!54321 (_ BitVec 32) Int) ListLongMap!21621)

(declare-fun get!22093 (ValueCell!17558 V!54321) V!54321)

(declare-fun dynLambda!3689 (Int (_ BitVec 64)) V!54321)

(assert (=> b!1336303 (= lt!592577 (+!4759 (getCurrentListMapNoExtraKeys!6402 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23965 (select (arr!43782 _keys!1590) from!1980) (get!22093 (select (arr!43783 _values!1320) from!1980) (dynLambda!3689 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!57047 () Bool)

(declare-fun mapRes!57047 () Bool)

(assert (=> mapIsEmpty!57047 mapRes!57047))

(declare-fun mapNonEmpty!57047 () Bool)

(declare-fun tp!108651 () Bool)

(declare-fun e!761017 () Bool)

(assert (=> mapNonEmpty!57047 (= mapRes!57047 (and tp!108651 e!761017))))

(declare-fun mapKey!57047 () (_ BitVec 32))

(declare-fun mapValue!57047 () ValueCell!17558)

(declare-fun mapRest!57047 () (Array (_ BitVec 32) ValueCell!17558))

(assert (=> mapNonEmpty!57047 (= (arr!43783 _values!1320) (store mapRest!57047 mapKey!57047 mapValue!57047))))

(declare-fun b!1336304 () Bool)

(declare-fun res!886830 () Bool)

(assert (=> b!1336304 (=> (not res!886830) (not e!761013))))

(assert (=> b!1336304 (= res!886830 (not (= (select (arr!43782 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336305 () Bool)

(declare-fun e!761015 () Bool)

(assert (=> b!1336305 (= e!761015 (and e!761014 mapRes!57047))))

(declare-fun condMapEmpty!57047 () Bool)

(declare-fun mapDefault!57047 () ValueCell!17558)

(assert (=> b!1336305 (= condMapEmpty!57047 (= (arr!43783 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17558)) mapDefault!57047)))))

(declare-fun b!1336306 () Bool)

(assert (=> b!1336306 (= e!761017 tp_is_empty!36913)))

(declare-fun b!1336302 () Bool)

(declare-fun res!886826 () Bool)

(assert (=> b!1336302 (=> (not res!886826) (not e!761013))))

(declare-datatypes ((List!31098 0))(
  ( (Nil!31095) (Cons!31094 (h!32303 (_ BitVec 64)) (t!45374 List!31098)) )
))
(declare-fun arrayNoDuplicates!0 (array!90633 (_ BitVec 32) List!31098) Bool)

(assert (=> b!1336302 (= res!886826 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31095))))

(declare-fun res!886825 () Bool)

(assert (=> start!112666 (=> (not res!886825) (not e!761013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112666 (= res!886825 (validMask!0 mask!1998))))

(assert (=> start!112666 e!761013))

(declare-fun array_inv!33211 (array!90635) Bool)

(assert (=> start!112666 (and (array_inv!33211 _values!1320) e!761015)))

(assert (=> start!112666 true))

(declare-fun array_inv!33212 (array!90633) Bool)

(assert (=> start!112666 (array_inv!33212 _keys!1590)))

(assert (=> start!112666 tp!108650))

(assert (=> start!112666 tp_is_empty!36913))

(declare-fun b!1336307 () Bool)

(declare-fun res!886833 () Bool)

(assert (=> b!1336307 (=> (not res!886833) (not e!761013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90633 (_ BitVec 32)) Bool)

(assert (=> b!1336307 (= res!886833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336308 () Bool)

(declare-fun res!886828 () Bool)

(assert (=> b!1336308 (=> (not res!886828) (not e!761013))))

(assert (=> b!1336308 (= res!886828 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112666 res!886825) b!1336300))

(assert (= (and b!1336300 res!886832) b!1336307))

(assert (= (and b!1336307 res!886833) b!1336302))

(assert (= (and b!1336302 res!886826) b!1336297))

(assert (= (and b!1336297 res!886827) b!1336299))

(assert (= (and b!1336299 res!886829) b!1336304))

(assert (= (and b!1336304 res!886830) b!1336298))

(assert (= (and b!1336298 res!886831) b!1336308))

(assert (= (and b!1336308 res!886828) b!1336303))

(assert (= (and b!1336305 condMapEmpty!57047) mapIsEmpty!57047))

(assert (= (and b!1336305 (not condMapEmpty!57047)) mapNonEmpty!57047))

(get-info :version)

(assert (= (and mapNonEmpty!57047 ((_ is ValueCellFull!17558) mapValue!57047)) b!1336306))

(assert (= (and b!1336305 ((_ is ValueCellFull!17558) mapDefault!57047)) b!1336301))

(assert (= start!112666 b!1336305))

(declare-fun b_lambda!24151 () Bool)

(assert (=> (not b_lambda!24151) (not b!1336303)))

(declare-fun t!45372 () Bool)

(declare-fun tb!12079 () Bool)

(assert (=> (and start!112666 (= defaultEntry!1323 defaultEntry!1323) t!45372) tb!12079))

(declare-fun result!25239 () Bool)

(assert (=> tb!12079 (= result!25239 tp_is_empty!36913)))

(assert (=> b!1336303 t!45372))

(declare-fun b_and!49927 () Bool)

(assert (= b_and!49925 (and (=> t!45372 result!25239) b_and!49927)))

(declare-fun m!1223947 () Bool)

(assert (=> start!112666 m!1223947))

(declare-fun m!1223949 () Bool)

(assert (=> start!112666 m!1223949))

(declare-fun m!1223951 () Bool)

(assert (=> start!112666 m!1223951))

(declare-fun m!1223953 () Bool)

(assert (=> b!1336304 m!1223953))

(declare-fun m!1223955 () Bool)

(assert (=> b!1336302 m!1223955))

(declare-fun m!1223957 () Bool)

(assert (=> b!1336307 m!1223957))

(assert (=> b!1336298 m!1223953))

(assert (=> b!1336298 m!1223953))

(declare-fun m!1223959 () Bool)

(assert (=> b!1336298 m!1223959))

(declare-fun m!1223961 () Bool)

(assert (=> b!1336299 m!1223961))

(assert (=> b!1336299 m!1223961))

(declare-fun m!1223963 () Bool)

(assert (=> b!1336299 m!1223963))

(declare-fun m!1223965 () Bool)

(assert (=> mapNonEmpty!57047 m!1223965))

(declare-fun m!1223967 () Bool)

(assert (=> b!1336303 m!1223967))

(declare-fun m!1223969 () Bool)

(assert (=> b!1336303 m!1223969))

(declare-fun m!1223971 () Bool)

(assert (=> b!1336303 m!1223971))

(declare-fun m!1223973 () Bool)

(assert (=> b!1336303 m!1223973))

(declare-fun m!1223975 () Bool)

(assert (=> b!1336303 m!1223975))

(assert (=> b!1336303 m!1223969))

(declare-fun m!1223977 () Bool)

(assert (=> b!1336303 m!1223977))

(assert (=> b!1336303 m!1223971))

(assert (=> b!1336303 m!1223975))

(declare-fun m!1223979 () Bool)

(assert (=> b!1336303 m!1223979))

(assert (=> b!1336303 m!1223953))

(check-sat (not mapNonEmpty!57047) (not b_lambda!24151) (not b!1336298) (not b_next!31003) (not b!1336299) tp_is_empty!36913 b_and!49927 (not b!1336302) (not b!1336307) (not b!1336303) (not start!112666))
(check-sat b_and!49927 (not b_next!31003))
