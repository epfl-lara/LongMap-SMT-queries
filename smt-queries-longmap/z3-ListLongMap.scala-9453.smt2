; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112550 () Bool)

(assert start!112550)

(declare-fun b_free!30721 () Bool)

(declare-fun b_next!30721 () Bool)

(assert (=> start!112550 (= b_free!30721 (not b_next!30721))))

(declare-fun tp!107799 () Bool)

(declare-fun b_and!49499 () Bool)

(assert (=> start!112550 (= tp!107799 b_and!49499)))

(declare-fun mapNonEmpty!56620 () Bool)

(declare-fun mapRes!56620 () Bool)

(declare-fun tp!107800 () Bool)

(declare-fun e!759452 () Bool)

(assert (=> mapNonEmpty!56620 (= mapRes!56620 (and tp!107800 e!759452))))

(declare-datatypes ((V!53945 0))(
  ( (V!53946 (val!18390 Int)) )
))
(declare-datatypes ((ValueCell!17417 0))(
  ( (ValueCellFull!17417 (v!21022 V!53945)) (EmptyCell!17417) )
))
(declare-datatypes ((array!90251 0))(
  ( (array!90252 (arr!43587 (Array (_ BitVec 32) ValueCell!17417)) (size!44138 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90251)

(declare-fun mapValue!56620 () ValueCell!17417)

(declare-fun mapKey!56620 () (_ BitVec 32))

(declare-fun mapRest!56620 () (Array (_ BitVec 32) ValueCell!17417))

(assert (=> mapNonEmpty!56620 (= (arr!43587 _values!1320) (store mapRest!56620 mapKey!56620 mapValue!56620))))

(declare-fun b!1332560 () Bool)

(declare-fun res!883908 () Bool)

(declare-fun e!759454 () Bool)

(assert (=> b!1332560 (=> (not res!883908) (not e!759454))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90253 0))(
  ( (array!90254 (arr!43588 (Array (_ BitVec 32) (_ BitVec 64))) (size!44139 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90253)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332560 (= res!883908 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44139 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332561 () Bool)

(declare-fun res!883915 () Bool)

(assert (=> b!1332561 (=> (not res!883915) (not e!759454))))

(assert (=> b!1332561 (= res!883915 (not (= (select (arr!43588 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332562 () Bool)

(assert (=> b!1332562 (= e!759454 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23720 0))(
  ( (tuple2!23721 (_1!11871 (_ BitVec 64)) (_2!11871 V!53945)) )
))
(declare-datatypes ((List!30885 0))(
  ( (Nil!30882) (Cons!30881 (h!32099 tuple2!23720) (t!45011 List!30885)) )
))
(declare-datatypes ((ListLongMap!21385 0))(
  ( (ListLongMap!21386 (toList!10708 List!30885)) )
))
(declare-fun lt!591941 () ListLongMap!21385)

(declare-fun contains!8884 (ListLongMap!21385 (_ BitVec 64)) Bool)

(assert (=> b!1332562 (contains!8884 lt!591941 k0!1153)))

(declare-datatypes ((Unit!43754 0))(
  ( (Unit!43755) )
))
(declare-fun lt!591942 () Unit!43754)

(declare-fun lt!591945 () V!53945)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!265 ((_ BitVec 64) (_ BitVec 64) V!53945 ListLongMap!21385) Unit!43754)

(assert (=> b!1332562 (= lt!591942 (lemmaInListMapAfterAddingDiffThenInBefore!265 k0!1153 (select (arr!43588 _keys!1590) from!1980) lt!591945 lt!591941))))

(declare-fun lt!591943 () ListLongMap!21385)

(assert (=> b!1332562 (contains!8884 lt!591943 k0!1153)))

(declare-fun lt!591944 () Unit!43754)

(declare-fun minValue!1262 () V!53945)

(assert (=> b!1332562 (= lt!591944 (lemmaInListMapAfterAddingDiffThenInBefore!265 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591943))))

(declare-fun +!4722 (ListLongMap!21385 tuple2!23720) ListLongMap!21385)

(assert (=> b!1332562 (= lt!591943 (+!4722 lt!591941 (tuple2!23721 (select (arr!43588 _keys!1590) from!1980) lt!591945)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21995 (ValueCell!17417 V!53945) V!53945)

(declare-fun dynLambda!3676 (Int (_ BitVec 64)) V!53945)

(assert (=> b!1332562 (= lt!591945 (get!21995 (select (arr!43587 _values!1320) from!1980) (dynLambda!3676 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53945)

(declare-fun getCurrentListMapNoExtraKeys!6366 (array!90253 array!90251 (_ BitVec 32) (_ BitVec 32) V!53945 V!53945 (_ BitVec 32) Int) ListLongMap!21385)

(assert (=> b!1332562 (= lt!591941 (getCurrentListMapNoExtraKeys!6366 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332563 () Bool)

(declare-fun res!883911 () Bool)

(assert (=> b!1332563 (=> (not res!883911) (not e!759454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332563 (= res!883911 (validKeyInArray!0 (select (arr!43588 _keys!1590) from!1980)))))

(declare-fun b!1332564 () Bool)

(declare-fun res!883914 () Bool)

(assert (=> b!1332564 (=> (not res!883914) (not e!759454))))

(assert (=> b!1332564 (= res!883914 (and (= (size!44138 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44139 _keys!1590) (size!44138 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!883916 () Bool)

(assert (=> start!112550 (=> (not res!883916) (not e!759454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112550 (= res!883916 (validMask!0 mask!1998))))

(assert (=> start!112550 e!759454))

(declare-fun e!759450 () Bool)

(declare-fun array_inv!33157 (array!90251) Bool)

(assert (=> start!112550 (and (array_inv!33157 _values!1320) e!759450)))

(assert (=> start!112550 true))

(declare-fun array_inv!33158 (array!90253) Bool)

(assert (=> start!112550 (array_inv!33158 _keys!1590)))

(assert (=> start!112550 tp!107799))

(declare-fun tp_is_empty!36631 () Bool)

(assert (=> start!112550 tp_is_empty!36631))

(declare-fun b!1332565 () Bool)

(declare-fun res!883910 () Bool)

(assert (=> b!1332565 (=> (not res!883910) (not e!759454))))

(assert (=> b!1332565 (= res!883910 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332566 () Bool)

(declare-fun e!759453 () Bool)

(assert (=> b!1332566 (= e!759453 tp_is_empty!36631)))

(declare-fun b!1332567 () Bool)

(declare-fun res!883909 () Bool)

(assert (=> b!1332567 (=> (not res!883909) (not e!759454))))

(declare-fun getCurrentListMap!5677 (array!90253 array!90251 (_ BitVec 32) (_ BitVec 32) V!53945 V!53945 (_ BitVec 32) Int) ListLongMap!21385)

(assert (=> b!1332567 (= res!883909 (contains!8884 (getCurrentListMap!5677 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332568 () Bool)

(assert (=> b!1332568 (= e!759452 tp_is_empty!36631)))

(declare-fun b!1332569 () Bool)

(declare-fun res!883912 () Bool)

(assert (=> b!1332569 (=> (not res!883912) (not e!759454))))

(declare-datatypes ((List!30886 0))(
  ( (Nil!30883) (Cons!30882 (h!32100 (_ BitVec 64)) (t!45012 List!30886)) )
))
(declare-fun arrayNoDuplicates!0 (array!90253 (_ BitVec 32) List!30886) Bool)

(assert (=> b!1332569 (= res!883912 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30883))))

(declare-fun b!1332570 () Bool)

(declare-fun res!883913 () Bool)

(assert (=> b!1332570 (=> (not res!883913) (not e!759454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90253 (_ BitVec 32)) Bool)

(assert (=> b!1332570 (= res!883913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332571 () Bool)

(assert (=> b!1332571 (= e!759450 (and e!759453 mapRes!56620))))

(declare-fun condMapEmpty!56620 () Bool)

(declare-fun mapDefault!56620 () ValueCell!17417)

(assert (=> b!1332571 (= condMapEmpty!56620 (= (arr!43587 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17417)) mapDefault!56620)))))

(declare-fun mapIsEmpty!56620 () Bool)

(assert (=> mapIsEmpty!56620 mapRes!56620))

(assert (= (and start!112550 res!883916) b!1332564))

(assert (= (and b!1332564 res!883914) b!1332570))

(assert (= (and b!1332570 res!883913) b!1332569))

(assert (= (and b!1332569 res!883912) b!1332560))

(assert (= (and b!1332560 res!883908) b!1332567))

(assert (= (and b!1332567 res!883909) b!1332561))

(assert (= (and b!1332561 res!883915) b!1332563))

(assert (= (and b!1332563 res!883911) b!1332565))

(assert (= (and b!1332565 res!883910) b!1332562))

(assert (= (and b!1332571 condMapEmpty!56620) mapIsEmpty!56620))

(assert (= (and b!1332571 (not condMapEmpty!56620)) mapNonEmpty!56620))

(get-info :version)

(assert (= (and mapNonEmpty!56620 ((_ is ValueCellFull!17417) mapValue!56620)) b!1332568))

(assert (= (and b!1332571 ((_ is ValueCellFull!17417) mapDefault!56620)) b!1332566))

(assert (= start!112550 b!1332571))

(declare-fun b_lambda!23975 () Bool)

(assert (=> (not b_lambda!23975) (not b!1332562)))

(declare-fun t!45010 () Bool)

(declare-fun tb!11929 () Bool)

(assert (=> (and start!112550 (= defaultEntry!1323 defaultEntry!1323) t!45010) tb!11929))

(declare-fun result!24937 () Bool)

(assert (=> tb!11929 (= result!24937 tp_is_empty!36631)))

(assert (=> b!1332562 t!45010))

(declare-fun b_and!49501 () Bool)

(assert (= b_and!49499 (and (=> t!45010 result!24937) b_and!49501)))

(declare-fun m!1221521 () Bool)

(assert (=> b!1332563 m!1221521))

(assert (=> b!1332563 m!1221521))

(declare-fun m!1221523 () Bool)

(assert (=> b!1332563 m!1221523))

(assert (=> b!1332561 m!1221521))

(declare-fun m!1221525 () Bool)

(assert (=> b!1332567 m!1221525))

(assert (=> b!1332567 m!1221525))

(declare-fun m!1221527 () Bool)

(assert (=> b!1332567 m!1221527))

(declare-fun m!1221529 () Bool)

(assert (=> mapNonEmpty!56620 m!1221529))

(declare-fun m!1221531 () Bool)

(assert (=> b!1332562 m!1221531))

(declare-fun m!1221533 () Bool)

(assert (=> b!1332562 m!1221533))

(declare-fun m!1221535 () Bool)

(assert (=> b!1332562 m!1221535))

(assert (=> b!1332562 m!1221533))

(declare-fun m!1221537 () Bool)

(assert (=> b!1332562 m!1221537))

(declare-fun m!1221539 () Bool)

(assert (=> b!1332562 m!1221539))

(declare-fun m!1221541 () Bool)

(assert (=> b!1332562 m!1221541))

(assert (=> b!1332562 m!1221535))

(assert (=> b!1332562 m!1221521))

(declare-fun m!1221543 () Bool)

(assert (=> b!1332562 m!1221543))

(assert (=> b!1332562 m!1221521))

(declare-fun m!1221545 () Bool)

(assert (=> b!1332562 m!1221545))

(declare-fun m!1221547 () Bool)

(assert (=> b!1332562 m!1221547))

(declare-fun m!1221549 () Bool)

(assert (=> start!112550 m!1221549))

(declare-fun m!1221551 () Bool)

(assert (=> start!112550 m!1221551))

(declare-fun m!1221553 () Bool)

(assert (=> start!112550 m!1221553))

(declare-fun m!1221555 () Bool)

(assert (=> b!1332569 m!1221555))

(declare-fun m!1221557 () Bool)

(assert (=> b!1332570 m!1221557))

(check-sat (not b!1332570) b_and!49501 (not b_next!30721) (not b!1332567) (not b!1332562) (not b!1332563) (not start!112550) (not b_lambda!23975) tp_is_empty!36631 (not b!1332569) (not mapNonEmpty!56620))
(check-sat b_and!49501 (not b_next!30721))
