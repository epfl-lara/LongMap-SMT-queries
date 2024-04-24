; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112478 () Bool)

(assert start!112478)

(declare-fun b_free!30649 () Bool)

(declare-fun b_next!30649 () Bool)

(assert (=> start!112478 (= b_free!30649 (not b_next!30649))))

(declare-fun tp!107583 () Bool)

(declare-fun b_and!49355 () Bool)

(assert (=> start!112478 (= tp!107583 b_and!49355)))

(declare-fun b!1331192 () Bool)

(declare-fun res!882937 () Bool)

(declare-fun e!758910 () Bool)

(assert (=> b!1331192 (=> (not res!882937) (not e!758910))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331192 (= res!882937 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331193 () Bool)

(declare-fun e!758911 () Bool)

(declare-fun tp_is_empty!36559 () Bool)

(assert (=> b!1331193 (= e!758911 tp_is_empty!36559)))

(declare-fun b!1331194 () Bool)

(declare-fun res!882936 () Bool)

(assert (=> b!1331194 (=> (not res!882936) (not e!758910))))

(declare-datatypes ((V!53849 0))(
  ( (V!53850 (val!18354 Int)) )
))
(declare-datatypes ((ValueCell!17381 0))(
  ( (ValueCellFull!17381 (v!20986 V!53849)) (EmptyCell!17381) )
))
(declare-datatypes ((array!90117 0))(
  ( (array!90118 (arr!43520 (Array (_ BitVec 32) ValueCell!17381)) (size!44071 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90117)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90119 0))(
  ( (array!90120 (arr!43521 (Array (_ BitVec 32) (_ BitVec 64))) (size!44072 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90119)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53849)

(declare-fun zeroValue!1262 () V!53849)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23668 0))(
  ( (tuple2!23669 (_1!11845 (_ BitVec 64)) (_2!11845 V!53849)) )
))
(declare-datatypes ((List!30839 0))(
  ( (Nil!30836) (Cons!30835 (h!32053 tuple2!23668) (t!44893 List!30839)) )
))
(declare-datatypes ((ListLongMap!21333 0))(
  ( (ListLongMap!21334 (toList!10682 List!30839)) )
))
(declare-fun contains!8858 (ListLongMap!21333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5654 (array!90119 array!90117 (_ BitVec 32) (_ BitVec 32) V!53849 V!53849 (_ BitVec 32) Int) ListLongMap!21333)

(assert (=> b!1331194 (= res!882936 (contains!8858 (getCurrentListMap!5654 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331195 () Bool)

(assert (=> b!1331195 (= e!758910 (not true))))

(declare-fun lt!591504 () ListLongMap!21333)

(assert (=> b!1331195 (contains!8858 lt!591504 k0!1153)))

(declare-datatypes ((Unit!43714 0))(
  ( (Unit!43715) )
))
(declare-fun lt!591503 () Unit!43714)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!245 ((_ BitVec 64) (_ BitVec 64) V!53849 ListLongMap!21333) Unit!43714)

(assert (=> b!1331195 (= lt!591503 (lemmaInListMapAfterAddingDiffThenInBefore!245 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591504))))

(declare-fun +!4702 (ListLongMap!21333 tuple2!23668) ListLongMap!21333)

(declare-fun getCurrentListMapNoExtraKeys!6346 (array!90119 array!90117 (_ BitVec 32) (_ BitVec 32) V!53849 V!53849 (_ BitVec 32) Int) ListLongMap!21333)

(declare-fun get!21951 (ValueCell!17381 V!53849) V!53849)

(declare-fun dynLambda!3656 (Int (_ BitVec 64)) V!53849)

(assert (=> b!1331195 (= lt!591504 (+!4702 (getCurrentListMapNoExtraKeys!6346 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23669 (select (arr!43521 _keys!1590) from!1980) (get!21951 (select (arr!43520 _values!1320) from!1980) (dynLambda!3656 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1331196 () Bool)

(declare-fun res!882944 () Bool)

(assert (=> b!1331196 (=> (not res!882944) (not e!758910))))

(assert (=> b!1331196 (= res!882944 (not (= (select (arr!43521 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331197 () Bool)

(declare-fun res!882938 () Bool)

(assert (=> b!1331197 (=> (not res!882938) (not e!758910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331197 (= res!882938 (validKeyInArray!0 (select (arr!43521 _keys!1590) from!1980)))))

(declare-fun b!1331198 () Bool)

(declare-fun res!882940 () Bool)

(assert (=> b!1331198 (=> (not res!882940) (not e!758910))))

(declare-datatypes ((List!30840 0))(
  ( (Nil!30837) (Cons!30836 (h!32054 (_ BitVec 64)) (t!44894 List!30840)) )
))
(declare-fun arrayNoDuplicates!0 (array!90119 (_ BitVec 32) List!30840) Bool)

(assert (=> b!1331198 (= res!882940 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30837))))

(declare-fun b!1331199 () Bool)

(declare-fun e!758914 () Bool)

(assert (=> b!1331199 (= e!758914 tp_is_empty!36559)))

(declare-fun b!1331200 () Bool)

(declare-fun res!882941 () Bool)

(assert (=> b!1331200 (=> (not res!882941) (not e!758910))))

(assert (=> b!1331200 (= res!882941 (and (= (size!44071 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44072 _keys!1590) (size!44071 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56512 () Bool)

(declare-fun mapRes!56512 () Bool)

(assert (=> mapIsEmpty!56512 mapRes!56512))

(declare-fun mapNonEmpty!56512 () Bool)

(declare-fun tp!107584 () Bool)

(assert (=> mapNonEmpty!56512 (= mapRes!56512 (and tp!107584 e!758911))))

(declare-fun mapRest!56512 () (Array (_ BitVec 32) ValueCell!17381))

(declare-fun mapKey!56512 () (_ BitVec 32))

(declare-fun mapValue!56512 () ValueCell!17381)

(assert (=> mapNonEmpty!56512 (= (arr!43520 _values!1320) (store mapRest!56512 mapKey!56512 mapValue!56512))))

(declare-fun b!1331201 () Bool)

(declare-fun res!882942 () Bool)

(assert (=> b!1331201 (=> (not res!882942) (not e!758910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90119 (_ BitVec 32)) Bool)

(assert (=> b!1331201 (= res!882942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331202 () Bool)

(declare-fun e!758913 () Bool)

(assert (=> b!1331202 (= e!758913 (and e!758914 mapRes!56512))))

(declare-fun condMapEmpty!56512 () Bool)

(declare-fun mapDefault!56512 () ValueCell!17381)

(assert (=> b!1331202 (= condMapEmpty!56512 (= (arr!43520 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17381)) mapDefault!56512)))))

(declare-fun b!1331203 () Bool)

(declare-fun res!882939 () Bool)

(assert (=> b!1331203 (=> (not res!882939) (not e!758910))))

(assert (=> b!1331203 (= res!882939 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44072 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!882943 () Bool)

(assert (=> start!112478 (=> (not res!882943) (not e!758910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112478 (= res!882943 (validMask!0 mask!1998))))

(assert (=> start!112478 e!758910))

(declare-fun array_inv!33117 (array!90117) Bool)

(assert (=> start!112478 (and (array_inv!33117 _values!1320) e!758913)))

(assert (=> start!112478 true))

(declare-fun array_inv!33118 (array!90119) Bool)

(assert (=> start!112478 (array_inv!33118 _keys!1590)))

(assert (=> start!112478 tp!107583))

(assert (=> start!112478 tp_is_empty!36559))

(assert (= (and start!112478 res!882943) b!1331200))

(assert (= (and b!1331200 res!882941) b!1331201))

(assert (= (and b!1331201 res!882942) b!1331198))

(assert (= (and b!1331198 res!882940) b!1331203))

(assert (= (and b!1331203 res!882939) b!1331194))

(assert (= (and b!1331194 res!882936) b!1331196))

(assert (= (and b!1331196 res!882944) b!1331197))

(assert (= (and b!1331197 res!882938) b!1331192))

(assert (= (and b!1331192 res!882937) b!1331195))

(assert (= (and b!1331202 condMapEmpty!56512) mapIsEmpty!56512))

(assert (= (and b!1331202 (not condMapEmpty!56512)) mapNonEmpty!56512))

(get-info :version)

(assert (= (and mapNonEmpty!56512 ((_ is ValueCellFull!17381) mapValue!56512)) b!1331193))

(assert (= (and b!1331202 ((_ is ValueCellFull!17381) mapDefault!56512)) b!1331199))

(assert (= start!112478 b!1331202))

(declare-fun b_lambda!23903 () Bool)

(assert (=> (not b_lambda!23903) (not b!1331195)))

(declare-fun t!44892 () Bool)

(declare-fun tb!11857 () Bool)

(assert (=> (and start!112478 (= defaultEntry!1323 defaultEntry!1323) t!44892) tb!11857))

(declare-fun result!24793 () Bool)

(assert (=> tb!11857 (= result!24793 tp_is_empty!36559)))

(assert (=> b!1331195 t!44892))

(declare-fun b_and!49357 () Bool)

(assert (= b_and!49355 (and (=> t!44892 result!24793) b_and!49357)))

(declare-fun m!1220201 () Bool)

(assert (=> b!1331196 m!1220201))

(declare-fun m!1220203 () Bool)

(assert (=> mapNonEmpty!56512 m!1220203))

(assert (=> b!1331197 m!1220201))

(assert (=> b!1331197 m!1220201))

(declare-fun m!1220205 () Bool)

(assert (=> b!1331197 m!1220205))

(declare-fun m!1220207 () Bool)

(assert (=> b!1331201 m!1220207))

(declare-fun m!1220209 () Bool)

(assert (=> b!1331195 m!1220209))

(declare-fun m!1220211 () Bool)

(assert (=> b!1331195 m!1220211))

(declare-fun m!1220213 () Bool)

(assert (=> b!1331195 m!1220213))

(declare-fun m!1220215 () Bool)

(assert (=> b!1331195 m!1220215))

(declare-fun m!1220217 () Bool)

(assert (=> b!1331195 m!1220217))

(assert (=> b!1331195 m!1220211))

(declare-fun m!1220219 () Bool)

(assert (=> b!1331195 m!1220219))

(assert (=> b!1331195 m!1220213))

(assert (=> b!1331195 m!1220201))

(assert (=> b!1331195 m!1220217))

(declare-fun m!1220221 () Bool)

(assert (=> b!1331195 m!1220221))

(declare-fun m!1220223 () Bool)

(assert (=> b!1331194 m!1220223))

(assert (=> b!1331194 m!1220223))

(declare-fun m!1220225 () Bool)

(assert (=> b!1331194 m!1220225))

(declare-fun m!1220227 () Bool)

(assert (=> b!1331198 m!1220227))

(declare-fun m!1220229 () Bool)

(assert (=> start!112478 m!1220229))

(declare-fun m!1220231 () Bool)

(assert (=> start!112478 m!1220231))

(declare-fun m!1220233 () Bool)

(assert (=> start!112478 m!1220233))

(check-sat tp_is_empty!36559 (not b_lambda!23903) (not b!1331201) (not mapNonEmpty!56512) (not b_next!30649) b_and!49357 (not b!1331197) (not b!1331195) (not b!1331198) (not start!112478) (not b!1331194))
(check-sat b_and!49357 (not b_next!30649))
