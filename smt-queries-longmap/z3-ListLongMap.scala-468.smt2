; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9020 () Bool)

(assert start!9020)

(declare-fun b!63891 () Bool)

(declare-fun b_free!2009 () Bool)

(declare-fun b_next!2009 () Bool)

(assert (=> b!63891 (= b_free!2009 (not b_next!2009))))

(declare-fun tp!8164 () Bool)

(declare-fun b_and!3919 () Bool)

(assert (=> b!63891 (= tp!8164 b_and!3919)))

(declare-fun b!63890 () Bool)

(declare-fun b_free!2011 () Bool)

(declare-fun b_next!2011 () Bool)

(assert (=> b!63890 (= b_free!2011 (not b_next!2011))))

(declare-fun tp!8163 () Bool)

(declare-fun b_and!3921 () Bool)

(assert (=> b!63890 (= tp!8163 b_and!3921)))

(declare-fun b!63874 () Bool)

(declare-fun res!34902 () Bool)

(declare-fun e!41894 () Bool)

(assert (=> b!63874 (=> (not res!34902) (not e!41894))))

(declare-datatypes ((V!2875 0))(
  ( (V!2876 (val!1255 Int)) )
))
(declare-datatypes ((array!3775 0))(
  ( (array!3776 (arr!1805 (Array (_ BitVec 32) (_ BitVec 64))) (size!2038 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!867 0))(
  ( (ValueCellFull!867 (v!2434 V!2875)) (EmptyCell!867) )
))
(declare-datatypes ((array!3777 0))(
  ( (array!3778 (arr!1806 (Array (_ BitVec 32) ValueCell!867)) (size!2039 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!642 0))(
  ( (LongMapFixedSize!643 (defaultEntry!2109 Int) (mask!6025 (_ BitVec 32)) (extraKeys!1984 (_ BitVec 32)) (zeroValue!2019 V!2875) (minValue!2019 V!2875) (_size!370 (_ BitVec 32)) (_keys!3745 array!3775) (_values!2092 array!3777) (_vacant!370 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!642)

(declare-fun valid!265 (LongMapFixedSize!642) Bool)

(assert (=> b!63874 (= res!34902 (valid!265 newMap!16))))

(declare-fun mapIsEmpty!2969 () Bool)

(declare-fun mapRes!2969 () Bool)

(assert (=> mapIsEmpty!2969 mapRes!2969))

(declare-fun res!34908 () Bool)

(assert (=> start!9020 (=> (not res!34908) (not e!41894))))

(declare-datatypes ((Cell!450 0))(
  ( (Cell!451 (v!2435 LongMapFixedSize!642)) )
))
(declare-datatypes ((LongMap!450 0))(
  ( (LongMap!451 (underlying!236 Cell!450)) )
))
(declare-fun thiss!992 () LongMap!450)

(declare-fun valid!266 (LongMap!450) Bool)

(assert (=> start!9020 (= res!34908 (valid!266 thiss!992))))

(assert (=> start!9020 e!41894))

(declare-fun e!41888 () Bool)

(assert (=> start!9020 e!41888))

(assert (=> start!9020 true))

(declare-fun e!41890 () Bool)

(assert (=> start!9020 e!41890))

(declare-fun mapIsEmpty!2970 () Bool)

(declare-fun mapRes!2970 () Bool)

(assert (=> mapIsEmpty!2970 mapRes!2970))

(declare-fun b!63875 () Bool)

(declare-fun e!41886 () Bool)

(assert (=> b!63875 (= e!41888 e!41886)))

(declare-fun b!63876 () Bool)

(declare-fun e!41896 () Bool)

(declare-fun e!41897 () Bool)

(assert (=> b!63876 (= e!41896 (and e!41897 mapRes!2970))))

(declare-fun condMapEmpty!2969 () Bool)

(declare-fun mapDefault!2970 () ValueCell!867)

(assert (=> b!63876 (= condMapEmpty!2969 (= (arr!1806 (_values!2092 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!867)) mapDefault!2970)))))

(declare-fun b!63877 () Bool)

(declare-fun e!41893 () Bool)

(declare-fun tp_is_empty!2421 () Bool)

(assert (=> b!63877 (= e!41893 tp_is_empty!2421)))

(declare-fun b!63878 () Bool)

(declare-fun e!41885 () Bool)

(assert (=> b!63878 (= e!41885 (and e!41893 mapRes!2969))))

(declare-fun condMapEmpty!2970 () Bool)

(declare-fun mapDefault!2969 () ValueCell!867)

(assert (=> b!63878 (= condMapEmpty!2970 (= (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!867)) mapDefault!2969)))))

(declare-fun b!63879 () Bool)

(declare-fun e!41889 () Bool)

(assert (=> b!63879 (= e!41886 e!41889)))

(declare-fun b!63880 () Bool)

(declare-fun res!34907 () Bool)

(assert (=> b!63880 (=> (not res!34907) (not e!41894))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!63880 (= res!34907 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun b!63881 () Bool)

(declare-datatypes ((Unit!1757 0))(
  ( (Unit!1758) )
))
(declare-fun e!41887 () Unit!1757)

(declare-fun Unit!1759 () Unit!1757)

(assert (=> b!63881 (= e!41887 Unit!1759)))

(declare-fun mapNonEmpty!2969 () Bool)

(declare-fun tp!8165 () Bool)

(declare-fun e!41891 () Bool)

(assert (=> mapNonEmpty!2969 (= mapRes!2969 (and tp!8165 e!41891))))

(declare-fun mapRest!2969 () (Array (_ BitVec 32) ValueCell!867))

(declare-fun mapValue!2969 () ValueCell!867)

(declare-fun mapKey!2970 () (_ BitVec 32))

(assert (=> mapNonEmpty!2969 (= (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (store mapRest!2969 mapKey!2970 mapValue!2969))))

(declare-fun mapNonEmpty!2970 () Bool)

(declare-fun tp!8166 () Bool)

(declare-fun e!41895 () Bool)

(assert (=> mapNonEmpty!2970 (= mapRes!2970 (and tp!8166 e!41895))))

(declare-fun mapKey!2969 () (_ BitVec 32))

(declare-fun mapValue!2970 () ValueCell!867)

(declare-fun mapRest!2970 () (Array (_ BitVec 32) ValueCell!867))

(assert (=> mapNonEmpty!2970 (= (arr!1806 (_values!2092 newMap!16)) (store mapRest!2970 mapKey!2969 mapValue!2970))))

(declare-fun b!63882 () Bool)

(assert (=> b!63882 (= e!41897 tp_is_empty!2421)))

(declare-fun b!63883 () Bool)

(assert (=> b!63883 (= e!41891 tp_is_empty!2421)))

(declare-fun b!63884 () Bool)

(assert (=> b!63884 (= e!41895 tp_is_empty!2421)))

(declare-fun b!63885 () Bool)

(declare-fun res!34901 () Bool)

(declare-fun e!41892 () Bool)

(assert (=> b!63885 (=> (not res!34901) (not e!41892))))

(assert (=> b!63885 (= res!34901 (and (= (size!2039 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6025 (v!2435 (underlying!236 thiss!992))))) (= (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (size!2039 (_values!2092 (v!2435 (underlying!236 thiss!992))))) (bvsge (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!63886 () Bool)

(declare-fun e!41883 () Bool)

(assert (=> b!63886 (= e!41894 e!41883)))

(declare-fun res!34905 () Bool)

(assert (=> b!63886 (=> (not res!34905) (not e!41883))))

(declare-datatypes ((tuple2!2050 0))(
  ( (tuple2!2051 (_1!1036 (_ BitVec 64)) (_2!1036 V!2875)) )
))
(declare-datatypes ((List!1444 0))(
  ( (Nil!1441) (Cons!1440 (h!2024 tuple2!2050) (t!4858 List!1444)) )
))
(declare-datatypes ((ListLongMap!1379 0))(
  ( (ListLongMap!1380 (toList!705 List!1444)) )
))
(declare-fun lt!27014 () ListLongMap!1379)

(declare-fun lt!27020 () ListLongMap!1379)

(assert (=> b!63886 (= res!34905 (and (= lt!27014 lt!27020) (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1118 (LongMapFixedSize!642) ListLongMap!1379)

(assert (=> b!63886 (= lt!27020 (map!1118 newMap!16))))

(declare-fun getCurrentListMap!407 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 32) Int) ListLongMap!1379)

(assert (=> b!63886 (= lt!27014 (getCurrentListMap!407 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!63887 () Bool)

(assert (=> b!63887 (= e!41883 e!41892)))

(declare-fun res!34904 () Bool)

(assert (=> b!63887 (=> (not res!34904) (not e!41892))))

(declare-datatypes ((tuple2!2052 0))(
  ( (tuple2!2053 (_1!1037 Bool) (_2!1037 LongMapFixedSize!642)) )
))
(declare-fun lt!27017 () tuple2!2052)

(assert (=> b!63887 (= res!34904 (and (_1!1037 lt!27017) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!27018 () Unit!1757)

(assert (=> b!63887 (= lt!27018 e!41887)))

(declare-fun c!8676 () Bool)

(declare-fun contains!695 (ListLongMap!1379 (_ BitVec 64)) Bool)

(assert (=> b!63887 (= c!8676 (contains!695 lt!27020 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun update!80 (LongMapFixedSize!642 (_ BitVec 64) V!2875) tuple2!2052)

(declare-fun get!1090 (ValueCell!867 V!2875) V!2875)

(declare-fun dynLambda!311 (Int (_ BitVec 64)) V!2875)

(assert (=> b!63887 (= lt!27017 (update!80 newMap!16 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!63888 () Bool)

(declare-fun res!34906 () Bool)

(assert (=> b!63888 (=> (not res!34906) (not e!41894))))

(assert (=> b!63888 (= res!34906 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6025 newMap!16)) (_size!370 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!63889 () Bool)

(declare-fun res!34903 () Bool)

(assert (=> b!63889 (=> (not res!34903) (not e!41892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!63889 (= res!34903 (validMask!0 (mask!6025 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun array_inv!1113 (array!3775) Bool)

(declare-fun array_inv!1114 (array!3777) Bool)

(assert (=> b!63890 (= e!41890 (and tp!8163 tp_is_empty!2421 (array_inv!1113 (_keys!3745 newMap!16)) (array_inv!1114 (_values!2092 newMap!16)) e!41896))))

(assert (=> b!63891 (= e!41889 (and tp!8164 tp_is_empty!2421 (array_inv!1113 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (array_inv!1114 (_values!2092 (v!2435 (underlying!236 thiss!992)))) e!41885))))

(declare-fun b!63892 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3775 (_ BitVec 32)) Bool)

(assert (=> b!63892 (= e!41892 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!63893 () Bool)

(declare-fun Unit!1760 () Unit!1757)

(assert (=> b!63893 (= e!41887 Unit!1760)))

(declare-fun lt!27019 () Unit!1757)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!36 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 64) (_ BitVec 32) Int) Unit!1757)

(assert (=> b!63893 (= lt!27019 (lemmaListMapContainsThenArrayContainsFrom!36 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!63893 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!27015 () Unit!1757)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3775 (_ BitVec 32) (_ BitVec 32)) Unit!1757)

(assert (=> b!63893 (= lt!27015 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1445 0))(
  ( (Nil!1442) (Cons!1441 (h!2025 (_ BitVec 64)) (t!4859 List!1445)) )
))
(declare-fun arrayNoDuplicates!0 (array!3775 (_ BitVec 32) List!1445) Bool)

(assert (=> b!63893 (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1442)))

(declare-fun lt!27016 () Unit!1757)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3775 (_ BitVec 32) (_ BitVec 64) List!1445) Unit!1757)

(assert (=> b!63893 (= lt!27016 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442)))))

(assert (=> b!63893 false))

(assert (= (and start!9020 res!34908) b!63880))

(assert (= (and b!63880 res!34907) b!63874))

(assert (= (and b!63874 res!34902) b!63888))

(assert (= (and b!63888 res!34906) b!63886))

(assert (= (and b!63886 res!34905) b!63887))

(assert (= (and b!63887 c!8676) b!63893))

(assert (= (and b!63887 (not c!8676)) b!63881))

(assert (= (and b!63887 res!34904) b!63889))

(assert (= (and b!63889 res!34903) b!63885))

(assert (= (and b!63885 res!34901) b!63892))

(assert (= (and b!63878 condMapEmpty!2970) mapIsEmpty!2969))

(assert (= (and b!63878 (not condMapEmpty!2970)) mapNonEmpty!2969))

(get-info :version)

(assert (= (and mapNonEmpty!2969 ((_ is ValueCellFull!867) mapValue!2969)) b!63883))

(assert (= (and b!63878 ((_ is ValueCellFull!867) mapDefault!2969)) b!63877))

(assert (= b!63891 b!63878))

(assert (= b!63879 b!63891))

(assert (= b!63875 b!63879))

(assert (= start!9020 b!63875))

(assert (= (and b!63876 condMapEmpty!2969) mapIsEmpty!2970))

(assert (= (and b!63876 (not condMapEmpty!2969)) mapNonEmpty!2970))

(assert (= (and mapNonEmpty!2970 ((_ is ValueCellFull!867) mapValue!2970)) b!63884))

(assert (= (and b!63876 ((_ is ValueCellFull!867) mapDefault!2970)) b!63882))

(assert (= b!63890 b!63876))

(assert (= start!9020 b!63890))

(declare-fun b_lambda!2875 () Bool)

(assert (=> (not b_lambda!2875) (not b!63887)))

(declare-fun t!4855 () Bool)

(declare-fun tb!1389 () Bool)

(assert (=> (and b!63891 (= (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))) t!4855) tb!1389))

(declare-fun result!2473 () Bool)

(assert (=> tb!1389 (= result!2473 tp_is_empty!2421)))

(assert (=> b!63887 t!4855))

(declare-fun b_and!3923 () Bool)

(assert (= b_and!3919 (and (=> t!4855 result!2473) b_and!3923)))

(declare-fun tb!1391 () Bool)

(declare-fun t!4857 () Bool)

(assert (=> (and b!63890 (= (defaultEntry!2109 newMap!16) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))) t!4857) tb!1391))

(declare-fun result!2477 () Bool)

(assert (= result!2477 result!2473))

(assert (=> b!63887 t!4857))

(declare-fun b_and!3925 () Bool)

(assert (= b_and!3921 (and (=> t!4857 result!2477) b_and!3925)))

(declare-fun m!58533 () Bool)

(assert (=> mapNonEmpty!2969 m!58533))

(declare-fun m!58535 () Bool)

(assert (=> b!63890 m!58535))

(declare-fun m!58537 () Bool)

(assert (=> b!63890 m!58537))

(declare-fun m!58539 () Bool)

(assert (=> b!63886 m!58539))

(declare-fun m!58541 () Bool)

(assert (=> b!63886 m!58541))

(declare-fun m!58543 () Bool)

(assert (=> b!63886 m!58543))

(declare-fun m!58545 () Bool)

(assert (=> b!63893 m!58545))

(declare-fun m!58547 () Bool)

(assert (=> b!63893 m!58547))

(assert (=> b!63893 m!58539))

(declare-fun m!58549 () Bool)

(assert (=> b!63893 m!58549))

(assert (=> b!63893 m!58539))

(assert (=> b!63893 m!58539))

(declare-fun m!58551 () Bool)

(assert (=> b!63893 m!58551))

(assert (=> b!63893 m!58539))

(declare-fun m!58553 () Bool)

(assert (=> b!63893 m!58553))

(declare-fun m!58555 () Bool)

(assert (=> b!63889 m!58555))

(declare-fun m!58557 () Bool)

(assert (=> b!63892 m!58557))

(declare-fun m!58559 () Bool)

(assert (=> b!63874 m!58559))

(declare-fun m!58561 () Bool)

(assert (=> start!9020 m!58561))

(declare-fun m!58563 () Bool)

(assert (=> b!63887 m!58563))

(declare-fun m!58565 () Bool)

(assert (=> b!63887 m!58565))

(declare-fun m!58567 () Bool)

(assert (=> b!63887 m!58567))

(assert (=> b!63887 m!58565))

(assert (=> b!63887 m!58539))

(assert (=> b!63887 m!58567))

(declare-fun m!58569 () Bool)

(assert (=> b!63887 m!58569))

(assert (=> b!63887 m!58563))

(assert (=> b!63887 m!58539))

(assert (=> b!63887 m!58539))

(declare-fun m!58571 () Bool)

(assert (=> b!63887 m!58571))

(declare-fun m!58573 () Bool)

(assert (=> mapNonEmpty!2970 m!58573))

(declare-fun m!58575 () Bool)

(assert (=> b!63891 m!58575))

(declare-fun m!58577 () Bool)

(assert (=> b!63891 m!58577))

(check-sat (not start!9020) (not b!63892) b_and!3925 (not b!63874) (not b!63889) (not b!63886) (not b_next!2011) (not b!63891) (not b_lambda!2875) (not b!63887) tp_is_empty!2421 (not b!63893) (not b_next!2009) (not mapNonEmpty!2970) b_and!3923 (not b!63890) (not mapNonEmpty!2969))
(check-sat b_and!3923 b_and!3925 (not b_next!2009) (not b_next!2011))
(get-model)

(declare-fun b_lambda!2879 () Bool)

(assert (= b_lambda!2875 (or (and b!63891 b_free!2009) (and b!63890 b_free!2011 (= (defaultEntry!2109 newMap!16) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))))) b_lambda!2879)))

(check-sat (not start!9020) (not b!63892) b_and!3925 (not b!63874) (not b!63889) (not b!63886) (not b_next!2011) (not b!63891) (not b_lambda!2879) (not b!63887) tp_is_empty!2421 (not b!63893) (not b_next!2009) (not mapNonEmpty!2970) b_and!3923 (not b!63890) (not mapNonEmpty!2969))
(check-sat b_and!3923 b_and!3925 (not b_next!2009) (not b_next!2011))
(get-model)

(declare-fun d!13347 () Bool)

(declare-fun e!41952 () Bool)

(assert (=> d!13347 e!41952))

(declare-fun res!34935 () Bool)

(assert (=> d!13347 (=> res!34935 e!41952)))

(declare-fun lt!27053 () Bool)

(assert (=> d!13347 (= res!34935 (not lt!27053))))

(declare-fun lt!27052 () Bool)

(assert (=> d!13347 (= lt!27053 lt!27052)))

(declare-fun lt!27051 () Unit!1757)

(declare-fun e!41951 () Unit!1757)

(assert (=> d!13347 (= lt!27051 e!41951)))

(declare-fun c!8682 () Bool)

(assert (=> d!13347 (= c!8682 lt!27052)))

(declare-fun containsKey!131 (List!1444 (_ BitVec 64)) Bool)

(assert (=> d!13347 (= lt!27052 (containsKey!131 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13347 (= (contains!695 lt!27020 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27053)))

(declare-fun b!63964 () Bool)

(declare-fun lt!27050 () Unit!1757)

(assert (=> b!63964 (= e!41951 lt!27050)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!79 (List!1444 (_ BitVec 64)) Unit!1757)

(assert (=> b!63964 (= lt!27050 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-datatypes ((Option!133 0))(
  ( (Some!132 (v!2439 V!2875)) (None!131) )
))
(declare-fun isDefined!80 (Option!133) Bool)

(declare-fun getValueByKey!127 (List!1444 (_ BitVec 64)) Option!133)

(assert (=> b!63964 (isDefined!80 (getValueByKey!127 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!63965 () Bool)

(declare-fun Unit!1765 () Unit!1757)

(assert (=> b!63965 (= e!41951 Unit!1765)))

(declare-fun b!63966 () Bool)

(assert (=> b!63966 (= e!41952 (isDefined!80 (getValueByKey!127 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (= (and d!13347 c!8682) b!63964))

(assert (= (and d!13347 (not c!8682)) b!63965))

(assert (= (and d!13347 (not res!34935)) b!63966))

(assert (=> d!13347 m!58539))

(declare-fun m!58625 () Bool)

(assert (=> d!13347 m!58625))

(assert (=> b!63964 m!58539))

(declare-fun m!58627 () Bool)

(assert (=> b!63964 m!58627))

(assert (=> b!63964 m!58539))

(declare-fun m!58629 () Bool)

(assert (=> b!63964 m!58629))

(assert (=> b!63964 m!58629))

(declare-fun m!58631 () Bool)

(assert (=> b!63964 m!58631))

(assert (=> b!63966 m!58539))

(assert (=> b!63966 m!58629))

(assert (=> b!63966 m!58629))

(assert (=> b!63966 m!58631))

(assert (=> b!63887 d!13347))

(declare-fun b!64043 () Bool)

(declare-fun e!42000 () Unit!1757)

(declare-fun lt!27128 () Unit!1757)

(assert (=> b!64043 (= e!42000 lt!27128)))

(declare-fun call!5135 () Unit!1757)

(assert (=> b!64043 (= lt!27128 call!5135)))

(declare-datatypes ((SeekEntryResult!230 0))(
  ( (MissingZero!230 (index!3046 (_ BitVec 32))) (Found!230 (index!3047 (_ BitVec 32))) (Intermediate!230 (undefined!1042 Bool) (index!3048 (_ BitVec 32)) (x!10452 (_ BitVec 32))) (Undefined!230) (MissingVacant!230 (index!3049 (_ BitVec 32))) )
))
(declare-fun lt!27110 () SeekEntryResult!230)

(declare-fun call!5126 () SeekEntryResult!230)

(assert (=> b!64043 (= lt!27110 call!5126)))

(declare-fun res!34968 () Bool)

(assert (=> b!64043 (= res!34968 ((_ is Found!230) lt!27110))))

(declare-fun e!42011 () Bool)

(assert (=> b!64043 (=> (not res!34968) (not e!42011))))

(assert (=> b!64043 e!42011))

(declare-fun b!64044 () Bool)

(declare-fun e!42001 () Bool)

(declare-fun e!42004 () Bool)

(assert (=> b!64044 (= e!42001 e!42004)))

(declare-fun res!34973 () Bool)

(declare-fun call!5133 () Bool)

(assert (=> b!64044 (= res!34973 call!5133)))

(assert (=> b!64044 (=> (not res!34973) (not e!42004))))

(declare-fun b!64045 () Bool)

(declare-fun c!8716 () Bool)

(declare-fun lt!27123 () SeekEntryResult!230)

(assert (=> b!64045 (= c!8716 ((_ is MissingVacant!230) lt!27123))))

(declare-fun e!42005 () tuple2!2052)

(declare-fun e!42002 () tuple2!2052)

(assert (=> b!64045 (= e!42005 e!42002)))

(declare-fun b!64046 () Bool)

(declare-fun lt!27121 () Unit!1757)

(declare-fun lt!27118 () Unit!1757)

(assert (=> b!64046 (= lt!27121 lt!27118)))

(declare-fun call!5125 () ListLongMap!1379)

(declare-fun call!5129 () ListLongMap!1379)

(assert (=> b!64046 (= call!5125 call!5129)))

(declare-fun lt!27119 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!18 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 V!2875 Int) Unit!1757)

(assert (=> b!64046 (= lt!27118 (lemmaChangeZeroKeyThenAddPairToListMap!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) lt!27119 (zeroValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2019 newMap!16) (defaultEntry!2109 newMap!16)))))

(assert (=> b!64046 (= lt!27119 (bvor (extraKeys!1984 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!42008 () tuple2!2052)

(assert (=> b!64046 (= e!42008 (tuple2!2053 true (LongMapFixedSize!643 (defaultEntry!2109 newMap!16) (mask!6025 newMap!16) (bvor (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2019 newMap!16) (_size!370 newMap!16) (_keys!3745 newMap!16) (_values!2092 newMap!16) (_vacant!370 newMap!16))))))

(declare-fun bm!5117 () Bool)

(declare-fun call!5130 () ListLongMap!1379)

(declare-fun lt!27129 () tuple2!2052)

(assert (=> bm!5117 (= call!5130 (map!1118 (_2!1037 lt!27129)))))

(declare-fun bm!5118 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 64) Int) Unit!1757)

(assert (=> bm!5118 (= call!5135 (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)))))

(declare-fun b!64047 () Bool)

(declare-fun e!42007 () Bool)

(declare-fun e!41993 () Bool)

(assert (=> b!64047 (= e!42007 e!41993)))

(declare-fun res!34971 () Bool)

(assert (=> b!64047 (= res!34971 (contains!695 call!5130 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64047 (=> (not res!34971) (not e!41993))))

(declare-fun b!64048 () Bool)

(declare-fun call!5127 () Bool)

(assert (=> b!64048 (= e!42004 (not call!5127))))

(declare-fun b!64049 () Bool)

(declare-fun e!41999 () Bool)

(declare-fun call!5123 () Bool)

(assert (=> b!64049 (= e!41999 (not call!5123))))

(declare-fun b!64050 () Bool)

(declare-fun e!41994 () Unit!1757)

(declare-fun lt!27113 () Unit!1757)

(assert (=> b!64050 (= e!41994 lt!27113)))

(declare-fun call!5120 () Unit!1757)

(assert (=> b!64050 (= lt!27113 call!5120)))

(declare-fun lt!27117 () SeekEntryResult!230)

(declare-fun call!5128 () SeekEntryResult!230)

(assert (=> b!64050 (= lt!27117 call!5128)))

(declare-fun c!8707 () Bool)

(assert (=> b!64050 (= c!8707 ((_ is MissingZero!230) lt!27117))))

(declare-fun e!41998 () Bool)

(assert (=> b!64050 e!41998))

(declare-fun bm!5119 () Bool)

(declare-fun call!5132 () SeekEntryResult!230)

(assert (=> bm!5119 (= call!5126 call!5132)))

(declare-fun b!64051 () Bool)

(declare-fun res!34966 () Bool)

(assert (=> b!64051 (= res!34966 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3049 lt!27117)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41997 () Bool)

(assert (=> b!64051 (=> (not res!34966) (not e!41997))))

(declare-fun b!64052 () Bool)

(assert (=> b!64052 (= e!41997 (not call!5123))))

(declare-fun b!64053 () Bool)

(declare-fun res!34967 () Bool)

(declare-fun call!5122 () Bool)

(assert (=> b!64053 (= res!34967 call!5122)))

(assert (=> b!64053 (=> (not res!34967) (not e!42011))))

(declare-fun call!5143 () ListLongMap!1379)

(declare-fun bm!5120 () Bool)

(declare-fun c!8714 () Bool)

(declare-fun call!5131 () ListLongMap!1379)

(declare-fun c!8708 () Bool)

(declare-fun call!5134 () ListLongMap!1379)

(declare-fun +!84 (ListLongMap!1379 tuple2!2050) ListLongMap!1379)

(assert (=> bm!5120 (= call!5143 (+!84 (ite c!8714 (ite c!8708 call!5131 call!5129) call!5134) (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!64054 () Bool)

(declare-fun lt!27124 () Unit!1757)

(assert (=> b!64054 (= lt!27124 e!41994)))

(declare-fun c!8709 () Bool)

(declare-fun call!5139 () Bool)

(assert (=> b!64054 (= c!8709 call!5139)))

(assert (=> b!64054 (= e!42005 (tuple2!2053 false newMap!16))))

(declare-fun b!64055 () Bool)

(declare-fun lt!27115 () tuple2!2052)

(declare-fun call!5142 () tuple2!2052)

(assert (=> b!64055 (= lt!27115 call!5142)))

(declare-fun e!42009 () tuple2!2052)

(assert (=> b!64055 (= e!42009 (tuple2!2053 (_1!1037 lt!27115) (_2!1037 lt!27115)))))

(declare-fun b!64056 () Bool)

(declare-fun e!42006 () Bool)

(assert (=> b!64056 (= e!42006 e!42007)))

(declare-fun c!8712 () Bool)

(assert (=> b!64056 (= c!8712 (_1!1037 lt!27129))))

(declare-fun b!64057 () Bool)

(declare-fun res!34969 () Bool)

(declare-fun e!41995 () Bool)

(assert (=> b!64057 (=> (not res!34969) (not e!41995))))

(assert (=> b!64057 (= res!34969 call!5133)))

(declare-fun e!42003 () Bool)

(assert (=> b!64057 (= e!42003 e!41995)))

(declare-fun b!64058 () Bool)

(declare-fun e!42012 () tuple2!2052)

(assert (=> b!64058 (= e!42012 e!42005)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3775 (_ BitVec 32)) SeekEntryResult!230)

(assert (=> b!64058 (= lt!27123 (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun c!8717 () Bool)

(assert (=> b!64058 (= c!8717 ((_ is Undefined!230) lt!27123))))

(declare-fun b!64059 () Bool)

(declare-fun res!34977 () Bool)

(assert (=> b!64059 (=> (not res!34977) (not e!41999))))

(assert (=> b!64059 (= res!34977 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3046 lt!27117)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!13349 () Bool)

(assert (=> d!13349 e!42006))

(declare-fun res!34965 () Bool)

(assert (=> d!13349 (=> (not res!34965) (not e!42006))))

(assert (=> d!13349 (= res!34965 (valid!265 (_2!1037 lt!27129)))))

(assert (=> d!13349 (= lt!27129 e!42012)))

(assert (=> d!13349 (= c!8714 (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvneg (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (=> d!13349 (valid!265 newMap!16)))

(assert (=> d!13349 (= (update!80 newMap!16 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!27129)))

(declare-fun call!5124 () Bool)

(declare-fun bm!5121 () Bool)

(assert (=> bm!5121 (= call!5124 (arrayContainsKey!0 (_keys!3745 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64060 () Bool)

(assert (=> b!64060 (= e!42002 e!42009)))

(declare-fun c!8713 () Bool)

(assert (=> b!64060 (= c!8713 ((_ is MissingZero!230) lt!27123))))

(declare-fun bm!5122 () Bool)

(assert (=> bm!5122 (= call!5129 call!5134)))

(declare-fun b!64061 () Bool)

(assert (=> b!64061 (= e!41995 (not call!5127))))

(declare-fun b!64062 () Bool)

(declare-fun res!34974 () Bool)

(assert (=> b!64062 (=> (not res!34974) (not e!41999))))

(declare-fun call!5138 () Bool)

(assert (=> b!64062 (= res!34974 call!5138)))

(assert (=> b!64062 (= e!41998 e!41999)))

(declare-fun b!64063 () Bool)

(declare-fun lt!27112 () Unit!1757)

(declare-fun lt!27116 () Unit!1757)

(assert (=> b!64063 (= lt!27112 lt!27116)))

(assert (=> b!64063 (= call!5125 call!5131)))

(declare-fun lt!27131 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 V!2875 Int) Unit!1757)

(assert (=> b!64063 (= lt!27116 (lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) lt!27131 (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2109 newMap!16)))))

(assert (=> b!64063 (= lt!27131 (bvor (extraKeys!1984 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!64063 (= e!42008 (tuple2!2053 true (LongMapFixedSize!643 (defaultEntry!2109 newMap!16) (mask!6025 newMap!16) (bvor (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) (zeroValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!370 newMap!16) (_keys!3745 newMap!16) (_values!2092 newMap!16) (_vacant!370 newMap!16))))))

(declare-fun bm!5123 () Bool)

(declare-fun call!5121 () ListLongMap!1379)

(assert (=> bm!5123 (= call!5139 (contains!695 call!5121 (ite c!8717 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27123)))))))

(declare-fun b!64064 () Bool)

(declare-fun lt!27133 () tuple2!2052)

(assert (=> b!64064 (= e!42002 (tuple2!2053 (_1!1037 lt!27133) (_2!1037 lt!27133)))))

(assert (=> b!64064 (= lt!27133 call!5142)))

(declare-fun b!64065 () Bool)

(declare-fun lt!27130 () SeekEntryResult!230)

(assert (=> b!64065 (= e!42001 ((_ is Undefined!230) lt!27130))))

(declare-fun b!64066 () Bool)

(declare-fun Unit!1766 () Unit!1757)

(assert (=> b!64066 (= e!42000 Unit!1766)))

(declare-fun lt!27122 () Unit!1757)

(assert (=> b!64066 (= lt!27122 call!5120)))

(assert (=> b!64066 (= lt!27130 call!5126)))

(declare-fun c!8710 () Bool)

(assert (=> b!64066 (= c!8710 ((_ is MissingZero!230) lt!27130))))

(assert (=> b!64066 e!42003))

(declare-fun lt!27108 () Unit!1757)

(assert (=> b!64066 (= lt!27108 lt!27122)))

(assert (=> b!64066 false))

(declare-fun b!64067 () Bool)

(declare-fun e!42010 () Bool)

(assert (=> b!64067 (= e!42010 ((_ is Undefined!230) lt!27117))))

(declare-fun b!64068 () Bool)

(declare-fun c!8718 () Bool)

(assert (=> b!64068 (= c!8718 ((_ is MissingVacant!230) lt!27117))))

(assert (=> b!64068 (= e!41998 e!42010)))

(declare-fun b!64069 () Bool)

(declare-fun call!5141 () ListLongMap!1379)

(assert (=> b!64069 (= e!42007 (= call!5130 call!5141))))

(declare-fun b!64070 () Bool)

(declare-fun c!8715 () Bool)

(assert (=> b!64070 (= c!8715 ((_ is MissingVacant!230) lt!27130))))

(assert (=> b!64070 (= e!42003 e!42001)))

(declare-fun bm!5124 () Bool)

(declare-fun call!5140 () Bool)

(declare-fun lt!27134 () SeekEntryResult!230)

(declare-fun c!8711 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5124 (= call!5140 (inRange!0 (ite c!8717 (ite c!8709 (index!3047 lt!27134) (ite c!8707 (index!3046 lt!27117) (index!3049 lt!27117))) (ite c!8711 (index!3047 lt!27110) (ite c!8710 (index!3046 lt!27130) (index!3049 lt!27130)))) (mask!6025 newMap!16)))))

(declare-fun bm!5125 () Bool)

(declare-fun updateHelperNewKey!18 (LongMapFixedSize!642 (_ BitVec 64) V!2875 (_ BitVec 32)) tuple2!2052)

(assert (=> bm!5125 (= call!5142 (updateHelperNewKey!18 newMap!16 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123))))))

(declare-fun b!64071 () Bool)

(declare-fun lt!27109 () Unit!1757)

(declare-fun lt!27120 () Unit!1757)

(assert (=> b!64071 (= lt!27109 lt!27120)))

(assert (=> b!64071 call!5139))

(declare-fun lt!27114 () array!3777)

(declare-fun lemmaValidKeyInArrayIsInListMap!79 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 32) Int) Unit!1757)

(assert (=> b!64071 (= lt!27120 (lemmaValidKeyInArrayIsInListMap!79 (_keys!3745 newMap!16) lt!27114 (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (index!3047 lt!27123) (defaultEntry!2109 newMap!16)))))

(assert (=> b!64071 (= lt!27114 (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))))))

(declare-fun lt!27132 () Unit!1757)

(declare-fun lt!27126 () Unit!1757)

(assert (=> b!64071 (= lt!27132 lt!27126)))

(assert (=> b!64071 (= call!5143 (getCurrentListMap!407 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 32) (_ BitVec 64) V!2875 Int) Unit!1757)

(assert (=> b!64071 (= lt!27126 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (index!3047 lt!27123) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27111 () Unit!1757)

(assert (=> b!64071 (= lt!27111 e!42000)))

(assert (=> b!64071 (= c!8711 (contains!695 call!5134 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64071 (= e!42009 (tuple2!2053 true (LongMapFixedSize!643 (defaultEntry!2109 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (_size!370 newMap!16) (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (_vacant!370 newMap!16))))))

(declare-fun bm!5126 () Bool)

(assert (=> bm!5126 (= call!5123 call!5124)))

(declare-fun b!64072 () Bool)

(assert (=> b!64072 (= e!41993 (= call!5130 (+!84 call!5141 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!64073 () Bool)

(assert (=> b!64073 (= e!42011 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27110)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun bm!5127 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 64) Int) Unit!1757)

(assert (=> bm!5127 (= call!5120 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)))))

(declare-fun b!64074 () Bool)

(declare-fun res!34964 () Bool)

(assert (=> b!64074 (=> (not res!34964) (not e!41995))))

(assert (=> b!64074 (= res!34964 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3046 lt!27130)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64075 () Bool)

(declare-fun e!41996 () Bool)

(assert (=> b!64075 (= e!41996 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27134)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun bm!5128 () Bool)

(assert (=> bm!5128 (= call!5134 (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun bm!5129 () Bool)

(declare-fun call!5137 () Bool)

(assert (=> bm!5129 (= call!5138 call!5137)))

(declare-fun b!64076 () Bool)

(declare-fun Unit!1767 () Unit!1757)

(assert (=> b!64076 (= e!41994 Unit!1767)))

(declare-fun lt!27125 () Unit!1757)

(assert (=> b!64076 (= lt!27125 call!5135)))

(assert (=> b!64076 (= lt!27134 call!5128)))

(declare-fun res!34975 () Bool)

(assert (=> b!64076 (= res!34975 ((_ is Found!230) lt!27134))))

(assert (=> b!64076 (=> (not res!34975) (not e!41996))))

(assert (=> b!64076 e!41996))

(declare-fun lt!27127 () Unit!1757)

(assert (=> b!64076 (= lt!27127 lt!27125)))

(assert (=> b!64076 false))

(declare-fun bm!5130 () Bool)

(assert (=> bm!5130 (= call!5127 call!5124)))

(declare-fun b!64077 () Bool)

(declare-fun res!34970 () Bool)

(assert (=> b!64077 (= res!34970 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3049 lt!27130)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64077 (=> (not res!34970) (not e!42004))))

(declare-fun b!64078 () Bool)

(assert (=> b!64078 (= e!42012 e!42008)))

(assert (=> b!64078 (= c!8708 (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5131 () Bool)

(assert (=> bm!5131 (= call!5125 call!5143)))

(declare-fun bm!5132 () Bool)

(assert (=> bm!5132 (= call!5137 call!5140)))

(declare-fun bm!5133 () Bool)

(declare-fun call!5136 () ListLongMap!1379)

(assert (=> bm!5133 (= call!5121 call!5136)))

(declare-fun bm!5134 () Bool)

(assert (=> bm!5134 (= call!5128 call!5132)))

(declare-fun bm!5135 () Bool)

(assert (=> bm!5135 (= call!5131 call!5136)))

(declare-fun bm!5136 () Bool)

(assert (=> bm!5136 (= call!5133 call!5122)))

(declare-fun bm!5137 () Bool)

(assert (=> bm!5137 (= call!5132 (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun b!64079 () Bool)

(declare-fun res!34972 () Bool)

(assert (=> b!64079 (= res!34972 call!5137)))

(assert (=> b!64079 (=> (not res!34972) (not e!41996))))

(declare-fun b!64080 () Bool)

(assert (=> b!64080 (= e!42010 e!41997)))

(declare-fun res!34976 () Bool)

(assert (=> b!64080 (= res!34976 call!5138)))

(assert (=> b!64080 (=> (not res!34976) (not e!41997))))

(declare-fun bm!5138 () Bool)

(assert (=> bm!5138 (= call!5122 call!5140)))

(declare-fun bm!5139 () Bool)

(assert (=> bm!5139 (= call!5141 (map!1118 newMap!16))))

(declare-fun bm!5140 () Bool)

(assert (=> bm!5140 (= call!5136 (getCurrentListMap!407 (_keys!3745 newMap!16) (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114) (mask!6025 newMap!16) (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) (zeroValue!2019 newMap!16) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(assert (= (and d!13349 c!8714) b!64078))

(assert (= (and d!13349 (not c!8714)) b!64058))

(assert (= (and b!64078 c!8708) b!64046))

(assert (= (and b!64078 (not c!8708)) b!64063))

(assert (= (or b!64046 b!64063) bm!5135))

(assert (= (or b!64046 b!64063) bm!5122))

(assert (= (or b!64046 b!64063) bm!5131))

(assert (= (and b!64058 c!8717) b!64054))

(assert (= (and b!64058 (not c!8717)) b!64045))

(assert (= (and b!64054 c!8709) b!64076))

(assert (= (and b!64054 (not c!8709)) b!64050))

(assert (= (and b!64076 res!34975) b!64079))

(assert (= (and b!64079 res!34972) b!64075))

(assert (= (and b!64050 c!8707) b!64062))

(assert (= (and b!64050 (not c!8707)) b!64068))

(assert (= (and b!64062 res!34974) b!64059))

(assert (= (and b!64059 res!34977) b!64049))

(assert (= (and b!64068 c!8718) b!64080))

(assert (= (and b!64068 (not c!8718)) b!64067))

(assert (= (and b!64080 res!34976) b!64051))

(assert (= (and b!64051 res!34966) b!64052))

(assert (= (or b!64062 b!64080) bm!5129))

(assert (= (or b!64049 b!64052) bm!5126))

(assert (= (or b!64079 bm!5129) bm!5132))

(assert (= (or b!64076 b!64050) bm!5134))

(assert (= (and b!64045 c!8716) b!64064))

(assert (= (and b!64045 (not c!8716)) b!64060))

(assert (= (and b!64060 c!8713) b!64055))

(assert (= (and b!64060 (not c!8713)) b!64071))

(assert (= (and b!64071 c!8711) b!64043))

(assert (= (and b!64071 (not c!8711)) b!64066))

(assert (= (and b!64043 res!34968) b!64053))

(assert (= (and b!64053 res!34967) b!64073))

(assert (= (and b!64066 c!8710) b!64057))

(assert (= (and b!64066 (not c!8710)) b!64070))

(assert (= (and b!64057 res!34969) b!64074))

(assert (= (and b!64074 res!34964) b!64061))

(assert (= (and b!64070 c!8715) b!64044))

(assert (= (and b!64070 (not c!8715)) b!64065))

(assert (= (and b!64044 res!34973) b!64077))

(assert (= (and b!64077 res!34970) b!64048))

(assert (= (or b!64057 b!64044) bm!5136))

(assert (= (or b!64061 b!64048) bm!5130))

(assert (= (or b!64053 bm!5136) bm!5138))

(assert (= (or b!64043 b!64066) bm!5119))

(assert (= (or b!64064 b!64055) bm!5125))

(assert (= (or b!64076 b!64043) bm!5118))

(assert (= (or bm!5132 bm!5138) bm!5124))

(assert (= (or bm!5134 bm!5119) bm!5137))

(assert (= (or b!64050 b!64066) bm!5127))

(assert (= (or b!64054 b!64071) bm!5133))

(assert (= (or bm!5126 bm!5130) bm!5121))

(assert (= (or b!64054 b!64071) bm!5123))

(assert (= (or bm!5135 bm!5133) bm!5140))

(assert (= (or bm!5122 b!64071) bm!5128))

(assert (= (or bm!5131 b!64071) bm!5120))

(assert (= (and d!13349 res!34965) b!64056))

(assert (= (and b!64056 c!8712) b!64047))

(assert (= (and b!64056 (not c!8712)) b!64069))

(assert (= (and b!64047 res!34971) b!64072))

(assert (= (or b!64047 b!64072 b!64069) bm!5117))

(assert (= (or b!64072 b!64069) bm!5139))

(declare-fun m!58633 () Bool)

(assert (=> bm!5123 m!58633))

(declare-fun m!58635 () Bool)

(assert (=> bm!5123 m!58635))

(assert (=> b!64063 m!58567))

(declare-fun m!58637 () Bool)

(assert (=> b!64063 m!58637))

(declare-fun m!58639 () Bool)

(assert (=> d!13349 m!58639))

(assert (=> d!13349 m!58559))

(assert (=> bm!5139 m!58541))

(declare-fun m!58641 () Bool)

(assert (=> b!64059 m!58641))

(declare-fun m!58643 () Bool)

(assert (=> b!64074 m!58643))

(declare-fun m!58645 () Bool)

(assert (=> b!64073 m!58645))

(assert (=> b!64058 m!58539))

(declare-fun m!58647 () Bool)

(assert (=> b!64058 m!58647))

(declare-fun m!58649 () Bool)

(assert (=> b!64077 m!58649))

(assert (=> b!64047 m!58539))

(declare-fun m!58651 () Bool)

(assert (=> b!64047 m!58651))

(assert (=> bm!5121 m!58539))

(declare-fun m!58653 () Bool)

(assert (=> bm!5121 m!58653))

(assert (=> bm!5125 m!58539))

(assert (=> bm!5125 m!58567))

(declare-fun m!58655 () Bool)

(assert (=> bm!5125 m!58655))

(declare-fun m!58657 () Bool)

(assert (=> bm!5124 m!58657))

(assert (=> b!64046 m!58567))

(declare-fun m!58659 () Bool)

(assert (=> b!64046 m!58659))

(declare-fun m!58661 () Bool)

(assert (=> b!64072 m!58661))

(declare-fun m!58663 () Bool)

(assert (=> bm!5120 m!58663))

(declare-fun m!58665 () Bool)

(assert (=> b!64075 m!58665))

(assert (=> bm!5137 m!58539))

(assert (=> bm!5137 m!58647))

(declare-fun m!58667 () Bool)

(assert (=> bm!5128 m!58667))

(declare-fun m!58669 () Bool)

(assert (=> bm!5117 m!58669))

(assert (=> bm!5127 m!58539))

(declare-fun m!58671 () Bool)

(assert (=> bm!5127 m!58671))

(assert (=> b!64071 m!58539))

(assert (=> b!64071 m!58567))

(declare-fun m!58673 () Bool)

(assert (=> b!64071 m!58673))

(assert (=> b!64071 m!58539))

(declare-fun m!58675 () Bool)

(assert (=> b!64071 m!58675))

(declare-fun m!58677 () Bool)

(assert (=> b!64071 m!58677))

(declare-fun m!58679 () Bool)

(assert (=> b!64071 m!58679))

(declare-fun m!58681 () Bool)

(assert (=> b!64071 m!58681))

(declare-fun m!58683 () Bool)

(assert (=> b!64051 m!58683))

(declare-fun m!58685 () Bool)

(assert (=> bm!5140 m!58685))

(assert (=> bm!5118 m!58539))

(declare-fun m!58687 () Bool)

(assert (=> bm!5118 m!58687))

(assert (=> b!63887 d!13349))

(declare-fun d!13351 () Bool)

(declare-fun c!8721 () Bool)

(assert (=> d!13351 (= c!8721 ((_ is ValueCellFull!867) (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun e!42015 () V!2875)

(assert (=> d!13351 (= (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42015)))

(declare-fun b!64085 () Bool)

(declare-fun get!1091 (ValueCell!867 V!2875) V!2875)

(assert (=> b!64085 (= e!42015 (get!1091 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64086 () Bool)

(declare-fun get!1092 (ValueCell!867 V!2875) V!2875)

(assert (=> b!64086 (= e!42015 (get!1092 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13351 c!8721) b!64085))

(assert (= (and d!13351 (not c!8721)) b!64086))

(assert (=> b!64085 m!58563))

(assert (=> b!64085 m!58565))

(declare-fun m!58689 () Bool)

(assert (=> b!64085 m!58689))

(assert (=> b!64086 m!58563))

(assert (=> b!64086 m!58565))

(declare-fun m!58691 () Bool)

(assert (=> b!64086 m!58691))

(assert (=> b!63887 d!13351))

(declare-fun b!64095 () Bool)

(declare-fun e!42023 () Bool)

(declare-fun call!5146 () Bool)

(assert (=> b!64095 (= e!42023 call!5146)))

(declare-fun b!64096 () Bool)

(declare-fun e!42022 () Bool)

(assert (=> b!64096 (= e!42022 e!42023)))

(declare-fun c!8724 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!64096 (= c!8724 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64097 () Bool)

(declare-fun e!42024 () Bool)

(assert (=> b!64097 (= e!42023 e!42024)))

(declare-fun lt!27142 () (_ BitVec 64))

(assert (=> b!64097 (= lt!27142 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!27141 () Unit!1757)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3775 (_ BitVec 64) (_ BitVec 32)) Unit!1757)

(assert (=> b!64097 (= lt!27141 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27142 #b00000000000000000000000000000000))))

(assert (=> b!64097 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27142 #b00000000000000000000000000000000)))

(declare-fun lt!27143 () Unit!1757)

(assert (=> b!64097 (= lt!27143 lt!27141)))

(declare-fun res!34983 () Bool)

(assert (=> b!64097 (= res!34983 (= (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))) (Found!230 #b00000000000000000000000000000000)))))

(assert (=> b!64097 (=> (not res!34983) (not e!42024))))

(declare-fun b!64098 () Bool)

(assert (=> b!64098 (= e!42024 call!5146)))

(declare-fun bm!5143 () Bool)

(assert (=> bm!5143 (= call!5146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun d!13353 () Bool)

(declare-fun res!34982 () Bool)

(assert (=> d!13353 (=> res!34982 e!42022)))

(assert (=> d!13353 (= res!34982 (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))) e!42022)))

(assert (= (and d!13353 (not res!34982)) b!64096))

(assert (= (and b!64096 c!8724) b!64097))

(assert (= (and b!64096 (not c!8724)) b!64095))

(assert (= (and b!64097 res!34983) b!64098))

(assert (= (or b!64098 b!64095) bm!5143))

(declare-fun m!58693 () Bool)

(assert (=> b!64096 m!58693))

(assert (=> b!64096 m!58693))

(declare-fun m!58695 () Bool)

(assert (=> b!64096 m!58695))

(assert (=> b!64097 m!58693))

(declare-fun m!58697 () Bool)

(assert (=> b!64097 m!58697))

(declare-fun m!58699 () Bool)

(assert (=> b!64097 m!58699))

(assert (=> b!64097 m!58693))

(declare-fun m!58701 () Bool)

(assert (=> b!64097 m!58701))

(declare-fun m!58703 () Bool)

(assert (=> bm!5143 m!58703))

(assert (=> b!63892 d!13353))

(declare-fun d!13355 () Bool)

(assert (=> d!13355 (= (valid!266 thiss!992) (valid!265 (v!2435 (underlying!236 thiss!992))))))

(declare-fun bs!2800 () Bool)

(assert (= bs!2800 d!13355))

(declare-fun m!58705 () Bool)

(assert (=> bs!2800 m!58705))

(assert (=> start!9020 d!13355))

(declare-fun d!13357 () Bool)

(assert (=> d!13357 (not (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27146 () Unit!1757)

(declare-fun choose!68 (array!3775 (_ BitVec 32) (_ BitVec 64) List!1445) Unit!1757)

(assert (=> d!13357 (= lt!27146 (choose!68 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442)))))

(assert (=> d!13357 (bvslt (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13357 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442)) lt!27146)))

(declare-fun bs!2801 () Bool)

(assert (= bs!2801 d!13357))

(assert (=> bs!2801 m!58539))

(assert (=> bs!2801 m!58551))

(assert (=> bs!2801 m!58539))

(declare-fun m!58707 () Bool)

(assert (=> bs!2801 m!58707))

(assert (=> b!63893 d!13357))

(declare-fun d!13359 () Bool)

(assert (=> d!13359 (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1442)))

(declare-fun lt!27149 () Unit!1757)

(declare-fun choose!39 (array!3775 (_ BitVec 32) (_ BitVec 32)) Unit!1757)

(assert (=> d!13359 (= lt!27149 (choose!39 (_keys!3745 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13359 (bvslt (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13359 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355) lt!27149)))

(declare-fun bs!2802 () Bool)

(assert (= bs!2802 d!13359))

(assert (=> bs!2802 m!58547))

(declare-fun m!58709 () Bool)

(assert (=> bs!2802 m!58709))

(assert (=> b!63893 d!13359))

(declare-fun d!13361 () Bool)

(declare-fun res!34988 () Bool)

(declare-fun e!42029 () Bool)

(assert (=> d!13361 (=> res!34988 e!42029)))

(assert (=> d!13361 (= res!34988 (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13361 (= (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!42029)))

(declare-fun b!64103 () Bool)

(declare-fun e!42030 () Bool)

(assert (=> b!64103 (= e!42029 e!42030)))

(declare-fun res!34989 () Bool)

(assert (=> b!64103 (=> (not res!34989) (not e!42030))))

(assert (=> b!64103 (= res!34989 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64104 () Bool)

(assert (=> b!64104 (= e!42030 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13361 (not res!34988)) b!64103))

(assert (= (and b!64103 res!34989) b!64104))

(declare-fun m!58711 () Bool)

(assert (=> d!13361 m!58711))

(assert (=> b!64104 m!58539))

(declare-fun m!58713 () Bool)

(assert (=> b!64104 m!58713))

(assert (=> b!63893 d!13361))

(declare-fun d!13363 () Bool)

(declare-fun e!42033 () Bool)

(assert (=> d!13363 e!42033))

(declare-fun c!8727 () Bool)

(assert (=> d!13363 (= c!8727 (and (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27152 () Unit!1757)

(declare-fun choose!343 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 64) (_ BitVec 32) Int) Unit!1757)

(assert (=> d!13363 (= lt!27152 (choose!343 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(assert (=> d!13363 (validMask!0 (mask!6025 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13363 (= (lemmaListMapContainsThenArrayContainsFrom!36 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))) lt!27152)))

(declare-fun b!64109 () Bool)

(assert (=> b!64109 (= e!42033 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64110 () Bool)

(assert (=> b!64110 (= e!42033 (ite (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13363 c!8727) b!64109))

(assert (= (and d!13363 (not c!8727)) b!64110))

(assert (=> d!13363 m!58539))

(declare-fun m!58715 () Bool)

(assert (=> d!13363 m!58715))

(assert (=> d!13363 m!58555))

(assert (=> b!64109 m!58539))

(assert (=> b!64109 m!58551))

(assert (=> b!63893 d!13363))

(declare-fun b!64121 () Bool)

(declare-fun e!42045 () Bool)

(declare-fun call!5149 () Bool)

(assert (=> b!64121 (= e!42045 call!5149)))

(declare-fun b!64122 () Bool)

(declare-fun e!42043 () Bool)

(declare-fun e!42042 () Bool)

(assert (=> b!64122 (= e!42043 e!42042)))

(declare-fun res!34998 () Bool)

(assert (=> b!64122 (=> (not res!34998) (not e!42042))))

(declare-fun e!42044 () Bool)

(assert (=> b!64122 (= res!34998 (not e!42044))))

(declare-fun res!34996 () Bool)

(assert (=> b!64122 (=> (not res!34996) (not e!42044))))

(assert (=> b!64122 (= res!34996 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64123 () Bool)

(declare-fun contains!696 (List!1445 (_ BitVec 64)) Bool)

(assert (=> b!64123 (= e!42044 (contains!696 Nil!1442 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64124 () Bool)

(assert (=> b!64124 (= e!42045 call!5149)))

(declare-fun d!13365 () Bool)

(declare-fun res!34997 () Bool)

(assert (=> d!13365 (=> res!34997 e!42043)))

(assert (=> d!13365 (= res!34997 (bvsge from!355 (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13365 (= (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1442) e!42043)))

(declare-fun b!64125 () Bool)

(assert (=> b!64125 (= e!42042 e!42045)))

(declare-fun c!8730 () Bool)

(assert (=> b!64125 (= c!8730 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun bm!5146 () Bool)

(assert (=> bm!5146 (= call!5149 (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8730 (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442) Nil!1442)))))

(assert (= (and d!13365 (not res!34997)) b!64122))

(assert (= (and b!64122 res!34996) b!64123))

(assert (= (and b!64122 res!34998) b!64125))

(assert (= (and b!64125 c!8730) b!64124))

(assert (= (and b!64125 (not c!8730)) b!64121))

(assert (= (or b!64124 b!64121) bm!5146))

(assert (=> b!64122 m!58539))

(assert (=> b!64122 m!58539))

(declare-fun m!58717 () Bool)

(assert (=> b!64122 m!58717))

(assert (=> b!64123 m!58539))

(assert (=> b!64123 m!58539))

(declare-fun m!58719 () Bool)

(assert (=> b!64123 m!58719))

(assert (=> b!64125 m!58539))

(assert (=> b!64125 m!58539))

(assert (=> b!64125 m!58717))

(assert (=> bm!5146 m!58539))

(declare-fun m!58721 () Bool)

(assert (=> bm!5146 m!58721))

(assert (=> b!63893 d!13365))

(declare-fun d!13367 () Bool)

(assert (=> d!13367 (= (array_inv!1113 (_keys!3745 newMap!16)) (bvsge (size!2038 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!63890 d!13367))

(declare-fun d!13369 () Bool)

(assert (=> d!13369 (= (array_inv!1114 (_values!2092 newMap!16)) (bvsge (size!2039 (_values!2092 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!63890 d!13369))

(declare-fun d!13371 () Bool)

(assert (=> d!13371 (= (validMask!0 (mask!6025 (v!2435 (underlying!236 thiss!992)))) (and (or (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000001111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000011111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000001111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000011111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000001111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000011111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000001111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000011111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000000111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000001111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000011111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000000111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000001111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000011111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000000111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000001111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000011111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000000111111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000001111111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000011111111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00000111111111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00001111111111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00011111111111111111111111111111) (= (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6025 (v!2435 (underlying!236 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!63889 d!13371))

(declare-fun d!13373 () Bool)

(assert (=> d!13373 (= (array_inv!1113 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvsge (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!63891 d!13373))

(declare-fun d!13375 () Bool)

(assert (=> d!13375 (= (array_inv!1114 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvsge (size!2039 (_values!2092 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!63891 d!13375))

(declare-fun d!13377 () Bool)

(declare-fun res!35005 () Bool)

(declare-fun e!42048 () Bool)

(assert (=> d!13377 (=> (not res!35005) (not e!42048))))

(declare-fun simpleValid!45 (LongMapFixedSize!642) Bool)

(assert (=> d!13377 (= res!35005 (simpleValid!45 newMap!16))))

(assert (=> d!13377 (= (valid!265 newMap!16) e!42048)))

(declare-fun b!64132 () Bool)

(declare-fun res!35006 () Bool)

(assert (=> b!64132 (=> (not res!35006) (not e!42048))))

(declare-fun arrayCountValidKeys!0 (array!3775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!64132 (= res!35006 (= (arrayCountValidKeys!0 (_keys!3745 newMap!16) #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) (_size!370 newMap!16)))))

(declare-fun b!64133 () Bool)

(declare-fun res!35007 () Bool)

(assert (=> b!64133 (=> (not res!35007) (not e!42048))))

(assert (=> b!64133 (= res!35007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun b!64134 () Bool)

(assert (=> b!64134 (= e!42048 (arrayNoDuplicates!0 (_keys!3745 newMap!16) #b00000000000000000000000000000000 Nil!1442))))

(assert (= (and d!13377 res!35005) b!64132))

(assert (= (and b!64132 res!35006) b!64133))

(assert (= (and b!64133 res!35007) b!64134))

(declare-fun m!58723 () Bool)

(assert (=> d!13377 m!58723))

(declare-fun m!58725 () Bool)

(assert (=> b!64132 m!58725))

(declare-fun m!58727 () Bool)

(assert (=> b!64133 m!58727))

(declare-fun m!58729 () Bool)

(assert (=> b!64134 m!58729))

(assert (=> b!63874 d!13377))

(declare-fun d!13379 () Bool)

(assert (=> d!13379 (= (map!1118 newMap!16) (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun bs!2803 () Bool)

(assert (= bs!2803 d!13379))

(declare-fun m!58731 () Bool)

(assert (=> bs!2803 m!58731))

(assert (=> b!63886 d!13379))

(declare-fun b!64177 () Bool)

(declare-fun e!42076 () Bool)

(declare-fun e!42083 () Bool)

(assert (=> b!64177 (= e!42076 e!42083)))

(declare-fun c!8743 () Bool)

(assert (=> b!64177 (= c!8743 (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5161 () Bool)

(declare-fun call!5167 () ListLongMap!1379)

(declare-fun getCurrentListMapNoExtraKeys!47 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 32) Int) ListLongMap!1379)

(assert (=> bm!5161 (= call!5167 (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64178 () Bool)

(declare-fun res!35034 () Bool)

(assert (=> b!64178 (=> (not res!35034) (not e!42076))))

(declare-fun e!42075 () Bool)

(assert (=> b!64178 (= res!35034 e!42075)))

(declare-fun res!35027 () Bool)

(assert (=> b!64178 (=> res!35027 e!42075)))

(declare-fun e!42077 () Bool)

(assert (=> b!64178 (= res!35027 (not e!42077))))

(declare-fun res!35029 () Bool)

(assert (=> b!64178 (=> (not res!35029) (not e!42077))))

(assert (=> b!64178 (= res!35029 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64179 () Bool)

(declare-fun e!42078 () ListLongMap!1379)

(declare-fun e!42079 () ListLongMap!1379)

(assert (=> b!64179 (= e!42078 e!42079)))

(declare-fun c!8748 () Bool)

(assert (=> b!64179 (= c!8748 (and (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5162 () Bool)

(declare-fun call!5164 () Bool)

(declare-fun lt!27208 () ListLongMap!1379)

(assert (=> bm!5162 (= call!5164 (contains!695 lt!27208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!13381 () Bool)

(assert (=> d!13381 e!42076))

(declare-fun res!35028 () Bool)

(assert (=> d!13381 (=> (not res!35028) (not e!42076))))

(assert (=> d!13381 (= res!35028 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun lt!27204 () ListLongMap!1379)

(assert (=> d!13381 (= lt!27208 lt!27204)))

(declare-fun lt!27211 () Unit!1757)

(declare-fun e!42082 () Unit!1757)

(assert (=> d!13381 (= lt!27211 e!42082)))

(declare-fun c!8745 () Bool)

(declare-fun e!42087 () Bool)

(assert (=> d!13381 (= c!8745 e!42087)))

(declare-fun res!35032 () Bool)

(assert (=> d!13381 (=> (not res!35032) (not e!42087))))

(assert (=> d!13381 (= res!35032 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13381 (= lt!27204 e!42078)))

(declare-fun c!8744 () Bool)

(assert (=> d!13381 (= c!8744 (and (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13381 (validMask!0 (mask!6025 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13381 (= (getCurrentListMap!407 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))) lt!27208)))

(declare-fun b!64180 () Bool)

(declare-fun lt!27218 () Unit!1757)

(assert (=> b!64180 (= e!42082 lt!27218)))

(declare-fun lt!27203 () ListLongMap!1379)

(assert (=> b!64180 (= lt!27203 (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27215 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27217 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27217 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27197 () Unit!1757)

(declare-fun addStillContains!45 (ListLongMap!1379 (_ BitVec 64) V!2875 (_ BitVec 64)) Unit!1757)

(assert (=> b!64180 (= lt!27197 (addStillContains!45 lt!27203 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27217))))

(assert (=> b!64180 (contains!695 (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27217)))

(declare-fun lt!27207 () Unit!1757)

(assert (=> b!64180 (= lt!27207 lt!27197)))

(declare-fun lt!27212 () ListLongMap!1379)

(assert (=> b!64180 (= lt!27212 (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27205 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27201 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27201 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27213 () Unit!1757)

(declare-fun addApplyDifferent!45 (ListLongMap!1379 (_ BitVec 64) V!2875 (_ BitVec 64)) Unit!1757)

(assert (=> b!64180 (= lt!27213 (addApplyDifferent!45 lt!27212 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27201))))

(declare-fun apply!69 (ListLongMap!1379 (_ BitVec 64)) V!2875)

(assert (=> b!64180 (= (apply!69 (+!84 lt!27212 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27201) (apply!69 lt!27212 lt!27201))))

(declare-fun lt!27216 () Unit!1757)

(assert (=> b!64180 (= lt!27216 lt!27213)))

(declare-fun lt!27199 () ListLongMap!1379)

(assert (=> b!64180 (= lt!27199 (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27210 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27200 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27200 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27209 () Unit!1757)

(assert (=> b!64180 (= lt!27209 (addApplyDifferent!45 lt!27199 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27200))))

(assert (=> b!64180 (= (apply!69 (+!84 lt!27199 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27200) (apply!69 lt!27199 lt!27200))))

(declare-fun lt!27198 () Unit!1757)

(assert (=> b!64180 (= lt!27198 lt!27209)))

(declare-fun lt!27202 () ListLongMap!1379)

(assert (=> b!64180 (= lt!27202 (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27206 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27214 () (_ BitVec 64))

(assert (=> b!64180 (= lt!27214 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!64180 (= lt!27218 (addApplyDifferent!45 lt!27202 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27214))))

(assert (=> b!64180 (= (apply!69 (+!84 lt!27202 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27214) (apply!69 lt!27202 lt!27214))))

(declare-fun bm!5163 () Bool)

(declare-fun call!5168 () ListLongMap!1379)

(declare-fun call!5169 () ListLongMap!1379)

(assert (=> bm!5163 (= call!5168 call!5169)))

(declare-fun bm!5164 () Bool)

(declare-fun call!5166 () ListLongMap!1379)

(assert (=> bm!5164 (= call!5166 (+!84 (ite c!8744 call!5167 (ite c!8748 call!5169 call!5168)) (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun bm!5165 () Bool)

(assert (=> bm!5165 (= call!5169 call!5167)))

(declare-fun b!64181 () Bool)

(declare-fun Unit!1768 () Unit!1757)

(assert (=> b!64181 (= e!42082 Unit!1768)))

(declare-fun b!64182 () Bool)

(assert (=> b!64182 (= e!42077 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!5166 () Bool)

(declare-fun call!5170 () ListLongMap!1379)

(assert (=> bm!5166 (= call!5170 call!5166)))

(declare-fun b!64183 () Bool)

(declare-fun call!5165 () Bool)

(assert (=> b!64183 (= e!42083 (not call!5165))))

(declare-fun b!64184 () Bool)

(declare-fun e!42086 () ListLongMap!1379)

(assert (=> b!64184 (= e!42086 call!5168)))

(declare-fun b!64185 () Bool)

(assert (=> b!64185 (= e!42078 (+!84 call!5166 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64186 () Bool)

(declare-fun e!42081 () Bool)

(declare-fun e!42085 () Bool)

(assert (=> b!64186 (= e!42081 e!42085)))

(declare-fun res!35030 () Bool)

(assert (=> b!64186 (= res!35030 call!5164)))

(assert (=> b!64186 (=> (not res!35030) (not e!42085))))

(declare-fun b!64187 () Bool)

(assert (=> b!64187 (= e!42079 call!5170)))

(declare-fun b!64188 () Bool)

(declare-fun e!42080 () Bool)

(assert (=> b!64188 (= e!42080 (= (apply!69 lt!27208 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64188 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2039 (_values!2092 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> b!64188 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64189 () Bool)

(declare-fun e!42084 () Bool)

(assert (=> b!64189 (= e!42083 e!42084)))

(declare-fun res!35031 () Bool)

(assert (=> b!64189 (= res!35031 call!5165)))

(assert (=> b!64189 (=> (not res!35031) (not e!42084))))

(declare-fun b!64190 () Bool)

(assert (=> b!64190 (= e!42084 (= (apply!69 lt!27208 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun bm!5167 () Bool)

(assert (=> bm!5167 (= call!5165 (contains!695 lt!27208 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64191 () Bool)

(assert (=> b!64191 (= e!42087 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64192 () Bool)

(assert (=> b!64192 (= e!42075 e!42080)))

(declare-fun res!35026 () Bool)

(assert (=> b!64192 (=> (not res!35026) (not e!42080))))

(assert (=> b!64192 (= res!35026 (contains!695 lt!27208 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64192 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64193 () Bool)

(assert (=> b!64193 (= e!42085 (= (apply!69 lt!27208 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64194 () Bool)

(declare-fun res!35033 () Bool)

(assert (=> b!64194 (=> (not res!35033) (not e!42076))))

(assert (=> b!64194 (= res!35033 e!42081)))

(declare-fun c!8746 () Bool)

(assert (=> b!64194 (= c!8746 (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64195 () Bool)

(assert (=> b!64195 (= e!42081 (not call!5164))))

(declare-fun b!64196 () Bool)

(declare-fun c!8747 () Bool)

(assert (=> b!64196 (= c!8747 (and (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!64196 (= e!42079 e!42086)))

(declare-fun b!64197 () Bool)

(assert (=> b!64197 (= e!42086 call!5170)))

(assert (= (and d!13381 c!8744) b!64185))

(assert (= (and d!13381 (not c!8744)) b!64179))

(assert (= (and b!64179 c!8748) b!64187))

(assert (= (and b!64179 (not c!8748)) b!64196))

(assert (= (and b!64196 c!8747) b!64197))

(assert (= (and b!64196 (not c!8747)) b!64184))

(assert (= (or b!64197 b!64184) bm!5163))

(assert (= (or b!64187 bm!5163) bm!5165))

(assert (= (or b!64187 b!64197) bm!5166))

(assert (= (or b!64185 bm!5165) bm!5161))

(assert (= (or b!64185 bm!5166) bm!5164))

(assert (= (and d!13381 res!35032) b!64191))

(assert (= (and d!13381 c!8745) b!64180))

(assert (= (and d!13381 (not c!8745)) b!64181))

(assert (= (and d!13381 res!35028) b!64178))

(assert (= (and b!64178 res!35029) b!64182))

(assert (= (and b!64178 (not res!35027)) b!64192))

(assert (= (and b!64192 res!35026) b!64188))

(assert (= (and b!64178 res!35034) b!64194))

(assert (= (and b!64194 c!8746) b!64186))

(assert (= (and b!64194 (not c!8746)) b!64195))

(assert (= (and b!64186 res!35030) b!64193))

(assert (= (or b!64186 b!64195) bm!5162))

(assert (= (and b!64194 res!35033) b!64177))

(assert (= (and b!64177 c!8743) b!64189))

(assert (= (and b!64177 (not c!8743)) b!64183))

(assert (= (and b!64189 res!35031) b!64190))

(assert (= (or b!64189 b!64183) bm!5167))

(declare-fun b_lambda!2881 () Bool)

(assert (=> (not b_lambda!2881) (not b!64188)))

(assert (=> b!64188 t!4855))

(declare-fun b_and!3935 () Bool)

(assert (= b_and!3923 (and (=> t!4855 result!2473) b_and!3935)))

(assert (=> b!64188 t!4857))

(declare-fun b_and!3937 () Bool)

(assert (= b_and!3925 (and (=> t!4857 result!2477) b_and!3937)))

(assert (=> d!13381 m!58555))

(assert (=> b!64188 m!58711))

(assert (=> b!64188 m!58565))

(declare-fun m!58733 () Bool)

(assert (=> b!64188 m!58733))

(assert (=> b!64188 m!58711))

(declare-fun m!58735 () Bool)

(assert (=> b!64188 m!58735))

(assert (=> b!64188 m!58733))

(assert (=> b!64188 m!58565))

(declare-fun m!58737 () Bool)

(assert (=> b!64188 m!58737))

(declare-fun m!58739 () Bool)

(assert (=> bm!5161 m!58739))

(declare-fun m!58741 () Bool)

(assert (=> bm!5167 m!58741))

(assert (=> b!64192 m!58711))

(assert (=> b!64192 m!58711))

(declare-fun m!58743 () Bool)

(assert (=> b!64192 m!58743))

(assert (=> b!64180 m!58739))

(declare-fun m!58745 () Bool)

(assert (=> b!64180 m!58745))

(declare-fun m!58747 () Bool)

(assert (=> b!64180 m!58747))

(assert (=> b!64180 m!58711))

(declare-fun m!58749 () Bool)

(assert (=> b!64180 m!58749))

(declare-fun m!58751 () Bool)

(assert (=> b!64180 m!58751))

(declare-fun m!58753 () Bool)

(assert (=> b!64180 m!58753))

(declare-fun m!58755 () Bool)

(assert (=> b!64180 m!58755))

(declare-fun m!58757 () Bool)

(assert (=> b!64180 m!58757))

(declare-fun m!58759 () Bool)

(assert (=> b!64180 m!58759))

(declare-fun m!58761 () Bool)

(assert (=> b!64180 m!58761))

(declare-fun m!58763 () Bool)

(assert (=> b!64180 m!58763))

(assert (=> b!64180 m!58757))

(assert (=> b!64180 m!58761))

(declare-fun m!58765 () Bool)

(assert (=> b!64180 m!58765))

(declare-fun m!58767 () Bool)

(assert (=> b!64180 m!58767))

(declare-fun m!58769 () Bool)

(assert (=> b!64180 m!58769))

(assert (=> b!64180 m!58751))

(declare-fun m!58771 () Bool)

(assert (=> b!64180 m!58771))

(assert (=> b!64180 m!58747))

(declare-fun m!58773 () Bool)

(assert (=> b!64180 m!58773))

(declare-fun m!58775 () Bool)

(assert (=> bm!5162 m!58775))

(declare-fun m!58777 () Bool)

(assert (=> b!64185 m!58777))

(declare-fun m!58779 () Bool)

(assert (=> b!64190 m!58779))

(assert (=> b!64191 m!58711))

(assert (=> b!64191 m!58711))

(declare-fun m!58781 () Bool)

(assert (=> b!64191 m!58781))

(declare-fun m!58783 () Bool)

(assert (=> b!64193 m!58783))

(declare-fun m!58785 () Bool)

(assert (=> bm!5164 m!58785))

(assert (=> b!64182 m!58711))

(assert (=> b!64182 m!58711))

(assert (=> b!64182 m!58781))

(assert (=> b!63886 d!13381))

(declare-fun b!64205 () Bool)

(declare-fun e!42092 () Bool)

(assert (=> b!64205 (= e!42092 tp_is_empty!2421)))

(declare-fun mapNonEmpty!2979 () Bool)

(declare-fun mapRes!2979 () Bool)

(declare-fun tp!8181 () Bool)

(declare-fun e!42093 () Bool)

(assert (=> mapNonEmpty!2979 (= mapRes!2979 (and tp!8181 e!42093))))

(declare-fun mapValue!2979 () ValueCell!867)

(declare-fun mapRest!2979 () (Array (_ BitVec 32) ValueCell!867))

(declare-fun mapKey!2979 () (_ BitVec 32))

(assert (=> mapNonEmpty!2979 (= mapRest!2970 (store mapRest!2979 mapKey!2979 mapValue!2979))))

(declare-fun b!64204 () Bool)

(assert (=> b!64204 (= e!42093 tp_is_empty!2421)))

(declare-fun condMapEmpty!2979 () Bool)

(declare-fun mapDefault!2979 () ValueCell!867)

(assert (=> mapNonEmpty!2970 (= condMapEmpty!2979 (= mapRest!2970 ((as const (Array (_ BitVec 32) ValueCell!867)) mapDefault!2979)))))

(assert (=> mapNonEmpty!2970 (= tp!8166 (and e!42092 mapRes!2979))))

(declare-fun mapIsEmpty!2979 () Bool)

(assert (=> mapIsEmpty!2979 mapRes!2979))

(assert (= (and mapNonEmpty!2970 condMapEmpty!2979) mapIsEmpty!2979))

(assert (= (and mapNonEmpty!2970 (not condMapEmpty!2979)) mapNonEmpty!2979))

(assert (= (and mapNonEmpty!2979 ((_ is ValueCellFull!867) mapValue!2979)) b!64204))

(assert (= (and mapNonEmpty!2970 ((_ is ValueCellFull!867) mapDefault!2979)) b!64205))

(declare-fun m!58787 () Bool)

(assert (=> mapNonEmpty!2979 m!58787))

(declare-fun b!64207 () Bool)

(declare-fun e!42094 () Bool)

(assert (=> b!64207 (= e!42094 tp_is_empty!2421)))

(declare-fun mapNonEmpty!2980 () Bool)

(declare-fun mapRes!2980 () Bool)

(declare-fun tp!8182 () Bool)

(declare-fun e!42095 () Bool)

(assert (=> mapNonEmpty!2980 (= mapRes!2980 (and tp!8182 e!42095))))

(declare-fun mapRest!2980 () (Array (_ BitVec 32) ValueCell!867))

(declare-fun mapValue!2980 () ValueCell!867)

(declare-fun mapKey!2980 () (_ BitVec 32))

(assert (=> mapNonEmpty!2980 (= mapRest!2969 (store mapRest!2980 mapKey!2980 mapValue!2980))))

(declare-fun b!64206 () Bool)

(assert (=> b!64206 (= e!42095 tp_is_empty!2421)))

(declare-fun condMapEmpty!2980 () Bool)

(declare-fun mapDefault!2980 () ValueCell!867)

(assert (=> mapNonEmpty!2969 (= condMapEmpty!2980 (= mapRest!2969 ((as const (Array (_ BitVec 32) ValueCell!867)) mapDefault!2980)))))

(assert (=> mapNonEmpty!2969 (= tp!8165 (and e!42094 mapRes!2980))))

(declare-fun mapIsEmpty!2980 () Bool)

(assert (=> mapIsEmpty!2980 mapRes!2980))

(assert (= (and mapNonEmpty!2969 condMapEmpty!2980) mapIsEmpty!2980))

(assert (= (and mapNonEmpty!2969 (not condMapEmpty!2980)) mapNonEmpty!2980))

(assert (= (and mapNonEmpty!2980 ((_ is ValueCellFull!867) mapValue!2980)) b!64206))

(assert (= (and mapNonEmpty!2969 ((_ is ValueCellFull!867) mapDefault!2980)) b!64207))

(declare-fun m!58789 () Bool)

(assert (=> mapNonEmpty!2980 m!58789))

(declare-fun b_lambda!2883 () Bool)

(assert (= b_lambda!2881 (or (and b!63891 b_free!2009) (and b!63890 b_free!2011 (= (defaultEntry!2109 newMap!16) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))))) b_lambda!2883)))

(check-sat (not d!13377) (not d!13381) (not b!64190) (not b_lambda!2879) (not b!64123) (not b!64134) (not b!64063) (not b!64185) (not b!64191) (not d!13349) (not b!63964) (not bm!5164) (not bm!5161) (not d!13363) (not bm!5125) (not b!64193) (not bm!5127) (not b!64122) (not bm!5143) (not b!64097) (not bm!5128) (not bm!5124) (not bm!5137) (not b!64104) (not b!64085) (not b_next!2011) (not bm!5140) (not bm!5146) (not b!64047) (not b!64096) (not b!64125) (not b!64072) (not d!13357) (not d!13347) (not mapNonEmpty!2979) (not bm!5167) (not b!64182) (not b!64086) (not b!64132) (not b_lambda!2883) (not b!64071) (not d!13359) (not b!64058) (not bm!5118) (not b!64133) (not bm!5121) (not b!64180) (not bm!5162) (not b!64109) (not bm!5120) (not b!64192) (not mapNonEmpty!2980) (not d!13379) (not b!63966) b_and!3935 (not b!64188) tp_is_empty!2421 (not bm!5117) (not d!13355) (not b!64046) b_and!3937 (not bm!5139) (not bm!5123) (not b_next!2009))
(check-sat b_and!3935 b_and!3937 (not b_next!2009) (not b_next!2011))
(get-model)

(declare-fun b!64220 () Bool)

(declare-fun e!42103 () SeekEntryResult!230)

(declare-fun lt!27225 () SeekEntryResult!230)

(assert (=> b!64220 (= e!42103 (Found!230 (index!3048 lt!27225)))))

(declare-fun b!64221 () Bool)

(declare-fun e!42104 () SeekEntryResult!230)

(assert (=> b!64221 (= e!42104 e!42103)))

(declare-fun lt!27226 () (_ BitVec 64))

(assert (=> b!64221 (= lt!27226 (select (arr!1805 (_keys!3745 newMap!16)) (index!3048 lt!27225)))))

(declare-fun c!8755 () Bool)

(assert (=> b!64221 (= c!8755 (= lt!27226 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64222 () Bool)

(declare-fun c!8756 () Bool)

(assert (=> b!64222 (= c!8756 (= lt!27226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42102 () SeekEntryResult!230)

(assert (=> b!64222 (= e!42103 e!42102)))

(declare-fun b!64223 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3775 (_ BitVec 32)) SeekEntryResult!230)

(assert (=> b!64223 (= e!42102 (seekKeyOrZeroReturnVacant!0 (x!10452 lt!27225) (index!3048 lt!27225) (index!3048 lt!27225) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun lt!27227 () SeekEntryResult!230)

(declare-fun d!13383 () Bool)

(assert (=> d!13383 (and (or ((_ is Undefined!230) lt!27227) (not ((_ is Found!230) lt!27227)) (and (bvsge (index!3047 lt!27227) #b00000000000000000000000000000000) (bvslt (index!3047 lt!27227) (size!2038 (_keys!3745 newMap!16))))) (or ((_ is Undefined!230) lt!27227) ((_ is Found!230) lt!27227) (not ((_ is MissingZero!230) lt!27227)) (and (bvsge (index!3046 lt!27227) #b00000000000000000000000000000000) (bvslt (index!3046 lt!27227) (size!2038 (_keys!3745 newMap!16))))) (or ((_ is Undefined!230) lt!27227) ((_ is Found!230) lt!27227) ((_ is MissingZero!230) lt!27227) (not ((_ is MissingVacant!230) lt!27227)) (and (bvsge (index!3049 lt!27227) #b00000000000000000000000000000000) (bvslt (index!3049 lt!27227) (size!2038 (_keys!3745 newMap!16))))) (or ((_ is Undefined!230) lt!27227) (ite ((_ is Found!230) lt!27227) (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27227)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (ite ((_ is MissingZero!230) lt!27227) (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3046 lt!27227)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!230) lt!27227) (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3049 lt!27227)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13383 (= lt!27227 e!42104)))

(declare-fun c!8757 () Bool)

(assert (=> d!13383 (= c!8757 (and ((_ is Intermediate!230) lt!27225) (undefined!1042 lt!27225)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3775 (_ BitVec 32)) SeekEntryResult!230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!13383 (= lt!27225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (mask!6025 newMap!16)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(assert (=> d!13383 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13383 (= (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)) lt!27227)))

(declare-fun b!64224 () Bool)

(assert (=> b!64224 (= e!42104 Undefined!230)))

(declare-fun b!64225 () Bool)

(assert (=> b!64225 (= e!42102 (MissingZero!230 (index!3048 lt!27225)))))

(assert (= (and d!13383 c!8757) b!64224))

(assert (= (and d!13383 (not c!8757)) b!64221))

(assert (= (and b!64221 c!8755) b!64220))

(assert (= (and b!64221 (not c!8755)) b!64222))

(assert (= (and b!64222 c!8756) b!64225))

(assert (= (and b!64222 (not c!8756)) b!64223))

(declare-fun m!58791 () Bool)

(assert (=> b!64221 m!58791))

(assert (=> b!64223 m!58539))

(declare-fun m!58793 () Bool)

(assert (=> b!64223 m!58793))

(declare-fun m!58795 () Bool)

(assert (=> d!13383 m!58795))

(declare-fun m!58797 () Bool)

(assert (=> d!13383 m!58797))

(declare-fun m!58799 () Bool)

(assert (=> d!13383 m!58799))

(declare-fun m!58801 () Bool)

(assert (=> d!13383 m!58801))

(declare-fun m!58803 () Bool)

(assert (=> d!13383 m!58803))

(assert (=> d!13383 m!58539))

(declare-fun m!58805 () Bool)

(assert (=> d!13383 m!58805))

(assert (=> d!13383 m!58539))

(assert (=> d!13383 m!58803))

(assert (=> b!64058 d!13383))

(declare-fun b!64226 () Bool)

(declare-fun e!42106 () Bool)

(declare-fun call!5171 () Bool)

(assert (=> b!64226 (= e!42106 call!5171)))

(declare-fun b!64227 () Bool)

(declare-fun e!42105 () Bool)

(assert (=> b!64227 (= e!42105 e!42106)))

(declare-fun c!8758 () Bool)

(assert (=> b!64227 (= c!8758 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!64228 () Bool)

(declare-fun e!42107 () Bool)

(assert (=> b!64228 (= e!42106 e!42107)))

(declare-fun lt!27229 () (_ BitVec 64))

(assert (=> b!64228 (= lt!27229 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!27228 () Unit!1757)

(assert (=> b!64228 (= lt!27228 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27229 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!64228 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27229 #b00000000000000000000000000000000)))

(declare-fun lt!27230 () Unit!1757)

(assert (=> b!64228 (= lt!27230 lt!27228)))

(declare-fun res!35036 () Bool)

(assert (=> b!64228 (= res!35036 (= (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))) (Found!230 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!64228 (=> (not res!35036) (not e!42107))))

(declare-fun b!64229 () Bool)

(assert (=> b!64229 (= e!42107 call!5171)))

(declare-fun bm!5168 () Bool)

(assert (=> bm!5168 (= call!5171 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun d!13385 () Bool)

(declare-fun res!35035 () Bool)

(assert (=> d!13385 (=> res!35035 e!42105)))

(assert (=> d!13385 (= res!35035 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13385 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))) e!42105)))

(assert (= (and d!13385 (not res!35035)) b!64227))

(assert (= (and b!64227 c!8758) b!64228))

(assert (= (and b!64227 (not c!8758)) b!64226))

(assert (= (and b!64228 res!35036) b!64229))

(assert (= (or b!64229 b!64226) bm!5168))

(declare-fun m!58807 () Bool)

(assert (=> b!64227 m!58807))

(assert (=> b!64227 m!58807))

(declare-fun m!58809 () Bool)

(assert (=> b!64227 m!58809))

(assert (=> b!64228 m!58807))

(declare-fun m!58811 () Bool)

(assert (=> b!64228 m!58811))

(declare-fun m!58813 () Bool)

(assert (=> b!64228 m!58813))

(assert (=> b!64228 m!58807))

(declare-fun m!58815 () Bool)

(assert (=> b!64228 m!58815))

(declare-fun m!58817 () Bool)

(assert (=> bm!5168 m!58817))

(assert (=> bm!5143 d!13385))

(declare-fun d!13387 () Bool)

(assert (=> d!13387 (contains!695 (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27217)))

(declare-fun lt!27233 () Unit!1757)

(declare-fun choose!344 (ListLongMap!1379 (_ BitVec 64) V!2875 (_ BitVec 64)) Unit!1757)

(assert (=> d!13387 (= lt!27233 (choose!344 lt!27203 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27217))))

(assert (=> d!13387 (contains!695 lt!27203 lt!27217)))

(assert (=> d!13387 (= (addStillContains!45 lt!27203 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27217) lt!27233)))

(declare-fun bs!2804 () Bool)

(assert (= bs!2804 d!13387))

(assert (=> bs!2804 m!58761))

(assert (=> bs!2804 m!58761))

(assert (=> bs!2804 m!58763))

(declare-fun m!58819 () Bool)

(assert (=> bs!2804 m!58819))

(declare-fun m!58821 () Bool)

(assert (=> bs!2804 m!58821))

(assert (=> b!64180 d!13387))

(declare-fun d!13389 () Bool)

(declare-fun get!1093 (Option!133) V!2875)

(assert (=> d!13389 (= (apply!69 (+!84 lt!27212 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27201) (get!1093 (getValueByKey!127 (toList!705 (+!84 lt!27212 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27201)))))

(declare-fun bs!2805 () Bool)

(assert (= bs!2805 d!13389))

(declare-fun m!58823 () Bool)

(assert (=> bs!2805 m!58823))

(assert (=> bs!2805 m!58823))

(declare-fun m!58825 () Bool)

(assert (=> bs!2805 m!58825))

(assert (=> b!64180 d!13389))

(declare-fun d!13391 () Bool)

(declare-fun e!42110 () Bool)

(assert (=> d!13391 e!42110))

(declare-fun res!35041 () Bool)

(assert (=> d!13391 (=> (not res!35041) (not e!42110))))

(declare-fun lt!27244 () ListLongMap!1379)

(assert (=> d!13391 (= res!35041 (contains!695 lt!27244 (_1!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27242 () List!1444)

(assert (=> d!13391 (= lt!27244 (ListLongMap!1380 lt!27242))))

(declare-fun lt!27243 () Unit!1757)

(declare-fun lt!27245 () Unit!1757)

(assert (=> d!13391 (= lt!27243 lt!27245)))

(assert (=> d!13391 (= (getValueByKey!127 lt!27242 (_1!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!44 (List!1444 (_ BitVec 64) V!2875) Unit!1757)

(assert (=> d!13391 (= lt!27245 (lemmaContainsTupThenGetReturnValue!44 lt!27242 (_1!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun insertStrictlySorted!47 (List!1444 (_ BitVec 64) V!2875) List!1444)

(assert (=> d!13391 (= lt!27242 (insertStrictlySorted!47 (toList!705 lt!27199) (_1!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13391 (= (+!84 lt!27199 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27244)))

(declare-fun b!64235 () Bool)

(declare-fun res!35042 () Bool)

(assert (=> b!64235 (=> (not res!35042) (not e!42110))))

(assert (=> b!64235 (= res!35042 (= (getValueByKey!127 (toList!705 lt!27244) (_1!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64236 () Bool)

(declare-fun contains!697 (List!1444 tuple2!2050) Bool)

(assert (=> b!64236 (= e!42110 (contains!697 (toList!705 lt!27244) (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13391 res!35041) b!64235))

(assert (= (and b!64235 res!35042) b!64236))

(declare-fun m!58827 () Bool)

(assert (=> d!13391 m!58827))

(declare-fun m!58829 () Bool)

(assert (=> d!13391 m!58829))

(declare-fun m!58831 () Bool)

(assert (=> d!13391 m!58831))

(declare-fun m!58833 () Bool)

(assert (=> d!13391 m!58833))

(declare-fun m!58835 () Bool)

(assert (=> b!64235 m!58835))

(declare-fun m!58837 () Bool)

(assert (=> b!64236 m!58837))

(assert (=> b!64180 d!13391))

(declare-fun d!13393 () Bool)

(declare-fun e!42111 () Bool)

(assert (=> d!13393 e!42111))

(declare-fun res!35043 () Bool)

(assert (=> d!13393 (=> (not res!35043) (not e!42111))))

(declare-fun lt!27248 () ListLongMap!1379)

(assert (=> d!13393 (= res!35043 (contains!695 lt!27248 (_1!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27246 () List!1444)

(assert (=> d!13393 (= lt!27248 (ListLongMap!1380 lt!27246))))

(declare-fun lt!27247 () Unit!1757)

(declare-fun lt!27249 () Unit!1757)

(assert (=> d!13393 (= lt!27247 lt!27249)))

(assert (=> d!13393 (= (getValueByKey!127 lt!27246 (_1!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13393 (= lt!27249 (lemmaContainsTupThenGetReturnValue!44 lt!27246 (_1!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13393 (= lt!27246 (insertStrictlySorted!47 (toList!705 lt!27203) (_1!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13393 (= (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27248)))

(declare-fun b!64237 () Bool)

(declare-fun res!35044 () Bool)

(assert (=> b!64237 (=> (not res!35044) (not e!42111))))

(assert (=> b!64237 (= res!35044 (= (getValueByKey!127 (toList!705 lt!27248) (_1!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64238 () Bool)

(assert (=> b!64238 (= e!42111 (contains!697 (toList!705 lt!27248) (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13393 res!35043) b!64237))

(assert (= (and b!64237 res!35044) b!64238))

(declare-fun m!58839 () Bool)

(assert (=> d!13393 m!58839))

(declare-fun m!58841 () Bool)

(assert (=> d!13393 m!58841))

(declare-fun m!58843 () Bool)

(assert (=> d!13393 m!58843))

(declare-fun m!58845 () Bool)

(assert (=> d!13393 m!58845))

(declare-fun m!58847 () Bool)

(assert (=> b!64237 m!58847))

(declare-fun m!58849 () Bool)

(assert (=> b!64238 m!58849))

(assert (=> b!64180 d!13393))

(declare-fun b!64263 () Bool)

(declare-fun e!42128 () ListLongMap!1379)

(assert (=> b!64263 (= e!42128 (ListLongMap!1380 Nil!1441))))

(declare-fun b!64264 () Bool)

(declare-fun e!42130 () Bool)

(declare-fun e!42126 () Bool)

(assert (=> b!64264 (= e!42130 e!42126)))

(declare-fun c!8770 () Bool)

(assert (=> b!64264 (= c!8770 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64265 () Bool)

(declare-fun lt!27264 () Unit!1757)

(declare-fun lt!27269 () Unit!1757)

(assert (=> b!64265 (= lt!27264 lt!27269)))

(declare-fun lt!27266 () (_ BitVec 64))

(declare-fun lt!27268 () V!2875)

(declare-fun lt!27267 () ListLongMap!1379)

(declare-fun lt!27270 () (_ BitVec 64))

(assert (=> b!64265 (not (contains!695 (+!84 lt!27267 (tuple2!2051 lt!27266 lt!27268)) lt!27270))))

(declare-fun addStillNotContains!18 (ListLongMap!1379 (_ BitVec 64) V!2875 (_ BitVec 64)) Unit!1757)

(assert (=> b!64265 (= lt!27269 (addStillNotContains!18 lt!27267 lt!27266 lt!27268 lt!27270))))

(assert (=> b!64265 (= lt!27270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!64265 (= lt!27268 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64265 (= lt!27266 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!5174 () ListLongMap!1379)

(assert (=> b!64265 (= lt!27267 call!5174)))

(declare-fun e!42129 () ListLongMap!1379)

(assert (=> b!64265 (= e!42129 (+!84 call!5174 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!64266 () Bool)

(declare-fun e!42127 () Bool)

(assert (=> b!64266 (= e!42127 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64266 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!64267 () Bool)

(declare-fun e!42131 () Bool)

(assert (=> b!64267 (= e!42130 e!42131)))

(assert (=> b!64267 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun res!35056 () Bool)

(declare-fun lt!27265 () ListLongMap!1379)

(assert (=> b!64267 (= res!35056 (contains!695 lt!27265 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64267 (=> (not res!35056) (not e!42131))))

(declare-fun b!64268 () Bool)

(assert (=> b!64268 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> b!64268 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2039 (_values!2092 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> b!64268 (= e!42131 (= (apply!69 lt!27265 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!64269 () Bool)

(assert (=> b!64269 (= e!42129 call!5174)))

(declare-fun b!64270 () Bool)

(assert (=> b!64270 (= e!42126 (= lt!27265 (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64271 () Bool)

(declare-fun isEmpty!302 (ListLongMap!1379) Bool)

(assert (=> b!64271 (= e!42126 (isEmpty!302 lt!27265))))

(declare-fun d!13395 () Bool)

(declare-fun e!42132 () Bool)

(assert (=> d!13395 e!42132))

(declare-fun res!35054 () Bool)

(assert (=> d!13395 (=> (not res!35054) (not e!42132))))

(assert (=> d!13395 (= res!35054 (not (contains!695 lt!27265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13395 (= lt!27265 e!42128)))

(declare-fun c!8767 () Bool)

(assert (=> d!13395 (= c!8767 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13395 (validMask!0 (mask!6025 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13395 (= (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))) lt!27265)))

(declare-fun bm!5171 () Bool)

(assert (=> bm!5171 (= call!5174 (getCurrentListMapNoExtraKeys!47 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64272 () Bool)

(declare-fun res!35055 () Bool)

(assert (=> b!64272 (=> (not res!35055) (not e!42132))))

(assert (=> b!64272 (= res!35055 (not (contains!695 lt!27265 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64273 () Bool)

(assert (=> b!64273 (= e!42128 e!42129)))

(declare-fun c!8768 () Bool)

(assert (=> b!64273 (= c!8768 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64274 () Bool)

(assert (=> b!64274 (= e!42132 e!42130)))

(declare-fun c!8769 () Bool)

(assert (=> b!64274 (= c!8769 e!42127)))

(declare-fun res!35053 () Bool)

(assert (=> b!64274 (=> (not res!35053) (not e!42127))))

(assert (=> b!64274 (= res!35053 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13395 c!8767) b!64263))

(assert (= (and d!13395 (not c!8767)) b!64273))

(assert (= (and b!64273 c!8768) b!64265))

(assert (= (and b!64273 (not c!8768)) b!64269))

(assert (= (or b!64265 b!64269) bm!5171))

(assert (= (and d!13395 res!35054) b!64272))

(assert (= (and b!64272 res!35055) b!64274))

(assert (= (and b!64274 res!35053) b!64266))

(assert (= (and b!64274 c!8769) b!64267))

(assert (= (and b!64274 (not c!8769)) b!64264))

(assert (= (and b!64267 res!35056) b!64268))

(assert (= (and b!64264 c!8770) b!64270))

(assert (= (and b!64264 (not c!8770)) b!64271))

(declare-fun b_lambda!2885 () Bool)

(assert (=> (not b_lambda!2885) (not b!64265)))

(assert (=> b!64265 t!4855))

(declare-fun b_and!3939 () Bool)

(assert (= b_and!3935 (and (=> t!4855 result!2473) b_and!3939)))

(assert (=> b!64265 t!4857))

(declare-fun b_and!3941 () Bool)

(assert (= b_and!3937 (and (=> t!4857 result!2477) b_and!3941)))

(declare-fun b_lambda!2887 () Bool)

(assert (=> (not b_lambda!2887) (not b!64268)))

(assert (=> b!64268 t!4855))

(declare-fun b_and!3943 () Bool)

(assert (= b_and!3939 (and (=> t!4855 result!2473) b_and!3943)))

(assert (=> b!64268 t!4857))

(declare-fun b_and!3945 () Bool)

(assert (= b_and!3941 (and (=> t!4857 result!2477) b_and!3945)))

(declare-fun m!58851 () Bool)

(assert (=> bm!5171 m!58851))

(declare-fun m!58853 () Bool)

(assert (=> d!13395 m!58853))

(assert (=> d!13395 m!58555))

(assert (=> b!64267 m!58711))

(assert (=> b!64267 m!58711))

(declare-fun m!58855 () Bool)

(assert (=> b!64267 m!58855))

(declare-fun m!58857 () Bool)

(assert (=> b!64265 m!58857))

(assert (=> b!64265 m!58565))

(declare-fun m!58859 () Bool)

(assert (=> b!64265 m!58859))

(declare-fun m!58861 () Bool)

(assert (=> b!64265 m!58861))

(assert (=> b!64265 m!58733))

(assert (=> b!64265 m!58565))

(assert (=> b!64265 m!58737))

(assert (=> b!64265 m!58711))

(assert (=> b!64265 m!58857))

(declare-fun m!58863 () Bool)

(assert (=> b!64265 m!58863))

(assert (=> b!64265 m!58733))

(assert (=> b!64270 m!58851))

(declare-fun m!58865 () Bool)

(assert (=> b!64272 m!58865))

(assert (=> b!64273 m!58711))

(assert (=> b!64273 m!58711))

(assert (=> b!64273 m!58781))

(assert (=> b!64268 m!58565))

(assert (=> b!64268 m!58711))

(declare-fun m!58867 () Bool)

(assert (=> b!64268 m!58867))

(assert (=> b!64268 m!58733))

(assert (=> b!64268 m!58565))

(assert (=> b!64268 m!58737))

(assert (=> b!64268 m!58711))

(assert (=> b!64268 m!58733))

(assert (=> b!64266 m!58711))

(assert (=> b!64266 m!58711))

(assert (=> b!64266 m!58781))

(declare-fun m!58869 () Bool)

(assert (=> b!64271 m!58869))

(assert (=> b!64180 d!13395))

(declare-fun d!13397 () Bool)

(assert (=> d!13397 (= (apply!69 lt!27202 lt!27214) (get!1093 (getValueByKey!127 (toList!705 lt!27202) lt!27214)))))

(declare-fun bs!2806 () Bool)

(assert (= bs!2806 d!13397))

(declare-fun m!58871 () Bool)

(assert (=> bs!2806 m!58871))

(assert (=> bs!2806 m!58871))

(declare-fun m!58873 () Bool)

(assert (=> bs!2806 m!58873))

(assert (=> b!64180 d!13397))

(declare-fun d!13399 () Bool)

(assert (=> d!13399 (= (apply!69 lt!27199 lt!27200) (get!1093 (getValueByKey!127 (toList!705 lt!27199) lt!27200)))))

(declare-fun bs!2807 () Bool)

(assert (= bs!2807 d!13399))

(declare-fun m!58875 () Bool)

(assert (=> bs!2807 m!58875))

(assert (=> bs!2807 m!58875))

(declare-fun m!58877 () Bool)

(assert (=> bs!2807 m!58877))

(assert (=> b!64180 d!13399))

(declare-fun d!13401 () Bool)

(assert (=> d!13401 (= (apply!69 (+!84 lt!27202 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27214) (get!1093 (getValueByKey!127 (toList!705 (+!84 lt!27202 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27214)))))

(declare-fun bs!2808 () Bool)

(assert (= bs!2808 d!13401))

(declare-fun m!58879 () Bool)

(assert (=> bs!2808 m!58879))

(assert (=> bs!2808 m!58879))

(declare-fun m!58881 () Bool)

(assert (=> bs!2808 m!58881))

(assert (=> b!64180 d!13401))

(declare-fun d!13403 () Bool)

(assert (=> d!13403 (= (apply!69 (+!84 lt!27199 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27200) (get!1093 (getValueByKey!127 (toList!705 (+!84 lt!27199 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27200)))))

(declare-fun bs!2809 () Bool)

(assert (= bs!2809 d!13403))

(declare-fun m!58883 () Bool)

(assert (=> bs!2809 m!58883))

(assert (=> bs!2809 m!58883))

(declare-fun m!58885 () Bool)

(assert (=> bs!2809 m!58885))

(assert (=> b!64180 d!13403))

(declare-fun d!13405 () Bool)

(declare-fun e!42134 () Bool)

(assert (=> d!13405 e!42134))

(declare-fun res!35057 () Bool)

(assert (=> d!13405 (=> res!35057 e!42134)))

(declare-fun lt!27274 () Bool)

(assert (=> d!13405 (= res!35057 (not lt!27274))))

(declare-fun lt!27273 () Bool)

(assert (=> d!13405 (= lt!27274 lt!27273)))

(declare-fun lt!27272 () Unit!1757)

(declare-fun e!42133 () Unit!1757)

(assert (=> d!13405 (= lt!27272 e!42133)))

(declare-fun c!8771 () Bool)

(assert (=> d!13405 (= c!8771 lt!27273)))

(assert (=> d!13405 (= lt!27273 (containsKey!131 (toList!705 (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27217))))

(assert (=> d!13405 (= (contains!695 (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27217) lt!27274)))

(declare-fun b!64275 () Bool)

(declare-fun lt!27271 () Unit!1757)

(assert (=> b!64275 (= e!42133 lt!27271)))

(assert (=> b!64275 (= lt!27271 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27217))))

(assert (=> b!64275 (isDefined!80 (getValueByKey!127 (toList!705 (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27217))))

(declare-fun b!64276 () Bool)

(declare-fun Unit!1769 () Unit!1757)

(assert (=> b!64276 (= e!42133 Unit!1769)))

(declare-fun b!64277 () Bool)

(assert (=> b!64277 (= e!42134 (isDefined!80 (getValueByKey!127 (toList!705 (+!84 lt!27203 (tuple2!2051 lt!27215 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27217)))))

(assert (= (and d!13405 c!8771) b!64275))

(assert (= (and d!13405 (not c!8771)) b!64276))

(assert (= (and d!13405 (not res!35057)) b!64277))

(declare-fun m!58887 () Bool)

(assert (=> d!13405 m!58887))

(declare-fun m!58889 () Bool)

(assert (=> b!64275 m!58889))

(declare-fun m!58891 () Bool)

(assert (=> b!64275 m!58891))

(assert (=> b!64275 m!58891))

(declare-fun m!58893 () Bool)

(assert (=> b!64275 m!58893))

(assert (=> b!64277 m!58891))

(assert (=> b!64277 m!58891))

(assert (=> b!64277 m!58893))

(assert (=> b!64180 d!13405))

(declare-fun d!13407 () Bool)

(declare-fun e!42135 () Bool)

(assert (=> d!13407 e!42135))

(declare-fun res!35058 () Bool)

(assert (=> d!13407 (=> (not res!35058) (not e!42135))))

(declare-fun lt!27277 () ListLongMap!1379)

(assert (=> d!13407 (= res!35058 (contains!695 lt!27277 (_1!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27275 () List!1444)

(assert (=> d!13407 (= lt!27277 (ListLongMap!1380 lt!27275))))

(declare-fun lt!27276 () Unit!1757)

(declare-fun lt!27278 () Unit!1757)

(assert (=> d!13407 (= lt!27276 lt!27278)))

(assert (=> d!13407 (= (getValueByKey!127 lt!27275 (_1!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13407 (= lt!27278 (lemmaContainsTupThenGetReturnValue!44 lt!27275 (_1!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13407 (= lt!27275 (insertStrictlySorted!47 (toList!705 lt!27202) (_1!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13407 (= (+!84 lt!27202 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27277)))

(declare-fun b!64278 () Bool)

(declare-fun res!35059 () Bool)

(assert (=> b!64278 (=> (not res!35059) (not e!42135))))

(assert (=> b!64278 (= res!35059 (= (getValueByKey!127 (toList!705 lt!27277) (_1!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64279 () Bool)

(assert (=> b!64279 (= e!42135 (contains!697 (toList!705 lt!27277) (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13407 res!35058) b!64278))

(assert (= (and b!64278 res!35059) b!64279))

(declare-fun m!58895 () Bool)

(assert (=> d!13407 m!58895))

(declare-fun m!58897 () Bool)

(assert (=> d!13407 m!58897))

(declare-fun m!58899 () Bool)

(assert (=> d!13407 m!58899))

(declare-fun m!58901 () Bool)

(assert (=> d!13407 m!58901))

(declare-fun m!58903 () Bool)

(assert (=> b!64278 m!58903))

(declare-fun m!58905 () Bool)

(assert (=> b!64279 m!58905))

(assert (=> b!64180 d!13407))

(declare-fun d!13409 () Bool)

(assert (=> d!13409 (= (apply!69 lt!27212 lt!27201) (get!1093 (getValueByKey!127 (toList!705 lt!27212) lt!27201)))))

(declare-fun bs!2810 () Bool)

(assert (= bs!2810 d!13409))

(declare-fun m!58907 () Bool)

(assert (=> bs!2810 m!58907))

(assert (=> bs!2810 m!58907))

(declare-fun m!58909 () Bool)

(assert (=> bs!2810 m!58909))

(assert (=> b!64180 d!13409))

(declare-fun d!13411 () Bool)

(declare-fun e!42136 () Bool)

(assert (=> d!13411 e!42136))

(declare-fun res!35060 () Bool)

(assert (=> d!13411 (=> (not res!35060) (not e!42136))))

(declare-fun lt!27281 () ListLongMap!1379)

(assert (=> d!13411 (= res!35060 (contains!695 lt!27281 (_1!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27279 () List!1444)

(assert (=> d!13411 (= lt!27281 (ListLongMap!1380 lt!27279))))

(declare-fun lt!27280 () Unit!1757)

(declare-fun lt!27282 () Unit!1757)

(assert (=> d!13411 (= lt!27280 lt!27282)))

(assert (=> d!13411 (= (getValueByKey!127 lt!27279 (_1!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13411 (= lt!27282 (lemmaContainsTupThenGetReturnValue!44 lt!27279 (_1!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13411 (= lt!27279 (insertStrictlySorted!47 (toList!705 lt!27212) (_1!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13411 (= (+!84 lt!27212 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27281)))

(declare-fun b!64280 () Bool)

(declare-fun res!35061 () Bool)

(assert (=> b!64280 (=> (not res!35061) (not e!42136))))

(assert (=> b!64280 (= res!35061 (= (getValueByKey!127 (toList!705 lt!27281) (_1!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64281 () Bool)

(assert (=> b!64281 (= e!42136 (contains!697 (toList!705 lt!27281) (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13411 res!35060) b!64280))

(assert (= (and b!64280 res!35061) b!64281))

(declare-fun m!58911 () Bool)

(assert (=> d!13411 m!58911))

(declare-fun m!58913 () Bool)

(assert (=> d!13411 m!58913))

(declare-fun m!58915 () Bool)

(assert (=> d!13411 m!58915))

(declare-fun m!58917 () Bool)

(assert (=> d!13411 m!58917))

(declare-fun m!58919 () Bool)

(assert (=> b!64280 m!58919))

(declare-fun m!58921 () Bool)

(assert (=> b!64281 m!58921))

(assert (=> b!64180 d!13411))

(declare-fun d!13413 () Bool)

(assert (=> d!13413 (= (apply!69 (+!84 lt!27202 (tuple2!2051 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27214) (apply!69 lt!27202 lt!27214))))

(declare-fun lt!27285 () Unit!1757)

(declare-fun choose!345 (ListLongMap!1379 (_ BitVec 64) V!2875 (_ BitVec 64)) Unit!1757)

(assert (=> d!13413 (= lt!27285 (choose!345 lt!27202 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27214))))

(declare-fun e!42139 () Bool)

(assert (=> d!13413 e!42139))

(declare-fun res!35064 () Bool)

(assert (=> d!13413 (=> (not res!35064) (not e!42139))))

(assert (=> d!13413 (= res!35064 (contains!695 lt!27202 lt!27214))))

(assert (=> d!13413 (= (addApplyDifferent!45 lt!27202 lt!27206 (minValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27214) lt!27285)))

(declare-fun b!64285 () Bool)

(assert (=> b!64285 (= e!42139 (not (= lt!27214 lt!27206)))))

(assert (= (and d!13413 res!35064) b!64285))

(assert (=> d!13413 m!58749))

(assert (=> d!13413 m!58747))

(assert (=> d!13413 m!58747))

(assert (=> d!13413 m!58773))

(declare-fun m!58923 () Bool)

(assert (=> d!13413 m!58923))

(declare-fun m!58925 () Bool)

(assert (=> d!13413 m!58925))

(assert (=> b!64180 d!13413))

(declare-fun d!13415 () Bool)

(assert (=> d!13415 (= (apply!69 (+!84 lt!27199 (tuple2!2051 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27200) (apply!69 lt!27199 lt!27200))))

(declare-fun lt!27286 () Unit!1757)

(assert (=> d!13415 (= lt!27286 (choose!345 lt!27199 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27200))))

(declare-fun e!42140 () Bool)

(assert (=> d!13415 e!42140))

(declare-fun res!35065 () Bool)

(assert (=> d!13415 (=> (not res!35065) (not e!42140))))

(assert (=> d!13415 (= res!35065 (contains!695 lt!27199 lt!27200))))

(assert (=> d!13415 (= (addApplyDifferent!45 lt!27199 lt!27210 (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27200) lt!27286)))

(declare-fun b!64286 () Bool)

(assert (=> b!64286 (= e!42140 (not (= lt!27200 lt!27210)))))

(assert (= (and d!13415 res!35065) b!64286))

(assert (=> d!13415 m!58753))

(assert (=> d!13415 m!58757))

(assert (=> d!13415 m!58757))

(assert (=> d!13415 m!58759))

(declare-fun m!58927 () Bool)

(assert (=> d!13415 m!58927))

(declare-fun m!58929 () Bool)

(assert (=> d!13415 m!58929))

(assert (=> b!64180 d!13415))

(declare-fun d!13417 () Bool)

(assert (=> d!13417 (= (apply!69 (+!84 lt!27212 (tuple2!2051 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27201) (apply!69 lt!27212 lt!27201))))

(declare-fun lt!27287 () Unit!1757)

(assert (=> d!13417 (= lt!27287 (choose!345 lt!27212 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27201))))

(declare-fun e!42141 () Bool)

(assert (=> d!13417 e!42141))

(declare-fun res!35066 () Bool)

(assert (=> d!13417 (=> (not res!35066) (not e!42141))))

(assert (=> d!13417 (= res!35066 (contains!695 lt!27212 lt!27201))))

(assert (=> d!13417 (= (addApplyDifferent!45 lt!27212 lt!27205 (minValue!2019 (v!2435 (underlying!236 thiss!992))) lt!27201) lt!27287)))

(declare-fun b!64287 () Bool)

(assert (=> b!64287 (= e!42141 (not (= lt!27201 lt!27205)))))

(assert (= (and d!13417 res!35066) b!64287))

(assert (=> d!13417 m!58765))

(assert (=> d!13417 m!58751))

(assert (=> d!13417 m!58751))

(assert (=> d!13417 m!58771))

(declare-fun m!58931 () Bool)

(assert (=> d!13417 m!58931))

(declare-fun m!58933 () Bool)

(assert (=> d!13417 m!58933))

(assert (=> b!64180 d!13417))

(declare-fun d!13419 () Bool)

(declare-fun res!35067 () Bool)

(declare-fun e!42142 () Bool)

(assert (=> d!13419 (=> res!35067 e!42142)))

(assert (=> d!13419 (= res!35067 (= (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13419 (= (arrayContainsKey!0 (_keys!3745 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000) e!42142)))

(declare-fun b!64288 () Bool)

(declare-fun e!42143 () Bool)

(assert (=> b!64288 (= e!42142 e!42143)))

(declare-fun res!35068 () Bool)

(assert (=> b!64288 (=> (not res!35068) (not e!42143))))

(assert (=> b!64288 (= res!35068 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64289 () Bool)

(assert (=> b!64289 (= e!42143 (arrayContainsKey!0 (_keys!3745 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13419 (not res!35067)) b!64288))

(assert (= (and b!64288 res!35068) b!64289))

(declare-fun m!58935 () Bool)

(assert (=> d!13419 m!58935))

(assert (=> b!64289 m!58539))

(declare-fun m!58937 () Bool)

(assert (=> b!64289 m!58937))

(assert (=> bm!5121 d!13419))

(declare-fun d!13421 () Bool)

(declare-fun e!42144 () Bool)

(assert (=> d!13421 e!42144))

(declare-fun res!35069 () Bool)

(assert (=> d!13421 (=> (not res!35069) (not e!42144))))

(declare-fun lt!27290 () ListLongMap!1379)

(assert (=> d!13421 (= res!35069 (contains!695 lt!27290 (_1!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun lt!27288 () List!1444)

(assert (=> d!13421 (= lt!27290 (ListLongMap!1380 lt!27288))))

(declare-fun lt!27289 () Unit!1757)

(declare-fun lt!27291 () Unit!1757)

(assert (=> d!13421 (= lt!27289 lt!27291)))

(assert (=> d!13421 (= (getValueByKey!127 lt!27288 (_1!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))) (Some!132 (_2!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(assert (=> d!13421 (= lt!27291 (lemmaContainsTupThenGetReturnValue!44 lt!27288 (_1!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (_2!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(assert (=> d!13421 (= lt!27288 (insertStrictlySorted!47 (toList!705 (ite c!8744 call!5167 (ite c!8748 call!5169 call!5168))) (_1!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (_2!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(assert (=> d!13421 (= (+!84 (ite c!8744 call!5167 (ite c!8748 call!5169 call!5168)) (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) lt!27290)))

(declare-fun b!64290 () Bool)

(declare-fun res!35070 () Bool)

(assert (=> b!64290 (=> (not res!35070) (not e!42144))))

(assert (=> b!64290 (= res!35070 (= (getValueByKey!127 (toList!705 lt!27290) (_1!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))) (Some!132 (_2!1036 (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))))

(declare-fun b!64291 () Bool)

(assert (=> b!64291 (= e!42144 (contains!697 (toList!705 lt!27290) (ite (or c!8744 c!8748) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 (v!2435 (underlying!236 thiss!992)))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (= (and d!13421 res!35069) b!64290))

(assert (= (and b!64290 res!35070) b!64291))

(declare-fun m!58939 () Bool)

(assert (=> d!13421 m!58939))

(declare-fun m!58941 () Bool)

(assert (=> d!13421 m!58941))

(declare-fun m!58943 () Bool)

(assert (=> d!13421 m!58943))

(declare-fun m!58945 () Bool)

(assert (=> d!13421 m!58945))

(declare-fun m!58947 () Bool)

(assert (=> b!64290 m!58947))

(declare-fun m!58949 () Bool)

(assert (=> b!64291 m!58949))

(assert (=> bm!5164 d!13421))

(declare-fun b!64292 () Bool)

(declare-fun e!42146 () Bool)

(declare-fun e!42153 () Bool)

(assert (=> b!64292 (= e!42146 e!42153)))

(declare-fun c!8772 () Bool)

(assert (=> b!64292 (= c!8772 (not (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!5178 () ListLongMap!1379)

(declare-fun bm!5172 () Bool)

(assert (=> bm!5172 (= call!5178 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun b!64293 () Bool)

(declare-fun res!35079 () Bool)

(assert (=> b!64293 (=> (not res!35079) (not e!42146))))

(declare-fun e!42145 () Bool)

(assert (=> b!64293 (= res!35079 e!42145)))

(declare-fun res!35072 () Bool)

(assert (=> b!64293 (=> res!35072 e!42145)))

(declare-fun e!42147 () Bool)

(assert (=> b!64293 (= res!35072 (not e!42147))))

(declare-fun res!35074 () Bool)

(assert (=> b!64293 (=> (not res!35074) (not e!42147))))

(assert (=> b!64293 (= res!35074 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64294 () Bool)

(declare-fun e!42148 () ListLongMap!1379)

(declare-fun e!42149 () ListLongMap!1379)

(assert (=> b!64294 (= e!42148 e!42149)))

(declare-fun c!8777 () Bool)

(assert (=> b!64294 (= c!8777 (and (not (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5173 () Bool)

(declare-fun call!5175 () Bool)

(declare-fun lt!27303 () ListLongMap!1379)

(assert (=> bm!5173 (= call!5175 (contains!695 lt!27303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!13423 () Bool)

(assert (=> d!13423 e!42146))

(declare-fun res!35073 () Bool)

(assert (=> d!13423 (=> (not res!35073) (not e!42146))))

(assert (=> d!13423 (= res!35073 (or (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))))

(declare-fun lt!27299 () ListLongMap!1379)

(assert (=> d!13423 (= lt!27303 lt!27299)))

(declare-fun lt!27306 () Unit!1757)

(declare-fun e!42152 () Unit!1757)

(assert (=> d!13423 (= lt!27306 e!42152)))

(declare-fun c!8774 () Bool)

(declare-fun e!42157 () Bool)

(assert (=> d!13423 (= c!8774 e!42157)))

(declare-fun res!35077 () Bool)

(assert (=> d!13423 (=> (not res!35077) (not e!42157))))

(assert (=> d!13423 (= res!35077 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13423 (= lt!27299 e!42148)))

(declare-fun c!8773 () Bool)

(assert (=> d!13423 (= c!8773 (and (not (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13423 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13423 (= (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) lt!27303)))

(declare-fun b!64295 () Bool)

(declare-fun lt!27313 () Unit!1757)

(assert (=> b!64295 (= e!42152 lt!27313)))

(declare-fun lt!27298 () ListLongMap!1379)

(assert (=> b!64295 (= lt!27298 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27310 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27312 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27312 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27292 () Unit!1757)

(assert (=> b!64295 (= lt!27292 (addStillContains!45 lt!27298 lt!27310 (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) lt!27312))))

(assert (=> b!64295 (contains!695 (+!84 lt!27298 (tuple2!2051 lt!27310 (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)))) lt!27312)))

(declare-fun lt!27302 () Unit!1757)

(assert (=> b!64295 (= lt!27302 lt!27292)))

(declare-fun lt!27307 () ListLongMap!1379)

(assert (=> b!64295 (= lt!27307 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27300 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27300 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27296 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27296 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27308 () Unit!1757)

(assert (=> b!64295 (= lt!27308 (addApplyDifferent!45 lt!27307 lt!27300 (minValue!2019 newMap!16) lt!27296))))

(assert (=> b!64295 (= (apply!69 (+!84 lt!27307 (tuple2!2051 lt!27300 (minValue!2019 newMap!16))) lt!27296) (apply!69 lt!27307 lt!27296))))

(declare-fun lt!27311 () Unit!1757)

(assert (=> b!64295 (= lt!27311 lt!27308)))

(declare-fun lt!27294 () ListLongMap!1379)

(assert (=> b!64295 (= lt!27294 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27305 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27305 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27295 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27295 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27304 () Unit!1757)

(assert (=> b!64295 (= lt!27304 (addApplyDifferent!45 lt!27294 lt!27305 (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) lt!27295))))

(assert (=> b!64295 (= (apply!69 (+!84 lt!27294 (tuple2!2051 lt!27305 (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)))) lt!27295) (apply!69 lt!27294 lt!27295))))

(declare-fun lt!27293 () Unit!1757)

(assert (=> b!64295 (= lt!27293 lt!27304)))

(declare-fun lt!27297 () ListLongMap!1379)

(assert (=> b!64295 (= lt!27297 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27301 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27301 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27309 () (_ BitVec 64))

(assert (=> b!64295 (= lt!27309 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64295 (= lt!27313 (addApplyDifferent!45 lt!27297 lt!27301 (minValue!2019 newMap!16) lt!27309))))

(assert (=> b!64295 (= (apply!69 (+!84 lt!27297 (tuple2!2051 lt!27301 (minValue!2019 newMap!16))) lt!27309) (apply!69 lt!27297 lt!27309))))

(declare-fun bm!5174 () Bool)

(declare-fun call!5179 () ListLongMap!1379)

(declare-fun call!5180 () ListLongMap!1379)

(assert (=> bm!5174 (= call!5179 call!5180)))

(declare-fun call!5177 () ListLongMap!1379)

(declare-fun bm!5175 () Bool)

(assert (=> bm!5175 (= call!5177 (+!84 (ite c!8773 call!5178 (ite c!8777 call!5180 call!5179)) (ite (or c!8773 c!8777) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 newMap!16)))))))

(declare-fun bm!5176 () Bool)

(assert (=> bm!5176 (= call!5180 call!5178)))

(declare-fun b!64296 () Bool)

(declare-fun Unit!1770 () Unit!1757)

(assert (=> b!64296 (= e!42152 Unit!1770)))

(declare-fun b!64297 () Bool)

(assert (=> b!64297 (= e!42147 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5177 () Bool)

(declare-fun call!5181 () ListLongMap!1379)

(assert (=> bm!5177 (= call!5181 call!5177)))

(declare-fun b!64298 () Bool)

(declare-fun call!5176 () Bool)

(assert (=> b!64298 (= e!42153 (not call!5176))))

(declare-fun b!64299 () Bool)

(declare-fun e!42156 () ListLongMap!1379)

(assert (=> b!64299 (= e!42156 call!5179)))

(declare-fun b!64300 () Bool)

(assert (=> b!64300 (= e!42148 (+!84 call!5177 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 newMap!16))))))

(declare-fun b!64301 () Bool)

(declare-fun e!42151 () Bool)

(declare-fun e!42155 () Bool)

(assert (=> b!64301 (= e!42151 e!42155)))

(declare-fun res!35075 () Bool)

(assert (=> b!64301 (= res!35075 call!5175)))

(assert (=> b!64301 (=> (not res!35075) (not e!42155))))

(declare-fun b!64302 () Bool)

(assert (=> b!64302 (= e!42149 call!5181)))

(declare-fun b!64303 () Bool)

(declare-fun e!42150 () Bool)

(assert (=> b!64303 (= e!42150 (= (apply!69 lt!27303 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)) (get!1090 (select (arr!1806 (_values!2092 newMap!16)) #b00000000000000000000000000000000) (dynLambda!311 (defaultEntry!2109 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2039 (_values!2092 newMap!16))))))

(assert (=> b!64303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64304 () Bool)

(declare-fun e!42154 () Bool)

(assert (=> b!64304 (= e!42153 e!42154)))

(declare-fun res!35076 () Bool)

(assert (=> b!64304 (= res!35076 call!5176)))

(assert (=> b!64304 (=> (not res!35076) (not e!42154))))

(declare-fun b!64305 () Bool)

(assert (=> b!64305 (= e!42154 (= (apply!69 lt!27303 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2019 newMap!16)))))

(declare-fun bm!5178 () Bool)

(assert (=> bm!5178 (= call!5176 (contains!695 lt!27303 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64306 () Bool)

(assert (=> b!64306 (= e!42157 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64307 () Bool)

(assert (=> b!64307 (= e!42145 e!42150)))

(declare-fun res!35071 () Bool)

(assert (=> b!64307 (=> (not res!35071) (not e!42150))))

(assert (=> b!64307 (= res!35071 (contains!695 lt!27303 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64308 () Bool)

(assert (=> b!64308 (= e!42155 (= (apply!69 lt!27303 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!8714 c!8708) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2019 newMap!16))))))

(declare-fun b!64309 () Bool)

(declare-fun res!35078 () Bool)

(assert (=> b!64309 (=> (not res!35078) (not e!42146))))

(assert (=> b!64309 (= res!35078 e!42151)))

(declare-fun c!8775 () Bool)

(assert (=> b!64309 (= c!8775 (not (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64310 () Bool)

(assert (=> b!64310 (= e!42151 (not call!5175))))

(declare-fun b!64311 () Bool)

(declare-fun c!8776 () Bool)

(assert (=> b!64311 (= c!8776 (and (not (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8714 c!8708) lt!27119 (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!64311 (= e!42149 e!42156)))

(declare-fun b!64312 () Bool)

(assert (=> b!64312 (= e!42156 call!5181)))

(assert (= (and d!13423 c!8773) b!64300))

(assert (= (and d!13423 (not c!8773)) b!64294))

(assert (= (and b!64294 c!8777) b!64302))

(assert (= (and b!64294 (not c!8777)) b!64311))

(assert (= (and b!64311 c!8776) b!64312))

(assert (= (and b!64311 (not c!8776)) b!64299))

(assert (= (or b!64312 b!64299) bm!5174))

(assert (= (or b!64302 bm!5174) bm!5176))

(assert (= (or b!64302 b!64312) bm!5177))

(assert (= (or b!64300 bm!5176) bm!5172))

(assert (= (or b!64300 bm!5177) bm!5175))

(assert (= (and d!13423 res!35077) b!64306))

(assert (= (and d!13423 c!8774) b!64295))

(assert (= (and d!13423 (not c!8774)) b!64296))

(assert (= (and d!13423 res!35073) b!64293))

(assert (= (and b!64293 res!35074) b!64297))

(assert (= (and b!64293 (not res!35072)) b!64307))

(assert (= (and b!64307 res!35071) b!64303))

(assert (= (and b!64293 res!35079) b!64309))

(assert (= (and b!64309 c!8775) b!64301))

(assert (= (and b!64309 (not c!8775)) b!64310))

(assert (= (and b!64301 res!35075) b!64308))

(assert (= (or b!64301 b!64310) bm!5173))

(assert (= (and b!64309 res!35078) b!64292))

(assert (= (and b!64292 c!8772) b!64304))

(assert (= (and b!64292 (not c!8772)) b!64298))

(assert (= (and b!64304 res!35076) b!64305))

(assert (= (or b!64304 b!64298) bm!5178))

(declare-fun b_lambda!2889 () Bool)

(assert (=> (not b_lambda!2889) (not b!64303)))

(declare-fun t!4866 () Bool)

(declare-fun tb!1397 () Bool)

(assert (=> (and b!63891 (= (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2109 newMap!16)) t!4866) tb!1397))

(declare-fun result!2487 () Bool)

(assert (=> tb!1397 (= result!2487 tp_is_empty!2421)))

(assert (=> b!64303 t!4866))

(declare-fun b_and!3947 () Bool)

(assert (= b_and!3943 (and (=> t!4866 result!2487) b_and!3947)))

(declare-fun t!4868 () Bool)

(declare-fun tb!1399 () Bool)

(assert (=> (and b!63890 (= (defaultEntry!2109 newMap!16) (defaultEntry!2109 newMap!16)) t!4868) tb!1399))

(declare-fun result!2489 () Bool)

(assert (= result!2489 result!2487))

(assert (=> b!64303 t!4868))

(declare-fun b_and!3949 () Bool)

(assert (= b_and!3945 (and (=> t!4868 result!2489) b_and!3949)))

(assert (=> d!13423 m!58801))

(assert (=> b!64303 m!58935))

(declare-fun m!58951 () Bool)

(assert (=> b!64303 m!58951))

(declare-fun m!58953 () Bool)

(assert (=> b!64303 m!58953))

(assert (=> b!64303 m!58935))

(declare-fun m!58955 () Bool)

(assert (=> b!64303 m!58955))

(assert (=> b!64303 m!58953))

(assert (=> b!64303 m!58951))

(declare-fun m!58957 () Bool)

(assert (=> b!64303 m!58957))

(declare-fun m!58959 () Bool)

(assert (=> bm!5172 m!58959))

(declare-fun m!58961 () Bool)

(assert (=> bm!5178 m!58961))

(assert (=> b!64307 m!58935))

(assert (=> b!64307 m!58935))

(declare-fun m!58963 () Bool)

(assert (=> b!64307 m!58963))

(assert (=> b!64295 m!58959))

(declare-fun m!58965 () Bool)

(assert (=> b!64295 m!58965))

(declare-fun m!58967 () Bool)

(assert (=> b!64295 m!58967))

(assert (=> b!64295 m!58935))

(declare-fun m!58969 () Bool)

(assert (=> b!64295 m!58969))

(declare-fun m!58971 () Bool)

(assert (=> b!64295 m!58971))

(declare-fun m!58973 () Bool)

(assert (=> b!64295 m!58973))

(declare-fun m!58975 () Bool)

(assert (=> b!64295 m!58975))

(declare-fun m!58977 () Bool)

(assert (=> b!64295 m!58977))

(declare-fun m!58979 () Bool)

(assert (=> b!64295 m!58979))

(declare-fun m!58981 () Bool)

(assert (=> b!64295 m!58981))

(declare-fun m!58983 () Bool)

(assert (=> b!64295 m!58983))

(assert (=> b!64295 m!58977))

(assert (=> b!64295 m!58981))

(declare-fun m!58985 () Bool)

(assert (=> b!64295 m!58985))

(declare-fun m!58987 () Bool)

(assert (=> b!64295 m!58987))

(declare-fun m!58989 () Bool)

(assert (=> b!64295 m!58989))

(assert (=> b!64295 m!58971))

(declare-fun m!58991 () Bool)

(assert (=> b!64295 m!58991))

(assert (=> b!64295 m!58967))

(declare-fun m!58993 () Bool)

(assert (=> b!64295 m!58993))

(declare-fun m!58995 () Bool)

(assert (=> bm!5173 m!58995))

(declare-fun m!58997 () Bool)

(assert (=> b!64300 m!58997))

(declare-fun m!58999 () Bool)

(assert (=> b!64305 m!58999))

(assert (=> b!64306 m!58935))

(assert (=> b!64306 m!58935))

(declare-fun m!59001 () Bool)

(assert (=> b!64306 m!59001))

(declare-fun m!59003 () Bool)

(assert (=> b!64308 m!59003))

(declare-fun m!59005 () Bool)

(assert (=> bm!5175 m!59005))

(assert (=> b!64297 m!58935))

(assert (=> b!64297 m!58935))

(assert (=> b!64297 m!59001))

(assert (=> bm!5128 d!13423))

(declare-fun d!13425 () Bool)

(declare-fun res!35084 () Bool)

(declare-fun e!42162 () Bool)

(assert (=> d!13425 (=> res!35084 e!42162)))

(assert (=> d!13425 (= res!35084 (and ((_ is Cons!1440) (toList!705 lt!27020)) (= (_1!1036 (h!2024 (toList!705 lt!27020))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (=> d!13425 (= (containsKey!131 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) e!42162)))

(declare-fun b!64317 () Bool)

(declare-fun e!42163 () Bool)

(assert (=> b!64317 (= e!42162 e!42163)))

(declare-fun res!35085 () Bool)

(assert (=> b!64317 (=> (not res!35085) (not e!42163))))

(assert (=> b!64317 (= res!35085 (and (or (not ((_ is Cons!1440) (toList!705 lt!27020))) (bvsle (_1!1036 (h!2024 (toList!705 lt!27020))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))) ((_ is Cons!1440) (toList!705 lt!27020)) (bvslt (_1!1036 (h!2024 (toList!705 lt!27020))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(declare-fun b!64318 () Bool)

(assert (=> b!64318 (= e!42163 (containsKey!131 (t!4858 (toList!705 lt!27020)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (= (and d!13425 (not res!35084)) b!64317))

(assert (= (and b!64317 res!35085) b!64318))

(assert (=> b!64318 m!58539))

(declare-fun m!59007 () Bool)

(assert (=> b!64318 m!59007))

(assert (=> d!13347 d!13425))

(declare-fun d!13427 () Bool)

(assert (=> d!13427 (= (map!1118 (_2!1037 lt!27129)) (getCurrentListMap!407 (_keys!3745 (_2!1037 lt!27129)) (_values!2092 (_2!1037 lt!27129)) (mask!6025 (_2!1037 lt!27129)) (extraKeys!1984 (_2!1037 lt!27129)) (zeroValue!2019 (_2!1037 lt!27129)) (minValue!2019 (_2!1037 lt!27129)) #b00000000000000000000000000000000 (defaultEntry!2109 (_2!1037 lt!27129))))))

(declare-fun bs!2811 () Bool)

(assert (= bs!2811 d!13427))

(declare-fun m!59009 () Bool)

(assert (=> bs!2811 m!59009))

(assert (=> bm!5117 d!13427))

(declare-fun d!13429 () Bool)

(declare-fun lt!27316 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!69 (List!1445) (InoxSet (_ BitVec 64)))

(assert (=> d!13429 (= lt!27316 (select (content!69 Nil!1442) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun e!42169 () Bool)

(assert (=> d!13429 (= lt!27316 e!42169)))

(declare-fun res!35090 () Bool)

(assert (=> d!13429 (=> (not res!35090) (not e!42169))))

(assert (=> d!13429 (= res!35090 ((_ is Cons!1441) Nil!1442))))

(assert (=> d!13429 (= (contains!696 Nil!1442 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27316)))

(declare-fun b!64323 () Bool)

(declare-fun e!42168 () Bool)

(assert (=> b!64323 (= e!42169 e!42168)))

(declare-fun res!35091 () Bool)

(assert (=> b!64323 (=> res!35091 e!42168)))

(assert (=> b!64323 (= res!35091 (= (h!2025 Nil!1442) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64324 () Bool)

(assert (=> b!64324 (= e!42168 (contains!696 (t!4859 Nil!1442) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (= (and d!13429 res!35090) b!64323))

(assert (= (and b!64323 (not res!35091)) b!64324))

(declare-fun m!59011 () Bool)

(assert (=> d!13429 m!59011))

(assert (=> d!13429 m!58539))

(declare-fun m!59013 () Bool)

(assert (=> d!13429 m!59013))

(assert (=> b!64324 m!58539))

(declare-fun m!59015 () Bool)

(assert (=> b!64324 m!59015))

(assert (=> b!64123 d!13429))

(declare-fun d!13431 () Bool)

(declare-fun e!42171 () Bool)

(assert (=> d!13431 e!42171))

(declare-fun res!35092 () Bool)

(assert (=> d!13431 (=> res!35092 e!42171)))

(declare-fun lt!27320 () Bool)

(assert (=> d!13431 (= res!35092 (not lt!27320))))

(declare-fun lt!27319 () Bool)

(assert (=> d!13431 (= lt!27320 lt!27319)))

(declare-fun lt!27318 () Unit!1757)

(declare-fun e!42170 () Unit!1757)

(assert (=> d!13431 (= lt!27318 e!42170)))

(declare-fun c!8778 () Bool)

(assert (=> d!13431 (= c!8778 lt!27319)))

(assert (=> d!13431 (= lt!27319 (containsKey!131 (toList!705 call!5121) (ite c!8717 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27123)))))))

(assert (=> d!13431 (= (contains!695 call!5121 (ite c!8717 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27123)))) lt!27320)))

(declare-fun b!64325 () Bool)

(declare-fun lt!27317 () Unit!1757)

(assert (=> b!64325 (= e!42170 lt!27317)))

(assert (=> b!64325 (= lt!27317 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 call!5121) (ite c!8717 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27123)))))))

(assert (=> b!64325 (isDefined!80 (getValueByKey!127 (toList!705 call!5121) (ite c!8717 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27123)))))))

(declare-fun b!64326 () Bool)

(declare-fun Unit!1771 () Unit!1757)

(assert (=> b!64326 (= e!42170 Unit!1771)))

(declare-fun b!64327 () Bool)

(assert (=> b!64327 (= e!42171 (isDefined!80 (getValueByKey!127 (toList!705 call!5121) (ite c!8717 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27123))))))))

(assert (= (and d!13431 c!8778) b!64325))

(assert (= (and d!13431 (not c!8778)) b!64326))

(assert (= (and d!13431 (not res!35092)) b!64327))

(declare-fun m!59017 () Bool)

(assert (=> d!13431 m!59017))

(declare-fun m!59019 () Bool)

(assert (=> b!64325 m!59019))

(declare-fun m!59021 () Bool)

(assert (=> b!64325 m!59021))

(assert (=> b!64325 m!59021))

(declare-fun m!59023 () Bool)

(assert (=> b!64325 m!59023))

(assert (=> b!64327 m!59021))

(assert (=> b!64327 m!59021))

(assert (=> b!64327 m!59023))

(assert (=> bm!5123 d!13431))

(declare-fun d!13433 () Bool)

(assert (=> d!13433 (= (get!1091 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2434 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64085 d!13433))

(declare-fun d!13435 () Bool)

(declare-fun e!42173 () Bool)

(assert (=> d!13435 e!42173))

(declare-fun res!35093 () Bool)

(assert (=> d!13435 (=> res!35093 e!42173)))

(declare-fun lt!27324 () Bool)

(assert (=> d!13435 (= res!35093 (not lt!27324))))

(declare-fun lt!27323 () Bool)

(assert (=> d!13435 (= lt!27324 lt!27323)))

(declare-fun lt!27322 () Unit!1757)

(declare-fun e!42172 () Unit!1757)

(assert (=> d!13435 (= lt!27322 e!42172)))

(declare-fun c!8779 () Bool)

(assert (=> d!13435 (= c!8779 lt!27323)))

(assert (=> d!13435 (= lt!27323 (containsKey!131 (toList!705 call!5130) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13435 (= (contains!695 call!5130 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27324)))

(declare-fun b!64328 () Bool)

(declare-fun lt!27321 () Unit!1757)

(assert (=> b!64328 (= e!42172 lt!27321)))

(assert (=> b!64328 (= lt!27321 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 call!5130) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64328 (isDefined!80 (getValueByKey!127 (toList!705 call!5130) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64329 () Bool)

(declare-fun Unit!1772 () Unit!1757)

(assert (=> b!64329 (= e!42172 Unit!1772)))

(declare-fun b!64330 () Bool)

(assert (=> b!64330 (= e!42173 (isDefined!80 (getValueByKey!127 (toList!705 call!5130) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (= (and d!13435 c!8779) b!64328))

(assert (= (and d!13435 (not c!8779)) b!64329))

(assert (= (and d!13435 (not res!35093)) b!64330))

(assert (=> d!13435 m!58539))

(declare-fun m!59025 () Bool)

(assert (=> d!13435 m!59025))

(assert (=> b!64328 m!58539))

(declare-fun m!59027 () Bool)

(assert (=> b!64328 m!59027))

(assert (=> b!64328 m!58539))

(declare-fun m!59029 () Bool)

(assert (=> b!64328 m!59029))

(assert (=> b!64328 m!59029))

(declare-fun m!59031 () Bool)

(assert (=> b!64328 m!59031))

(assert (=> b!64330 m!58539))

(assert (=> b!64330 m!59029))

(assert (=> b!64330 m!59029))

(assert (=> b!64330 m!59031))

(assert (=> b!64047 d!13435))

(declare-fun d!13437 () Bool)

(assert (=> d!13437 (= (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (and (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64125 d!13437))

(declare-fun d!13439 () Bool)

(declare-fun e!42174 () Bool)

(assert (=> d!13439 e!42174))

(declare-fun res!35094 () Bool)

(assert (=> d!13439 (=> (not res!35094) (not e!42174))))

(declare-fun lt!27327 () ListLongMap!1379)

(assert (=> d!13439 (= res!35094 (contains!695 lt!27327 (_1!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27325 () List!1444)

(assert (=> d!13439 (= lt!27327 (ListLongMap!1380 lt!27325))))

(declare-fun lt!27326 () Unit!1757)

(declare-fun lt!27328 () Unit!1757)

(assert (=> d!13439 (= lt!27326 lt!27328)))

(assert (=> d!13439 (= (getValueByKey!127 lt!27325 (_1!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13439 (= lt!27328 (lemmaContainsTupThenGetReturnValue!44 lt!27325 (_1!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13439 (= lt!27325 (insertStrictlySorted!47 (toList!705 call!5166) (_1!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) (_2!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13439 (= (+!84 call!5166 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))) lt!27327)))

(declare-fun b!64331 () Bool)

(declare-fun res!35095 () Bool)

(assert (=> b!64331 (=> (not res!35095) (not e!42174))))

(assert (=> b!64331 (= res!35095 (= (getValueByKey!127 (toList!705 lt!27327) (_1!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992)))))) (Some!132 (_2!1036 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64332 () Bool)

(assert (=> b!64332 (= e!42174 (contains!697 (toList!705 lt!27327) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13439 res!35094) b!64331))

(assert (= (and b!64331 res!35095) b!64332))

(declare-fun m!59033 () Bool)

(assert (=> d!13439 m!59033))

(declare-fun m!59035 () Bool)

(assert (=> d!13439 m!59035))

(declare-fun m!59037 () Bool)

(assert (=> d!13439 m!59037))

(declare-fun m!59039 () Bool)

(assert (=> d!13439 m!59039))

(declare-fun m!59041 () Bool)

(assert (=> b!64331 m!59041))

(declare-fun m!59043 () Bool)

(assert (=> b!64332 m!59043))

(assert (=> b!64185 d!13439))

(declare-fun d!13441 () Bool)

(declare-fun e!42177 () Bool)

(assert (=> d!13441 e!42177))

(declare-fun c!8782 () Bool)

(assert (=> d!13441 (= c!8782 (and (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13441 true))

(declare-fun _$29!75 () Unit!1757)

(assert (=> d!13441 (= (choose!343 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (_values!2092 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992))) (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) (zeroValue!2019 (v!2435 (underlying!236 thiss!992))) (minValue!2019 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992)))) _$29!75)))

(declare-fun b!64337 () Bool)

(assert (=> b!64337 (= e!42177 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64338 () Bool)

(assert (=> b!64338 (= e!42177 (ite (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1984 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13441 c!8782) b!64337))

(assert (= (and d!13441 (not c!8782)) b!64338))

(assert (=> b!64337 m!58539))

(assert (=> b!64337 m!58551))

(assert (=> d!13363 d!13441))

(assert (=> d!13363 d!13371))

(assert (=> d!13381 d!13371))

(assert (=> d!13359 d!13365))

(declare-fun d!13443 () Bool)

(assert (=> d!13443 (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1442)))

(assert (=> d!13443 true))

(declare-fun _$71!81 () Unit!1757)

(assert (=> d!13443 (= (choose!39 (_keys!3745 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!81)))

(declare-fun bs!2812 () Bool)

(assert (= bs!2812 d!13443))

(assert (=> bs!2812 m!58547))

(assert (=> d!13359 d!13443))

(declare-fun b!64349 () Bool)

(declare-fun res!35106 () Bool)

(declare-fun e!42180 () Bool)

(assert (=> b!64349 (=> (not res!35106) (not e!42180))))

(declare-fun size!2042 (LongMapFixedSize!642) (_ BitVec 32))

(assert (=> b!64349 (= res!35106 (= (size!2042 newMap!16) (bvadd (_size!370 newMap!16) (bvsdiv (bvadd (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!13445 () Bool)

(declare-fun res!35107 () Bool)

(assert (=> d!13445 (=> (not res!35107) (not e!42180))))

(assert (=> d!13445 (= res!35107 (validMask!0 (mask!6025 newMap!16)))))

(assert (=> d!13445 (= (simpleValid!45 newMap!16) e!42180)))

(declare-fun b!64350 () Bool)

(assert (=> b!64350 (= e!42180 (and (bvsge (extraKeys!1984 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1984 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!370 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!64347 () Bool)

(declare-fun res!35105 () Bool)

(assert (=> b!64347 (=> (not res!35105) (not e!42180))))

(assert (=> b!64347 (= res!35105 (and (= (size!2039 (_values!2092 newMap!16)) (bvadd (mask!6025 newMap!16) #b00000000000000000000000000000001)) (= (size!2038 (_keys!3745 newMap!16)) (size!2039 (_values!2092 newMap!16))) (bvsge (_size!370 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!370 newMap!16) (bvadd (mask!6025 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!64348 () Bool)

(declare-fun res!35104 () Bool)

(assert (=> b!64348 (=> (not res!35104) (not e!42180))))

(assert (=> b!64348 (= res!35104 (bvsge (size!2042 newMap!16) (_size!370 newMap!16)))))

(assert (= (and d!13445 res!35107) b!64347))

(assert (= (and b!64347 res!35105) b!64348))

(assert (= (and b!64348 res!35104) b!64349))

(assert (= (and b!64349 res!35106) b!64350))

(declare-fun m!59045 () Bool)

(assert (=> b!64349 m!59045))

(assert (=> d!13445 m!58801))

(assert (=> b!64348 m!59045))

(assert (=> d!13377 d!13445))

(declare-fun b!64351 () Bool)

(declare-fun e!42182 () Bool)

(declare-fun call!5182 () Bool)

(assert (=> b!64351 (= e!42182 call!5182)))

(declare-fun b!64352 () Bool)

(declare-fun e!42181 () Bool)

(assert (=> b!64352 (= e!42181 e!42182)))

(declare-fun c!8783 () Bool)

(assert (=> b!64352 (= c!8783 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64353 () Bool)

(declare-fun e!42183 () Bool)

(assert (=> b!64353 (= e!42182 e!42183)))

(declare-fun lt!27330 () (_ BitVec 64))

(assert (=> b!64353 (= lt!27330 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27329 () Unit!1757)

(assert (=> b!64353 (= lt!27329 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3745 newMap!16) lt!27330 #b00000000000000000000000000000000))))

(assert (=> b!64353 (arrayContainsKey!0 (_keys!3745 newMap!16) lt!27330 #b00000000000000000000000000000000)))

(declare-fun lt!27331 () Unit!1757)

(assert (=> b!64353 (= lt!27331 lt!27329)))

(declare-fun res!35109 () Bool)

(assert (=> b!64353 (= res!35109 (= (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000) (_keys!3745 newMap!16) (mask!6025 newMap!16)) (Found!230 #b00000000000000000000000000000000)))))

(assert (=> b!64353 (=> (not res!35109) (not e!42183))))

(declare-fun b!64354 () Bool)

(assert (=> b!64354 (= e!42183 call!5182)))

(declare-fun bm!5179 () Bool)

(assert (=> bm!5179 (= call!5182 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun d!13447 () Bool)

(declare-fun res!35108 () Bool)

(assert (=> d!13447 (=> res!35108 e!42181)))

(assert (=> d!13447 (= res!35108 (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3745 newMap!16) (mask!6025 newMap!16)) e!42181)))

(assert (= (and d!13447 (not res!35108)) b!64352))

(assert (= (and b!64352 c!8783) b!64353))

(assert (= (and b!64352 (not c!8783)) b!64351))

(assert (= (and b!64353 res!35109) b!64354))

(assert (= (or b!64354 b!64351) bm!5179))

(assert (=> b!64352 m!58935))

(assert (=> b!64352 m!58935))

(assert (=> b!64352 m!59001))

(assert (=> b!64353 m!58935))

(declare-fun m!59047 () Bool)

(assert (=> b!64353 m!59047))

(declare-fun m!59049 () Bool)

(assert (=> b!64353 m!59049))

(assert (=> b!64353 m!58935))

(declare-fun m!59051 () Bool)

(assert (=> b!64353 m!59051))

(declare-fun m!59053 () Bool)

(assert (=> bm!5179 m!59053))

(assert (=> b!64133 d!13447))

(declare-fun d!13449 () Bool)

(declare-fun e!42185 () Bool)

(assert (=> d!13449 e!42185))

(declare-fun res!35110 () Bool)

(assert (=> d!13449 (=> res!35110 e!42185)))

(declare-fun lt!27335 () Bool)

(assert (=> d!13449 (= res!35110 (not lt!27335))))

(declare-fun lt!27334 () Bool)

(assert (=> d!13449 (= lt!27335 lt!27334)))

(declare-fun lt!27333 () Unit!1757)

(declare-fun e!42184 () Unit!1757)

(assert (=> d!13449 (= lt!27333 e!42184)))

(declare-fun c!8784 () Bool)

(assert (=> d!13449 (= c!8784 lt!27334)))

(assert (=> d!13449 (= lt!27334 (containsKey!131 (toList!705 lt!27208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13449 (= (contains!695 lt!27208 #b1000000000000000000000000000000000000000000000000000000000000000) lt!27335)))

(declare-fun b!64355 () Bool)

(declare-fun lt!27332 () Unit!1757)

(assert (=> b!64355 (= e!42184 lt!27332)))

(assert (=> b!64355 (= lt!27332 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 lt!27208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64355 (isDefined!80 (getValueByKey!127 (toList!705 lt!27208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64356 () Bool)

(declare-fun Unit!1773 () Unit!1757)

(assert (=> b!64356 (= e!42184 Unit!1773)))

(declare-fun b!64357 () Bool)

(assert (=> b!64357 (= e!42185 (isDefined!80 (getValueByKey!127 (toList!705 lt!27208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13449 c!8784) b!64355))

(assert (= (and d!13449 (not c!8784)) b!64356))

(assert (= (and d!13449 (not res!35110)) b!64357))

(declare-fun m!59055 () Bool)

(assert (=> d!13449 m!59055))

(declare-fun m!59057 () Bool)

(assert (=> b!64355 m!59057))

(declare-fun m!59059 () Bool)

(assert (=> b!64355 m!59059))

(assert (=> b!64355 m!59059))

(declare-fun m!59061 () Bool)

(assert (=> b!64355 m!59061))

(assert (=> b!64357 m!59059))

(assert (=> b!64357 m!59059))

(assert (=> b!64357 m!59061))

(assert (=> bm!5167 d!13449))

(declare-fun b!64392 () Bool)

(declare-fun res!35136 () Bool)

(declare-fun e!42205 () Bool)

(assert (=> b!64392 (=> (not res!35136) (not e!42205))))

(declare-fun lt!27416 () SeekEntryResult!230)

(assert (=> b!64392 (= res!35136 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3046 lt!27416)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5188 () Bool)

(declare-fun call!5192 () Bool)

(declare-fun call!5193 () Bool)

(assert (=> bm!5188 (= call!5192 call!5193)))

(declare-fun call!5194 () SeekEntryResult!230)

(declare-fun bm!5189 () Bool)

(assert (=> bm!5189 (= call!5194 (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun b!64393 () Bool)

(declare-fun res!35135 () Bool)

(assert (=> b!64393 (= res!35135 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3049 lt!27416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42209 () Bool)

(assert (=> b!64393 (=> (not res!35135) (not e!42209))))

(declare-fun b!64395 () Bool)

(declare-fun e!42206 () Bool)

(assert (=> b!64395 (= e!42206 e!42209)))

(declare-fun res!35133 () Bool)

(assert (=> b!64395 (= res!35133 call!5192)))

(assert (=> b!64395 (=> (not res!35133) (not e!42209))))

(declare-fun b!64396 () Bool)

(declare-fun call!5191 () Bool)

(assert (=> b!64396 (= e!42205 (not call!5191))))

(declare-fun b!64397 () Bool)

(assert (=> b!64397 (= e!42206 ((_ is Undefined!230) lt!27416))))

(declare-fun b!64398 () Bool)

(declare-fun c!8794 () Bool)

(assert (=> b!64398 (= c!8794 ((_ is MissingVacant!230) lt!27416))))

(declare-fun e!42207 () Bool)

(assert (=> b!64398 (= e!42207 e!42206)))

(declare-fun b!64399 () Bool)

(declare-fun res!35131 () Bool)

(assert (=> b!64399 (= res!35131 call!5193)))

(declare-fun e!42203 () Bool)

(assert (=> b!64399 (=> (not res!35131) (not e!42203))))

(declare-fun b!64400 () Bool)

(declare-fun e!42202 () Unit!1757)

(declare-fun Unit!1774 () Unit!1757)

(assert (=> b!64400 (= e!42202 Unit!1774)))

(declare-fun b!64401 () Bool)

(declare-fun e!42204 () Unit!1757)

(declare-fun Unit!1775 () Unit!1757)

(assert (=> b!64401 (= e!42204 Unit!1775)))

(declare-fun lt!27425 () Unit!1757)

(assert (=> b!64401 (= lt!27425 (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27400 () SeekEntryResult!230)

(assert (=> b!64401 (= lt!27400 call!5194)))

(declare-fun res!35132 () Bool)

(assert (=> b!64401 (= res!35132 ((_ is Found!230) lt!27400))))

(assert (=> b!64401 (=> (not res!35132) (not e!42203))))

(assert (=> b!64401 e!42203))

(declare-fun lt!27422 () Unit!1757)

(assert (=> b!64401 (= lt!27422 lt!27425)))

(assert (=> b!64401 false))

(declare-fun b!64402 () Bool)

(declare-fun res!35130 () Bool)

(declare-fun e!42208 () Bool)

(assert (=> b!64402 (=> (not res!35130) (not e!42208))))

(declare-fun lt!27407 () tuple2!2052)

(assert (=> b!64402 (= res!35130 (valid!265 (_2!1037 lt!27407)))))

(declare-fun b!64403 () Bool)

(declare-fun Unit!1776 () Unit!1757)

(assert (=> b!64403 (= e!42202 Unit!1776)))

(declare-fun lt!27417 () Unit!1757)

(declare-fun lemmaArrayContainsKeyThenInListMap!8 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 64) (_ BitVec 32) Int) Unit!1757)

(assert (=> b!64403 (= lt!27417 (lemmaArrayContainsKeyThenInListMap!8 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(assert (=> b!64403 (contains!695 (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))

(declare-fun lt!27396 () Unit!1757)

(assert (=> b!64403 (= lt!27396 lt!27417)))

(assert (=> b!64403 false))

(declare-fun b!64404 () Bool)

(assert (=> b!64404 (= e!42203 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27400)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64405 () Bool)

(declare-fun lt!27397 () Unit!1757)

(assert (=> b!64405 (= e!42204 lt!27397)))

(assert (=> b!64405 (= lt!27397 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)))))

(assert (=> b!64405 (= lt!27416 call!5194)))

(declare-fun c!8796 () Bool)

(assert (=> b!64405 (= c!8796 ((_ is MissingZero!230) lt!27416))))

(assert (=> b!64405 e!42207))

(declare-fun b!64394 () Bool)

(assert (=> b!64394 (= e!42209 (not call!5191))))

(declare-fun d!13451 () Bool)

(assert (=> d!13451 e!42208))

(declare-fun res!35137 () Bool)

(assert (=> d!13451 (=> (not res!35137) (not e!42208))))

(assert (=> d!13451 (= res!35137 (_1!1037 lt!27407))))

(assert (=> d!13451 (= lt!27407 (tuple2!2053 true (LongMapFixedSize!643 (defaultEntry!2109 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (bvadd (_size!370 newMap!16) #b00000000000000000000000000000001) (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (_vacant!370 newMap!16))))))

(declare-fun lt!27405 () Unit!1757)

(declare-fun lt!27421 () Unit!1757)

(assert (=> d!13451 (= lt!27405 lt!27421)))

(declare-fun lt!27418 () array!3775)

(declare-fun lt!27419 () array!3777)

(assert (=> d!13451 (contains!695 (getCurrentListMap!407 lt!27418 lt!27419 (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (select (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123))))))

(assert (=> d!13451 (= lt!27421 (lemmaValidKeyInArrayIsInListMap!79 lt!27418 lt!27419 (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (defaultEntry!2109 newMap!16)))))

(assert (=> d!13451 (= lt!27419 (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))))))

(assert (=> d!13451 (= lt!27418 (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))))))

(declare-fun lt!27404 () Unit!1757)

(declare-fun lt!27409 () Unit!1757)

(assert (=> d!13451 (= lt!27404 lt!27409)))

(declare-fun lt!27398 () array!3775)

(assert (=> d!13451 (= (arrayCountValidKeys!0 lt!27398 (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (bvadd (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3775 (_ BitVec 32)) Unit!1757)

(assert (=> d!13451 (= lt!27409 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!27398 (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123))))))

(assert (=> d!13451 (= lt!27398 (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))))))

(declare-fun lt!27413 () Unit!1757)

(declare-fun lt!27399 () Unit!1757)

(assert (=> d!13451 (= lt!27413 lt!27399)))

(declare-fun lt!27406 () array!3775)

(assert (=> d!13451 (arrayContainsKey!0 lt!27406 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!13451 (= lt!27399 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!27406 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123))))))

(assert (=> d!13451 (= lt!27406 (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))))))

(declare-fun lt!27410 () Unit!1757)

(declare-fun lt!27412 () Unit!1757)

(assert (=> d!13451 (= lt!27410 lt!27412)))

(assert (=> d!13451 (= (+!84 (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!407 (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!8 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 32) (_ BitVec 64) V!2875 Int) Unit!1757)

(assert (=> d!13451 (= lt!27412 (lemmaAddValidKeyToArrayThenAddPairToListMap!8 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27402 () Unit!1757)

(declare-fun lt!27411 () Unit!1757)

(assert (=> d!13451 (= lt!27402 lt!27411)))

(assert (=> d!13451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))) (mask!6025 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3775 (_ BitVec 32) (_ BitVec 32)) Unit!1757)

(assert (=> d!13451 (= lt!27411 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (mask!6025 newMap!16)))))

(declare-fun lt!27423 () Unit!1757)

(declare-fun lt!27403 () Unit!1757)

(assert (=> d!13451 (= lt!27423 lt!27403)))

(assert (=> d!13451 (= (arrayCountValidKeys!0 (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))) #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3745 newMap!16) #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3775 (_ BitVec 32) (_ BitVec 64)) Unit!1757)

(assert (=> d!13451 (= lt!27403 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3745 newMap!16) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun lt!27424 () Unit!1757)

(declare-fun lt!27414 () Unit!1757)

(assert (=> d!13451 (= lt!27424 lt!27414)))

(declare-fun lt!27415 () List!1445)

(declare-fun lt!27420 () (_ BitVec 32))

(assert (=> d!13451 (arrayNoDuplicates!0 (array!3776 (store (arr!1805 (_keys!3745 newMap!16)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2038 (_keys!3745 newMap!16))) lt!27420 lt!27415)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3775 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1445) Unit!1757)

(assert (=> d!13451 (= lt!27414 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3745 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123)) lt!27420 lt!27415))))

(assert (=> d!13451 (= lt!27415 Nil!1442)))

(assert (=> d!13451 (= lt!27420 #b00000000000000000000000000000000)))

(declare-fun lt!27408 () Unit!1757)

(assert (=> d!13451 (= lt!27408 e!42202)))

(declare-fun c!8793 () Bool)

(assert (=> d!13451 (= c!8793 (arrayContainsKey!0 (_keys!3745 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!27401 () Unit!1757)

(assert (=> d!13451 (= lt!27401 e!42204)))

(declare-fun c!8795 () Bool)

(assert (=> d!13451 (= c!8795 (contains!695 (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13451 (valid!265 newMap!16)))

(assert (=> d!13451 (= (updateHelperNewKey!18 newMap!16 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8716 (index!3049 lt!27123) (index!3046 lt!27123))) lt!27407)))

(declare-fun bm!5190 () Bool)

(assert (=> bm!5190 (= call!5193 (inRange!0 (ite c!8795 (index!3047 lt!27400) (ite c!8796 (index!3046 lt!27416) (index!3049 lt!27416))) (mask!6025 newMap!16)))))

(declare-fun b!64406 () Bool)

(assert (=> b!64406 (= e!42208 (= (map!1118 (_2!1037 lt!27407)) (+!84 (map!1118 newMap!16) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!64407 () Bool)

(declare-fun res!35129 () Bool)

(assert (=> b!64407 (=> (not res!35129) (not e!42208))))

(assert (=> b!64407 (= res!35129 (contains!695 (map!1118 (_2!1037 lt!27407)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64408 () Bool)

(declare-fun res!35134 () Bool)

(assert (=> b!64408 (=> (not res!35134) (not e!42205))))

(assert (=> b!64408 (= res!35134 call!5192)))

(assert (=> b!64408 (= e!42207 e!42205)))

(declare-fun bm!5191 () Bool)

(assert (=> bm!5191 (= call!5191 (arrayContainsKey!0 (_keys!3745 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!13451 c!8795) b!64401))

(assert (= (and d!13451 (not c!8795)) b!64405))

(assert (= (and b!64401 res!35132) b!64399))

(assert (= (and b!64399 res!35131) b!64404))

(assert (= (and b!64405 c!8796) b!64408))

(assert (= (and b!64405 (not c!8796)) b!64398))

(assert (= (and b!64408 res!35134) b!64392))

(assert (= (and b!64392 res!35136) b!64396))

(assert (= (and b!64398 c!8794) b!64395))

(assert (= (and b!64398 (not c!8794)) b!64397))

(assert (= (and b!64395 res!35133) b!64393))

(assert (= (and b!64393 res!35135) b!64394))

(assert (= (or b!64408 b!64395) bm!5188))

(assert (= (or b!64396 b!64394) bm!5191))

(assert (= (or b!64399 bm!5188) bm!5190))

(assert (= (or b!64401 b!64405) bm!5189))

(assert (= (and d!13451 c!8793) b!64403))

(assert (= (and d!13451 (not c!8793)) b!64400))

(assert (= (and d!13451 res!35137) b!64402))

(assert (= (and b!64402 res!35130) b!64407))

(assert (= (and b!64407 res!35129) b!64406))

(declare-fun m!59063 () Bool)

(assert (=> b!64404 m!59063))

(declare-fun m!59065 () Bool)

(assert (=> b!64407 m!59065))

(assert (=> b!64407 m!59065))

(assert (=> b!64407 m!58539))

(declare-fun m!59067 () Bool)

(assert (=> b!64407 m!59067))

(assert (=> b!64403 m!58539))

(declare-fun m!59069 () Bool)

(assert (=> b!64403 m!59069))

(assert (=> b!64403 m!58731))

(assert (=> b!64403 m!58731))

(assert (=> b!64403 m!58539))

(declare-fun m!59071 () Bool)

(assert (=> b!64403 m!59071))

(assert (=> b!64401 m!58539))

(assert (=> b!64401 m!58687))

(assert (=> b!64406 m!59065))

(assert (=> b!64406 m!58541))

(assert (=> b!64406 m!58541))

(declare-fun m!59073 () Bool)

(assert (=> b!64406 m!59073))

(assert (=> b!64405 m!58539))

(assert (=> b!64405 m!58671))

(assert (=> bm!5191 m!58539))

(assert (=> bm!5191 m!58653))

(declare-fun m!59075 () Bool)

(assert (=> b!64393 m!59075))

(declare-fun m!59077 () Bool)

(assert (=> b!64402 m!59077))

(declare-fun m!59079 () Bool)

(assert (=> bm!5190 m!59079))

(assert (=> d!13451 m!58539))

(declare-fun m!59081 () Bool)

(assert (=> d!13451 m!59081))

(declare-fun m!59083 () Bool)

(assert (=> d!13451 m!59083))

(assert (=> d!13451 m!58559))

(assert (=> d!13451 m!58731))

(assert (=> d!13451 m!58539))

(assert (=> d!13451 m!59071))

(assert (=> d!13451 m!58725))

(declare-fun m!59085 () Bool)

(assert (=> d!13451 m!59085))

(declare-fun m!59087 () Bool)

(assert (=> d!13451 m!59087))

(assert (=> d!13451 m!58539))

(assert (=> d!13451 m!58653))

(declare-fun m!59089 () Bool)

(assert (=> d!13451 m!59089))

(assert (=> d!13451 m!58731))

(assert (=> d!13451 m!58539))

(assert (=> d!13451 m!58567))

(declare-fun m!59091 () Bool)

(assert (=> d!13451 m!59091))

(declare-fun m!59093 () Bool)

(assert (=> d!13451 m!59093))

(assert (=> d!13451 m!58539))

(declare-fun m!59095 () Bool)

(assert (=> d!13451 m!59095))

(declare-fun m!59097 () Bool)

(assert (=> d!13451 m!59097))

(declare-fun m!59099 () Bool)

(assert (=> d!13451 m!59099))

(assert (=> d!13451 m!58731))

(declare-fun m!59101 () Bool)

(assert (=> d!13451 m!59101))

(assert (=> d!13451 m!58539))

(declare-fun m!59103 () Bool)

(assert (=> d!13451 m!59103))

(declare-fun m!59105 () Bool)

(assert (=> d!13451 m!59105))

(assert (=> d!13451 m!59087))

(declare-fun m!59107 () Bool)

(assert (=> d!13451 m!59107))

(declare-fun m!59109 () Bool)

(assert (=> d!13451 m!59109))

(assert (=> d!13451 m!58539))

(declare-fun m!59111 () Bool)

(assert (=> d!13451 m!59111))

(declare-fun m!59113 () Bool)

(assert (=> d!13451 m!59113))

(assert (=> d!13451 m!59105))

(declare-fun m!59115 () Bool)

(assert (=> d!13451 m!59115))

(assert (=> d!13451 m!58539))

(declare-fun m!59117 () Bool)

(assert (=> d!13451 m!59117))

(declare-fun m!59119 () Bool)

(assert (=> b!64392 m!59119))

(assert (=> bm!5189 m!58539))

(assert (=> bm!5189 m!58647))

(assert (=> bm!5125 d!13451))

(assert (=> bm!5161 d!13395))

(declare-fun d!13453 () Bool)

(declare-fun e!42211 () Bool)

(assert (=> d!13453 e!42211))

(declare-fun res!35138 () Bool)

(assert (=> d!13453 (=> res!35138 e!42211)))

(declare-fun lt!27429 () Bool)

(assert (=> d!13453 (= res!35138 (not lt!27429))))

(declare-fun lt!27428 () Bool)

(assert (=> d!13453 (= lt!27429 lt!27428)))

(declare-fun lt!27427 () Unit!1757)

(declare-fun e!42210 () Unit!1757)

(assert (=> d!13453 (= lt!27427 e!42210)))

(declare-fun c!8797 () Bool)

(assert (=> d!13453 (= c!8797 lt!27428)))

(assert (=> d!13453 (= lt!27428 (containsKey!131 (toList!705 lt!27208) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!13453 (= (contains!695 lt!27208 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!27429)))

(declare-fun b!64409 () Bool)

(declare-fun lt!27426 () Unit!1757)

(assert (=> b!64409 (= e!42210 lt!27426)))

(assert (=> b!64409 (= lt!27426 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 lt!27208) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64409 (isDefined!80 (getValueByKey!127 (toList!705 lt!27208) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64410 () Bool)

(declare-fun Unit!1777 () Unit!1757)

(assert (=> b!64410 (= e!42210 Unit!1777)))

(declare-fun b!64411 () Bool)

(assert (=> b!64411 (= e!42211 (isDefined!80 (getValueByKey!127 (toList!705 lt!27208) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!13453 c!8797) b!64409))

(assert (= (and d!13453 (not c!8797)) b!64410))

(assert (= (and d!13453 (not res!35138)) b!64411))

(assert (=> d!13453 m!58711))

(declare-fun m!59121 () Bool)

(assert (=> d!13453 m!59121))

(assert (=> b!64409 m!58711))

(declare-fun m!59123 () Bool)

(assert (=> b!64409 m!59123))

(assert (=> b!64409 m!58711))

(declare-fun m!59125 () Bool)

(assert (=> b!64409 m!59125))

(assert (=> b!64409 m!59125))

(declare-fun m!59127 () Bool)

(assert (=> b!64409 m!59127))

(assert (=> b!64411 m!58711))

(assert (=> b!64411 m!59125))

(assert (=> b!64411 m!59125))

(assert (=> b!64411 m!59127))

(assert (=> b!64192 d!13453))

(assert (=> b!64109 d!13361))

(declare-fun d!13455 () Bool)

(assert (=> d!13455 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27142 #b00000000000000000000000000000000)))

(declare-fun lt!27432 () Unit!1757)

(declare-fun choose!13 (array!3775 (_ BitVec 64) (_ BitVec 32)) Unit!1757)

(assert (=> d!13455 (= lt!27432 (choose!13 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27142 #b00000000000000000000000000000000))))

(assert (=> d!13455 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!13455 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27142 #b00000000000000000000000000000000) lt!27432)))

(declare-fun bs!2813 () Bool)

(assert (= bs!2813 d!13455))

(assert (=> bs!2813 m!58699))

(declare-fun m!59129 () Bool)

(assert (=> bs!2813 m!59129))

(assert (=> b!64097 d!13455))

(declare-fun d!13457 () Bool)

(declare-fun res!35139 () Bool)

(declare-fun e!42212 () Bool)

(assert (=> d!13457 (=> res!35139 e!42212)))

(assert (=> d!13457 (= res!35139 (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) lt!27142))))

(assert (=> d!13457 (= (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27142 #b00000000000000000000000000000000) e!42212)))

(declare-fun b!64412 () Bool)

(declare-fun e!42213 () Bool)

(assert (=> b!64412 (= e!42212 e!42213)))

(declare-fun res!35140 () Bool)

(assert (=> b!64412 (=> (not res!35140) (not e!42213))))

(assert (=> b!64412 (= res!35140 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64413 () Bool)

(assert (=> b!64413 (= e!42213 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) lt!27142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13457 (not res!35139)) b!64412))

(assert (= (and b!64412 res!35140) b!64413))

(assert (=> d!13457 m!58693))

(declare-fun m!59131 () Bool)

(assert (=> b!64413 m!59131))

(assert (=> b!64097 d!13457))

(declare-fun b!64414 () Bool)

(declare-fun e!42215 () SeekEntryResult!230)

(declare-fun lt!27433 () SeekEntryResult!230)

(assert (=> b!64414 (= e!42215 (Found!230 (index!3048 lt!27433)))))

(declare-fun b!64415 () Bool)

(declare-fun e!42216 () SeekEntryResult!230)

(assert (=> b!64415 (= e!42216 e!42215)))

(declare-fun lt!27434 () (_ BitVec 64))

(assert (=> b!64415 (= lt!27434 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (index!3048 lt!27433)))))

(declare-fun c!8798 () Bool)

(assert (=> b!64415 (= c!8798 (= lt!27434 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64416 () Bool)

(declare-fun c!8799 () Bool)

(assert (=> b!64416 (= c!8799 (= lt!27434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42214 () SeekEntryResult!230)

(assert (=> b!64416 (= e!42215 e!42214)))

(declare-fun b!64417 () Bool)

(assert (=> b!64417 (= e!42214 (seekKeyOrZeroReturnVacant!0 (x!10452 lt!27433) (index!3048 lt!27433) (index!3048 lt!27433) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun d!13459 () Bool)

(declare-fun lt!27435 () SeekEntryResult!230)

(assert (=> d!13459 (and (or ((_ is Undefined!230) lt!27435) (not ((_ is Found!230) lt!27435)) (and (bvsge (index!3047 lt!27435) #b00000000000000000000000000000000) (bvslt (index!3047 lt!27435) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))) (or ((_ is Undefined!230) lt!27435) ((_ is Found!230) lt!27435) (not ((_ is MissingZero!230) lt!27435)) (and (bvsge (index!3046 lt!27435) #b00000000000000000000000000000000) (bvslt (index!3046 lt!27435) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))) (or ((_ is Undefined!230) lt!27435) ((_ is Found!230) lt!27435) ((_ is MissingZero!230) lt!27435) (not ((_ is MissingVacant!230) lt!27435)) (and (bvsge (index!3049 lt!27435) #b00000000000000000000000000000000) (bvslt (index!3049 lt!27435) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))) (or ((_ is Undefined!230) lt!27435) (ite ((_ is Found!230) lt!27435) (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (index!3047 lt!27435)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!230) lt!27435) (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (index!3046 lt!27435)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!230) lt!27435) (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (index!3049 lt!27435)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13459 (= lt!27435 e!42216)))

(declare-fun c!8800 () Bool)

(assert (=> d!13459 (= c!8800 (and ((_ is Intermediate!230) lt!27433) (undefined!1042 lt!27433)))))

(assert (=> d!13459 (= lt!27433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (mask!6025 (v!2435 (underlying!236 thiss!992)))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))))))

(assert (=> d!13459 (validMask!0 (mask!6025 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13459 (= (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))) lt!27435)))

(declare-fun b!64418 () Bool)

(assert (=> b!64418 (= e!42216 Undefined!230)))

(declare-fun b!64419 () Bool)

(assert (=> b!64419 (= e!42214 (MissingZero!230 (index!3048 lt!27433)))))

(assert (= (and d!13459 c!8800) b!64418))

(assert (= (and d!13459 (not c!8800)) b!64415))

(assert (= (and b!64415 c!8798) b!64414))

(assert (= (and b!64415 (not c!8798)) b!64416))

(assert (= (and b!64416 c!8799) b!64419))

(assert (= (and b!64416 (not c!8799)) b!64417))

(declare-fun m!59133 () Bool)

(assert (=> b!64415 m!59133))

(assert (=> b!64417 m!58693))

(declare-fun m!59135 () Bool)

(assert (=> b!64417 m!59135))

(declare-fun m!59137 () Bool)

(assert (=> d!13459 m!59137))

(declare-fun m!59139 () Bool)

(assert (=> d!13459 m!59139))

(declare-fun m!59141 () Bool)

(assert (=> d!13459 m!59141))

(assert (=> d!13459 m!58555))

(declare-fun m!59143 () Bool)

(assert (=> d!13459 m!59143))

(assert (=> d!13459 m!58693))

(declare-fun m!59145 () Bool)

(assert (=> d!13459 m!59145))

(assert (=> d!13459 m!58693))

(assert (=> d!13459 m!59143))

(assert (=> b!64097 d!13459))

(declare-fun b!64420 () Bool)

(declare-fun e!42218 () Bool)

(declare-fun e!42225 () Bool)

(assert (=> b!64420 (= e!42218 e!42225)))

(declare-fun c!8801 () Bool)

(assert (=> b!64420 (= c!8801 (not (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5192 () Bool)

(declare-fun call!5198 () ListLongMap!1379)

(assert (=> bm!5192 (= call!5198 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114) (mask!6025 newMap!16) (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) (zeroValue!2019 newMap!16) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun b!64421 () Bool)

(declare-fun res!35149 () Bool)

(assert (=> b!64421 (=> (not res!35149) (not e!42218))))

(declare-fun e!42217 () Bool)

(assert (=> b!64421 (= res!35149 e!42217)))

(declare-fun res!35142 () Bool)

(assert (=> b!64421 (=> res!35142 e!42217)))

(declare-fun e!42219 () Bool)

(assert (=> b!64421 (= res!35142 (not e!42219))))

(declare-fun res!35144 () Bool)

(assert (=> b!64421 (=> (not res!35144) (not e!42219))))

(assert (=> b!64421 (= res!35144 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64422 () Bool)

(declare-fun e!42220 () ListLongMap!1379)

(declare-fun e!42221 () ListLongMap!1379)

(assert (=> b!64422 (= e!42220 e!42221)))

(declare-fun c!8806 () Bool)

(assert (=> b!64422 (= c!8806 (and (not (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5193 () Bool)

(declare-fun call!5195 () Bool)

(declare-fun lt!27447 () ListLongMap!1379)

(assert (=> bm!5193 (= call!5195 (contains!695 lt!27447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!13461 () Bool)

(assert (=> d!13461 e!42218))

(declare-fun res!35143 () Bool)

(assert (=> d!13461 (=> (not res!35143) (not e!42218))))

(assert (=> d!13461 (= res!35143 (or (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))))

(declare-fun lt!27443 () ListLongMap!1379)

(assert (=> d!13461 (= lt!27447 lt!27443)))

(declare-fun lt!27450 () Unit!1757)

(declare-fun e!42224 () Unit!1757)

(assert (=> d!13461 (= lt!27450 e!42224)))

(declare-fun c!8803 () Bool)

(declare-fun e!42229 () Bool)

(assert (=> d!13461 (= c!8803 e!42229)))

(declare-fun res!35147 () Bool)

(assert (=> d!13461 (=> (not res!35147) (not e!42229))))

(assert (=> d!13461 (= res!35147 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13461 (= lt!27443 e!42220)))

(declare-fun c!8802 () Bool)

(assert (=> d!13461 (= c!8802 (and (not (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13461 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13461 (= (getCurrentListMap!407 (_keys!3745 newMap!16) (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114) (mask!6025 newMap!16) (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) (zeroValue!2019 newMap!16) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) lt!27447)))

(declare-fun b!64423 () Bool)

(declare-fun lt!27457 () Unit!1757)

(assert (=> b!64423 (= e!42224 lt!27457)))

(declare-fun lt!27442 () ListLongMap!1379)

(assert (=> b!64423 (= lt!27442 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114) (mask!6025 newMap!16) (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) (zeroValue!2019 newMap!16) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27454 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27456 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27456 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27436 () Unit!1757)

(assert (=> b!64423 (= lt!27436 (addStillContains!45 lt!27442 lt!27454 (zeroValue!2019 newMap!16) lt!27456))))

(assert (=> b!64423 (contains!695 (+!84 lt!27442 (tuple2!2051 lt!27454 (zeroValue!2019 newMap!16))) lt!27456)))

(declare-fun lt!27446 () Unit!1757)

(assert (=> b!64423 (= lt!27446 lt!27436)))

(declare-fun lt!27451 () ListLongMap!1379)

(assert (=> b!64423 (= lt!27451 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114) (mask!6025 newMap!16) (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) (zeroValue!2019 newMap!16) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27444 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27444 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27440 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27440 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27452 () Unit!1757)

(assert (=> b!64423 (= lt!27452 (addApplyDifferent!45 lt!27451 lt!27444 (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) lt!27440))))

(assert (=> b!64423 (= (apply!69 (+!84 lt!27451 (tuple2!2051 lt!27444 (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)))) lt!27440) (apply!69 lt!27451 lt!27440))))

(declare-fun lt!27455 () Unit!1757)

(assert (=> b!64423 (= lt!27455 lt!27452)))

(declare-fun lt!27438 () ListLongMap!1379)

(assert (=> b!64423 (= lt!27438 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114) (mask!6025 newMap!16) (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) (zeroValue!2019 newMap!16) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27449 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27439 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27439 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27448 () Unit!1757)

(assert (=> b!64423 (= lt!27448 (addApplyDifferent!45 lt!27438 lt!27449 (zeroValue!2019 newMap!16) lt!27439))))

(assert (=> b!64423 (= (apply!69 (+!84 lt!27438 (tuple2!2051 lt!27449 (zeroValue!2019 newMap!16))) lt!27439) (apply!69 lt!27438 lt!27439))))

(declare-fun lt!27437 () Unit!1757)

(assert (=> b!64423 (= lt!27437 lt!27448)))

(declare-fun lt!27441 () ListLongMap!1379)

(assert (=> b!64423 (= lt!27441 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114) (mask!6025 newMap!16) (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) (zeroValue!2019 newMap!16) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27445 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27453 () (_ BitVec 64))

(assert (=> b!64423 (= lt!27453 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64423 (= lt!27457 (addApplyDifferent!45 lt!27441 lt!27445 (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)) lt!27453))))

(assert (=> b!64423 (= (apply!69 (+!84 lt!27441 (tuple2!2051 lt!27445 (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)))) lt!27453) (apply!69 lt!27441 lt!27453))))

(declare-fun bm!5194 () Bool)

(declare-fun call!5199 () ListLongMap!1379)

(declare-fun call!5200 () ListLongMap!1379)

(assert (=> bm!5194 (= call!5199 call!5200)))

(declare-fun call!5197 () ListLongMap!1379)

(declare-fun bm!5195 () Bool)

(assert (=> bm!5195 (= call!5197 (+!84 (ite c!8802 call!5198 (ite c!8806 call!5200 call!5199)) (ite (or c!8802 c!8806) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 newMap!16)) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16))))))))

(declare-fun bm!5196 () Bool)

(assert (=> bm!5196 (= call!5200 call!5198)))

(declare-fun b!64424 () Bool)

(declare-fun Unit!1778 () Unit!1757)

(assert (=> b!64424 (= e!42224 Unit!1778)))

(declare-fun b!64425 () Bool)

(assert (=> b!64425 (= e!42219 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5197 () Bool)

(declare-fun call!5201 () ListLongMap!1379)

(assert (=> bm!5197 (= call!5201 call!5197)))

(declare-fun b!64426 () Bool)

(declare-fun call!5196 () Bool)

(assert (=> b!64426 (= e!42225 (not call!5196))))

(declare-fun b!64427 () Bool)

(declare-fun e!42228 () ListLongMap!1379)

(assert (=> b!64427 (= e!42228 call!5199)))

(declare-fun b!64428 () Bool)

(assert (=> b!64428 (= e!42220 (+!84 call!5197 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16)))))))

(declare-fun b!64429 () Bool)

(declare-fun e!42223 () Bool)

(declare-fun e!42227 () Bool)

(assert (=> b!64429 (= e!42223 e!42227)))

(declare-fun res!35145 () Bool)

(assert (=> b!64429 (= res!35145 call!5195)))

(assert (=> b!64429 (=> (not res!35145) (not e!42227))))

(declare-fun b!64430 () Bool)

(assert (=> b!64430 (= e!42221 call!5201)))

(declare-fun b!64431 () Bool)

(declare-fun e!42222 () Bool)

(assert (=> b!64431 (= e!42222 (= (apply!69 lt!27447 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)) (get!1090 (select (arr!1806 (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114)) #b00000000000000000000000000000000) (dynLambda!311 (defaultEntry!2109 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2039 (ite (or c!8714 c!8717) (_values!2092 newMap!16) lt!27114))))))

(assert (=> b!64431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64432 () Bool)

(declare-fun e!42226 () Bool)

(assert (=> b!64432 (= e!42225 e!42226)))

(declare-fun res!35146 () Bool)

(assert (=> b!64432 (= res!35146 call!5196)))

(assert (=> b!64432 (=> (not res!35146) (not e!42226))))

(declare-fun b!64433 () Bool)

(assert (=> b!64433 (= e!42226 (= (apply!69 lt!27447 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!8714 (ite c!8708 (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2019 newMap!16))))))

(declare-fun bm!5198 () Bool)

(assert (=> bm!5198 (= call!5196 (contains!695 lt!27447 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64434 () Bool)

(assert (=> b!64434 (= e!42229 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64435 () Bool)

(assert (=> b!64435 (= e!42217 e!42222)))

(declare-fun res!35141 () Bool)

(assert (=> b!64435 (=> (not res!35141) (not e!42222))))

(assert (=> b!64435 (= res!35141 (contains!695 lt!27447 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64436 () Bool)

(assert (=> b!64436 (= e!42227 (= (apply!69 lt!27447 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2019 newMap!16)))))

(declare-fun b!64437 () Bool)

(declare-fun res!35148 () Bool)

(assert (=> b!64437 (=> (not res!35148) (not e!42218))))

(assert (=> b!64437 (= res!35148 e!42223)))

(declare-fun c!8804 () Bool)

(assert (=> b!64437 (= c!8804 (not (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64438 () Bool)

(assert (=> b!64438 (= e!42223 (not call!5195))))

(declare-fun c!8805 () Bool)

(declare-fun b!64439 () Bool)

(assert (=> b!64439 (= c!8805 (and (not (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!8714 (ite c!8708 (extraKeys!1984 newMap!16) lt!27131) (extraKeys!1984 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!64439 (= e!42221 e!42228)))

(declare-fun b!64440 () Bool)

(assert (=> b!64440 (= e!42228 call!5201)))

(assert (= (and d!13461 c!8802) b!64428))

(assert (= (and d!13461 (not c!8802)) b!64422))

(assert (= (and b!64422 c!8806) b!64430))

(assert (= (and b!64422 (not c!8806)) b!64439))

(assert (= (and b!64439 c!8805) b!64440))

(assert (= (and b!64439 (not c!8805)) b!64427))

(assert (= (or b!64440 b!64427) bm!5194))

(assert (= (or b!64430 bm!5194) bm!5196))

(assert (= (or b!64430 b!64440) bm!5197))

(assert (= (or b!64428 bm!5196) bm!5192))

(assert (= (or b!64428 bm!5197) bm!5195))

(assert (= (and d!13461 res!35147) b!64434))

(assert (= (and d!13461 c!8803) b!64423))

(assert (= (and d!13461 (not c!8803)) b!64424))

(assert (= (and d!13461 res!35143) b!64421))

(assert (= (and b!64421 res!35144) b!64425))

(assert (= (and b!64421 (not res!35142)) b!64435))

(assert (= (and b!64435 res!35141) b!64431))

(assert (= (and b!64421 res!35149) b!64437))

(assert (= (and b!64437 c!8804) b!64429))

(assert (= (and b!64437 (not c!8804)) b!64438))

(assert (= (and b!64429 res!35145) b!64436))

(assert (= (or b!64429 b!64438) bm!5193))

(assert (= (and b!64437 res!35148) b!64420))

(assert (= (and b!64420 c!8801) b!64432))

(assert (= (and b!64420 (not c!8801)) b!64426))

(assert (= (and b!64432 res!35146) b!64433))

(assert (= (or b!64432 b!64426) bm!5198))

(declare-fun b_lambda!2891 () Bool)

(assert (=> (not b_lambda!2891) (not b!64431)))

(assert (=> b!64431 t!4866))

(declare-fun b_and!3951 () Bool)

(assert (= b_and!3947 (and (=> t!4866 result!2487) b_and!3951)))

(assert (=> b!64431 t!4868))

(declare-fun b_and!3953 () Bool)

(assert (= b_and!3949 (and (=> t!4868 result!2489) b_and!3953)))

(assert (=> d!13461 m!58801))

(assert (=> b!64431 m!58935))

(assert (=> b!64431 m!58951))

(declare-fun m!59147 () Bool)

(assert (=> b!64431 m!59147))

(assert (=> b!64431 m!58935))

(declare-fun m!59149 () Bool)

(assert (=> b!64431 m!59149))

(assert (=> b!64431 m!59147))

(assert (=> b!64431 m!58951))

(declare-fun m!59151 () Bool)

(assert (=> b!64431 m!59151))

(declare-fun m!59153 () Bool)

(assert (=> bm!5192 m!59153))

(declare-fun m!59155 () Bool)

(assert (=> bm!5198 m!59155))

(assert (=> b!64435 m!58935))

(assert (=> b!64435 m!58935))

(declare-fun m!59157 () Bool)

(assert (=> b!64435 m!59157))

(assert (=> b!64423 m!59153))

(declare-fun m!59159 () Bool)

(assert (=> b!64423 m!59159))

(declare-fun m!59161 () Bool)

(assert (=> b!64423 m!59161))

(assert (=> b!64423 m!58935))

(declare-fun m!59163 () Bool)

(assert (=> b!64423 m!59163))

(declare-fun m!59165 () Bool)

(assert (=> b!64423 m!59165))

(declare-fun m!59167 () Bool)

(assert (=> b!64423 m!59167))

(declare-fun m!59169 () Bool)

(assert (=> b!64423 m!59169))

(declare-fun m!59171 () Bool)

(assert (=> b!64423 m!59171))

(declare-fun m!59173 () Bool)

(assert (=> b!64423 m!59173))

(declare-fun m!59175 () Bool)

(assert (=> b!64423 m!59175))

(declare-fun m!59177 () Bool)

(assert (=> b!64423 m!59177))

(assert (=> b!64423 m!59171))

(assert (=> b!64423 m!59175))

(declare-fun m!59179 () Bool)

(assert (=> b!64423 m!59179))

(declare-fun m!59181 () Bool)

(assert (=> b!64423 m!59181))

(declare-fun m!59183 () Bool)

(assert (=> b!64423 m!59183))

(assert (=> b!64423 m!59165))

(declare-fun m!59185 () Bool)

(assert (=> b!64423 m!59185))

(assert (=> b!64423 m!59161))

(declare-fun m!59187 () Bool)

(assert (=> b!64423 m!59187))

(declare-fun m!59189 () Bool)

(assert (=> bm!5193 m!59189))

(declare-fun m!59191 () Bool)

(assert (=> b!64428 m!59191))

(declare-fun m!59193 () Bool)

(assert (=> b!64433 m!59193))

(assert (=> b!64434 m!58935))

(assert (=> b!64434 m!58935))

(assert (=> b!64434 m!59001))

(declare-fun m!59195 () Bool)

(assert (=> b!64436 m!59195))

(declare-fun m!59197 () Bool)

(assert (=> bm!5195 m!59197))

(assert (=> b!64425 m!58935))

(assert (=> b!64425 m!58935))

(assert (=> b!64425 m!59001))

(assert (=> bm!5140 d!13461))

(declare-fun b!64457 () Bool)

(declare-fun res!35159 () Bool)

(declare-fun e!42239 () Bool)

(assert (=> b!64457 (=> (not res!35159) (not e!42239))))

(declare-fun call!5207 () Bool)

(assert (=> b!64457 (= res!35159 call!5207)))

(declare-fun e!42238 () Bool)

(assert (=> b!64457 (= e!42238 e!42239)))

(declare-fun b!64458 () Bool)

(declare-fun res!35160 () Bool)

(assert (=> b!64458 (=> (not res!35160) (not e!42239))))

(declare-fun lt!27462 () SeekEntryResult!230)

(assert (=> b!64458 (= res!35160 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3049 lt!27462)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64458 (and (bvsge (index!3049 lt!27462) #b00000000000000000000000000000000) (bvslt (index!3049 lt!27462) (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64459 () Bool)

(declare-fun e!42241 () Bool)

(assert (=> b!64459 (= e!42241 e!42238)))

(declare-fun c!8811 () Bool)

(assert (=> b!64459 (= c!8811 ((_ is MissingVacant!230) lt!27462))))

(declare-fun b!64460 () Bool)

(declare-fun e!42240 () Bool)

(declare-fun call!5206 () Bool)

(assert (=> b!64460 (= e!42240 (not call!5206))))

(declare-fun bm!5203 () Bool)

(declare-fun c!8812 () Bool)

(assert (=> bm!5203 (= call!5207 (inRange!0 (ite c!8812 (index!3046 lt!27462) (index!3049 lt!27462)) (mask!6025 newMap!16)))))

(declare-fun b!64461 () Bool)

(assert (=> b!64461 (= e!42238 ((_ is Undefined!230) lt!27462))))

(declare-fun d!13463 () Bool)

(assert (=> d!13463 e!42241))

(assert (=> d!13463 (= c!8812 ((_ is MissingZero!230) lt!27462))))

(assert (=> d!13463 (= lt!27462 (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun lt!27463 () Unit!1757)

(declare-fun choose!346 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 64) Int) Unit!1757)

(assert (=> d!13463 (= lt!27463 (choose!346 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)))))

(assert (=> d!13463 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13463 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)) lt!27463)))

(declare-fun b!64462 () Bool)

(assert (=> b!64462 (and (bvsge (index!3046 lt!27462) #b00000000000000000000000000000000) (bvslt (index!3046 lt!27462) (size!2038 (_keys!3745 newMap!16))))))

(declare-fun res!35161 () Bool)

(assert (=> b!64462 (= res!35161 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3046 lt!27462)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64462 (=> (not res!35161) (not e!42240))))

(declare-fun b!64463 () Bool)

(assert (=> b!64463 (= e!42239 (not call!5206))))

(declare-fun bm!5204 () Bool)

(assert (=> bm!5204 (= call!5206 (arrayContainsKey!0 (_keys!3745 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64464 () Bool)

(assert (=> b!64464 (= e!42241 e!42240)))

(declare-fun res!35158 () Bool)

(assert (=> b!64464 (= res!35158 call!5207)))

(assert (=> b!64464 (=> (not res!35158) (not e!42240))))

(assert (= (and d!13463 c!8812) b!64464))

(assert (= (and d!13463 (not c!8812)) b!64459))

(assert (= (and b!64464 res!35158) b!64462))

(assert (= (and b!64462 res!35161) b!64460))

(assert (= (and b!64459 c!8811) b!64457))

(assert (= (and b!64459 (not c!8811)) b!64461))

(assert (= (and b!64457 res!35159) b!64458))

(assert (= (and b!64458 res!35160) b!64463))

(assert (= (or b!64464 b!64457) bm!5203))

(assert (= (or b!64460 b!64463) bm!5204))

(assert (=> bm!5204 m!58539))

(assert (=> bm!5204 m!58653))

(declare-fun m!59199 () Bool)

(assert (=> b!64458 m!59199))

(declare-fun m!59201 () Bool)

(assert (=> b!64462 m!59201))

(declare-fun m!59203 () Bool)

(assert (=> bm!5203 m!59203))

(assert (=> d!13463 m!58539))

(assert (=> d!13463 m!58647))

(assert (=> d!13463 m!58539))

(declare-fun m!59205 () Bool)

(assert (=> d!13463 m!59205))

(assert (=> d!13463 m!58801))

(assert (=> bm!5127 d!13463))

(declare-fun d!13465 () Bool)

(declare-fun e!42243 () Bool)

(assert (=> d!13465 e!42243))

(declare-fun res!35162 () Bool)

(assert (=> d!13465 (=> res!35162 e!42243)))

(declare-fun lt!27467 () Bool)

(assert (=> d!13465 (= res!35162 (not lt!27467))))

(declare-fun lt!27466 () Bool)

(assert (=> d!13465 (= lt!27467 lt!27466)))

(declare-fun lt!27465 () Unit!1757)

(declare-fun e!42242 () Unit!1757)

(assert (=> d!13465 (= lt!27465 e!42242)))

(declare-fun c!8813 () Bool)

(assert (=> d!13465 (= c!8813 lt!27466)))

(assert (=> d!13465 (= lt!27466 (containsKey!131 (toList!705 lt!27208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13465 (= (contains!695 lt!27208 #b0000000000000000000000000000000000000000000000000000000000000000) lt!27467)))

(declare-fun b!64465 () Bool)

(declare-fun lt!27464 () Unit!1757)

(assert (=> b!64465 (= e!42242 lt!27464)))

(assert (=> b!64465 (= lt!27464 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 lt!27208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64465 (isDefined!80 (getValueByKey!127 (toList!705 lt!27208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64466 () Bool)

(declare-fun Unit!1779 () Unit!1757)

(assert (=> b!64466 (= e!42242 Unit!1779)))

(declare-fun b!64467 () Bool)

(assert (=> b!64467 (= e!42243 (isDefined!80 (getValueByKey!127 (toList!705 lt!27208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13465 c!8813) b!64465))

(assert (= (and d!13465 (not c!8813)) b!64466))

(assert (= (and d!13465 (not res!35162)) b!64467))

(declare-fun m!59207 () Bool)

(assert (=> d!13465 m!59207))

(declare-fun m!59209 () Bool)

(assert (=> b!64465 m!59209))

(declare-fun m!59211 () Bool)

(assert (=> b!64465 m!59211))

(assert (=> b!64465 m!59211))

(declare-fun m!59213 () Bool)

(assert (=> b!64465 m!59213))

(assert (=> b!64467 m!59211))

(assert (=> b!64467 m!59211))

(assert (=> b!64467 m!59213))

(assert (=> bm!5162 d!13465))

(assert (=> d!13357 d!13361))

(declare-fun d!13467 () Bool)

(assert (=> d!13467 (not (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!13467 true))

(declare-fun _$68!40 () Unit!1757)

(assert (=> d!13467 (= (choose!68 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442)) _$68!40)))

(declare-fun bs!2814 () Bool)

(assert (= bs!2814 d!13467))

(assert (=> bs!2814 m!58539))

(assert (=> bs!2814 m!58551))

(assert (=> d!13357 d!13467))

(declare-fun d!13469 () Bool)

(assert (=> d!13469 (= (+!84 (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) lt!27119 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27470 () Unit!1757)

(declare-fun choose!347 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 V!2875 Int) Unit!1757)

(assert (=> d!13469 (= lt!27470 (choose!347 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) lt!27119 (zeroValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2019 newMap!16) (defaultEntry!2109 newMap!16)))))

(assert (=> d!13469 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13469 (= (lemmaChangeZeroKeyThenAddPairToListMap!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) lt!27119 (zeroValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2019 newMap!16) (defaultEntry!2109 newMap!16)) lt!27470)))

(declare-fun bs!2815 () Bool)

(assert (= bs!2815 d!13469))

(assert (=> bs!2815 m!58567))

(declare-fun m!59215 () Bool)

(assert (=> bs!2815 m!59215))

(assert (=> bs!2815 m!58731))

(declare-fun m!59217 () Bool)

(assert (=> bs!2815 m!59217))

(assert (=> bs!2815 m!58731))

(assert (=> bs!2815 m!58801))

(assert (=> bs!2815 m!58567))

(declare-fun m!59219 () Bool)

(assert (=> bs!2815 m!59219))

(assert (=> b!64046 d!13469))

(assert (=> b!64122 d!13437))

(declare-fun d!13471 () Bool)

(declare-fun e!42246 () Bool)

(assert (=> d!13471 e!42246))

(declare-fun res!35167 () Bool)

(assert (=> d!13471 (=> (not res!35167) (not e!42246))))

(declare-fun lt!27475 () SeekEntryResult!230)

(assert (=> d!13471 (= res!35167 ((_ is Found!230) lt!27475))))

(assert (=> d!13471 (= lt!27475 (seekEntryOrOpen!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3745 newMap!16) (mask!6025 newMap!16)))))

(declare-fun lt!27476 () Unit!1757)

(declare-fun choose!348 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 64) Int) Unit!1757)

(assert (=> d!13471 (= lt!27476 (choose!348 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)))))

(assert (=> d!13471 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13471 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2109 newMap!16)) lt!27476)))

(declare-fun b!64472 () Bool)

(declare-fun res!35168 () Bool)

(assert (=> b!64472 (=> (not res!35168) (not e!42246))))

(assert (=> b!64472 (= res!35168 (inRange!0 (index!3047 lt!27475) (mask!6025 newMap!16)))))

(declare-fun b!64473 () Bool)

(assert (=> b!64473 (= e!42246 (= (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27475)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64473 (and (bvsge (index!3047 lt!27475) #b00000000000000000000000000000000) (bvslt (index!3047 lt!27475) (size!2038 (_keys!3745 newMap!16))))))

(assert (= (and d!13471 res!35167) b!64472))

(assert (= (and b!64472 res!35168) b!64473))

(assert (=> d!13471 m!58539))

(assert (=> d!13471 m!58647))

(assert (=> d!13471 m!58539))

(declare-fun m!59221 () Bool)

(assert (=> d!13471 m!59221))

(assert (=> d!13471 m!58801))

(declare-fun m!59223 () Bool)

(assert (=> b!64472 m!59223))

(declare-fun m!59225 () Bool)

(assert (=> b!64473 m!59225))

(assert (=> bm!5118 d!13471))

(declare-fun d!13473 () Bool)

(assert (=> d!13473 (= (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64182 d!13473))

(declare-fun b!64474 () Bool)

(declare-fun e!42248 () Bool)

(declare-fun e!42255 () Bool)

(assert (=> b!64474 (= e!42248 e!42255)))

(declare-fun c!8814 () Bool)

(assert (=> b!64474 (= c!8814 (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5205 () Bool)

(declare-fun call!5211 () ListLongMap!1379)

(assert (=> bm!5205 (= call!5211 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun b!64475 () Bool)

(declare-fun res!35177 () Bool)

(assert (=> b!64475 (=> (not res!35177) (not e!42248))))

(declare-fun e!42247 () Bool)

(assert (=> b!64475 (= res!35177 e!42247)))

(declare-fun res!35170 () Bool)

(assert (=> b!64475 (=> res!35170 e!42247)))

(declare-fun e!42249 () Bool)

(assert (=> b!64475 (= res!35170 (not e!42249))))

(declare-fun res!35172 () Bool)

(assert (=> b!64475 (=> (not res!35172) (not e!42249))))

(assert (=> b!64475 (= res!35172 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64476 () Bool)

(declare-fun e!42250 () ListLongMap!1379)

(declare-fun e!42251 () ListLongMap!1379)

(assert (=> b!64476 (= e!42250 e!42251)))

(declare-fun c!8819 () Bool)

(assert (=> b!64476 (= c!8819 (and (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5206 () Bool)

(declare-fun call!5208 () Bool)

(declare-fun lt!27488 () ListLongMap!1379)

(assert (=> bm!5206 (= call!5208 (contains!695 lt!27488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!13475 () Bool)

(assert (=> d!13475 e!42248))

(declare-fun res!35171 () Bool)

(assert (=> d!13475 (=> (not res!35171) (not e!42248))))

(assert (=> d!13475 (= res!35171 (or (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))))

(declare-fun lt!27484 () ListLongMap!1379)

(assert (=> d!13475 (= lt!27488 lt!27484)))

(declare-fun lt!27491 () Unit!1757)

(declare-fun e!42254 () Unit!1757)

(assert (=> d!13475 (= lt!27491 e!42254)))

(declare-fun c!8816 () Bool)

(declare-fun e!42259 () Bool)

(assert (=> d!13475 (= c!8816 e!42259)))

(declare-fun res!35175 () Bool)

(assert (=> d!13475 (=> (not res!35175) (not e!42259))))

(assert (=> d!13475 (= res!35175 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13475 (= lt!27484 e!42250)))

(declare-fun c!8815 () Bool)

(assert (=> d!13475 (= c!8815 (and (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13475 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13475 (= (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) lt!27488)))

(declare-fun b!64477 () Bool)

(declare-fun lt!27498 () Unit!1757)

(assert (=> b!64477 (= e!42254 lt!27498)))

(declare-fun lt!27483 () ListLongMap!1379)

(assert (=> b!64477 (= lt!27483 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27495 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27497 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27497 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27477 () Unit!1757)

(assert (=> b!64477 (= lt!27477 (addStillContains!45 lt!27483 lt!27495 (zeroValue!2019 newMap!16) lt!27497))))

(assert (=> b!64477 (contains!695 (+!84 lt!27483 (tuple2!2051 lt!27495 (zeroValue!2019 newMap!16))) lt!27497)))

(declare-fun lt!27487 () Unit!1757)

(assert (=> b!64477 (= lt!27487 lt!27477)))

(declare-fun lt!27492 () ListLongMap!1379)

(assert (=> b!64477 (= lt!27492 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27485 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27481 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27481 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27493 () Unit!1757)

(assert (=> b!64477 (= lt!27493 (addApplyDifferent!45 lt!27492 lt!27485 (minValue!2019 newMap!16) lt!27481))))

(assert (=> b!64477 (= (apply!69 (+!84 lt!27492 (tuple2!2051 lt!27485 (minValue!2019 newMap!16))) lt!27481) (apply!69 lt!27492 lt!27481))))

(declare-fun lt!27496 () Unit!1757)

(assert (=> b!64477 (= lt!27496 lt!27493)))

(declare-fun lt!27479 () ListLongMap!1379)

(assert (=> b!64477 (= lt!27479 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27490 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27480 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27480 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27489 () Unit!1757)

(assert (=> b!64477 (= lt!27489 (addApplyDifferent!45 lt!27479 lt!27490 (zeroValue!2019 newMap!16) lt!27480))))

(assert (=> b!64477 (= (apply!69 (+!84 lt!27479 (tuple2!2051 lt!27490 (zeroValue!2019 newMap!16))) lt!27480) (apply!69 lt!27479 lt!27480))))

(declare-fun lt!27478 () Unit!1757)

(assert (=> b!64477 (= lt!27478 lt!27489)))

(declare-fun lt!27482 () ListLongMap!1379)

(assert (=> b!64477 (= lt!27482 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27486 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27486 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27494 () (_ BitVec 64))

(assert (=> b!64477 (= lt!27494 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64477 (= lt!27498 (addApplyDifferent!45 lt!27482 lt!27486 (minValue!2019 newMap!16) lt!27494))))

(assert (=> b!64477 (= (apply!69 (+!84 lt!27482 (tuple2!2051 lt!27486 (minValue!2019 newMap!16))) lt!27494) (apply!69 lt!27482 lt!27494))))

(declare-fun bm!5207 () Bool)

(declare-fun call!5212 () ListLongMap!1379)

(declare-fun call!5213 () ListLongMap!1379)

(assert (=> bm!5207 (= call!5212 call!5213)))

(declare-fun bm!5208 () Bool)

(declare-fun call!5210 () ListLongMap!1379)

(assert (=> bm!5208 (= call!5210 (+!84 (ite c!8815 call!5211 (ite c!8819 call!5213 call!5212)) (ite (or c!8815 c!8819) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 newMap!16)) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 newMap!16)))))))

(declare-fun bm!5209 () Bool)

(assert (=> bm!5209 (= call!5213 call!5211)))

(declare-fun b!64478 () Bool)

(declare-fun Unit!1780 () Unit!1757)

(assert (=> b!64478 (= e!42254 Unit!1780)))

(declare-fun b!64479 () Bool)

(assert (=> b!64479 (= e!42249 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5210 () Bool)

(declare-fun call!5214 () ListLongMap!1379)

(assert (=> bm!5210 (= call!5214 call!5210)))

(declare-fun b!64480 () Bool)

(declare-fun call!5209 () Bool)

(assert (=> b!64480 (= e!42255 (not call!5209))))

(declare-fun b!64481 () Bool)

(declare-fun e!42258 () ListLongMap!1379)

(assert (=> b!64481 (= e!42258 call!5212)))

(declare-fun b!64482 () Bool)

(assert (=> b!64482 (= e!42250 (+!84 call!5210 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 newMap!16))))))

(declare-fun b!64483 () Bool)

(declare-fun e!42253 () Bool)

(declare-fun e!42257 () Bool)

(assert (=> b!64483 (= e!42253 e!42257)))

(declare-fun res!35173 () Bool)

(assert (=> b!64483 (= res!35173 call!5208)))

(assert (=> b!64483 (=> (not res!35173) (not e!42257))))

(declare-fun b!64484 () Bool)

(assert (=> b!64484 (= e!42251 call!5214)))

(declare-fun b!64485 () Bool)

(declare-fun e!42252 () Bool)

(assert (=> b!64485 (= e!42252 (= (apply!69 lt!27488 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)) (get!1090 (select (arr!1806 (_values!2092 newMap!16)) #b00000000000000000000000000000000) (dynLambda!311 (defaultEntry!2109 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2039 (_values!2092 newMap!16))))))

(assert (=> b!64485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64486 () Bool)

(declare-fun e!42256 () Bool)

(assert (=> b!64486 (= e!42255 e!42256)))

(declare-fun res!35174 () Bool)

(assert (=> b!64486 (= res!35174 call!5209)))

(assert (=> b!64486 (=> (not res!35174) (not e!42256))))

(declare-fun b!64487 () Bool)

(assert (=> b!64487 (= e!42256 (= (apply!69 lt!27488 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2019 newMap!16)))))

(declare-fun bm!5211 () Bool)

(assert (=> bm!5211 (= call!5209 (contains!695 lt!27488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64488 () Bool)

(assert (=> b!64488 (= e!42259 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64489 () Bool)

(assert (=> b!64489 (= e!42247 e!42252)))

(declare-fun res!35169 () Bool)

(assert (=> b!64489 (=> (not res!35169) (not e!42252))))

(assert (=> b!64489 (= res!35169 (contains!695 lt!27488 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64490 () Bool)

(assert (=> b!64490 (= e!42257 (= (apply!69 lt!27488 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2019 newMap!16)))))

(declare-fun b!64491 () Bool)

(declare-fun res!35176 () Bool)

(assert (=> b!64491 (=> (not res!35176) (not e!42248))))

(assert (=> b!64491 (= res!35176 e!42253)))

(declare-fun c!8817 () Bool)

(assert (=> b!64491 (= c!8817 (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64492 () Bool)

(assert (=> b!64492 (= e!42253 (not call!5208))))

(declare-fun b!64493 () Bool)

(declare-fun c!8818 () Bool)

(assert (=> b!64493 (= c!8818 (and (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!64493 (= e!42251 e!42258)))

(declare-fun b!64494 () Bool)

(assert (=> b!64494 (= e!42258 call!5214)))

(assert (= (and d!13475 c!8815) b!64482))

(assert (= (and d!13475 (not c!8815)) b!64476))

(assert (= (and b!64476 c!8819) b!64484))

(assert (= (and b!64476 (not c!8819)) b!64493))

(assert (= (and b!64493 c!8818) b!64494))

(assert (= (and b!64493 (not c!8818)) b!64481))

(assert (= (or b!64494 b!64481) bm!5207))

(assert (= (or b!64484 bm!5207) bm!5209))

(assert (= (or b!64484 b!64494) bm!5210))

(assert (= (or b!64482 bm!5209) bm!5205))

(assert (= (or b!64482 bm!5210) bm!5208))

(assert (= (and d!13475 res!35175) b!64488))

(assert (= (and d!13475 c!8816) b!64477))

(assert (= (and d!13475 (not c!8816)) b!64478))

(assert (= (and d!13475 res!35171) b!64475))

(assert (= (and b!64475 res!35172) b!64479))

(assert (= (and b!64475 (not res!35170)) b!64489))

(assert (= (and b!64489 res!35169) b!64485))

(assert (= (and b!64475 res!35177) b!64491))

(assert (= (and b!64491 c!8817) b!64483))

(assert (= (and b!64491 (not c!8817)) b!64492))

(assert (= (and b!64483 res!35173) b!64490))

(assert (= (or b!64483 b!64492) bm!5206))

(assert (= (and b!64491 res!35176) b!64474))

(assert (= (and b!64474 c!8814) b!64486))

(assert (= (and b!64474 (not c!8814)) b!64480))

(assert (= (and b!64486 res!35174) b!64487))

(assert (= (or b!64486 b!64480) bm!5211))

(declare-fun b_lambda!2893 () Bool)

(assert (=> (not b_lambda!2893) (not b!64485)))

(assert (=> b!64485 t!4866))

(declare-fun b_and!3955 () Bool)

(assert (= b_and!3951 (and (=> t!4866 result!2487) b_and!3955)))

(assert (=> b!64485 t!4868))

(declare-fun b_and!3957 () Bool)

(assert (= b_and!3953 (and (=> t!4868 result!2489) b_and!3957)))

(assert (=> d!13475 m!58801))

(assert (=> b!64485 m!58935))

(assert (=> b!64485 m!58951))

(assert (=> b!64485 m!58953))

(assert (=> b!64485 m!58935))

(declare-fun m!59227 () Bool)

(assert (=> b!64485 m!59227))

(assert (=> b!64485 m!58953))

(assert (=> b!64485 m!58951))

(assert (=> b!64485 m!58957))

(declare-fun m!59229 () Bool)

(assert (=> bm!5205 m!59229))

(declare-fun m!59231 () Bool)

(assert (=> bm!5211 m!59231))

(assert (=> b!64489 m!58935))

(assert (=> b!64489 m!58935))

(declare-fun m!59233 () Bool)

(assert (=> b!64489 m!59233))

(assert (=> b!64477 m!59229))

(declare-fun m!59235 () Bool)

(assert (=> b!64477 m!59235))

(declare-fun m!59237 () Bool)

(assert (=> b!64477 m!59237))

(assert (=> b!64477 m!58935))

(declare-fun m!59239 () Bool)

(assert (=> b!64477 m!59239))

(declare-fun m!59241 () Bool)

(assert (=> b!64477 m!59241))

(declare-fun m!59243 () Bool)

(assert (=> b!64477 m!59243))

(declare-fun m!59245 () Bool)

(assert (=> b!64477 m!59245))

(declare-fun m!59247 () Bool)

(assert (=> b!64477 m!59247))

(declare-fun m!59249 () Bool)

(assert (=> b!64477 m!59249))

(declare-fun m!59251 () Bool)

(assert (=> b!64477 m!59251))

(declare-fun m!59253 () Bool)

(assert (=> b!64477 m!59253))

(assert (=> b!64477 m!59247))

(assert (=> b!64477 m!59251))

(declare-fun m!59255 () Bool)

(assert (=> b!64477 m!59255))

(declare-fun m!59257 () Bool)

(assert (=> b!64477 m!59257))

(declare-fun m!59259 () Bool)

(assert (=> b!64477 m!59259))

(assert (=> b!64477 m!59241))

(declare-fun m!59261 () Bool)

(assert (=> b!64477 m!59261))

(assert (=> b!64477 m!59237))

(declare-fun m!59263 () Bool)

(assert (=> b!64477 m!59263))

(declare-fun m!59265 () Bool)

(assert (=> bm!5206 m!59265))

(declare-fun m!59267 () Bool)

(assert (=> b!64482 m!59267))

(declare-fun m!59269 () Bool)

(assert (=> b!64487 m!59269))

(assert (=> b!64488 m!58935))

(assert (=> b!64488 m!58935))

(assert (=> b!64488 m!59001))

(declare-fun m!59271 () Bool)

(assert (=> b!64490 m!59271))

(declare-fun m!59273 () Bool)

(assert (=> bm!5208 m!59273))

(assert (=> b!64479 m!58935))

(assert (=> b!64479 m!58935))

(assert (=> b!64479 m!59001))

(assert (=> d!13379 d!13475))

(declare-fun d!13477 () Bool)

(assert (=> d!13477 (= (+!84 (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) lt!27131 (zeroValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27501 () Unit!1757)

(declare-fun choose!349 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 V!2875 Int) Unit!1757)

(assert (=> d!13477 (= lt!27501 (choose!349 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) lt!27131 (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2109 newMap!16)))))

(assert (=> d!13477 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13477 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) lt!27131 (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2109 newMap!16)) lt!27501)))

(declare-fun bs!2816 () Bool)

(assert (= bs!2816 d!13477))

(assert (=> bs!2816 m!58567))

(declare-fun m!59275 () Bool)

(assert (=> bs!2816 m!59275))

(assert (=> bs!2816 m!58731))

(declare-fun m!59277 () Bool)

(assert (=> bs!2816 m!59277))

(assert (=> bs!2816 m!58731))

(assert (=> bs!2816 m!58801))

(assert (=> bs!2816 m!58567))

(declare-fun m!59279 () Bool)

(assert (=> bs!2816 m!59279))

(assert (=> b!64063 d!13477))

(declare-fun d!13479 () Bool)

(declare-fun res!35178 () Bool)

(declare-fun e!42260 () Bool)

(assert (=> d!13479 (=> (not res!35178) (not e!42260))))

(assert (=> d!13479 (= res!35178 (simpleValid!45 (_2!1037 lt!27129)))))

(assert (=> d!13479 (= (valid!265 (_2!1037 lt!27129)) e!42260)))

(declare-fun b!64495 () Bool)

(declare-fun res!35179 () Bool)

(assert (=> b!64495 (=> (not res!35179) (not e!42260))))

(assert (=> b!64495 (= res!35179 (= (arrayCountValidKeys!0 (_keys!3745 (_2!1037 lt!27129)) #b00000000000000000000000000000000 (size!2038 (_keys!3745 (_2!1037 lt!27129)))) (_size!370 (_2!1037 lt!27129))))))

(declare-fun b!64496 () Bool)

(declare-fun res!35180 () Bool)

(assert (=> b!64496 (=> (not res!35180) (not e!42260))))

(assert (=> b!64496 (= res!35180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3745 (_2!1037 lt!27129)) (mask!6025 (_2!1037 lt!27129))))))

(declare-fun b!64497 () Bool)

(assert (=> b!64497 (= e!42260 (arrayNoDuplicates!0 (_keys!3745 (_2!1037 lt!27129)) #b00000000000000000000000000000000 Nil!1442))))

(assert (= (and d!13479 res!35178) b!64495))

(assert (= (and b!64495 res!35179) b!64496))

(assert (= (and b!64496 res!35180) b!64497))

(declare-fun m!59281 () Bool)

(assert (=> d!13479 m!59281))

(declare-fun m!59283 () Bool)

(assert (=> b!64495 m!59283))

(declare-fun m!59285 () Bool)

(assert (=> b!64496 m!59285))

(declare-fun m!59287 () Bool)

(assert (=> b!64497 m!59287))

(assert (=> d!13349 d!13479))

(assert (=> d!13349 d!13377))

(declare-fun d!13481 () Bool)

(declare-fun res!35181 () Bool)

(declare-fun e!42261 () Bool)

(assert (=> d!13481 (=> res!35181 e!42261)))

(assert (=> d!13481 (= res!35181 (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13481 (= (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!42261)))

(declare-fun b!64498 () Bool)

(declare-fun e!42262 () Bool)

(assert (=> b!64498 (= e!42261 e!42262)))

(declare-fun res!35182 () Bool)

(assert (=> b!64498 (=> (not res!35182) (not e!42262))))

(assert (=> b!64498 (= res!35182 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64499 () Bool)

(assert (=> b!64499 (= e!42262 (arrayContainsKey!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!13481 (not res!35181)) b!64498))

(assert (= (and b!64498 res!35182) b!64499))

(declare-fun m!59289 () Bool)

(assert (=> d!13481 m!59289))

(assert (=> b!64499 m!58539))

(declare-fun m!59291 () Bool)

(assert (=> b!64499 m!59291))

(assert (=> b!64104 d!13481))

(declare-fun d!13483 () Bool)

(assert (=> d!13483 (= (get!1092 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64086 d!13483))

(declare-fun b!64500 () Bool)

(declare-fun e!42266 () Bool)

(declare-fun call!5215 () Bool)

(assert (=> b!64500 (= e!42266 call!5215)))

(declare-fun b!64501 () Bool)

(declare-fun e!42264 () Bool)

(declare-fun e!42263 () Bool)

(assert (=> b!64501 (= e!42264 e!42263)))

(declare-fun res!35185 () Bool)

(assert (=> b!64501 (=> (not res!35185) (not e!42263))))

(declare-fun e!42265 () Bool)

(assert (=> b!64501 (= res!35185 (not e!42265))))

(declare-fun res!35183 () Bool)

(assert (=> b!64501 (=> (not res!35183) (not e!42265))))

(assert (=> b!64501 (= res!35183 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!64502 () Bool)

(assert (=> b!64502 (= e!42265 (contains!696 (ite c!8730 (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442) Nil!1442) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!64503 () Bool)

(assert (=> b!64503 (= e!42266 call!5215)))

(declare-fun d!13485 () Bool)

(declare-fun res!35184 () Bool)

(assert (=> d!13485 (=> res!35184 e!42264)))

(assert (=> d!13485 (= res!35184 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13485 (= (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8730 (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442) Nil!1442)) e!42264)))

(declare-fun b!64504 () Bool)

(assert (=> b!64504 (= e!42263 e!42266)))

(declare-fun c!8820 () Bool)

(assert (=> b!64504 (= c!8820 (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!5212 () Bool)

(assert (=> bm!5212 (= call!5215 (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8820 (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!8730 (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442) Nil!1442)) (ite c!8730 (Cons!1441 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1442) Nil!1442))))))

(assert (= (and d!13485 (not res!35184)) b!64501))

(assert (= (and b!64501 res!35183) b!64502))

(assert (= (and b!64501 res!35185) b!64504))

(assert (= (and b!64504 c!8820) b!64503))

(assert (= (and b!64504 (not c!8820)) b!64500))

(assert (= (or b!64503 b!64500) bm!5212))

(declare-fun m!59293 () Bool)

(assert (=> b!64501 m!59293))

(assert (=> b!64501 m!59293))

(declare-fun m!59295 () Bool)

(assert (=> b!64501 m!59295))

(assert (=> b!64502 m!59293))

(assert (=> b!64502 m!59293))

(declare-fun m!59297 () Bool)

(assert (=> b!64502 m!59297))

(assert (=> b!64504 m!59293))

(assert (=> b!64504 m!59293))

(assert (=> b!64504 m!59295))

(assert (=> bm!5212 m!59293))

(declare-fun m!59299 () Bool)

(assert (=> bm!5212 m!59299))

(assert (=> bm!5146 d!13485))

(declare-fun d!13487 () Bool)

(assert (=> d!13487 (= (apply!69 lt!27208 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1093 (getValueByKey!127 (toList!705 lt!27208) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2817 () Bool)

(assert (= bs!2817 d!13487))

(assert (=> bs!2817 m!58711))

(assert (=> bs!2817 m!59125))

(assert (=> bs!2817 m!59125))

(declare-fun m!59301 () Bool)

(assert (=> bs!2817 m!59301))

(assert (=> b!64188 d!13487))

(declare-fun d!13489 () Bool)

(declare-fun c!8821 () Bool)

(assert (=> d!13489 (= c!8821 ((_ is ValueCellFull!867) (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!42267 () V!2875)

(assert (=> d!13489 (= (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42267)))

(declare-fun b!64505 () Bool)

(assert (=> b!64505 (= e!42267 (get!1091 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64506 () Bool)

(assert (=> b!64506 (= e!42267 (get!1092 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13489 c!8821) b!64505))

(assert (= (and d!13489 (not c!8821)) b!64506))

(assert (=> b!64505 m!58733))

(assert (=> b!64505 m!58565))

(declare-fun m!59303 () Bool)

(assert (=> b!64505 m!59303))

(assert (=> b!64506 m!58733))

(assert (=> b!64506 m!58565))

(declare-fun m!59305 () Bool)

(assert (=> b!64506 m!59305))

(assert (=> b!64188 d!13489))

(declare-fun d!13491 () Bool)

(declare-fun res!35186 () Bool)

(declare-fun e!42268 () Bool)

(assert (=> d!13491 (=> (not res!35186) (not e!42268))))

(assert (=> d!13491 (= res!35186 (simpleValid!45 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13491 (= (valid!265 (v!2435 (underlying!236 thiss!992))) e!42268)))

(declare-fun b!64507 () Bool)

(declare-fun res!35187 () Bool)

(assert (=> b!64507 (=> (not res!35187) (not e!42268))))

(assert (=> b!64507 (= res!35187 (= (arrayCountValidKeys!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 (size!2038 (_keys!3745 (v!2435 (underlying!236 thiss!992))))) (_size!370 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64508 () Bool)

(declare-fun res!35188 () Bool)

(assert (=> b!64508 (=> (not res!35188) (not e!42268))))

(assert (=> b!64508 (= res!35188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3745 (v!2435 (underlying!236 thiss!992))) (mask!6025 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64509 () Bool)

(assert (=> b!64509 (= e!42268 (arrayNoDuplicates!0 (_keys!3745 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 Nil!1442))))

(assert (= (and d!13491 res!35186) b!64507))

(assert (= (and b!64507 res!35187) b!64508))

(assert (= (and b!64508 res!35188) b!64509))

(declare-fun m!59307 () Bool)

(assert (=> d!13491 m!59307))

(declare-fun m!59309 () Bool)

(assert (=> b!64507 m!59309))

(assert (=> b!64508 m!58557))

(declare-fun m!59311 () Bool)

(assert (=> b!64509 m!59311))

(assert (=> d!13355 d!13491))

(declare-fun d!13493 () Bool)

(assert (=> d!13493 (= (apply!69 lt!27208 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1093 (getValueByKey!127 (toList!705 lt!27208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2818 () Bool)

(assert (= bs!2818 d!13493))

(assert (=> bs!2818 m!59059))

(assert (=> bs!2818 m!59059))

(declare-fun m!59313 () Bool)

(assert (=> bs!2818 m!59313))

(assert (=> b!64190 d!13493))

(declare-fun d!13495 () Bool)

(assert (=> d!13495 (= (inRange!0 (ite c!8717 (ite c!8709 (index!3047 lt!27134) (ite c!8707 (index!3046 lt!27117) (index!3049 lt!27117))) (ite c!8711 (index!3047 lt!27110) (ite c!8710 (index!3046 lt!27130) (index!3049 lt!27130)))) (mask!6025 newMap!16)) (and (bvsge (ite c!8717 (ite c!8709 (index!3047 lt!27134) (ite c!8707 (index!3046 lt!27117) (index!3049 lt!27117))) (ite c!8711 (index!3047 lt!27110) (ite c!8710 (index!3046 lt!27130) (index!3049 lt!27130)))) #b00000000000000000000000000000000) (bvslt (ite c!8717 (ite c!8709 (index!3047 lt!27134) (ite c!8707 (index!3046 lt!27117) (index!3049 lt!27117))) (ite c!8711 (index!3047 lt!27110) (ite c!8710 (index!3046 lt!27130) (index!3049 lt!27130)))) (bvadd (mask!6025 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!5124 d!13495))

(assert (=> bm!5137 d!13383))

(declare-fun b!64518 () Bool)

(declare-fun e!42273 () (_ BitVec 32))

(assert (=> b!64518 (= e!42273 #b00000000000000000000000000000000)))

(declare-fun b!64519 () Bool)

(declare-fun e!42274 () (_ BitVec 32))

(declare-fun call!5218 () (_ BitVec 32))

(assert (=> b!64519 (= e!42274 call!5218)))

(declare-fun b!64520 () Bool)

(assert (=> b!64520 (= e!42273 e!42274)))

(declare-fun c!8826 () Bool)

(assert (=> b!64520 (= c!8826 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64521 () Bool)

(assert (=> b!64521 (= e!42274 (bvadd #b00000000000000000000000000000001 call!5218))))

(declare-fun bm!5215 () Bool)

(assert (=> bm!5215 (= call!5218 (arrayCountValidKeys!0 (_keys!3745 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2038 (_keys!3745 newMap!16))))))

(declare-fun d!13497 () Bool)

(declare-fun lt!27504 () (_ BitVec 32))

(assert (=> d!13497 (and (bvsge lt!27504 #b00000000000000000000000000000000) (bvsle lt!27504 (bvsub (size!2038 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!13497 (= lt!27504 e!42273)))

(declare-fun c!8827 () Bool)

(assert (=> d!13497 (= c!8827 (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13497 (and (bvsle #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2038 (_keys!3745 newMap!16)) (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13497 (= (arrayCountValidKeys!0 (_keys!3745 newMap!16) #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) lt!27504)))

(assert (= (and d!13497 c!8827) b!64518))

(assert (= (and d!13497 (not c!8827)) b!64520))

(assert (= (and b!64520 c!8826) b!64521))

(assert (= (and b!64520 (not c!8826)) b!64519))

(assert (= (or b!64521 b!64519) bm!5215))

(assert (=> b!64520 m!58935))

(assert (=> b!64520 m!58935))

(assert (=> b!64520 m!59001))

(declare-fun m!59315 () Bool)

(assert (=> bm!5215 m!59315))

(assert (=> b!64132 d!13497))

(declare-fun d!13499 () Bool)

(declare-fun e!42275 () Bool)

(assert (=> d!13499 e!42275))

(declare-fun res!35189 () Bool)

(assert (=> d!13499 (=> (not res!35189) (not e!42275))))

(declare-fun lt!27507 () ListLongMap!1379)

(assert (=> d!13499 (= res!35189 (contains!695 lt!27507 (_1!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!27505 () List!1444)

(assert (=> d!13499 (= lt!27507 (ListLongMap!1380 lt!27505))))

(declare-fun lt!27506 () Unit!1757)

(declare-fun lt!27508 () Unit!1757)

(assert (=> d!13499 (= lt!27506 lt!27508)))

(assert (=> d!13499 (= (getValueByKey!127 lt!27505 (_1!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!132 (_2!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13499 (= lt!27508 (lemmaContainsTupThenGetReturnValue!44 lt!27505 (_1!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13499 (= lt!27505 (insertStrictlySorted!47 (toList!705 (ite c!8714 (ite c!8708 call!5131 call!5129) call!5134)) (_1!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13499 (= (+!84 (ite c!8714 (ite c!8708 call!5131 call!5129) call!5134) (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!27507)))

(declare-fun b!64522 () Bool)

(declare-fun res!35190 () Bool)

(assert (=> b!64522 (=> (not res!35190) (not e!42275))))

(assert (=> b!64522 (= res!35190 (= (getValueByKey!127 (toList!705 lt!27507) (_1!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!132 (_2!1036 (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!64523 () Bool)

(assert (=> b!64523 (= e!42275 (contains!697 (toList!705 lt!27507) (ite c!8714 (ite c!8708 (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!13499 res!35189) b!64522))

(assert (= (and b!64522 res!35190) b!64523))

(declare-fun m!59317 () Bool)

(assert (=> d!13499 m!59317))

(declare-fun m!59319 () Bool)

(assert (=> d!13499 m!59319))

(declare-fun m!59321 () Bool)

(assert (=> d!13499 m!59321))

(declare-fun m!59323 () Bool)

(assert (=> d!13499 m!59323))

(declare-fun m!59325 () Bool)

(assert (=> b!64522 m!59325))

(declare-fun m!59327 () Bool)

(assert (=> b!64523 m!59327))

(assert (=> bm!5120 d!13499))

(assert (=> b!64191 d!13473))

(declare-fun d!13501 () Bool)

(declare-fun e!42278 () Bool)

(assert (=> d!13501 e!42278))

(declare-fun res!35193 () Bool)

(assert (=> d!13501 (=> (not res!35193) (not e!42278))))

(assert (=> d!13501 (= res!35193 (and (bvsge (index!3047 lt!27123) #b00000000000000000000000000000000) (bvslt (index!3047 lt!27123) (size!2038 (_keys!3745 newMap!16)))))))

(declare-fun lt!27511 () Unit!1757)

(declare-fun choose!350 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 32) Int) Unit!1757)

(assert (=> d!13501 (= lt!27511 (choose!350 (_keys!3745 newMap!16) lt!27114 (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (index!3047 lt!27123) (defaultEntry!2109 newMap!16)))))

(assert (=> d!13501 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13501 (= (lemmaValidKeyInArrayIsInListMap!79 (_keys!3745 newMap!16) lt!27114 (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (index!3047 lt!27123) (defaultEntry!2109 newMap!16)) lt!27511)))

(declare-fun b!64526 () Bool)

(assert (=> b!64526 (= e!42278 (contains!695 (getCurrentListMap!407 (_keys!3745 newMap!16) lt!27114 (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (select (arr!1805 (_keys!3745 newMap!16)) (index!3047 lt!27123))))))

(assert (= (and d!13501 res!35193) b!64526))

(declare-fun m!59329 () Bool)

(assert (=> d!13501 m!59329))

(assert (=> d!13501 m!58801))

(declare-fun m!59331 () Bool)

(assert (=> b!64526 m!59331))

(assert (=> b!64526 m!58633))

(assert (=> b!64526 m!59331))

(assert (=> b!64526 m!58633))

(declare-fun m!59333 () Bool)

(assert (=> b!64526 m!59333))

(assert (=> b!64071 d!13501))

(declare-fun b!64527 () Bool)

(declare-fun e!42280 () Bool)

(declare-fun e!42287 () Bool)

(assert (=> b!64527 (= e!42280 e!42287)))

(declare-fun c!8828 () Bool)

(assert (=> b!64527 (= c!8828 (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!5222 () ListLongMap!1379)

(declare-fun bm!5216 () Bool)

(assert (=> bm!5216 (= call!5222 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun b!64528 () Bool)

(declare-fun res!35202 () Bool)

(assert (=> b!64528 (=> (not res!35202) (not e!42280))))

(declare-fun e!42279 () Bool)

(assert (=> b!64528 (= res!35202 e!42279)))

(declare-fun res!35195 () Bool)

(assert (=> b!64528 (=> res!35195 e!42279)))

(declare-fun e!42281 () Bool)

(assert (=> b!64528 (= res!35195 (not e!42281))))

(declare-fun res!35197 () Bool)

(assert (=> b!64528 (=> (not res!35197) (not e!42281))))

(assert (=> b!64528 (= res!35197 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64529 () Bool)

(declare-fun e!42282 () ListLongMap!1379)

(declare-fun e!42283 () ListLongMap!1379)

(assert (=> b!64529 (= e!42282 e!42283)))

(declare-fun c!8833 () Bool)

(assert (=> b!64529 (= c!8833 (and (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5217 () Bool)

(declare-fun call!5219 () Bool)

(declare-fun lt!27523 () ListLongMap!1379)

(assert (=> bm!5217 (= call!5219 (contains!695 lt!27523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!13503 () Bool)

(assert (=> d!13503 e!42280))

(declare-fun res!35196 () Bool)

(assert (=> d!13503 (=> (not res!35196) (not e!42280))))

(assert (=> d!13503 (= res!35196 (or (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))))

(declare-fun lt!27519 () ListLongMap!1379)

(assert (=> d!13503 (= lt!27523 lt!27519)))

(declare-fun lt!27526 () Unit!1757)

(declare-fun e!42286 () Unit!1757)

(assert (=> d!13503 (= lt!27526 e!42286)))

(declare-fun c!8830 () Bool)

(declare-fun e!42291 () Bool)

(assert (=> d!13503 (= c!8830 e!42291)))

(declare-fun res!35200 () Bool)

(assert (=> d!13503 (=> (not res!35200) (not e!42291))))

(assert (=> d!13503 (= res!35200 (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13503 (= lt!27519 e!42282)))

(declare-fun c!8829 () Bool)

(assert (=> d!13503 (= c!8829 (and (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13503 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13503 (= (getCurrentListMap!407 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) lt!27523)))

(declare-fun b!64530 () Bool)

(declare-fun lt!27533 () Unit!1757)

(assert (=> b!64530 (= e!42286 lt!27533)))

(declare-fun lt!27518 () ListLongMap!1379)

(assert (=> b!64530 (= lt!27518 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27530 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27532 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27532 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27512 () Unit!1757)

(assert (=> b!64530 (= lt!27512 (addStillContains!45 lt!27518 lt!27530 (zeroValue!2019 newMap!16) lt!27532))))

(assert (=> b!64530 (contains!695 (+!84 lt!27518 (tuple2!2051 lt!27530 (zeroValue!2019 newMap!16))) lt!27532)))

(declare-fun lt!27522 () Unit!1757)

(assert (=> b!64530 (= lt!27522 lt!27512)))

(declare-fun lt!27527 () ListLongMap!1379)

(assert (=> b!64530 (= lt!27527 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27520 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27520 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27516 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27516 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27528 () Unit!1757)

(assert (=> b!64530 (= lt!27528 (addApplyDifferent!45 lt!27527 lt!27520 (minValue!2019 newMap!16) lt!27516))))

(assert (=> b!64530 (= (apply!69 (+!84 lt!27527 (tuple2!2051 lt!27520 (minValue!2019 newMap!16))) lt!27516) (apply!69 lt!27527 lt!27516))))

(declare-fun lt!27531 () Unit!1757)

(assert (=> b!64530 (= lt!27531 lt!27528)))

(declare-fun lt!27514 () ListLongMap!1379)

(assert (=> b!64530 (= lt!27514 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27525 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27515 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27515 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27524 () Unit!1757)

(assert (=> b!64530 (= lt!27524 (addApplyDifferent!45 lt!27514 lt!27525 (zeroValue!2019 newMap!16) lt!27515))))

(assert (=> b!64530 (= (apply!69 (+!84 lt!27514 (tuple2!2051 lt!27525 (zeroValue!2019 newMap!16))) lt!27515) (apply!69 lt!27514 lt!27515))))

(declare-fun lt!27513 () Unit!1757)

(assert (=> b!64530 (= lt!27513 lt!27524)))

(declare-fun lt!27517 () ListLongMap!1379)

(assert (=> b!64530 (= lt!27517 (getCurrentListMapNoExtraKeys!47 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)))))

(declare-fun lt!27521 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27529 () (_ BitVec 64))

(assert (=> b!64530 (= lt!27529 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64530 (= lt!27533 (addApplyDifferent!45 lt!27517 lt!27521 (minValue!2019 newMap!16) lt!27529))))

(assert (=> b!64530 (= (apply!69 (+!84 lt!27517 (tuple2!2051 lt!27521 (minValue!2019 newMap!16))) lt!27529) (apply!69 lt!27517 lt!27529))))

(declare-fun bm!5218 () Bool)

(declare-fun call!5223 () ListLongMap!1379)

(declare-fun call!5224 () ListLongMap!1379)

(assert (=> bm!5218 (= call!5223 call!5224)))

(declare-fun call!5221 () ListLongMap!1379)

(declare-fun bm!5219 () Bool)

(assert (=> bm!5219 (= call!5221 (+!84 (ite c!8829 call!5222 (ite c!8833 call!5224 call!5223)) (ite (or c!8829 c!8833) (tuple2!2051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2019 newMap!16)) (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 newMap!16)))))))

(declare-fun bm!5220 () Bool)

(assert (=> bm!5220 (= call!5224 call!5222)))

(declare-fun b!64531 () Bool)

(declare-fun Unit!1781 () Unit!1757)

(assert (=> b!64531 (= e!42286 Unit!1781)))

(declare-fun b!64532 () Bool)

(assert (=> b!64532 (= e!42281 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5221 () Bool)

(declare-fun call!5225 () ListLongMap!1379)

(assert (=> bm!5221 (= call!5225 call!5221)))

(declare-fun b!64533 () Bool)

(declare-fun call!5220 () Bool)

(assert (=> b!64533 (= e!42287 (not call!5220))))

(declare-fun b!64534 () Bool)

(declare-fun e!42290 () ListLongMap!1379)

(assert (=> b!64534 (= e!42290 call!5223)))

(declare-fun b!64535 () Bool)

(assert (=> b!64535 (= e!42282 (+!84 call!5221 (tuple2!2051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2019 newMap!16))))))

(declare-fun b!64536 () Bool)

(declare-fun e!42285 () Bool)

(declare-fun e!42289 () Bool)

(assert (=> b!64536 (= e!42285 e!42289)))

(declare-fun res!35198 () Bool)

(assert (=> b!64536 (= res!35198 call!5219)))

(assert (=> b!64536 (=> (not res!35198) (not e!42289))))

(declare-fun b!64537 () Bool)

(assert (=> b!64537 (= e!42283 call!5225)))

(declare-fun b!64538 () Bool)

(declare-fun e!42284 () Bool)

(assert (=> b!64538 (= e!42284 (= (apply!69 lt!27523 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)) (get!1090 (select (arr!1806 (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!311 (defaultEntry!2109 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2039 (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))))))))

(assert (=> b!64538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64539 () Bool)

(declare-fun e!42288 () Bool)

(assert (=> b!64539 (= e!42287 e!42288)))

(declare-fun res!35199 () Bool)

(assert (=> b!64539 (= res!35199 call!5220)))

(assert (=> b!64539 (=> (not res!35199) (not e!42288))))

(declare-fun b!64540 () Bool)

(assert (=> b!64540 (= e!42288 (= (apply!69 lt!27523 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2019 newMap!16)))))

(declare-fun bm!5222 () Bool)

(assert (=> bm!5222 (= call!5220 (contains!695 lt!27523 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64541 () Bool)

(assert (=> b!64541 (= e!42291 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64542 () Bool)

(assert (=> b!64542 (= e!42279 e!42284)))

(declare-fun res!35194 () Bool)

(assert (=> b!64542 (=> (not res!35194) (not e!42284))))

(assert (=> b!64542 (= res!35194 (contains!695 lt!27523 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(declare-fun b!64543 () Bool)

(assert (=> b!64543 (= e!42289 (= (apply!69 lt!27523 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2019 newMap!16)))))

(declare-fun b!64544 () Bool)

(declare-fun res!35201 () Bool)

(assert (=> b!64544 (=> (not res!35201) (not e!42280))))

(assert (=> b!64544 (= res!35201 e!42285)))

(declare-fun c!8831 () Bool)

(assert (=> b!64544 (= c!8831 (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64545 () Bool)

(assert (=> b!64545 (= e!42285 (not call!5219))))

(declare-fun b!64546 () Bool)

(declare-fun c!8832 () Bool)

(assert (=> b!64546 (= c!8832 (and (not (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1984 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!64546 (= e!42283 e!42290)))

(declare-fun b!64547 () Bool)

(assert (=> b!64547 (= e!42290 call!5225)))

(assert (= (and d!13503 c!8829) b!64535))

(assert (= (and d!13503 (not c!8829)) b!64529))

(assert (= (and b!64529 c!8833) b!64537))

(assert (= (and b!64529 (not c!8833)) b!64546))

(assert (= (and b!64546 c!8832) b!64547))

(assert (= (and b!64546 (not c!8832)) b!64534))

(assert (= (or b!64547 b!64534) bm!5218))

(assert (= (or b!64537 bm!5218) bm!5220))

(assert (= (or b!64537 b!64547) bm!5221))

(assert (= (or b!64535 bm!5220) bm!5216))

(assert (= (or b!64535 bm!5221) bm!5219))

(assert (= (and d!13503 res!35200) b!64541))

(assert (= (and d!13503 c!8830) b!64530))

(assert (= (and d!13503 (not c!8830)) b!64531))

(assert (= (and d!13503 res!35196) b!64528))

(assert (= (and b!64528 res!35197) b!64532))

(assert (= (and b!64528 (not res!35195)) b!64542))

(assert (= (and b!64542 res!35194) b!64538))

(assert (= (and b!64528 res!35202) b!64544))

(assert (= (and b!64544 c!8831) b!64536))

(assert (= (and b!64544 (not c!8831)) b!64545))

(assert (= (and b!64536 res!35198) b!64543))

(assert (= (or b!64536 b!64545) bm!5217))

(assert (= (and b!64544 res!35201) b!64527))

(assert (= (and b!64527 c!8828) b!64539))

(assert (= (and b!64527 (not c!8828)) b!64533))

(assert (= (and b!64539 res!35199) b!64540))

(assert (= (or b!64539 b!64533) bm!5222))

(declare-fun b_lambda!2895 () Bool)

(assert (=> (not b_lambda!2895) (not b!64538)))

(assert (=> b!64538 t!4866))

(declare-fun b_and!3959 () Bool)

(assert (= b_and!3955 (and (=> t!4866 result!2487) b_and!3959)))

(assert (=> b!64538 t!4868))

(declare-fun b_and!3961 () Bool)

(assert (= b_and!3957 (and (=> t!4868 result!2489) b_and!3961)))

(assert (=> d!13503 m!58801))

(assert (=> b!64538 m!58935))

(assert (=> b!64538 m!58951))

(declare-fun m!59335 () Bool)

(assert (=> b!64538 m!59335))

(assert (=> b!64538 m!58935))

(declare-fun m!59337 () Bool)

(assert (=> b!64538 m!59337))

(assert (=> b!64538 m!59335))

(assert (=> b!64538 m!58951))

(declare-fun m!59339 () Bool)

(assert (=> b!64538 m!59339))

(declare-fun m!59341 () Bool)

(assert (=> bm!5216 m!59341))

(declare-fun m!59343 () Bool)

(assert (=> bm!5222 m!59343))

(assert (=> b!64542 m!58935))

(assert (=> b!64542 m!58935))

(declare-fun m!59345 () Bool)

(assert (=> b!64542 m!59345))

(assert (=> b!64530 m!59341))

(declare-fun m!59347 () Bool)

(assert (=> b!64530 m!59347))

(declare-fun m!59349 () Bool)

(assert (=> b!64530 m!59349))

(assert (=> b!64530 m!58935))

(declare-fun m!59351 () Bool)

(assert (=> b!64530 m!59351))

(declare-fun m!59353 () Bool)

(assert (=> b!64530 m!59353))

(declare-fun m!59355 () Bool)

(assert (=> b!64530 m!59355))

(declare-fun m!59357 () Bool)

(assert (=> b!64530 m!59357))

(declare-fun m!59359 () Bool)

(assert (=> b!64530 m!59359))

(declare-fun m!59361 () Bool)

(assert (=> b!64530 m!59361))

(declare-fun m!59363 () Bool)

(assert (=> b!64530 m!59363))

(declare-fun m!59365 () Bool)

(assert (=> b!64530 m!59365))

(assert (=> b!64530 m!59359))

(assert (=> b!64530 m!59363))

(declare-fun m!59367 () Bool)

(assert (=> b!64530 m!59367))

(declare-fun m!59369 () Bool)

(assert (=> b!64530 m!59369))

(declare-fun m!59371 () Bool)

(assert (=> b!64530 m!59371))

(assert (=> b!64530 m!59353))

(declare-fun m!59373 () Bool)

(assert (=> b!64530 m!59373))

(assert (=> b!64530 m!59349))

(declare-fun m!59375 () Bool)

(assert (=> b!64530 m!59375))

(declare-fun m!59377 () Bool)

(assert (=> bm!5217 m!59377))

(declare-fun m!59379 () Bool)

(assert (=> b!64535 m!59379))

(declare-fun m!59381 () Bool)

(assert (=> b!64540 m!59381))

(assert (=> b!64541 m!58935))

(assert (=> b!64541 m!58935))

(assert (=> b!64541 m!59001))

(declare-fun m!59383 () Bool)

(assert (=> b!64543 m!59383))

(declare-fun m!59385 () Bool)

(assert (=> bm!5219 m!59385))

(assert (=> b!64532 m!58935))

(assert (=> b!64532 m!58935))

(assert (=> b!64532 m!59001))

(assert (=> b!64071 d!13503))

(declare-fun d!13505 () Bool)

(declare-fun e!42294 () Bool)

(assert (=> d!13505 e!42294))

(declare-fun res!35205 () Bool)

(assert (=> d!13505 (=> (not res!35205) (not e!42294))))

(assert (=> d!13505 (= res!35205 (and (bvsge (index!3047 lt!27123) #b00000000000000000000000000000000) (bvslt (index!3047 lt!27123) (size!2039 (_values!2092 newMap!16)))))))

(declare-fun lt!27536 () Unit!1757)

(declare-fun choose!351 (array!3775 array!3777 (_ BitVec 32) (_ BitVec 32) V!2875 V!2875 (_ BitVec 32) (_ BitVec 64) V!2875 Int) Unit!1757)

(assert (=> d!13505 (= lt!27536 (choose!351 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (index!3047 lt!27123) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2109 newMap!16)))))

(assert (=> d!13505 (validMask!0 (mask!6025 newMap!16))))

(assert (=> d!13505 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) (index!3047 lt!27123) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2109 newMap!16)) lt!27536)))

(declare-fun b!64550 () Bool)

(assert (=> b!64550 (= e!42294 (= (+!84 (getCurrentListMap!407 (_keys!3745 newMap!16) (_values!2092 newMap!16) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16)) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!407 (_keys!3745 newMap!16) (array!3778 (store (arr!1806 (_values!2092 newMap!16)) (index!3047 lt!27123) (ValueCellFull!867 (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2039 (_values!2092 newMap!16))) (mask!6025 newMap!16) (extraKeys!1984 newMap!16) (zeroValue!2019 newMap!16) (minValue!2019 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2109 newMap!16))))))

(assert (= (and d!13505 res!35205) b!64550))

(assert (=> d!13505 m!58539))

(assert (=> d!13505 m!58567))

(declare-fun m!59387 () Bool)

(assert (=> d!13505 m!59387))

(assert (=> d!13505 m!58801))

(assert (=> b!64550 m!58731))

(assert (=> b!64550 m!58731))

(assert (=> b!64550 m!59101))

(assert (=> b!64550 m!58677))

(assert (=> b!64550 m!58681))

(assert (=> b!64071 d!13505))

(declare-fun d!13507 () Bool)

(declare-fun e!42296 () Bool)

(assert (=> d!13507 e!42296))

(declare-fun res!35206 () Bool)

(assert (=> d!13507 (=> res!35206 e!42296)))

(declare-fun lt!27540 () Bool)

(assert (=> d!13507 (= res!35206 (not lt!27540))))

(declare-fun lt!27539 () Bool)

(assert (=> d!13507 (= lt!27540 lt!27539)))

(declare-fun lt!27538 () Unit!1757)

(declare-fun e!42295 () Unit!1757)

(assert (=> d!13507 (= lt!27538 e!42295)))

(declare-fun c!8834 () Bool)

(assert (=> d!13507 (= c!8834 lt!27539)))

(assert (=> d!13507 (= lt!27539 (containsKey!131 (toList!705 call!5134) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13507 (= (contains!695 call!5134 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27540)))

(declare-fun b!64551 () Bool)

(declare-fun lt!27537 () Unit!1757)

(assert (=> b!64551 (= e!42295 lt!27537)))

(assert (=> b!64551 (= lt!27537 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 call!5134) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64551 (isDefined!80 (getValueByKey!127 (toList!705 call!5134) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64552 () Bool)

(declare-fun Unit!1782 () Unit!1757)

(assert (=> b!64552 (= e!42295 Unit!1782)))

(declare-fun b!64553 () Bool)

(assert (=> b!64553 (= e!42296 (isDefined!80 (getValueByKey!127 (toList!705 call!5134) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (= (and d!13507 c!8834) b!64551))

(assert (= (and d!13507 (not c!8834)) b!64552))

(assert (= (and d!13507 (not res!35206)) b!64553))

(assert (=> d!13507 m!58539))

(declare-fun m!59389 () Bool)

(assert (=> d!13507 m!59389))

(assert (=> b!64551 m!58539))

(declare-fun m!59391 () Bool)

(assert (=> b!64551 m!59391))

(assert (=> b!64551 m!58539))

(declare-fun m!59393 () Bool)

(assert (=> b!64551 m!59393))

(assert (=> b!64551 m!59393))

(declare-fun m!59395 () Bool)

(assert (=> b!64551 m!59395))

(assert (=> b!64553 m!58539))

(assert (=> b!64553 m!59393))

(assert (=> b!64553 m!59393))

(assert (=> b!64553 m!59395))

(assert (=> b!64071 d!13507))

(declare-fun d!13509 () Bool)

(assert (=> d!13509 (isDefined!80 (getValueByKey!127 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun lt!27543 () Unit!1757)

(declare-fun choose!352 (List!1444 (_ BitVec 64)) Unit!1757)

(assert (=> d!13509 (= lt!27543 (choose!352 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun e!42299 () Bool)

(assert (=> d!13509 e!42299))

(declare-fun res!35209 () Bool)

(assert (=> d!13509 (=> (not res!35209) (not e!42299))))

(declare-fun isStrictlySorted!287 (List!1444) Bool)

(assert (=> d!13509 (= res!35209 (isStrictlySorted!287 (toList!705 lt!27020)))))

(assert (=> d!13509 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27543)))

(declare-fun b!64556 () Bool)

(assert (=> b!64556 (= e!42299 (containsKey!131 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (= (and d!13509 res!35209) b!64556))

(assert (=> d!13509 m!58539))

(assert (=> d!13509 m!58629))

(assert (=> d!13509 m!58629))

(assert (=> d!13509 m!58631))

(assert (=> d!13509 m!58539))

(declare-fun m!59397 () Bool)

(assert (=> d!13509 m!59397))

(declare-fun m!59399 () Bool)

(assert (=> d!13509 m!59399))

(assert (=> b!64556 m!58539))

(assert (=> b!64556 m!58625))

(assert (=> b!63964 d!13509))

(declare-fun d!13511 () Bool)

(declare-fun isEmpty!303 (Option!133) Bool)

(assert (=> d!13511 (= (isDefined!80 (getValueByKey!127 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))) (not (isEmpty!303 (getValueByKey!127 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))))

(declare-fun bs!2819 () Bool)

(assert (= bs!2819 d!13511))

(assert (=> bs!2819 m!58629))

(declare-fun m!59401 () Bool)

(assert (=> bs!2819 m!59401))

(assert (=> b!63964 d!13511))

(declare-fun b!64568 () Bool)

(declare-fun e!42305 () Option!133)

(assert (=> b!64568 (= e!42305 None!131)))

(declare-fun b!64565 () Bool)

(declare-fun e!42304 () Option!133)

(assert (=> b!64565 (= e!42304 (Some!132 (_2!1036 (h!2024 (toList!705 lt!27020)))))))

(declare-fun d!13513 () Bool)

(declare-fun c!8839 () Bool)

(assert (=> d!13513 (= c!8839 (and ((_ is Cons!1440) (toList!705 lt!27020)) (= (_1!1036 (h!2024 (toList!705 lt!27020))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (=> d!13513 (= (getValueByKey!127 (toList!705 lt!27020) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)) e!42304)))

(declare-fun b!64567 () Bool)

(assert (=> b!64567 (= e!42305 (getValueByKey!127 (t!4858 (toList!705 lt!27020)) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64566 () Bool)

(assert (=> b!64566 (= e!42304 e!42305)))

(declare-fun c!8840 () Bool)

(assert (=> b!64566 (= c!8840 (and ((_ is Cons!1440) (toList!705 lt!27020)) (not (= (_1!1036 (h!2024 (toList!705 lt!27020))) (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355)))))))

(assert (= (and d!13513 c!8839) b!64565))

(assert (= (and d!13513 (not c!8839)) b!64566))

(assert (= (and b!64566 c!8840) b!64567))

(assert (= (and b!64566 (not c!8840)) b!64568))

(assert (=> b!64567 m!58539))

(declare-fun m!59403 () Bool)

(assert (=> b!64567 m!59403))

(assert (=> b!63964 d!13513))

(assert (=> b!63966 d!13511))

(assert (=> b!63966 d!13513))

(declare-fun b!64569 () Bool)

(declare-fun e!42309 () Bool)

(declare-fun call!5226 () Bool)

(assert (=> b!64569 (= e!42309 call!5226)))

(declare-fun b!64570 () Bool)

(declare-fun e!42307 () Bool)

(declare-fun e!42306 () Bool)

(assert (=> b!64570 (= e!42307 e!42306)))

(declare-fun res!35212 () Bool)

(assert (=> b!64570 (=> (not res!35212) (not e!42306))))

(declare-fun e!42308 () Bool)

(assert (=> b!64570 (= res!35212 (not e!42308))))

(declare-fun res!35210 () Bool)

(assert (=> b!64570 (=> (not res!35210) (not e!42308))))

(assert (=> b!64570 (= res!35210 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64571 () Bool)

(assert (=> b!64571 (= e!42308 (contains!696 Nil!1442 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64572 () Bool)

(assert (=> b!64572 (= e!42309 call!5226)))

(declare-fun d!13515 () Bool)

(declare-fun res!35211 () Bool)

(assert (=> d!13515 (=> res!35211 e!42307)))

(assert (=> d!13515 (= res!35211 (bvsge #b00000000000000000000000000000000 (size!2038 (_keys!3745 newMap!16))))))

(assert (=> d!13515 (= (arrayNoDuplicates!0 (_keys!3745 newMap!16) #b00000000000000000000000000000000 Nil!1442) e!42307)))

(declare-fun b!64573 () Bool)

(assert (=> b!64573 (= e!42306 e!42309)))

(declare-fun c!8841 () Bool)

(assert (=> b!64573 (= c!8841 (validKeyInArray!0 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5223 () Bool)

(assert (=> bm!5223 (= call!5226 (arrayNoDuplicates!0 (_keys!3745 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8841 (Cons!1441 (select (arr!1805 (_keys!3745 newMap!16)) #b00000000000000000000000000000000) Nil!1442) Nil!1442)))))

(assert (= (and d!13515 (not res!35211)) b!64570))

(assert (= (and b!64570 res!35210) b!64571))

(assert (= (and b!64570 res!35212) b!64573))

(assert (= (and b!64573 c!8841) b!64572))

(assert (= (and b!64573 (not c!8841)) b!64569))

(assert (= (or b!64572 b!64569) bm!5223))

(assert (=> b!64570 m!58935))

(assert (=> b!64570 m!58935))

(assert (=> b!64570 m!59001))

(assert (=> b!64571 m!58935))

(assert (=> b!64571 m!58935))

(declare-fun m!59405 () Bool)

(assert (=> b!64571 m!59405))

(assert (=> b!64573 m!58935))

(assert (=> b!64573 m!58935))

(assert (=> b!64573 m!59001))

(assert (=> bm!5223 m!58935))

(declare-fun m!59407 () Bool)

(assert (=> bm!5223 m!59407))

(assert (=> b!64134 d!13515))

(declare-fun d!13517 () Bool)

(assert (=> d!13517 (= (apply!69 lt!27208 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1093 (getValueByKey!127 (toList!705 lt!27208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2820 () Bool)

(assert (= bs!2820 d!13517))

(assert (=> bs!2820 m!59211))

(assert (=> bs!2820 m!59211))

(declare-fun m!59409 () Bool)

(assert (=> bs!2820 m!59409))

(assert (=> b!64193 d!13517))

(declare-fun d!13519 () Bool)

(declare-fun e!42310 () Bool)

(assert (=> d!13519 e!42310))

(declare-fun res!35213 () Bool)

(assert (=> d!13519 (=> (not res!35213) (not e!42310))))

(declare-fun lt!27546 () ListLongMap!1379)

(assert (=> d!13519 (= res!35213 (contains!695 lt!27546 (_1!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!27544 () List!1444)

(assert (=> d!13519 (= lt!27546 (ListLongMap!1380 lt!27544))))

(declare-fun lt!27545 () Unit!1757)

(declare-fun lt!27547 () Unit!1757)

(assert (=> d!13519 (= lt!27545 lt!27547)))

(assert (=> d!13519 (= (getValueByKey!127 lt!27544 (_1!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!132 (_2!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13519 (= lt!27547 (lemmaContainsTupThenGetReturnValue!44 lt!27544 (_1!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13519 (= lt!27544 (insertStrictlySorted!47 (toList!705 call!5141) (_1!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13519 (= (+!84 call!5141 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!27546)))

(declare-fun b!64574 () Bool)

(declare-fun res!35214 () Bool)

(assert (=> b!64574 (=> (not res!35214) (not e!42310))))

(assert (=> b!64574 (= res!35214 (= (getValueByKey!127 (toList!705 lt!27546) (_1!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!132 (_2!1036 (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!64575 () Bool)

(assert (=> b!64575 (= e!42310 (contains!697 (toList!705 lt!27546) (tuple2!2051 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1090 (select (arr!1806 (_values!2092 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!311 (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!13519 res!35213) b!64574))

(assert (= (and b!64574 res!35214) b!64575))

(declare-fun m!59411 () Bool)

(assert (=> d!13519 m!59411))

(declare-fun m!59413 () Bool)

(assert (=> d!13519 m!59413))

(declare-fun m!59415 () Bool)

(assert (=> d!13519 m!59415))

(declare-fun m!59417 () Bool)

(assert (=> d!13519 m!59417))

(declare-fun m!59419 () Bool)

(assert (=> b!64574 m!59419))

(declare-fun m!59421 () Bool)

(assert (=> b!64575 m!59421))

(assert (=> b!64072 d!13519))

(declare-fun d!13521 () Bool)

(assert (=> d!13521 (= (validKeyInArray!0 (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1805 (_keys!3745 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64096 d!13521))

(assert (=> bm!5139 d!13379))

(declare-fun b!64577 () Bool)

(declare-fun e!42311 () Bool)

(assert (=> b!64577 (= e!42311 tp_is_empty!2421)))

(declare-fun mapNonEmpty!2981 () Bool)

(declare-fun mapRes!2981 () Bool)

(declare-fun tp!8183 () Bool)

(declare-fun e!42312 () Bool)

(assert (=> mapNonEmpty!2981 (= mapRes!2981 (and tp!8183 e!42312))))

(declare-fun mapValue!2981 () ValueCell!867)

(declare-fun mapKey!2981 () (_ BitVec 32))

(declare-fun mapRest!2981 () (Array (_ BitVec 32) ValueCell!867))

(assert (=> mapNonEmpty!2981 (= mapRest!2980 (store mapRest!2981 mapKey!2981 mapValue!2981))))

(declare-fun b!64576 () Bool)

(assert (=> b!64576 (= e!42312 tp_is_empty!2421)))

(declare-fun condMapEmpty!2981 () Bool)

(declare-fun mapDefault!2981 () ValueCell!867)

(assert (=> mapNonEmpty!2980 (= condMapEmpty!2981 (= mapRest!2980 ((as const (Array (_ BitVec 32) ValueCell!867)) mapDefault!2981)))))

(assert (=> mapNonEmpty!2980 (= tp!8182 (and e!42311 mapRes!2981))))

(declare-fun mapIsEmpty!2981 () Bool)

(assert (=> mapIsEmpty!2981 mapRes!2981))

(assert (= (and mapNonEmpty!2980 condMapEmpty!2981) mapIsEmpty!2981))

(assert (= (and mapNonEmpty!2980 (not condMapEmpty!2981)) mapNonEmpty!2981))

(assert (= (and mapNonEmpty!2981 ((_ is ValueCellFull!867) mapValue!2981)) b!64576))

(assert (= (and mapNonEmpty!2980 ((_ is ValueCellFull!867) mapDefault!2981)) b!64577))

(declare-fun m!59423 () Bool)

(assert (=> mapNonEmpty!2981 m!59423))

(declare-fun b!64579 () Bool)

(declare-fun e!42313 () Bool)

(assert (=> b!64579 (= e!42313 tp_is_empty!2421)))

(declare-fun mapNonEmpty!2982 () Bool)

(declare-fun mapRes!2982 () Bool)

(declare-fun tp!8184 () Bool)

(declare-fun e!42314 () Bool)

(assert (=> mapNonEmpty!2982 (= mapRes!2982 (and tp!8184 e!42314))))

(declare-fun mapKey!2982 () (_ BitVec 32))

(declare-fun mapRest!2982 () (Array (_ BitVec 32) ValueCell!867))

(declare-fun mapValue!2982 () ValueCell!867)

(assert (=> mapNonEmpty!2982 (= mapRest!2979 (store mapRest!2982 mapKey!2982 mapValue!2982))))

(declare-fun b!64578 () Bool)

(assert (=> b!64578 (= e!42314 tp_is_empty!2421)))

(declare-fun condMapEmpty!2982 () Bool)

(declare-fun mapDefault!2982 () ValueCell!867)

(assert (=> mapNonEmpty!2979 (= condMapEmpty!2982 (= mapRest!2979 ((as const (Array (_ BitVec 32) ValueCell!867)) mapDefault!2982)))))

(assert (=> mapNonEmpty!2979 (= tp!8181 (and e!42313 mapRes!2982))))

(declare-fun mapIsEmpty!2982 () Bool)

(assert (=> mapIsEmpty!2982 mapRes!2982))

(assert (= (and mapNonEmpty!2979 condMapEmpty!2982) mapIsEmpty!2982))

(assert (= (and mapNonEmpty!2979 (not condMapEmpty!2982)) mapNonEmpty!2982))

(assert (= (and mapNonEmpty!2982 ((_ is ValueCellFull!867) mapValue!2982)) b!64578))

(assert (= (and mapNonEmpty!2979 ((_ is ValueCellFull!867) mapDefault!2982)) b!64579))

(declare-fun m!59425 () Bool)

(assert (=> mapNonEmpty!2982 m!59425))

(declare-fun b_lambda!2897 () Bool)

(assert (= b_lambda!2885 (or (and b!63891 b_free!2009) (and b!63890 b_free!2011 (= (defaultEntry!2109 newMap!16) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))))) b_lambda!2897)))

(declare-fun b_lambda!2899 () Bool)

(assert (= b_lambda!2887 (or (and b!63891 b_free!2009) (and b!63890 b_free!2011 (= (defaultEntry!2109 newMap!16) (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))))) b_lambda!2899)))

(declare-fun b_lambda!2901 () Bool)

(assert (= b_lambda!2889 (or (and b!63891 b_free!2009 (= (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2109 newMap!16))) (and b!63890 b_free!2011) b_lambda!2901)))

(declare-fun b_lambda!2903 () Bool)

(assert (= b_lambda!2891 (or (and b!63891 b_free!2009 (= (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2109 newMap!16))) (and b!63890 b_free!2011) b_lambda!2903)))

(declare-fun b_lambda!2905 () Bool)

(assert (= b_lambda!2893 (or (and b!63891 b_free!2009 (= (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2109 newMap!16))) (and b!63890 b_free!2011) b_lambda!2905)))

(declare-fun b_lambda!2907 () Bool)

(assert (= b_lambda!2895 (or (and b!63891 b_free!2009 (= (defaultEntry!2109 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2109 newMap!16))) (and b!63890 b_free!2011) b_lambda!2907)))

(check-sat (not b!64409) (not d!13449) (not d!13427) (not bm!5195) (not d!13387) (not d!13389) (not b!64488) (not b!64504) (not b!64406) (not b!64507) (not b!64300) (not b!64495) (not b!64223) (not bm!5206) (not d!13479) (not b!64477) (not d!13439) (not d!13413) (not b!64332) (not b!64482) (not b!64520) (not bm!5211) (not b!64532) (not b!64575) (not d!13491) (not b!64499) (not b!64268) (not b!64405) (not b!64228) (not d!13505) (not b!64318) (not b!64273) (not b!64502) (not b!64436) b_and!3959 (not d!13455) (not bm!5205) (not d!13503) (not b!64402) (not b!64535) (not bm!5190) (not d!13501) (not b_lambda!2899) (not b!64237) (not b!64403) (not d!13467) (not b!64267) (not b!64433) (not d!13477) (not d!13403) (not b!64523) (not b!64550) (not b!64540) (not b!64551) (not b!64278) (not d!13471) (not b!64238) (not d!13519) (not bm!5208) (not bm!5191) (not bm!5173) (not b!64349) (not bm!5172) (not b!64508) (not d!13405) (not b!64574) (not b!64324) (not b!64401) (not b!64411) (not mapNonEmpty!2982) (not b!64423) (not b!64573) (not d!13475) (not d!13463) (not b!64291) (not b!64428) (not d!13461) (not b!64571) (not bm!5222) (not b!64355) (not b!64490) (not bm!5215) (not b!64435) (not b!64497) (not d!13453) (not b!64327) (not b!64489) (not b_next!2011) (not b!64271) (not b!64479) (not d!13465) (not d!13511) (not d!13431) (not b!64277) (not b!64306) (not d!13435) (not b!64331) (not d!13391) (not b!64407) (not bm!5179) (not b!64337) (not b!64305) (not d!13411) (not mapNonEmpty!2981) (not b_lambda!2879) (not b!64567) (not d!13443) (not b!64487) (not bm!5203) (not b!64281) (not b!64353) (not d!13395) (not b_lambda!2907) (not b!64538) (not b!64272) (not b!64556) (not bm!5192) (not b!64496) (not bm!5204) (not d!13517) (not b!64526) (not b_lambda!2883) (not b!64352) (not b!64431) (not b!64307) (not bm!5189) (not b!64417) (not d!13415) (not b!64290) (not b!64553) (not b!64542) (not d!13445) (not bm!5168) (not b!64357) (not d!13429) b_and!3961 (not b!64543) (not b!64541) (not d!13451) (not bm!5193) (not d!13397) (not b!64303) (not bm!5217) (not b!64413) (not b!64348) (not b!64236) (not b!64434) (not d!13383) (not b!64501) (not bm!5171) (not d!13417) (not bm!5175) (not b!64530) (not b!64570) (not b!64295) tp_is_empty!2421 (not b!64289) (not bm!5219) (not d!13459) (not b!64279) (not b!64472) (not b!64425) (not b!64522) (not b_lambda!2905) (not d!13421) (not b!64509) (not d!13409) (not bm!5198) (not b!64325) (not bm!5212) (not b_lambda!2901) (not b!64505) (not b!64227) (not b!64265) (not bm!5178) (not b!64266) (not d!13499) (not d!13393) (not b!64467) (not d!13407) (not b!64297) (not d!13507) (not b!64308) (not b!64275) (not d!13401) (not b!64280) (not d!13509) (not d!13399) (not bm!5223) (not d!13487) (not d!13423) (not b!64270) (not d!13493) (not bm!5216) (not b!64328) (not b_lambda!2897) (not b!64485) (not d!13469) (not b_next!2009) (not b!64330) (not b!64465) (not b!64506) (not b_lambda!2903) (not b!64235))
(check-sat b_and!3959 b_and!3961 (not b_next!2009) (not b_next!2011))
