; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112678 () Bool)

(assert start!112678)

(declare-fun b_free!31015 () Bool)

(declare-fun b_next!31015 () Bool)

(assert (=> start!112678 (= b_free!31015 (not b_next!31015))))

(declare-fun tp!108687 () Bool)

(declare-fun b_and!49949 () Bool)

(assert (=> start!112678 (= tp!108687 b_and!49949)))

(declare-fun b!1336525 () Bool)

(declare-fun res!886994 () Bool)

(declare-fun e!761104 () Bool)

(assert (=> b!1336525 (=> (not res!886994) (not e!761104))))

(declare-datatypes ((array!90655 0))(
  ( (array!90656 (arr!43793 (Array (_ BitVec 32) (_ BitVec 64))) (size!44345 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90655)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90655 (_ BitVec 32)) Bool)

(assert (=> b!1336525 (= res!886994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336526 () Bool)

(declare-fun res!886991 () Bool)

(assert (=> b!1336526 (=> (not res!886991) (not e!761104))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336526 (= res!886991 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44345 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336527 () Bool)

(declare-fun res!886995 () Bool)

(assert (=> b!1336527 (=> (not res!886995) (not e!761104))))

(declare-datatypes ((V!54337 0))(
  ( (V!54338 (val!18537 Int)) )
))
(declare-datatypes ((ValueCell!17564 0))(
  ( (ValueCellFull!17564 (v!21176 V!54337)) (EmptyCell!17564) )
))
(declare-datatypes ((array!90657 0))(
  ( (array!90658 (arr!43794 (Array (_ BitVec 32) ValueCell!17564)) (size!44346 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90657)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54337)

(declare-fun zeroValue!1262 () V!54337)

(declare-datatypes ((tuple2!23974 0))(
  ( (tuple2!23975 (_1!11998 (_ BitVec 64)) (_2!11998 V!54337)) )
))
(declare-datatypes ((List!31105 0))(
  ( (Nil!31102) (Cons!31101 (h!32310 tuple2!23974) (t!45393 List!31105)) )
))
(declare-datatypes ((ListLongMap!21631 0))(
  ( (ListLongMap!21632 (toList!10831 List!31105)) )
))
(declare-fun contains!8925 (ListLongMap!21631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5684 (array!90655 array!90657 (_ BitVec 32) (_ BitVec 32) V!54337 V!54337 (_ BitVec 32) Int) ListLongMap!21631)

(assert (=> b!1336527 (= res!886995 (contains!8925 (getCurrentListMap!5684 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336528 () Bool)

(declare-fun res!886992 () Bool)

(assert (=> b!1336528 (=> (not res!886992) (not e!761104))))

(declare-datatypes ((List!31106 0))(
  ( (Nil!31103) (Cons!31102 (h!32311 (_ BitVec 64)) (t!45394 List!31106)) )
))
(declare-fun arrayNoDuplicates!0 (array!90655 (_ BitVec 32) List!31106) Bool)

(assert (=> b!1336528 (= res!886992 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31103))))

(declare-fun b!1336529 () Bool)

(declare-fun e!761107 () Bool)

(declare-fun e!761103 () Bool)

(declare-fun mapRes!57065 () Bool)

(assert (=> b!1336529 (= e!761107 (and e!761103 mapRes!57065))))

(declare-fun condMapEmpty!57065 () Bool)

(declare-fun mapDefault!57065 () ValueCell!17564)

(assert (=> b!1336529 (= condMapEmpty!57065 (= (arr!43794 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17564)) mapDefault!57065)))))

(declare-fun b!1336530 () Bool)

(declare-fun res!886989 () Bool)

(assert (=> b!1336530 (=> (not res!886989) (not e!761104))))

(assert (=> b!1336530 (= res!886989 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57065 () Bool)

(assert (=> mapIsEmpty!57065 mapRes!57065))

(declare-fun b!1336531 () Bool)

(declare-fun res!886990 () Bool)

(assert (=> b!1336531 (=> (not res!886990) (not e!761104))))

(assert (=> b!1336531 (= res!886990 (not (= (select (arr!43793 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336532 () Bool)

(declare-fun e!761105 () Bool)

(declare-fun tp_is_empty!36925 () Bool)

(assert (=> b!1336532 (= e!761105 tp_is_empty!36925)))

(declare-fun res!886993 () Bool)

(assert (=> start!112678 (=> (not res!886993) (not e!761104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112678 (= res!886993 (validMask!0 mask!1998))))

(assert (=> start!112678 e!761104))

(declare-fun array_inv!33221 (array!90657) Bool)

(assert (=> start!112678 (and (array_inv!33221 _values!1320) e!761107)))

(assert (=> start!112678 true))

(declare-fun array_inv!33222 (array!90655) Bool)

(assert (=> start!112678 (array_inv!33222 _keys!1590)))

(assert (=> start!112678 tp!108687))

(assert (=> start!112678 tp_is_empty!36925))

(declare-fun mapNonEmpty!57065 () Bool)

(declare-fun tp!108686 () Bool)

(assert (=> mapNonEmpty!57065 (= mapRes!57065 (and tp!108686 e!761105))))

(declare-fun mapValue!57065 () ValueCell!17564)

(declare-fun mapRest!57065 () (Array (_ BitVec 32) ValueCell!17564))

(declare-fun mapKey!57065 () (_ BitVec 32))

(assert (=> mapNonEmpty!57065 (= (arr!43794 _values!1320) (store mapRest!57065 mapKey!57065 mapValue!57065))))

(declare-fun b!1336533 () Bool)

(declare-fun res!886987 () Bool)

(assert (=> b!1336533 (=> (not res!886987) (not e!761104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336533 (= res!886987 (validKeyInArray!0 (select (arr!43793 _keys!1590) from!1980)))))

(declare-fun b!1336534 () Bool)

(assert (=> b!1336534 (= e!761103 tp_is_empty!36925)))

(declare-fun b!1336535 () Bool)

(assert (=> b!1336535 (= e!761104 (not (not (= k0!1153 (select (arr!43793 _keys!1590) from!1980)))))))

(declare-fun lt!592613 () ListLongMap!21631)

(assert (=> b!1336535 (contains!8925 lt!592613 k0!1153)))

(declare-datatypes ((Unit!43733 0))(
  ( (Unit!43734) )
))
(declare-fun lt!592612 () Unit!43733)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!309 ((_ BitVec 64) (_ BitVec 64) V!54337 ListLongMap!21631) Unit!43733)

(assert (=> b!1336535 (= lt!592612 (lemmaInListMapAfterAddingDiffThenInBefore!309 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592613))))

(declare-fun +!4764 (ListLongMap!21631 tuple2!23974) ListLongMap!21631)

(declare-fun getCurrentListMapNoExtraKeys!6407 (array!90655 array!90657 (_ BitVec 32) (_ BitVec 32) V!54337 V!54337 (_ BitVec 32) Int) ListLongMap!21631)

(declare-fun get!22102 (ValueCell!17564 V!54337) V!54337)

(declare-fun dynLambda!3694 (Int (_ BitVec 64)) V!54337)

(assert (=> b!1336535 (= lt!592613 (+!4764 (getCurrentListMapNoExtraKeys!6407 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23975 (select (arr!43793 _keys!1590) from!1980) (get!22102 (select (arr!43794 _values!1320) from!1980) (dynLambda!3694 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336536 () Bool)

(declare-fun res!886988 () Bool)

(assert (=> b!1336536 (=> (not res!886988) (not e!761104))))

(assert (=> b!1336536 (= res!886988 (and (= (size!44346 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44345 _keys!1590) (size!44346 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112678 res!886993) b!1336536))

(assert (= (and b!1336536 res!886988) b!1336525))

(assert (= (and b!1336525 res!886994) b!1336528))

(assert (= (and b!1336528 res!886992) b!1336526))

(assert (= (and b!1336526 res!886991) b!1336527))

(assert (= (and b!1336527 res!886995) b!1336531))

(assert (= (and b!1336531 res!886990) b!1336533))

(assert (= (and b!1336533 res!886987) b!1336530))

(assert (= (and b!1336530 res!886989) b!1336535))

(assert (= (and b!1336529 condMapEmpty!57065) mapIsEmpty!57065))

(assert (= (and b!1336529 (not condMapEmpty!57065)) mapNonEmpty!57065))

(get-info :version)

(assert (= (and mapNonEmpty!57065 ((_ is ValueCellFull!17564) mapValue!57065)) b!1336532))

(assert (= (and b!1336529 ((_ is ValueCellFull!17564) mapDefault!57065)) b!1336534))

(assert (= start!112678 b!1336529))

(declare-fun b_lambda!24163 () Bool)

(assert (=> (not b_lambda!24163) (not b!1336535)))

(declare-fun t!45392 () Bool)

(declare-fun tb!12091 () Bool)

(assert (=> (and start!112678 (= defaultEntry!1323 defaultEntry!1323) t!45392) tb!12091))

(declare-fun result!25263 () Bool)

(assert (=> tb!12091 (= result!25263 tp_is_empty!36925)))

(assert (=> b!1336535 t!45392))

(declare-fun b_and!49951 () Bool)

(assert (= b_and!49949 (and (=> t!45392 result!25263) b_and!49951)))

(declare-fun m!1224151 () Bool)

(assert (=> b!1336535 m!1224151))

(declare-fun m!1224153 () Bool)

(assert (=> b!1336535 m!1224153))

(declare-fun m!1224155 () Bool)

(assert (=> b!1336535 m!1224155))

(declare-fun m!1224157 () Bool)

(assert (=> b!1336535 m!1224157))

(declare-fun m!1224159 () Bool)

(assert (=> b!1336535 m!1224159))

(assert (=> b!1336535 m!1224153))

(declare-fun m!1224161 () Bool)

(assert (=> b!1336535 m!1224161))

(assert (=> b!1336535 m!1224155))

(assert (=> b!1336535 m!1224159))

(declare-fun m!1224163 () Bool)

(assert (=> b!1336535 m!1224163))

(declare-fun m!1224165 () Bool)

(assert (=> b!1336535 m!1224165))

(assert (=> b!1336533 m!1224165))

(assert (=> b!1336533 m!1224165))

(declare-fun m!1224167 () Bool)

(assert (=> b!1336533 m!1224167))

(declare-fun m!1224169 () Bool)

(assert (=> b!1336525 m!1224169))

(declare-fun m!1224171 () Bool)

(assert (=> mapNonEmpty!57065 m!1224171))

(declare-fun m!1224173 () Bool)

(assert (=> b!1336527 m!1224173))

(assert (=> b!1336527 m!1224173))

(declare-fun m!1224175 () Bool)

(assert (=> b!1336527 m!1224175))

(declare-fun m!1224177 () Bool)

(assert (=> b!1336528 m!1224177))

(declare-fun m!1224179 () Bool)

(assert (=> start!112678 m!1224179))

(declare-fun m!1224181 () Bool)

(assert (=> start!112678 m!1224181))

(declare-fun m!1224183 () Bool)

(assert (=> start!112678 m!1224183))

(assert (=> b!1336531 m!1224165))

(check-sat tp_is_empty!36925 (not b_next!31015) (not b!1336525) (not b_lambda!24163) (not b!1336533) (not start!112678) (not b!1336527) (not mapNonEmpty!57065) (not b!1336528) (not b!1336535) b_and!49951)
(check-sat b_and!49951 (not b_next!31015))
