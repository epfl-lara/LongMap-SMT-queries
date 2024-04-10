; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112680 () Bool)

(assert start!112680)

(declare-fun b_free!31017 () Bool)

(declare-fun b_next!31017 () Bool)

(assert (=> start!112680 (= b_free!31017 (not b_next!31017))))

(declare-fun tp!108692 () Bool)

(declare-fun b_and!49971 () Bool)

(assert (=> start!112680 (= tp!108692 b_and!49971)))

(declare-fun b!1336633 () Bool)

(declare-fun e!761155 () Bool)

(declare-fun e!761153 () Bool)

(declare-fun mapRes!57068 () Bool)

(assert (=> b!1336633 (= e!761155 (and e!761153 mapRes!57068))))

(declare-fun condMapEmpty!57068 () Bool)

(declare-datatypes ((V!54339 0))(
  ( (V!54340 (val!18538 Int)) )
))
(declare-datatypes ((ValueCell!17565 0))(
  ( (ValueCellFull!17565 (v!21178 V!54339)) (EmptyCell!17565) )
))
(declare-datatypes ((array!90712 0))(
  ( (array!90713 (arr!43821 (Array (_ BitVec 32) ValueCell!17565)) (size!44371 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90712)

(declare-fun mapDefault!57068 () ValueCell!17565)

(assert (=> b!1336633 (= condMapEmpty!57068 (= (arr!43821 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17565)) mapDefault!57068)))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun b!1336634 () Bool)

(declare-datatypes ((array!90714 0))(
  ( (array!90715 (arr!43822 (Array (_ BitVec 32) (_ BitVec 64))) (size!44372 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90714)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun e!761151 () Bool)

(assert (=> b!1336634 (= e!761151 (not (not (= k0!1153 (select (arr!43822 _keys!1590) from!1980)))))))

(declare-datatypes ((tuple2!23910 0))(
  ( (tuple2!23911 (_1!11966 (_ BitVec 64)) (_2!11966 V!54339)) )
))
(declare-datatypes ((List!31052 0))(
  ( (Nil!31049) (Cons!31048 (h!32257 tuple2!23910) (t!45350 List!31052)) )
))
(declare-datatypes ((ListLongMap!21567 0))(
  ( (ListLongMap!21568 (toList!10799 List!31052)) )
))
(declare-fun lt!592804 () ListLongMap!21567)

(declare-fun contains!8964 (ListLongMap!21567 (_ BitVec 64)) Bool)

(assert (=> b!1336634 (contains!8964 lt!592804 k0!1153)))

(declare-fun minValue!1262 () V!54339)

(declare-datatypes ((Unit!43930 0))(
  ( (Unit!43931) )
))
(declare-fun lt!592805 () Unit!43930)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!320 ((_ BitVec 64) (_ BitVec 64) V!54339 ListLongMap!21567) Unit!43930)

(assert (=> b!1336634 (= lt!592805 (lemmaInListMapAfterAddingDiffThenInBefore!320 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592804))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54339)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun +!4741 (ListLongMap!21567 tuple2!23910) ListLongMap!21567)

(declare-fun getCurrentListMapNoExtraKeys!6383 (array!90714 array!90712 (_ BitVec 32) (_ BitVec 32) V!54339 V!54339 (_ BitVec 32) Int) ListLongMap!21567)

(declare-fun get!22112 (ValueCell!17565 V!54339) V!54339)

(declare-fun dynLambda!3680 (Int (_ BitVec 64)) V!54339)

(assert (=> b!1336634 (= lt!592804 (+!4741 (getCurrentListMapNoExtraKeys!6383 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23911 (select (arr!43822 _keys!1590) from!1980) (get!22112 (select (arr!43821 _values!1320) from!1980) (dynLambda!3680 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336635 () Bool)

(declare-fun res!887043 () Bool)

(assert (=> b!1336635 (=> (not res!887043) (not e!761151))))

(assert (=> b!1336635 (= res!887043 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57068 () Bool)

(assert (=> mapIsEmpty!57068 mapRes!57068))

(declare-fun b!1336636 () Bool)

(declare-fun res!887045 () Bool)

(assert (=> b!1336636 (=> (not res!887045) (not e!761151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90714 (_ BitVec 32)) Bool)

(assert (=> b!1336636 (= res!887045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336637 () Bool)

(declare-fun res!887050 () Bool)

(assert (=> b!1336637 (=> (not res!887050) (not e!761151))))

(assert (=> b!1336637 (= res!887050 (not (= (select (arr!43822 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!887048 () Bool)

(assert (=> start!112680 (=> (not res!887048) (not e!761151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112680 (= res!887048 (validMask!0 mask!1998))))

(assert (=> start!112680 e!761151))

(declare-fun array_inv!33047 (array!90712) Bool)

(assert (=> start!112680 (and (array_inv!33047 _values!1320) e!761155)))

(assert (=> start!112680 true))

(declare-fun array_inv!33048 (array!90714) Bool)

(assert (=> start!112680 (array_inv!33048 _keys!1590)))

(assert (=> start!112680 tp!108692))

(declare-fun tp_is_empty!36927 () Bool)

(assert (=> start!112680 tp_is_empty!36927))

(declare-fun b!1336638 () Bool)

(declare-fun res!887049 () Bool)

(assert (=> b!1336638 (=> (not res!887049) (not e!761151))))

(assert (=> b!1336638 (= res!887049 (and (= (size!44371 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44372 _keys!1590) (size!44371 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336639 () Bool)

(declare-fun res!887044 () Bool)

(assert (=> b!1336639 (=> (not res!887044) (not e!761151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336639 (= res!887044 (validKeyInArray!0 (select (arr!43822 _keys!1590) from!1980)))))

(declare-fun b!1336640 () Bool)

(declare-fun res!887051 () Bool)

(assert (=> b!1336640 (=> (not res!887051) (not e!761151))))

(declare-datatypes ((List!31053 0))(
  ( (Nil!31050) (Cons!31049 (h!32258 (_ BitVec 64)) (t!45351 List!31053)) )
))
(declare-fun arrayNoDuplicates!0 (array!90714 (_ BitVec 32) List!31053) Bool)

(assert (=> b!1336640 (= res!887051 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31050))))

(declare-fun b!1336641 () Bool)

(declare-fun e!761152 () Bool)

(assert (=> b!1336641 (= e!761152 tp_is_empty!36927)))

(declare-fun b!1336642 () Bool)

(declare-fun res!887047 () Bool)

(assert (=> b!1336642 (=> (not res!887047) (not e!761151))))

(declare-fun getCurrentListMap!5771 (array!90714 array!90712 (_ BitVec 32) (_ BitVec 32) V!54339 V!54339 (_ BitVec 32) Int) ListLongMap!21567)

(assert (=> b!1336642 (= res!887047 (contains!8964 (getCurrentListMap!5771 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!57068 () Bool)

(declare-fun tp!108691 () Bool)

(assert (=> mapNonEmpty!57068 (= mapRes!57068 (and tp!108691 e!761152))))

(declare-fun mapKey!57068 () (_ BitVec 32))

(declare-fun mapRest!57068 () (Array (_ BitVec 32) ValueCell!17565))

(declare-fun mapValue!57068 () ValueCell!17565)

(assert (=> mapNonEmpty!57068 (= (arr!43821 _values!1320) (store mapRest!57068 mapKey!57068 mapValue!57068))))

(declare-fun b!1336643 () Bool)

(assert (=> b!1336643 (= e!761153 tp_is_empty!36927)))

(declare-fun b!1336644 () Bool)

(declare-fun res!887046 () Bool)

(assert (=> b!1336644 (=> (not res!887046) (not e!761151))))

(assert (=> b!1336644 (= res!887046 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44372 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112680 res!887048) b!1336638))

(assert (= (and b!1336638 res!887049) b!1336636))

(assert (= (and b!1336636 res!887045) b!1336640))

(assert (= (and b!1336640 res!887051) b!1336644))

(assert (= (and b!1336644 res!887046) b!1336642))

(assert (= (and b!1336642 res!887047) b!1336637))

(assert (= (and b!1336637 res!887050) b!1336639))

(assert (= (and b!1336639 res!887044) b!1336635))

(assert (= (and b!1336635 res!887043) b!1336634))

(assert (= (and b!1336633 condMapEmpty!57068) mapIsEmpty!57068))

(assert (= (and b!1336633 (not condMapEmpty!57068)) mapNonEmpty!57068))

(get-info :version)

(assert (= (and mapNonEmpty!57068 ((_ is ValueCellFull!17565) mapValue!57068)) b!1336641))

(assert (= (and b!1336633 ((_ is ValueCellFull!17565) mapDefault!57068)) b!1336643))

(assert (= start!112680 b!1336633))

(declare-fun b_lambda!24175 () Bool)

(assert (=> (not b_lambda!24175) (not b!1336634)))

(declare-fun t!45349 () Bool)

(declare-fun tb!12101 () Bool)

(assert (=> (and start!112680 (= defaultEntry!1323 defaultEntry!1323) t!45349) tb!12101))

(declare-fun result!25275 () Bool)

(assert (=> tb!12101 (= result!25275 tp_is_empty!36927)))

(assert (=> b!1336634 t!45349))

(declare-fun b_and!49973 () Bool)

(assert (= b_and!49971 (and (=> t!45349 result!25275) b_and!49973)))

(declare-fun m!1224701 () Bool)

(assert (=> b!1336637 m!1224701))

(declare-fun m!1224703 () Bool)

(assert (=> start!112680 m!1224703))

(declare-fun m!1224705 () Bool)

(assert (=> start!112680 m!1224705))

(declare-fun m!1224707 () Bool)

(assert (=> start!112680 m!1224707))

(declare-fun m!1224709 () Bool)

(assert (=> b!1336636 m!1224709))

(declare-fun m!1224711 () Bool)

(assert (=> b!1336642 m!1224711))

(assert (=> b!1336642 m!1224711))

(declare-fun m!1224713 () Bool)

(assert (=> b!1336642 m!1224713))

(declare-fun m!1224715 () Bool)

(assert (=> mapNonEmpty!57068 m!1224715))

(declare-fun m!1224717 () Bool)

(assert (=> b!1336634 m!1224717))

(declare-fun m!1224719 () Bool)

(assert (=> b!1336634 m!1224719))

(declare-fun m!1224721 () Bool)

(assert (=> b!1336634 m!1224721))

(declare-fun m!1224723 () Bool)

(assert (=> b!1336634 m!1224723))

(declare-fun m!1224725 () Bool)

(assert (=> b!1336634 m!1224725))

(assert (=> b!1336634 m!1224719))

(declare-fun m!1224727 () Bool)

(assert (=> b!1336634 m!1224727))

(assert (=> b!1336634 m!1224721))

(declare-fun m!1224729 () Bool)

(assert (=> b!1336634 m!1224729))

(assert (=> b!1336634 m!1224725))

(assert (=> b!1336634 m!1224701))

(declare-fun m!1224731 () Bool)

(assert (=> b!1336640 m!1224731))

(assert (=> b!1336639 m!1224701))

(assert (=> b!1336639 m!1224701))

(declare-fun m!1224733 () Bool)

(assert (=> b!1336639 m!1224733))

(check-sat (not start!112680) (not b!1336642) (not b_next!31017) (not b!1336636) (not b!1336634) (not b!1336640) (not mapNonEmpty!57068) (not b!1336639) tp_is_empty!36927 (not b_lambda!24175) b_and!49973)
(check-sat b_and!49973 (not b_next!31017))
