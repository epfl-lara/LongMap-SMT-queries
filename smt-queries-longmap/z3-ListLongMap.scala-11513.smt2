; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133964 () Bool)

(assert start!133964)

(declare-fun b_free!32187 () Bool)

(declare-fun b_next!32187 () Bool)

(assert (=> start!133964 (= b_free!32187 (not b_next!32187))))

(declare-fun tp!113862 () Bool)

(declare-fun b_and!51815 () Bool)

(assert (=> start!133964 (= tp!113862 b_and!51815)))

(declare-fun res!1070532 () Bool)

(declare-fun e!872919 () Bool)

(assert (=> start!133964 (=> (not res!1070532) (not e!872919))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133964 (= res!1070532 (validMask!0 mask!947))))

(assert (=> start!133964 e!872919))

(assert (=> start!133964 tp!113862))

(declare-fun tp_is_empty!38961 () Bool)

(assert (=> start!133964 tp_is_empty!38961))

(assert (=> start!133964 true))

(declare-datatypes ((array!104608 0))(
  ( (array!104609 (arr!50491 (Array (_ BitVec 32) (_ BitVec 64))) (size!51041 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104608)

(declare-fun array_inv!39229 (array!104608) Bool)

(assert (=> start!133964 (array_inv!39229 _keys!637)))

(declare-datatypes ((V!60155 0))(
  ( (V!60156 (val!19564 Int)) )
))
(declare-datatypes ((ValueCell!18450 0))(
  ( (ValueCellFull!18450 (v!22320 V!60155)) (EmptyCell!18450) )
))
(declare-datatypes ((array!104610 0))(
  ( (array!104611 (arr!50492 (Array (_ BitVec 32) ValueCell!18450)) (size!51042 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104610)

(declare-fun e!872917 () Bool)

(declare-fun array_inv!39230 (array!104610) Bool)

(assert (=> start!133964 (and (array_inv!39230 _values!487) e!872917)))

(declare-fun b!1566109 () Bool)

(declare-fun e!872920 () Bool)

(assert (=> b!1566109 (= e!872920 tp_is_empty!38961)))

(declare-fun b!1566110 () Bool)

(declare-fun res!1070531 () Bool)

(assert (=> b!1566110 (=> (not res!1070531) (not e!872919))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566110 (= res!1070531 (validKeyInArray!0 (select (arr!50491 _keys!637) from!782)))))

(declare-fun b!1566111 () Bool)

(declare-fun res!1070533 () Bool)

(assert (=> b!1566111 (=> (not res!1070533) (not e!872919))))

(assert (=> b!1566111 (= res!1070533 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51041 _keys!637)) (bvslt from!782 (size!51041 _keys!637))))))

(declare-fun b!1566112 () Bool)

(declare-fun e!872915 () Bool)

(assert (=> b!1566112 (= e!872915 tp_is_empty!38961)))

(declare-fun mapNonEmpty!59833 () Bool)

(declare-fun mapRes!59833 () Bool)

(declare-fun tp!113863 () Bool)

(assert (=> mapNonEmpty!59833 (= mapRes!59833 (and tp!113863 e!872915))))

(declare-fun mapRest!59833 () (Array (_ BitVec 32) ValueCell!18450))

(declare-fun mapKey!59833 () (_ BitVec 32))

(declare-fun mapValue!59833 () ValueCell!18450)

(assert (=> mapNonEmpty!59833 (= (arr!50492 _values!487) (store mapRest!59833 mapKey!59833 mapValue!59833))))

(declare-fun b!1566113 () Bool)

(declare-fun e!872918 () Bool)

(assert (=> b!1566113 (= e!872919 (not e!872918))))

(declare-fun res!1070535 () Bool)

(assert (=> b!1566113 (=> (not res!1070535) (not e!872918))))

(declare-datatypes ((tuple2!25242 0))(
  ( (tuple2!25243 (_1!12632 (_ BitVec 64)) (_2!12632 V!60155)) )
))
(declare-datatypes ((List!36629 0))(
  ( (Nil!36626) (Cons!36625 (h!38071 tuple2!25242) (t!51530 List!36629)) )
))
(declare-datatypes ((ListLongMap!22677 0))(
  ( (ListLongMap!22678 (toList!11354 List!36629)) )
))
(declare-fun lt!672551 () ListLongMap!22677)

(declare-fun contains!10345 (ListLongMap!22677 (_ BitVec 64)) Bool)

(assert (=> b!1566113 (= res!1070535 (not (contains!10345 lt!672551 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1566113 (not (contains!10345 lt!672551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672553 () ListLongMap!22677)

(declare-fun lt!672554 () V!60155)

(declare-fun +!5084 (ListLongMap!22677 tuple2!25242) ListLongMap!22677)

(assert (=> b!1566113 (= lt!672551 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(declare-datatypes ((Unit!52032 0))(
  ( (Unit!52033) )
))
(declare-fun lt!672552 () Unit!52032)

(declare-fun addStillNotContains!574 (ListLongMap!22677 (_ BitVec 64) V!60155 (_ BitVec 64)) Unit!52032)

(assert (=> b!1566113 (= lt!672552 (addStillNotContains!574 lt!672553 (select (arr!50491 _keys!637) from!782) lt!672554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26361 (ValueCell!18450 V!60155) V!60155)

(declare-fun dynLambda!3868 (Int (_ BitVec 64)) V!60155)

(assert (=> b!1566113 (= lt!672554 (get!26361 (select (arr!50492 _values!487) from!782) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60155)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60155)

(declare-fun getCurrentListMapNoExtraKeys!6719 (array!104608 array!104610 (_ BitVec 32) (_ BitVec 32) V!60155 V!60155 (_ BitVec 32) Int) ListLongMap!22677)

(assert (=> b!1566113 (= lt!672553 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566114 () Bool)

(declare-fun res!1070536 () Bool)

(assert (=> b!1566114 (=> (not res!1070536) (not e!872919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104608 (_ BitVec 32)) Bool)

(assert (=> b!1566114 (= res!1070536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566115 () Bool)

(declare-fun res!1070534 () Bool)

(assert (=> b!1566115 (=> (not res!1070534) (not e!872918))))

(assert (=> b!1566115 (= res!1070534 (contains!10345 lt!672551 (select (arr!50491 _keys!637) from!782)))))

(declare-fun b!1566116 () Bool)

(declare-fun apply!1118 (ListLongMap!22677 (_ BitVec 64)) V!60155)

(assert (=> b!1566116 (= e!872918 (= (apply!1118 lt!672551 (select (arr!50491 _keys!637) from!782)) lt!672554))))

(declare-fun b!1566117 () Bool)

(assert (=> b!1566117 (= e!872917 (and e!872920 mapRes!59833))))

(declare-fun condMapEmpty!59833 () Bool)

(declare-fun mapDefault!59833 () ValueCell!18450)

(assert (=> b!1566117 (= condMapEmpty!59833 (= (arr!50492 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18450)) mapDefault!59833)))))

(declare-fun b!1566118 () Bool)

(declare-fun res!1070529 () Bool)

(assert (=> b!1566118 (=> (not res!1070529) (not e!872919))))

(assert (=> b!1566118 (= res!1070529 (and (= (size!51042 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51041 _keys!637) (size!51042 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59833 () Bool)

(assert (=> mapIsEmpty!59833 mapRes!59833))

(declare-fun b!1566119 () Bool)

(declare-fun res!1070530 () Bool)

(assert (=> b!1566119 (=> (not res!1070530) (not e!872919))))

(declare-datatypes ((List!36630 0))(
  ( (Nil!36627) (Cons!36626 (h!38072 (_ BitVec 64)) (t!51531 List!36630)) )
))
(declare-fun arrayNoDuplicates!0 (array!104608 (_ BitVec 32) List!36630) Bool)

(assert (=> b!1566119 (= res!1070530 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36627))))

(assert (= (and start!133964 res!1070532) b!1566118))

(assert (= (and b!1566118 res!1070529) b!1566114))

(assert (= (and b!1566114 res!1070536) b!1566119))

(assert (= (and b!1566119 res!1070530) b!1566111))

(assert (= (and b!1566111 res!1070533) b!1566110))

(assert (= (and b!1566110 res!1070531) b!1566113))

(assert (= (and b!1566113 res!1070535) b!1566115))

(assert (= (and b!1566115 res!1070534) b!1566116))

(assert (= (and b!1566117 condMapEmpty!59833) mapIsEmpty!59833))

(assert (= (and b!1566117 (not condMapEmpty!59833)) mapNonEmpty!59833))

(get-info :version)

(assert (= (and mapNonEmpty!59833 ((_ is ValueCellFull!18450) mapValue!59833)) b!1566112))

(assert (= (and b!1566117 ((_ is ValueCellFull!18450) mapDefault!59833)) b!1566109))

(assert (= start!133964 b!1566117))

(declare-fun b_lambda!25001 () Bool)

(assert (=> (not b_lambda!25001) (not b!1566113)))

(declare-fun t!51529 () Bool)

(declare-fun tb!12655 () Bool)

(assert (=> (and start!133964 (= defaultEntry!495 defaultEntry!495) t!51529) tb!12655))

(declare-fun result!26601 () Bool)

(assert (=> tb!12655 (= result!26601 tp_is_empty!38961)))

(assert (=> b!1566113 t!51529))

(declare-fun b_and!51817 () Bool)

(assert (= b_and!51815 (and (=> t!51529 result!26601) b_and!51817)))

(declare-fun m!1441043 () Bool)

(assert (=> b!1566116 m!1441043))

(assert (=> b!1566116 m!1441043))

(declare-fun m!1441045 () Bool)

(assert (=> b!1566116 m!1441045))

(declare-fun m!1441047 () Bool)

(assert (=> b!1566119 m!1441047))

(assert (=> b!1566115 m!1441043))

(assert (=> b!1566115 m!1441043))

(declare-fun m!1441049 () Bool)

(assert (=> b!1566115 m!1441049))

(declare-fun m!1441051 () Bool)

(assert (=> b!1566114 m!1441051))

(declare-fun m!1441053 () Bool)

(assert (=> mapNonEmpty!59833 m!1441053))

(assert (=> b!1566110 m!1441043))

(assert (=> b!1566110 m!1441043))

(declare-fun m!1441055 () Bool)

(assert (=> b!1566110 m!1441055))

(declare-fun m!1441057 () Bool)

(assert (=> start!133964 m!1441057))

(declare-fun m!1441059 () Bool)

(assert (=> start!133964 m!1441059))

(declare-fun m!1441061 () Bool)

(assert (=> start!133964 m!1441061))

(declare-fun m!1441063 () Bool)

(assert (=> b!1566113 m!1441063))

(declare-fun m!1441065 () Bool)

(assert (=> b!1566113 m!1441065))

(declare-fun m!1441067 () Bool)

(assert (=> b!1566113 m!1441067))

(assert (=> b!1566113 m!1441063))

(declare-fun m!1441069 () Bool)

(assert (=> b!1566113 m!1441069))

(assert (=> b!1566113 m!1441043))

(declare-fun m!1441071 () Bool)

(assert (=> b!1566113 m!1441071))

(assert (=> b!1566113 m!1441065))

(declare-fun m!1441073 () Bool)

(assert (=> b!1566113 m!1441073))

(assert (=> b!1566113 m!1441043))

(declare-fun m!1441075 () Bool)

(assert (=> b!1566113 m!1441075))

(declare-fun m!1441077 () Bool)

(assert (=> b!1566113 m!1441077))

(check-sat (not b!1566113) b_and!51817 (not start!133964) (not b_next!32187) (not b!1566116) (not b_lambda!25001) (not b!1566114) tp_is_empty!38961 (not b!1566119) (not mapNonEmpty!59833) (not b!1566115) (not b!1566110))
(check-sat b_and!51817 (not b_next!32187))
(get-model)

(declare-fun b_lambda!25005 () Bool)

(assert (= b_lambda!25001 (or (and start!133964 b_free!32187) b_lambda!25005)))

(check-sat (not b!1566113) b_and!51817 (not start!133964) (not b_next!32187) (not b!1566116) (not b_lambda!25005) (not b!1566114) tp_is_empty!38961 (not b!1566119) (not mapNonEmpty!59833) (not b!1566115) (not b!1566110))
(check-sat b_and!51817 (not b_next!32187))
(get-model)

(declare-fun d!163215 () Bool)

(declare-fun e!872943 () Bool)

(assert (=> d!163215 e!872943))

(declare-fun res!1070563 () Bool)

(assert (=> d!163215 (=> res!1070563 e!872943)))

(declare-fun lt!672576 () Bool)

(assert (=> d!163215 (= res!1070563 (not lt!672576))))

(declare-fun lt!672577 () Bool)

(assert (=> d!163215 (= lt!672576 lt!672577)))

(declare-fun lt!672578 () Unit!52032)

(declare-fun e!872944 () Unit!52032)

(assert (=> d!163215 (= lt!672578 e!872944)))

(declare-fun c!144305 () Bool)

(assert (=> d!163215 (= c!144305 lt!672577)))

(declare-fun containsKey!851 (List!36629 (_ BitVec 64)) Bool)

(assert (=> d!163215 (= lt!672577 (containsKey!851 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))

(assert (=> d!163215 (= (contains!10345 lt!672551 (select (arr!50491 _keys!637) from!782)) lt!672576)))

(declare-fun b!1566163 () Bool)

(declare-fun lt!672575 () Unit!52032)

(assert (=> b!1566163 (= e!872944 lt!672575)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!534 (List!36629 (_ BitVec 64)) Unit!52032)

(assert (=> b!1566163 (= lt!672575 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))

(declare-datatypes ((Option!869 0))(
  ( (Some!868 (v!22322 V!60155)) (None!867) )
))
(declare-fun isDefined!582 (Option!869) Bool)

(declare-fun getValueByKey!793 (List!36629 (_ BitVec 64)) Option!869)

(assert (=> b!1566163 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))

(declare-fun b!1566164 () Bool)

(declare-fun Unit!52036 () Unit!52032)

(assert (=> b!1566164 (= e!872944 Unit!52036)))

(declare-fun b!1566165 () Bool)

(assert (=> b!1566165 (= e!872943 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782))))))

(assert (= (and d!163215 c!144305) b!1566163))

(assert (= (and d!163215 (not c!144305)) b!1566164))

(assert (= (and d!163215 (not res!1070563)) b!1566165))

(assert (=> d!163215 m!1441043))

(declare-fun m!1441115 () Bool)

(assert (=> d!163215 m!1441115))

(assert (=> b!1566163 m!1441043))

(declare-fun m!1441117 () Bool)

(assert (=> b!1566163 m!1441117))

(assert (=> b!1566163 m!1441043))

(declare-fun m!1441119 () Bool)

(assert (=> b!1566163 m!1441119))

(assert (=> b!1566163 m!1441119))

(declare-fun m!1441121 () Bool)

(assert (=> b!1566163 m!1441121))

(assert (=> b!1566165 m!1441043))

(assert (=> b!1566165 m!1441119))

(assert (=> b!1566165 m!1441119))

(assert (=> b!1566165 m!1441121))

(assert (=> b!1566115 d!163215))

(declare-fun b!1566176 () Bool)

(declare-fun e!872956 () Bool)

(declare-fun call!71885 () Bool)

(assert (=> b!1566176 (= e!872956 call!71885)))

(declare-fun b!1566177 () Bool)

(assert (=> b!1566177 (= e!872956 call!71885)))

(declare-fun b!1566178 () Bool)

(declare-fun e!872954 () Bool)

(declare-fun e!872955 () Bool)

(assert (=> b!1566178 (= e!872954 e!872955)))

(declare-fun res!1070572 () Bool)

(assert (=> b!1566178 (=> (not res!1070572) (not e!872955))))

(declare-fun e!872953 () Bool)

(assert (=> b!1566178 (= res!1070572 (not e!872953))))

(declare-fun res!1070571 () Bool)

(assert (=> b!1566178 (=> (not res!1070571) (not e!872953))))

(assert (=> b!1566178 (= res!1070571 (validKeyInArray!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566179 () Bool)

(assert (=> b!1566179 (= e!872955 e!872956)))

(declare-fun c!144308 () Bool)

(assert (=> b!1566179 (= c!144308 (validKeyInArray!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71882 () Bool)

(assert (=> bm!71882 (= call!71885 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)))))

(declare-fun d!163217 () Bool)

(declare-fun res!1070570 () Bool)

(assert (=> d!163217 (=> res!1070570 e!872954)))

(assert (=> d!163217 (= res!1070570 (bvsge #b00000000000000000000000000000000 (size!51041 _keys!637)))))

(assert (=> d!163217 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36627) e!872954)))

(declare-fun b!1566180 () Bool)

(declare-fun contains!10347 (List!36630 (_ BitVec 64)) Bool)

(assert (=> b!1566180 (= e!872953 (contains!10347 Nil!36627 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163217 (not res!1070570)) b!1566178))

(assert (= (and b!1566178 res!1070571) b!1566180))

(assert (= (and b!1566178 res!1070572) b!1566179))

(assert (= (and b!1566179 c!144308) b!1566176))

(assert (= (and b!1566179 (not c!144308)) b!1566177))

(assert (= (or b!1566176 b!1566177) bm!71882))

(declare-fun m!1441123 () Bool)

(assert (=> b!1566178 m!1441123))

(assert (=> b!1566178 m!1441123))

(declare-fun m!1441125 () Bool)

(assert (=> b!1566178 m!1441125))

(assert (=> b!1566179 m!1441123))

(assert (=> b!1566179 m!1441123))

(assert (=> b!1566179 m!1441125))

(assert (=> bm!71882 m!1441123))

(declare-fun m!1441127 () Bool)

(assert (=> bm!71882 m!1441127))

(assert (=> b!1566180 m!1441123))

(assert (=> b!1566180 m!1441123))

(declare-fun m!1441129 () Bool)

(assert (=> b!1566180 m!1441129))

(assert (=> b!1566119 d!163217))

(declare-fun d!163219 () Bool)

(assert (=> d!163219 (= (validKeyInArray!0 (select (arr!50491 _keys!637) from!782)) (and (not (= (select (arr!50491 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50491 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566110 d!163219))

(declare-fun d!163221 () Bool)

(declare-fun res!1070577 () Bool)

(declare-fun e!872963 () Bool)

(assert (=> d!163221 (=> res!1070577 e!872963)))

(assert (=> d!163221 (= res!1070577 (bvsge #b00000000000000000000000000000000 (size!51041 _keys!637)))))

(assert (=> d!163221 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872963)))

(declare-fun b!1566189 () Bool)

(declare-fun e!872965 () Bool)

(declare-fun call!71888 () Bool)

(assert (=> b!1566189 (= e!872965 call!71888)))

(declare-fun b!1566190 () Bool)

(declare-fun e!872964 () Bool)

(assert (=> b!1566190 (= e!872964 call!71888)))

(declare-fun b!1566191 () Bool)

(assert (=> b!1566191 (= e!872964 e!872965)))

(declare-fun lt!672586 () (_ BitVec 64))

(assert (=> b!1566191 (= lt!672586 (select (arr!50491 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672587 () Unit!52032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104608 (_ BitVec 64) (_ BitVec 32)) Unit!52032)

(assert (=> b!1566191 (= lt!672587 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672586 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1566191 (arrayContainsKey!0 _keys!637 lt!672586 #b00000000000000000000000000000000)))

(declare-fun lt!672585 () Unit!52032)

(assert (=> b!1566191 (= lt!672585 lt!672587)))

(declare-fun res!1070578 () Bool)

(declare-datatypes ((SeekEntryResult!13526 0))(
  ( (MissingZero!13526 (index!56502 (_ BitVec 32))) (Found!13526 (index!56503 (_ BitVec 32))) (Intermediate!13526 (undefined!14338 Bool) (index!56504 (_ BitVec 32)) (x!140749 (_ BitVec 32))) (Undefined!13526) (MissingVacant!13526 (index!56505 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104608 (_ BitVec 32)) SeekEntryResult!13526)

(assert (=> b!1566191 (= res!1070578 (= (seekEntryOrOpen!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13526 #b00000000000000000000000000000000)))))

(assert (=> b!1566191 (=> (not res!1070578) (not e!872965))))

(declare-fun bm!71885 () Bool)

(assert (=> bm!71885 (= call!71888 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566192 () Bool)

(assert (=> b!1566192 (= e!872963 e!872964)))

(declare-fun c!144311 () Bool)

(assert (=> b!1566192 (= c!144311 (validKeyInArray!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163221 (not res!1070577)) b!1566192))

(assert (= (and b!1566192 c!144311) b!1566191))

(assert (= (and b!1566192 (not c!144311)) b!1566190))

(assert (= (and b!1566191 res!1070578) b!1566189))

(assert (= (or b!1566189 b!1566190) bm!71885))

(assert (=> b!1566191 m!1441123))

(declare-fun m!1441131 () Bool)

(assert (=> b!1566191 m!1441131))

(declare-fun m!1441133 () Bool)

(assert (=> b!1566191 m!1441133))

(assert (=> b!1566191 m!1441123))

(declare-fun m!1441135 () Bool)

(assert (=> b!1566191 m!1441135))

(declare-fun m!1441137 () Bool)

(assert (=> bm!71885 m!1441137))

(assert (=> b!1566192 m!1441123))

(assert (=> b!1566192 m!1441123))

(assert (=> b!1566192 m!1441125))

(assert (=> b!1566114 d!163221))

(declare-fun d!163223 () Bool)

(declare-fun get!26363 (Option!869) V!60155)

(assert (=> d!163223 (= (apply!1118 lt!672551 (select (arr!50491 _keys!637) from!782)) (get!26363 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782))))))

(declare-fun bs!45067 () Bool)

(assert (= bs!45067 d!163223))

(assert (=> bs!45067 m!1441043))

(assert (=> bs!45067 m!1441119))

(assert (=> bs!45067 m!1441119))

(declare-fun m!1441139 () Bool)

(assert (=> bs!45067 m!1441139))

(assert (=> b!1566116 d!163223))

(declare-fun d!163225 () Bool)

(assert (=> d!163225 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133964 d!163225))

(declare-fun d!163227 () Bool)

(assert (=> d!163227 (= (array_inv!39229 _keys!637) (bvsge (size!51041 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133964 d!163227))

(declare-fun d!163229 () Bool)

(assert (=> d!163229 (= (array_inv!39230 _values!487) (bvsge (size!51042 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133964 d!163229))

(declare-fun d!163231 () Bool)

(declare-fun c!144314 () Bool)

(assert (=> d!163231 (= c!144314 ((_ is ValueCellFull!18450) (select (arr!50492 _values!487) from!782)))))

(declare-fun e!872968 () V!60155)

(assert (=> d!163231 (= (get!26361 (select (arr!50492 _values!487) from!782) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!872968)))

(declare-fun b!1566197 () Bool)

(declare-fun get!26364 (ValueCell!18450 V!60155) V!60155)

(assert (=> b!1566197 (= e!872968 (get!26364 (select (arr!50492 _values!487) from!782) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566198 () Bool)

(declare-fun get!26365 (ValueCell!18450 V!60155) V!60155)

(assert (=> b!1566198 (= e!872968 (get!26365 (select (arr!50492 _values!487) from!782) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163231 c!144314) b!1566197))

(assert (= (and d!163231 (not c!144314)) b!1566198))

(assert (=> b!1566197 m!1441063))

(assert (=> b!1566197 m!1441065))

(declare-fun m!1441141 () Bool)

(assert (=> b!1566197 m!1441141))

(assert (=> b!1566198 m!1441063))

(assert (=> b!1566198 m!1441065))

(declare-fun m!1441143 () Bool)

(assert (=> b!1566198 m!1441143))

(assert (=> b!1566113 d!163231))

(declare-fun d!163233 () Bool)

(declare-fun e!872969 () Bool)

(assert (=> d!163233 e!872969))

(declare-fun res!1070579 () Bool)

(assert (=> d!163233 (=> res!1070579 e!872969)))

(declare-fun lt!672589 () Bool)

(assert (=> d!163233 (= res!1070579 (not lt!672589))))

(declare-fun lt!672590 () Bool)

(assert (=> d!163233 (= lt!672589 lt!672590)))

(declare-fun lt!672591 () Unit!52032)

(declare-fun e!872970 () Unit!52032)

(assert (=> d!163233 (= lt!672591 e!872970)))

(declare-fun c!144315 () Bool)

(assert (=> d!163233 (= c!144315 lt!672590)))

(assert (=> d!163233 (= lt!672590 (containsKey!851 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163233 (= (contains!10345 lt!672551 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672589)))

(declare-fun b!1566199 () Bool)

(declare-fun lt!672588 () Unit!52032)

(assert (=> b!1566199 (= e!872970 lt!672588)))

(assert (=> b!1566199 (= lt!672588 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566199 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566200 () Bool)

(declare-fun Unit!52037 () Unit!52032)

(assert (=> b!1566200 (= e!872970 Unit!52037)))

(declare-fun b!1566201 () Bool)

(assert (=> b!1566201 (= e!872969 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163233 c!144315) b!1566199))

(assert (= (and d!163233 (not c!144315)) b!1566200))

(assert (= (and d!163233 (not res!1070579)) b!1566201))

(declare-fun m!1441145 () Bool)

(assert (=> d!163233 m!1441145))

(declare-fun m!1441147 () Bool)

(assert (=> b!1566199 m!1441147))

(declare-fun m!1441149 () Bool)

(assert (=> b!1566199 m!1441149))

(assert (=> b!1566199 m!1441149))

(declare-fun m!1441151 () Bool)

(assert (=> b!1566199 m!1441151))

(assert (=> b!1566201 m!1441149))

(assert (=> b!1566201 m!1441149))

(assert (=> b!1566201 m!1441151))

(assert (=> b!1566113 d!163233))

(declare-fun d!163235 () Bool)

(assert (=> d!163235 (not (contains!10345 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672594 () Unit!52032)

(declare-fun choose!2075 (ListLongMap!22677 (_ BitVec 64) V!60155 (_ BitVec 64)) Unit!52032)

(assert (=> d!163235 (= lt!672594 (choose!2075 lt!672553 (select (arr!50491 _keys!637) from!782) lt!672554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872973 () Bool)

(assert (=> d!163235 e!872973))

(declare-fun res!1070582 () Bool)

(assert (=> d!163235 (=> (not res!1070582) (not e!872973))))

(assert (=> d!163235 (= res!1070582 (not (contains!10345 lt!672553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163235 (= (addStillNotContains!574 lt!672553 (select (arr!50491 _keys!637) from!782) lt!672554 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672594)))

(declare-fun b!1566205 () Bool)

(assert (=> b!1566205 (= e!872973 (not (= (select (arr!50491 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163235 res!1070582) b!1566205))

(assert (=> d!163235 m!1441073))

(assert (=> d!163235 m!1441073))

(declare-fun m!1441153 () Bool)

(assert (=> d!163235 m!1441153))

(assert (=> d!163235 m!1441043))

(declare-fun m!1441155 () Bool)

(assert (=> d!163235 m!1441155))

(declare-fun m!1441157 () Bool)

(assert (=> d!163235 m!1441157))

(assert (=> b!1566113 d!163235))

(declare-fun b!1566230 () Bool)

(declare-fun e!872993 () Bool)

(declare-fun e!872989 () Bool)

(assert (=> b!1566230 (= e!872993 e!872989)))

(assert (=> b!1566230 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51041 _keys!637)))))

(declare-fun res!1070592 () Bool)

(declare-fun lt!672614 () ListLongMap!22677)

(assert (=> b!1566230 (= res!1070592 (contains!10345 lt!672614 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1566230 (=> (not res!1070592) (not e!872989))))

(declare-fun b!1566231 () Bool)

(declare-fun e!872990 () Bool)

(declare-fun isEmpty!1146 (ListLongMap!22677) Bool)

(assert (=> b!1566231 (= e!872990 (isEmpty!1146 lt!672614))))

(declare-fun b!1566232 () Bool)

(declare-fun res!1070593 () Bool)

(declare-fun e!872991 () Bool)

(assert (=> b!1566232 (=> (not res!1070593) (not e!872991))))

(assert (=> b!1566232 (= res!1070593 (not (contains!10345 lt!672614 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!71891 () ListLongMap!22677)

(declare-fun bm!71888 () Bool)

(assert (=> bm!71888 (= call!71891 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1566233 () Bool)

(declare-fun lt!672609 () Unit!52032)

(declare-fun lt!672611 () Unit!52032)

(assert (=> b!1566233 (= lt!672609 lt!672611)))

(declare-fun lt!672615 () (_ BitVec 64))

(declare-fun lt!672612 () V!60155)

(declare-fun lt!672613 () ListLongMap!22677)

(declare-fun lt!672610 () (_ BitVec 64))

(assert (=> b!1566233 (not (contains!10345 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)) lt!672615))))

(assert (=> b!1566233 (= lt!672611 (addStillNotContains!574 lt!672613 lt!672610 lt!672612 lt!672615))))

(assert (=> b!1566233 (= lt!672615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1566233 (= lt!672612 (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1566233 (= lt!672610 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1566233 (= lt!672613 call!71891)))

(declare-fun e!872994 () ListLongMap!22677)

(assert (=> b!1566233 (= e!872994 (+!5084 call!71891 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1566234 () Bool)

(assert (=> b!1566234 (= e!872990 (= lt!672614 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1566235 () Bool)

(declare-fun e!872988 () Bool)

(assert (=> b!1566235 (= e!872988 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1566235 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun d!163237 () Bool)

(assert (=> d!163237 e!872991))

(declare-fun res!1070591 () Bool)

(assert (=> d!163237 (=> (not res!1070591) (not e!872991))))

(assert (=> d!163237 (= res!1070591 (not (contains!10345 lt!672614 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!872992 () ListLongMap!22677)

(assert (=> d!163237 (= lt!672614 e!872992)))

(declare-fun c!144325 () Bool)

(assert (=> d!163237 (= c!144325 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51041 _keys!637)))))

(assert (=> d!163237 (validMask!0 mask!947)))

(assert (=> d!163237 (= (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672614)))

(declare-fun b!1566236 () Bool)

(assert (=> b!1566236 (= e!872993 e!872990)))

(declare-fun c!144327 () Bool)

(assert (=> b!1566236 (= c!144327 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51041 _keys!637)))))

(declare-fun b!1566237 () Bool)

(assert (=> b!1566237 (= e!872992 e!872994)))

(declare-fun c!144324 () Bool)

(assert (=> b!1566237 (= c!144324 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1566238 () Bool)

(assert (=> b!1566238 (= e!872991 e!872993)))

(declare-fun c!144326 () Bool)

(assert (=> b!1566238 (= c!144326 e!872988)))

(declare-fun res!1070594 () Bool)

(assert (=> b!1566238 (=> (not res!1070594) (not e!872988))))

(assert (=> b!1566238 (= res!1070594 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51041 _keys!637)))))

(declare-fun b!1566239 () Bool)

(assert (=> b!1566239 (= e!872994 call!71891)))

(declare-fun b!1566240 () Bool)

(assert (=> b!1566240 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51041 _keys!637)))))

(assert (=> b!1566240 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51042 _values!487)))))

(assert (=> b!1566240 (= e!872989 (= (apply!1118 lt!672614 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566241 () Bool)

(assert (=> b!1566241 (= e!872992 (ListLongMap!22678 Nil!36626))))

(assert (= (and d!163237 c!144325) b!1566241))

(assert (= (and d!163237 (not c!144325)) b!1566237))

(assert (= (and b!1566237 c!144324) b!1566233))

(assert (= (and b!1566237 (not c!144324)) b!1566239))

(assert (= (or b!1566233 b!1566239) bm!71888))

(assert (= (and d!163237 res!1070591) b!1566232))

(assert (= (and b!1566232 res!1070593) b!1566238))

(assert (= (and b!1566238 res!1070594) b!1566235))

(assert (= (and b!1566238 c!144326) b!1566230))

(assert (= (and b!1566238 (not c!144326)) b!1566236))

(assert (= (and b!1566230 res!1070592) b!1566240))

(assert (= (and b!1566236 c!144327) b!1566234))

(assert (= (and b!1566236 (not c!144327)) b!1566231))

(declare-fun b_lambda!25007 () Bool)

(assert (=> (not b_lambda!25007) (not b!1566233)))

(assert (=> b!1566233 t!51529))

(declare-fun b_and!51823 () Bool)

(assert (= b_and!51817 (and (=> t!51529 result!26601) b_and!51823)))

(declare-fun b_lambda!25009 () Bool)

(assert (=> (not b_lambda!25009) (not b!1566240)))

(assert (=> b!1566240 t!51529))

(declare-fun b_and!51825 () Bool)

(assert (= b_and!51823 (and (=> t!51529 result!26601) b_and!51825)))

(declare-fun m!1441159 () Bool)

(assert (=> bm!71888 m!1441159))

(assert (=> b!1566233 m!1441065))

(declare-fun m!1441161 () Bool)

(assert (=> b!1566233 m!1441161))

(assert (=> b!1566233 m!1441065))

(declare-fun m!1441163 () Bool)

(assert (=> b!1566233 m!1441163))

(declare-fun m!1441165 () Bool)

(assert (=> b!1566233 m!1441165))

(declare-fun m!1441167 () Bool)

(assert (=> b!1566233 m!1441167))

(declare-fun m!1441169 () Bool)

(assert (=> b!1566233 m!1441169))

(assert (=> b!1566233 m!1441169))

(declare-fun m!1441171 () Bool)

(assert (=> b!1566233 m!1441171))

(assert (=> b!1566233 m!1441161))

(declare-fun m!1441173 () Bool)

(assert (=> b!1566233 m!1441173))

(assert (=> b!1566240 m!1441065))

(assert (=> b!1566240 m!1441173))

(declare-fun m!1441175 () Bool)

(assert (=> b!1566240 m!1441175))

(assert (=> b!1566240 m!1441161))

(assert (=> b!1566240 m!1441065))

(assert (=> b!1566240 m!1441163))

(assert (=> b!1566240 m!1441161))

(assert (=> b!1566240 m!1441173))

(declare-fun m!1441177 () Bool)

(assert (=> b!1566232 m!1441177))

(assert (=> b!1566234 m!1441159))

(assert (=> b!1566235 m!1441173))

(assert (=> b!1566235 m!1441173))

(declare-fun m!1441179 () Bool)

(assert (=> b!1566235 m!1441179))

(declare-fun m!1441181 () Bool)

(assert (=> b!1566231 m!1441181))

(assert (=> b!1566237 m!1441173))

(assert (=> b!1566237 m!1441173))

(assert (=> b!1566237 m!1441179))

(declare-fun m!1441183 () Bool)

(assert (=> d!163237 m!1441183))

(assert (=> d!163237 m!1441057))

(assert (=> b!1566230 m!1441173))

(assert (=> b!1566230 m!1441173))

(declare-fun m!1441185 () Bool)

(assert (=> b!1566230 m!1441185))

(assert (=> b!1566113 d!163237))

(declare-fun d!163239 () Bool)

(declare-fun e!872995 () Bool)

(assert (=> d!163239 e!872995))

(declare-fun res!1070595 () Bool)

(assert (=> d!163239 (=> res!1070595 e!872995)))

(declare-fun lt!672617 () Bool)

(assert (=> d!163239 (= res!1070595 (not lt!672617))))

(declare-fun lt!672618 () Bool)

(assert (=> d!163239 (= lt!672617 lt!672618)))

(declare-fun lt!672619 () Unit!52032)

(declare-fun e!872996 () Unit!52032)

(assert (=> d!163239 (= lt!672619 e!872996)))

(declare-fun c!144328 () Bool)

(assert (=> d!163239 (= c!144328 lt!672618)))

(assert (=> d!163239 (= lt!672618 (containsKey!851 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163239 (= (contains!10345 lt!672551 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672617)))

(declare-fun b!1566242 () Bool)

(declare-fun lt!672616 () Unit!52032)

(assert (=> b!1566242 (= e!872996 lt!672616)))

(assert (=> b!1566242 (= lt!672616 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566242 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566243 () Bool)

(declare-fun Unit!52038 () Unit!52032)

(assert (=> b!1566243 (= e!872996 Unit!52038)))

(declare-fun b!1566244 () Bool)

(assert (=> b!1566244 (= e!872995 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163239 c!144328) b!1566242))

(assert (= (and d!163239 (not c!144328)) b!1566243))

(assert (= (and d!163239 (not res!1070595)) b!1566244))

(declare-fun m!1441187 () Bool)

(assert (=> d!163239 m!1441187))

(declare-fun m!1441189 () Bool)

(assert (=> b!1566242 m!1441189))

(declare-fun m!1441191 () Bool)

(assert (=> b!1566242 m!1441191))

(assert (=> b!1566242 m!1441191))

(declare-fun m!1441193 () Bool)

(assert (=> b!1566242 m!1441193))

(assert (=> b!1566244 m!1441191))

(assert (=> b!1566244 m!1441191))

(assert (=> b!1566244 m!1441193))

(assert (=> b!1566113 d!163239))

(declare-fun d!163241 () Bool)

(declare-fun e!872999 () Bool)

(assert (=> d!163241 e!872999))

(declare-fun res!1070601 () Bool)

(assert (=> d!163241 (=> (not res!1070601) (not e!872999))))

(declare-fun lt!672630 () ListLongMap!22677)

(assert (=> d!163241 (= res!1070601 (contains!10345 lt!672630 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun lt!672629 () List!36629)

(assert (=> d!163241 (= lt!672630 (ListLongMap!22678 lt!672629))))

(declare-fun lt!672631 () Unit!52032)

(declare-fun lt!672628 () Unit!52032)

(assert (=> d!163241 (= lt!672631 lt!672628)))

(assert (=> d!163241 (= (getValueByKey!793 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun lemmaContainsTupThenGetReturnValue!387 (List!36629 (_ BitVec 64) V!60155) Unit!52032)

(assert (=> d!163241 (= lt!672628 (lemmaContainsTupThenGetReturnValue!387 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun insertStrictlySorted!577 (List!36629 (_ BitVec 64) V!60155) List!36629)

(assert (=> d!163241 (= lt!672629 (insertStrictlySorted!577 (toList!11354 lt!672553) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (=> d!163241 (= (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) lt!672630)))

(declare-fun b!1566249 () Bool)

(declare-fun res!1070600 () Bool)

(assert (=> b!1566249 (=> (not res!1070600) (not e!872999))))

(assert (=> b!1566249 (= res!1070600 (= (getValueByKey!793 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun b!1566250 () Bool)

(declare-fun contains!10348 (List!36629 tuple2!25242) Bool)

(assert (=> b!1566250 (= e!872999 (contains!10348 (toList!11354 lt!672630) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(assert (= (and d!163241 res!1070601) b!1566249))

(assert (= (and b!1566249 res!1070600) b!1566250))

(declare-fun m!1441195 () Bool)

(assert (=> d!163241 m!1441195))

(declare-fun m!1441197 () Bool)

(assert (=> d!163241 m!1441197))

(declare-fun m!1441199 () Bool)

(assert (=> d!163241 m!1441199))

(declare-fun m!1441201 () Bool)

(assert (=> d!163241 m!1441201))

(declare-fun m!1441203 () Bool)

(assert (=> b!1566249 m!1441203))

(declare-fun m!1441205 () Bool)

(assert (=> b!1566250 m!1441205))

(assert (=> b!1566113 d!163241))

(declare-fun condMapEmpty!59839 () Bool)

(declare-fun mapDefault!59839 () ValueCell!18450)

(assert (=> mapNonEmpty!59833 (= condMapEmpty!59839 (= mapRest!59833 ((as const (Array (_ BitVec 32) ValueCell!18450)) mapDefault!59839)))))

(declare-fun e!873005 () Bool)

(declare-fun mapRes!59839 () Bool)

(assert (=> mapNonEmpty!59833 (= tp!113863 (and e!873005 mapRes!59839))))

(declare-fun b!1566258 () Bool)

(assert (=> b!1566258 (= e!873005 tp_is_empty!38961)))

(declare-fun mapIsEmpty!59839 () Bool)

(assert (=> mapIsEmpty!59839 mapRes!59839))

(declare-fun mapNonEmpty!59839 () Bool)

(declare-fun tp!113872 () Bool)

(declare-fun e!873004 () Bool)

(assert (=> mapNonEmpty!59839 (= mapRes!59839 (and tp!113872 e!873004))))

(declare-fun mapValue!59839 () ValueCell!18450)

(declare-fun mapKey!59839 () (_ BitVec 32))

(declare-fun mapRest!59839 () (Array (_ BitVec 32) ValueCell!18450))

(assert (=> mapNonEmpty!59839 (= mapRest!59833 (store mapRest!59839 mapKey!59839 mapValue!59839))))

(declare-fun b!1566257 () Bool)

(assert (=> b!1566257 (= e!873004 tp_is_empty!38961)))

(assert (= (and mapNonEmpty!59833 condMapEmpty!59839) mapIsEmpty!59839))

(assert (= (and mapNonEmpty!59833 (not condMapEmpty!59839)) mapNonEmpty!59839))

(assert (= (and mapNonEmpty!59839 ((_ is ValueCellFull!18450) mapValue!59839)) b!1566257))

(assert (= (and mapNonEmpty!59833 ((_ is ValueCellFull!18450) mapDefault!59839)) b!1566258))

(declare-fun m!1441207 () Bool)

(assert (=> mapNonEmpty!59839 m!1441207))

(declare-fun b_lambda!25011 () Bool)

(assert (= b_lambda!25007 (or (and start!133964 b_free!32187) b_lambda!25011)))

(declare-fun b_lambda!25013 () Bool)

(assert (= b_lambda!25009 (or (and start!133964 b_free!32187) b_lambda!25013)))

(check-sat (not b!1566180) (not b!1566249) (not b!1566234) (not d!163223) (not b!1566192) (not b_next!32187) (not b!1566230) (not bm!71885) (not d!163235) (not d!163237) (not b!1566244) (not b!1566231) (not b!1566235) tp_is_empty!38961 (not b!1566191) (not b!1566237) (not d!163233) (not bm!71882) (not b!1566201) (not b_lambda!25011) (not b!1566178) (not b!1566165) (not b!1566163) (not b!1566242) (not d!163241) (not b!1566250) (not bm!71888) (not b_lambda!25013) (not b!1566233) (not b!1566199) (not b!1566232) (not b!1566240) (not b_lambda!25005) (not b!1566197) (not b!1566198) (not mapNonEmpty!59839) (not d!163239) b_and!51825 (not d!163215) (not b!1566179))
(check-sat b_and!51825 (not b_next!32187))
(get-model)

(declare-fun d!163243 () Bool)

(assert (=> d!163243 (= (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (and (not (= (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566237 d!163243))

(declare-fun d!163245 () Bool)

(assert (=> d!163245 (= (get!26364 (select (arr!50492 _values!487) from!782) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!22320 (select (arr!50492 _values!487) from!782)))))

(assert (=> b!1566197 d!163245))

(declare-fun d!163247 () Bool)

(assert (=> d!163247 (= (apply!1118 lt!672614 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26363 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(declare-fun bs!45068 () Bool)

(assert (= bs!45068 d!163247))

(assert (=> bs!45068 m!1441173))

(declare-fun m!1441209 () Bool)

(assert (=> bs!45068 m!1441209))

(assert (=> bs!45068 m!1441209))

(declare-fun m!1441211 () Bool)

(assert (=> bs!45068 m!1441211))

(assert (=> b!1566240 d!163247))

(declare-fun d!163249 () Bool)

(declare-fun c!144329 () Bool)

(assert (=> d!163249 (= c!144329 ((_ is ValueCellFull!18450) (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun e!873006 () V!60155)

(assert (=> d!163249 (= (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!873006)))

(declare-fun b!1566259 () Bool)

(assert (=> b!1566259 (= e!873006 (get!26364 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566260 () Bool)

(assert (=> b!1566260 (= e!873006 (get!26365 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163249 c!144329) b!1566259))

(assert (= (and d!163249 (not c!144329)) b!1566260))

(assert (=> b!1566259 m!1441161))

(assert (=> b!1566259 m!1441065))

(declare-fun m!1441213 () Bool)

(assert (=> b!1566259 m!1441213))

(assert (=> b!1566260 m!1441161))

(assert (=> b!1566260 m!1441065))

(declare-fun m!1441215 () Bool)

(assert (=> b!1566260 m!1441215))

(assert (=> b!1566240 d!163249))

(declare-fun d!163251 () Bool)

(assert (=> d!163251 (= (get!26365 (select (arr!50492 _values!487) from!782) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566198 d!163251))

(declare-fun d!163253 () Bool)

(declare-fun res!1070606 () Bool)

(declare-fun e!873011 () Bool)

(assert (=> d!163253 (=> res!1070606 e!873011)))

(assert (=> d!163253 (= res!1070606 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (= (_1!12632 (h!38071 (toList!11354 lt!672551))) (select (arr!50491 _keys!637) from!782))))))

(assert (=> d!163253 (= (containsKey!851 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)) e!873011)))

(declare-fun b!1566265 () Bool)

(declare-fun e!873012 () Bool)

(assert (=> b!1566265 (= e!873011 e!873012)))

(declare-fun res!1070607 () Bool)

(assert (=> b!1566265 (=> (not res!1070607) (not e!873012))))

(assert (=> b!1566265 (= res!1070607 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672551))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672551))) (select (arr!50491 _keys!637) from!782))) ((_ is Cons!36625) (toList!11354 lt!672551)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672551))) (select (arr!50491 _keys!637) from!782))))))

(declare-fun b!1566266 () Bool)

(assert (=> b!1566266 (= e!873012 (containsKey!851 (t!51530 (toList!11354 lt!672551)) (select (arr!50491 _keys!637) from!782)))))

(assert (= (and d!163253 (not res!1070606)) b!1566265))

(assert (= (and b!1566265 res!1070607) b!1566266))

(assert (=> b!1566266 m!1441043))

(declare-fun m!1441217 () Bool)

(assert (=> b!1566266 m!1441217))

(assert (=> d!163215 d!163253))

(declare-fun b!1566267 () Bool)

(declare-fun e!873018 () Bool)

(declare-fun e!873014 () Bool)

(assert (=> b!1566267 (= e!873018 e!873014)))

(assert (=> b!1566267 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun lt!672637 () ListLongMap!22677)

(declare-fun res!1070609 () Bool)

(assert (=> b!1566267 (= res!1070609 (contains!10345 lt!672637 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1566267 (=> (not res!1070609) (not e!873014))))

(declare-fun b!1566268 () Bool)

(declare-fun e!873015 () Bool)

(assert (=> b!1566268 (= e!873015 (isEmpty!1146 lt!672637))))

(declare-fun b!1566269 () Bool)

(declare-fun res!1070610 () Bool)

(declare-fun e!873016 () Bool)

(assert (=> b!1566269 (=> (not res!1070610) (not e!873016))))

(assert (=> b!1566269 (= res!1070610 (not (contains!10345 lt!672637 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!71889 () Bool)

(declare-fun call!71892 () ListLongMap!22677)

(assert (=> bm!71889 (= call!71892 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1566270 () Bool)

(declare-fun lt!672632 () Unit!52032)

(declare-fun lt!672634 () Unit!52032)

(assert (=> b!1566270 (= lt!672632 lt!672634)))

(declare-fun lt!672633 () (_ BitVec 64))

(declare-fun lt!672636 () ListLongMap!22677)

(declare-fun lt!672635 () V!60155)

(declare-fun lt!672638 () (_ BitVec 64))

(assert (=> b!1566270 (not (contains!10345 (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635)) lt!672638))))

(assert (=> b!1566270 (= lt!672634 (addStillNotContains!574 lt!672636 lt!672633 lt!672635 lt!672638))))

(assert (=> b!1566270 (= lt!672638 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1566270 (= lt!672635 (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1566270 (= lt!672633 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))

(assert (=> b!1566270 (= lt!672636 call!71892)))

(declare-fun e!873019 () ListLongMap!22677)

(assert (=> b!1566270 (= e!873019 (+!5084 call!71892 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1566271 () Bool)

(assert (=> b!1566271 (= e!873015 (= lt!672637 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1566272 () Bool)

(declare-fun e!873013 () Bool)

(assert (=> b!1566272 (= e!873013 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1566272 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!163255 () Bool)

(assert (=> d!163255 e!873016))

(declare-fun res!1070608 () Bool)

(assert (=> d!163255 (=> (not res!1070608) (not e!873016))))

(assert (=> d!163255 (= res!1070608 (not (contains!10345 lt!672637 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!873017 () ListLongMap!22677)

(assert (=> d!163255 (= lt!672637 e!873017)))

(declare-fun c!144331 () Bool)

(assert (=> d!163255 (= c!144331 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> d!163255 (validMask!0 mask!947)))

(assert (=> d!163255 (= (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495) lt!672637)))

(declare-fun b!1566273 () Bool)

(assert (=> b!1566273 (= e!873018 e!873015)))

(declare-fun c!144333 () Bool)

(assert (=> b!1566273 (= c!144333 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun b!1566274 () Bool)

(assert (=> b!1566274 (= e!873017 e!873019)))

(declare-fun c!144330 () Bool)

(assert (=> b!1566274 (= c!144330 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun b!1566275 () Bool)

(assert (=> b!1566275 (= e!873016 e!873018)))

(declare-fun c!144332 () Bool)

(assert (=> b!1566275 (= c!144332 e!873013)))

(declare-fun res!1070611 () Bool)

(assert (=> b!1566275 (=> (not res!1070611) (not e!873013))))

(assert (=> b!1566275 (= res!1070611 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun b!1566276 () Bool)

(assert (=> b!1566276 (= e!873019 call!71892)))

(declare-fun b!1566277 () Bool)

(assert (=> b!1566277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> b!1566277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51042 _values!487)))))

(assert (=> b!1566277 (= e!873014 (= (apply!1118 lt!672637 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566278 () Bool)

(assert (=> b!1566278 (= e!873017 (ListLongMap!22678 Nil!36626))))

(assert (= (and d!163255 c!144331) b!1566278))

(assert (= (and d!163255 (not c!144331)) b!1566274))

(assert (= (and b!1566274 c!144330) b!1566270))

(assert (= (and b!1566274 (not c!144330)) b!1566276))

(assert (= (or b!1566270 b!1566276) bm!71889))

(assert (= (and d!163255 res!1070608) b!1566269))

(assert (= (and b!1566269 res!1070610) b!1566275))

(assert (= (and b!1566275 res!1070611) b!1566272))

(assert (= (and b!1566275 c!144332) b!1566267))

(assert (= (and b!1566275 (not c!144332)) b!1566273))

(assert (= (and b!1566267 res!1070609) b!1566277))

(assert (= (and b!1566273 c!144333) b!1566271))

(assert (= (and b!1566273 (not c!144333)) b!1566268))

(declare-fun b_lambda!25015 () Bool)

(assert (=> (not b_lambda!25015) (not b!1566270)))

(assert (=> b!1566270 t!51529))

(declare-fun b_and!51827 () Bool)

(assert (= b_and!51825 (and (=> t!51529 result!26601) b_and!51827)))

(declare-fun b_lambda!25017 () Bool)

(assert (=> (not b_lambda!25017) (not b!1566277)))

(assert (=> b!1566277 t!51529))

(declare-fun b_and!51829 () Bool)

(assert (= b_and!51827 (and (=> t!51529 result!26601) b_and!51829)))

(declare-fun m!1441219 () Bool)

(assert (=> bm!71889 m!1441219))

(assert (=> b!1566270 m!1441065))

(declare-fun m!1441221 () Bool)

(assert (=> b!1566270 m!1441221))

(assert (=> b!1566270 m!1441065))

(declare-fun m!1441223 () Bool)

(assert (=> b!1566270 m!1441223))

(declare-fun m!1441225 () Bool)

(assert (=> b!1566270 m!1441225))

(declare-fun m!1441227 () Bool)

(assert (=> b!1566270 m!1441227))

(declare-fun m!1441229 () Bool)

(assert (=> b!1566270 m!1441229))

(assert (=> b!1566270 m!1441229))

(declare-fun m!1441231 () Bool)

(assert (=> b!1566270 m!1441231))

(assert (=> b!1566270 m!1441221))

(declare-fun m!1441233 () Bool)

(assert (=> b!1566270 m!1441233))

(assert (=> b!1566277 m!1441065))

(assert (=> b!1566277 m!1441233))

(declare-fun m!1441235 () Bool)

(assert (=> b!1566277 m!1441235))

(assert (=> b!1566277 m!1441221))

(assert (=> b!1566277 m!1441065))

(assert (=> b!1566277 m!1441223))

(assert (=> b!1566277 m!1441221))

(assert (=> b!1566277 m!1441233))

(declare-fun m!1441237 () Bool)

(assert (=> b!1566269 m!1441237))

(assert (=> b!1566271 m!1441219))

(assert (=> b!1566272 m!1441233))

(assert (=> b!1566272 m!1441233))

(declare-fun m!1441239 () Bool)

(assert (=> b!1566272 m!1441239))

(declare-fun m!1441241 () Bool)

(assert (=> b!1566268 m!1441241))

(assert (=> b!1566274 m!1441233))

(assert (=> b!1566274 m!1441233))

(assert (=> b!1566274 m!1441239))

(declare-fun m!1441243 () Bool)

(assert (=> d!163255 m!1441243))

(assert (=> d!163255 m!1441057))

(assert (=> b!1566267 m!1441233))

(assert (=> b!1566267 m!1441233))

(declare-fun m!1441245 () Bool)

(assert (=> b!1566267 m!1441245))

(assert (=> bm!71888 d!163255))

(declare-fun d!163257 () Bool)

(assert (=> d!163257 (= (validKeyInArray!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)) (and (not (= (select (arr!50491 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50491 _keys!637) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566192 d!163257))

(declare-fun d!163259 () Bool)

(declare-fun lt!672641 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!810 (List!36630) (InoxSet (_ BitVec 64)))

(assert (=> d!163259 (= lt!672641 (select (content!810 Nil!36627) (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!873024 () Bool)

(assert (=> d!163259 (= lt!672641 e!873024)))

(declare-fun res!1070617 () Bool)

(assert (=> d!163259 (=> (not res!1070617) (not e!873024))))

(assert (=> d!163259 (= res!1070617 ((_ is Cons!36626) Nil!36627))))

(assert (=> d!163259 (= (contains!10347 Nil!36627 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)) lt!672641)))

(declare-fun b!1566283 () Bool)

(declare-fun e!873025 () Bool)

(assert (=> b!1566283 (= e!873024 e!873025)))

(declare-fun res!1070616 () Bool)

(assert (=> b!1566283 (=> res!1070616 e!873025)))

(assert (=> b!1566283 (= res!1070616 (= (h!38072 Nil!36627) (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566284 () Bool)

(assert (=> b!1566284 (= e!873025 (contains!10347 (t!51531 Nil!36627) (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163259 res!1070617) b!1566283))

(assert (= (and b!1566283 (not res!1070616)) b!1566284))

(declare-fun m!1441247 () Bool)

(assert (=> d!163259 m!1441247))

(assert (=> d!163259 m!1441123))

(declare-fun m!1441249 () Bool)

(assert (=> d!163259 m!1441249))

(assert (=> b!1566284 m!1441123))

(declare-fun m!1441251 () Bool)

(assert (=> b!1566284 m!1441251))

(assert (=> b!1566180 d!163259))

(declare-fun d!163261 () Bool)

(declare-fun res!1070618 () Bool)

(declare-fun e!873026 () Bool)

(assert (=> d!163261 (=> res!1070618 e!873026)))

(assert (=> d!163261 (= res!1070618 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> d!163261 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947) e!873026)))

(declare-fun b!1566285 () Bool)

(declare-fun e!873028 () Bool)

(declare-fun call!71893 () Bool)

(assert (=> b!1566285 (= e!873028 call!71893)))

(declare-fun b!1566286 () Bool)

(declare-fun e!873027 () Bool)

(assert (=> b!1566286 (= e!873027 call!71893)))

(declare-fun b!1566287 () Bool)

(assert (=> b!1566287 (= e!873027 e!873028)))

(declare-fun lt!672643 () (_ BitVec 64))

(assert (=> b!1566287 (= lt!672643 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!672644 () Unit!52032)

(assert (=> b!1566287 (= lt!672644 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672643 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1566287 (arrayContainsKey!0 _keys!637 lt!672643 #b00000000000000000000000000000000)))

(declare-fun lt!672642 () Unit!52032)

(assert (=> b!1566287 (= lt!672642 lt!672644)))

(declare-fun res!1070619 () Bool)

(assert (=> b!1566287 (= res!1070619 (= (seekEntryOrOpen!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1566287 (=> (not res!1070619) (not e!873028))))

(declare-fun bm!71890 () Bool)

(assert (=> bm!71890 (= call!71893 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566288 () Bool)

(assert (=> b!1566288 (= e!873026 e!873027)))

(declare-fun c!144334 () Bool)

(assert (=> b!1566288 (= c!144334 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!163261 (not res!1070618)) b!1566288))

(assert (= (and b!1566288 c!144334) b!1566287))

(assert (= (and b!1566288 (not c!144334)) b!1566286))

(assert (= (and b!1566287 res!1070619) b!1566285))

(assert (= (or b!1566285 b!1566286) bm!71890))

(declare-fun m!1441253 () Bool)

(assert (=> b!1566287 m!1441253))

(declare-fun m!1441255 () Bool)

(assert (=> b!1566287 m!1441255))

(declare-fun m!1441257 () Bool)

(assert (=> b!1566287 m!1441257))

(assert (=> b!1566287 m!1441253))

(declare-fun m!1441259 () Bool)

(assert (=> b!1566287 m!1441259))

(declare-fun m!1441261 () Bool)

(assert (=> bm!71890 m!1441261))

(assert (=> b!1566288 m!1441253))

(assert (=> b!1566288 m!1441253))

(declare-fun m!1441263 () Bool)

(assert (=> b!1566288 m!1441263))

(assert (=> bm!71885 d!163261))

(declare-fun d!163263 () Bool)

(assert (=> d!163263 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672647 () Unit!52032)

(declare-fun choose!2076 (List!36629 (_ BitVec 64)) Unit!52032)

(assert (=> d!163263 (= lt!672647 (choose!2076 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873031 () Bool)

(assert (=> d!163263 e!873031))

(declare-fun res!1070622 () Bool)

(assert (=> d!163263 (=> (not res!1070622) (not e!873031))))

(declare-fun isStrictlySorted!986 (List!36629) Bool)

(assert (=> d!163263 (= res!1070622 (isStrictlySorted!986 (toList!11354 lt!672551)))))

(assert (=> d!163263 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672647)))

(declare-fun b!1566291 () Bool)

(assert (=> b!1566291 (= e!873031 (containsKey!851 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163263 res!1070622) b!1566291))

(assert (=> d!163263 m!1441149))

(assert (=> d!163263 m!1441149))

(assert (=> d!163263 m!1441151))

(declare-fun m!1441265 () Bool)

(assert (=> d!163263 m!1441265))

(declare-fun m!1441267 () Bool)

(assert (=> d!163263 m!1441267))

(assert (=> b!1566291 m!1441145))

(assert (=> b!1566199 d!163263))

(declare-fun d!163265 () Bool)

(declare-fun isEmpty!1147 (Option!869) Bool)

(assert (=> d!163265 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45069 () Bool)

(assert (= bs!45069 d!163265))

(assert (=> bs!45069 m!1441149))

(declare-fun m!1441269 () Bool)

(assert (=> bs!45069 m!1441269))

(assert (=> b!1566199 d!163265))

(declare-fun b!1566302 () Bool)

(declare-fun e!873037 () Option!869)

(assert (=> b!1566302 (= e!873037 (getValueByKey!793 (t!51530 (toList!11354 lt!672551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566303 () Bool)

(assert (=> b!1566303 (= e!873037 None!867)))

(declare-fun b!1566300 () Bool)

(declare-fun e!873036 () Option!869)

(assert (=> b!1566300 (= e!873036 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672551)))))))

(declare-fun b!1566301 () Bool)

(assert (=> b!1566301 (= e!873036 e!873037)))

(declare-fun c!144340 () Bool)

(assert (=> b!1566301 (= c!144340 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672551))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!163267 () Bool)

(declare-fun c!144339 () Bool)

(assert (=> d!163267 (= c!144339 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (= (_1!12632 (h!38071 (toList!11354 lt!672551))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163267 (= (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000) e!873036)))

(assert (= (and d!163267 c!144339) b!1566300))

(assert (= (and d!163267 (not c!144339)) b!1566301))

(assert (= (and b!1566301 c!144340) b!1566302))

(assert (= (and b!1566301 (not c!144340)) b!1566303))

(declare-fun m!1441271 () Bool)

(assert (=> b!1566302 m!1441271))

(assert (=> b!1566199 d!163267))

(declare-fun d!163269 () Bool)

(assert (=> d!163269 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))

(declare-fun lt!672648 () Unit!52032)

(assert (=> d!163269 (= lt!672648 (choose!2076 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))

(declare-fun e!873038 () Bool)

(assert (=> d!163269 e!873038))

(declare-fun res!1070623 () Bool)

(assert (=> d!163269 (=> (not res!1070623) (not e!873038))))

(assert (=> d!163269 (= res!1070623 (isStrictlySorted!986 (toList!11354 lt!672551)))))

(assert (=> d!163269 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)) lt!672648)))

(declare-fun b!1566304 () Bool)

(assert (=> b!1566304 (= e!873038 (containsKey!851 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))

(assert (= (and d!163269 res!1070623) b!1566304))

(assert (=> d!163269 m!1441043))

(assert (=> d!163269 m!1441119))

(assert (=> d!163269 m!1441119))

(assert (=> d!163269 m!1441121))

(assert (=> d!163269 m!1441043))

(declare-fun m!1441273 () Bool)

(assert (=> d!163269 m!1441273))

(assert (=> d!163269 m!1441267))

(assert (=> b!1566304 m!1441043))

(assert (=> b!1566304 m!1441115))

(assert (=> b!1566163 d!163269))

(declare-fun d!163271 () Bool)

(assert (=> d!163271 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782))) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))))

(declare-fun bs!45070 () Bool)

(assert (= bs!45070 d!163271))

(assert (=> bs!45070 m!1441119))

(declare-fun m!1441275 () Bool)

(assert (=> bs!45070 m!1441275))

(assert (=> b!1566163 d!163271))

(declare-fun e!873040 () Option!869)

(declare-fun b!1566307 () Bool)

(assert (=> b!1566307 (= e!873040 (getValueByKey!793 (t!51530 (toList!11354 lt!672551)) (select (arr!50491 _keys!637) from!782)))))

(declare-fun b!1566308 () Bool)

(assert (=> b!1566308 (= e!873040 None!867)))

(declare-fun b!1566305 () Bool)

(declare-fun e!873039 () Option!869)

(assert (=> b!1566305 (= e!873039 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672551)))))))

(declare-fun b!1566306 () Bool)

(assert (=> b!1566306 (= e!873039 e!873040)))

(declare-fun c!144342 () Bool)

(assert (=> b!1566306 (= c!144342 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672551))) (select (arr!50491 _keys!637) from!782)))))))

(declare-fun c!144341 () Bool)

(declare-fun d!163273 () Bool)

(assert (=> d!163273 (= c!144341 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (= (_1!12632 (h!38071 (toList!11354 lt!672551))) (select (arr!50491 _keys!637) from!782))))))

(assert (=> d!163273 (= (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)) e!873039)))

(assert (= (and d!163273 c!144341) b!1566305))

(assert (= (and d!163273 (not c!144341)) b!1566306))

(assert (= (and b!1566306 c!144342) b!1566307))

(assert (= (and b!1566306 (not c!144342)) b!1566308))

(assert (=> b!1566307 m!1441043))

(declare-fun m!1441277 () Bool)

(assert (=> b!1566307 m!1441277))

(assert (=> b!1566163 d!163273))

(declare-fun d!163275 () Bool)

(declare-fun e!873041 () Bool)

(assert (=> d!163275 e!873041))

(declare-fun res!1070625 () Bool)

(assert (=> d!163275 (=> (not res!1070625) (not e!873041))))

(declare-fun lt!672651 () ListLongMap!22677)

(assert (=> d!163275 (= res!1070625 (contains!10345 lt!672651 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!672650 () List!36629)

(assert (=> d!163275 (= lt!672651 (ListLongMap!22678 lt!672650))))

(declare-fun lt!672652 () Unit!52032)

(declare-fun lt!672649 () Unit!52032)

(assert (=> d!163275 (= lt!672652 lt!672649)))

(assert (=> d!163275 (= (getValueByKey!793 lt!672650 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163275 (= lt!672649 (lemmaContainsTupThenGetReturnValue!387 lt!672650 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163275 (= lt!672650 (insertStrictlySorted!577 (toList!11354 call!71891) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163275 (= (+!5084 call!71891 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!672651)))

(declare-fun b!1566309 () Bool)

(declare-fun res!1070624 () Bool)

(assert (=> b!1566309 (=> (not res!1070624) (not e!873041))))

(assert (=> b!1566309 (= res!1070624 (= (getValueByKey!793 (toList!11354 lt!672651) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1566310 () Bool)

(assert (=> b!1566310 (= e!873041 (contains!10348 (toList!11354 lt!672651) (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163275 res!1070625) b!1566309))

(assert (= (and b!1566309 res!1070624) b!1566310))

(declare-fun m!1441279 () Bool)

(assert (=> d!163275 m!1441279))

(declare-fun m!1441281 () Bool)

(assert (=> d!163275 m!1441281))

(declare-fun m!1441283 () Bool)

(assert (=> d!163275 m!1441283))

(declare-fun m!1441285 () Bool)

(assert (=> d!163275 m!1441285))

(declare-fun m!1441287 () Bool)

(assert (=> b!1566309 m!1441287))

(declare-fun m!1441289 () Bool)

(assert (=> b!1566310 m!1441289))

(assert (=> b!1566233 d!163275))

(declare-fun d!163277 () Bool)

(declare-fun e!873042 () Bool)

(assert (=> d!163277 e!873042))

(declare-fun res!1070627 () Bool)

(assert (=> d!163277 (=> (not res!1070627) (not e!873042))))

(declare-fun lt!672655 () ListLongMap!22677)

(assert (=> d!163277 (= res!1070627 (contains!10345 lt!672655 (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun lt!672654 () List!36629)

(assert (=> d!163277 (= lt!672655 (ListLongMap!22678 lt!672654))))

(declare-fun lt!672656 () Unit!52032)

(declare-fun lt!672653 () Unit!52032)

(assert (=> d!163277 (= lt!672656 lt!672653)))

(assert (=> d!163277 (= (getValueByKey!793 lt!672654 (_1!12632 (tuple2!25243 lt!672610 lt!672612))) (Some!868 (_2!12632 (tuple2!25243 lt!672610 lt!672612))))))

(assert (=> d!163277 (= lt!672653 (lemmaContainsTupThenGetReturnValue!387 lt!672654 (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612))))))

(assert (=> d!163277 (= lt!672654 (insertStrictlySorted!577 (toList!11354 lt!672613) (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612))))))

(assert (=> d!163277 (= (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)) lt!672655)))

(declare-fun b!1566311 () Bool)

(declare-fun res!1070626 () Bool)

(assert (=> b!1566311 (=> (not res!1070626) (not e!873042))))

(assert (=> b!1566311 (= res!1070626 (= (getValueByKey!793 (toList!11354 lt!672655) (_1!12632 (tuple2!25243 lt!672610 lt!672612))) (Some!868 (_2!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(declare-fun b!1566312 () Bool)

(assert (=> b!1566312 (= e!873042 (contains!10348 (toList!11354 lt!672655) (tuple2!25243 lt!672610 lt!672612)))))

(assert (= (and d!163277 res!1070627) b!1566311))

(assert (= (and b!1566311 res!1070626) b!1566312))

(declare-fun m!1441291 () Bool)

(assert (=> d!163277 m!1441291))

(declare-fun m!1441293 () Bool)

(assert (=> d!163277 m!1441293))

(declare-fun m!1441295 () Bool)

(assert (=> d!163277 m!1441295))

(declare-fun m!1441297 () Bool)

(assert (=> d!163277 m!1441297))

(declare-fun m!1441299 () Bool)

(assert (=> b!1566311 m!1441299))

(declare-fun m!1441301 () Bool)

(assert (=> b!1566312 m!1441301))

(assert (=> b!1566233 d!163277))

(declare-fun d!163279 () Bool)

(declare-fun e!873043 () Bool)

(assert (=> d!163279 e!873043))

(declare-fun res!1070628 () Bool)

(assert (=> d!163279 (=> res!1070628 e!873043)))

(declare-fun lt!672658 () Bool)

(assert (=> d!163279 (= res!1070628 (not lt!672658))))

(declare-fun lt!672659 () Bool)

(assert (=> d!163279 (= lt!672658 lt!672659)))

(declare-fun lt!672660 () Unit!52032)

(declare-fun e!873044 () Unit!52032)

(assert (=> d!163279 (= lt!672660 e!873044)))

(declare-fun c!144343 () Bool)

(assert (=> d!163279 (= c!144343 lt!672659)))

(assert (=> d!163279 (= lt!672659 (containsKey!851 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615))))

(assert (=> d!163279 (= (contains!10345 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)) lt!672615) lt!672658)))

(declare-fun b!1566313 () Bool)

(declare-fun lt!672657 () Unit!52032)

(assert (=> b!1566313 (= e!873044 lt!672657)))

(assert (=> b!1566313 (= lt!672657 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615))))

(assert (=> b!1566313 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615))))

(declare-fun b!1566314 () Bool)

(declare-fun Unit!52039 () Unit!52032)

(assert (=> b!1566314 (= e!873044 Unit!52039)))

(declare-fun b!1566315 () Bool)

(assert (=> b!1566315 (= e!873043 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615)))))

(assert (= (and d!163279 c!144343) b!1566313))

(assert (= (and d!163279 (not c!144343)) b!1566314))

(assert (= (and d!163279 (not res!1070628)) b!1566315))

(declare-fun m!1441303 () Bool)

(assert (=> d!163279 m!1441303))

(declare-fun m!1441305 () Bool)

(assert (=> b!1566313 m!1441305))

(declare-fun m!1441307 () Bool)

(assert (=> b!1566313 m!1441307))

(assert (=> b!1566313 m!1441307))

(declare-fun m!1441309 () Bool)

(assert (=> b!1566313 m!1441309))

(assert (=> b!1566315 m!1441307))

(assert (=> b!1566315 m!1441307))

(assert (=> b!1566315 m!1441309))

(assert (=> b!1566233 d!163279))

(assert (=> b!1566233 d!163249))

(declare-fun d!163281 () Bool)

(assert (=> d!163281 (not (contains!10345 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)) lt!672615))))

(declare-fun lt!672661 () Unit!52032)

(assert (=> d!163281 (= lt!672661 (choose!2075 lt!672613 lt!672610 lt!672612 lt!672615))))

(declare-fun e!873045 () Bool)

(assert (=> d!163281 e!873045))

(declare-fun res!1070629 () Bool)

(assert (=> d!163281 (=> (not res!1070629) (not e!873045))))

(assert (=> d!163281 (= res!1070629 (not (contains!10345 lt!672613 lt!672615)))))

(assert (=> d!163281 (= (addStillNotContains!574 lt!672613 lt!672610 lt!672612 lt!672615) lt!672661)))

(declare-fun b!1566316 () Bool)

(assert (=> b!1566316 (= e!873045 (not (= lt!672610 lt!672615)))))

(assert (= (and d!163281 res!1070629) b!1566316))

(assert (=> d!163281 m!1441169))

(assert (=> d!163281 m!1441169))

(assert (=> d!163281 m!1441171))

(declare-fun m!1441311 () Bool)

(assert (=> d!163281 m!1441311))

(declare-fun m!1441313 () Bool)

(assert (=> d!163281 m!1441313))

(assert (=> b!1566233 d!163281))

(assert (=> b!1566235 d!163243))

(assert (=> b!1566234 d!163255))

(declare-fun d!163283 () Bool)

(declare-fun e!873046 () Bool)

(assert (=> d!163283 e!873046))

(declare-fun res!1070630 () Bool)

(assert (=> d!163283 (=> res!1070630 e!873046)))

(declare-fun lt!672663 () Bool)

(assert (=> d!163283 (= res!1070630 (not lt!672663))))

(declare-fun lt!672664 () Bool)

(assert (=> d!163283 (= lt!672663 lt!672664)))

(declare-fun lt!672665 () Unit!52032)

(declare-fun e!873047 () Unit!52032)

(assert (=> d!163283 (= lt!672665 e!873047)))

(declare-fun c!144344 () Bool)

(assert (=> d!163283 (= c!144344 lt!672664)))

(assert (=> d!163283 (= lt!672664 (containsKey!851 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (=> d!163283 (= (contains!10345 lt!672630 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) lt!672663)))

(declare-fun b!1566317 () Bool)

(declare-fun lt!672662 () Unit!52032)

(assert (=> b!1566317 (= e!873047 lt!672662)))

(assert (=> b!1566317 (= lt!672662 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (=> b!1566317 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566318 () Bool)

(declare-fun Unit!52040 () Unit!52032)

(assert (=> b!1566318 (= e!873047 Unit!52040)))

(declare-fun b!1566319 () Bool)

(assert (=> b!1566319 (= e!873046 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (= (and d!163283 c!144344) b!1566317))

(assert (= (and d!163283 (not c!144344)) b!1566318))

(assert (= (and d!163283 (not res!1070630)) b!1566319))

(declare-fun m!1441315 () Bool)

(assert (=> d!163283 m!1441315))

(declare-fun m!1441317 () Bool)

(assert (=> b!1566317 m!1441317))

(assert (=> b!1566317 m!1441203))

(assert (=> b!1566317 m!1441203))

(declare-fun m!1441319 () Bool)

(assert (=> b!1566317 m!1441319))

(assert (=> b!1566319 m!1441203))

(assert (=> b!1566319 m!1441203))

(assert (=> b!1566319 m!1441319))

(assert (=> d!163241 d!163283))

(declare-fun b!1566322 () Bool)

(declare-fun e!873049 () Option!869)

(assert (=> b!1566322 (= e!873049 (getValueByKey!793 (t!51530 lt!672629) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566323 () Bool)

(assert (=> b!1566323 (= e!873049 None!867)))

(declare-fun b!1566320 () Bool)

(declare-fun e!873048 () Option!869)

(assert (=> b!1566320 (= e!873048 (Some!868 (_2!12632 (h!38071 lt!672629))))))

(declare-fun b!1566321 () Bool)

(assert (=> b!1566321 (= e!873048 e!873049)))

(declare-fun c!144346 () Bool)

(assert (=> b!1566321 (= c!144346 (and ((_ is Cons!36625) lt!672629) (not (= (_1!12632 (h!38071 lt!672629)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))))

(declare-fun d!163285 () Bool)

(declare-fun c!144345 () Bool)

(assert (=> d!163285 (= c!144345 (and ((_ is Cons!36625) lt!672629) (= (_1!12632 (h!38071 lt!672629)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163285 (= (getValueByKey!793 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) e!873048)))

(assert (= (and d!163285 c!144345) b!1566320))

(assert (= (and d!163285 (not c!144345)) b!1566321))

(assert (= (and b!1566321 c!144346) b!1566322))

(assert (= (and b!1566321 (not c!144346)) b!1566323))

(declare-fun m!1441321 () Bool)

(assert (=> b!1566322 m!1441321))

(assert (=> d!163241 d!163285))

(declare-fun d!163287 () Bool)

(assert (=> d!163287 (= (getValueByKey!793 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun lt!672668 () Unit!52032)

(declare-fun choose!2077 (List!36629 (_ BitVec 64) V!60155) Unit!52032)

(assert (=> d!163287 (= lt!672668 (choose!2077 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun e!873052 () Bool)

(assert (=> d!163287 e!873052))

(declare-fun res!1070635 () Bool)

(assert (=> d!163287 (=> (not res!1070635) (not e!873052))))

(assert (=> d!163287 (= res!1070635 (isStrictlySorted!986 lt!672629))))

(assert (=> d!163287 (= (lemmaContainsTupThenGetReturnValue!387 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) lt!672668)))

(declare-fun b!1566328 () Bool)

(declare-fun res!1070636 () Bool)

(assert (=> b!1566328 (=> (not res!1070636) (not e!873052))))

(assert (=> b!1566328 (= res!1070636 (containsKey!851 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566329 () Bool)

(assert (=> b!1566329 (= e!873052 (contains!10348 lt!672629 (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (= (and d!163287 res!1070635) b!1566328))

(assert (= (and b!1566328 res!1070636) b!1566329))

(assert (=> d!163287 m!1441197))

(declare-fun m!1441323 () Bool)

(assert (=> d!163287 m!1441323))

(declare-fun m!1441325 () Bool)

(assert (=> d!163287 m!1441325))

(declare-fun m!1441327 () Bool)

(assert (=> b!1566328 m!1441327))

(declare-fun m!1441329 () Bool)

(assert (=> b!1566329 m!1441329))

(assert (=> d!163241 d!163287))

(declare-fun e!873067 () Bool)

(declare-fun b!1566351 () Bool)

(declare-fun lt!672671 () List!36629)

(assert (=> b!1566351 (= e!873067 (contains!10348 lt!672671 (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun bm!71897 () Bool)

(declare-fun call!71900 () List!36629)

(declare-fun call!71901 () List!36629)

(assert (=> bm!71897 (= call!71900 call!71901)))

(declare-fun b!1566352 () Bool)

(declare-fun e!873065 () List!36629)

(declare-fun e!873063 () List!36629)

(assert (=> b!1566352 (= e!873065 e!873063)))

(declare-fun c!144356 () Bool)

(assert (=> b!1566352 (= c!144356 (and ((_ is Cons!36625) (toList!11354 lt!672553)) (= (_1!12632 (h!38071 (toList!11354 lt!672553))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun c!144355 () Bool)

(declare-fun e!873066 () List!36629)

(declare-fun b!1566353 () Bool)

(assert (=> b!1566353 (= e!873066 (ite c!144356 (t!51530 (toList!11354 lt!672553)) (ite c!144355 (Cons!36625 (h!38071 (toList!11354 lt!672553)) (t!51530 (toList!11354 lt!672553))) Nil!36626)))))

(declare-fun b!1566354 () Bool)

(declare-fun res!1070641 () Bool)

(assert (=> b!1566354 (=> (not res!1070641) (not e!873067))))

(assert (=> b!1566354 (= res!1070641 (containsKey!851 lt!672671 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566355 () Bool)

(assert (=> b!1566355 (= e!873066 (insertStrictlySorted!577 (t!51530 (toList!11354 lt!672553)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566356 () Bool)

(declare-fun e!873064 () List!36629)

(declare-fun call!71902 () List!36629)

(assert (=> b!1566356 (= e!873064 call!71902)))

(declare-fun c!144358 () Bool)

(declare-fun bm!71898 () Bool)

(declare-fun $colon$colon!987 (List!36629 tuple2!25242) List!36629)

(assert (=> bm!71898 (= call!71901 ($colon$colon!987 e!873066 (ite c!144358 (h!38071 (toList!11354 lt!672553)) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))))

(declare-fun c!144357 () Bool)

(assert (=> bm!71898 (= c!144357 c!144358)))

(declare-fun d!163289 () Bool)

(assert (=> d!163289 e!873067))

(declare-fun res!1070642 () Bool)

(assert (=> d!163289 (=> (not res!1070642) (not e!873067))))

(assert (=> d!163289 (= res!1070642 (isStrictlySorted!986 lt!672671))))

(assert (=> d!163289 (= lt!672671 e!873065)))

(assert (=> d!163289 (= c!144358 (and ((_ is Cons!36625) (toList!11354 lt!672553)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672553))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163289 (isStrictlySorted!986 (toList!11354 lt!672553))))

(assert (=> d!163289 (= (insertStrictlySorted!577 (toList!11354 lt!672553) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) lt!672671)))

(declare-fun b!1566350 () Bool)

(assert (=> b!1566350 (= e!873065 call!71901)))

(declare-fun b!1566357 () Bool)

(assert (=> b!1566357 (= c!144355 (and ((_ is Cons!36625) (toList!11354 lt!672553)) (bvsgt (_1!12632 (h!38071 (toList!11354 lt!672553))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> b!1566357 (= e!873063 e!873064)))

(declare-fun b!1566358 () Bool)

(assert (=> b!1566358 (= e!873064 call!71902)))

(declare-fun bm!71899 () Bool)

(assert (=> bm!71899 (= call!71902 call!71900)))

(declare-fun b!1566359 () Bool)

(assert (=> b!1566359 (= e!873063 call!71900)))

(assert (= (and d!163289 c!144358) b!1566350))

(assert (= (and d!163289 (not c!144358)) b!1566352))

(assert (= (and b!1566352 c!144356) b!1566359))

(assert (= (and b!1566352 (not c!144356)) b!1566357))

(assert (= (and b!1566357 c!144355) b!1566358))

(assert (= (and b!1566357 (not c!144355)) b!1566356))

(assert (= (or b!1566358 b!1566356) bm!71899))

(assert (= (or b!1566359 bm!71899) bm!71897))

(assert (= (or b!1566350 bm!71897) bm!71898))

(assert (= (and bm!71898 c!144357) b!1566355))

(assert (= (and bm!71898 (not c!144357)) b!1566353))

(assert (= (and d!163289 res!1070642) b!1566354))

(assert (= (and b!1566354 res!1070641) b!1566351))

(declare-fun m!1441331 () Bool)

(assert (=> b!1566351 m!1441331))

(declare-fun m!1441333 () Bool)

(assert (=> b!1566354 m!1441333))

(declare-fun m!1441335 () Bool)

(assert (=> bm!71898 m!1441335))

(declare-fun m!1441337 () Bool)

(assert (=> d!163289 m!1441337))

(declare-fun m!1441339 () Bool)

(assert (=> d!163289 m!1441339))

(declare-fun m!1441341 () Bool)

(assert (=> b!1566355 m!1441341))

(assert (=> d!163241 d!163289))

(declare-fun d!163291 () Bool)

(declare-fun res!1070643 () Bool)

(declare-fun e!873068 () Bool)

(assert (=> d!163291 (=> res!1070643 e!873068)))

(assert (=> d!163291 (= res!1070643 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (= (_1!12632 (h!38071 (toList!11354 lt!672551))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163291 (= (containsKey!851 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000) e!873068)))

(declare-fun b!1566360 () Bool)

(declare-fun e!873069 () Bool)

(assert (=> b!1566360 (= e!873068 e!873069)))

(declare-fun res!1070644 () Bool)

(assert (=> b!1566360 (=> (not res!1070644) (not e!873069))))

(assert (=> b!1566360 (= res!1070644 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672551))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672551))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (toList!11354 lt!672551)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672551))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566361 () Bool)

(assert (=> b!1566361 (= e!873069 (containsKey!851 (t!51530 (toList!11354 lt!672551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163291 (not res!1070643)) b!1566360))

(assert (= (and b!1566360 res!1070644) b!1566361))

(declare-fun m!1441343 () Bool)

(assert (=> b!1566361 m!1441343))

(assert (=> d!163239 d!163291))

(assert (=> b!1566201 d!163265))

(assert (=> b!1566201 d!163267))

(assert (=> b!1566165 d!163271))

(assert (=> b!1566165 d!163273))

(declare-fun d!163293 () Bool)

(assert (=> d!163293 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45071 () Bool)

(assert (= bs!45071 d!163293))

(assert (=> bs!45071 m!1441191))

(declare-fun m!1441345 () Bool)

(assert (=> bs!45071 m!1441345))

(assert (=> b!1566244 d!163293))

(declare-fun b!1566364 () Bool)

(declare-fun e!873071 () Option!869)

(assert (=> b!1566364 (= e!873071 (getValueByKey!793 (t!51530 (toList!11354 lt!672551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566365 () Bool)

(assert (=> b!1566365 (= e!873071 None!867)))

(declare-fun b!1566362 () Bool)

(declare-fun e!873070 () Option!869)

(assert (=> b!1566362 (= e!873070 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672551)))))))

(declare-fun b!1566363 () Bool)

(assert (=> b!1566363 (= e!873070 e!873071)))

(declare-fun c!144360 () Bool)

(assert (=> b!1566363 (= c!144360 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672551))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!163295 () Bool)

(declare-fun c!144359 () Bool)

(assert (=> d!163295 (= c!144359 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (= (_1!12632 (h!38071 (toList!11354 lt!672551))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163295 (= (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000) e!873070)))

(assert (= (and d!163295 c!144359) b!1566362))

(assert (= (and d!163295 (not c!144359)) b!1566363))

(assert (= (and b!1566363 c!144360) b!1566364))

(assert (= (and b!1566363 (not c!144360)) b!1566365))

(declare-fun m!1441347 () Bool)

(assert (=> b!1566364 m!1441347))

(assert (=> b!1566244 d!163295))

(assert (=> b!1566178 d!163257))

(assert (=> b!1566179 d!163257))

(declare-fun d!163297 () Bool)

(declare-fun e!873072 () Bool)

(assert (=> d!163297 e!873072))

(declare-fun res!1070645 () Bool)

(assert (=> d!163297 (=> res!1070645 e!873072)))

(declare-fun lt!672673 () Bool)

(assert (=> d!163297 (= res!1070645 (not lt!672673))))

(declare-fun lt!672674 () Bool)

(assert (=> d!163297 (= lt!672673 lt!672674)))

(declare-fun lt!672675 () Unit!52032)

(declare-fun e!873073 () Unit!52032)

(assert (=> d!163297 (= lt!672675 e!873073)))

(declare-fun c!144361 () Bool)

(assert (=> d!163297 (= c!144361 lt!672674)))

(assert (=> d!163297 (= lt!672674 (containsKey!851 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163297 (= (contains!10345 lt!672614 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672673)))

(declare-fun b!1566366 () Bool)

(declare-fun lt!672672 () Unit!52032)

(assert (=> b!1566366 (= e!873073 lt!672672)))

(assert (=> b!1566366 (= lt!672672 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566366 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566367 () Bool)

(declare-fun Unit!52041 () Unit!52032)

(assert (=> b!1566367 (= e!873073 Unit!52041)))

(declare-fun b!1566368 () Bool)

(assert (=> b!1566368 (= e!873072 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163297 c!144361) b!1566366))

(assert (= (and d!163297 (not c!144361)) b!1566367))

(assert (= (and d!163297 (not res!1070645)) b!1566368))

(declare-fun m!1441349 () Bool)

(assert (=> d!163297 m!1441349))

(declare-fun m!1441351 () Bool)

(assert (=> b!1566366 m!1441351))

(declare-fun m!1441353 () Bool)

(assert (=> b!1566366 m!1441353))

(assert (=> b!1566366 m!1441353))

(declare-fun m!1441355 () Bool)

(assert (=> b!1566366 m!1441355))

(assert (=> b!1566368 m!1441353))

(assert (=> b!1566368 m!1441353))

(assert (=> b!1566368 m!1441355))

(assert (=> d!163237 d!163297))

(assert (=> d!163237 d!163225))

(declare-fun d!163299 () Bool)

(declare-fun e!873074 () Bool)

(assert (=> d!163299 e!873074))

(declare-fun res!1070646 () Bool)

(assert (=> d!163299 (=> res!1070646 e!873074)))

(declare-fun lt!672677 () Bool)

(assert (=> d!163299 (= res!1070646 (not lt!672677))))

(declare-fun lt!672678 () Bool)

(assert (=> d!163299 (= lt!672677 lt!672678)))

(declare-fun lt!672679 () Unit!52032)

(declare-fun e!873075 () Unit!52032)

(assert (=> d!163299 (= lt!672679 e!873075)))

(declare-fun c!144362 () Bool)

(assert (=> d!163299 (= c!144362 lt!672678)))

(assert (=> d!163299 (= lt!672678 (containsKey!851 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> d!163299 (= (contains!10345 lt!672614 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) lt!672677)))

(declare-fun b!1566369 () Bool)

(declare-fun lt!672676 () Unit!52032)

(assert (=> b!1566369 (= e!873075 lt!672676)))

(assert (=> b!1566369 (= lt!672676 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1566369 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1566370 () Bool)

(declare-fun Unit!52042 () Unit!52032)

(assert (=> b!1566370 (= e!873075 Unit!52042)))

(declare-fun b!1566371 () Bool)

(assert (=> b!1566371 (= e!873074 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (= (and d!163299 c!144362) b!1566369))

(assert (= (and d!163299 (not c!144362)) b!1566370))

(assert (= (and d!163299 (not res!1070646)) b!1566371))

(assert (=> d!163299 m!1441173))

(declare-fun m!1441357 () Bool)

(assert (=> d!163299 m!1441357))

(assert (=> b!1566369 m!1441173))

(declare-fun m!1441359 () Bool)

(assert (=> b!1566369 m!1441359))

(assert (=> b!1566369 m!1441173))

(assert (=> b!1566369 m!1441209))

(assert (=> b!1566369 m!1441209))

(declare-fun m!1441361 () Bool)

(assert (=> b!1566369 m!1441361))

(assert (=> b!1566371 m!1441173))

(assert (=> b!1566371 m!1441209))

(assert (=> b!1566371 m!1441209))

(assert (=> b!1566371 m!1441361))

(assert (=> b!1566230 d!163299))

(declare-fun d!163301 () Bool)

(declare-fun e!873076 () Bool)

(assert (=> d!163301 e!873076))

(declare-fun res!1070647 () Bool)

(assert (=> d!163301 (=> res!1070647 e!873076)))

(declare-fun lt!672681 () Bool)

(assert (=> d!163301 (= res!1070647 (not lt!672681))))

(declare-fun lt!672682 () Bool)

(assert (=> d!163301 (= lt!672681 lt!672682)))

(declare-fun lt!672683 () Unit!52032)

(declare-fun e!873077 () Unit!52032)

(assert (=> d!163301 (= lt!672683 e!873077)))

(declare-fun c!144363 () Bool)

(assert (=> d!163301 (= c!144363 lt!672682)))

(assert (=> d!163301 (= lt!672682 (containsKey!851 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163301 (= (contains!10345 lt!672614 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672681)))

(declare-fun b!1566372 () Bool)

(declare-fun lt!672680 () Unit!52032)

(assert (=> b!1566372 (= e!873077 lt!672680)))

(assert (=> b!1566372 (= lt!672680 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566372 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566373 () Bool)

(declare-fun Unit!52043 () Unit!52032)

(assert (=> b!1566373 (= e!873077 Unit!52043)))

(declare-fun b!1566374 () Bool)

(assert (=> b!1566374 (= e!873076 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163301 c!144363) b!1566372))

(assert (= (and d!163301 (not c!144363)) b!1566373))

(assert (= (and d!163301 (not res!1070647)) b!1566374))

(declare-fun m!1441363 () Bool)

(assert (=> d!163301 m!1441363))

(declare-fun m!1441365 () Bool)

(assert (=> b!1566372 m!1441365))

(declare-fun m!1441367 () Bool)

(assert (=> b!1566372 m!1441367))

(assert (=> b!1566372 m!1441367))

(declare-fun m!1441369 () Bool)

(assert (=> b!1566372 m!1441369))

(assert (=> b!1566374 m!1441367))

(assert (=> b!1566374 m!1441367))

(assert (=> b!1566374 m!1441369))

(assert (=> b!1566232 d!163301))

(declare-fun d!163303 () Bool)

(declare-fun isEmpty!1148 (List!36629) Bool)

(assert (=> d!163303 (= (isEmpty!1146 lt!672614) (isEmpty!1148 (toList!11354 lt!672614)))))

(declare-fun bs!45072 () Bool)

(assert (= bs!45072 d!163303))

(declare-fun m!1441371 () Bool)

(assert (=> bs!45072 m!1441371))

(assert (=> b!1566231 d!163303))

(declare-fun b!1566375 () Bool)

(declare-fun e!873081 () Bool)

(declare-fun call!71903 () Bool)

(assert (=> b!1566375 (= e!873081 call!71903)))

(declare-fun b!1566376 () Bool)

(assert (=> b!1566376 (= e!873081 call!71903)))

(declare-fun b!1566377 () Bool)

(declare-fun e!873079 () Bool)

(declare-fun e!873080 () Bool)

(assert (=> b!1566377 (= e!873079 e!873080)))

(declare-fun res!1070650 () Bool)

(assert (=> b!1566377 (=> (not res!1070650) (not e!873080))))

(declare-fun e!873078 () Bool)

(assert (=> b!1566377 (= res!1070650 (not e!873078))))

(declare-fun res!1070649 () Bool)

(assert (=> b!1566377 (=> (not res!1070649) (not e!873078))))

(assert (=> b!1566377 (= res!1070649 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1566378 () Bool)

(assert (=> b!1566378 (= e!873080 e!873081)))

(declare-fun c!144364 () Bool)

(assert (=> b!1566378 (= c!144364 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!71900 () Bool)

(assert (=> bm!71900 (= call!71903 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144364 (Cons!36626 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627))))))

(declare-fun d!163305 () Bool)

(declare-fun res!1070648 () Bool)

(assert (=> d!163305 (=> res!1070648 e!873079)))

(assert (=> d!163305 (= res!1070648 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> d!163305 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) e!873079)))

(declare-fun b!1566379 () Bool)

(assert (=> b!1566379 (= e!873078 (contains!10347 (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!163305 (not res!1070648)) b!1566377))

(assert (= (and b!1566377 res!1070649) b!1566379))

(assert (= (and b!1566377 res!1070650) b!1566378))

(assert (= (and b!1566378 c!144364) b!1566375))

(assert (= (and b!1566378 (not c!144364)) b!1566376))

(assert (= (or b!1566375 b!1566376) bm!71900))

(assert (=> b!1566377 m!1441253))

(assert (=> b!1566377 m!1441253))

(assert (=> b!1566377 m!1441263))

(assert (=> b!1566378 m!1441253))

(assert (=> b!1566378 m!1441253))

(assert (=> b!1566378 m!1441263))

(assert (=> bm!71900 m!1441253))

(declare-fun m!1441373 () Bool)

(assert (=> bm!71900 m!1441373))

(assert (=> b!1566379 m!1441253))

(assert (=> b!1566379 m!1441253))

(declare-fun m!1441375 () Bool)

(assert (=> b!1566379 m!1441375))

(assert (=> bm!71882 d!163305))

(declare-fun d!163307 () Bool)

(assert (=> d!163307 (arrayContainsKey!0 _keys!637 lt!672586 #b00000000000000000000000000000000)))

(declare-fun lt!672686 () Unit!52032)

(declare-fun choose!13 (array!104608 (_ BitVec 64) (_ BitVec 32)) Unit!52032)

(assert (=> d!163307 (= lt!672686 (choose!13 _keys!637 lt!672586 #b00000000000000000000000000000000))))

(assert (=> d!163307 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!163307 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672586 #b00000000000000000000000000000000) lt!672686)))

(declare-fun bs!45073 () Bool)

(assert (= bs!45073 d!163307))

(assert (=> bs!45073 m!1441133))

(declare-fun m!1441377 () Bool)

(assert (=> bs!45073 m!1441377))

(assert (=> b!1566191 d!163307))

(declare-fun d!163309 () Bool)

(declare-fun res!1070655 () Bool)

(declare-fun e!873086 () Bool)

(assert (=> d!163309 (=> res!1070655 e!873086)))

(assert (=> d!163309 (= res!1070655 (= (select (arr!50491 _keys!637) #b00000000000000000000000000000000) lt!672586))))

(assert (=> d!163309 (= (arrayContainsKey!0 _keys!637 lt!672586 #b00000000000000000000000000000000) e!873086)))

(declare-fun b!1566384 () Bool)

(declare-fun e!873087 () Bool)

(assert (=> b!1566384 (= e!873086 e!873087)))

(declare-fun res!1070656 () Bool)

(assert (=> b!1566384 (=> (not res!1070656) (not e!873087))))

(assert (=> b!1566384 (= res!1070656 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun b!1566385 () Bool)

(assert (=> b!1566385 (= e!873087 (arrayContainsKey!0 _keys!637 lt!672586 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!163309 (not res!1070655)) b!1566384))

(assert (= (and b!1566384 res!1070656) b!1566385))

(assert (=> d!163309 m!1441123))

(declare-fun m!1441379 () Bool)

(assert (=> b!1566385 m!1441379))

(assert (=> b!1566191 d!163309))

(declare-fun b!1566398 () Bool)

(declare-fun e!873094 () SeekEntryResult!13526)

(assert (=> b!1566398 (= e!873094 Undefined!13526)))

(declare-fun b!1566399 () Bool)

(declare-fun e!873096 () SeekEntryResult!13526)

(declare-fun lt!672693 () SeekEntryResult!13526)

(assert (=> b!1566399 (= e!873096 (Found!13526 (index!56504 lt!672693)))))

(declare-fun b!1566400 () Bool)

(declare-fun c!144373 () Bool)

(declare-fun lt!672694 () (_ BitVec 64))

(assert (=> b!1566400 (= c!144373 (= lt!672694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873095 () SeekEntryResult!13526)

(assert (=> b!1566400 (= e!873096 e!873095)))

(declare-fun b!1566401 () Bool)

(assert (=> b!1566401 (= e!873095 (MissingZero!13526 (index!56504 lt!672693)))))

(declare-fun d!163311 () Bool)

(declare-fun lt!672695 () SeekEntryResult!13526)

(assert (=> d!163311 (and (or ((_ is Undefined!13526) lt!672695) (not ((_ is Found!13526) lt!672695)) (and (bvsge (index!56503 lt!672695) #b00000000000000000000000000000000) (bvslt (index!56503 lt!672695) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672695) ((_ is Found!13526) lt!672695) (not ((_ is MissingZero!13526) lt!672695)) (and (bvsge (index!56502 lt!672695) #b00000000000000000000000000000000) (bvslt (index!56502 lt!672695) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672695) ((_ is Found!13526) lt!672695) ((_ is MissingZero!13526) lt!672695) (not ((_ is MissingVacant!13526) lt!672695)) (and (bvsge (index!56505 lt!672695) #b00000000000000000000000000000000) (bvslt (index!56505 lt!672695) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672695) (ite ((_ is Found!13526) lt!672695) (= (select (arr!50491 _keys!637) (index!56503 lt!672695)) (select (arr!50491 _keys!637) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13526) lt!672695) (= (select (arr!50491 _keys!637) (index!56502 lt!672695)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13526) lt!672695) (= (select (arr!50491 _keys!637) (index!56505 lt!672695)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163311 (= lt!672695 e!873094)))

(declare-fun c!144372 () Bool)

(assert (=> d!163311 (= c!144372 (and ((_ is Intermediate!13526) lt!672693) (undefined!14338 lt!672693)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104608 (_ BitVec 32)) SeekEntryResult!13526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!163311 (= lt!672693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (=> d!163311 (validMask!0 mask!947)))

(assert (=> d!163311 (= (seekEntryOrOpen!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672695)))

(declare-fun b!1566402 () Bool)

(assert (=> b!1566402 (= e!873094 e!873096)))

(assert (=> b!1566402 (= lt!672694 (select (arr!50491 _keys!637) (index!56504 lt!672693)))))

(declare-fun c!144371 () Bool)

(assert (=> b!1566402 (= c!144371 (= lt!672694 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566403 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104608 (_ BitVec 32)) SeekEntryResult!13526)

(assert (=> b!1566403 (= e!873095 (seekKeyOrZeroReturnVacant!0 (x!140749 lt!672693) (index!56504 lt!672693) (index!56504 lt!672693) (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (= (and d!163311 c!144372) b!1566398))

(assert (= (and d!163311 (not c!144372)) b!1566402))

(assert (= (and b!1566402 c!144371) b!1566399))

(assert (= (and b!1566402 (not c!144371)) b!1566400))

(assert (= (and b!1566400 c!144373) b!1566401))

(assert (= (and b!1566400 (not c!144373)) b!1566403))

(declare-fun m!1441381 () Bool)

(assert (=> d!163311 m!1441381))

(declare-fun m!1441383 () Bool)

(assert (=> d!163311 m!1441383))

(declare-fun m!1441385 () Bool)

(assert (=> d!163311 m!1441385))

(assert (=> d!163311 m!1441123))

(declare-fun m!1441387 () Bool)

(assert (=> d!163311 m!1441387))

(assert (=> d!163311 m!1441387))

(assert (=> d!163311 m!1441123))

(declare-fun m!1441389 () Bool)

(assert (=> d!163311 m!1441389))

(assert (=> d!163311 m!1441057))

(declare-fun m!1441391 () Bool)

(assert (=> b!1566402 m!1441391))

(assert (=> b!1566403 m!1441123))

(declare-fun m!1441393 () Bool)

(assert (=> b!1566403 m!1441393))

(assert (=> b!1566191 d!163311))

(declare-fun d!163313 () Bool)

(assert (=> d!163313 (= (get!26363 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782))) (v!22322 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782))))))

(assert (=> d!163223 d!163313))

(assert (=> d!163223 d!163273))

(declare-fun d!163315 () Bool)

(declare-fun e!873097 () Bool)

(assert (=> d!163315 e!873097))

(declare-fun res!1070657 () Bool)

(assert (=> d!163315 (=> res!1070657 e!873097)))

(declare-fun lt!672697 () Bool)

(assert (=> d!163315 (= res!1070657 (not lt!672697))))

(declare-fun lt!672698 () Bool)

(assert (=> d!163315 (= lt!672697 lt!672698)))

(declare-fun lt!672699 () Unit!52032)

(declare-fun e!873098 () Unit!52032)

(assert (=> d!163315 (= lt!672699 e!873098)))

(declare-fun c!144374 () Bool)

(assert (=> d!163315 (= c!144374 lt!672698)))

(assert (=> d!163315 (= lt!672698 (containsKey!851 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163315 (= (contains!10345 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672697)))

(declare-fun b!1566404 () Bool)

(declare-fun lt!672696 () Unit!52032)

(assert (=> b!1566404 (= e!873098 lt!672696)))

(assert (=> b!1566404 (= lt!672696 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566404 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566405 () Bool)

(declare-fun Unit!52044 () Unit!52032)

(assert (=> b!1566405 (= e!873098 Unit!52044)))

(declare-fun b!1566406 () Bool)

(assert (=> b!1566406 (= e!873097 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163315 c!144374) b!1566404))

(assert (= (and d!163315 (not c!144374)) b!1566405))

(assert (= (and d!163315 (not res!1070657)) b!1566406))

(declare-fun m!1441395 () Bool)

(assert (=> d!163315 m!1441395))

(declare-fun m!1441397 () Bool)

(assert (=> b!1566404 m!1441397))

(declare-fun m!1441399 () Bool)

(assert (=> b!1566404 m!1441399))

(assert (=> b!1566404 m!1441399))

(declare-fun m!1441401 () Bool)

(assert (=> b!1566404 m!1441401))

(assert (=> b!1566406 m!1441399))

(assert (=> b!1566406 m!1441399))

(assert (=> b!1566406 m!1441401))

(assert (=> d!163235 d!163315))

(assert (=> d!163235 d!163241))

(declare-fun d!163317 () Bool)

(assert (=> d!163317 (not (contains!10345 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163317 true))

(declare-fun _$36!388 () Unit!52032)

(assert (=> d!163317 (= (choose!2075 lt!672553 (select (arr!50491 _keys!637) from!782) lt!672554 #b0000000000000000000000000000000000000000000000000000000000000000) _$36!388)))

(declare-fun bs!45074 () Bool)

(assert (= bs!45074 d!163317))

(assert (=> bs!45074 m!1441073))

(assert (=> bs!45074 m!1441073))

(assert (=> bs!45074 m!1441153))

(assert (=> d!163235 d!163317))

(declare-fun d!163319 () Bool)

(declare-fun e!873099 () Bool)

(assert (=> d!163319 e!873099))

(declare-fun res!1070658 () Bool)

(assert (=> d!163319 (=> res!1070658 e!873099)))

(declare-fun lt!672701 () Bool)

(assert (=> d!163319 (= res!1070658 (not lt!672701))))

(declare-fun lt!672702 () Bool)

(assert (=> d!163319 (= lt!672701 lt!672702)))

(declare-fun lt!672703 () Unit!52032)

(declare-fun e!873100 () Unit!52032)

(assert (=> d!163319 (= lt!672703 e!873100)))

(declare-fun c!144375 () Bool)

(assert (=> d!163319 (= c!144375 lt!672702)))

(assert (=> d!163319 (= lt!672702 (containsKey!851 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163319 (= (contains!10345 lt!672553 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672701)))

(declare-fun b!1566408 () Bool)

(declare-fun lt!672700 () Unit!52032)

(assert (=> b!1566408 (= e!873100 lt!672700)))

(assert (=> b!1566408 (= lt!672700 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566408 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566409 () Bool)

(declare-fun Unit!52045 () Unit!52032)

(assert (=> b!1566409 (= e!873100 Unit!52045)))

(declare-fun b!1566410 () Bool)

(assert (=> b!1566410 (= e!873099 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163319 c!144375) b!1566408))

(assert (= (and d!163319 (not c!144375)) b!1566409))

(assert (= (and d!163319 (not res!1070658)) b!1566410))

(declare-fun m!1441403 () Bool)

(assert (=> d!163319 m!1441403))

(declare-fun m!1441405 () Bool)

(assert (=> b!1566408 m!1441405))

(declare-fun m!1441407 () Bool)

(assert (=> b!1566408 m!1441407))

(assert (=> b!1566408 m!1441407))

(declare-fun m!1441409 () Bool)

(assert (=> b!1566408 m!1441409))

(assert (=> b!1566410 m!1441407))

(assert (=> b!1566410 m!1441407))

(assert (=> b!1566410 m!1441409))

(assert (=> d!163235 d!163319))

(declare-fun d!163321 () Bool)

(assert (=> d!163321 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672704 () Unit!52032)

(assert (=> d!163321 (= lt!672704 (choose!2076 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873101 () Bool)

(assert (=> d!163321 e!873101))

(declare-fun res!1070659 () Bool)

(assert (=> d!163321 (=> (not res!1070659) (not e!873101))))

(assert (=> d!163321 (= res!1070659 (isStrictlySorted!986 (toList!11354 lt!672551)))))

(assert (=> d!163321 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000) lt!672704)))

(declare-fun b!1566411 () Bool)

(assert (=> b!1566411 (= e!873101 (containsKey!851 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163321 res!1070659) b!1566411))

(assert (=> d!163321 m!1441191))

(assert (=> d!163321 m!1441191))

(assert (=> d!163321 m!1441193))

(declare-fun m!1441411 () Bool)

(assert (=> d!163321 m!1441411))

(assert (=> d!163321 m!1441267))

(assert (=> b!1566411 m!1441187))

(assert (=> b!1566242 d!163321))

(assert (=> b!1566242 d!163293))

(assert (=> b!1566242 d!163295))

(declare-fun d!163323 () Bool)

(declare-fun res!1070660 () Bool)

(declare-fun e!873102 () Bool)

(assert (=> d!163323 (=> res!1070660 e!873102)))

(assert (=> d!163323 (= res!1070660 (and ((_ is Cons!36625) (toList!11354 lt!672551)) (= (_1!12632 (h!38071 (toList!11354 lt!672551))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163323 (= (containsKey!851 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000) e!873102)))

(declare-fun b!1566412 () Bool)

(declare-fun e!873103 () Bool)

(assert (=> b!1566412 (= e!873102 e!873103)))

(declare-fun res!1070661 () Bool)

(assert (=> b!1566412 (=> (not res!1070661) (not e!873103))))

(assert (=> b!1566412 (= res!1070661 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672551))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672551))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (toList!11354 lt!672551)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672551))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566413 () Bool)

(assert (=> b!1566413 (= e!873103 (containsKey!851 (t!51530 (toList!11354 lt!672551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163323 (not res!1070660)) b!1566412))

(assert (= (and b!1566412 res!1070661) b!1566413))

(declare-fun m!1441413 () Bool)

(assert (=> b!1566413 m!1441413))

(assert (=> d!163233 d!163323))

(declare-fun lt!672707 () Bool)

(declare-fun d!163325 () Bool)

(declare-fun content!811 (List!36629) (InoxSet tuple2!25242))

(assert (=> d!163325 (= lt!672707 (select (content!811 (toList!11354 lt!672630)) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(declare-fun e!873109 () Bool)

(assert (=> d!163325 (= lt!672707 e!873109)))

(declare-fun res!1070666 () Bool)

(assert (=> d!163325 (=> (not res!1070666) (not e!873109))))

(assert (=> d!163325 (= res!1070666 ((_ is Cons!36625) (toList!11354 lt!672630)))))

(assert (=> d!163325 (= (contains!10348 (toList!11354 lt!672630) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) lt!672707)))

(declare-fun b!1566418 () Bool)

(declare-fun e!873108 () Bool)

(assert (=> b!1566418 (= e!873109 e!873108)))

(declare-fun res!1070667 () Bool)

(assert (=> b!1566418 (=> res!1070667 e!873108)))

(assert (=> b!1566418 (= res!1070667 (= (h!38071 (toList!11354 lt!672630)) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(declare-fun b!1566419 () Bool)

(assert (=> b!1566419 (= e!873108 (contains!10348 (t!51530 (toList!11354 lt!672630)) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(assert (= (and d!163325 res!1070666) b!1566418))

(assert (= (and b!1566418 (not res!1070667)) b!1566419))

(declare-fun m!1441415 () Bool)

(assert (=> d!163325 m!1441415))

(declare-fun m!1441417 () Bool)

(assert (=> d!163325 m!1441417))

(declare-fun m!1441419 () Bool)

(assert (=> b!1566419 m!1441419))

(assert (=> b!1566250 d!163325))

(declare-fun e!873111 () Option!869)

(declare-fun b!1566422 () Bool)

(assert (=> b!1566422 (= e!873111 (getValueByKey!793 (t!51530 (toList!11354 lt!672630)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566423 () Bool)

(assert (=> b!1566423 (= e!873111 None!867)))

(declare-fun b!1566420 () Bool)

(declare-fun e!873110 () Option!869)

(assert (=> b!1566420 (= e!873110 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672630)))))))

(declare-fun b!1566421 () Bool)

(assert (=> b!1566421 (= e!873110 e!873111)))

(declare-fun c!144377 () Bool)

(assert (=> b!1566421 (= c!144377 (and ((_ is Cons!36625) (toList!11354 lt!672630)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672630))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))))

(declare-fun c!144376 () Bool)

(declare-fun d!163327 () Bool)

(assert (=> d!163327 (= c!144376 (and ((_ is Cons!36625) (toList!11354 lt!672630)) (= (_1!12632 (h!38071 (toList!11354 lt!672630))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163327 (= (getValueByKey!793 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) e!873110)))

(assert (= (and d!163327 c!144376) b!1566420))

(assert (= (and d!163327 (not c!144376)) b!1566421))

(assert (= (and b!1566421 c!144377) b!1566422))

(assert (= (and b!1566421 (not c!144377)) b!1566423))

(declare-fun m!1441421 () Bool)

(assert (=> b!1566422 m!1441421))

(assert (=> b!1566249 d!163327))

(declare-fun condMapEmpty!59840 () Bool)

(declare-fun mapDefault!59840 () ValueCell!18450)

(assert (=> mapNonEmpty!59839 (= condMapEmpty!59840 (= mapRest!59839 ((as const (Array (_ BitVec 32) ValueCell!18450)) mapDefault!59840)))))

(declare-fun e!873113 () Bool)

(declare-fun mapRes!59840 () Bool)

(assert (=> mapNonEmpty!59839 (= tp!113872 (and e!873113 mapRes!59840))))

(declare-fun b!1566425 () Bool)

(assert (=> b!1566425 (= e!873113 tp_is_empty!38961)))

(declare-fun mapIsEmpty!59840 () Bool)

(assert (=> mapIsEmpty!59840 mapRes!59840))

(declare-fun mapNonEmpty!59840 () Bool)

(declare-fun tp!113873 () Bool)

(declare-fun e!873112 () Bool)

(assert (=> mapNonEmpty!59840 (= mapRes!59840 (and tp!113873 e!873112))))

(declare-fun mapKey!59840 () (_ BitVec 32))

(declare-fun mapValue!59840 () ValueCell!18450)

(declare-fun mapRest!59840 () (Array (_ BitVec 32) ValueCell!18450))

(assert (=> mapNonEmpty!59840 (= mapRest!59839 (store mapRest!59840 mapKey!59840 mapValue!59840))))

(declare-fun b!1566424 () Bool)

(assert (=> b!1566424 (= e!873112 tp_is_empty!38961)))

(assert (= (and mapNonEmpty!59839 condMapEmpty!59840) mapIsEmpty!59840))

(assert (= (and mapNonEmpty!59839 (not condMapEmpty!59840)) mapNonEmpty!59840))

(assert (= (and mapNonEmpty!59840 ((_ is ValueCellFull!18450) mapValue!59840)) b!1566424))

(assert (= (and mapNonEmpty!59839 ((_ is ValueCellFull!18450) mapDefault!59840)) b!1566425))

(declare-fun m!1441423 () Bool)

(assert (=> mapNonEmpty!59840 m!1441423))

(declare-fun b_lambda!25019 () Bool)

(assert (= b_lambda!25015 (or (and start!133964 b_free!32187) b_lambda!25019)))

(declare-fun b_lambda!25021 () Bool)

(assert (= b_lambda!25017 (or (and start!133964 b_free!32187) b_lambda!25021)))

(check-sat (not b_lambda!25011) (not d!163325) (not b!1566319) (not b!1566312) (not bm!71898) (not b!1566379) (not d!163269) (not d!163315) (not b!1566309) (not b!1566377) (not b!1566385) (not d!163283) (not d!163281) (not b!1566271) (not d!163263) (not b!1566266) (not b!1566411) (not b!1566277) (not d!163287) (not bm!71890) (not d!163319) (not b!1566364) (not b_lambda!25019) (not b!1566329) (not b!1566310) (not b!1566403) (not b!1566361) (not b!1566284) (not b!1566287) (not b!1566419) (not b!1566267) (not b!1566366) (not d!163247) (not d!163307) (not b!1566372) (not b!1566406) (not b!1566302) (not b!1566270) (not b_next!32187) (not b!1566369) (not d!163299) (not b!1566272) (not bm!71889) (not d!163311) (not b!1566410) (not b!1566351) (not b_lambda!25021) (not b!1566304) (not b!1566317) (not d!163301) (not b!1566422) (not b!1566268) (not d!163255) (not b!1566259) (not d!163279) (not b_lambda!25013) (not b!1566378) (not b!1566260) (not d!163303) (not b!1566315) (not d!163297) (not d!163321) (not d!163293) (not d!163265) (not b!1566307) (not b!1566354) (not b_lambda!25005) (not bm!71900) (not b!1566274) (not b!1566355) (not b!1566313) (not b!1566374) (not b!1566408) (not b!1566322) (not mapNonEmpty!59840) (not d!163275) b_and!51829 (not d!163317) (not b!1566328) (not d!163277) (not d!163259) tp_is_empty!38961 (not d!163289) (not b!1566269) (not b!1566291) (not d!163271) (not b!1566371) (not b!1566404) (not b!1566288) (not b!1566368) (not b!1566413) (not b!1566311))
(check-sat b_and!51829 (not b_next!32187))
(get-model)

(declare-fun b!1566427 () Bool)

(declare-fun e!873118 () Bool)

(declare-fun lt!672708 () List!36629)

(assert (=> b!1566427 (= e!873118 (contains!10348 lt!672708 (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun bm!71901 () Bool)

(declare-fun call!71904 () List!36629)

(declare-fun call!71905 () List!36629)

(assert (=> bm!71901 (= call!71904 call!71905)))

(declare-fun b!1566428 () Bool)

(declare-fun e!873116 () List!36629)

(declare-fun e!873114 () List!36629)

(assert (=> b!1566428 (= e!873116 e!873114)))

(declare-fun c!144379 () Bool)

(assert (=> b!1566428 (= c!144379 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672553))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672553)))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun b!1566429 () Bool)

(declare-fun c!144378 () Bool)

(declare-fun e!873117 () List!36629)

(assert (=> b!1566429 (= e!873117 (ite c!144379 (t!51530 (t!51530 (toList!11354 lt!672553))) (ite c!144378 (Cons!36625 (h!38071 (t!51530 (toList!11354 lt!672553))) (t!51530 (t!51530 (toList!11354 lt!672553)))) Nil!36626)))))

(declare-fun b!1566430 () Bool)

(declare-fun res!1070668 () Bool)

(assert (=> b!1566430 (=> (not res!1070668) (not e!873118))))

(assert (=> b!1566430 (= res!1070668 (containsKey!851 lt!672708 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566431 () Bool)

(assert (=> b!1566431 (= e!873117 (insertStrictlySorted!577 (t!51530 (t!51530 (toList!11354 lt!672553))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566432 () Bool)

(declare-fun e!873115 () List!36629)

(declare-fun call!71906 () List!36629)

(assert (=> b!1566432 (= e!873115 call!71906)))

(declare-fun bm!71902 () Bool)

(declare-fun c!144381 () Bool)

(assert (=> bm!71902 (= call!71905 ($colon$colon!987 e!873117 (ite c!144381 (h!38071 (t!51530 (toList!11354 lt!672553))) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))))

(declare-fun c!144380 () Bool)

(assert (=> bm!71902 (= c!144380 c!144381)))

(declare-fun d!163329 () Bool)

(assert (=> d!163329 e!873118))

(declare-fun res!1070669 () Bool)

(assert (=> d!163329 (=> (not res!1070669) (not e!873118))))

(assert (=> d!163329 (= res!1070669 (isStrictlySorted!986 lt!672708))))

(assert (=> d!163329 (= lt!672708 e!873116)))

(assert (=> d!163329 (= c!144381 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672553))) (bvslt (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672553)))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163329 (isStrictlySorted!986 (t!51530 (toList!11354 lt!672553)))))

(assert (=> d!163329 (= (insertStrictlySorted!577 (t!51530 (toList!11354 lt!672553)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) lt!672708)))

(declare-fun b!1566426 () Bool)

(assert (=> b!1566426 (= e!873116 call!71905)))

(declare-fun b!1566433 () Bool)

(assert (=> b!1566433 (= c!144378 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672553))) (bvsgt (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672553)))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> b!1566433 (= e!873114 e!873115)))

(declare-fun b!1566434 () Bool)

(assert (=> b!1566434 (= e!873115 call!71906)))

(declare-fun bm!71903 () Bool)

(assert (=> bm!71903 (= call!71906 call!71904)))

(declare-fun b!1566435 () Bool)

(assert (=> b!1566435 (= e!873114 call!71904)))

(assert (= (and d!163329 c!144381) b!1566426))

(assert (= (and d!163329 (not c!144381)) b!1566428))

(assert (= (and b!1566428 c!144379) b!1566435))

(assert (= (and b!1566428 (not c!144379)) b!1566433))

(assert (= (and b!1566433 c!144378) b!1566434))

(assert (= (and b!1566433 (not c!144378)) b!1566432))

(assert (= (or b!1566434 b!1566432) bm!71903))

(assert (= (or b!1566435 bm!71903) bm!71901))

(assert (= (or b!1566426 bm!71901) bm!71902))

(assert (= (and bm!71902 c!144380) b!1566431))

(assert (= (and bm!71902 (not c!144380)) b!1566429))

(assert (= (and d!163329 res!1070669) b!1566430))

(assert (= (and b!1566430 res!1070668) b!1566427))

(declare-fun m!1441425 () Bool)

(assert (=> b!1566427 m!1441425))

(declare-fun m!1441427 () Bool)

(assert (=> b!1566430 m!1441427))

(declare-fun m!1441429 () Bool)

(assert (=> bm!71902 m!1441429))

(declare-fun m!1441431 () Bool)

(assert (=> d!163329 m!1441431))

(declare-fun m!1441433 () Bool)

(assert (=> d!163329 m!1441433))

(declare-fun m!1441435 () Bool)

(assert (=> b!1566431 m!1441435))

(assert (=> b!1566355 d!163329))

(declare-fun d!163331 () Bool)

(declare-fun res!1070670 () Bool)

(declare-fun e!873119 () Bool)

(assert (=> d!163331 (=> res!1070670 e!873119)))

(assert (=> d!163331 (= res!1070670 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163331 (= (containsKey!851 (t!51530 (toList!11354 lt!672551)) #b0000000000000000000000000000000000000000000000000000000000000000) e!873119)))

(declare-fun b!1566436 () Bool)

(declare-fun e!873120 () Bool)

(assert (=> b!1566436 (= e!873119 e!873120)))

(declare-fun res!1070671 () Bool)

(assert (=> b!1566436 (=> (not res!1070671) (not e!873120))))

(assert (=> b!1566436 (= res!1070671 (and (or (not ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551)))) (bvsle (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (bvslt (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566437 () Bool)

(assert (=> b!1566437 (= e!873120 (containsKey!851 (t!51530 (t!51530 (toList!11354 lt!672551))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163331 (not res!1070670)) b!1566436))

(assert (= (and b!1566436 res!1070671) b!1566437))

(declare-fun m!1441437 () Bool)

(assert (=> b!1566437 m!1441437))

(assert (=> b!1566413 d!163331))

(declare-fun d!163333 () Bool)

(declare-fun e!873121 () Bool)

(assert (=> d!163333 e!873121))

(declare-fun res!1070672 () Bool)

(assert (=> d!163333 (=> res!1070672 e!873121)))

(declare-fun lt!672710 () Bool)

(assert (=> d!163333 (= res!1070672 (not lt!672710))))

(declare-fun lt!672711 () Bool)

(assert (=> d!163333 (= lt!672710 lt!672711)))

(declare-fun lt!672712 () Unit!52032)

(declare-fun e!873122 () Unit!52032)

(assert (=> d!163333 (= lt!672712 e!873122)))

(declare-fun c!144382 () Bool)

(assert (=> d!163333 (= c!144382 lt!672711)))

(assert (=> d!163333 (= lt!672711 (containsKey!851 (toList!11354 lt!672637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163333 (= (contains!10345 lt!672637 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672710)))

(declare-fun b!1566438 () Bool)

(declare-fun lt!672709 () Unit!52032)

(assert (=> b!1566438 (= e!873122 lt!672709)))

(assert (=> b!1566438 (= lt!672709 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566438 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566439 () Bool)

(declare-fun Unit!52046 () Unit!52032)

(assert (=> b!1566439 (= e!873122 Unit!52046)))

(declare-fun b!1566440 () Bool)

(assert (=> b!1566440 (= e!873121 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163333 c!144382) b!1566438))

(assert (= (and d!163333 (not c!144382)) b!1566439))

(assert (= (and d!163333 (not res!1070672)) b!1566440))

(declare-fun m!1441439 () Bool)

(assert (=> d!163333 m!1441439))

(declare-fun m!1441441 () Bool)

(assert (=> b!1566438 m!1441441))

(declare-fun m!1441443 () Bool)

(assert (=> b!1566438 m!1441443))

(assert (=> b!1566438 m!1441443))

(declare-fun m!1441445 () Bool)

(assert (=> b!1566438 m!1441445))

(assert (=> b!1566440 m!1441443))

(assert (=> b!1566440 m!1441443))

(assert (=> b!1566440 m!1441445))

(assert (=> d!163255 d!163333))

(assert (=> d!163255 d!163225))

(declare-fun b!1566443 () Bool)

(declare-fun e!873124 () Option!869)

(assert (=> b!1566443 (= e!873124 (getValueByKey!793 (t!51530 (toList!11354 lt!672655)) (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun b!1566444 () Bool)

(assert (=> b!1566444 (= e!873124 None!867)))

(declare-fun b!1566441 () Bool)

(declare-fun e!873123 () Option!869)

(assert (=> b!1566441 (= e!873123 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672655)))))))

(declare-fun b!1566442 () Bool)

(assert (=> b!1566442 (= e!873123 e!873124)))

(declare-fun c!144384 () Bool)

(assert (=> b!1566442 (= c!144384 (and ((_ is Cons!36625) (toList!11354 lt!672655)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672655))) (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))))

(declare-fun c!144383 () Bool)

(declare-fun d!163335 () Bool)

(assert (=> d!163335 (= c!144383 (and ((_ is Cons!36625) (toList!11354 lt!672655)) (= (_1!12632 (h!38071 (toList!11354 lt!672655))) (_1!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(assert (=> d!163335 (= (getValueByKey!793 (toList!11354 lt!672655) (_1!12632 (tuple2!25243 lt!672610 lt!672612))) e!873123)))

(assert (= (and d!163335 c!144383) b!1566441))

(assert (= (and d!163335 (not c!144383)) b!1566442))

(assert (= (and b!1566442 c!144384) b!1566443))

(assert (= (and b!1566442 (not c!144384)) b!1566444))

(declare-fun m!1441447 () Bool)

(assert (=> b!1566443 m!1441447))

(assert (=> b!1566311 d!163335))

(declare-fun d!163337 () Bool)

(assert (=> d!163337 (= (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566377 d!163337))

(declare-fun b!1566447 () Bool)

(declare-fun e!873126 () Option!869)

(assert (=> b!1566447 (= e!873126 (getValueByKey!793 (t!51530 (t!51530 (toList!11354 lt!672551))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566448 () Bool)

(assert (=> b!1566448 (= e!873126 None!867)))

(declare-fun b!1566445 () Bool)

(declare-fun e!873125 () Option!869)

(assert (=> b!1566445 (= e!873125 (Some!868 (_2!12632 (h!38071 (t!51530 (toList!11354 lt!672551))))))))

(declare-fun b!1566446 () Bool)

(assert (=> b!1566446 (= e!873125 e!873126)))

(declare-fun c!144386 () Bool)

(assert (=> b!1566446 (= c!144386 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (not (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!163339 () Bool)

(declare-fun c!144385 () Bool)

(assert (=> d!163339 (= c!144385 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163339 (= (getValueByKey!793 (t!51530 (toList!11354 lt!672551)) #b1000000000000000000000000000000000000000000000000000000000000000) e!873125)))

(assert (= (and d!163339 c!144385) b!1566445))

(assert (= (and d!163339 (not c!144385)) b!1566446))

(assert (= (and b!1566446 c!144386) b!1566447))

(assert (= (and b!1566446 (not c!144386)) b!1566448))

(declare-fun m!1441449 () Bool)

(assert (=> b!1566447 m!1441449))

(assert (=> b!1566364 d!163339))

(declare-fun e!873128 () Option!869)

(declare-fun b!1566451 () Bool)

(assert (=> b!1566451 (= e!873128 (getValueByKey!793 (t!51530 (t!51530 (toList!11354 lt!672630))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566452 () Bool)

(assert (=> b!1566452 (= e!873128 None!867)))

(declare-fun b!1566449 () Bool)

(declare-fun e!873127 () Option!869)

(assert (=> b!1566449 (= e!873127 (Some!868 (_2!12632 (h!38071 (t!51530 (toList!11354 lt!672630))))))))

(declare-fun b!1566450 () Bool)

(assert (=> b!1566450 (= e!873127 e!873128)))

(declare-fun c!144388 () Bool)

(assert (=> b!1566450 (= c!144388 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672630))) (not (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672630)))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))))

(declare-fun c!144387 () Bool)

(declare-fun d!163341 () Bool)

(assert (=> d!163341 (= c!144387 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672630))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672630)))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163341 (= (getValueByKey!793 (t!51530 (toList!11354 lt!672630)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) e!873127)))

(assert (= (and d!163341 c!144387) b!1566449))

(assert (= (and d!163341 (not c!144387)) b!1566450))

(assert (= (and b!1566450 c!144388) b!1566451))

(assert (= (and b!1566450 (not c!144388)) b!1566452))

(declare-fun m!1441451 () Bool)

(assert (=> b!1566451 m!1441451))

(assert (=> b!1566422 d!163341))

(declare-fun d!163343 () Bool)

(declare-fun res!1070673 () Bool)

(declare-fun e!873129 () Bool)

(assert (=> d!163343 (=> res!1070673 e!873129)))

(assert (=> d!163343 (= res!1070673 (and ((_ is Cons!36625) (toList!11354 lt!672630)) (= (_1!12632 (h!38071 (toList!11354 lt!672630))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163343 (= (containsKey!851 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) e!873129)))

(declare-fun b!1566453 () Bool)

(declare-fun e!873130 () Bool)

(assert (=> b!1566453 (= e!873129 e!873130)))

(declare-fun res!1070674 () Bool)

(assert (=> b!1566453 (=> (not res!1070674) (not e!873130))))

(assert (=> b!1566453 (= res!1070674 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672630))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672630))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) ((_ is Cons!36625) (toList!11354 lt!672630)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672630))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun b!1566454 () Bool)

(assert (=> b!1566454 (= e!873130 (containsKey!851 (t!51530 (toList!11354 lt!672630)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (= (and d!163343 (not res!1070673)) b!1566453))

(assert (= (and b!1566453 res!1070674) b!1566454))

(declare-fun m!1441453 () Bool)

(assert (=> b!1566454 m!1441453))

(assert (=> d!163283 d!163343))

(declare-fun b!1566455 () Bool)

(declare-fun e!873134 () Bool)

(declare-fun call!71907 () Bool)

(assert (=> b!1566455 (= e!873134 call!71907)))

(declare-fun b!1566456 () Bool)

(assert (=> b!1566456 (= e!873134 call!71907)))

(declare-fun b!1566457 () Bool)

(declare-fun e!873132 () Bool)

(declare-fun e!873133 () Bool)

(assert (=> b!1566457 (= e!873132 e!873133)))

(declare-fun res!1070677 () Bool)

(assert (=> b!1566457 (=> (not res!1070677) (not e!873133))))

(declare-fun e!873131 () Bool)

(assert (=> b!1566457 (= res!1070677 (not e!873131))))

(declare-fun res!1070676 () Bool)

(assert (=> b!1566457 (=> (not res!1070676) (not e!873131))))

(assert (=> b!1566457 (= res!1070676 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1566458 () Bool)

(assert (=> b!1566458 (= e!873133 e!873134)))

(declare-fun c!144389 () Bool)

(assert (=> b!1566458 (= c!144389 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!71904 () Bool)

(assert (=> bm!71904 (= call!71907 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144389 (Cons!36626 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!144364 (Cons!36626 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627))) (ite c!144364 (Cons!36626 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)))))))

(declare-fun d!163345 () Bool)

(declare-fun res!1070675 () Bool)

(assert (=> d!163345 (=> res!1070675 e!873132)))

(assert (=> d!163345 (= res!1070675 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> d!163345 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144364 (Cons!36626 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627))) e!873132)))

(declare-fun b!1566459 () Bool)

(assert (=> b!1566459 (= e!873131 (contains!10347 (ite c!144364 (Cons!36626 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!163345 (not res!1070675)) b!1566457))

(assert (= (and b!1566457 res!1070676) b!1566459))

(assert (= (and b!1566457 res!1070677) b!1566458))

(assert (= (and b!1566458 c!144389) b!1566455))

(assert (= (and b!1566458 (not c!144389)) b!1566456))

(assert (= (or b!1566455 b!1566456) bm!71904))

(declare-fun m!1441455 () Bool)

(assert (=> b!1566457 m!1441455))

(assert (=> b!1566457 m!1441455))

(declare-fun m!1441457 () Bool)

(assert (=> b!1566457 m!1441457))

(assert (=> b!1566458 m!1441455))

(assert (=> b!1566458 m!1441455))

(assert (=> b!1566458 m!1441457))

(assert (=> bm!71904 m!1441455))

(declare-fun m!1441459 () Bool)

(assert (=> bm!71904 m!1441459))

(assert (=> b!1566459 m!1441455))

(assert (=> b!1566459 m!1441455))

(declare-fun m!1441461 () Bool)

(assert (=> b!1566459 m!1441461))

(assert (=> bm!71900 d!163345))

(declare-fun d!163347 () Bool)

(assert (=> d!163347 (= (isEmpty!1146 lt!672637) (isEmpty!1148 (toList!11354 lt!672637)))))

(declare-fun bs!45075 () Bool)

(assert (= bs!45075 d!163347))

(declare-fun m!1441463 () Bool)

(assert (=> bs!45075 m!1441463))

(assert (=> b!1566268 d!163347))

(declare-fun b!1566462 () Bool)

(declare-fun e!873136 () Option!869)

(assert (=> b!1566462 (= e!873136 (getValueByKey!793 (t!51530 (t!51530 (toList!11354 lt!672551))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566463 () Bool)

(assert (=> b!1566463 (= e!873136 None!867)))

(declare-fun b!1566460 () Bool)

(declare-fun e!873135 () Option!869)

(assert (=> b!1566460 (= e!873135 (Some!868 (_2!12632 (h!38071 (t!51530 (toList!11354 lt!672551))))))))

(declare-fun b!1566461 () Bool)

(assert (=> b!1566461 (= e!873135 e!873136)))

(declare-fun c!144391 () Bool)

(assert (=> b!1566461 (= c!144391 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (not (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!163349 () Bool)

(declare-fun c!144390 () Bool)

(assert (=> d!163349 (= c!144390 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163349 (= (getValueByKey!793 (t!51530 (toList!11354 lt!672551)) #b0000000000000000000000000000000000000000000000000000000000000000) e!873135)))

(assert (= (and d!163349 c!144390) b!1566460))

(assert (= (and d!163349 (not c!144390)) b!1566461))

(assert (= (and b!1566461 c!144391) b!1566462))

(assert (= (and b!1566461 (not c!144391)) b!1566463))

(declare-fun m!1441465 () Bool)

(assert (=> b!1566462 m!1441465))

(assert (=> b!1566302 d!163349))

(declare-fun d!163351 () Bool)

(assert (=> d!163351 (= ($colon$colon!987 e!873066 (ite c!144358 (h!38071 (toList!11354 lt!672553)) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))) (Cons!36625 (ite c!144358 (h!38071 (toList!11354 lt!672553)) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) e!873066))))

(assert (=> bm!71898 d!163351))

(declare-fun d!163353 () Bool)

(assert (=> d!163353 (arrayContainsKey!0 _keys!637 lt!672643 #b00000000000000000000000000000000)))

(declare-fun lt!672713 () Unit!52032)

(assert (=> d!163353 (= lt!672713 (choose!13 _keys!637 lt!672643 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!163353 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!163353 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672643 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!672713)))

(declare-fun bs!45076 () Bool)

(assert (= bs!45076 d!163353))

(assert (=> bs!45076 m!1441257))

(declare-fun m!1441467 () Bool)

(assert (=> bs!45076 m!1441467))

(assert (=> b!1566287 d!163353))

(declare-fun d!163355 () Bool)

(declare-fun res!1070678 () Bool)

(declare-fun e!873137 () Bool)

(assert (=> d!163355 (=> res!1070678 e!873137)))

(assert (=> d!163355 (= res!1070678 (= (select (arr!50491 _keys!637) #b00000000000000000000000000000000) lt!672643))))

(assert (=> d!163355 (= (arrayContainsKey!0 _keys!637 lt!672643 #b00000000000000000000000000000000) e!873137)))

(declare-fun b!1566464 () Bool)

(declare-fun e!873138 () Bool)

(assert (=> b!1566464 (= e!873137 e!873138)))

(declare-fun res!1070679 () Bool)

(assert (=> b!1566464 (=> (not res!1070679) (not e!873138))))

(assert (=> b!1566464 (= res!1070679 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun b!1566465 () Bool)

(assert (=> b!1566465 (= e!873138 (arrayContainsKey!0 _keys!637 lt!672643 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!163355 (not res!1070678)) b!1566464))

(assert (= (and b!1566464 res!1070679) b!1566465))

(assert (=> d!163355 m!1441123))

(declare-fun m!1441469 () Bool)

(assert (=> b!1566465 m!1441469))

(assert (=> b!1566287 d!163355))

(declare-fun b!1566466 () Bool)

(declare-fun e!873139 () SeekEntryResult!13526)

(assert (=> b!1566466 (= e!873139 Undefined!13526)))

(declare-fun b!1566467 () Bool)

(declare-fun e!873141 () SeekEntryResult!13526)

(declare-fun lt!672714 () SeekEntryResult!13526)

(assert (=> b!1566467 (= e!873141 (Found!13526 (index!56504 lt!672714)))))

(declare-fun b!1566468 () Bool)

(declare-fun c!144394 () Bool)

(declare-fun lt!672715 () (_ BitVec 64))

(assert (=> b!1566468 (= c!144394 (= lt!672715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873140 () SeekEntryResult!13526)

(assert (=> b!1566468 (= e!873141 e!873140)))

(declare-fun b!1566469 () Bool)

(assert (=> b!1566469 (= e!873140 (MissingZero!13526 (index!56504 lt!672714)))))

(declare-fun d!163357 () Bool)

(declare-fun lt!672716 () SeekEntryResult!13526)

(assert (=> d!163357 (and (or ((_ is Undefined!13526) lt!672716) (not ((_ is Found!13526) lt!672716)) (and (bvsge (index!56503 lt!672716) #b00000000000000000000000000000000) (bvslt (index!56503 lt!672716) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672716) ((_ is Found!13526) lt!672716) (not ((_ is MissingZero!13526) lt!672716)) (and (bvsge (index!56502 lt!672716) #b00000000000000000000000000000000) (bvslt (index!56502 lt!672716) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672716) ((_ is Found!13526) lt!672716) ((_ is MissingZero!13526) lt!672716) (not ((_ is MissingVacant!13526) lt!672716)) (and (bvsge (index!56505 lt!672716) #b00000000000000000000000000000000) (bvslt (index!56505 lt!672716) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672716) (ite ((_ is Found!13526) lt!672716) (= (select (arr!50491 _keys!637) (index!56503 lt!672716)) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!13526) lt!672716) (= (select (arr!50491 _keys!637) (index!56502 lt!672716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13526) lt!672716) (= (select (arr!50491 _keys!637) (index!56505 lt!672716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163357 (= lt!672716 e!873139)))

(declare-fun c!144393 () Bool)

(assert (=> d!163357 (= c!144393 (and ((_ is Intermediate!13526) lt!672714) (undefined!14338 lt!672714)))))

(assert (=> d!163357 (= lt!672714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!947) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947))))

(assert (=> d!163357 (validMask!0 mask!947)))

(assert (=> d!163357 (= (seekEntryOrOpen!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) lt!672716)))

(declare-fun b!1566470 () Bool)

(assert (=> b!1566470 (= e!873139 e!873141)))

(assert (=> b!1566470 (= lt!672715 (select (arr!50491 _keys!637) (index!56504 lt!672714)))))

(declare-fun c!144392 () Bool)

(assert (=> b!1566470 (= c!144392 (= lt!672715 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1566471 () Bool)

(assert (=> b!1566471 (= e!873140 (seekKeyOrZeroReturnVacant!0 (x!140749 lt!672714) (index!56504 lt!672714) (index!56504 lt!672714) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947))))

(assert (= (and d!163357 c!144393) b!1566466))

(assert (= (and d!163357 (not c!144393)) b!1566470))

(assert (= (and b!1566470 c!144392) b!1566467))

(assert (= (and b!1566470 (not c!144392)) b!1566468))

(assert (= (and b!1566468 c!144394) b!1566469))

(assert (= (and b!1566468 (not c!144394)) b!1566471))

(declare-fun m!1441471 () Bool)

(assert (=> d!163357 m!1441471))

(declare-fun m!1441473 () Bool)

(assert (=> d!163357 m!1441473))

(declare-fun m!1441475 () Bool)

(assert (=> d!163357 m!1441475))

(assert (=> d!163357 m!1441253))

(declare-fun m!1441477 () Bool)

(assert (=> d!163357 m!1441477))

(assert (=> d!163357 m!1441477))

(assert (=> d!163357 m!1441253))

(declare-fun m!1441479 () Bool)

(assert (=> d!163357 m!1441479))

(assert (=> d!163357 m!1441057))

(declare-fun m!1441481 () Bool)

(assert (=> b!1566470 m!1441481))

(assert (=> b!1566471 m!1441253))

(declare-fun m!1441483 () Bool)

(assert (=> b!1566471 m!1441483))

(assert (=> b!1566287 d!163357))

(declare-fun d!163359 () Bool)

(assert (not d!163359))

(assert (=> b!1566284 d!163359))

(assert (=> d!163281 d!163279))

(assert (=> d!163281 d!163277))

(declare-fun d!163361 () Bool)

(assert (=> d!163361 (not (contains!10345 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)) lt!672615))))

(assert (=> d!163361 true))

(declare-fun _$36!389 () Unit!52032)

(assert (=> d!163361 (= (choose!2075 lt!672613 lt!672610 lt!672612 lt!672615) _$36!389)))

(declare-fun bs!45077 () Bool)

(assert (= bs!45077 d!163361))

(assert (=> bs!45077 m!1441169))

(assert (=> bs!45077 m!1441169))

(assert (=> bs!45077 m!1441171))

(assert (=> d!163281 d!163361))

(declare-fun d!163363 () Bool)

(declare-fun e!873142 () Bool)

(assert (=> d!163363 e!873142))

(declare-fun res!1070680 () Bool)

(assert (=> d!163363 (=> res!1070680 e!873142)))

(declare-fun lt!672718 () Bool)

(assert (=> d!163363 (= res!1070680 (not lt!672718))))

(declare-fun lt!672719 () Bool)

(assert (=> d!163363 (= lt!672718 lt!672719)))

(declare-fun lt!672720 () Unit!52032)

(declare-fun e!873143 () Unit!52032)

(assert (=> d!163363 (= lt!672720 e!873143)))

(declare-fun c!144395 () Bool)

(assert (=> d!163363 (= c!144395 lt!672719)))

(assert (=> d!163363 (= lt!672719 (containsKey!851 (toList!11354 lt!672613) lt!672615))))

(assert (=> d!163363 (= (contains!10345 lt!672613 lt!672615) lt!672718)))

(declare-fun b!1566472 () Bool)

(declare-fun lt!672717 () Unit!52032)

(assert (=> b!1566472 (= e!873143 lt!672717)))

(assert (=> b!1566472 (= lt!672717 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672613) lt!672615))))

(assert (=> b!1566472 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672613) lt!672615))))

(declare-fun b!1566473 () Bool)

(declare-fun Unit!52047 () Unit!52032)

(assert (=> b!1566473 (= e!873143 Unit!52047)))

(declare-fun b!1566474 () Bool)

(assert (=> b!1566474 (= e!873142 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672613) lt!672615)))))

(assert (= (and d!163363 c!144395) b!1566472))

(assert (= (and d!163363 (not c!144395)) b!1566473))

(assert (= (and d!163363 (not res!1070680)) b!1566474))

(declare-fun m!1441485 () Bool)

(assert (=> d!163363 m!1441485))

(declare-fun m!1441487 () Bool)

(assert (=> b!1566472 m!1441487))

(declare-fun m!1441489 () Bool)

(assert (=> b!1566472 m!1441489))

(assert (=> b!1566472 m!1441489))

(declare-fun m!1441491 () Bool)

(assert (=> b!1566472 m!1441491))

(assert (=> b!1566474 m!1441489))

(assert (=> b!1566474 m!1441489))

(assert (=> b!1566474 m!1441491))

(assert (=> d!163281 d!163363))

(declare-fun d!163365 () Bool)

(declare-fun res!1070681 () Bool)

(declare-fun e!873144 () Bool)

(assert (=> d!163365 (=> res!1070681 e!873144)))

(assert (=> d!163365 (= res!1070681 (and ((_ is Cons!36625) (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))) (= (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))))) lt!672615)))))

(assert (=> d!163365 (= (containsKey!851 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615) e!873144)))

(declare-fun b!1566475 () Bool)

(declare-fun e!873145 () Bool)

(assert (=> b!1566475 (= e!873144 e!873145)))

(declare-fun res!1070682 () Bool)

(assert (=> b!1566475 (=> (not res!1070682) (not e!873145))))

(assert (=> b!1566475 (= res!1070682 (and (or (not ((_ is Cons!36625) (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))))) (bvsle (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))))) lt!672615)) ((_ is Cons!36625) (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))) (bvslt (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))))) lt!672615)))))

(declare-fun b!1566476 () Bool)

(assert (=> b!1566476 (= e!873145 (containsKey!851 (t!51530 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))) lt!672615))))

(assert (= (and d!163365 (not res!1070681)) b!1566475))

(assert (= (and b!1566475 res!1070682) b!1566476))

(declare-fun m!1441493 () Bool)

(assert (=> b!1566476 m!1441493))

(assert (=> d!163279 d!163365))

(declare-fun d!163367 () Bool)

(assert (=> d!163367 (= (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782))) (not ((_ is Some!868) (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))))

(assert (=> d!163271 d!163367))

(declare-fun d!163369 () Bool)

(declare-fun res!1070683 () Bool)

(declare-fun e!873146 () Bool)

(assert (=> d!163369 (=> res!1070683 e!873146)))

(assert (=> d!163369 (= res!1070683 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) (select (arr!50491 _keys!637) from!782))))))

(assert (=> d!163369 (= (containsKey!851 (t!51530 (toList!11354 lt!672551)) (select (arr!50491 _keys!637) from!782)) e!873146)))

(declare-fun b!1566477 () Bool)

(declare-fun e!873147 () Bool)

(assert (=> b!1566477 (= e!873146 e!873147)))

(declare-fun res!1070684 () Bool)

(assert (=> b!1566477 (=> (not res!1070684) (not e!873147))))

(assert (=> b!1566477 (= res!1070684 (and (or (not ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551)))) (bvsle (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) (select (arr!50491 _keys!637) from!782))) ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (bvslt (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) (select (arr!50491 _keys!637) from!782))))))

(declare-fun b!1566478 () Bool)

(assert (=> b!1566478 (= e!873147 (containsKey!851 (t!51530 (t!51530 (toList!11354 lt!672551))) (select (arr!50491 _keys!637) from!782)))))

(assert (= (and d!163369 (not res!1070683)) b!1566477))

(assert (= (and b!1566477 res!1070684) b!1566478))

(assert (=> b!1566478 m!1441043))

(declare-fun m!1441495 () Bool)

(assert (=> b!1566478 m!1441495))

(assert (=> b!1566266 d!163369))

(assert (=> b!1566288 d!163337))

(declare-fun b!1566481 () Bool)

(declare-fun e!873149 () Option!869)

(assert (=> b!1566481 (= e!873149 (getValueByKey!793 (t!51530 (toList!11354 lt!672651)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566482 () Bool)

(assert (=> b!1566482 (= e!873149 None!867)))

(declare-fun b!1566479 () Bool)

(declare-fun e!873148 () Option!869)

(assert (=> b!1566479 (= e!873148 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672651)))))))

(declare-fun b!1566480 () Bool)

(assert (=> b!1566480 (= e!873148 e!873149)))

(declare-fun c!144397 () Bool)

(assert (=> b!1566480 (= c!144397 (and ((_ is Cons!36625) (toList!11354 lt!672651)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672651))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!144396 () Bool)

(declare-fun d!163371 () Bool)

(assert (=> d!163371 (= c!144396 (and ((_ is Cons!36625) (toList!11354 lt!672651)) (= (_1!12632 (h!38071 (toList!11354 lt!672651))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!163371 (= (getValueByKey!793 (toList!11354 lt!672651) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!873148)))

(assert (= (and d!163371 c!144396) b!1566479))

(assert (= (and d!163371 (not c!144396)) b!1566480))

(assert (= (and b!1566480 c!144397) b!1566481))

(assert (= (and b!1566480 (not c!144397)) b!1566482))

(declare-fun m!1441497 () Bool)

(assert (=> b!1566481 m!1441497))

(assert (=> b!1566309 d!163371))

(declare-fun d!163373 () Bool)

(assert (=> d!163373 (= (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!868) (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!163293 d!163373))

(assert (=> d!163307 d!163309))

(declare-fun d!163375 () Bool)

(assert (=> d!163375 (arrayContainsKey!0 _keys!637 lt!672586 #b00000000000000000000000000000000)))

(assert (=> d!163375 true))

(declare-fun _$60!457 () Unit!52032)

(assert (=> d!163375 (= (choose!13 _keys!637 lt!672586 #b00000000000000000000000000000000) _$60!457)))

(declare-fun bs!45078 () Bool)

(assert (= bs!45078 d!163375))

(assert (=> bs!45078 m!1441133))

(assert (=> d!163307 d!163375))

(declare-fun d!163377 () Bool)

(declare-fun e!873150 () Bool)

(assert (=> d!163377 e!873150))

(declare-fun res!1070685 () Bool)

(assert (=> d!163377 (=> res!1070685 e!873150)))

(declare-fun lt!672722 () Bool)

(assert (=> d!163377 (= res!1070685 (not lt!672722))))

(declare-fun lt!672723 () Bool)

(assert (=> d!163377 (= lt!672722 lt!672723)))

(declare-fun lt!672724 () Unit!52032)

(declare-fun e!873151 () Unit!52032)

(assert (=> d!163377 (= lt!672724 e!873151)))

(declare-fun c!144398 () Bool)

(assert (=> d!163377 (= c!144398 lt!672723)))

(assert (=> d!163377 (= lt!672723 (containsKey!851 (toList!11354 lt!672651) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163377 (= (contains!10345 lt!672651 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!672722)))

(declare-fun b!1566483 () Bool)

(declare-fun lt!672721 () Unit!52032)

(assert (=> b!1566483 (= e!873151 lt!672721)))

(assert (=> b!1566483 (= lt!672721 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672651) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1566483 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672651) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566484 () Bool)

(declare-fun Unit!52048 () Unit!52032)

(assert (=> b!1566484 (= e!873151 Unit!52048)))

(declare-fun b!1566485 () Bool)

(assert (=> b!1566485 (= e!873150 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672651) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!163377 c!144398) b!1566483))

(assert (= (and d!163377 (not c!144398)) b!1566484))

(assert (= (and d!163377 (not res!1070685)) b!1566485))

(declare-fun m!1441499 () Bool)

(assert (=> d!163377 m!1441499))

(declare-fun m!1441501 () Bool)

(assert (=> b!1566483 m!1441501))

(assert (=> b!1566483 m!1441287))

(assert (=> b!1566483 m!1441287))

(declare-fun m!1441503 () Bool)

(assert (=> b!1566483 m!1441503))

(assert (=> b!1566485 m!1441287))

(assert (=> b!1566485 m!1441287))

(assert (=> b!1566485 m!1441503))

(assert (=> d!163275 d!163377))

(declare-fun b!1566488 () Bool)

(declare-fun e!873153 () Option!869)

(assert (=> b!1566488 (= e!873153 (getValueByKey!793 (t!51530 lt!672650) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566489 () Bool)

(assert (=> b!1566489 (= e!873153 None!867)))

(declare-fun b!1566486 () Bool)

(declare-fun e!873152 () Option!869)

(assert (=> b!1566486 (= e!873152 (Some!868 (_2!12632 (h!38071 lt!672650))))))

(declare-fun b!1566487 () Bool)

(assert (=> b!1566487 (= e!873152 e!873153)))

(declare-fun c!144400 () Bool)

(assert (=> b!1566487 (= c!144400 (and ((_ is Cons!36625) lt!672650) (not (= (_1!12632 (h!38071 lt!672650)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!144399 () Bool)

(declare-fun d!163379 () Bool)

(assert (=> d!163379 (= c!144399 (and ((_ is Cons!36625) lt!672650) (= (_1!12632 (h!38071 lt!672650)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!163379 (= (getValueByKey!793 lt!672650 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!873152)))

(assert (= (and d!163379 c!144399) b!1566486))

(assert (= (and d!163379 (not c!144399)) b!1566487))

(assert (= (and b!1566487 c!144400) b!1566488))

(assert (= (and b!1566487 (not c!144400)) b!1566489))

(declare-fun m!1441505 () Bool)

(assert (=> b!1566488 m!1441505))

(assert (=> d!163275 d!163379))

(declare-fun d!163381 () Bool)

(assert (=> d!163381 (= (getValueByKey!793 lt!672650 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!672725 () Unit!52032)

(assert (=> d!163381 (= lt!672725 (choose!2077 lt!672650 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!873154 () Bool)

(assert (=> d!163381 e!873154))

(declare-fun res!1070686 () Bool)

(assert (=> d!163381 (=> (not res!1070686) (not e!873154))))

(assert (=> d!163381 (= res!1070686 (isStrictlySorted!986 lt!672650))))

(assert (=> d!163381 (= (lemmaContainsTupThenGetReturnValue!387 lt!672650 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!672725)))

(declare-fun b!1566490 () Bool)

(declare-fun res!1070687 () Bool)

(assert (=> b!1566490 (=> (not res!1070687) (not e!873154))))

(assert (=> b!1566490 (= res!1070687 (containsKey!851 lt!672650 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566491 () Bool)

(assert (=> b!1566491 (= e!873154 (contains!10348 lt!672650 (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!163381 res!1070686) b!1566490))

(assert (= (and b!1566490 res!1070687) b!1566491))

(assert (=> d!163381 m!1441281))

(declare-fun m!1441507 () Bool)

(assert (=> d!163381 m!1441507))

(declare-fun m!1441509 () Bool)

(assert (=> d!163381 m!1441509))

(declare-fun m!1441511 () Bool)

(assert (=> b!1566490 m!1441511))

(declare-fun m!1441513 () Bool)

(assert (=> b!1566491 m!1441513))

(assert (=> d!163275 d!163381))

(declare-fun b!1566493 () Bool)

(declare-fun e!873159 () Bool)

(declare-fun lt!672726 () List!36629)

(assert (=> b!1566493 (= e!873159 (contains!10348 lt!672726 (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!71905 () Bool)

(declare-fun call!71908 () List!36629)

(declare-fun call!71909 () List!36629)

(assert (=> bm!71905 (= call!71908 call!71909)))

(declare-fun b!1566494 () Bool)

(declare-fun e!873157 () List!36629)

(declare-fun e!873155 () List!36629)

(assert (=> b!1566494 (= e!873157 e!873155)))

(declare-fun c!144402 () Bool)

(assert (=> b!1566494 (= c!144402 (and ((_ is Cons!36625) (toList!11354 call!71891)) (= (_1!12632 (h!38071 (toList!11354 call!71891))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!144401 () Bool)

(declare-fun b!1566495 () Bool)

(declare-fun e!873158 () List!36629)

(assert (=> b!1566495 (= e!873158 (ite c!144402 (t!51530 (toList!11354 call!71891)) (ite c!144401 (Cons!36625 (h!38071 (toList!11354 call!71891)) (t!51530 (toList!11354 call!71891))) Nil!36626)))))

(declare-fun b!1566496 () Bool)

(declare-fun res!1070688 () Bool)

(assert (=> b!1566496 (=> (not res!1070688) (not e!873159))))

(assert (=> b!1566496 (= res!1070688 (containsKey!851 lt!672726 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566497 () Bool)

(assert (=> b!1566497 (= e!873158 (insertStrictlySorted!577 (t!51530 (toList!11354 call!71891)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1566498 () Bool)

(declare-fun e!873156 () List!36629)

(declare-fun call!71910 () List!36629)

(assert (=> b!1566498 (= e!873156 call!71910)))

(declare-fun bm!71906 () Bool)

(declare-fun c!144404 () Bool)

(assert (=> bm!71906 (= call!71909 ($colon$colon!987 e!873158 (ite c!144404 (h!38071 (toList!11354 call!71891)) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!144403 () Bool)

(assert (=> bm!71906 (= c!144403 c!144404)))

(declare-fun d!163383 () Bool)

(assert (=> d!163383 e!873159))

(declare-fun res!1070689 () Bool)

(assert (=> d!163383 (=> (not res!1070689) (not e!873159))))

(assert (=> d!163383 (= res!1070689 (isStrictlySorted!986 lt!672726))))

(assert (=> d!163383 (= lt!672726 e!873157)))

(assert (=> d!163383 (= c!144404 (and ((_ is Cons!36625) (toList!11354 call!71891)) (bvslt (_1!12632 (h!38071 (toList!11354 call!71891))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!163383 (isStrictlySorted!986 (toList!11354 call!71891))))

(assert (=> d!163383 (= (insertStrictlySorted!577 (toList!11354 call!71891) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!672726)))

(declare-fun b!1566492 () Bool)

(assert (=> b!1566492 (= e!873157 call!71909)))

(declare-fun b!1566499 () Bool)

(assert (=> b!1566499 (= c!144401 (and ((_ is Cons!36625) (toList!11354 call!71891)) (bvsgt (_1!12632 (h!38071 (toList!11354 call!71891))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1566499 (= e!873155 e!873156)))

(declare-fun b!1566500 () Bool)

(assert (=> b!1566500 (= e!873156 call!71910)))

(declare-fun bm!71907 () Bool)

(assert (=> bm!71907 (= call!71910 call!71908)))

(declare-fun b!1566501 () Bool)

(assert (=> b!1566501 (= e!873155 call!71908)))

(assert (= (and d!163383 c!144404) b!1566492))

(assert (= (and d!163383 (not c!144404)) b!1566494))

(assert (= (and b!1566494 c!144402) b!1566501))

(assert (= (and b!1566494 (not c!144402)) b!1566499))

(assert (= (and b!1566499 c!144401) b!1566500))

(assert (= (and b!1566499 (not c!144401)) b!1566498))

(assert (= (or b!1566500 b!1566498) bm!71907))

(assert (= (or b!1566501 bm!71907) bm!71905))

(assert (= (or b!1566492 bm!71905) bm!71906))

(assert (= (and bm!71906 c!144403) b!1566497))

(assert (= (and bm!71906 (not c!144403)) b!1566495))

(assert (= (and d!163383 res!1070689) b!1566496))

(assert (= (and b!1566496 res!1070688) b!1566493))

(declare-fun m!1441515 () Bool)

(assert (=> b!1566493 m!1441515))

(declare-fun m!1441517 () Bool)

(assert (=> b!1566496 m!1441517))

(declare-fun m!1441519 () Bool)

(assert (=> bm!71906 m!1441519))

(declare-fun m!1441521 () Bool)

(assert (=> d!163383 m!1441521))

(declare-fun m!1441523 () Bool)

(assert (=> d!163383 m!1441523))

(declare-fun m!1441525 () Bool)

(assert (=> b!1566497 m!1441525))

(assert (=> d!163275 d!163383))

(declare-fun d!163385 () Bool)

(assert (=> d!163385 (= (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (and (not (= (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566274 d!163385))

(declare-fun d!163387 () Bool)

(assert (=> d!163387 (= (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!868) (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!163265 d!163387))

(assert (=> b!1566411 d!163291))

(declare-fun d!163389 () Bool)

(assert (=> d!163389 (= (content!810 Nil!36627) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!163259 d!163389))

(assert (=> b!1566304 d!163253))

(declare-fun d!163391 () Bool)

(assert (=> d!163391 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun lt!672727 () Unit!52032)

(assert (=> d!163391 (= lt!672727 (choose!2076 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun e!873160 () Bool)

(assert (=> d!163391 e!873160))

(declare-fun res!1070690 () Bool)

(assert (=> d!163391 (=> (not res!1070690) (not e!873160))))

(assert (=> d!163391 (= res!1070690 (isStrictlySorted!986 (toList!11354 lt!672630)))))

(assert (=> d!163391 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) lt!672727)))

(declare-fun b!1566502 () Bool)

(assert (=> b!1566502 (= e!873160 (containsKey!851 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (= (and d!163391 res!1070690) b!1566502))

(assert (=> d!163391 m!1441203))

(assert (=> d!163391 m!1441203))

(assert (=> d!163391 m!1441319))

(declare-fun m!1441527 () Bool)

(assert (=> d!163391 m!1441527))

(declare-fun m!1441529 () Bool)

(assert (=> d!163391 m!1441529))

(assert (=> b!1566502 m!1441315))

(assert (=> b!1566317 d!163391))

(declare-fun d!163393 () Bool)

(assert (=> d!163393 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672630) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))))

(declare-fun bs!45079 () Bool)

(assert (= bs!45079 d!163393))

(assert (=> bs!45079 m!1441203))

(declare-fun m!1441531 () Bool)

(assert (=> bs!45079 m!1441531))

(assert (=> b!1566317 d!163393))

(assert (=> b!1566317 d!163327))

(assert (=> b!1566319 d!163393))

(assert (=> b!1566319 d!163327))

(declare-fun d!163395 () Bool)

(declare-fun e!873161 () Bool)

(assert (=> d!163395 e!873161))

(declare-fun res!1070691 () Bool)

(assert (=> d!163395 (=> res!1070691 e!873161)))

(declare-fun lt!672729 () Bool)

(assert (=> d!163395 (= res!1070691 (not lt!672729))))

(declare-fun lt!672730 () Bool)

(assert (=> d!163395 (= lt!672729 lt!672730)))

(declare-fun lt!672731 () Unit!52032)

(declare-fun e!873162 () Unit!52032)

(assert (=> d!163395 (= lt!672731 e!873162)))

(declare-fun c!144405 () Bool)

(assert (=> d!163395 (= c!144405 lt!672730)))

(assert (=> d!163395 (= lt!672730 (containsKey!851 (toList!11354 lt!672655) (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(assert (=> d!163395 (= (contains!10345 lt!672655 (_1!12632 (tuple2!25243 lt!672610 lt!672612))) lt!672729)))

(declare-fun b!1566503 () Bool)

(declare-fun lt!672728 () Unit!52032)

(assert (=> b!1566503 (= e!873162 lt!672728)))

(assert (=> b!1566503 (= lt!672728 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672655) (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(assert (=> b!1566503 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672655) (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun b!1566504 () Bool)

(declare-fun Unit!52049 () Unit!52032)

(assert (=> b!1566504 (= e!873162 Unit!52049)))

(declare-fun b!1566505 () Bool)

(assert (=> b!1566505 (= e!873161 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672655) (_1!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(assert (= (and d!163395 c!144405) b!1566503))

(assert (= (and d!163395 (not c!144405)) b!1566504))

(assert (= (and d!163395 (not res!1070691)) b!1566505))

(declare-fun m!1441533 () Bool)

(assert (=> d!163395 m!1441533))

(declare-fun m!1441535 () Bool)

(assert (=> b!1566503 m!1441535))

(assert (=> b!1566503 m!1441299))

(assert (=> b!1566503 m!1441299))

(declare-fun m!1441537 () Bool)

(assert (=> b!1566503 m!1441537))

(assert (=> b!1566505 m!1441299))

(assert (=> b!1566505 m!1441299))

(assert (=> b!1566505 m!1441537))

(assert (=> d!163277 d!163395))

(declare-fun e!873164 () Option!869)

(declare-fun b!1566508 () Bool)

(assert (=> b!1566508 (= e!873164 (getValueByKey!793 (t!51530 lt!672654) (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun b!1566509 () Bool)

(assert (=> b!1566509 (= e!873164 None!867)))

(declare-fun b!1566506 () Bool)

(declare-fun e!873163 () Option!869)

(assert (=> b!1566506 (= e!873163 (Some!868 (_2!12632 (h!38071 lt!672654))))))

(declare-fun b!1566507 () Bool)

(assert (=> b!1566507 (= e!873163 e!873164)))

(declare-fun c!144407 () Bool)

(assert (=> b!1566507 (= c!144407 (and ((_ is Cons!36625) lt!672654) (not (= (_1!12632 (h!38071 lt!672654)) (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))))

(declare-fun c!144406 () Bool)

(declare-fun d!163397 () Bool)

(assert (=> d!163397 (= c!144406 (and ((_ is Cons!36625) lt!672654) (= (_1!12632 (h!38071 lt!672654)) (_1!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(assert (=> d!163397 (= (getValueByKey!793 lt!672654 (_1!12632 (tuple2!25243 lt!672610 lt!672612))) e!873163)))

(assert (= (and d!163397 c!144406) b!1566506))

(assert (= (and d!163397 (not c!144406)) b!1566507))

(assert (= (and b!1566507 c!144407) b!1566508))

(assert (= (and b!1566507 (not c!144407)) b!1566509))

(declare-fun m!1441539 () Bool)

(assert (=> b!1566508 m!1441539))

(assert (=> d!163277 d!163397))

(declare-fun d!163399 () Bool)

(assert (=> d!163399 (= (getValueByKey!793 lt!672654 (_1!12632 (tuple2!25243 lt!672610 lt!672612))) (Some!868 (_2!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun lt!672732 () Unit!52032)

(assert (=> d!163399 (= lt!672732 (choose!2077 lt!672654 (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun e!873165 () Bool)

(assert (=> d!163399 e!873165))

(declare-fun res!1070692 () Bool)

(assert (=> d!163399 (=> (not res!1070692) (not e!873165))))

(assert (=> d!163399 (= res!1070692 (isStrictlySorted!986 lt!672654))))

(assert (=> d!163399 (= (lemmaContainsTupThenGetReturnValue!387 lt!672654 (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612))) lt!672732)))

(declare-fun b!1566510 () Bool)

(declare-fun res!1070693 () Bool)

(assert (=> b!1566510 (=> (not res!1070693) (not e!873165))))

(assert (=> b!1566510 (= res!1070693 (containsKey!851 lt!672654 (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun b!1566511 () Bool)

(assert (=> b!1566511 (= e!873165 (contains!10348 lt!672654 (tuple2!25243 (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(assert (= (and d!163399 res!1070692) b!1566510))

(assert (= (and b!1566510 res!1070693) b!1566511))

(assert (=> d!163399 m!1441293))

(declare-fun m!1441541 () Bool)

(assert (=> d!163399 m!1441541))

(declare-fun m!1441543 () Bool)

(assert (=> d!163399 m!1441543))

(declare-fun m!1441545 () Bool)

(assert (=> b!1566510 m!1441545))

(declare-fun m!1441547 () Bool)

(assert (=> b!1566511 m!1441547))

(assert (=> d!163277 d!163399))

(declare-fun lt!672733 () List!36629)

(declare-fun e!873170 () Bool)

(declare-fun b!1566513 () Bool)

(assert (=> b!1566513 (= e!873170 (contains!10348 lt!672733 (tuple2!25243 (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(declare-fun bm!71908 () Bool)

(declare-fun call!71911 () List!36629)

(declare-fun call!71912 () List!36629)

(assert (=> bm!71908 (= call!71911 call!71912)))

(declare-fun b!1566514 () Bool)

(declare-fun e!873168 () List!36629)

(declare-fun e!873166 () List!36629)

(assert (=> b!1566514 (= e!873168 e!873166)))

(declare-fun c!144409 () Bool)

(assert (=> b!1566514 (= c!144409 (and ((_ is Cons!36625) (toList!11354 lt!672613)) (= (_1!12632 (h!38071 (toList!11354 lt!672613))) (_1!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(declare-fun c!144408 () Bool)

(declare-fun b!1566515 () Bool)

(declare-fun e!873169 () List!36629)

(assert (=> b!1566515 (= e!873169 (ite c!144409 (t!51530 (toList!11354 lt!672613)) (ite c!144408 (Cons!36625 (h!38071 (toList!11354 lt!672613)) (t!51530 (toList!11354 lt!672613))) Nil!36626)))))

(declare-fun b!1566516 () Bool)

(declare-fun res!1070694 () Bool)

(assert (=> b!1566516 (=> (not res!1070694) (not e!873170))))

(assert (=> b!1566516 (= res!1070694 (containsKey!851 lt!672733 (_1!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun b!1566517 () Bool)

(assert (=> b!1566517 (= e!873169 (insertStrictlySorted!577 (t!51530 (toList!11354 lt!672613)) (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612))))))

(declare-fun b!1566518 () Bool)

(declare-fun e!873167 () List!36629)

(declare-fun call!71913 () List!36629)

(assert (=> b!1566518 (= e!873167 call!71913)))

(declare-fun c!144411 () Bool)

(declare-fun bm!71909 () Bool)

(assert (=> bm!71909 (= call!71912 ($colon$colon!987 e!873169 (ite c!144411 (h!38071 (toList!11354 lt!672613)) (tuple2!25243 (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612))))))))

(declare-fun c!144410 () Bool)

(assert (=> bm!71909 (= c!144410 c!144411)))

(declare-fun d!163401 () Bool)

(assert (=> d!163401 e!873170))

(declare-fun res!1070695 () Bool)

(assert (=> d!163401 (=> (not res!1070695) (not e!873170))))

(assert (=> d!163401 (= res!1070695 (isStrictlySorted!986 lt!672733))))

(assert (=> d!163401 (= lt!672733 e!873168)))

(assert (=> d!163401 (= c!144411 (and ((_ is Cons!36625) (toList!11354 lt!672613)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672613))) (_1!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(assert (=> d!163401 (isStrictlySorted!986 (toList!11354 lt!672613))))

(assert (=> d!163401 (= (insertStrictlySorted!577 (toList!11354 lt!672613) (_1!12632 (tuple2!25243 lt!672610 lt!672612)) (_2!12632 (tuple2!25243 lt!672610 lt!672612))) lt!672733)))

(declare-fun b!1566512 () Bool)

(assert (=> b!1566512 (= e!873168 call!71912)))

(declare-fun b!1566519 () Bool)

(assert (=> b!1566519 (= c!144408 (and ((_ is Cons!36625) (toList!11354 lt!672613)) (bvsgt (_1!12632 (h!38071 (toList!11354 lt!672613))) (_1!12632 (tuple2!25243 lt!672610 lt!672612)))))))

(assert (=> b!1566519 (= e!873166 e!873167)))

(declare-fun b!1566520 () Bool)

(assert (=> b!1566520 (= e!873167 call!71913)))

(declare-fun bm!71910 () Bool)

(assert (=> bm!71910 (= call!71913 call!71911)))

(declare-fun b!1566521 () Bool)

(assert (=> b!1566521 (= e!873166 call!71911)))

(assert (= (and d!163401 c!144411) b!1566512))

(assert (= (and d!163401 (not c!144411)) b!1566514))

(assert (= (and b!1566514 c!144409) b!1566521))

(assert (= (and b!1566514 (not c!144409)) b!1566519))

(assert (= (and b!1566519 c!144408) b!1566520))

(assert (= (and b!1566519 (not c!144408)) b!1566518))

(assert (= (or b!1566520 b!1566518) bm!71910))

(assert (= (or b!1566521 bm!71910) bm!71908))

(assert (= (or b!1566512 bm!71908) bm!71909))

(assert (= (and bm!71909 c!144410) b!1566517))

(assert (= (and bm!71909 (not c!144410)) b!1566515))

(assert (= (and d!163401 res!1070695) b!1566516))

(assert (= (and b!1566516 res!1070694) b!1566513))

(declare-fun m!1441549 () Bool)

(assert (=> b!1566513 m!1441549))

(declare-fun m!1441551 () Bool)

(assert (=> b!1566516 m!1441551))

(declare-fun m!1441553 () Bool)

(assert (=> bm!71909 m!1441553))

(declare-fun m!1441555 () Bool)

(assert (=> d!163401 m!1441555))

(declare-fun m!1441557 () Bool)

(assert (=> d!163401 m!1441557))

(declare-fun m!1441559 () Bool)

(assert (=> b!1566517 m!1441559))

(assert (=> d!163277 d!163401))

(declare-fun d!163403 () Bool)

(declare-fun res!1070696 () Bool)

(declare-fun e!873171 () Bool)

(assert (=> d!163403 (=> res!1070696 e!873171)))

(assert (=> d!163403 (= res!1070696 (and ((_ is Cons!36625) lt!672629) (= (_1!12632 (h!38071 lt!672629)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163403 (= (containsKey!851 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) e!873171)))

(declare-fun b!1566522 () Bool)

(declare-fun e!873172 () Bool)

(assert (=> b!1566522 (= e!873171 e!873172)))

(declare-fun res!1070697 () Bool)

(assert (=> b!1566522 (=> (not res!1070697) (not e!873172))))

(assert (=> b!1566522 (= res!1070697 (and (or (not ((_ is Cons!36625) lt!672629)) (bvsle (_1!12632 (h!38071 lt!672629)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) ((_ is Cons!36625) lt!672629) (bvslt (_1!12632 (h!38071 lt!672629)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun b!1566523 () Bool)

(assert (=> b!1566523 (= e!873172 (containsKey!851 (t!51530 lt!672629) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (= (and d!163403 (not res!1070696)) b!1566522))

(assert (= (and b!1566522 res!1070697) b!1566523))

(declare-fun m!1441561 () Bool)

(assert (=> b!1566523 m!1441561))

(assert (=> b!1566328 d!163403))

(declare-fun d!163405 () Bool)

(declare-fun e!873173 () Bool)

(assert (=> d!163405 e!873173))

(declare-fun res!1070698 () Bool)

(assert (=> d!163405 (=> res!1070698 e!873173)))

(declare-fun lt!672735 () Bool)

(assert (=> d!163405 (= res!1070698 (not lt!672735))))

(declare-fun lt!672736 () Bool)

(assert (=> d!163405 (= lt!672735 lt!672736)))

(declare-fun lt!672737 () Unit!52032)

(declare-fun e!873174 () Unit!52032)

(assert (=> d!163405 (= lt!672737 e!873174)))

(declare-fun c!144412 () Bool)

(assert (=> d!163405 (= c!144412 lt!672736)))

(assert (=> d!163405 (= lt!672736 (containsKey!851 (toList!11354 lt!672637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163405 (= (contains!10345 lt!672637 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672735)))

(declare-fun b!1566524 () Bool)

(declare-fun lt!672734 () Unit!52032)

(assert (=> b!1566524 (= e!873174 lt!672734)))

(assert (=> b!1566524 (= lt!672734 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566524 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566525 () Bool)

(declare-fun Unit!52050 () Unit!52032)

(assert (=> b!1566525 (= e!873174 Unit!52050)))

(declare-fun b!1566526 () Bool)

(assert (=> b!1566526 (= e!873173 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163405 c!144412) b!1566524))

(assert (= (and d!163405 (not c!144412)) b!1566525))

(assert (= (and d!163405 (not res!1070698)) b!1566526))

(declare-fun m!1441563 () Bool)

(assert (=> d!163405 m!1441563))

(declare-fun m!1441565 () Bool)

(assert (=> b!1566524 m!1441565))

(declare-fun m!1441567 () Bool)

(assert (=> b!1566524 m!1441567))

(assert (=> b!1566524 m!1441567))

(declare-fun m!1441569 () Bool)

(assert (=> b!1566524 m!1441569))

(assert (=> b!1566526 m!1441567))

(assert (=> b!1566526 m!1441567))

(assert (=> b!1566526 m!1441569))

(assert (=> b!1566269 d!163405))

(assert (=> b!1566291 d!163323))

(declare-fun d!163407 () Bool)

(assert (=> d!163407 (= (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615)) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615))))))

(declare-fun bs!45080 () Bool)

(assert (= bs!45080 d!163407))

(assert (=> bs!45080 m!1441307))

(declare-fun m!1441571 () Bool)

(assert (=> bs!45080 m!1441571))

(assert (=> b!1566315 d!163407))

(declare-fun b!1566529 () Bool)

(declare-fun e!873176 () Option!869)

(assert (=> b!1566529 (= e!873176 (getValueByKey!793 (t!51530 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))) lt!672615))))

(declare-fun b!1566530 () Bool)

(assert (=> b!1566530 (= e!873176 None!867)))

(declare-fun b!1566527 () Bool)

(declare-fun e!873175 () Option!869)

(assert (=> b!1566527 (= e!873175 (Some!868 (_2!12632 (h!38071 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))))))))

(declare-fun b!1566528 () Bool)

(assert (=> b!1566528 (= e!873175 e!873176)))

(declare-fun c!144414 () Bool)

(assert (=> b!1566528 (= c!144414 (and ((_ is Cons!36625) (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))) (not (= (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))))) lt!672615))))))

(declare-fun c!144413 () Bool)

(declare-fun d!163409 () Bool)

(assert (=> d!163409 (= c!144413 (and ((_ is Cons!36625) (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))) (= (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))))) lt!672615)))))

(assert (=> d!163409 (= (getValueByKey!793 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615) e!873175)))

(assert (= (and d!163409 c!144413) b!1566527))

(assert (= (and d!163409 (not c!144413)) b!1566528))

(assert (= (and b!1566528 c!144414) b!1566529))

(assert (= (and b!1566528 (not c!144414)) b!1566530))

(declare-fun m!1441573 () Bool)

(assert (=> b!1566529 m!1441573))

(assert (=> b!1566315 d!163409))

(declare-fun d!163411 () Bool)

(declare-fun res!1070699 () Bool)

(declare-fun e!873177 () Bool)

(assert (=> d!163411 (=> res!1070699 e!873177)))

(assert (=> d!163411 (= res!1070699 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (= (_1!12632 (h!38071 (toList!11354 lt!672614))) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!163411 (= (containsKey!851 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) e!873177)))

(declare-fun b!1566531 () Bool)

(declare-fun e!873178 () Bool)

(assert (=> b!1566531 (= e!873177 e!873178)))

(declare-fun res!1070700 () Bool)

(assert (=> b!1566531 (=> (not res!1070700) (not e!873178))))

(assert (=> b!1566531 (= res!1070700 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672614))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672614))) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) ((_ is Cons!36625) (toList!11354 lt!672614)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672614))) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(declare-fun b!1566532 () Bool)

(assert (=> b!1566532 (= e!873178 (containsKey!851 (t!51530 (toList!11354 lt!672614)) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!163411 (not res!1070699)) b!1566531))

(assert (= (and b!1566531 res!1070700) b!1566532))

(assert (=> b!1566532 m!1441173))

(declare-fun m!1441575 () Bool)

(assert (=> b!1566532 m!1441575))

(assert (=> d!163299 d!163411))

(declare-fun d!163413 () Bool)

(declare-fun lt!672738 () Bool)

(assert (=> d!163413 (= lt!672738 (select (content!810 (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!873179 () Bool)

(assert (=> d!163413 (= lt!672738 e!873179)))

(declare-fun res!1070702 () Bool)

(assert (=> d!163413 (=> (not res!1070702) (not e!873179))))

(assert (=> d!163413 (= res!1070702 ((_ is Cons!36626) (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)))))

(assert (=> d!163413 (= (contains!10347 (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!672738)))

(declare-fun b!1566533 () Bool)

(declare-fun e!873180 () Bool)

(assert (=> b!1566533 (= e!873179 e!873180)))

(declare-fun res!1070701 () Bool)

(assert (=> b!1566533 (=> res!1070701 e!873180)))

(assert (=> b!1566533 (= res!1070701 (= (h!38072 (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1566534 () Bool)

(assert (=> b!1566534 (= e!873180 (contains!10347 (t!51531 (ite c!144308 (Cons!36626 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) Nil!36627) Nil!36627)) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!163413 res!1070702) b!1566533))

(assert (= (and b!1566533 (not res!1070701)) b!1566534))

(declare-fun m!1441577 () Bool)

(assert (=> d!163413 m!1441577))

(assert (=> d!163413 m!1441253))

(declare-fun m!1441579 () Bool)

(assert (=> d!163413 m!1441579))

(assert (=> b!1566534 m!1441253))

(declare-fun m!1441581 () Bool)

(assert (=> b!1566534 m!1441581))

(assert (=> b!1566379 d!163413))

(declare-fun d!163415 () Bool)

(declare-fun res!1070703 () Bool)

(declare-fun e!873181 () Bool)

(assert (=> d!163415 (=> res!1070703 e!873181)))

(assert (=> d!163415 (= res!1070703 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (= (_1!12632 (h!38071 (toList!11354 lt!672614))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163415 (= (containsKey!851 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000) e!873181)))

(declare-fun b!1566535 () Bool)

(declare-fun e!873182 () Bool)

(assert (=> b!1566535 (= e!873181 e!873182)))

(declare-fun res!1070704 () Bool)

(assert (=> b!1566535 (=> (not res!1070704) (not e!873182))))

(assert (=> b!1566535 (= res!1070704 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672614))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672614))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (toList!11354 lt!672614)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672614))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566536 () Bool)

(assert (=> b!1566536 (= e!873182 (containsKey!851 (t!51530 (toList!11354 lt!672614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163415 (not res!1070703)) b!1566535))

(assert (= (and b!1566535 res!1070704) b!1566536))

(declare-fun m!1441583 () Bool)

(assert (=> b!1566536 m!1441583))

(assert (=> d!163297 d!163415))

(declare-fun d!163417 () Bool)

(declare-fun res!1070705 () Bool)

(declare-fun e!873183 () Bool)

(assert (=> d!163417 (=> res!1070705 e!873183)))

(assert (=> d!163417 (= res!1070705 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163417 (= (containsKey!851 (t!51530 (toList!11354 lt!672551)) #b1000000000000000000000000000000000000000000000000000000000000000) e!873183)))

(declare-fun b!1566537 () Bool)

(declare-fun e!873184 () Bool)

(assert (=> b!1566537 (= e!873183 e!873184)))

(declare-fun res!1070706 () Bool)

(assert (=> b!1566537 (=> (not res!1070706) (not e!873184))))

(assert (=> b!1566537 (= res!1070706 (and (or (not ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551)))) (bvsle (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (bvslt (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566538 () Bool)

(assert (=> b!1566538 (= e!873184 (containsKey!851 (t!51530 (t!51530 (toList!11354 lt!672551))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163417 (not res!1070705)) b!1566537))

(assert (= (and b!1566537 res!1070706) b!1566538))

(declare-fun m!1441585 () Bool)

(assert (=> b!1566538 m!1441585))

(assert (=> b!1566361 d!163417))

(declare-fun d!163419 () Bool)

(declare-fun e!873185 () Bool)

(assert (=> d!163419 e!873185))

(declare-fun res!1070708 () Bool)

(assert (=> d!163419 (=> (not res!1070708) (not e!873185))))

(declare-fun lt!672741 () ListLongMap!22677)

(assert (=> d!163419 (= res!1070708 (contains!10345 lt!672741 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!672740 () List!36629)

(assert (=> d!163419 (= lt!672741 (ListLongMap!22678 lt!672740))))

(declare-fun lt!672742 () Unit!52032)

(declare-fun lt!672739 () Unit!52032)

(assert (=> d!163419 (= lt!672742 lt!672739)))

(assert (=> d!163419 (= (getValueByKey!793 lt!672740 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163419 (= lt!672739 (lemmaContainsTupThenGetReturnValue!387 lt!672740 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163419 (= lt!672740 (insertStrictlySorted!577 (toList!11354 call!71892) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163419 (= (+!5084 call!71892 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!672741)))

(declare-fun b!1566539 () Bool)

(declare-fun res!1070707 () Bool)

(assert (=> b!1566539 (=> (not res!1070707) (not e!873185))))

(assert (=> b!1566539 (= res!1070707 (= (getValueByKey!793 (toList!11354 lt!672741) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1566540 () Bool)

(assert (=> b!1566540 (= e!873185 (contains!10348 (toList!11354 lt!672741) (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163419 res!1070708) b!1566539))

(assert (= (and b!1566539 res!1070707) b!1566540))

(declare-fun m!1441587 () Bool)

(assert (=> d!163419 m!1441587))

(declare-fun m!1441589 () Bool)

(assert (=> d!163419 m!1441589))

(declare-fun m!1441591 () Bool)

(assert (=> d!163419 m!1441591))

(declare-fun m!1441593 () Bool)

(assert (=> d!163419 m!1441593))

(declare-fun m!1441595 () Bool)

(assert (=> b!1566539 m!1441595))

(declare-fun m!1441597 () Bool)

(assert (=> b!1566540 m!1441597))

(assert (=> b!1566270 d!163419))

(declare-fun d!163421 () Bool)

(declare-fun e!873186 () Bool)

(assert (=> d!163421 e!873186))

(declare-fun res!1070710 () Bool)

(assert (=> d!163421 (=> (not res!1070710) (not e!873186))))

(declare-fun lt!672745 () ListLongMap!22677)

(assert (=> d!163421 (= res!1070710 (contains!10345 lt!672745 (_1!12632 (tuple2!25243 lt!672633 lt!672635))))))

(declare-fun lt!672744 () List!36629)

(assert (=> d!163421 (= lt!672745 (ListLongMap!22678 lt!672744))))

(declare-fun lt!672746 () Unit!52032)

(declare-fun lt!672743 () Unit!52032)

(assert (=> d!163421 (= lt!672746 lt!672743)))

(assert (=> d!163421 (= (getValueByKey!793 lt!672744 (_1!12632 (tuple2!25243 lt!672633 lt!672635))) (Some!868 (_2!12632 (tuple2!25243 lt!672633 lt!672635))))))

(assert (=> d!163421 (= lt!672743 (lemmaContainsTupThenGetReturnValue!387 lt!672744 (_1!12632 (tuple2!25243 lt!672633 lt!672635)) (_2!12632 (tuple2!25243 lt!672633 lt!672635))))))

(assert (=> d!163421 (= lt!672744 (insertStrictlySorted!577 (toList!11354 lt!672636) (_1!12632 (tuple2!25243 lt!672633 lt!672635)) (_2!12632 (tuple2!25243 lt!672633 lt!672635))))))

(assert (=> d!163421 (= (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635)) lt!672745)))

(declare-fun b!1566541 () Bool)

(declare-fun res!1070709 () Bool)

(assert (=> b!1566541 (=> (not res!1070709) (not e!873186))))

(assert (=> b!1566541 (= res!1070709 (= (getValueByKey!793 (toList!11354 lt!672745) (_1!12632 (tuple2!25243 lt!672633 lt!672635))) (Some!868 (_2!12632 (tuple2!25243 lt!672633 lt!672635)))))))

(declare-fun b!1566542 () Bool)

(assert (=> b!1566542 (= e!873186 (contains!10348 (toList!11354 lt!672745) (tuple2!25243 lt!672633 lt!672635)))))

(assert (= (and d!163421 res!1070710) b!1566541))

(assert (= (and b!1566541 res!1070709) b!1566542))

(declare-fun m!1441599 () Bool)

(assert (=> d!163421 m!1441599))

(declare-fun m!1441601 () Bool)

(assert (=> d!163421 m!1441601))

(declare-fun m!1441603 () Bool)

(assert (=> d!163421 m!1441603))

(declare-fun m!1441605 () Bool)

(assert (=> d!163421 m!1441605))

(declare-fun m!1441607 () Bool)

(assert (=> b!1566541 m!1441607))

(declare-fun m!1441609 () Bool)

(assert (=> b!1566542 m!1441609))

(assert (=> b!1566270 d!163421))

(declare-fun d!163423 () Bool)

(assert (=> d!163423 (not (contains!10345 (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635)) lt!672638))))

(declare-fun lt!672747 () Unit!52032)

(assert (=> d!163423 (= lt!672747 (choose!2075 lt!672636 lt!672633 lt!672635 lt!672638))))

(declare-fun e!873187 () Bool)

(assert (=> d!163423 e!873187))

(declare-fun res!1070711 () Bool)

(assert (=> d!163423 (=> (not res!1070711) (not e!873187))))

(assert (=> d!163423 (= res!1070711 (not (contains!10345 lt!672636 lt!672638)))))

(assert (=> d!163423 (= (addStillNotContains!574 lt!672636 lt!672633 lt!672635 lt!672638) lt!672747)))

(declare-fun b!1566543 () Bool)

(assert (=> b!1566543 (= e!873187 (not (= lt!672633 lt!672638)))))

(assert (= (and d!163423 res!1070711) b!1566543))

(assert (=> d!163423 m!1441229))

(assert (=> d!163423 m!1441229))

(assert (=> d!163423 m!1441231))

(declare-fun m!1441611 () Bool)

(assert (=> d!163423 m!1441611))

(declare-fun m!1441613 () Bool)

(assert (=> d!163423 m!1441613))

(assert (=> b!1566270 d!163423))

(declare-fun d!163425 () Bool)

(declare-fun e!873188 () Bool)

(assert (=> d!163425 e!873188))

(declare-fun res!1070712 () Bool)

(assert (=> d!163425 (=> res!1070712 e!873188)))

(declare-fun lt!672749 () Bool)

(assert (=> d!163425 (= res!1070712 (not lt!672749))))

(declare-fun lt!672750 () Bool)

(assert (=> d!163425 (= lt!672749 lt!672750)))

(declare-fun lt!672751 () Unit!52032)

(declare-fun e!873189 () Unit!52032)

(assert (=> d!163425 (= lt!672751 e!873189)))

(declare-fun c!144415 () Bool)

(assert (=> d!163425 (= c!144415 lt!672750)))

(assert (=> d!163425 (= lt!672750 (containsKey!851 (toList!11354 (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635))) lt!672638))))

(assert (=> d!163425 (= (contains!10345 (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635)) lt!672638) lt!672749)))

(declare-fun b!1566544 () Bool)

(declare-fun lt!672748 () Unit!52032)

(assert (=> b!1566544 (= e!873189 lt!672748)))

(assert (=> b!1566544 (= lt!672748 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635))) lt!672638))))

(assert (=> b!1566544 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635))) lt!672638))))

(declare-fun b!1566545 () Bool)

(declare-fun Unit!52051 () Unit!52032)

(assert (=> b!1566545 (= e!873189 Unit!52051)))

(declare-fun b!1566546 () Bool)

(assert (=> b!1566546 (= e!873188 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672636 (tuple2!25243 lt!672633 lt!672635))) lt!672638)))))

(assert (= (and d!163425 c!144415) b!1566544))

(assert (= (and d!163425 (not c!144415)) b!1566545))

(assert (= (and d!163425 (not res!1070712)) b!1566546))

(declare-fun m!1441615 () Bool)

(assert (=> d!163425 m!1441615))

(declare-fun m!1441617 () Bool)

(assert (=> b!1566544 m!1441617))

(declare-fun m!1441619 () Bool)

(assert (=> b!1566544 m!1441619))

(assert (=> b!1566544 m!1441619))

(declare-fun m!1441621 () Bool)

(assert (=> b!1566544 m!1441621))

(assert (=> b!1566546 m!1441619))

(assert (=> b!1566546 m!1441619))

(assert (=> b!1566546 m!1441621))

(assert (=> b!1566270 d!163425))

(declare-fun d!163427 () Bool)

(declare-fun c!144416 () Bool)

(assert (=> d!163427 (= c!144416 ((_ is ValueCellFull!18450) (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun e!873190 () V!60155)

(assert (=> d!163427 (= (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!873190)))

(declare-fun b!1566547 () Bool)

(assert (=> b!1566547 (= e!873190 (get!26364 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566548 () Bool)

(assert (=> b!1566548 (= e!873190 (get!26365 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163427 c!144416) b!1566547))

(assert (= (and d!163427 (not c!144416)) b!1566548))

(assert (=> b!1566547 m!1441221))

(assert (=> b!1566547 m!1441065))

(declare-fun m!1441623 () Bool)

(assert (=> b!1566547 m!1441623))

(assert (=> b!1566548 m!1441221))

(assert (=> b!1566548 m!1441065))

(declare-fun m!1441625 () Bool)

(assert (=> b!1566548 m!1441625))

(assert (=> b!1566270 d!163427))

(declare-fun d!163429 () Bool)

(declare-fun res!1070713 () Bool)

(declare-fun e!873191 () Bool)

(assert (=> d!163429 (=> res!1070713 e!873191)))

(assert (=> d!163429 (= res!1070713 (and ((_ is Cons!36625) (toList!11354 lt!672553)) (= (_1!12632 (h!38071 (toList!11354 lt!672553))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163429 (= (containsKey!851 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000) e!873191)))

(declare-fun b!1566549 () Bool)

(declare-fun e!873192 () Bool)

(assert (=> b!1566549 (= e!873191 e!873192)))

(declare-fun res!1070714 () Bool)

(assert (=> b!1566549 (=> (not res!1070714) (not e!873192))))

(assert (=> b!1566549 (= res!1070714 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672553))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672553))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (toList!11354 lt!672553)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672553))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566550 () Bool)

(assert (=> b!1566550 (= e!873192 (containsKey!851 (t!51530 (toList!11354 lt!672553)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163429 (not res!1070713)) b!1566549))

(assert (= (and b!1566549 res!1070714) b!1566550))

(declare-fun m!1441627 () Bool)

(assert (=> b!1566550 m!1441627))

(assert (=> d!163319 d!163429))

(declare-fun b!1566569 () Bool)

(declare-fun lt!672756 () SeekEntryResult!13526)

(assert (=> b!1566569 (and (bvsge (index!56504 lt!672756) #b00000000000000000000000000000000) (bvslt (index!56504 lt!672756) (size!51041 _keys!637)))))

(declare-fun res!1070722 () Bool)

(assert (=> b!1566569 (= res!1070722 (= (select (arr!50491 _keys!637) (index!56504 lt!672756)) (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!873206 () Bool)

(assert (=> b!1566569 (=> res!1070722 e!873206)))

(declare-fun e!873204 () Bool)

(assert (=> b!1566569 (= e!873204 e!873206)))

(declare-fun b!1566570 () Bool)

(declare-fun e!873207 () SeekEntryResult!13526)

(assert (=> b!1566570 (= e!873207 (Intermediate!13526 false (toIndex!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000))))

(declare-fun b!1566571 () Bool)

(declare-fun e!873205 () Bool)

(assert (=> b!1566571 (= e!873205 (bvsge (x!140749 lt!672756) #b01111111111111111111111111111110))))

(declare-fun b!1566572 () Bool)

(assert (=> b!1566572 (= e!873205 e!873204)))

(declare-fun res!1070723 () Bool)

(assert (=> b!1566572 (= res!1070723 (and ((_ is Intermediate!13526) lt!672756) (not (undefined!14338 lt!672756)) (bvslt (x!140749 lt!672756) #b01111111111111111111111111111110) (bvsge (x!140749 lt!672756) #b00000000000000000000000000000000) (bvsge (x!140749 lt!672756) #b00000000000000000000000000000000)))))

(assert (=> b!1566572 (=> (not res!1070723) (not e!873204))))

(declare-fun b!1566574 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1566574 (= e!873207 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000 mask!947) (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1566575 () Bool)

(declare-fun e!873203 () SeekEntryResult!13526)

(assert (=> b!1566575 (= e!873203 (Intermediate!13526 true (toIndex!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000))))

(declare-fun b!1566576 () Bool)

(assert (=> b!1566576 (and (bvsge (index!56504 lt!672756) #b00000000000000000000000000000000) (bvslt (index!56504 lt!672756) (size!51041 _keys!637)))))

(assert (=> b!1566576 (= e!873206 (= (select (arr!50491 _keys!637) (index!56504 lt!672756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566577 () Bool)

(assert (=> b!1566577 (and (bvsge (index!56504 lt!672756) #b00000000000000000000000000000000) (bvslt (index!56504 lt!672756) (size!51041 _keys!637)))))

(declare-fun res!1070721 () Bool)

(assert (=> b!1566577 (= res!1070721 (= (select (arr!50491 _keys!637) (index!56504 lt!672756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566577 (=> res!1070721 e!873206)))

(declare-fun d!163431 () Bool)

(assert (=> d!163431 e!873205))

(declare-fun c!144423 () Bool)

(assert (=> d!163431 (= c!144423 (and ((_ is Intermediate!13526) lt!672756) (undefined!14338 lt!672756)))))

(assert (=> d!163431 (= lt!672756 e!873203)))

(declare-fun c!144425 () Bool)

(assert (=> d!163431 (= c!144425 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!672757 () (_ BitVec 64))

(assert (=> d!163431 (= lt!672757 (select (arr!50491 _keys!637) (toIndex!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) mask!947)))))

(assert (=> d!163431 (validMask!0 mask!947)))

(assert (=> d!163431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672756)))

(declare-fun b!1566573 () Bool)

(assert (=> b!1566573 (= e!873203 e!873207)))

(declare-fun c!144424 () Bool)

(assert (=> b!1566573 (= c!144424 (or (= lt!672757 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)) (= (bvadd lt!672757 lt!672757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163431 c!144425) b!1566575))

(assert (= (and d!163431 (not c!144425)) b!1566573))

(assert (= (and b!1566573 c!144424) b!1566570))

(assert (= (and b!1566573 (not c!144424)) b!1566574))

(assert (= (and d!163431 c!144423) b!1566571))

(assert (= (and d!163431 (not c!144423)) b!1566572))

(assert (= (and b!1566572 res!1070723) b!1566569))

(assert (= (and b!1566569 (not res!1070722)) b!1566577))

(assert (= (and b!1566577 (not res!1070721)) b!1566576))

(assert (=> d!163431 m!1441387))

(declare-fun m!1441629 () Bool)

(assert (=> d!163431 m!1441629))

(assert (=> d!163431 m!1441057))

(declare-fun m!1441631 () Bool)

(assert (=> b!1566577 m!1441631))

(assert (=> b!1566574 m!1441387))

(declare-fun m!1441633 () Bool)

(assert (=> b!1566574 m!1441633))

(assert (=> b!1566574 m!1441633))

(assert (=> b!1566574 m!1441123))

(declare-fun m!1441635 () Bool)

(assert (=> b!1566574 m!1441635))

(assert (=> b!1566576 m!1441631))

(assert (=> b!1566569 m!1441631))

(assert (=> d!163311 d!163431))

(declare-fun d!163433 () Bool)

(declare-fun lt!672763 () (_ BitVec 32))

(declare-fun lt!672762 () (_ BitVec 32))

(assert (=> d!163433 (= lt!672763 (bvmul (bvxor lt!672762 (bvlshr lt!672762 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!163433 (= lt!672762 ((_ extract 31 0) (bvand (bvxor (select (arr!50491 _keys!637) #b00000000000000000000000000000000) (bvlshr (select (arr!50491 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!163433 (and (bvsge mask!947 #b00000000000000000000000000000000) (let ((res!1070724 (let ((h!38075 ((_ extract 31 0) (bvand (bvxor (select (arr!50491 _keys!637) #b00000000000000000000000000000000) (bvlshr (select (arr!50491 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!140759 (bvmul (bvxor h!38075 (bvlshr h!38075 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!140759 (bvlshr x!140759 #b00000000000000000000000000001101)) mask!947))))) (and (bvslt res!1070724 (bvadd mask!947 #b00000000000000000000000000000001)) (bvsge res!1070724 #b00000000000000000000000000000000))))))

(assert (=> d!163433 (= (toIndex!0 (select (arr!50491 _keys!637) #b00000000000000000000000000000000) mask!947) (bvand (bvxor lt!672763 (bvlshr lt!672763 #b00000000000000000000000000001101)) mask!947))))

(assert (=> d!163311 d!163433))

(assert (=> d!163311 d!163225))

(assert (=> d!163321 d!163293))

(assert (=> d!163321 d!163295))

(declare-fun d!163435 () Bool)

(assert (=> d!163435 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163435 true))

(declare-fun _$12!489 () Unit!52032)

(assert (=> d!163435 (= (choose!2076 (toList!11354 lt!672551) #b1000000000000000000000000000000000000000000000000000000000000000) _$12!489)))

(declare-fun bs!45081 () Bool)

(assert (= bs!45081 d!163435))

(assert (=> bs!45081 m!1441191))

(assert (=> bs!45081 m!1441191))

(assert (=> bs!45081 m!1441193))

(assert (=> d!163321 d!163435))

(declare-fun d!163437 () Bool)

(declare-fun res!1070729 () Bool)

(declare-fun e!873212 () Bool)

(assert (=> d!163437 (=> res!1070729 e!873212)))

(assert (=> d!163437 (= res!1070729 (or ((_ is Nil!36626) (toList!11354 lt!672551)) ((_ is Nil!36626) (t!51530 (toList!11354 lt!672551)))))))

(assert (=> d!163437 (= (isStrictlySorted!986 (toList!11354 lt!672551)) e!873212)))

(declare-fun b!1566582 () Bool)

(declare-fun e!873213 () Bool)

(assert (=> b!1566582 (= e!873212 e!873213)))

(declare-fun res!1070730 () Bool)

(assert (=> b!1566582 (=> (not res!1070730) (not e!873213))))

(assert (=> b!1566582 (= res!1070730 (bvslt (_1!12632 (h!38071 (toList!11354 lt!672551))) (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551))))))))

(declare-fun b!1566583 () Bool)

(assert (=> b!1566583 (= e!873213 (isStrictlySorted!986 (t!51530 (toList!11354 lt!672551))))))

(assert (= (and d!163437 (not res!1070729)) b!1566582))

(assert (= (and b!1566582 res!1070730) b!1566583))

(declare-fun m!1441637 () Bool)

(assert (=> b!1566583 m!1441637))

(assert (=> d!163321 d!163437))

(assert (=> b!1566272 d!163385))

(assert (=> d!163269 d!163271))

(assert (=> d!163269 d!163273))

(declare-fun d!163439 () Bool)

(assert (=> d!163439 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)))))

(assert (=> d!163439 true))

(declare-fun _$12!490 () Unit!52032)

(assert (=> d!163439 (= (choose!2076 (toList!11354 lt!672551) (select (arr!50491 _keys!637) from!782)) _$12!490)))

(declare-fun bs!45082 () Bool)

(assert (= bs!45082 d!163439))

(assert (=> bs!45082 m!1441043))

(assert (=> bs!45082 m!1441119))

(assert (=> bs!45082 m!1441119))

(assert (=> bs!45082 m!1441121))

(assert (=> d!163269 d!163439))

(assert (=> d!163269 d!163437))

(declare-fun b!1566586 () Bool)

(declare-fun e!873215 () Option!869)

(assert (=> b!1566586 (= e!873215 (getValueByKey!793 (t!51530 (t!51530 lt!672629)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(declare-fun b!1566587 () Bool)

(assert (=> b!1566587 (= e!873215 None!867)))

(declare-fun b!1566584 () Bool)

(declare-fun e!873214 () Option!869)

(assert (=> b!1566584 (= e!873214 (Some!868 (_2!12632 (h!38071 (t!51530 lt!672629)))))))

(declare-fun b!1566585 () Bool)

(assert (=> b!1566585 (= e!873214 e!873215)))

(declare-fun c!144427 () Bool)

(assert (=> b!1566585 (= c!144427 (and ((_ is Cons!36625) (t!51530 lt!672629)) (not (= (_1!12632 (h!38071 (t!51530 lt!672629))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))))

(declare-fun c!144426 () Bool)

(declare-fun d!163441 () Bool)

(assert (=> d!163441 (= c!144426 (and ((_ is Cons!36625) (t!51530 lt!672629)) (= (_1!12632 (h!38071 (t!51530 lt!672629))) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163441 (= (getValueByKey!793 (t!51530 lt!672629) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) e!873214)))

(assert (= (and d!163441 c!144426) b!1566584))

(assert (= (and d!163441 (not c!144426)) b!1566585))

(assert (= (and b!1566585 c!144427) b!1566586))

(assert (= (and b!1566585 (not c!144427)) b!1566587))

(declare-fun m!1441639 () Bool)

(assert (=> b!1566586 m!1441639))

(assert (=> b!1566322 d!163441))

(declare-fun lt!672764 () Bool)

(declare-fun d!163443 () Bool)

(assert (=> d!163443 (= lt!672764 (select (content!811 (toList!11354 lt!672651)) (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!873217 () Bool)

(assert (=> d!163443 (= lt!672764 e!873217)))

(declare-fun res!1070731 () Bool)

(assert (=> d!163443 (=> (not res!1070731) (not e!873217))))

(assert (=> d!163443 (= res!1070731 ((_ is Cons!36625) (toList!11354 lt!672651)))))

(assert (=> d!163443 (= (contains!10348 (toList!11354 lt!672651) (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!672764)))

(declare-fun b!1566588 () Bool)

(declare-fun e!873216 () Bool)

(assert (=> b!1566588 (= e!873217 e!873216)))

(declare-fun res!1070732 () Bool)

(assert (=> b!1566588 (=> res!1070732 e!873216)))

(assert (=> b!1566588 (= res!1070732 (= (h!38071 (toList!11354 lt!672651)) (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1566589 () Bool)

(assert (=> b!1566589 (= e!873216 (contains!10348 (t!51530 (toList!11354 lt!672651)) (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163443 res!1070731) b!1566588))

(assert (= (and b!1566588 (not res!1070732)) b!1566589))

(declare-fun m!1441641 () Bool)

(assert (=> d!163443 m!1441641))

(declare-fun m!1441643 () Bool)

(assert (=> d!163443 m!1441643))

(declare-fun m!1441645 () Bool)

(assert (=> b!1566589 m!1441645))

(assert (=> b!1566310 d!163443))

(declare-fun lt!672765 () Bool)

(declare-fun d!163445 () Bool)

(assert (=> d!163445 (= lt!672765 (select (content!811 (toList!11354 lt!672655)) (tuple2!25243 lt!672610 lt!672612)))))

(declare-fun e!873219 () Bool)

(assert (=> d!163445 (= lt!672765 e!873219)))

(declare-fun res!1070733 () Bool)

(assert (=> d!163445 (=> (not res!1070733) (not e!873219))))

(assert (=> d!163445 (= res!1070733 ((_ is Cons!36625) (toList!11354 lt!672655)))))

(assert (=> d!163445 (= (contains!10348 (toList!11354 lt!672655) (tuple2!25243 lt!672610 lt!672612)) lt!672765)))

(declare-fun b!1566590 () Bool)

(declare-fun e!873218 () Bool)

(assert (=> b!1566590 (= e!873219 e!873218)))

(declare-fun res!1070734 () Bool)

(assert (=> b!1566590 (=> res!1070734 e!873218)))

(assert (=> b!1566590 (= res!1070734 (= (h!38071 (toList!11354 lt!672655)) (tuple2!25243 lt!672610 lt!672612)))))

(declare-fun b!1566591 () Bool)

(assert (=> b!1566591 (= e!873218 (contains!10348 (t!51530 (toList!11354 lt!672655)) (tuple2!25243 lt!672610 lt!672612)))))

(assert (= (and d!163445 res!1070733) b!1566590))

(assert (= (and b!1566590 (not res!1070734)) b!1566591))

(declare-fun m!1441647 () Bool)

(assert (=> d!163445 m!1441647))

(declare-fun m!1441649 () Bool)

(assert (=> d!163445 m!1441649))

(declare-fun m!1441651 () Bool)

(assert (=> b!1566591 m!1441651))

(assert (=> b!1566312 d!163445))

(declare-fun d!163447 () Bool)

(declare-fun res!1070735 () Bool)

(declare-fun e!873220 () Bool)

(assert (=> d!163447 (=> res!1070735 e!873220)))

(assert (=> d!163447 (= res!1070735 (and ((_ is Cons!36625) lt!672671) (= (_1!12632 (h!38071 lt!672671)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163447 (= (containsKey!851 lt!672671 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) e!873220)))

(declare-fun b!1566592 () Bool)

(declare-fun e!873221 () Bool)

(assert (=> b!1566592 (= e!873220 e!873221)))

(declare-fun res!1070736 () Bool)

(assert (=> b!1566592 (=> (not res!1070736) (not e!873221))))

(assert (=> b!1566592 (= res!1070736 (and (or (not ((_ is Cons!36625) lt!672671)) (bvsle (_1!12632 (h!38071 lt!672671)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) ((_ is Cons!36625) lt!672671) (bvslt (_1!12632 (h!38071 lt!672671)) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun b!1566593 () Bool)

(assert (=> b!1566593 (= e!873221 (containsKey!851 (t!51530 lt!672671) (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (= (and d!163447 (not res!1070735)) b!1566592))

(assert (= (and b!1566592 res!1070736) b!1566593))

(declare-fun m!1441653 () Bool)

(assert (=> b!1566593 m!1441653))

(assert (=> b!1566354 d!163447))

(declare-fun d!163449 () Bool)

(assert (=> d!163449 (= (isEmpty!1148 (toList!11354 lt!672614)) ((_ is Nil!36626) (toList!11354 lt!672614)))))

(assert (=> d!163303 d!163449))

(assert (=> b!1566378 d!163337))

(declare-fun d!163451 () Bool)

(declare-fun res!1070737 () Bool)

(declare-fun e!873222 () Bool)

(assert (=> d!163451 (=> res!1070737 e!873222)))

(assert (=> d!163451 (= res!1070737 (or ((_ is Nil!36626) lt!672671) ((_ is Nil!36626) (t!51530 lt!672671))))))

(assert (=> d!163451 (= (isStrictlySorted!986 lt!672671) e!873222)))

(declare-fun b!1566594 () Bool)

(declare-fun e!873223 () Bool)

(assert (=> b!1566594 (= e!873222 e!873223)))

(declare-fun res!1070738 () Bool)

(assert (=> b!1566594 (=> (not res!1070738) (not e!873223))))

(assert (=> b!1566594 (= res!1070738 (bvslt (_1!12632 (h!38071 lt!672671)) (_1!12632 (h!38071 (t!51530 lt!672671)))))))

(declare-fun b!1566595 () Bool)

(assert (=> b!1566595 (= e!873223 (isStrictlySorted!986 (t!51530 lt!672671)))))

(assert (= (and d!163451 (not res!1070737)) b!1566594))

(assert (= (and b!1566594 res!1070738) b!1566595))

(declare-fun m!1441655 () Bool)

(assert (=> b!1566595 m!1441655))

(assert (=> d!163289 d!163451))

(declare-fun d!163453 () Bool)

(declare-fun res!1070739 () Bool)

(declare-fun e!873224 () Bool)

(assert (=> d!163453 (=> res!1070739 e!873224)))

(assert (=> d!163453 (= res!1070739 (or ((_ is Nil!36626) (toList!11354 lt!672553)) ((_ is Nil!36626) (t!51530 (toList!11354 lt!672553)))))))

(assert (=> d!163453 (= (isStrictlySorted!986 (toList!11354 lt!672553)) e!873224)))

(declare-fun b!1566596 () Bool)

(declare-fun e!873225 () Bool)

(assert (=> b!1566596 (= e!873224 e!873225)))

(declare-fun res!1070740 () Bool)

(assert (=> b!1566596 (=> (not res!1070740) (not e!873225))))

(assert (=> b!1566596 (= res!1070740 (bvslt (_1!12632 (h!38071 (toList!11354 lt!672553))) (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672553))))))))

(declare-fun b!1566597 () Bool)

(assert (=> b!1566597 (= e!873225 (isStrictlySorted!986 (t!51530 (toList!11354 lt!672553))))))

(assert (= (and d!163453 (not res!1070739)) b!1566596))

(assert (= (and b!1566596 res!1070740) b!1566597))

(assert (=> b!1566597 m!1441433))

(assert (=> d!163289 d!163453))

(declare-fun d!163455 () Bool)

(assert (=> d!163455 (= (get!26364 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!22320 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1566259 d!163455))

(declare-fun d!163457 () Bool)

(declare-fun res!1070741 () Bool)

(declare-fun e!873226 () Bool)

(assert (=> d!163457 (=> res!1070741 e!873226)))

(assert (=> d!163457 (= res!1070741 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (= (_1!12632 (h!38071 (toList!11354 lt!672614))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163457 (= (containsKey!851 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000) e!873226)))

(declare-fun b!1566598 () Bool)

(declare-fun e!873227 () Bool)

(assert (=> b!1566598 (= e!873226 e!873227)))

(declare-fun res!1070742 () Bool)

(assert (=> b!1566598 (=> (not res!1070742) (not e!873227))))

(assert (=> b!1566598 (= res!1070742 (and (or (not ((_ is Cons!36625) (toList!11354 lt!672614))) (bvsle (_1!12632 (h!38071 (toList!11354 lt!672614))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (toList!11354 lt!672614)) (bvslt (_1!12632 (h!38071 (toList!11354 lt!672614))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566599 () Bool)

(assert (=> b!1566599 (= e!873227 (containsKey!851 (t!51530 (toList!11354 lt!672614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163457 (not res!1070741)) b!1566598))

(assert (= (and b!1566598 res!1070742) b!1566599))

(declare-fun m!1441657 () Bool)

(assert (=> b!1566599 m!1441657))

(assert (=> d!163301 d!163457))

(declare-fun d!163459 () Bool)

(declare-fun e!873228 () Bool)

(assert (=> d!163459 e!873228))

(declare-fun res!1070743 () Bool)

(assert (=> d!163459 (=> res!1070743 e!873228)))

(declare-fun lt!672767 () Bool)

(assert (=> d!163459 (= res!1070743 (not lt!672767))))

(declare-fun lt!672768 () Bool)

(assert (=> d!163459 (= lt!672767 lt!672768)))

(declare-fun lt!672769 () Unit!52032)

(declare-fun e!873229 () Unit!52032)

(assert (=> d!163459 (= lt!672769 e!873229)))

(declare-fun c!144428 () Bool)

(assert (=> d!163459 (= c!144428 lt!672768)))

(assert (=> d!163459 (= lt!672768 (containsKey!851 (toList!11354 lt!672637) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> d!163459 (= (contains!10345 lt!672637 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) lt!672767)))

(declare-fun b!1566600 () Bool)

(declare-fun lt!672766 () Unit!52032)

(assert (=> b!1566600 (= e!873229 lt!672766)))

(assert (=> b!1566600 (= lt!672766 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672637) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1566600 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672637) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun b!1566601 () Bool)

(declare-fun Unit!52052 () Unit!52032)

(assert (=> b!1566601 (= e!873229 Unit!52052)))

(declare-fun b!1566602 () Bool)

(assert (=> b!1566602 (= e!873228 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672637) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))))

(assert (= (and d!163459 c!144428) b!1566600))

(assert (= (and d!163459 (not c!144428)) b!1566601))

(assert (= (and d!163459 (not res!1070743)) b!1566602))

(assert (=> d!163459 m!1441233))

(declare-fun m!1441659 () Bool)

(assert (=> d!163459 m!1441659))

(assert (=> b!1566600 m!1441233))

(declare-fun m!1441661 () Bool)

(assert (=> b!1566600 m!1441661))

(assert (=> b!1566600 m!1441233))

(declare-fun m!1441663 () Bool)

(assert (=> b!1566600 m!1441663))

(assert (=> b!1566600 m!1441663))

(declare-fun m!1441665 () Bool)

(assert (=> b!1566600 m!1441665))

(assert (=> b!1566602 m!1441233))

(assert (=> b!1566602 m!1441663))

(assert (=> b!1566602 m!1441663))

(assert (=> b!1566602 m!1441665))

(assert (=> b!1566267 d!163459))

(declare-fun d!163461 () Bool)

(assert (=> d!163461 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615))))

(declare-fun lt!672770 () Unit!52032)

(assert (=> d!163461 (= lt!672770 (choose!2076 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615))))

(declare-fun e!873230 () Bool)

(assert (=> d!163461 e!873230))

(declare-fun res!1070744 () Bool)

(assert (=> d!163461 (=> (not res!1070744) (not e!873230))))

(assert (=> d!163461 (= res!1070744 (isStrictlySorted!986 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612)))))))

(assert (=> d!163461 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615) lt!672770)))

(declare-fun b!1566603 () Bool)

(assert (=> b!1566603 (= e!873230 (containsKey!851 (toList!11354 (+!5084 lt!672613 (tuple2!25243 lt!672610 lt!672612))) lt!672615))))

(assert (= (and d!163461 res!1070744) b!1566603))

(assert (=> d!163461 m!1441307))

(assert (=> d!163461 m!1441307))

(assert (=> d!163461 m!1441309))

(declare-fun m!1441667 () Bool)

(assert (=> d!163461 m!1441667))

(declare-fun m!1441669 () Bool)

(assert (=> d!163461 m!1441669))

(assert (=> b!1566603 m!1441303))

(assert (=> b!1566313 d!163461))

(assert (=> b!1566313 d!163407))

(assert (=> b!1566313 d!163409))

(declare-fun d!163463 () Bool)

(declare-fun res!1070745 () Bool)

(declare-fun e!873231 () Bool)

(assert (=> d!163463 (=> res!1070745 e!873231)))

(assert (=> d!163463 (= res!1070745 (= (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!672586))))

(assert (=> d!163463 (= (arrayContainsKey!0 _keys!637 lt!672586 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!873231)))

(declare-fun b!1566604 () Bool)

(declare-fun e!873232 () Bool)

(assert (=> b!1566604 (= e!873231 e!873232)))

(declare-fun res!1070746 () Bool)

(assert (=> b!1566604 (=> (not res!1070746) (not e!873232))))

(assert (=> b!1566604 (= res!1070746 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun b!1566605 () Bool)

(assert (=> b!1566605 (= e!873232 (arrayContainsKey!0 _keys!637 lt!672586 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!163463 (not res!1070745)) b!1566604))

(assert (= (and b!1566604 res!1070746) b!1566605))

(assert (=> d!163463 m!1441253))

(declare-fun m!1441671 () Bool)

(assert (=> b!1566605 m!1441671))

(assert (=> b!1566385 d!163463))

(declare-fun lt!672771 () Bool)

(declare-fun d!163465 () Bool)

(assert (=> d!163465 (= lt!672771 (select (content!811 lt!672629) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun e!873234 () Bool)

(assert (=> d!163465 (= lt!672771 e!873234)))

(declare-fun res!1070747 () Bool)

(assert (=> d!163465 (=> (not res!1070747) (not e!873234))))

(assert (=> d!163465 (= res!1070747 ((_ is Cons!36625) lt!672629))))

(assert (=> d!163465 (= (contains!10348 lt!672629 (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) lt!672771)))

(declare-fun b!1566606 () Bool)

(declare-fun e!873233 () Bool)

(assert (=> b!1566606 (= e!873234 e!873233)))

(declare-fun res!1070748 () Bool)

(assert (=> b!1566606 (=> res!1070748 e!873233)))

(assert (=> b!1566606 (= res!1070748 (= (h!38071 lt!672629) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun b!1566607 () Bool)

(assert (=> b!1566607 (= e!873233 (contains!10348 (t!51530 lt!672629) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (= (and d!163465 res!1070747) b!1566606))

(assert (= (and b!1566606 (not res!1070748)) b!1566607))

(declare-fun m!1441673 () Bool)

(assert (=> d!163465 m!1441673))

(declare-fun m!1441675 () Bool)

(assert (=> d!163465 m!1441675))

(declare-fun m!1441677 () Bool)

(assert (=> b!1566607 m!1441677))

(assert (=> b!1566329 d!163465))

(declare-fun d!163467 () Bool)

(assert (=> d!163467 (= (get!26363 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) (v!22322 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!163247 d!163467))

(declare-fun b!1566610 () Bool)

(declare-fun e!873236 () Option!869)

(assert (=> b!1566610 (= e!873236 (getValueByKey!793 (t!51530 (toList!11354 lt!672614)) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1566611 () Bool)

(assert (=> b!1566611 (= e!873236 None!867)))

(declare-fun b!1566608 () Bool)

(declare-fun e!873235 () Option!869)

(assert (=> b!1566608 (= e!873235 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672614)))))))

(declare-fun b!1566609 () Bool)

(assert (=> b!1566609 (= e!873235 e!873236)))

(declare-fun c!144430 () Bool)

(assert (=> b!1566609 (= c!144430 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672614))) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))))

(declare-fun c!144429 () Bool)

(declare-fun d!163469 () Bool)

(assert (=> d!163469 (= c!144429 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (= (_1!12632 (h!38071 (toList!11354 lt!672614))) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!163469 (= (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) e!873235)))

(assert (= (and d!163469 c!144429) b!1566608))

(assert (= (and d!163469 (not c!144429)) b!1566609))

(assert (= (and b!1566609 c!144430) b!1566610))

(assert (= (and b!1566609 (not c!144430)) b!1566611))

(assert (=> b!1566610 m!1441173))

(declare-fun m!1441679 () Bool)

(assert (=> b!1566610 m!1441679))

(assert (=> d!163247 d!163469))

(declare-fun d!163471 () Bool)

(assert (=> d!163471 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))))

(declare-fun bs!45083 () Bool)

(assert (= bs!45083 d!163471))

(assert (=> bs!45083 m!1441209))

(declare-fun m!1441681 () Bool)

(assert (=> bs!45083 m!1441681))

(assert (=> b!1566371 d!163471))

(assert (=> b!1566371 d!163469))

(assert (=> d!163317 d!163315))

(assert (=> d!163317 d!163241))

(declare-fun d!163473 () Bool)

(declare-fun res!1070749 () Bool)

(declare-fun e!873237 () Bool)

(assert (=> d!163473 (=> res!1070749 e!873237)))

(assert (=> d!163473 (= res!1070749 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> d!163473 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947) e!873237)))

(declare-fun b!1566612 () Bool)

(declare-fun e!873239 () Bool)

(declare-fun call!71914 () Bool)

(assert (=> b!1566612 (= e!873239 call!71914)))

(declare-fun b!1566613 () Bool)

(declare-fun e!873238 () Bool)

(assert (=> b!1566613 (= e!873238 call!71914)))

(declare-fun b!1566614 () Bool)

(assert (=> b!1566614 (= e!873238 e!873239)))

(declare-fun lt!672773 () (_ BitVec 64))

(assert (=> b!1566614 (= lt!672773 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!672774 () Unit!52032)

(assert (=> b!1566614 (= lt!672774 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672773 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1566614 (arrayContainsKey!0 _keys!637 lt!672773 #b00000000000000000000000000000000)))

(declare-fun lt!672772 () Unit!52032)

(assert (=> b!1566614 (= lt!672772 lt!672774)))

(declare-fun res!1070750 () Bool)

(assert (=> b!1566614 (= res!1070750 (= (seekEntryOrOpen!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1566614 (=> (not res!1070750) (not e!873239))))

(declare-fun bm!71911 () Bool)

(assert (=> bm!71911 (= call!71914 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566615 () Bool)

(assert (=> b!1566615 (= e!873237 e!873238)))

(declare-fun c!144431 () Bool)

(assert (=> b!1566615 (= c!144431 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!163473 (not res!1070749)) b!1566615))

(assert (= (and b!1566615 c!144431) b!1566614))

(assert (= (and b!1566615 (not c!144431)) b!1566613))

(assert (= (and b!1566614 res!1070750) b!1566612))

(assert (= (or b!1566612 b!1566613) bm!71911))

(assert (=> b!1566614 m!1441455))

(declare-fun m!1441683 () Bool)

(assert (=> b!1566614 m!1441683))

(declare-fun m!1441685 () Bool)

(assert (=> b!1566614 m!1441685))

(assert (=> b!1566614 m!1441455))

(declare-fun m!1441687 () Bool)

(assert (=> b!1566614 m!1441687))

(declare-fun m!1441689 () Bool)

(assert (=> bm!71911 m!1441689))

(assert (=> b!1566615 m!1441455))

(assert (=> b!1566615 m!1441455))

(assert (=> b!1566615 m!1441457))

(assert (=> bm!71890 d!163473))

(declare-fun d!163475 () Bool)

(assert (=> d!163475 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45084 () Bool)

(assert (= bs!45084 d!163475))

(assert (=> bs!45084 m!1441353))

(declare-fun m!1441691 () Bool)

(assert (=> bs!45084 m!1441691))

(assert (=> b!1566368 d!163475))

(declare-fun b!1566618 () Bool)

(declare-fun e!873241 () Option!869)

(assert (=> b!1566618 (= e!873241 (getValueByKey!793 (t!51530 (toList!11354 lt!672614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566619 () Bool)

(assert (=> b!1566619 (= e!873241 None!867)))

(declare-fun b!1566616 () Bool)

(declare-fun e!873240 () Option!869)

(assert (=> b!1566616 (= e!873240 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672614)))))))

(declare-fun b!1566617 () Bool)

(assert (=> b!1566617 (= e!873240 e!873241)))

(declare-fun c!144433 () Bool)

(assert (=> b!1566617 (= c!144433 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672614))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!163477 () Bool)

(declare-fun c!144432 () Bool)

(assert (=> d!163477 (= c!144432 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (= (_1!12632 (h!38071 (toList!11354 lt!672614))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163477 (= (getValueByKey!793 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000) e!873240)))

(assert (= (and d!163477 c!144432) b!1566616))

(assert (= (and d!163477 (not c!144432)) b!1566617))

(assert (= (and b!1566617 c!144433) b!1566618))

(assert (= (and b!1566617 (not c!144433)) b!1566619))

(declare-fun m!1441693 () Bool)

(assert (=> b!1566618 m!1441693))

(assert (=> b!1566368 d!163477))

(declare-fun d!163479 () Bool)

(assert (=> d!163479 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672775 () Unit!52032)

(assert (=> d!163479 (= lt!672775 (choose!2076 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873242 () Bool)

(assert (=> d!163479 e!873242))

(declare-fun res!1070751 () Bool)

(assert (=> d!163479 (=> (not res!1070751) (not e!873242))))

(assert (=> d!163479 (= res!1070751 (isStrictlySorted!986 (toList!11354 lt!672553)))))

(assert (=> d!163479 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672775)))

(declare-fun b!1566620 () Bool)

(assert (=> b!1566620 (= e!873242 (containsKey!851 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163479 res!1070751) b!1566620))

(assert (=> d!163479 m!1441407))

(assert (=> d!163479 m!1441407))

(assert (=> d!163479 m!1441409))

(declare-fun m!1441695 () Bool)

(assert (=> d!163479 m!1441695))

(assert (=> d!163479 m!1441339))

(assert (=> b!1566620 m!1441403))

(assert (=> b!1566408 d!163479))

(declare-fun d!163481 () Bool)

(assert (=> d!163481 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45085 () Bool)

(assert (= bs!45085 d!163481))

(assert (=> bs!45085 m!1441407))

(declare-fun m!1441697 () Bool)

(assert (=> bs!45085 m!1441697))

(assert (=> b!1566408 d!163481))

(declare-fun b!1566623 () Bool)

(declare-fun e!873244 () Option!869)

(assert (=> b!1566623 (= e!873244 (getValueByKey!793 (t!51530 (toList!11354 lt!672553)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566624 () Bool)

(assert (=> b!1566624 (= e!873244 None!867)))

(declare-fun b!1566621 () Bool)

(declare-fun e!873243 () Option!869)

(assert (=> b!1566621 (= e!873243 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672553)))))))

(declare-fun b!1566622 () Bool)

(assert (=> b!1566622 (= e!873243 e!873244)))

(declare-fun c!144435 () Bool)

(assert (=> b!1566622 (= c!144435 (and ((_ is Cons!36625) (toList!11354 lt!672553)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672553))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!163483 () Bool)

(declare-fun c!144434 () Bool)

(assert (=> d!163483 (= c!144434 (and ((_ is Cons!36625) (toList!11354 lt!672553)) (= (_1!12632 (h!38071 (toList!11354 lt!672553))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163483 (= (getValueByKey!793 (toList!11354 lt!672553) #b0000000000000000000000000000000000000000000000000000000000000000) e!873243)))

(assert (= (and d!163483 c!144434) b!1566621))

(assert (= (and d!163483 (not c!144434)) b!1566622))

(assert (= (and b!1566622 c!144435) b!1566623))

(assert (= (and b!1566622 (not c!144435)) b!1566624))

(declare-fun m!1441699 () Bool)

(assert (=> b!1566623 m!1441699))

(assert (=> b!1566408 d!163483))

(declare-fun b!1566637 () Bool)

(declare-fun c!144443 () Bool)

(declare-fun lt!672781 () (_ BitVec 64))

(assert (=> b!1566637 (= c!144443 (= lt!672781 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873252 () SeekEntryResult!13526)

(declare-fun e!873251 () SeekEntryResult!13526)

(assert (=> b!1566637 (= e!873252 e!873251)))

(declare-fun b!1566638 () Bool)

(assert (=> b!1566638 (= e!873251 (MissingVacant!13526 (index!56504 lt!672693)))))

(declare-fun d!163485 () Bool)

(declare-fun lt!672780 () SeekEntryResult!13526)

(assert (=> d!163485 (and (or ((_ is Undefined!13526) lt!672780) (not ((_ is Found!13526) lt!672780)) (and (bvsge (index!56503 lt!672780) #b00000000000000000000000000000000) (bvslt (index!56503 lt!672780) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672780) ((_ is Found!13526) lt!672780) (not ((_ is MissingVacant!13526) lt!672780)) (not (= (index!56505 lt!672780) (index!56504 lt!672693))) (and (bvsge (index!56505 lt!672780) #b00000000000000000000000000000000) (bvslt (index!56505 lt!672780) (size!51041 _keys!637)))) (or ((_ is Undefined!13526) lt!672780) (ite ((_ is Found!13526) lt!672780) (= (select (arr!50491 _keys!637) (index!56503 lt!672780)) (select (arr!50491 _keys!637) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!13526) lt!672780) (= (index!56505 lt!672780) (index!56504 lt!672693)) (= (select (arr!50491 _keys!637) (index!56505 lt!672780)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!873253 () SeekEntryResult!13526)

(assert (=> d!163485 (= lt!672780 e!873253)))

(declare-fun c!144444 () Bool)

(assert (=> d!163485 (= c!144444 (bvsge (x!140749 lt!672693) #b01111111111111111111111111111110))))

(assert (=> d!163485 (= lt!672781 (select (arr!50491 _keys!637) (index!56504 lt!672693)))))

(assert (=> d!163485 (validMask!0 mask!947)))

(assert (=> d!163485 (= (seekKeyOrZeroReturnVacant!0 (x!140749 lt!672693) (index!56504 lt!672693) (index!56504 lt!672693) (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672780)))

(declare-fun b!1566639 () Bool)

(assert (=> b!1566639 (= e!873251 (seekKeyOrZeroReturnVacant!0 (bvadd (x!140749 lt!672693) #b00000000000000000000000000000001) (nextIndex!0 (index!56504 lt!672693) (x!140749 lt!672693) mask!947) (index!56504 lt!672693) (select (arr!50491 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1566640 () Bool)

(assert (=> b!1566640 (= e!873253 Undefined!13526)))

(declare-fun b!1566641 () Bool)

(assert (=> b!1566641 (= e!873253 e!873252)))

(declare-fun c!144442 () Bool)

(assert (=> b!1566641 (= c!144442 (= lt!672781 (select (arr!50491 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566642 () Bool)

(assert (=> b!1566642 (= e!873252 (Found!13526 (index!56504 lt!672693)))))

(assert (= (and d!163485 c!144444) b!1566640))

(assert (= (and d!163485 (not c!144444)) b!1566641))

(assert (= (and b!1566641 c!144442) b!1566642))

(assert (= (and b!1566641 (not c!144442)) b!1566637))

(assert (= (and b!1566637 c!144443) b!1566638))

(assert (= (and b!1566637 (not c!144443)) b!1566639))

(declare-fun m!1441701 () Bool)

(assert (=> d!163485 m!1441701))

(declare-fun m!1441703 () Bool)

(assert (=> d!163485 m!1441703))

(assert (=> d!163485 m!1441391))

(assert (=> d!163485 m!1441057))

(declare-fun m!1441705 () Bool)

(assert (=> b!1566639 m!1441705))

(assert (=> b!1566639 m!1441705))

(assert (=> b!1566639 m!1441123))

(declare-fun m!1441707 () Bool)

(assert (=> b!1566639 m!1441707))

(assert (=> b!1566403 d!163485))

(declare-fun d!163487 () Bool)

(declare-fun res!1070752 () Bool)

(declare-fun e!873254 () Bool)

(assert (=> d!163487 (=> res!1070752 e!873254)))

(assert (=> d!163487 (= res!1070752 (and ((_ is Cons!36625) (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) (= (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163487 (= (containsKey!851 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000) e!873254)))

(declare-fun b!1566643 () Bool)

(declare-fun e!873255 () Bool)

(assert (=> b!1566643 (= e!873254 e!873255)))

(declare-fun res!1070753 () Bool)

(assert (=> b!1566643 (=> (not res!1070753) (not e!873255))))

(assert (=> b!1566643 (= res!1070753 (and (or (not ((_ is Cons!36625) (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))) (bvsle (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36625) (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) (bvslt (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566644 () Bool)

(assert (=> b!1566644 (= e!873255 (containsKey!851 (t!51530 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163487 (not res!1070752)) b!1566643))

(assert (= (and b!1566643 res!1070753) b!1566644))

(declare-fun m!1441709 () Bool)

(assert (=> b!1566644 m!1441709))

(assert (=> d!163315 d!163487))

(declare-fun lt!672782 () Bool)

(declare-fun d!163489 () Bool)

(assert (=> d!163489 (= lt!672782 (select (content!811 lt!672671) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun e!873257 () Bool)

(assert (=> d!163489 (= lt!672782 e!873257)))

(declare-fun res!1070754 () Bool)

(assert (=> d!163489 (=> (not res!1070754) (not e!873257))))

(assert (=> d!163489 (= res!1070754 ((_ is Cons!36625) lt!672671))))

(assert (=> d!163489 (= (contains!10348 lt!672671 (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) lt!672782)))

(declare-fun b!1566645 () Bool)

(declare-fun e!873256 () Bool)

(assert (=> b!1566645 (= e!873257 e!873256)))

(declare-fun res!1070755 () Bool)

(assert (=> b!1566645 (=> res!1070755 e!873256)))

(assert (=> b!1566645 (= res!1070755 (= (h!38071 lt!672671) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(declare-fun b!1566646 () Bool)

(assert (=> b!1566646 (= e!873256 (contains!10348 (t!51530 lt!672671) (tuple2!25243 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (= (and d!163489 res!1070754) b!1566645))

(assert (= (and b!1566645 (not res!1070755)) b!1566646))

(declare-fun m!1441711 () Bool)

(assert (=> d!163489 m!1441711))

(declare-fun m!1441713 () Bool)

(assert (=> d!163489 m!1441713))

(declare-fun m!1441715 () Bool)

(assert (=> b!1566646 m!1441715))

(assert (=> b!1566351 d!163489))

(assert (=> b!1566410 d!163481))

(assert (=> b!1566410 d!163483))

(assert (=> d!163263 d!163265))

(assert (=> d!163263 d!163267))

(declare-fun d!163491 () Bool)

(assert (=> d!163491 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163491 true))

(declare-fun _$12!491 () Unit!52032)

(assert (=> d!163491 (= (choose!2076 (toList!11354 lt!672551) #b0000000000000000000000000000000000000000000000000000000000000000) _$12!491)))

(declare-fun bs!45086 () Bool)

(assert (= bs!45086 d!163491))

(assert (=> bs!45086 m!1441149))

(assert (=> bs!45086 m!1441149))

(assert (=> bs!45086 m!1441151))

(assert (=> d!163263 d!163491))

(assert (=> d!163263 d!163437))

(declare-fun d!163493 () Bool)

(assert (=> d!163493 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672783 () Unit!52032)

(assert (=> d!163493 (= lt!672783 (choose!2076 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873258 () Bool)

(assert (=> d!163493 e!873258))

(declare-fun res!1070756 () Bool)

(assert (=> d!163493 (=> (not res!1070756) (not e!873258))))

(assert (=> d!163493 (= res!1070756 (isStrictlySorted!986 (toList!11354 lt!672614)))))

(assert (=> d!163493 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000) lt!672783)))

(declare-fun b!1566647 () Bool)

(assert (=> b!1566647 (= e!873258 (containsKey!851 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163493 res!1070756) b!1566647))

(assert (=> d!163493 m!1441367))

(assert (=> d!163493 m!1441367))

(assert (=> d!163493 m!1441369))

(declare-fun m!1441717 () Bool)

(assert (=> d!163493 m!1441717))

(declare-fun m!1441719 () Bool)

(assert (=> d!163493 m!1441719))

(assert (=> b!1566647 m!1441363))

(assert (=> b!1566372 d!163493))

(declare-fun d!163495 () Bool)

(assert (=> d!163495 (= (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45087 () Bool)

(assert (= bs!45087 d!163495))

(assert (=> bs!45087 m!1441367))

(declare-fun m!1441721 () Bool)

(assert (=> bs!45087 m!1441721))

(assert (=> b!1566372 d!163495))

(declare-fun b!1566650 () Bool)

(declare-fun e!873260 () Option!869)

(assert (=> b!1566650 (= e!873260 (getValueByKey!793 (t!51530 (toList!11354 lt!672614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566651 () Bool)

(assert (=> b!1566651 (= e!873260 None!867)))

(declare-fun b!1566648 () Bool)

(declare-fun e!873259 () Option!869)

(assert (=> b!1566648 (= e!873259 (Some!868 (_2!12632 (h!38071 (toList!11354 lt!672614)))))))

(declare-fun b!1566649 () Bool)

(assert (=> b!1566649 (= e!873259 e!873260)))

(declare-fun c!144446 () Bool)

(assert (=> b!1566649 (= c!144446 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (not (= (_1!12632 (h!38071 (toList!11354 lt!672614))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!163497 () Bool)

(declare-fun c!144445 () Bool)

(assert (=> d!163497 (= c!144445 (and ((_ is Cons!36625) (toList!11354 lt!672614)) (= (_1!12632 (h!38071 (toList!11354 lt!672614))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163497 (= (getValueByKey!793 (toList!11354 lt!672614) #b1000000000000000000000000000000000000000000000000000000000000000) e!873259)))

(assert (= (and d!163497 c!144445) b!1566648))

(assert (= (and d!163497 (not c!144445)) b!1566649))

(assert (= (and b!1566649 c!144446) b!1566650))

(assert (= (and b!1566649 (not c!144446)) b!1566651))

(declare-fun m!1441723 () Bool)

(assert (=> b!1566650 m!1441723))

(assert (=> b!1566372 d!163497))

(assert (=> d!163287 d!163285))

(declare-fun d!163499 () Bool)

(assert (=> d!163499 (= (getValueByKey!793 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) (Some!868 (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))))

(assert (=> d!163499 true))

(declare-fun _$22!592 () Unit!52032)

(assert (=> d!163499 (= (choose!2077 lt!672629 (_1!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) (_2!12632 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) _$22!592)))

(declare-fun bs!45088 () Bool)

(assert (= bs!45088 d!163499))

(assert (=> bs!45088 m!1441197))

(assert (=> d!163287 d!163499))

(declare-fun d!163501 () Bool)

(declare-fun res!1070757 () Bool)

(declare-fun e!873261 () Bool)

(assert (=> d!163501 (=> res!1070757 e!873261)))

(assert (=> d!163501 (= res!1070757 (or ((_ is Nil!36626) lt!672629) ((_ is Nil!36626) (t!51530 lt!672629))))))

(assert (=> d!163501 (= (isStrictlySorted!986 lt!672629) e!873261)))

(declare-fun b!1566652 () Bool)

(declare-fun e!873262 () Bool)

(assert (=> b!1566652 (= e!873261 e!873262)))

(declare-fun res!1070758 () Bool)

(assert (=> b!1566652 (=> (not res!1070758) (not e!873262))))

(assert (=> b!1566652 (= res!1070758 (bvslt (_1!12632 (h!38071 lt!672629)) (_1!12632 (h!38071 (t!51530 lt!672629)))))))

(declare-fun b!1566653 () Bool)

(assert (=> b!1566653 (= e!873262 (isStrictlySorted!986 (t!51530 lt!672629)))))

(assert (= (and d!163501 (not res!1070757)) b!1566652))

(assert (= (and b!1566652 res!1070758) b!1566653))

(declare-fun m!1441725 () Bool)

(assert (=> b!1566653 m!1441725))

(assert (=> d!163287 d!163501))

(assert (=> b!1566374 d!163495))

(assert (=> b!1566374 d!163497))

(declare-fun d!163503 () Bool)

(assert (=> d!163503 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672784 () Unit!52032)

(assert (=> d!163503 (= lt!672784 (choose!2076 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873263 () Bool)

(assert (=> d!163503 e!873263))

(declare-fun res!1070759 () Bool)

(assert (=> d!163503 (=> (not res!1070759) (not e!873263))))

(assert (=> d!163503 (= res!1070759 (isStrictlySorted!986 (toList!11354 lt!672614)))))

(assert (=> d!163503 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672784)))

(declare-fun b!1566654 () Bool)

(assert (=> b!1566654 (= e!873263 (containsKey!851 (toList!11354 lt!672614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163503 res!1070759) b!1566654))

(assert (=> d!163503 m!1441353))

(assert (=> d!163503 m!1441353))

(assert (=> d!163503 m!1441355))

(declare-fun m!1441727 () Bool)

(assert (=> d!163503 m!1441727))

(assert (=> d!163503 m!1441719))

(assert (=> b!1566654 m!1441349))

(assert (=> b!1566366 d!163503))

(assert (=> b!1566366 d!163475))

(assert (=> b!1566366 d!163477))

(declare-fun d!163505 () Bool)

(assert (=> d!163505 (= (apply!1118 lt!672637 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (get!26363 (getValueByKey!793 (toList!11354 lt!672637) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))))

(declare-fun bs!45089 () Bool)

(assert (= bs!45089 d!163505))

(assert (=> bs!45089 m!1441233))

(assert (=> bs!45089 m!1441663))

(assert (=> bs!45089 m!1441663))

(declare-fun m!1441729 () Bool)

(assert (=> bs!45089 m!1441729))

(assert (=> b!1566277 d!163505))

(assert (=> b!1566277 d!163427))

(declare-fun d!163507 () Bool)

(assert (=> d!163507 (isDefined!582 (getValueByKey!793 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun lt!672785 () Unit!52032)

(assert (=> d!163507 (= lt!672785 (choose!2076 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun e!873264 () Bool)

(assert (=> d!163507 e!873264))

(declare-fun res!1070760 () Bool)

(assert (=> d!163507 (=> (not res!1070760) (not e!873264))))

(assert (=> d!163507 (= res!1070760 (isStrictlySorted!986 (toList!11354 lt!672614)))))

(assert (=> d!163507 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) lt!672785)))

(declare-fun b!1566655 () Bool)

(assert (=> b!1566655 (= e!873264 (containsKey!851 (toList!11354 lt!672614) (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!163507 res!1070760) b!1566655))

(assert (=> d!163507 m!1441173))

(assert (=> d!163507 m!1441209))

(assert (=> d!163507 m!1441209))

(assert (=> d!163507 m!1441361))

(assert (=> d!163507 m!1441173))

(declare-fun m!1441731 () Bool)

(assert (=> d!163507 m!1441731))

(assert (=> d!163507 m!1441719))

(assert (=> b!1566655 m!1441173))

(assert (=> b!1566655 m!1441357))

(assert (=> b!1566369 d!163507))

(assert (=> b!1566369 d!163471))

(assert (=> b!1566369 d!163469))

(declare-fun d!163509 () Bool)

(assert (=> d!163509 (= (get!26365 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566260 d!163509))

(declare-fun d!163511 () Bool)

(declare-fun c!144449 () Bool)

(assert (=> d!163511 (= c!144449 ((_ is Nil!36626) (toList!11354 lt!672630)))))

(declare-fun e!873267 () (InoxSet tuple2!25242))

(assert (=> d!163511 (= (content!811 (toList!11354 lt!672630)) e!873267)))

(declare-fun b!1566660 () Bool)

(assert (=> b!1566660 (= e!873267 ((as const (Array tuple2!25242 Bool)) false))))

(declare-fun b!1566661 () Bool)

(assert (=> b!1566661 (= e!873267 ((_ map or) (store ((as const (Array tuple2!25242 Bool)) false) (h!38071 (toList!11354 lt!672630)) true) (content!811 (t!51530 (toList!11354 lt!672630)))))))

(assert (= (and d!163511 c!144449) b!1566660))

(assert (= (and d!163511 (not c!144449)) b!1566661))

(declare-fun m!1441733 () Bool)

(assert (=> b!1566661 m!1441733))

(declare-fun m!1441735 () Bool)

(assert (=> b!1566661 m!1441735))

(assert (=> d!163325 d!163511))

(declare-fun d!163513 () Bool)

(assert (=> d!163513 (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672786 () Unit!52032)

(assert (=> d!163513 (= lt!672786 (choose!2076 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873268 () Bool)

(assert (=> d!163513 e!873268))

(declare-fun res!1070761 () Bool)

(assert (=> d!163513 (=> (not res!1070761) (not e!873268))))

(assert (=> d!163513 (= res!1070761 (isStrictlySorted!986 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))

(assert (=> d!163513 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672786)))

(declare-fun b!1566662 () Bool)

(assert (=> b!1566662 (= e!873268 (containsKey!851 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163513 res!1070761) b!1566662))

(assert (=> d!163513 m!1441399))

(assert (=> d!163513 m!1441399))

(assert (=> d!163513 m!1441401))

(declare-fun m!1441737 () Bool)

(assert (=> d!163513 m!1441737))

(declare-fun m!1441739 () Bool)

(assert (=> d!163513 m!1441739))

(assert (=> b!1566662 m!1441395))

(assert (=> b!1566404 d!163513))

(declare-fun d!163515 () Bool)

(assert (=> d!163515 (= (isDefined!582 (getValueByKey!793 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1147 (getValueByKey!793 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45090 () Bool)

(assert (= bs!45090 d!163515))

(assert (=> bs!45090 m!1441399))

(declare-fun m!1441741 () Bool)

(assert (=> bs!45090 m!1441741))

(assert (=> b!1566404 d!163515))

(declare-fun e!873270 () Option!869)

(declare-fun b!1566665 () Bool)

(assert (=> b!1566665 (= e!873270 (getValueByKey!793 (t!51530 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566666 () Bool)

(assert (=> b!1566666 (= e!873270 None!867)))

(declare-fun b!1566663 () Bool)

(declare-fun e!873269 () Option!869)

(assert (=> b!1566663 (= e!873269 (Some!868 (_2!12632 (h!38071 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))))))

(declare-fun b!1566664 () Bool)

(assert (=> b!1566664 (= e!873269 e!873270)))

(declare-fun c!144451 () Bool)

(assert (=> b!1566664 (= c!144451 (and ((_ is Cons!36625) (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) (not (= (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun c!144450 () Bool)

(declare-fun d!163517 () Bool)

(assert (=> d!163517 (= c!144450 (and ((_ is Cons!36625) (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))) (= (_1!12632 (h!38071 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163517 (= (getValueByKey!793 (toList!11354 (+!5084 lt!672553 (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554))) #b0000000000000000000000000000000000000000000000000000000000000000) e!873269)))

(assert (= (and d!163517 c!144450) b!1566663))

(assert (= (and d!163517 (not c!144450)) b!1566664))

(assert (= (and b!1566664 c!144451) b!1566665))

(assert (= (and b!1566664 (not c!144451)) b!1566666))

(declare-fun m!1441743 () Bool)

(assert (=> b!1566665 m!1441743))

(assert (=> b!1566404 d!163517))

(declare-fun b!1566667 () Bool)

(declare-fun e!873276 () Bool)

(declare-fun e!873272 () Bool)

(assert (=> b!1566667 (= e!873276 e!873272)))

(assert (=> b!1566667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun lt!672792 () ListLongMap!22677)

(declare-fun res!1070763 () Bool)

(assert (=> b!1566667 (= res!1070763 (contains!10345 lt!672792 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1566667 (=> (not res!1070763) (not e!873272))))

(declare-fun b!1566668 () Bool)

(declare-fun e!873273 () Bool)

(assert (=> b!1566668 (= e!873273 (isEmpty!1146 lt!672792))))

(declare-fun b!1566669 () Bool)

(declare-fun res!1070764 () Bool)

(declare-fun e!873274 () Bool)

(assert (=> b!1566669 (=> (not res!1070764) (not e!873274))))

(assert (=> b!1566669 (= res!1070764 (not (contains!10345 lt!672792 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!71915 () ListLongMap!22677)

(declare-fun bm!71912 () Bool)

(assert (=> bm!71912 (= call!71915 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1566670 () Bool)

(declare-fun lt!672787 () Unit!52032)

(declare-fun lt!672789 () Unit!52032)

(assert (=> b!1566670 (= lt!672787 lt!672789)))

(declare-fun lt!672791 () ListLongMap!22677)

(declare-fun lt!672790 () V!60155)

(declare-fun lt!672793 () (_ BitVec 64))

(declare-fun lt!672788 () (_ BitVec 64))

(assert (=> b!1566670 (not (contains!10345 (+!5084 lt!672791 (tuple2!25243 lt!672788 lt!672790)) lt!672793))))

(assert (=> b!1566670 (= lt!672789 (addStillNotContains!574 lt!672791 lt!672788 lt!672790 lt!672793))))

(assert (=> b!1566670 (= lt!672793 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1566670 (= lt!672790 (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1566670 (= lt!672788 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1566670 (= lt!672791 call!71915)))

(declare-fun e!873277 () ListLongMap!22677)

(assert (=> b!1566670 (= e!873277 (+!5084 call!71915 (tuple2!25243 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1566671 () Bool)

(assert (=> b!1566671 (= e!873273 (= lt!672792 (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1566672 () Bool)

(declare-fun e!873271 () Bool)

(assert (=> b!1566672 (= e!873271 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1566672 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!163519 () Bool)

(assert (=> d!163519 e!873274))

(declare-fun res!1070762 () Bool)

(assert (=> d!163519 (=> (not res!1070762) (not e!873274))))

(assert (=> d!163519 (= res!1070762 (not (contains!10345 lt!672792 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!873275 () ListLongMap!22677)

(assert (=> d!163519 (= lt!672792 e!873275)))

(declare-fun c!144453 () Bool)

(assert (=> d!163519 (= c!144453 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> d!163519 (validMask!0 mask!947)))

(assert (=> d!163519 (= (getCurrentListMapNoExtraKeys!6719 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495) lt!672792)))

(declare-fun b!1566673 () Bool)

(assert (=> b!1566673 (= e!873276 e!873273)))

(declare-fun c!144455 () Bool)

(assert (=> b!1566673 (= c!144455 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun b!1566674 () Bool)

(assert (=> b!1566674 (= e!873275 e!873277)))

(declare-fun c!144452 () Bool)

(assert (=> b!1566674 (= c!144452 (validKeyInArray!0 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1566675 () Bool)

(assert (=> b!1566675 (= e!873274 e!873276)))

(declare-fun c!144454 () Bool)

(assert (=> b!1566675 (= c!144454 e!873271)))

(declare-fun res!1070765 () Bool)

(assert (=> b!1566675 (=> (not res!1070765) (not e!873271))))

(assert (=> b!1566675 (= res!1070765 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(declare-fun b!1566676 () Bool)

(assert (=> b!1566676 (= e!873277 call!71915)))

(declare-fun b!1566677 () Bool)

(assert (=> b!1566677 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51041 _keys!637)))))

(assert (=> b!1566677 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51042 _values!487)))))

(assert (=> b!1566677 (= e!873272 (= (apply!1118 lt!672792 (select (arr!50491 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!26361 (select (arr!50492 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1566678 () Bool)

(assert (=> b!1566678 (= e!873275 (ListLongMap!22678 Nil!36626))))

(assert (= (and d!163519 c!144453) b!1566678))

(assert (= (and d!163519 (not c!144453)) b!1566674))

(assert (= (and b!1566674 c!144452) b!1566670))

(assert (= (and b!1566674 (not c!144452)) b!1566676))

(assert (= (or b!1566670 b!1566676) bm!71912))

(assert (= (and d!163519 res!1070762) b!1566669))

(assert (= (and b!1566669 res!1070764) b!1566675))

(assert (= (and b!1566675 res!1070765) b!1566672))

(assert (= (and b!1566675 c!144454) b!1566667))

(assert (= (and b!1566675 (not c!144454)) b!1566673))

(assert (= (and b!1566667 res!1070763) b!1566677))

(assert (= (and b!1566673 c!144455) b!1566671))

(assert (= (and b!1566673 (not c!144455)) b!1566668))

(declare-fun b_lambda!25023 () Bool)

(assert (=> (not b_lambda!25023) (not b!1566670)))

(assert (=> b!1566670 t!51529))

(declare-fun b_and!51831 () Bool)

(assert (= b_and!51829 (and (=> t!51529 result!26601) b_and!51831)))

(declare-fun b_lambda!25025 () Bool)

(assert (=> (not b_lambda!25025) (not b!1566677)))

(assert (=> b!1566677 t!51529))

(declare-fun b_and!51833 () Bool)

(assert (= b_and!51831 (and (=> t!51529 result!26601) b_and!51833)))

(declare-fun m!1441745 () Bool)

(assert (=> bm!71912 m!1441745))

(assert (=> b!1566670 m!1441065))

(declare-fun m!1441747 () Bool)

(assert (=> b!1566670 m!1441747))

(assert (=> b!1566670 m!1441065))

(declare-fun m!1441749 () Bool)

(assert (=> b!1566670 m!1441749))

(declare-fun m!1441751 () Bool)

(assert (=> b!1566670 m!1441751))

(declare-fun m!1441753 () Bool)

(assert (=> b!1566670 m!1441753))

(declare-fun m!1441755 () Bool)

(assert (=> b!1566670 m!1441755))

(assert (=> b!1566670 m!1441755))

(declare-fun m!1441757 () Bool)

(assert (=> b!1566670 m!1441757))

(assert (=> b!1566670 m!1441747))

(declare-fun m!1441759 () Bool)

(assert (=> b!1566670 m!1441759))

(assert (=> b!1566677 m!1441065))

(assert (=> b!1566677 m!1441759))

(declare-fun m!1441761 () Bool)

(assert (=> b!1566677 m!1441761))

(assert (=> b!1566677 m!1441747))

(assert (=> b!1566677 m!1441065))

(assert (=> b!1566677 m!1441749))

(assert (=> b!1566677 m!1441747))

(assert (=> b!1566677 m!1441759))

(declare-fun m!1441763 () Bool)

(assert (=> b!1566669 m!1441763))

(assert (=> b!1566671 m!1441745))

(assert (=> b!1566672 m!1441759))

(assert (=> b!1566672 m!1441759))

(declare-fun m!1441765 () Bool)

(assert (=> b!1566672 m!1441765))

(declare-fun m!1441767 () Bool)

(assert (=> b!1566668 m!1441767))

(assert (=> b!1566674 m!1441759))

(assert (=> b!1566674 m!1441759))

(assert (=> b!1566674 m!1441765))

(declare-fun m!1441769 () Bool)

(assert (=> d!163519 m!1441769))

(assert (=> d!163519 m!1441057))

(assert (=> b!1566667 m!1441759))

(assert (=> b!1566667 m!1441759))

(declare-fun m!1441771 () Bool)

(assert (=> b!1566667 m!1441771))

(assert (=> bm!71889 d!163519))

(assert (=> b!1566406 d!163515))

(assert (=> b!1566406 d!163517))

(assert (=> b!1566271 d!163519))

(declare-fun b!1566681 () Bool)

(declare-fun e!873279 () Option!869)

(assert (=> b!1566681 (= e!873279 (getValueByKey!793 (t!51530 (t!51530 (toList!11354 lt!672551))) (select (arr!50491 _keys!637) from!782)))))

(declare-fun b!1566682 () Bool)

(assert (=> b!1566682 (= e!873279 None!867)))

(declare-fun b!1566679 () Bool)

(declare-fun e!873278 () Option!869)

(assert (=> b!1566679 (= e!873278 (Some!868 (_2!12632 (h!38071 (t!51530 (toList!11354 lt!672551))))))))

(declare-fun b!1566680 () Bool)

(assert (=> b!1566680 (= e!873278 e!873279)))

(declare-fun c!144457 () Bool)

(assert (=> b!1566680 (= c!144457 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (not (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) (select (arr!50491 _keys!637) from!782)))))))

(declare-fun d!163521 () Bool)

(declare-fun c!144456 () Bool)

(assert (=> d!163521 (= c!144456 (and ((_ is Cons!36625) (t!51530 (toList!11354 lt!672551))) (= (_1!12632 (h!38071 (t!51530 (toList!11354 lt!672551)))) (select (arr!50491 _keys!637) from!782))))))

(assert (=> d!163521 (= (getValueByKey!793 (t!51530 (toList!11354 lt!672551)) (select (arr!50491 _keys!637) from!782)) e!873278)))

(assert (= (and d!163521 c!144456) b!1566679))

(assert (= (and d!163521 (not c!144456)) b!1566680))

(assert (= (and b!1566680 c!144457) b!1566681))

(assert (= (and b!1566680 (not c!144457)) b!1566682))

(assert (=> b!1566681 m!1441043))

(declare-fun m!1441773 () Bool)

(assert (=> b!1566681 m!1441773))

(assert (=> b!1566307 d!163521))

(declare-fun lt!672794 () Bool)

(declare-fun d!163523 () Bool)

(assert (=> d!163523 (= lt!672794 (select (content!811 (t!51530 (toList!11354 lt!672630))) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(declare-fun e!873281 () Bool)

(assert (=> d!163523 (= lt!672794 e!873281)))

(declare-fun res!1070766 () Bool)

(assert (=> d!163523 (=> (not res!1070766) (not e!873281))))

(assert (=> d!163523 (= res!1070766 ((_ is Cons!36625) (t!51530 (toList!11354 lt!672630))))))

(assert (=> d!163523 (= (contains!10348 (t!51530 (toList!11354 lt!672630)) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)) lt!672794)))

(declare-fun b!1566683 () Bool)

(declare-fun e!873280 () Bool)

(assert (=> b!1566683 (= e!873281 e!873280)))

(declare-fun res!1070767 () Bool)

(assert (=> b!1566683 (=> res!1070767 e!873280)))

(assert (=> b!1566683 (= res!1070767 (= (h!38071 (t!51530 (toList!11354 lt!672630))) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(declare-fun b!1566684 () Bool)

(assert (=> b!1566684 (= e!873280 (contains!10348 (t!51530 (t!51530 (toList!11354 lt!672630))) (tuple2!25243 (select (arr!50491 _keys!637) from!782) lt!672554)))))

(assert (= (and d!163523 res!1070766) b!1566683))

(assert (= (and b!1566683 (not res!1070767)) b!1566684))

(assert (=> d!163523 m!1441735))

(declare-fun m!1441775 () Bool)

(assert (=> d!163523 m!1441775))

(declare-fun m!1441777 () Bool)

(assert (=> b!1566684 m!1441777))

(assert (=> b!1566419 d!163523))

(declare-fun condMapEmpty!59841 () Bool)

(declare-fun mapDefault!59841 () ValueCell!18450)

(assert (=> mapNonEmpty!59840 (= condMapEmpty!59841 (= mapRest!59840 ((as const (Array (_ BitVec 32) ValueCell!18450)) mapDefault!59841)))))

(declare-fun e!873283 () Bool)

(declare-fun mapRes!59841 () Bool)

(assert (=> mapNonEmpty!59840 (= tp!113873 (and e!873283 mapRes!59841))))

(declare-fun b!1566686 () Bool)

(assert (=> b!1566686 (= e!873283 tp_is_empty!38961)))

(declare-fun mapIsEmpty!59841 () Bool)

(assert (=> mapIsEmpty!59841 mapRes!59841))

(declare-fun mapNonEmpty!59841 () Bool)

(declare-fun tp!113874 () Bool)

(declare-fun e!873282 () Bool)

(assert (=> mapNonEmpty!59841 (= mapRes!59841 (and tp!113874 e!873282))))

(declare-fun mapKey!59841 () (_ BitVec 32))

(declare-fun mapRest!59841 () (Array (_ BitVec 32) ValueCell!18450))

(declare-fun mapValue!59841 () ValueCell!18450)

(assert (=> mapNonEmpty!59841 (= mapRest!59840 (store mapRest!59841 mapKey!59841 mapValue!59841))))

(declare-fun b!1566685 () Bool)

(assert (=> b!1566685 (= e!873282 tp_is_empty!38961)))

(assert (= (and mapNonEmpty!59840 condMapEmpty!59841) mapIsEmpty!59841))

(assert (= (and mapNonEmpty!59840 (not condMapEmpty!59841)) mapNonEmpty!59841))

(assert (= (and mapNonEmpty!59841 ((_ is ValueCellFull!18450) mapValue!59841)) b!1566685))

(assert (= (and mapNonEmpty!59840 ((_ is ValueCellFull!18450) mapDefault!59841)) b!1566686))

(declare-fun m!1441779 () Bool)

(assert (=> mapNonEmpty!59841 m!1441779))

(declare-fun b_lambda!25027 () Bool)

(assert (= b_lambda!25023 (or (and start!133964 b_free!32187) b_lambda!25027)))

(declare-fun b_lambda!25029 () Bool)

(assert (= b_lambda!25025 (or (and start!133964 b_free!32187) b_lambda!25029)))

(check-sat (not d!163481) (not b!1566583) (not d!163523) (not b!1566677) (not b!1566496) (not d!163399) (not b!1566662) (not b!1566526) (not b!1566548) (not b!1566602) (not b_lambda!25029) (not d!163357) (not b!1566524) (not b!1566540) (not d!163407) (not b_lambda!25011) (not d!163505) (not d!163435) (not d!163361) (not b!1566502) (not d!163423) (not b!1566654) (not b!1566454) (not b!1566490) (not b_lambda!25027) (not d!163493) (not b_lambda!25019) (not b!1566615) (not d!163421) (not b!1566665) (not d!163491) (not mapNonEmpty!59841) (not bm!71904) (not b!1566513) (not d!163485) (not d!163471) (not b!1566672) (not d!163393) (not b!1566644) (not b!1566623) (not b!1566457) (not b!1566443) (not d!163395) (not b!1566430) (not d!163489) (not b!1566485) (not b!1566538) (not b!1566511) (not b!1566478) (not b!1566510) (not d!163431) (not d!163329) (not b!1566550) (not b!1566438) (not d!163363) (not d!163479) (not b!1566427) (not d!163519) (not b!1566655) (not d!163413) (not b!1566517) (not b_next!32187) (not d!163333) (not d!163377) (not d!163465) (not d!163507) (not b!1566437) (not b!1566488) (not b!1566541) (not b!1566684) (not d!163443) (not b!1566544) (not bm!71902) (not b_lambda!25021) (not b!1566670) (not b!1566607) (not b!1566614) (not b!1566497) (not b!1566539) (not b!1566595) (not d!163459) (not b!1566458) (not b!1566465) (not d!163383) (not d!163515) (not b!1566431) (not b_lambda!25013) (not d!163439) (not b!1566620) (not b!1566618) (not b!1566646) (not bm!71911) (not b!1566586) (not b!1566491) (not b!1566599) (not d!163445) (not b!1566647) (not b!1566542) (not b!1566508) (not b!1566505) (not b!1566667) (not b!1566529) (not b!1566462) (not b!1566471) (not b!1566481) (not b!1566472) (not b!1566600) (not d!163461) (not d!163353) (not d!163375) (not bm!71909) (not b!1566523) (not b!1566671) (not b!1566447) (not bm!71912) (not b!1566653) (not b!1566681) (not b!1566532) (not b!1566534) (not b!1566639) (not d!163503) (not b!1566605) (not b!1566493) (not d!163513) (not b_lambda!25005) (not b!1566483) (not bm!71906) (not b!1566610) (not b!1566536) (not b!1566459) (not b!1566674) (not b!1566593) (not b!1566451) (not b!1566474) (not d!163347) (not b!1566516) (not b!1566503) (not b!1566650) (not b!1566597) (not b!1566547) (not b!1566476) (not d!163495) (not b!1566669) (not d!163475) (not d!163419) (not d!163405) (not b!1566668) tp_is_empty!38961 b_and!51833 (not b!1566603) (not d!163381) (not b!1566661) (not d!163401) (not d!163499) (not d!163425) (not b!1566589) (not d!163391) (not b!1566440) (not b!1566574) (not b!1566546) (not b!1566591))
(check-sat b_and!51833 (not b_next!32187))
