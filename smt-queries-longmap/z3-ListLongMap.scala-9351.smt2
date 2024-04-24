; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111766 () Bool)

(assert start!111766)

(declare-fun b_free!30199 () Bool)

(declare-fun b_next!30199 () Bool)

(assert (=> start!111766 (= b_free!30199 (not b_next!30199))))

(declare-fun tp!106072 () Bool)

(declare-fun b_and!48559 () Bool)

(assert (=> start!111766 (= tp!106072 b_and!48559)))

(declare-fun res!877086 () Bool)

(declare-fun e!754176 () Bool)

(assert (=> start!111766 (=> (not res!877086) (not e!754176))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111766 (= res!877086 (validMask!0 mask!2019))))

(assert (=> start!111766 e!754176))

(declare-datatypes ((array!89045 0))(
  ( (array!89046 (arr!42992 (Array (_ BitVec 32) (_ BitVec 64))) (size!43543 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89045)

(declare-fun array_inv!32735 (array!89045) Bool)

(assert (=> start!111766 (array_inv!32735 _keys!1609)))

(assert (=> start!111766 true))

(declare-fun tp_is_empty!36019 () Bool)

(assert (=> start!111766 tp_is_empty!36019))

(declare-datatypes ((V!53129 0))(
  ( (V!53130 (val!18084 Int)) )
))
(declare-datatypes ((ValueCell!17111 0))(
  ( (ValueCellFull!17111 (v!20709 V!53129)) (EmptyCell!17111) )
))
(declare-datatypes ((array!89047 0))(
  ( (array!89048 (arr!42993 (Array (_ BitVec 32) ValueCell!17111)) (size!43544 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89047)

(declare-fun e!754174 () Bool)

(declare-fun array_inv!32736 (array!89047) Bool)

(assert (=> start!111766 (and (array_inv!32736 _values!1337) e!754174)))

(assert (=> start!111766 tp!106072))

(declare-fun b!1321999 () Bool)

(declare-fun res!877087 () Bool)

(assert (=> b!1321999 (=> (not res!877087) (not e!754176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89045 (_ BitVec 32)) Bool)

(assert (=> b!1321999 (= res!877087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322000 () Bool)

(declare-fun res!877083 () Bool)

(assert (=> b!1322000 (=> (not res!877083) (not e!754176))))

(declare-datatypes ((List!30478 0))(
  ( (Nil!30475) (Cons!30474 (h!31692 (_ BitVec 64)) (t!44218 List!30478)) )
))
(declare-fun arrayNoDuplicates!0 (array!89045 (_ BitVec 32) List!30478) Bool)

(assert (=> b!1322000 (= res!877083 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30475))))

(declare-fun b!1322001 () Bool)

(declare-fun res!877085 () Bool)

(assert (=> b!1322001 (=> (not res!877085) (not e!754176))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322001 (= res!877085 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43543 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322002 () Bool)

(assert (=> b!1322002 (= e!754176 (not true))))

(declare-datatypes ((tuple2!23324 0))(
  ( (tuple2!23325 (_1!11673 (_ BitVec 64)) (_2!11673 V!53129)) )
))
(declare-datatypes ((List!30479 0))(
  ( (Nil!30476) (Cons!30475 (h!31693 tuple2!23324) (t!44219 List!30479)) )
))
(declare-datatypes ((ListLongMap!20989 0))(
  ( (ListLongMap!20990 (toList!10510 List!30479)) )
))
(declare-fun lt!587519 () ListLongMap!20989)

(declare-fun contains!8677 (ListLongMap!20989 (_ BitVec 64)) Bool)

(assert (=> b!1322002 (contains!8677 lt!587519 k0!1164)))

(declare-fun zeroValue!1279 () V!53129)

(declare-datatypes ((Unit!43471 0))(
  ( (Unit!43472) )
))
(declare-fun lt!587516 () Unit!43471)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!147 ((_ BitVec 64) (_ BitVec 64) V!53129 ListLongMap!20989) Unit!43471)

(assert (=> b!1322002 (= lt!587516 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587519))))

(declare-fun lt!587518 () ListLongMap!20989)

(assert (=> b!1322002 (contains!8677 lt!587518 k0!1164)))

(declare-fun minValue!1279 () V!53129)

(declare-fun lt!587517 () Unit!43471)

(assert (=> b!1322002 (= lt!587517 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587518))))

(declare-fun +!4592 (ListLongMap!20989 tuple2!23324) ListLongMap!20989)

(assert (=> b!1322002 (= lt!587518 (+!4592 lt!587519 (tuple2!23325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6231 (array!89045 array!89047 (_ BitVec 32) (_ BitVec 32) V!53129 V!53129 (_ BitVec 32) Int) ListLongMap!20989)

(declare-fun get!21653 (ValueCell!17111 V!53129) V!53129)

(declare-fun dynLambda!3546 (Int (_ BitVec 64)) V!53129)

(assert (=> b!1322002 (= lt!587519 (+!4592 (getCurrentListMapNoExtraKeys!6231 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23325 (select (arr!42992 _keys!1609) from!2000) (get!21653 (select (arr!42993 _values!1337) from!2000) (dynLambda!3546 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1322003 () Bool)

(declare-fun e!754177 () Bool)

(assert (=> b!1322003 (= e!754177 tp_is_empty!36019)))

(declare-fun mapIsEmpty!55676 () Bool)

(declare-fun mapRes!55676 () Bool)

(assert (=> mapIsEmpty!55676 mapRes!55676))

(declare-fun mapNonEmpty!55676 () Bool)

(declare-fun tp!106073 () Bool)

(assert (=> mapNonEmpty!55676 (= mapRes!55676 (and tp!106073 e!754177))))

(declare-fun mapRest!55676 () (Array (_ BitVec 32) ValueCell!17111))

(declare-fun mapValue!55676 () ValueCell!17111)

(declare-fun mapKey!55676 () (_ BitVec 32))

(assert (=> mapNonEmpty!55676 (= (arr!42993 _values!1337) (store mapRest!55676 mapKey!55676 mapValue!55676))))

(declare-fun b!1322004 () Bool)

(declare-fun res!877089 () Bool)

(assert (=> b!1322004 (=> (not res!877089) (not e!754176))))

(assert (=> b!1322004 (= res!877089 (and (= (size!43544 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43543 _keys!1609) (size!43544 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322005 () Bool)

(declare-fun res!877090 () Bool)

(assert (=> b!1322005 (=> (not res!877090) (not e!754176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322005 (= res!877090 (validKeyInArray!0 (select (arr!42992 _keys!1609) from!2000)))))

(declare-fun b!1322006 () Bool)

(declare-fun e!754175 () Bool)

(assert (=> b!1322006 (= e!754174 (and e!754175 mapRes!55676))))

(declare-fun condMapEmpty!55676 () Bool)

(declare-fun mapDefault!55676 () ValueCell!17111)

(assert (=> b!1322006 (= condMapEmpty!55676 (= (arr!42993 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17111)) mapDefault!55676)))))

(declare-fun b!1322007 () Bool)

(declare-fun res!877084 () Bool)

(assert (=> b!1322007 (=> (not res!877084) (not e!754176))))

(assert (=> b!1322007 (= res!877084 (not (= (select (arr!42992 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322008 () Bool)

(declare-fun res!877088 () Bool)

(assert (=> b!1322008 (=> (not res!877088) (not e!754176))))

(declare-fun getCurrentListMap!5506 (array!89045 array!89047 (_ BitVec 32) (_ BitVec 32) V!53129 V!53129 (_ BitVec 32) Int) ListLongMap!20989)

(assert (=> b!1322008 (= res!877088 (contains!8677 (getCurrentListMap!5506 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322009 () Bool)

(assert (=> b!1322009 (= e!754175 tp_is_empty!36019)))

(assert (= (and start!111766 res!877086) b!1322004))

(assert (= (and b!1322004 res!877089) b!1321999))

(assert (= (and b!1321999 res!877087) b!1322000))

(assert (= (and b!1322000 res!877083) b!1322001))

(assert (= (and b!1322001 res!877085) b!1322008))

(assert (= (and b!1322008 res!877088) b!1322007))

(assert (= (and b!1322007 res!877084) b!1322005))

(assert (= (and b!1322005 res!877090) b!1322002))

(assert (= (and b!1322006 condMapEmpty!55676) mapIsEmpty!55676))

(assert (= (and b!1322006 (not condMapEmpty!55676)) mapNonEmpty!55676))

(get-info :version)

(assert (= (and mapNonEmpty!55676 ((_ is ValueCellFull!17111) mapValue!55676)) b!1322003))

(assert (= (and b!1322006 ((_ is ValueCellFull!17111) mapDefault!55676)) b!1322009))

(assert (= start!111766 b!1322006))

(declare-fun b_lambda!23519 () Bool)

(assert (=> (not b_lambda!23519) (not b!1322002)))

(declare-fun t!44217 () Bool)

(declare-fun tb!11543 () Bool)

(assert (=> (and start!111766 (= defaultEntry!1340 defaultEntry!1340) t!44217) tb!11543))

(declare-fun result!24149 () Bool)

(assert (=> tb!11543 (= result!24149 tp_is_empty!36019)))

(assert (=> b!1322002 t!44217))

(declare-fun b_and!48561 () Bool)

(assert (= b_and!48559 (and (=> t!44217 result!24149) b_and!48561)))

(declare-fun m!1210049 () Bool)

(assert (=> b!1321999 m!1210049))

(declare-fun m!1210051 () Bool)

(assert (=> b!1322008 m!1210051))

(assert (=> b!1322008 m!1210051))

(declare-fun m!1210053 () Bool)

(assert (=> b!1322008 m!1210053))

(declare-fun m!1210055 () Bool)

(assert (=> b!1322002 m!1210055))

(declare-fun m!1210057 () Bool)

(assert (=> b!1322002 m!1210057))

(declare-fun m!1210059 () Bool)

(assert (=> b!1322002 m!1210059))

(assert (=> b!1322002 m!1210057))

(declare-fun m!1210061 () Bool)

(assert (=> b!1322002 m!1210061))

(declare-fun m!1210063 () Bool)

(assert (=> b!1322002 m!1210063))

(declare-fun m!1210065 () Bool)

(assert (=> b!1322002 m!1210065))

(declare-fun m!1210067 () Bool)

(assert (=> b!1322002 m!1210067))

(declare-fun m!1210069 () Bool)

(assert (=> b!1322002 m!1210069))

(declare-fun m!1210071 () Bool)

(assert (=> b!1322002 m!1210071))

(assert (=> b!1322002 m!1210069))

(assert (=> b!1322002 m!1210059))

(declare-fun m!1210073 () Bool)

(assert (=> b!1322002 m!1210073))

(declare-fun m!1210075 () Bool)

(assert (=> b!1322002 m!1210075))

(declare-fun m!1210077 () Bool)

(assert (=> start!111766 m!1210077))

(declare-fun m!1210079 () Bool)

(assert (=> start!111766 m!1210079))

(declare-fun m!1210081 () Bool)

(assert (=> start!111766 m!1210081))

(declare-fun m!1210083 () Bool)

(assert (=> b!1322000 m!1210083))

(declare-fun m!1210085 () Bool)

(assert (=> mapNonEmpty!55676 m!1210085))

(assert (=> b!1322007 m!1210063))

(assert (=> b!1322005 m!1210063))

(assert (=> b!1322005 m!1210063))

(declare-fun m!1210087 () Bool)

(assert (=> b!1322005 m!1210087))

(check-sat (not b_next!30199) (not b_lambda!23519) (not mapNonEmpty!55676) (not b!1322000) (not b!1322008) b_and!48561 (not b!1322005) tp_is_empty!36019 (not b!1321999) (not start!111766) (not b!1322002))
(check-sat b_and!48561 (not b_next!30199))
