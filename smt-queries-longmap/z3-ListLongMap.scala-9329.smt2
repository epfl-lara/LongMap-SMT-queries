; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111634 () Bool)

(assert start!111634)

(declare-fun b_free!30067 () Bool)

(declare-fun b_next!30067 () Bool)

(assert (=> start!111634 (= b_free!30067 (not b_next!30067))))

(declare-fun tp!105676 () Bool)

(declare-fun b_and!48295 () Bool)

(assert (=> start!111634 (= tp!105676 b_and!48295)))

(declare-fun b!1319689 () Bool)

(declare-fun res!875499 () Bool)

(declare-fun e!753184 () Bool)

(assert (=> b!1319689 (=> (not res!875499) (not e!753184))))

(declare-datatypes ((array!88791 0))(
  ( (array!88792 (arr!42865 (Array (_ BitVec 32) (_ BitVec 64))) (size!43416 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88791)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52953 0))(
  ( (V!52954 (val!18018 Int)) )
))
(declare-fun zeroValue!1279 () V!52953)

(declare-datatypes ((ValueCell!17045 0))(
  ( (ValueCellFull!17045 (v!20643 V!52953)) (EmptyCell!17045) )
))
(declare-datatypes ((array!88793 0))(
  ( (array!88794 (arr!42866 (Array (_ BitVec 32) ValueCell!17045)) (size!43417 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88793)

(declare-fun minValue!1279 () V!52953)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23220 0))(
  ( (tuple2!23221 (_1!11621 (_ BitVec 64)) (_2!11621 V!52953)) )
))
(declare-datatypes ((List!30383 0))(
  ( (Nil!30380) (Cons!30379 (h!31597 tuple2!23220) (t!43991 List!30383)) )
))
(declare-datatypes ((ListLongMap!20885 0))(
  ( (ListLongMap!20886 (toList!10458 List!30383)) )
))
(declare-fun contains!8625 (ListLongMap!20885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5462 (array!88791 array!88793 (_ BitVec 32) (_ BitVec 32) V!52953 V!52953 (_ BitVec 32) Int) ListLongMap!20885)

(assert (=> b!1319689 (= res!875499 (contains!8625 (getCurrentListMap!5462 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55478 () Bool)

(declare-fun mapRes!55478 () Bool)

(assert (=> mapIsEmpty!55478 mapRes!55478))

(declare-fun b!1319690 () Bool)

(declare-fun e!753185 () Bool)

(declare-fun tp_is_empty!35887 () Bool)

(assert (=> b!1319690 (= e!753185 tp_is_empty!35887)))

(declare-fun b!1319691 () Bool)

(assert (=> b!1319691 (= e!753184 false)))

(declare-fun lt!586943 () Bool)

(declare-fun +!4548 (ListLongMap!20885 tuple2!23220) ListLongMap!20885)

(declare-fun getCurrentListMapNoExtraKeys!6187 (array!88791 array!88793 (_ BitVec 32) (_ BitVec 32) V!52953 V!52953 (_ BitVec 32) Int) ListLongMap!20885)

(declare-fun get!21565 (ValueCell!17045 V!52953) V!52953)

(declare-fun dynLambda!3502 (Int (_ BitVec 64)) V!52953)

(assert (=> b!1319691 (= lt!586943 (contains!8625 (+!4548 (+!4548 (+!4548 (getCurrentListMapNoExtraKeys!6187 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23221 (select (arr!42865 _keys!1609) from!2000) (get!21565 (select (arr!42866 _values!1337) from!2000) (dynLambda!3502 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun b!1319692 () Bool)

(declare-fun res!875503 () Bool)

(assert (=> b!1319692 (=> (not res!875503) (not e!753184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88791 (_ BitVec 32)) Bool)

(assert (=> b!1319692 (= res!875503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319694 () Bool)

(declare-fun e!753183 () Bool)

(assert (=> b!1319694 (= e!753183 (and e!753185 mapRes!55478))))

(declare-fun condMapEmpty!55478 () Bool)

(declare-fun mapDefault!55478 () ValueCell!17045)

(assert (=> b!1319694 (= condMapEmpty!55478 (= (arr!42866 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17045)) mapDefault!55478)))))

(declare-fun mapNonEmpty!55478 () Bool)

(declare-fun tp!105677 () Bool)

(declare-fun e!753186 () Bool)

(assert (=> mapNonEmpty!55478 (= mapRes!55478 (and tp!105677 e!753186))))

(declare-fun mapKey!55478 () (_ BitVec 32))

(declare-fun mapRest!55478 () (Array (_ BitVec 32) ValueCell!17045))

(declare-fun mapValue!55478 () ValueCell!17045)

(assert (=> mapNonEmpty!55478 (= (arr!42866 _values!1337) (store mapRest!55478 mapKey!55478 mapValue!55478))))

(declare-fun b!1319695 () Bool)

(declare-fun res!875502 () Bool)

(assert (=> b!1319695 (=> (not res!875502) (not e!753184))))

(assert (=> b!1319695 (= res!875502 (and (= (size!43417 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43416 _keys!1609) (size!43417 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319696 () Bool)

(declare-fun res!875500 () Bool)

(assert (=> b!1319696 (=> (not res!875500) (not e!753184))))

(assert (=> b!1319696 (= res!875500 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43416 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319697 () Bool)

(declare-fun res!875505 () Bool)

(assert (=> b!1319697 (=> (not res!875505) (not e!753184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319697 (= res!875505 (validKeyInArray!0 (select (arr!42865 _keys!1609) from!2000)))))

(declare-fun b!1319698 () Bool)

(assert (=> b!1319698 (= e!753186 tp_is_empty!35887)))

(declare-fun b!1319699 () Bool)

(declare-fun res!875506 () Bool)

(assert (=> b!1319699 (=> (not res!875506) (not e!753184))))

(assert (=> b!1319699 (= res!875506 (not (= (select (arr!42865 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!875501 () Bool)

(assert (=> start!111634 (=> (not res!875501) (not e!753184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111634 (= res!875501 (validMask!0 mask!2019))))

(assert (=> start!111634 e!753184))

(declare-fun array_inv!32641 (array!88791) Bool)

(assert (=> start!111634 (array_inv!32641 _keys!1609)))

(assert (=> start!111634 true))

(assert (=> start!111634 tp_is_empty!35887))

(declare-fun array_inv!32642 (array!88793) Bool)

(assert (=> start!111634 (and (array_inv!32642 _values!1337) e!753183)))

(assert (=> start!111634 tp!105676))

(declare-fun b!1319693 () Bool)

(declare-fun res!875504 () Bool)

(assert (=> b!1319693 (=> (not res!875504) (not e!753184))))

(declare-datatypes ((List!30384 0))(
  ( (Nil!30381) (Cons!30380 (h!31598 (_ BitVec 64)) (t!43992 List!30384)) )
))
(declare-fun arrayNoDuplicates!0 (array!88791 (_ BitVec 32) List!30384) Bool)

(assert (=> b!1319693 (= res!875504 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30381))))

(assert (= (and start!111634 res!875501) b!1319695))

(assert (= (and b!1319695 res!875502) b!1319692))

(assert (= (and b!1319692 res!875503) b!1319693))

(assert (= (and b!1319693 res!875504) b!1319696))

(assert (= (and b!1319696 res!875500) b!1319689))

(assert (= (and b!1319689 res!875499) b!1319699))

(assert (= (and b!1319699 res!875506) b!1319697))

(assert (= (and b!1319697 res!875505) b!1319691))

(assert (= (and b!1319694 condMapEmpty!55478) mapIsEmpty!55478))

(assert (= (and b!1319694 (not condMapEmpty!55478)) mapNonEmpty!55478))

(get-info :version)

(assert (= (and mapNonEmpty!55478 ((_ is ValueCellFull!17045) mapValue!55478)) b!1319698))

(assert (= (and b!1319694 ((_ is ValueCellFull!17045) mapDefault!55478)) b!1319690))

(assert (= start!111634 b!1319694))

(declare-fun b_lambda!23387 () Bool)

(assert (=> (not b_lambda!23387) (not b!1319691)))

(declare-fun t!43990 () Bool)

(declare-fun tb!11411 () Bool)

(assert (=> (and start!111634 (= defaultEntry!1340 defaultEntry!1340) t!43990) tb!11411))

(declare-fun result!23885 () Bool)

(assert (=> tb!11411 (= result!23885 tp_is_empty!35887)))

(assert (=> b!1319691 t!43990))

(declare-fun b_and!48297 () Bool)

(assert (= b_and!48295 (and (=> t!43990 result!23885) b_and!48297)))

(declare-fun m!1207553 () Bool)

(assert (=> b!1319699 m!1207553))

(declare-fun m!1207555 () Bool)

(assert (=> b!1319689 m!1207555))

(assert (=> b!1319689 m!1207555))

(declare-fun m!1207557 () Bool)

(assert (=> b!1319689 m!1207557))

(declare-fun m!1207559 () Bool)

(assert (=> b!1319692 m!1207559))

(declare-fun m!1207561 () Bool)

(assert (=> mapNonEmpty!55478 m!1207561))

(declare-fun m!1207563 () Bool)

(assert (=> start!111634 m!1207563))

(declare-fun m!1207565 () Bool)

(assert (=> start!111634 m!1207565))

(declare-fun m!1207567 () Bool)

(assert (=> start!111634 m!1207567))

(declare-fun m!1207569 () Bool)

(assert (=> b!1319691 m!1207569))

(declare-fun m!1207571 () Bool)

(assert (=> b!1319691 m!1207571))

(assert (=> b!1319691 m!1207569))

(declare-fun m!1207573 () Bool)

(assert (=> b!1319691 m!1207573))

(declare-fun m!1207575 () Bool)

(assert (=> b!1319691 m!1207575))

(declare-fun m!1207577 () Bool)

(assert (=> b!1319691 m!1207577))

(declare-fun m!1207579 () Bool)

(assert (=> b!1319691 m!1207579))

(assert (=> b!1319691 m!1207573))

(declare-fun m!1207581 () Bool)

(assert (=> b!1319691 m!1207581))

(assert (=> b!1319691 m!1207553))

(assert (=> b!1319691 m!1207581))

(assert (=> b!1319691 m!1207575))

(assert (=> b!1319691 m!1207579))

(assert (=> b!1319691 m!1207571))

(declare-fun m!1207583 () Bool)

(assert (=> b!1319691 m!1207583))

(declare-fun m!1207585 () Bool)

(assert (=> b!1319693 m!1207585))

(assert (=> b!1319697 m!1207553))

(assert (=> b!1319697 m!1207553))

(declare-fun m!1207587 () Bool)

(assert (=> b!1319697 m!1207587))

(check-sat (not mapNonEmpty!55478) (not b!1319691) (not b!1319693) (not b!1319689) tp_is_empty!35887 (not start!111634) (not b_next!30067) (not b!1319697) (not b_lambda!23387) b_and!48297 (not b!1319692))
(check-sat b_and!48297 (not b_next!30067))
