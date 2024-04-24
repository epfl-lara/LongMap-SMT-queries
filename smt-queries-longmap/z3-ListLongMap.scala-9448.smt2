; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112520 () Bool)

(assert start!112520)

(declare-fun b_free!30691 () Bool)

(declare-fun b_next!30691 () Bool)

(assert (=> start!112520 (= b_free!30691 (not b_next!30691))))

(declare-fun tp!107709 () Bool)

(declare-fun b_and!49439 () Bool)

(assert (=> start!112520 (= tp!107709 b_and!49439)))

(declare-fun mapIsEmpty!56575 () Bool)

(declare-fun mapRes!56575 () Bool)

(assert (=> mapIsEmpty!56575 mapRes!56575))

(declare-fun b!1331990 () Bool)

(declare-fun e!759229 () Bool)

(assert (=> b!1331990 (= e!759229 (not true))))

(declare-datatypes ((V!53905 0))(
  ( (V!53906 (val!18375 Int)) )
))
(declare-datatypes ((tuple2!23700 0))(
  ( (tuple2!23701 (_1!11861 (_ BitVec 64)) (_2!11861 V!53905)) )
))
(declare-datatypes ((List!30866 0))(
  ( (Nil!30863) (Cons!30862 (h!32080 tuple2!23700) (t!44962 List!30866)) )
))
(declare-datatypes ((ListLongMap!21365 0))(
  ( (ListLongMap!21366 (toList!10698 List!30866)) )
))
(declare-fun lt!591717 () ListLongMap!21365)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8874 (ListLongMap!21365 (_ BitVec 64)) Bool)

(assert (=> b!1331990 (contains!8874 lt!591717 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((Unit!43734 0))(
  ( (Unit!43735) )
))
(declare-fun lt!591716 () Unit!43734)

(declare-fun lt!591719 () V!53905)

(declare-datatypes ((array!90195 0))(
  ( (array!90196 (arr!43559 (Array (_ BitVec 32) (_ BitVec 64))) (size!44110 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90195)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!255 ((_ BitVec 64) (_ BitVec 64) V!53905 ListLongMap!21365) Unit!43734)

(assert (=> b!1331990 (= lt!591716 (lemmaInListMapAfterAddingDiffThenInBefore!255 k0!1153 (select (arr!43559 _keys!1590) from!1980) lt!591719 lt!591717))))

(declare-fun lt!591720 () ListLongMap!21365)

(assert (=> b!1331990 (contains!8874 lt!591720 k0!1153)))

(declare-fun lt!591718 () Unit!43734)

(declare-fun minValue!1262 () V!53905)

(assert (=> b!1331990 (= lt!591718 (lemmaInListMapAfterAddingDiffThenInBefore!255 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591720))))

(declare-fun +!4712 (ListLongMap!21365 tuple2!23700) ListLongMap!21365)

(assert (=> b!1331990 (= lt!591720 (+!4712 lt!591717 (tuple2!23701 (select (arr!43559 _keys!1590) from!1980) lt!591719)))))

(declare-datatypes ((ValueCell!17402 0))(
  ( (ValueCellFull!17402 (v!21007 V!53905)) (EmptyCell!17402) )
))
(declare-datatypes ((array!90197 0))(
  ( (array!90198 (arr!43560 (Array (_ BitVec 32) ValueCell!17402)) (size!44111 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90197)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21975 (ValueCell!17402 V!53905) V!53905)

(declare-fun dynLambda!3666 (Int (_ BitVec 64)) V!53905)

(assert (=> b!1331990 (= lt!591719 (get!21975 (select (arr!43560 _values!1320) from!1980) (dynLambda!3666 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53905)

(declare-fun getCurrentListMapNoExtraKeys!6356 (array!90195 array!90197 (_ BitVec 32) (_ BitVec 32) V!53905 V!53905 (_ BitVec 32) Int) ListLongMap!21365)

(assert (=> b!1331990 (= lt!591717 (getCurrentListMapNoExtraKeys!6356 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331991 () Bool)

(declare-fun res!883509 () Bool)

(assert (=> b!1331991 (=> (not res!883509) (not e!759229))))

(assert (=> b!1331991 (= res!883509 (not (= (select (arr!43559 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331992 () Bool)

(declare-fun res!883511 () Bool)

(assert (=> b!1331992 (=> (not res!883511) (not e!759229))))

(assert (=> b!1331992 (= res!883511 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44110 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331993 () Bool)

(declare-fun res!883510 () Bool)

(assert (=> b!1331993 (=> (not res!883510) (not e!759229))))

(declare-datatypes ((List!30867 0))(
  ( (Nil!30864) (Cons!30863 (h!32081 (_ BitVec 64)) (t!44963 List!30867)) )
))
(declare-fun arrayNoDuplicates!0 (array!90195 (_ BitVec 32) List!30867) Bool)

(assert (=> b!1331993 (= res!883510 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30864))))

(declare-fun b!1331994 () Bool)

(declare-fun e!759228 () Bool)

(declare-fun e!759225 () Bool)

(assert (=> b!1331994 (= e!759228 (and e!759225 mapRes!56575))))

(declare-fun condMapEmpty!56575 () Bool)

(declare-fun mapDefault!56575 () ValueCell!17402)

(assert (=> b!1331994 (= condMapEmpty!56575 (= (arr!43560 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17402)) mapDefault!56575)))))

(declare-fun b!1331995 () Bool)

(declare-fun tp_is_empty!36601 () Bool)

(assert (=> b!1331995 (= e!759225 tp_is_empty!36601)))

(declare-fun res!883505 () Bool)

(assert (=> start!112520 (=> (not res!883505) (not e!759229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112520 (= res!883505 (validMask!0 mask!1998))))

(assert (=> start!112520 e!759229))

(declare-fun array_inv!33141 (array!90197) Bool)

(assert (=> start!112520 (and (array_inv!33141 _values!1320) e!759228)))

(assert (=> start!112520 true))

(declare-fun array_inv!33142 (array!90195) Bool)

(assert (=> start!112520 (array_inv!33142 _keys!1590)))

(assert (=> start!112520 tp!107709))

(assert (=> start!112520 tp_is_empty!36601))

(declare-fun b!1331996 () Bool)

(declare-fun res!883508 () Bool)

(assert (=> b!1331996 (=> (not res!883508) (not e!759229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90195 (_ BitVec 32)) Bool)

(assert (=> b!1331996 (= res!883508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56575 () Bool)

(declare-fun tp!107710 () Bool)

(declare-fun e!759226 () Bool)

(assert (=> mapNonEmpty!56575 (= mapRes!56575 (and tp!107710 e!759226))))

(declare-fun mapKey!56575 () (_ BitVec 32))

(declare-fun mapRest!56575 () (Array (_ BitVec 32) ValueCell!17402))

(declare-fun mapValue!56575 () ValueCell!17402)

(assert (=> mapNonEmpty!56575 (= (arr!43560 _values!1320) (store mapRest!56575 mapKey!56575 mapValue!56575))))

(declare-fun b!1331997 () Bool)

(assert (=> b!1331997 (= e!759226 tp_is_empty!36601)))

(declare-fun b!1331998 () Bool)

(declare-fun res!883506 () Bool)

(assert (=> b!1331998 (=> (not res!883506) (not e!759229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331998 (= res!883506 (validKeyInArray!0 (select (arr!43559 _keys!1590) from!1980)))))

(declare-fun b!1331999 () Bool)

(declare-fun res!883503 () Bool)

(assert (=> b!1331999 (=> (not res!883503) (not e!759229))))

(assert (=> b!1331999 (= res!883503 (and (= (size!44111 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44110 _keys!1590) (size!44111 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332000 () Bool)

(declare-fun res!883507 () Bool)

(assert (=> b!1332000 (=> (not res!883507) (not e!759229))))

(assert (=> b!1332000 (= res!883507 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332001 () Bool)

(declare-fun res!883504 () Bool)

(assert (=> b!1332001 (=> (not res!883504) (not e!759229))))

(declare-fun getCurrentListMap!5669 (array!90195 array!90197 (_ BitVec 32) (_ BitVec 32) V!53905 V!53905 (_ BitVec 32) Int) ListLongMap!21365)

(assert (=> b!1332001 (= res!883504 (contains!8874 (getCurrentListMap!5669 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112520 res!883505) b!1331999))

(assert (= (and b!1331999 res!883503) b!1331996))

(assert (= (and b!1331996 res!883508) b!1331993))

(assert (= (and b!1331993 res!883510) b!1331992))

(assert (= (and b!1331992 res!883511) b!1332001))

(assert (= (and b!1332001 res!883504) b!1331991))

(assert (= (and b!1331991 res!883509) b!1331998))

(assert (= (and b!1331998 res!883506) b!1332000))

(assert (= (and b!1332000 res!883507) b!1331990))

(assert (= (and b!1331994 condMapEmpty!56575) mapIsEmpty!56575))

(assert (= (and b!1331994 (not condMapEmpty!56575)) mapNonEmpty!56575))

(get-info :version)

(assert (= (and mapNonEmpty!56575 ((_ is ValueCellFull!17402) mapValue!56575)) b!1331997))

(assert (= (and b!1331994 ((_ is ValueCellFull!17402) mapDefault!56575)) b!1331995))

(assert (= start!112520 b!1331994))

(declare-fun b_lambda!23945 () Bool)

(assert (=> (not b_lambda!23945) (not b!1331990)))

(declare-fun t!44961 () Bool)

(declare-fun tb!11899 () Bool)

(assert (=> (and start!112520 (= defaultEntry!1323 defaultEntry!1323) t!44961) tb!11899))

(declare-fun result!24877 () Bool)

(assert (=> tb!11899 (= result!24877 tp_is_empty!36601)))

(assert (=> b!1331990 t!44961))

(declare-fun b_and!49441 () Bool)

(assert (= b_and!49439 (and (=> t!44961 result!24877) b_and!49441)))

(declare-fun m!1220951 () Bool)

(assert (=> b!1331996 m!1220951))

(declare-fun m!1220953 () Bool)

(assert (=> start!112520 m!1220953))

(declare-fun m!1220955 () Bool)

(assert (=> start!112520 m!1220955))

(declare-fun m!1220957 () Bool)

(assert (=> start!112520 m!1220957))

(declare-fun m!1220959 () Bool)

(assert (=> mapNonEmpty!56575 m!1220959))

(declare-fun m!1220961 () Bool)

(assert (=> b!1331998 m!1220961))

(assert (=> b!1331998 m!1220961))

(declare-fun m!1220963 () Bool)

(assert (=> b!1331998 m!1220963))

(assert (=> b!1331991 m!1220961))

(declare-fun m!1220965 () Bool)

(assert (=> b!1331990 m!1220965))

(declare-fun m!1220967 () Bool)

(assert (=> b!1331990 m!1220967))

(assert (=> b!1331990 m!1220965))

(declare-fun m!1220969 () Bool)

(assert (=> b!1331990 m!1220969))

(declare-fun m!1220971 () Bool)

(assert (=> b!1331990 m!1220971))

(assert (=> b!1331990 m!1220961))

(declare-fun m!1220973 () Bool)

(assert (=> b!1331990 m!1220973))

(declare-fun m!1220975 () Bool)

(assert (=> b!1331990 m!1220975))

(declare-fun m!1220977 () Bool)

(assert (=> b!1331990 m!1220977))

(declare-fun m!1220979 () Bool)

(assert (=> b!1331990 m!1220979))

(declare-fun m!1220981 () Bool)

(assert (=> b!1331990 m!1220981))

(assert (=> b!1331990 m!1220967))

(assert (=> b!1331990 m!1220961))

(declare-fun m!1220983 () Bool)

(assert (=> b!1331993 m!1220983))

(declare-fun m!1220985 () Bool)

(assert (=> b!1332001 m!1220985))

(assert (=> b!1332001 m!1220985))

(declare-fun m!1220987 () Bool)

(assert (=> b!1332001 m!1220987))

(check-sat (not mapNonEmpty!56575) (not b!1331990) (not b!1332001) (not b!1331998) tp_is_empty!36601 (not b_lambda!23945) (not b!1331996) b_and!49441 (not start!112520) (not b!1331993) (not b_next!30691))
(check-sat b_and!49441 (not b_next!30691))
