; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78842 () Bool)

(assert start!78842)

(declare-fun b_free!17055 () Bool)

(declare-fun b_next!17055 () Bool)

(assert (=> start!78842 (= b_free!17055 (not b_next!17055))))

(declare-fun tp!59605 () Bool)

(declare-fun b_and!27847 () Bool)

(assert (=> start!78842 (= tp!59605 b_and!27847)))

(declare-fun b!920867 () Bool)

(declare-fun res!620996 () Bool)

(declare-fun e!516800 () Bool)

(assert (=> b!920867 (=> (not res!620996) (not e!516800))))

(declare-datatypes ((array!55106 0))(
  ( (array!55107 (arr!26498 (Array (_ BitVec 32) (_ BitVec 64))) (size!26957 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55106)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31049 0))(
  ( (V!31050 (val!9832 Int)) )
))
(declare-datatypes ((ValueCell!9300 0))(
  ( (ValueCellFull!9300 (v!12350 V!31049)) (EmptyCell!9300) )
))
(declare-datatypes ((array!55108 0))(
  ( (array!55109 (arr!26499 (Array (_ BitVec 32) ValueCell!9300)) (size!26958 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55108)

(assert (=> b!920867 (= res!620996 (and (= (size!26958 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26957 _keys!1487) (size!26958 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920868 () Bool)

(declare-fun res!620990 () Bool)

(declare-fun e!516803 () Bool)

(assert (=> b!920868 (=> (not res!620990) (not e!516803))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920868 (= res!620990 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920869 () Bool)

(declare-fun e!516807 () Bool)

(assert (=> b!920869 (= e!516807 true)))

(declare-fun lt!413423 () Bool)

(declare-datatypes ((List!18585 0))(
  ( (Nil!18582) (Cons!18581 (h!19727 (_ BitVec 64)) (t!26370 List!18585)) )
))
(declare-fun contains!4806 (List!18585 (_ BitVec 64)) Bool)

(assert (=> b!920869 (= lt!413423 (contains!4806 Nil!18582 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!620998 () Bool)

(assert (=> start!78842 (=> (not res!620998) (not e!516800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78842 (= res!620998 (validMask!0 mask!1881))))

(assert (=> start!78842 e!516800))

(assert (=> start!78842 true))

(declare-fun tp_is_empty!19563 () Bool)

(assert (=> start!78842 tp_is_empty!19563))

(declare-fun e!516806 () Bool)

(declare-fun array_inv!20650 (array!55108) Bool)

(assert (=> start!78842 (and (array_inv!20650 _values!1231) e!516806)))

(assert (=> start!78842 tp!59605))

(declare-fun array_inv!20651 (array!55106) Bool)

(assert (=> start!78842 (array_inv!20651 _keys!1487)))

(declare-fun b!920870 () Bool)

(declare-fun e!516801 () Bool)

(assert (=> b!920870 (= e!516801 (not e!516807))))

(declare-fun res!620989 () Bool)

(assert (=> b!920870 (=> res!620989 e!516807)))

(assert (=> b!920870 (= res!620989 (or (bvsge (size!26957 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26957 _keys!1487))))))

(declare-fun e!516802 () Bool)

(assert (=> b!920870 e!516802))

(declare-fun c!96084 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!920870 (= c!96084 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31074 0))(
  ( (Unit!31075) )
))
(declare-fun lt!413424 () Unit!31074)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31049)

(declare-fun minValue!1173 () V!31049)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!170 (array!55106 array!55108 (_ BitVec 32) (_ BitVec 32) V!31049 V!31049 (_ BitVec 64) (_ BitVec 32) Int) Unit!31074)

(assert (=> b!920870 (= lt!413424 (lemmaListMapContainsThenArrayContainsFrom!170 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55106 (_ BitVec 32) List!18585) Bool)

(assert (=> b!920870 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18582)))

(declare-fun lt!413420 () Unit!31074)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55106 (_ BitVec 32) (_ BitVec 32)) Unit!31074)

(assert (=> b!920870 (= lt!413420 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12782 0))(
  ( (tuple2!12783 (_1!6402 (_ BitVec 64)) (_2!6402 V!31049)) )
))
(declare-datatypes ((List!18586 0))(
  ( (Nil!18583) (Cons!18582 (h!19728 tuple2!12782) (t!26371 List!18586)) )
))
(declare-datatypes ((ListLongMap!11479 0))(
  ( (ListLongMap!11480 (toList!5755 List!18586)) )
))
(declare-fun lt!413421 () ListLongMap!11479)

(declare-fun lt!413422 () tuple2!12782)

(declare-fun contains!4807 (ListLongMap!11479 (_ BitVec 64)) Bool)

(declare-fun +!2663 (ListLongMap!11479 tuple2!12782) ListLongMap!11479)

(assert (=> b!920870 (contains!4807 (+!2663 lt!413421 lt!413422) k0!1099)))

(declare-fun lt!413417 () (_ BitVec 64))

(declare-fun lt!413419 () V!31049)

(declare-fun lt!413418 () Unit!31074)

(declare-fun addStillContains!387 (ListLongMap!11479 (_ BitVec 64) V!31049 (_ BitVec 64)) Unit!31074)

(assert (=> b!920870 (= lt!413418 (addStillContains!387 lt!413421 lt!413417 lt!413419 k0!1099))))

(declare-fun getCurrentListMap!3010 (array!55106 array!55108 (_ BitVec 32) (_ BitVec 32) V!31049 V!31049 (_ BitVec 32) Int) ListLongMap!11479)

(assert (=> b!920870 (= (getCurrentListMap!3010 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2663 (getCurrentListMap!3010 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413422))))

(assert (=> b!920870 (= lt!413422 (tuple2!12783 lt!413417 lt!413419))))

(declare-fun get!13904 (ValueCell!9300 V!31049) V!31049)

(declare-fun dynLambda!1452 (Int (_ BitVec 64)) V!31049)

(assert (=> b!920870 (= lt!413419 (get!13904 (select (arr!26499 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1452 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413425 () Unit!31074)

(declare-fun lemmaListMapRecursiveValidKeyArray!53 (array!55106 array!55108 (_ BitVec 32) (_ BitVec 32) V!31049 V!31049 (_ BitVec 32) Int) Unit!31074)

(assert (=> b!920870 (= lt!413425 (lemmaListMapRecursiveValidKeyArray!53 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920871 () Bool)

(declare-fun res!620986 () Bool)

(assert (=> b!920871 (=> res!620986 e!516807)))

(declare-fun noDuplicate!1336 (List!18585) Bool)

(assert (=> b!920871 (= res!620986 (not (noDuplicate!1336 Nil!18582)))))

(declare-fun b!920872 () Bool)

(assert (=> b!920872 (= e!516802 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920873 () Bool)

(assert (=> b!920873 (= e!516800 e!516803)))

(declare-fun res!620992 () Bool)

(assert (=> b!920873 (=> (not res!620992) (not e!516803))))

(assert (=> b!920873 (= res!620992 (contains!4807 lt!413421 k0!1099))))

(assert (=> b!920873 (= lt!413421 (getCurrentListMap!3010 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920874 () Bool)

(declare-fun res!620993 () Bool)

(assert (=> b!920874 (=> res!620993 e!516807)))

(assert (=> b!920874 (= res!620993 (contains!4806 Nil!18582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920875 () Bool)

(declare-fun res!620995 () Bool)

(assert (=> b!920875 (=> (not res!620995) (not e!516800))))

(assert (=> b!920875 (= res!620995 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18582))))

(declare-fun b!920876 () Bool)

(declare-fun arrayContainsKey!0 (array!55106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920876 (= e!516802 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920877 () Bool)

(declare-fun res!620991 () Bool)

(assert (=> b!920877 (=> (not res!620991) (not e!516800))))

(assert (=> b!920877 (= res!620991 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26957 _keys!1487))))))

(declare-fun mapIsEmpty!31101 () Bool)

(declare-fun mapRes!31101 () Bool)

(assert (=> mapIsEmpty!31101 mapRes!31101))

(declare-fun b!920878 () Bool)

(assert (=> b!920878 (= e!516803 e!516801)))

(declare-fun res!620994 () Bool)

(assert (=> b!920878 (=> (not res!620994) (not e!516801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920878 (= res!620994 (validKeyInArray!0 lt!413417))))

(assert (=> b!920878 (= lt!413417 (select (arr!26498 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920879 () Bool)

(declare-fun res!620987 () Bool)

(assert (=> b!920879 (=> (not res!620987) (not e!516803))))

(declare-fun v!791 () V!31049)

(declare-fun apply!596 (ListLongMap!11479 (_ BitVec 64)) V!31049)

(assert (=> b!920879 (= res!620987 (= (apply!596 lt!413421 k0!1099) v!791))))

(declare-fun b!920880 () Bool)

(declare-fun e!516804 () Bool)

(assert (=> b!920880 (= e!516804 tp_is_empty!19563)))

(declare-fun b!920881 () Bool)

(declare-fun e!516805 () Bool)

(assert (=> b!920881 (= e!516806 (and e!516805 mapRes!31101))))

(declare-fun condMapEmpty!31101 () Bool)

(declare-fun mapDefault!31101 () ValueCell!9300)

(assert (=> b!920881 (= condMapEmpty!31101 (= (arr!26499 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9300)) mapDefault!31101)))))

(declare-fun b!920882 () Bool)

(declare-fun res!620997 () Bool)

(assert (=> b!920882 (=> (not res!620997) (not e!516803))))

(assert (=> b!920882 (= res!620997 (validKeyInArray!0 k0!1099))))

(declare-fun b!920883 () Bool)

(declare-fun res!620988 () Bool)

(assert (=> b!920883 (=> (not res!620988) (not e!516800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55106 (_ BitVec 32)) Bool)

(assert (=> b!920883 (= res!620988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31101 () Bool)

(declare-fun tp!59606 () Bool)

(assert (=> mapNonEmpty!31101 (= mapRes!31101 (and tp!59606 e!516804))))

(declare-fun mapValue!31101 () ValueCell!9300)

(declare-fun mapRest!31101 () (Array (_ BitVec 32) ValueCell!9300))

(declare-fun mapKey!31101 () (_ BitVec 32))

(assert (=> mapNonEmpty!31101 (= (arr!26499 _values!1231) (store mapRest!31101 mapKey!31101 mapValue!31101))))

(declare-fun b!920884 () Bool)

(assert (=> b!920884 (= e!516805 tp_is_empty!19563)))

(assert (= (and start!78842 res!620998) b!920867))

(assert (= (and b!920867 res!620996) b!920883))

(assert (= (and b!920883 res!620988) b!920875))

(assert (= (and b!920875 res!620995) b!920877))

(assert (= (and b!920877 res!620991) b!920873))

(assert (= (and b!920873 res!620992) b!920879))

(assert (= (and b!920879 res!620987) b!920868))

(assert (= (and b!920868 res!620990) b!920882))

(assert (= (and b!920882 res!620997) b!920878))

(assert (= (and b!920878 res!620994) b!920870))

(assert (= (and b!920870 c!96084) b!920876))

(assert (= (and b!920870 (not c!96084)) b!920872))

(assert (= (and b!920870 (not res!620989)) b!920871))

(assert (= (and b!920871 (not res!620986)) b!920874))

(assert (= (and b!920874 (not res!620993)) b!920869))

(assert (= (and b!920881 condMapEmpty!31101) mapIsEmpty!31101))

(assert (= (and b!920881 (not condMapEmpty!31101)) mapNonEmpty!31101))

(get-info :version)

(assert (= (and mapNonEmpty!31101 ((_ is ValueCellFull!9300) mapValue!31101)) b!920880))

(assert (= (and b!920881 ((_ is ValueCellFull!9300) mapDefault!31101)) b!920884))

(assert (= start!78842 b!920881))

(declare-fun b_lambda!13557 () Bool)

(assert (=> (not b_lambda!13557) (not b!920870)))

(declare-fun t!26369 () Bool)

(declare-fun tb!5635 () Bool)

(assert (=> (and start!78842 (= defaultEntry!1235 defaultEntry!1235) t!26369) tb!5635))

(declare-fun result!11093 () Bool)

(assert (=> tb!5635 (= result!11093 tp_is_empty!19563)))

(assert (=> b!920870 t!26369))

(declare-fun b_and!27849 () Bool)

(assert (= b_and!27847 (and (=> t!26369 result!11093) b_and!27849)))

(declare-fun m!854803 () Bool)

(assert (=> b!920869 m!854803))

(declare-fun m!854805 () Bool)

(assert (=> b!920883 m!854805))

(declare-fun m!854807 () Bool)

(assert (=> mapNonEmpty!31101 m!854807))

(declare-fun m!854809 () Bool)

(assert (=> b!920875 m!854809))

(declare-fun m!854811 () Bool)

(assert (=> b!920874 m!854811))

(declare-fun m!854813 () Bool)

(assert (=> b!920873 m!854813))

(declare-fun m!854815 () Bool)

(assert (=> b!920873 m!854815))

(declare-fun m!854817 () Bool)

(assert (=> start!78842 m!854817))

(declare-fun m!854819 () Bool)

(assert (=> start!78842 m!854819))

(declare-fun m!854821 () Bool)

(assert (=> start!78842 m!854821))

(declare-fun m!854823 () Bool)

(assert (=> b!920876 m!854823))

(declare-fun m!854825 () Bool)

(assert (=> b!920871 m!854825))

(declare-fun m!854827 () Bool)

(assert (=> b!920879 m!854827))

(declare-fun m!854829 () Bool)

(assert (=> b!920878 m!854829))

(declare-fun m!854831 () Bool)

(assert (=> b!920878 m!854831))

(declare-fun m!854833 () Bool)

(assert (=> b!920870 m!854833))

(declare-fun m!854835 () Bool)

(assert (=> b!920870 m!854835))

(declare-fun m!854837 () Bool)

(assert (=> b!920870 m!854837))

(declare-fun m!854839 () Bool)

(assert (=> b!920870 m!854839))

(declare-fun m!854841 () Bool)

(assert (=> b!920870 m!854841))

(declare-fun m!854843 () Bool)

(assert (=> b!920870 m!854843))

(assert (=> b!920870 m!854839))

(declare-fun m!854845 () Bool)

(assert (=> b!920870 m!854845))

(declare-fun m!854847 () Bool)

(assert (=> b!920870 m!854847))

(declare-fun m!854849 () Bool)

(assert (=> b!920870 m!854849))

(declare-fun m!854851 () Bool)

(assert (=> b!920870 m!854851))

(assert (=> b!920870 m!854845))

(assert (=> b!920870 m!854841))

(declare-fun m!854853 () Bool)

(assert (=> b!920870 m!854853))

(declare-fun m!854855 () Bool)

(assert (=> b!920870 m!854855))

(assert (=> b!920870 m!854835))

(declare-fun m!854857 () Bool)

(assert (=> b!920870 m!854857))

(declare-fun m!854859 () Bool)

(assert (=> b!920882 m!854859))

(check-sat (not b!920883) (not b!920876) (not b!920869) (not b_lambda!13557) (not b!920875) (not b!920882) (not start!78842) (not b!920870) (not b!920874) (not b!920873) tp_is_empty!19563 (not mapNonEmpty!31101) (not b!920879) b_and!27849 (not b!920878) (not b!920871) (not b_next!17055))
(check-sat b_and!27849 (not b_next!17055))
