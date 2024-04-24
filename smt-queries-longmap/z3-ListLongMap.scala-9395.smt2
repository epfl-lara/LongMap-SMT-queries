; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112088 () Bool)

(assert start!112088)

(declare-fun b_free!30463 () Bool)

(declare-fun b_next!30463 () Bool)

(assert (=> start!112088 (= b_free!30463 (not b_next!30463))))

(declare-fun tp!106869 () Bool)

(declare-fun b_and!49023 () Bool)

(assert (=> start!112088 (= tp!106869 b_and!49023)))

(declare-fun b!1326682 () Bool)

(declare-fun res!880155 () Bool)

(declare-fun e!756414 () Bool)

(assert (=> b!1326682 (=> (not res!880155) (not e!756414))))

(declare-datatypes ((array!89567 0))(
  ( (array!89568 (arr!43252 (Array (_ BitVec 32) (_ BitVec 64))) (size!43803 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89567)

(declare-datatypes ((List!30678 0))(
  ( (Nil!30675) (Cons!30674 (h!31892 (_ BitVec 64)) (t!44604 List!30678)) )
))
(declare-fun arrayNoDuplicates!0 (array!89567 (_ BitVec 32) List!30678) Bool)

(assert (=> b!1326682 (= res!880155 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30675))))

(declare-fun res!880152 () Bool)

(assert (=> start!112088 (=> (not res!880152) (not e!756414))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112088 (= res!880152 (validMask!0 mask!2019))))

(assert (=> start!112088 e!756414))

(declare-fun array_inv!32915 (array!89567) Bool)

(assert (=> start!112088 (array_inv!32915 _keys!1609)))

(assert (=> start!112088 true))

(declare-fun tp_is_empty!36283 () Bool)

(assert (=> start!112088 tp_is_empty!36283))

(declare-datatypes ((V!53481 0))(
  ( (V!53482 (val!18216 Int)) )
))
(declare-datatypes ((ValueCell!17243 0))(
  ( (ValueCellFull!17243 (v!20844 V!53481)) (EmptyCell!17243) )
))
(declare-datatypes ((array!89569 0))(
  ( (array!89570 (arr!43253 (Array (_ BitVec 32) ValueCell!17243)) (size!43804 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89569)

(declare-fun e!756415 () Bool)

(declare-fun array_inv!32916 (array!89569) Bool)

(assert (=> start!112088 (and (array_inv!32916 _values!1337) e!756415)))

(assert (=> start!112088 tp!106869))

(declare-fun b!1326683 () Bool)

(declare-fun res!880156 () Bool)

(assert (=> b!1326683 (=> (not res!880156) (not e!756414))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326683 (= res!880156 (validKeyInArray!0 (select (arr!43252 _keys!1609) from!2000)))))

(declare-fun b!1326684 () Bool)

(declare-fun res!880158 () Bool)

(assert (=> b!1326684 (=> (not res!880158) (not e!756414))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326684 (= res!880158 (not (= (select (arr!43252 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326685 () Bool)

(declare-fun e!756411 () Bool)

(declare-fun mapRes!56076 () Bool)

(assert (=> b!1326685 (= e!756415 (and e!756411 mapRes!56076))))

(declare-fun condMapEmpty!56076 () Bool)

(declare-fun mapDefault!56076 () ValueCell!17243)

(assert (=> b!1326685 (= condMapEmpty!56076 (= (arr!43253 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17243)) mapDefault!56076)))))

(declare-fun b!1326686 () Bool)

(declare-fun res!880153 () Bool)

(assert (=> b!1326686 (=> (not res!880153) (not e!756414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89567 (_ BitVec 32)) Bool)

(assert (=> b!1326686 (= res!880153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326687 () Bool)

(assert (=> b!1326687 (= e!756411 tp_is_empty!36283)))

(declare-fun b!1326688 () Bool)

(declare-fun res!880154 () Bool)

(assert (=> b!1326688 (=> (not res!880154) (not e!756414))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53481)

(declare-fun minValue!1279 () V!53481)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23528 0))(
  ( (tuple2!23529 (_1!11775 (_ BitVec 64)) (_2!11775 V!53481)) )
))
(declare-datatypes ((List!30679 0))(
  ( (Nil!30676) (Cons!30675 (h!31893 tuple2!23528) (t!44605 List!30679)) )
))
(declare-datatypes ((ListLongMap!21193 0))(
  ( (ListLongMap!21194 (toList!10612 List!30679)) )
))
(declare-fun contains!8780 (ListLongMap!21193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5593 (array!89567 array!89569 (_ BitVec 32) (_ BitVec 32) V!53481 V!53481 (_ BitVec 32) Int) ListLongMap!21193)

(assert (=> b!1326688 (= res!880154 (contains!8780 (getCurrentListMap!5593 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326689 () Bool)

(assert (=> b!1326689 (= e!756414 false)))

(declare-fun lt!590255 () Bool)

(declare-fun +!4658 (ListLongMap!21193 tuple2!23528) ListLongMap!21193)

(declare-fun getCurrentListMapNoExtraKeys!6302 (array!89567 array!89569 (_ BitVec 32) (_ BitVec 32) V!53481 V!53481 (_ BitVec 32) Int) ListLongMap!21193)

(declare-fun get!21810 (ValueCell!17243 V!53481) V!53481)

(declare-fun dynLambda!3612 (Int (_ BitVec 64)) V!53481)

(assert (=> b!1326689 (= lt!590255 (contains!8780 (+!4658 (+!4658 (+!4658 (getCurrentListMapNoExtraKeys!6302 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23529 (select (arr!43252 _keys!1609) from!2000) (get!21810 (select (arr!43253 _values!1337) from!2000) (dynLambda!3612 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun mapNonEmpty!56076 () Bool)

(declare-fun tp!106868 () Bool)

(declare-fun e!756413 () Bool)

(assert (=> mapNonEmpty!56076 (= mapRes!56076 (and tp!106868 e!756413))))

(declare-fun mapValue!56076 () ValueCell!17243)

(declare-fun mapKey!56076 () (_ BitVec 32))

(declare-fun mapRest!56076 () (Array (_ BitVec 32) ValueCell!17243))

(assert (=> mapNonEmpty!56076 (= (arr!43253 _values!1337) (store mapRest!56076 mapKey!56076 mapValue!56076))))

(declare-fun b!1326690 () Bool)

(declare-fun res!880151 () Bool)

(assert (=> b!1326690 (=> (not res!880151) (not e!756414))))

(assert (=> b!1326690 (= res!880151 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43803 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56076 () Bool)

(assert (=> mapIsEmpty!56076 mapRes!56076))

(declare-fun b!1326691 () Bool)

(assert (=> b!1326691 (= e!756413 tp_is_empty!36283)))

(declare-fun b!1326692 () Bool)

(declare-fun res!880157 () Bool)

(assert (=> b!1326692 (=> (not res!880157) (not e!756414))))

(assert (=> b!1326692 (= res!880157 (and (= (size!43804 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43803 _keys!1609) (size!43804 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!112088 res!880152) b!1326692))

(assert (= (and b!1326692 res!880157) b!1326686))

(assert (= (and b!1326686 res!880153) b!1326682))

(assert (= (and b!1326682 res!880155) b!1326690))

(assert (= (and b!1326690 res!880151) b!1326688))

(assert (= (and b!1326688 res!880154) b!1326684))

(assert (= (and b!1326684 res!880158) b!1326683))

(assert (= (and b!1326683 res!880156) b!1326689))

(assert (= (and b!1326685 condMapEmpty!56076) mapIsEmpty!56076))

(assert (= (and b!1326685 (not condMapEmpty!56076)) mapNonEmpty!56076))

(get-info :version)

(assert (= (and mapNonEmpty!56076 ((_ is ValueCellFull!17243) mapValue!56076)) b!1326691))

(assert (= (and b!1326685 ((_ is ValueCellFull!17243) mapDefault!56076)) b!1326687))

(assert (= start!112088 b!1326685))

(declare-fun b_lambda!23735 () Bool)

(assert (=> (not b_lambda!23735) (not b!1326689)))

(declare-fun t!44603 () Bool)

(declare-fun tb!11729 () Bool)

(assert (=> (and start!112088 (= defaultEntry!1340 defaultEntry!1340) t!44603) tb!11729))

(declare-fun result!24523 () Bool)

(assert (=> tb!11729 (= result!24523 tp_is_empty!36283)))

(assert (=> b!1326689 t!44603))

(declare-fun b_and!49025 () Bool)

(assert (= b_and!49023 (and (=> t!44603 result!24523) b_and!49025)))

(declare-fun m!1215867 () Bool)

(assert (=> b!1326682 m!1215867))

(declare-fun m!1215869 () Bool)

(assert (=> b!1326683 m!1215869))

(assert (=> b!1326683 m!1215869))

(declare-fun m!1215871 () Bool)

(assert (=> b!1326683 m!1215871))

(declare-fun m!1215873 () Bool)

(assert (=> b!1326689 m!1215873))

(declare-fun m!1215875 () Bool)

(assert (=> b!1326689 m!1215875))

(assert (=> b!1326689 m!1215873))

(declare-fun m!1215877 () Bool)

(assert (=> b!1326689 m!1215877))

(declare-fun m!1215879 () Bool)

(assert (=> b!1326689 m!1215879))

(declare-fun m!1215881 () Bool)

(assert (=> b!1326689 m!1215881))

(declare-fun m!1215883 () Bool)

(assert (=> b!1326689 m!1215883))

(assert (=> b!1326689 m!1215877))

(declare-fun m!1215885 () Bool)

(assert (=> b!1326689 m!1215885))

(assert (=> b!1326689 m!1215869))

(assert (=> b!1326689 m!1215885))

(assert (=> b!1326689 m!1215879))

(assert (=> b!1326689 m!1215883))

(assert (=> b!1326689 m!1215875))

(declare-fun m!1215887 () Bool)

(assert (=> b!1326689 m!1215887))

(declare-fun m!1215889 () Bool)

(assert (=> b!1326686 m!1215889))

(declare-fun m!1215891 () Bool)

(assert (=> b!1326688 m!1215891))

(assert (=> b!1326688 m!1215891))

(declare-fun m!1215893 () Bool)

(assert (=> b!1326688 m!1215893))

(assert (=> b!1326684 m!1215869))

(declare-fun m!1215895 () Bool)

(assert (=> start!112088 m!1215895))

(declare-fun m!1215897 () Bool)

(assert (=> start!112088 m!1215897))

(declare-fun m!1215899 () Bool)

(assert (=> start!112088 m!1215899))

(declare-fun m!1215901 () Bool)

(assert (=> mapNonEmpty!56076 m!1215901))

(check-sat (not b!1326688) tp_is_empty!36283 (not start!112088) b_and!49025 (not b!1326683) (not mapNonEmpty!56076) (not b!1326689) (not b!1326682) (not b_next!30463) (not b_lambda!23735) (not b!1326686))
(check-sat b_and!49025 (not b_next!30463))
