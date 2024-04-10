; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112256 () Bool)

(assert start!112256)

(declare-fun b_free!30651 () Bool)

(declare-fun b_next!30651 () Bool)

(assert (=> start!112256 (= b_free!30651 (not b_next!30651))))

(declare-fun tp!107590 () Bool)

(declare-fun b_and!49357 () Bool)

(assert (=> start!112256 (= tp!107590 b_and!49357)))

(declare-fun b!1329931 () Bool)

(declare-fun res!882445 () Bool)

(declare-fun e!758084 () Bool)

(assert (=> b!1329931 (=> (not res!882445) (not e!758084))))

(declare-datatypes ((V!53851 0))(
  ( (V!53852 (val!18355 Int)) )
))
(declare-datatypes ((ValueCell!17382 0))(
  ( (ValueCellFull!17382 (v!20992 V!53851)) (EmptyCell!17382) )
))
(declare-datatypes ((array!90012 0))(
  ( (array!90013 (arr!43472 (Array (_ BitVec 32) ValueCell!17382)) (size!44022 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90012)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90014 0))(
  ( (array!90015 (arr!43473 (Array (_ BitVec 32) (_ BitVec 64))) (size!44023 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90014)

(assert (=> b!1329931 (= res!882445 (and (= (size!44022 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44023 _keys!1590) (size!44022 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56515 () Bool)

(declare-fun mapRes!56515 () Bool)

(declare-fun tp!107589 () Bool)

(declare-fun e!758082 () Bool)

(assert (=> mapNonEmpty!56515 (= mapRes!56515 (and tp!107589 e!758082))))

(declare-fun mapRest!56515 () (Array (_ BitVec 32) ValueCell!17382))

(declare-fun mapValue!56515 () ValueCell!17382)

(declare-fun mapKey!56515 () (_ BitVec 32))

(assert (=> mapNonEmpty!56515 (= (arr!43472 _values!1320) (store mapRest!56515 mapKey!56515 mapValue!56515))))

(declare-fun b!1329932 () Bool)

(declare-fun res!882450 () Bool)

(assert (=> b!1329932 (=> (not res!882450) (not e!758084))))

(assert (=> b!1329932 (= res!882450 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56515 () Bool)

(assert (=> mapIsEmpty!56515 mapRes!56515))

(declare-fun b!1329933 () Bool)

(declare-fun res!882446 () Bool)

(assert (=> b!1329933 (=> (not res!882446) (not e!758084))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329933 (= res!882446 (validKeyInArray!0 (select (arr!43473 _keys!1590) from!1980)))))

(declare-fun b!1329934 () Bool)

(declare-fun e!758086 () Bool)

(declare-fun e!758085 () Bool)

(assert (=> b!1329934 (= e!758086 (and e!758085 mapRes!56515))))

(declare-fun condMapEmpty!56515 () Bool)

(declare-fun mapDefault!56515 () ValueCell!17382)

(assert (=> b!1329934 (= condMapEmpty!56515 (= (arr!43472 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17382)) mapDefault!56515)))))

(declare-fun b!1329935 () Bool)

(declare-fun tp_is_empty!36561 () Bool)

(assert (=> b!1329935 (= e!758082 tp_is_empty!36561)))

(declare-fun b!1329936 () Bool)

(declare-fun res!882452 () Bool)

(assert (=> b!1329936 (=> (not res!882452) (not e!758084))))

(declare-datatypes ((List!30786 0))(
  ( (Nil!30783) (Cons!30782 (h!31991 (_ BitVec 64)) (t!44850 List!30786)) )
))
(declare-fun arrayNoDuplicates!0 (array!90014 (_ BitVec 32) List!30786) Bool)

(assert (=> b!1329936 (= res!882452 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30783))))

(declare-fun b!1329937 () Bool)

(declare-fun res!882451 () Bool)

(assert (=> b!1329937 (=> (not res!882451) (not e!758084))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1329937 (= res!882451 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44023 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329938 () Bool)

(declare-fun res!882447 () Bool)

(assert (=> b!1329938 (=> (not res!882447) (not e!758084))))

(assert (=> b!1329938 (= res!882447 (not (= (select (arr!43473 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329939 () Bool)

(declare-fun res!882449 () Bool)

(assert (=> b!1329939 (=> (not res!882449) (not e!758084))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53851)

(declare-fun zeroValue!1262 () V!53851)

(declare-datatypes ((tuple2!23634 0))(
  ( (tuple2!23635 (_1!11828 (_ BitVec 64)) (_2!11828 V!53851)) )
))
(declare-datatypes ((List!30787 0))(
  ( (Nil!30784) (Cons!30783 (h!31992 tuple2!23634) (t!44851 List!30787)) )
))
(declare-datatypes ((ListLongMap!21291 0))(
  ( (ListLongMap!21292 (toList!10661 List!30787)) )
))
(declare-fun contains!8825 (ListLongMap!21291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5649 (array!90014 array!90012 (_ BitVec 32) (_ BitVec 32) V!53851 V!53851 (_ BitVec 32) Int) ListLongMap!21291)

(assert (=> b!1329939 (= res!882449 (contains!8825 (getCurrentListMap!5649 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329940 () Bool)

(assert (=> b!1329940 (= e!758085 tp_is_empty!36561)))

(declare-fun res!882453 () Bool)

(assert (=> start!112256 (=> (not res!882453) (not e!758084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112256 (= res!882453 (validMask!0 mask!1998))))

(assert (=> start!112256 e!758084))

(declare-fun array_inv!32799 (array!90012) Bool)

(assert (=> start!112256 (and (array_inv!32799 _values!1320) e!758086)))

(assert (=> start!112256 true))

(declare-fun array_inv!32800 (array!90014) Bool)

(assert (=> start!112256 (array_inv!32800 _keys!1590)))

(assert (=> start!112256 tp!107590))

(assert (=> start!112256 tp_is_empty!36561))

(declare-fun b!1329941 () Bool)

(declare-fun res!882448 () Bool)

(assert (=> b!1329941 (=> (not res!882448) (not e!758084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90014 (_ BitVec 32)) Bool)

(assert (=> b!1329941 (= res!882448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329942 () Bool)

(assert (=> b!1329942 (= e!758084 (not true))))

(declare-fun lt!591034 () ListLongMap!21291)

(assert (=> b!1329942 (contains!8825 lt!591034 k0!1153)))

(declare-datatypes ((Unit!43769 0))(
  ( (Unit!43770) )
))
(declare-fun lt!591033 () Unit!43769)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!247 ((_ BitVec 64) (_ BitVec 64) V!53851 ListLongMap!21291) Unit!43769)

(assert (=> b!1329942 (= lt!591033 (lemmaInListMapAfterAddingDiffThenInBefore!247 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591034))))

(declare-fun +!4660 (ListLongMap!21291 tuple2!23634) ListLongMap!21291)

(declare-fun getCurrentListMapNoExtraKeys!6298 (array!90014 array!90012 (_ BitVec 32) (_ BitVec 32) V!53851 V!53851 (_ BitVec 32) Int) ListLongMap!21291)

(declare-fun get!21906 (ValueCell!17382 V!53851) V!53851)

(declare-fun dynLambda!3599 (Int (_ BitVec 64)) V!53851)

(assert (=> b!1329942 (= lt!591034 (+!4660 (getCurrentListMapNoExtraKeys!6298 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23635 (select (arr!43473 _keys!1590) from!1980) (get!21906 (select (arr!43472 _values!1320) from!1980) (dynLambda!3599 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!112256 res!882453) b!1329931))

(assert (= (and b!1329931 res!882445) b!1329941))

(assert (= (and b!1329941 res!882448) b!1329936))

(assert (= (and b!1329936 res!882452) b!1329937))

(assert (= (and b!1329937 res!882451) b!1329939))

(assert (= (and b!1329939 res!882449) b!1329938))

(assert (= (and b!1329938 res!882447) b!1329933))

(assert (= (and b!1329933 res!882446) b!1329932))

(assert (= (and b!1329932 res!882450) b!1329942))

(assert (= (and b!1329934 condMapEmpty!56515) mapIsEmpty!56515))

(assert (= (and b!1329934 (not condMapEmpty!56515)) mapNonEmpty!56515))

(get-info :version)

(assert (= (and mapNonEmpty!56515 ((_ is ValueCellFull!17382) mapValue!56515)) b!1329935))

(assert (= (and b!1329934 ((_ is ValueCellFull!17382) mapDefault!56515)) b!1329940))

(assert (= start!112256 b!1329934))

(declare-fun b_lambda!23911 () Bool)

(assert (=> (not b_lambda!23911) (not b!1329942)))

(declare-fun t!44849 () Bool)

(declare-fun tb!11867 () Bool)

(assert (=> (and start!112256 (= defaultEntry!1323 defaultEntry!1323) t!44849) tb!11867))

(declare-fun result!24805 () Bool)

(assert (=> tb!11867 (= result!24805 tp_is_empty!36561)))

(assert (=> b!1329942 t!44849))

(declare-fun b_and!49359 () Bool)

(assert (= b_and!49357 (and (=> t!44849 result!24805) b_and!49359)))

(declare-fun m!1218637 () Bool)

(assert (=> b!1329939 m!1218637))

(assert (=> b!1329939 m!1218637))

(declare-fun m!1218639 () Bool)

(assert (=> b!1329939 m!1218639))

(declare-fun m!1218641 () Bool)

(assert (=> start!112256 m!1218641))

(declare-fun m!1218643 () Bool)

(assert (=> start!112256 m!1218643))

(declare-fun m!1218645 () Bool)

(assert (=> start!112256 m!1218645))

(declare-fun m!1218647 () Bool)

(assert (=> mapNonEmpty!56515 m!1218647))

(declare-fun m!1218649 () Bool)

(assert (=> b!1329938 m!1218649))

(declare-fun m!1218651 () Bool)

(assert (=> b!1329936 m!1218651))

(declare-fun m!1218653 () Bool)

(assert (=> b!1329942 m!1218653))

(declare-fun m!1218655 () Bool)

(assert (=> b!1329942 m!1218655))

(declare-fun m!1218657 () Bool)

(assert (=> b!1329942 m!1218657))

(declare-fun m!1218659 () Bool)

(assert (=> b!1329942 m!1218659))

(declare-fun m!1218661 () Bool)

(assert (=> b!1329942 m!1218661))

(assert (=> b!1329942 m!1218655))

(declare-fun m!1218663 () Bool)

(assert (=> b!1329942 m!1218663))

(declare-fun m!1218665 () Bool)

(assert (=> b!1329942 m!1218665))

(assert (=> b!1329942 m!1218657))

(assert (=> b!1329942 m!1218661))

(assert (=> b!1329942 m!1218649))

(declare-fun m!1218667 () Bool)

(assert (=> b!1329941 m!1218667))

(assert (=> b!1329933 m!1218649))

(assert (=> b!1329933 m!1218649))

(declare-fun m!1218669 () Bool)

(assert (=> b!1329933 m!1218669))

(check-sat tp_is_empty!36561 (not b_lambda!23911) (not b_next!30651) b_and!49359 (not b!1329939) (not b!1329942) (not b!1329933) (not b!1329941) (not start!112256) (not mapNonEmpty!56515) (not b!1329936))
(check-sat b_and!49359 (not b_next!30651))
