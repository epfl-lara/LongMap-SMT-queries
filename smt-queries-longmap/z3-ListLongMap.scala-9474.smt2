; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112676 () Bool)

(assert start!112676)

(declare-fun b_free!30847 () Bool)

(declare-fun b_next!30847 () Bool)

(assert (=> start!112676 (= b_free!30847 (not b_next!30847))))

(declare-fun tp!108177 () Bool)

(declare-fun b_and!49697 () Bool)

(assert (=> start!112676 (= tp!108177 b_and!49697)))

(declare-fun b!1334604 () Bool)

(declare-fun res!885313 () Bool)

(declare-fun e!760395 () Bool)

(assert (=> b!1334604 (=> (not res!885313) (not e!760395))))

(declare-datatypes ((V!54113 0))(
  ( (V!54114 (val!18453 Int)) )
))
(declare-datatypes ((ValueCell!17480 0))(
  ( (ValueCellFull!17480 (v!21085 V!54113)) (EmptyCell!17480) )
))
(declare-datatypes ((array!90487 0))(
  ( (array!90488 (arr!43705 (Array (_ BitVec 32) ValueCell!17480)) (size!44256 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90487)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90489 0))(
  ( (array!90490 (arr!43706 (Array (_ BitVec 32) (_ BitVec 64))) (size!44257 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90489)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54113)

(declare-fun zeroValue!1262 () V!54113)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23812 0))(
  ( (tuple2!23813 (_1!11917 (_ BitVec 64)) (_2!11917 V!54113)) )
))
(declare-datatypes ((List!30969 0))(
  ( (Nil!30966) (Cons!30965 (h!32183 tuple2!23812) (t!45167 List!30969)) )
))
(declare-datatypes ((ListLongMap!21477 0))(
  ( (ListLongMap!21478 (toList!10754 List!30969)) )
))
(declare-fun contains!8930 (ListLongMap!21477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5718 (array!90489 array!90487 (_ BitVec 32) (_ BitVec 32) V!54113 V!54113 (_ BitVec 32) Int) ListLongMap!21477)

(assert (=> b!1334604 (= res!885313 (contains!8930 (getCurrentListMap!5718 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334605 () Bool)

(declare-fun res!885320 () Bool)

(assert (=> b!1334605 (=> (not res!885320) (not e!760395))))

(assert (=> b!1334605 (= res!885320 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334606 () Bool)

(declare-fun res!885318 () Bool)

(assert (=> b!1334606 (=> (not res!885318) (not e!760395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334606 (= res!885318 (validKeyInArray!0 (select (arr!43706 _keys!1590) from!1980)))))

(declare-fun b!1334607 () Bool)

(declare-fun e!760396 () Bool)

(declare-fun tp_is_empty!36757 () Bool)

(assert (=> b!1334607 (= e!760396 tp_is_empty!36757)))

(declare-fun b!1334608 () Bool)

(declare-fun res!885319 () Bool)

(assert (=> b!1334608 (=> (not res!885319) (not e!760395))))

(assert (=> b!1334608 (= res!885319 (not (= (select (arr!43706 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56809 () Bool)

(declare-fun mapRes!56809 () Bool)

(declare-fun tp!108178 () Bool)

(declare-fun e!760399 () Bool)

(assert (=> mapNonEmpty!56809 (= mapRes!56809 (and tp!108178 e!760399))))

(declare-fun mapRest!56809 () (Array (_ BitVec 32) ValueCell!17480))

(declare-fun mapValue!56809 () ValueCell!17480)

(declare-fun mapKey!56809 () (_ BitVec 32))

(assert (=> mapNonEmpty!56809 (= (arr!43705 _values!1320) (store mapRest!56809 mapKey!56809 mapValue!56809))))

(declare-fun b!1334609 () Bool)

(assert (=> b!1334609 (= e!760399 tp_is_empty!36757)))

(declare-fun b!1334610 () Bool)

(declare-fun e!760397 () Bool)

(assert (=> b!1334610 (= e!760397 (and e!760396 mapRes!56809))))

(declare-fun condMapEmpty!56809 () Bool)

(declare-fun mapDefault!56809 () ValueCell!17480)

(assert (=> b!1334610 (= condMapEmpty!56809 (= (arr!43705 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17480)) mapDefault!56809)))))

(declare-fun b!1334611 () Bool)

(declare-fun res!885312 () Bool)

(assert (=> b!1334611 (=> (not res!885312) (not e!760395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90489 (_ BitVec 32)) Bool)

(assert (=> b!1334611 (= res!885312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56809 () Bool)

(assert (=> mapIsEmpty!56809 mapRes!56809))

(declare-fun b!1334612 () Bool)

(declare-fun res!885314 () Bool)

(assert (=> b!1334612 (=> (not res!885314) (not e!760395))))

(assert (=> b!1334612 (= res!885314 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44257 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334603 () Bool)

(declare-fun res!885316 () Bool)

(assert (=> b!1334603 (=> (not res!885316) (not e!760395))))

(declare-datatypes ((List!30970 0))(
  ( (Nil!30967) (Cons!30966 (h!32184 (_ BitVec 64)) (t!45168 List!30970)) )
))
(declare-fun arrayNoDuplicates!0 (array!90489 (_ BitVec 32) List!30970) Bool)

(assert (=> b!1334603 (= res!885316 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30967))))

(declare-fun res!885317 () Bool)

(assert (=> start!112676 (=> (not res!885317) (not e!760395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112676 (= res!885317 (validMask!0 mask!1998))))

(assert (=> start!112676 e!760395))

(declare-fun array_inv!33237 (array!90487) Bool)

(assert (=> start!112676 (and (array_inv!33237 _values!1320) e!760397)))

(assert (=> start!112676 true))

(declare-fun array_inv!33238 (array!90489) Bool)

(assert (=> start!112676 (array_inv!33238 _keys!1590)))

(assert (=> start!112676 tp!108177))

(assert (=> start!112676 tp_is_empty!36757))

(declare-fun b!1334613 () Bool)

(assert (=> b!1334613 (= e!760395 false)))

(declare-fun lt!592590 () Bool)

(declare-fun +!4747 (ListLongMap!21477 tuple2!23812) ListLongMap!21477)

(declare-fun getCurrentListMapNoExtraKeys!6391 (array!90489 array!90487 (_ BitVec 32) (_ BitVec 32) V!54113 V!54113 (_ BitVec 32) Int) ListLongMap!21477)

(declare-fun get!22062 (ValueCell!17480 V!54113) V!54113)

(declare-fun dynLambda!3701 (Int (_ BitVec 64)) V!54113)

(assert (=> b!1334613 (= lt!592590 (contains!8930 (+!4747 (getCurrentListMapNoExtraKeys!6391 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23813 (select (arr!43706 _keys!1590) from!1980) (get!22062 (select (arr!43705 _values!1320) from!1980) (dynLambda!3701 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1334614 () Bool)

(declare-fun res!885315 () Bool)

(assert (=> b!1334614 (=> (not res!885315) (not e!760395))))

(assert (=> b!1334614 (= res!885315 (and (= (size!44256 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44257 _keys!1590) (size!44256 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112676 res!885317) b!1334614))

(assert (= (and b!1334614 res!885315) b!1334611))

(assert (= (and b!1334611 res!885312) b!1334603))

(assert (= (and b!1334603 res!885316) b!1334612))

(assert (= (and b!1334612 res!885314) b!1334604))

(assert (= (and b!1334604 res!885313) b!1334608))

(assert (= (and b!1334608 res!885319) b!1334606))

(assert (= (and b!1334606 res!885318) b!1334605))

(assert (= (and b!1334605 res!885320) b!1334613))

(assert (= (and b!1334610 condMapEmpty!56809) mapIsEmpty!56809))

(assert (= (and b!1334610 (not condMapEmpty!56809)) mapNonEmpty!56809))

(get-info :version)

(assert (= (and mapNonEmpty!56809 ((_ is ValueCellFull!17480) mapValue!56809)) b!1334609))

(assert (= (and b!1334610 ((_ is ValueCellFull!17480) mapDefault!56809)) b!1334607))

(assert (= start!112676 b!1334610))

(declare-fun b_lambda!24047 () Bool)

(assert (=> (not b_lambda!24047) (not b!1334613)))

(declare-fun t!45166 () Bool)

(declare-fun tb!12001 () Bool)

(assert (=> (and start!112676 (= defaultEntry!1323 defaultEntry!1323) t!45166) tb!12001))

(declare-fun result!25081 () Bool)

(assert (=> tb!12001 (= result!25081 tp_is_empty!36757)))

(assert (=> b!1334613 t!45166))

(declare-fun b_and!49699 () Bool)

(assert (= b_and!49697 (and (=> t!45166 result!25081) b_and!49699)))

(declare-fun m!1223477 () Bool)

(assert (=> mapNonEmpty!56809 m!1223477))

(declare-fun m!1223479 () Bool)

(assert (=> b!1334604 m!1223479))

(assert (=> b!1334604 m!1223479))

(declare-fun m!1223481 () Bool)

(assert (=> b!1334604 m!1223481))

(declare-fun m!1223483 () Bool)

(assert (=> b!1334611 m!1223483))

(declare-fun m!1223485 () Bool)

(assert (=> start!112676 m!1223485))

(declare-fun m!1223487 () Bool)

(assert (=> start!112676 m!1223487))

(declare-fun m!1223489 () Bool)

(assert (=> start!112676 m!1223489))

(declare-fun m!1223491 () Bool)

(assert (=> b!1334603 m!1223491))

(declare-fun m!1223493 () Bool)

(assert (=> b!1334608 m!1223493))

(declare-fun m!1223495 () Bool)

(assert (=> b!1334613 m!1223495))

(declare-fun m!1223497 () Bool)

(assert (=> b!1334613 m!1223497))

(declare-fun m!1223499 () Bool)

(assert (=> b!1334613 m!1223499))

(declare-fun m!1223501 () Bool)

(assert (=> b!1334613 m!1223501))

(assert (=> b!1334613 m!1223495))

(declare-fun m!1223503 () Bool)

(assert (=> b!1334613 m!1223503))

(assert (=> b!1334613 m!1223499))

(declare-fun m!1223505 () Bool)

(assert (=> b!1334613 m!1223505))

(assert (=> b!1334613 m!1223497))

(assert (=> b!1334613 m!1223501))

(assert (=> b!1334613 m!1223493))

(assert (=> b!1334606 m!1223493))

(assert (=> b!1334606 m!1223493))

(declare-fun m!1223507 () Bool)

(assert (=> b!1334606 m!1223507))

(check-sat (not mapNonEmpty!56809) (not b!1334604) (not b!1334606) tp_is_empty!36757 b_and!49699 (not b_lambda!24047) (not b!1334603) (not b!1334613) (not start!112676) (not b!1334611) (not b_next!30847))
(check-sat b_and!49699 (not b_next!30847))
