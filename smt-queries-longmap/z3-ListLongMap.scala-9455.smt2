; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112338 () Bool)

(assert start!112338)

(declare-fun b_free!30733 () Bool)

(declare-fun b_next!30733 () Bool)

(assert (=> start!112338 (= b_free!30733 (not b_next!30733))))

(declare-fun tp!107837 () Bool)

(declare-fun b_and!49503 () Bool)

(assert (=> start!112338 (= tp!107837 b_and!49503)))

(declare-fun b!1331419 () Bool)

(declare-fun e!758666 () Bool)

(declare-fun tp_is_empty!36643 () Bool)

(assert (=> b!1331419 (= e!758666 tp_is_empty!36643)))

(declare-fun res!883523 () Bool)

(declare-fun e!758664 () Bool)

(assert (=> start!112338 (=> (not res!883523) (not e!758664))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112338 (= res!883523 (validMask!0 mask!1998))))

(assert (=> start!112338 e!758664))

(declare-datatypes ((V!53961 0))(
  ( (V!53962 (val!18396 Int)) )
))
(declare-datatypes ((ValueCell!17423 0))(
  ( (ValueCellFull!17423 (v!21032 V!53961)) (EmptyCell!17423) )
))
(declare-datatypes ((array!90105 0))(
  ( (array!90106 (arr!43519 (Array (_ BitVec 32) ValueCell!17423)) (size!44071 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90105)

(declare-fun e!758667 () Bool)

(declare-fun array_inv!33007 (array!90105) Bool)

(assert (=> start!112338 (and (array_inv!33007 _values!1320) e!758667)))

(assert (=> start!112338 true))

(declare-datatypes ((array!90107 0))(
  ( (array!90108 (arr!43520 (Array (_ BitVec 32) (_ BitVec 64))) (size!44072 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90107)

(declare-fun array_inv!33008 (array!90107) Bool)

(assert (=> start!112338 (array_inv!33008 _keys!1590)))

(assert (=> start!112338 tp!107837))

(assert (=> start!112338 tp_is_empty!36643))

(declare-fun b!1331420 () Bool)

(declare-fun res!883531 () Bool)

(assert (=> b!1331420 (=> (not res!883531) (not e!758664))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331420 (= res!883531 (validKeyInArray!0 (select (arr!43520 _keys!1590) from!1980)))))

(declare-fun b!1331421 () Bool)

(declare-fun e!758665 () Bool)

(assert (=> b!1331421 (= e!758665 tp_is_empty!36643)))

(declare-fun mapNonEmpty!56638 () Bool)

(declare-fun mapRes!56638 () Bool)

(declare-fun tp!107836 () Bool)

(assert (=> mapNonEmpty!56638 (= mapRes!56638 (and tp!107836 e!758666))))

(declare-fun mapValue!56638 () ValueCell!17423)

(declare-fun mapKey!56638 () (_ BitVec 32))

(declare-fun mapRest!56638 () (Array (_ BitVec 32) ValueCell!17423))

(assert (=> mapNonEmpty!56638 (= (arr!43519 _values!1320) (store mapRest!56638 mapKey!56638 mapValue!56638))))

(declare-fun b!1331422 () Bool)

(declare-fun res!883524 () Bool)

(assert (=> b!1331422 (=> (not res!883524) (not e!758664))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53961)

(declare-fun zeroValue!1262 () V!53961)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23766 0))(
  ( (tuple2!23767 (_1!11894 (_ BitVec 64)) (_2!11894 V!53961)) )
))
(declare-datatypes ((List!30904 0))(
  ( (Nil!30901) (Cons!30900 (h!32109 tuple2!23766) (t!45042 List!30904)) )
))
(declare-datatypes ((ListLongMap!21423 0))(
  ( (ListLongMap!21424 (toList!10727 List!30904)) )
))
(declare-fun contains!8819 (ListLongMap!21423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5587 (array!90107 array!90105 (_ BitVec 32) (_ BitVec 32) V!53961 V!53961 (_ BitVec 32) Int) ListLongMap!21423)

(assert (=> b!1331422 (= res!883524 (contains!8819 (getCurrentListMap!5587 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331423 () Bool)

(assert (=> b!1331423 (= e!758667 (and e!758665 mapRes!56638))))

(declare-fun condMapEmpty!56638 () Bool)

(declare-fun mapDefault!56638 () ValueCell!17423)

(assert (=> b!1331423 (= condMapEmpty!56638 (= (arr!43519 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17423)) mapDefault!56638)))))

(declare-fun mapIsEmpty!56638 () Bool)

(assert (=> mapIsEmpty!56638 mapRes!56638))

(declare-fun b!1331424 () Bool)

(declare-fun res!883528 () Bool)

(assert (=> b!1331424 (=> (not res!883528) (not e!758664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90107 (_ BitVec 32)) Bool)

(assert (=> b!1331424 (= res!883528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331425 () Bool)

(declare-fun res!883525 () Bool)

(assert (=> b!1331425 (=> (not res!883525) (not e!758664))))

(assert (=> b!1331425 (= res!883525 (and (= (size!44071 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44072 _keys!1590) (size!44071 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331426 () Bool)

(assert (=> b!1331426 (= e!758664 (not true))))

(declare-fun lt!591371 () ListLongMap!21423)

(declare-fun +!4706 (ListLongMap!21423 tuple2!23766) ListLongMap!21423)

(assert (=> b!1331426 (contains!8819 (+!4706 lt!591371 (tuple2!23767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43624 0))(
  ( (Unit!43625) )
))
(declare-fun lt!591376 () Unit!43624)

(declare-fun addStillContains!1160 (ListLongMap!21423 (_ BitVec 64) V!53961 (_ BitVec 64)) Unit!43624)

(assert (=> b!1331426 (= lt!591376 (addStillContains!1160 lt!591371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331426 (contains!8819 lt!591371 k0!1153)))

(declare-fun lt!591372 () Unit!43624)

(declare-fun lt!591374 () V!53961)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!262 ((_ BitVec 64) (_ BitVec 64) V!53961 ListLongMap!21423) Unit!43624)

(assert (=> b!1331426 (= lt!591372 (lemmaInListMapAfterAddingDiffThenInBefore!262 k0!1153 (select (arr!43520 _keys!1590) from!1980) lt!591374 lt!591371))))

(declare-fun lt!591373 () ListLongMap!21423)

(assert (=> b!1331426 (contains!8819 lt!591373 k0!1153)))

(declare-fun lt!591375 () Unit!43624)

(assert (=> b!1331426 (= lt!591375 (lemmaInListMapAfterAddingDiffThenInBefore!262 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591373))))

(assert (=> b!1331426 (= lt!591373 (+!4706 lt!591371 (tuple2!23767 (select (arr!43520 _keys!1590) from!1980) lt!591374)))))

(declare-fun get!21947 (ValueCell!17423 V!53961) V!53961)

(declare-fun dynLambda!3636 (Int (_ BitVec 64)) V!53961)

(assert (=> b!1331426 (= lt!591374 (get!21947 (select (arr!43519 _values!1320) from!1980) (dynLambda!3636 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6344 (array!90107 array!90105 (_ BitVec 32) (_ BitVec 32) V!53961 V!53961 (_ BitVec 32) Int) ListLongMap!21423)

(assert (=> b!1331426 (= lt!591371 (getCurrentListMapNoExtraKeys!6344 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331427 () Bool)

(declare-fun res!883529 () Bool)

(assert (=> b!1331427 (=> (not res!883529) (not e!758664))))

(declare-datatypes ((List!30905 0))(
  ( (Nil!30902) (Cons!30901 (h!32110 (_ BitVec 64)) (t!45043 List!30905)) )
))
(declare-fun arrayNoDuplicates!0 (array!90107 (_ BitVec 32) List!30905) Bool)

(assert (=> b!1331427 (= res!883529 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30902))))

(declare-fun b!1331428 () Bool)

(declare-fun res!883526 () Bool)

(assert (=> b!1331428 (=> (not res!883526) (not e!758664))))

(assert (=> b!1331428 (= res!883526 (not (= (select (arr!43520 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331429 () Bool)

(declare-fun res!883530 () Bool)

(assert (=> b!1331429 (=> (not res!883530) (not e!758664))))

(assert (=> b!1331429 (= res!883530 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331430 () Bool)

(declare-fun res!883527 () Bool)

(assert (=> b!1331430 (=> (not res!883527) (not e!758664))))

(assert (=> b!1331430 (= res!883527 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44072 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112338 res!883523) b!1331425))

(assert (= (and b!1331425 res!883525) b!1331424))

(assert (= (and b!1331424 res!883528) b!1331427))

(assert (= (and b!1331427 res!883529) b!1331430))

(assert (= (and b!1331430 res!883527) b!1331422))

(assert (= (and b!1331422 res!883524) b!1331428))

(assert (= (and b!1331428 res!883526) b!1331420))

(assert (= (and b!1331420 res!883531) b!1331429))

(assert (= (and b!1331429 res!883530) b!1331426))

(assert (= (and b!1331423 condMapEmpty!56638) mapIsEmpty!56638))

(assert (= (and b!1331423 (not condMapEmpty!56638)) mapNonEmpty!56638))

(get-info :version)

(assert (= (and mapNonEmpty!56638 ((_ is ValueCellFull!17423) mapValue!56638)) b!1331419))

(assert (= (and b!1331423 ((_ is ValueCellFull!17423) mapDefault!56638)) b!1331421))

(assert (= start!112338 b!1331423))

(declare-fun b_lambda!23983 () Bool)

(assert (=> (not b_lambda!23983) (not b!1331426)))

(declare-fun t!45041 () Bool)

(declare-fun tb!11941 () Bool)

(assert (=> (and start!112338 (= defaultEntry!1323 defaultEntry!1323) t!45041) tb!11941))

(declare-fun result!24961 () Bool)

(assert (=> tb!11941 (= result!24961 tp_is_empty!36643)))

(assert (=> b!1331426 t!45041))

(declare-fun b_and!49505 () Bool)

(assert (= b_and!49503 (and (=> t!45041 result!24961) b_and!49505)))

(declare-fun m!1219635 () Bool)

(assert (=> b!1331427 m!1219635))

(declare-fun m!1219637 () Bool)

(assert (=> b!1331428 m!1219637))

(declare-fun m!1219639 () Bool)

(assert (=> mapNonEmpty!56638 m!1219639))

(assert (=> b!1331420 m!1219637))

(assert (=> b!1331420 m!1219637))

(declare-fun m!1219641 () Bool)

(assert (=> b!1331420 m!1219641))

(declare-fun m!1219643 () Bool)

(assert (=> b!1331424 m!1219643))

(declare-fun m!1219645 () Bool)

(assert (=> b!1331426 m!1219645))

(declare-fun m!1219647 () Bool)

(assert (=> b!1331426 m!1219647))

(declare-fun m!1219649 () Bool)

(assert (=> b!1331426 m!1219649))

(declare-fun m!1219651 () Bool)

(assert (=> b!1331426 m!1219651))

(declare-fun m!1219653 () Bool)

(assert (=> b!1331426 m!1219653))

(declare-fun m!1219655 () Bool)

(assert (=> b!1331426 m!1219655))

(declare-fun m!1219657 () Bool)

(assert (=> b!1331426 m!1219657))

(assert (=> b!1331426 m!1219637))

(declare-fun m!1219659 () Bool)

(assert (=> b!1331426 m!1219659))

(declare-fun m!1219661 () Bool)

(assert (=> b!1331426 m!1219661))

(assert (=> b!1331426 m!1219653))

(declare-fun m!1219663 () Bool)

(assert (=> b!1331426 m!1219663))

(assert (=> b!1331426 m!1219661))

(declare-fun m!1219665 () Bool)

(assert (=> b!1331426 m!1219665))

(assert (=> b!1331426 m!1219637))

(declare-fun m!1219667 () Bool)

(assert (=> b!1331426 m!1219667))

(assert (=> b!1331426 m!1219645))

(declare-fun m!1219669 () Bool)

(assert (=> b!1331422 m!1219669))

(assert (=> b!1331422 m!1219669))

(declare-fun m!1219671 () Bool)

(assert (=> b!1331422 m!1219671))

(declare-fun m!1219673 () Bool)

(assert (=> start!112338 m!1219673))

(declare-fun m!1219675 () Bool)

(assert (=> start!112338 m!1219675))

(declare-fun m!1219677 () Bool)

(assert (=> start!112338 m!1219677))

(check-sat (not b!1331427) (not b_lambda!23983) (not b!1331426) (not start!112338) (not b_next!30733) tp_is_empty!36643 (not b!1331420) (not mapNonEmpty!56638) b_and!49505 (not b!1331424) (not b!1331422))
(check-sat b_and!49505 (not b_next!30733))
