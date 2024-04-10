; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14974 () Bool)

(assert start!14974)

(declare-fun b!143888 () Bool)

(declare-fun b_free!3057 () Bool)

(declare-fun b_next!3057 () Bool)

(assert (=> b!143888 (= b_free!3057 (not b_next!3057))))

(declare-fun tp!11657 () Bool)

(declare-fun b_and!8975 () Bool)

(assert (=> b!143888 (= tp!11657 b_and!8975)))

(declare-fun b!143886 () Bool)

(declare-fun b_free!3059 () Bool)

(declare-fun b_next!3059 () Bool)

(assert (=> b!143886 (= b_free!3059 (not b_next!3059))))

(declare-fun tp!11659 () Bool)

(declare-fun b_and!8977 () Bool)

(assert (=> b!143886 (= tp!11659 b_and!8977)))

(declare-fun res!68547 () Bool)

(declare-fun e!93798 () Bool)

(assert (=> start!14974 (=> (not res!68547) (not e!93798))))

(declare-datatypes ((V!3573 0))(
  ( (V!3574 (val!1517 Int)) )
))
(declare-datatypes ((array!4929 0))(
  ( (array!4930 (arr!2329 (Array (_ BitVec 32) (_ BitVec 64))) (size!2603 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1129 0))(
  ( (ValueCellFull!1129 (v!3309 V!3573)) (EmptyCell!1129) )
))
(declare-datatypes ((array!4931 0))(
  ( (array!4932 (arr!2330 (Array (_ BitVec 32) ValueCell!1129)) (size!2604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1166 0))(
  ( (LongMapFixedSize!1167 (defaultEntry!2977 Int) (mask!7335 (_ BitVec 32)) (extraKeys!2726 (_ BitVec 32)) (zeroValue!2824 V!3573) (minValue!2824 V!3573) (_size!632 (_ BitVec 32)) (_keys!4742 array!4929) (_values!2960 array!4931) (_vacant!632 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!950 0))(
  ( (Cell!951 (v!3310 LongMapFixedSize!1166)) )
))
(declare-datatypes ((LongMap!950 0))(
  ( (LongMap!951 (underlying!486 Cell!950)) )
))
(declare-fun thiss!992 () LongMap!950)

(declare-fun valid!564 (LongMap!950) Bool)

(assert (=> start!14974 (= res!68547 (valid!564 thiss!992))))

(assert (=> start!14974 e!93798))

(declare-fun e!93788 () Bool)

(assert (=> start!14974 e!93788))

(assert (=> start!14974 true))

(declare-fun e!93801 () Bool)

(assert (=> start!14974 e!93801))

(declare-fun b!143881 () Bool)

(declare-fun e!93795 () Bool)

(declare-fun tp_is_empty!2945 () Bool)

(assert (=> b!143881 (= e!93795 tp_is_empty!2945)))

(declare-fun mapIsEmpty!4891 () Bool)

(declare-fun mapRes!4892 () Bool)

(assert (=> mapIsEmpty!4891 mapRes!4892))

(declare-fun b!143882 () Bool)

(declare-fun res!68546 () Bool)

(assert (=> b!143882 (=> (not res!68546) (not e!93798))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!143882 (= res!68546 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2603 (_keys!4742 (v!3310 (underlying!486 thiss!992)))))))))

(declare-fun b!143883 () Bool)

(declare-fun res!68552 () Bool)

(declare-fun e!93797 () Bool)

(assert (=> b!143883 (=> res!68552 e!93797)))

(declare-datatypes ((List!1754 0))(
  ( (Nil!1751) (Cons!1750 (h!2358 (_ BitVec 64)) (t!6387 List!1754)) )
))
(declare-fun lt!75445 () List!1754)

(declare-fun noDuplicate!53 (List!1754) Bool)

(assert (=> b!143883 (= res!68552 (not (noDuplicate!53 lt!75445)))))

(declare-fun mapNonEmpty!4891 () Bool)

(declare-fun tp!11660 () Bool)

(declare-fun e!93792 () Bool)

(assert (=> mapNonEmpty!4891 (= mapRes!4892 (and tp!11660 e!93792))))

(declare-fun mapValue!4892 () ValueCell!1129)

(declare-fun mapRest!4891 () (Array (_ BitVec 32) ValueCell!1129))

(declare-fun newMap!16 () LongMapFixedSize!1166)

(declare-fun mapKey!4891 () (_ BitVec 32))

(assert (=> mapNonEmpty!4891 (= (arr!2330 (_values!2960 newMap!16)) (store mapRest!4891 mapKey!4891 mapValue!4892))))

(declare-fun b!143884 () Bool)

(declare-fun e!93790 () Bool)

(declare-fun contains!932 (List!1754 (_ BitVec 64)) Bool)

(assert (=> b!143884 (= e!93790 (not (contains!932 lt!75445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143885 () Bool)

(declare-fun e!93789 () Bool)

(assert (=> b!143885 (= e!93789 (not e!93797))))

(declare-fun res!68551 () Bool)

(assert (=> b!143885 (=> res!68551 e!93797)))

(assert (=> b!143885 (= res!68551 (or (bvsge (size!2603 (_keys!4742 (v!3310 (underlying!486 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4742 (v!3310 (underlying!486 thiss!992)))))))))

(assert (=> b!143885 (= lt!75445 (Cons!1750 (select (arr!2329 (_keys!4742 (v!3310 (underlying!486 thiss!992)))) from!355) Nil!1751))))

(declare-fun arrayNoDuplicates!0 (array!4929 (_ BitVec 32) List!1754) Bool)

(assert (=> b!143885 (arrayNoDuplicates!0 (_keys!4742 (v!3310 (underlying!486 thiss!992))) from!355 Nil!1751)))

(declare-datatypes ((Unit!4559 0))(
  ( (Unit!4560) )
))
(declare-fun lt!75447 () Unit!4559)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4929 (_ BitVec 32) (_ BitVec 32)) Unit!4559)

(assert (=> b!143885 (= lt!75447 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4742 (v!3310 (underlying!486 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143885 (arrayContainsKey!0 (_keys!4742 (v!3310 (underlying!486 thiss!992))) (select (arr!2329 (_keys!4742 (v!3310 (underlying!486 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75444 () Unit!4559)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!144 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3573 V!3573 (_ BitVec 64) (_ BitVec 32) Int) Unit!4559)

(assert (=> b!143885 (= lt!75444 (lemmaListMapContainsThenArrayContainsFrom!144 (_keys!4742 (v!3310 (underlying!486 thiss!992))) (_values!2960 (v!3310 (underlying!486 thiss!992))) (mask!7335 (v!3310 (underlying!486 thiss!992))) (extraKeys!2726 (v!3310 (underlying!486 thiss!992))) (zeroValue!2824 (v!3310 (underlying!486 thiss!992))) (minValue!2824 (v!3310 (underlying!486 thiss!992))) (select (arr!2329 (_keys!4742 (v!3310 (underlying!486 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2977 (v!3310 (underlying!486 thiss!992)))))))

(declare-fun e!93794 () Bool)

(declare-fun array_inv!1465 (array!4929) Bool)

(declare-fun array_inv!1466 (array!4931) Bool)

(assert (=> b!143886 (= e!93801 (and tp!11659 tp_is_empty!2945 (array_inv!1465 (_keys!4742 newMap!16)) (array_inv!1466 (_values!2960 newMap!16)) e!93794))))

(declare-fun b!143887 () Bool)

(declare-fun e!93785 () Bool)

(assert (=> b!143887 (= e!93785 e!93789)))

(declare-fun res!68548 () Bool)

(assert (=> b!143887 (=> (not res!68548) (not e!93789))))

(declare-datatypes ((tuple2!2714 0))(
  ( (tuple2!2715 (_1!1368 (_ BitVec 64)) (_2!1368 V!3573)) )
))
(declare-datatypes ((List!1755 0))(
  ( (Nil!1752) (Cons!1751 (h!2359 tuple2!2714) (t!6388 List!1755)) )
))
(declare-datatypes ((ListLongMap!1753 0))(
  ( (ListLongMap!1754 (toList!892 List!1755)) )
))
(declare-fun lt!75446 () ListLongMap!1753)

(declare-fun contains!933 (ListLongMap!1753 (_ BitVec 64)) Bool)

(assert (=> b!143887 (= res!68548 (contains!933 lt!75446 (select (arr!2329 (_keys!4742 (v!3310 (underlying!486 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2716 0))(
  ( (tuple2!2717 (_1!1369 Bool) (_2!1369 LongMapFixedSize!1166)) )
))
(declare-fun lt!75448 () tuple2!2716)

(declare-fun update!215 (LongMapFixedSize!1166 (_ BitVec 64) V!3573) tuple2!2716)

(declare-fun get!1542 (ValueCell!1129 V!3573) V!3573)

(declare-fun dynLambda!446 (Int (_ BitVec 64)) V!3573)

(assert (=> b!143887 (= lt!75448 (update!215 newMap!16 (select (arr!2329 (_keys!4742 (v!3310 (underlying!486 thiss!992)))) from!355) (get!1542 (select (arr!2330 (_values!2960 (v!3310 (underlying!486 thiss!992)))) from!355) (dynLambda!446 (defaultEntry!2977 (v!3310 (underlying!486 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!93787 () Bool)

(declare-fun e!93791 () Bool)

(assert (=> b!143888 (= e!93787 (and tp!11657 tp_is_empty!2945 (array_inv!1465 (_keys!4742 (v!3310 (underlying!486 thiss!992)))) (array_inv!1466 (_values!2960 (v!3310 (underlying!486 thiss!992)))) e!93791))))

(declare-fun b!143889 () Bool)

(assert (=> b!143889 (= e!93797 e!93790)))

(declare-fun res!68553 () Bool)

(assert (=> b!143889 (=> (not res!68553) (not e!93790))))

(assert (=> b!143889 (= res!68553 (not (contains!932 lt!75445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143890 () Bool)

(assert (=> b!143890 (= e!93792 tp_is_empty!2945)))

(declare-fun b!143891 () Bool)

(declare-fun e!93793 () Bool)

(declare-fun mapRes!4891 () Bool)

(assert (=> b!143891 (= e!93791 (and e!93793 mapRes!4891))))

(declare-fun condMapEmpty!4891 () Bool)

(declare-fun mapDefault!4892 () ValueCell!1129)

