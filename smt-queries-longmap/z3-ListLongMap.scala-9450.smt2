; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112308 () Bool)

(assert start!112308)

(declare-fun b_free!30703 () Bool)

(declare-fun b_next!30703 () Bool)

(assert (=> start!112308 (= b_free!30703 (not b_next!30703))))

(declare-fun tp!107746 () Bool)

(declare-fun b_and!49443 () Bool)

(assert (=> start!112308 (= tp!107746 b_and!49443)))

(declare-fun b!1330849 () Bool)

(declare-fun res!883125 () Bool)

(declare-fun e!758440 () Bool)

(assert (=> b!1330849 (=> (not res!883125) (not e!758440))))

(declare-datatypes ((array!90045 0))(
  ( (array!90046 (arr!43489 (Array (_ BitVec 32) (_ BitVec 64))) (size!44041 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90045)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330849 (= res!883125 (validKeyInArray!0 (select (arr!43489 _keys!1590) from!1980)))))

(declare-fun b!1330850 () Bool)

(declare-fun res!883123 () Bool)

(assert (=> b!1330850 (=> (not res!883123) (not e!758440))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330850 (= res!883123 (not (= (select (arr!43489 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56593 () Bool)

(declare-fun mapRes!56593 () Bool)

(declare-fun tp!107747 () Bool)

(declare-fun e!758439 () Bool)

(assert (=> mapNonEmpty!56593 (= mapRes!56593 (and tp!107747 e!758439))))

(declare-datatypes ((V!53921 0))(
  ( (V!53922 (val!18381 Int)) )
))
(declare-datatypes ((ValueCell!17408 0))(
  ( (ValueCellFull!17408 (v!21017 V!53921)) (EmptyCell!17408) )
))
(declare-datatypes ((array!90047 0))(
  ( (array!90048 (arr!43490 (Array (_ BitVec 32) ValueCell!17408)) (size!44042 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90047)

(declare-fun mapRest!56593 () (Array (_ BitVec 32) ValueCell!17408))

(declare-fun mapValue!56593 () ValueCell!17408)

(declare-fun mapKey!56593 () (_ BitVec 32))

(assert (=> mapNonEmpty!56593 (= (arr!43490 _values!1320) (store mapRest!56593 mapKey!56593 mapValue!56593))))

(declare-fun b!1330851 () Bool)

(declare-fun res!883124 () Bool)

(assert (=> b!1330851 (=> (not res!883124) (not e!758440))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90045 (_ BitVec 32)) Bool)

(assert (=> b!1330851 (= res!883124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330852 () Bool)

(declare-fun tp_is_empty!36613 () Bool)

(assert (=> b!1330852 (= e!758439 tp_is_empty!36613)))

(declare-fun b!1330853 () Bool)

(declare-fun res!883120 () Bool)

(assert (=> b!1330853 (=> (not res!883120) (not e!758440))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330853 (= res!883120 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44041 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330854 () Bool)

(declare-fun res!883121 () Bool)

(assert (=> b!1330854 (=> (not res!883121) (not e!758440))))

(assert (=> b!1330854 (= res!883121 (and (= (size!44042 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44041 _keys!1590) (size!44042 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!883118 () Bool)

(assert (=> start!112308 (=> (not res!883118) (not e!758440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112308 (= res!883118 (validMask!0 mask!1998))))

(assert (=> start!112308 e!758440))

(declare-fun e!758441 () Bool)

(declare-fun array_inv!32983 (array!90047) Bool)

(assert (=> start!112308 (and (array_inv!32983 _values!1320) e!758441)))

(assert (=> start!112308 true))

(declare-fun array_inv!32984 (array!90045) Bool)

(assert (=> start!112308 (array_inv!32984 _keys!1590)))

(assert (=> start!112308 tp!107746))

(assert (=> start!112308 tp_is_empty!36613))

(declare-fun b!1330855 () Bool)

(declare-fun res!883119 () Bool)

(assert (=> b!1330855 (=> (not res!883119) (not e!758440))))

(assert (=> b!1330855 (= res!883119 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330856 () Bool)

(declare-fun res!883122 () Bool)

(assert (=> b!1330856 (=> (not res!883122) (not e!758440))))

(declare-datatypes ((List!30878 0))(
  ( (Nil!30875) (Cons!30874 (h!32083 (_ BitVec 64)) (t!44986 List!30878)) )
))
(declare-fun arrayNoDuplicates!0 (array!90045 (_ BitVec 32) List!30878) Bool)

(assert (=> b!1330856 (= res!883122 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30875))))

(declare-fun b!1330857 () Bool)

(declare-fun e!758442 () Bool)

(assert (=> b!1330857 (= e!758442 tp_is_empty!36613)))

(declare-fun b!1330858 () Bool)

(assert (=> b!1330858 (= e!758441 (and e!758442 mapRes!56593))))

(declare-fun condMapEmpty!56593 () Bool)

(declare-fun mapDefault!56593 () ValueCell!17408)

(assert (=> b!1330858 (= condMapEmpty!56593 (= (arr!43490 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17408)) mapDefault!56593)))))

(declare-fun b!1330859 () Bool)

(assert (=> b!1330859 (= e!758440 (not true))))

(declare-datatypes ((tuple2!23736 0))(
  ( (tuple2!23737 (_1!11879 (_ BitVec 64)) (_2!11879 V!53921)) )
))
(declare-datatypes ((List!30879 0))(
  ( (Nil!30876) (Cons!30875 (h!32084 tuple2!23736) (t!44987 List!30879)) )
))
(declare-datatypes ((ListLongMap!21393 0))(
  ( (ListLongMap!21394 (toList!10712 List!30879)) )
))
(declare-fun lt!591145 () ListLongMap!21393)

(declare-fun contains!8804 (ListLongMap!21393 (_ BitVec 64)) Bool)

(assert (=> b!1330859 (contains!8804 lt!591145 k0!1153)))

(declare-datatypes ((Unit!43600 0))(
  ( (Unit!43601) )
))
(declare-fun lt!591147 () Unit!43600)

(declare-fun lt!591148 () V!53921)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!250 ((_ BitVec 64) (_ BitVec 64) V!53921 ListLongMap!21393) Unit!43600)

(assert (=> b!1330859 (= lt!591147 (lemmaInListMapAfterAddingDiffThenInBefore!250 k0!1153 (select (arr!43489 _keys!1590) from!1980) lt!591148 lt!591145))))

(declare-fun lt!591144 () ListLongMap!21393)

(assert (=> b!1330859 (contains!8804 lt!591144 k0!1153)))

(declare-fun lt!591146 () Unit!43600)

(declare-fun minValue!1262 () V!53921)

(assert (=> b!1330859 (= lt!591146 (lemmaInListMapAfterAddingDiffThenInBefore!250 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591144))))

(declare-fun +!4694 (ListLongMap!21393 tuple2!23736) ListLongMap!21393)

(assert (=> b!1330859 (= lt!591144 (+!4694 lt!591145 (tuple2!23737 (select (arr!43489 _keys!1590) from!1980) lt!591148)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21925 (ValueCell!17408 V!53921) V!53921)

(declare-fun dynLambda!3624 (Int (_ BitVec 64)) V!53921)

(assert (=> b!1330859 (= lt!591148 (get!21925 (select (arr!43490 _values!1320) from!1980) (dynLambda!3624 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53921)

(declare-fun getCurrentListMapNoExtraKeys!6332 (array!90045 array!90047 (_ BitVec 32) (_ BitVec 32) V!53921 V!53921 (_ BitVec 32) Int) ListLongMap!21393)

(assert (=> b!1330859 (= lt!591145 (getCurrentListMapNoExtraKeys!6332 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330860 () Bool)

(declare-fun res!883126 () Bool)

(assert (=> b!1330860 (=> (not res!883126) (not e!758440))))

(declare-fun getCurrentListMap!5576 (array!90045 array!90047 (_ BitVec 32) (_ BitVec 32) V!53921 V!53921 (_ BitVec 32) Int) ListLongMap!21393)

(assert (=> b!1330860 (= res!883126 (contains!8804 (getCurrentListMap!5576 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56593 () Bool)

(assert (=> mapIsEmpty!56593 mapRes!56593))

(assert (= (and start!112308 res!883118) b!1330854))

(assert (= (and b!1330854 res!883121) b!1330851))

(assert (= (and b!1330851 res!883124) b!1330856))

(assert (= (and b!1330856 res!883122) b!1330853))

(assert (= (and b!1330853 res!883120) b!1330860))

(assert (= (and b!1330860 res!883126) b!1330850))

(assert (= (and b!1330850 res!883123) b!1330849))

(assert (= (and b!1330849 res!883125) b!1330855))

(assert (= (and b!1330855 res!883119) b!1330859))

(assert (= (and b!1330858 condMapEmpty!56593) mapIsEmpty!56593))

(assert (= (and b!1330858 (not condMapEmpty!56593)) mapNonEmpty!56593))

(get-info :version)

(assert (= (and mapNonEmpty!56593 ((_ is ValueCellFull!17408) mapValue!56593)) b!1330852))

(assert (= (and b!1330858 ((_ is ValueCellFull!17408) mapDefault!56593)) b!1330857))

(assert (= start!112308 b!1330858))

(declare-fun b_lambda!23953 () Bool)

(assert (=> (not b_lambda!23953) (not b!1330859)))

(declare-fun t!44985 () Bool)

(declare-fun tb!11911 () Bool)

(assert (=> (and start!112308 (= defaultEntry!1323 defaultEntry!1323) t!44985) tb!11911))

(declare-fun result!24901 () Bool)

(assert (=> tb!11911 (= result!24901 tp_is_empty!36613)))

(assert (=> b!1330859 t!44985))

(declare-fun b_and!49445 () Bool)

(assert (= b_and!49443 (and (=> t!44985 result!24901) b_and!49445)))

(declare-fun m!1219065 () Bool)

(assert (=> mapNonEmpty!56593 m!1219065))

(declare-fun m!1219067 () Bool)

(assert (=> b!1330849 m!1219067))

(assert (=> b!1330849 m!1219067))

(declare-fun m!1219069 () Bool)

(assert (=> b!1330849 m!1219069))

(declare-fun m!1219071 () Bool)

(assert (=> b!1330851 m!1219071))

(declare-fun m!1219073 () Bool)

(assert (=> b!1330856 m!1219073))

(declare-fun m!1219075 () Bool)

(assert (=> start!112308 m!1219075))

(declare-fun m!1219077 () Bool)

(assert (=> start!112308 m!1219077))

(declare-fun m!1219079 () Bool)

(assert (=> start!112308 m!1219079))

(assert (=> b!1330850 m!1219067))

(assert (=> b!1330859 m!1219067))

(declare-fun m!1219081 () Bool)

(assert (=> b!1330859 m!1219081))

(declare-fun m!1219083 () Bool)

(assert (=> b!1330859 m!1219083))

(declare-fun m!1219085 () Bool)

(assert (=> b!1330859 m!1219085))

(assert (=> b!1330859 m!1219083))

(declare-fun m!1219087 () Bool)

(assert (=> b!1330859 m!1219087))

(declare-fun m!1219089 () Bool)

(assert (=> b!1330859 m!1219089))

(declare-fun m!1219091 () Bool)

(assert (=> b!1330859 m!1219091))

(declare-fun m!1219093 () Bool)

(assert (=> b!1330859 m!1219093))

(declare-fun m!1219095 () Bool)

(assert (=> b!1330859 m!1219095))

(assert (=> b!1330859 m!1219067))

(assert (=> b!1330859 m!1219085))

(declare-fun m!1219097 () Bool)

(assert (=> b!1330859 m!1219097))

(declare-fun m!1219099 () Bool)

(assert (=> b!1330860 m!1219099))

(assert (=> b!1330860 m!1219099))

(declare-fun m!1219101 () Bool)

(assert (=> b!1330860 m!1219101))

(check-sat (not start!112308) (not mapNonEmpty!56593) (not b!1330860) (not b!1330856) (not b!1330859) (not b!1330849) (not b!1330851) (not b_lambda!23953) (not b_next!30703) tp_is_empty!36613 b_and!49445)
(check-sat b_and!49445 (not b_next!30703))
