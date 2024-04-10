; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8364 () Bool)

(assert start!8364)

(declare-fun b!56020 () Bool)

(declare-fun b_free!1893 () Bool)

(declare-fun b_next!1893 () Bool)

(assert (=> b!56020 (= b_free!1893 (not b_next!1893))))

(declare-fun tp!7779 () Bool)

(declare-fun b_and!3327 () Bool)

(assert (=> b!56020 (= tp!7779 b_and!3327)))

(declare-fun b!56024 () Bool)

(declare-fun b_free!1895 () Bool)

(declare-fun b_next!1895 () Bool)

(assert (=> b!56024 (= b_free!1895 (not b_next!1895))))

(declare-fun tp!7781 () Bool)

(declare-fun b_and!3329 () Bool)

(assert (=> b!56024 (= tp!7781 b_and!3329)))

(declare-datatypes ((V!2797 0))(
  ( (V!2798 (val!1226 Int)) )
))
(declare-datatypes ((array!3649 0))(
  ( (array!3650 (arr!1747 (Array (_ BitVec 32) (_ BitVec 64))) (size!1976 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!838 0))(
  ( (ValueCellFull!838 (v!2338 V!2797)) (EmptyCell!838) )
))
(declare-datatypes ((array!3651 0))(
  ( (array!3652 (arr!1748 (Array (_ BitVec 32) ValueCell!838)) (size!1977 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!584 0))(
  ( (LongMapFixedSize!585 (defaultEntry!2006 Int) (mask!5869 (_ BitVec 32)) (extraKeys!1897 (_ BitVec 32)) (zeroValue!1924 V!2797) (minValue!1924 V!2797) (_size!341 (_ BitVec 32)) (_keys!3626 array!3649) (_values!1989 array!3651) (_vacant!341 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!400 0))(
  ( (Cell!401 (v!2339 LongMapFixedSize!584)) )
))
(declare-datatypes ((LongMap!400 0))(
  ( (LongMap!401 (underlying!211 Cell!400)) )
))
(declare-fun thiss!992 () LongMap!400)

(declare-fun e!36858 () Bool)

(declare-fun tp_is_empty!2363 () Bool)

(declare-fun e!36862 () Bool)

(declare-fun array_inv!1081 (array!3649) Bool)

(declare-fun array_inv!1082 (array!3651) Bool)

(assert (=> b!56020 (= e!36858 (and tp!7779 tp_is_empty!2363 (array_inv!1081 (_keys!3626 (v!2339 (underlying!211 thiss!992)))) (array_inv!1082 (_values!1989 (v!2339 (underlying!211 thiss!992)))) e!36862))))

(declare-fun b!56021 () Bool)

(declare-fun e!36857 () Bool)

(assert (=> b!56021 (= e!36857 tp_is_empty!2363)))

(declare-fun b!56022 () Bool)

(declare-fun e!36860 () Bool)

(assert (=> b!56022 (= e!36860 tp_is_empty!2363)))

(declare-fun b!56023 () Bool)

(declare-fun res!31521 () Bool)

(declare-fun e!36856 () Bool)

(assert (=> b!56023 (=> (not res!31521) (not e!36856))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!56023 (= res!31521 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1976 (_keys!3626 (v!2339 (underlying!211 thiss!992)))))))))

(declare-fun e!36848 () Bool)

(declare-fun e!36863 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!584)

(assert (=> b!56024 (= e!36848 (and tp!7781 tp_is_empty!2363 (array_inv!1081 (_keys!3626 newMap!16)) (array_inv!1082 (_values!1989 newMap!16)) e!36863))))

(declare-fun b!56025 () Bool)

(declare-fun e!36851 () Bool)

(assert (=> b!56025 (= e!36851 tp_is_empty!2363)))

(declare-fun b!56026 () Bool)

(declare-fun e!36859 () Bool)

(declare-fun e!36853 () Bool)

(assert (=> b!56026 (= e!36859 e!36853)))

(declare-fun b!56027 () Bool)

(declare-fun res!31524 () Bool)

(declare-fun e!36854 () Bool)

(assert (=> b!56027 (=> res!31524 e!36854)))

(declare-datatypes ((List!1407 0))(
  ( (Nil!1404) (Cons!1403 (h!1983 (_ BitVec 64)) (t!4669 List!1407)) )
))
(declare-fun lt!22126 () List!1407)

(declare-fun contains!665 (List!1407 (_ BitVec 64)) Bool)

(assert (=> b!56027 (= res!31524 (contains!665 lt!22126 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!2759 () Bool)

(declare-fun mapRes!2760 () Bool)

(declare-fun tp!7782 () Bool)

(assert (=> mapNonEmpty!2759 (= mapRes!2760 (and tp!7782 e!36851))))

(declare-fun mapKey!2759 () (_ BitVec 32))

(declare-fun mapRest!2760 () (Array (_ BitVec 32) ValueCell!838))

(declare-fun mapValue!2760 () ValueCell!838)

(assert (=> mapNonEmpty!2759 (= (arr!1748 (_values!1989 newMap!16)) (store mapRest!2760 mapKey!2759 mapValue!2760))))

(declare-fun b!56028 () Bool)

(declare-fun e!36850 () Bool)

(declare-fun e!36849 () Bool)

(assert (=> b!56028 (= e!36850 e!36849)))

(declare-fun res!31529 () Bool)

(assert (=> b!56028 (=> (not res!31529) (not e!36849))))

(declare-datatypes ((tuple2!1984 0))(
  ( (tuple2!1985 (_1!1003 (_ BitVec 64)) (_2!1003 V!2797)) )
))
(declare-datatypes ((List!1408 0))(
  ( (Nil!1405) (Cons!1404 (h!1984 tuple2!1984) (t!4670 List!1408)) )
))
(declare-datatypes ((ListLongMap!1341 0))(
  ( (ListLongMap!1342 (toList!686 List!1408)) )
))
(declare-fun lt!22129 () ListLongMap!1341)

(declare-fun contains!666 (ListLongMap!1341 (_ BitVec 64)) Bool)

(assert (=> b!56028 (= res!31529 (contains!666 lt!22129 (select (arr!1747 (_keys!3626 (v!2339 (underlying!211 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1986 0))(
  ( (tuple2!1987 (_1!1004 Bool) (_2!1004 LongMapFixedSize!584)) )
))
(declare-fun lt!22127 () tuple2!1986)

(declare-fun update!66 (LongMapFixedSize!584 (_ BitVec 64) V!2797) tuple2!1986)

(declare-fun get!1042 (ValueCell!838 V!2797) V!2797)

(declare-fun dynLambda!297 (Int (_ BitVec 64)) V!2797)

(assert (=> b!56028 (= lt!22127 (update!66 newMap!16 (select (arr!1747 (_keys!3626 (v!2339 (underlying!211 thiss!992)))) from!355) (get!1042 (select (arr!1748 (_values!1989 (v!2339 (underlying!211 thiss!992)))) from!355) (dynLambda!297 (defaultEntry!2006 (v!2339 (underlying!211 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56029 () Bool)

(declare-fun res!31526 () Bool)

(assert (=> b!56029 (=> (not res!31526) (not e!36856))))

(declare-fun valid!236 (LongMapFixedSize!584) Bool)

(assert (=> b!56029 (= res!31526 (valid!236 newMap!16))))

(declare-fun b!56030 () Bool)

(declare-fun e!36852 () Bool)

(assert (=> b!56030 (= e!36863 (and e!36852 mapRes!2760))))

(declare-fun condMapEmpty!2760 () Bool)

(declare-fun mapDefault!2759 () ValueCell!838)

