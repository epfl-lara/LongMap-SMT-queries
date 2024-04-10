; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8260 () Bool)

(assert start!8260)

(declare-fun b!52820 () Bool)

(declare-fun b_free!1685 () Bool)

(declare-fun b_next!1685 () Bool)

(assert (=> b!52820 (= b_free!1685 (not b_next!1685))))

(declare-fun tp!7156 () Bool)

(declare-fun b_and!2911 () Bool)

(assert (=> b!52820 (= tp!7156 b_and!2911)))

(declare-fun b!52837 () Bool)

(declare-fun b_free!1687 () Bool)

(declare-fun b_next!1687 () Bool)

(assert (=> b!52837 (= b_free!1687 (not b_next!1687))))

(declare-fun tp!7157 () Bool)

(declare-fun b_and!2913 () Bool)

(assert (=> b!52837 (= tp!7157 b_and!2913)))

(declare-fun tp_is_empty!2259 () Bool)

(declare-fun e!34433 () Bool)

(declare-fun e!34439 () Bool)

(declare-datatypes ((V!2659 0))(
  ( (V!2660 (val!1174 Int)) )
))
(declare-datatypes ((array!3441 0))(
  ( (array!3442 (arr!1643 (Array (_ BitVec 32) (_ BitVec 64))) (size!1872 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!786 0))(
  ( (ValueCellFull!786 (v!2237 V!2659)) (EmptyCell!786) )
))
(declare-datatypes ((array!3443 0))(
  ( (array!3444 (arr!1644 (Array (_ BitVec 32) ValueCell!786)) (size!1873 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!480 0))(
  ( (LongMapFixedSize!481 (defaultEntry!1954 Int) (mask!5783 (_ BitVec 32)) (extraKeys!1845 (_ BitVec 32)) (zeroValue!1872 V!2659) (minValue!1872 V!2659) (_size!289 (_ BitVec 32)) (_keys!3574 array!3441) (_values!1937 array!3443) (_vacant!289 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!302 0))(
  ( (Cell!303 (v!2238 LongMapFixedSize!480)) )
))
(declare-datatypes ((LongMap!302 0))(
  ( (LongMap!303 (underlying!162 Cell!302)) )
))
(declare-fun thiss!992 () LongMap!302)

(declare-fun array_inv!1017 (array!3441) Bool)

(declare-fun array_inv!1018 (array!3443) Bool)

(assert (=> b!52820 (= e!34433 (and tp!7156 tp_is_empty!2259 (array_inv!1017 (_keys!3574 (v!2238 (underlying!162 thiss!992)))) (array_inv!1018 (_values!1937 (v!2238 (underlying!162 thiss!992)))) e!34439))))

(declare-fun b!52821 () Bool)

(declare-fun res!29989 () Bool)

(declare-fun e!34429 () Bool)

(assert (=> b!52821 (=> (not res!29989) (not e!34429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3441 (_ BitVec 32)) Bool)

(assert (=> b!52821 (= res!29989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3574 (v!2238 (underlying!162 thiss!992))) (mask!5783 (v!2238 (underlying!162 thiss!992)))))))

(declare-fun mapIsEmpty!2447 () Bool)

(declare-fun mapRes!2447 () Bool)

(assert (=> mapIsEmpty!2447 mapRes!2447))

(declare-fun b!52822 () Bool)

(declare-fun res!29988 () Bool)

(declare-fun e!34442 () Bool)

(assert (=> b!52822 (=> (not res!29988) (not e!34442))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52822 (= res!29988 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1872 (_keys!3574 (v!2238 (underlying!162 thiss!992)))))))))

(declare-fun b!52823 () Bool)

(declare-fun e!34437 () Bool)

(assert (=> b!52823 (= e!34437 tp_is_empty!2259)))

(declare-fun b!52824 () Bool)

(declare-fun res!29991 () Bool)

(assert (=> b!52824 (=> (not res!29991) (not e!34429))))

(assert (=> b!52824 (= res!29991 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1872 (_keys!3574 (v!2238 (underlying!162 thiss!992)))))))))

(declare-fun b!52825 () Bool)

(assert (=> b!52825 (= e!34429 false)))

(declare-fun lt!21354 () Bool)

(declare-datatypes ((tuple2!1864 0))(
  ( (tuple2!1865 (_1!943 (_ BitVec 64)) (_2!943 V!2659)) )
))
(declare-datatypes ((List!1347 0))(
  ( (Nil!1344) (Cons!1343 (h!1923 tuple2!1864) (t!4401 List!1347)) )
))
(declare-datatypes ((ListLongMap!1273 0))(
  ( (ListLongMap!1274 (toList!652 List!1347)) )
))
(declare-fun lt!21352 () ListLongMap!1273)

(declare-fun contains!628 (ListLongMap!1273 (_ BitVec 64)) Bool)

(assert (=> b!52825 (= lt!21354 (contains!628 lt!21352 (select (arr!1643 (_keys!3574 (v!2238 (underlying!162 thiss!992)))) from!355)))))

(declare-fun b!52826 () Bool)

(declare-fun e!34428 () Bool)

(assert (=> b!52826 (= e!34428 tp_is_empty!2259)))

(declare-fun b!52827 () Bool)

(declare-fun e!34435 () Bool)

(assert (=> b!52827 (= e!34435 tp_is_empty!2259)))

(declare-fun b!52828 () Bool)

(declare-fun e!34441 () Bool)

(assert (=> b!52828 (= e!34442 e!34441)))

(declare-fun res!29993 () Bool)

(assert (=> b!52828 (=> (not res!29993) (not e!34441))))

(declare-fun lt!21351 () ListLongMap!1273)

(assert (=> b!52828 (= res!29993 (and (= lt!21352 lt!21351) (not (= (select (arr!1643 (_keys!3574 (v!2238 (underlying!162 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1643 (_keys!3574 (v!2238 (underlying!162 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!480)

(declare-fun map!1021 (LongMapFixedSize!480) ListLongMap!1273)

(assert (=> b!52828 (= lt!21351 (map!1021 newMap!16))))

(declare-fun getCurrentListMap!364 (array!3441 array!3443 (_ BitVec 32) (_ BitVec 32) V!2659 V!2659 (_ BitVec 32) Int) ListLongMap!1273)

(assert (=> b!52828 (= lt!21352 (getCurrentListMap!364 (_keys!3574 (v!2238 (underlying!162 thiss!992))) (_values!1937 (v!2238 (underlying!162 thiss!992))) (mask!5783 (v!2238 (underlying!162 thiss!992))) (extraKeys!1845 (v!2238 (underlying!162 thiss!992))) (zeroValue!1872 (v!2238 (underlying!162 thiss!992))) (minValue!1872 (v!2238 (underlying!162 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1954 (v!2238 (underlying!162 thiss!992)))))))

(declare-fun b!52829 () Bool)

(declare-fun e!34434 () Bool)

(assert (=> b!52829 (= e!34434 tp_is_empty!2259)))

(declare-fun res!29992 () Bool)

(assert (=> start!8260 (=> (not res!29992) (not e!34442))))

(declare-fun valid!179 (LongMap!302) Bool)

(assert (=> start!8260 (= res!29992 (valid!179 thiss!992))))

(assert (=> start!8260 e!34442))

(declare-fun e!34431 () Bool)

(assert (=> start!8260 e!34431))

(assert (=> start!8260 true))

(declare-fun e!34436 () Bool)

(assert (=> start!8260 e!34436))

(declare-fun b!52830 () Bool)

(declare-fun res!29990 () Bool)

(assert (=> b!52830 (=> (not res!29990) (not e!34429))))

(declare-datatypes ((List!1348 0))(
  ( (Nil!1345) (Cons!1344 (h!1924 (_ BitVec 64)) (t!4402 List!1348)) )
))
(declare-fun arrayNoDuplicates!0 (array!3441 (_ BitVec 32) List!1348) Bool)

(assert (=> b!52830 (= res!29990 (arrayNoDuplicates!0 (_keys!3574 (v!2238 (underlying!162 thiss!992))) #b00000000000000000000000000000000 Nil!1345))))

(declare-fun b!52831 () Bool)

(declare-fun res!29983 () Bool)

(assert (=> b!52831 (=> (not res!29983) (not e!34429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52831 (= res!29983 (validMask!0 (mask!5783 (v!2238 (underlying!162 thiss!992)))))))

(declare-fun b!52832 () Bool)

(declare-fun res!29985 () Bool)

(assert (=> b!52832 (=> (not res!29985) (not e!34442))))

(declare-fun valid!180 (LongMapFixedSize!480) Bool)

(assert (=> b!52832 (= res!29985 (valid!180 newMap!16))))

(declare-fun b!52833 () Bool)

(declare-fun res!29984 () Bool)

(assert (=> b!52833 (=> (not res!29984) (not e!34442))))

(assert (=> b!52833 (= res!29984 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5783 newMap!16)) (_size!289 (v!2238 (underlying!162 thiss!992)))))))

(declare-fun b!52834 () Bool)

(declare-fun e!34430 () Bool)

(assert (=> b!52834 (= e!34430 e!34433)))

(declare-fun mapNonEmpty!2447 () Bool)

(declare-fun mapRes!2448 () Bool)

(declare-fun tp!7158 () Bool)

(assert (=> mapNonEmpty!2447 (= mapRes!2448 (and tp!7158 e!34434))))

(declare-fun mapKey!2447 () (_ BitVec 32))

(declare-fun mapValue!2448 () ValueCell!786)

(declare-fun mapRest!2447 () (Array (_ BitVec 32) ValueCell!786))

(assert (=> mapNonEmpty!2447 (= (arr!1644 (_values!1937 (v!2238 (underlying!162 thiss!992)))) (store mapRest!2447 mapKey!2447 mapValue!2448))))

(declare-fun b!52835 () Bool)

(declare-fun res!29986 () Bool)

(assert (=> b!52835 (=> (not res!29986) (not e!34429))))

(assert (=> b!52835 (= res!29986 (and (= (size!1873 (_values!1937 (v!2238 (underlying!162 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5783 (v!2238 (underlying!162 thiss!992))))) (= (size!1872 (_keys!3574 (v!2238 (underlying!162 thiss!992)))) (size!1873 (_values!1937 (v!2238 (underlying!162 thiss!992))))) (bvsge (mask!5783 (v!2238 (underlying!162 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1845 (v!2238 (underlying!162 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1845 (v!2238 (underlying!162 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!2448 () Bool)

(declare-fun tp!7155 () Bool)

(assert (=> mapNonEmpty!2448 (= mapRes!2447 (and tp!7155 e!34428))))

(declare-fun mapValue!2447 () ValueCell!786)

(declare-fun mapRest!2448 () (Array (_ BitVec 32) ValueCell!786))

(declare-fun mapKey!2448 () (_ BitVec 32))

(assert (=> mapNonEmpty!2448 (= (arr!1644 (_values!1937 newMap!16)) (store mapRest!2448 mapKey!2448 mapValue!2447))))

(declare-fun b!52836 () Bool)

(assert (=> b!52836 (= e!34431 e!34430)))

(declare-fun e!34438 () Bool)

(assert (=> b!52837 (= e!34436 (and tp!7157 tp_is_empty!2259 (array_inv!1017 (_keys!3574 newMap!16)) (array_inv!1018 (_values!1937 newMap!16)) e!34438))))

(declare-fun b!52838 () Bool)

(assert (=> b!52838 (= e!34439 (and e!34435 mapRes!2448))))

(declare-fun condMapEmpty!2447 () Bool)

(declare-fun mapDefault!2447 () ValueCell!786)

(assert (=> b!52838 (= condMapEmpty!2447 (= (arr!1644 (_values!1937 (v!2238 (underlying!162 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!786)) mapDefault!2447)))))

(declare-fun mapIsEmpty!2448 () Bool)

(assert (=> mapIsEmpty!2448 mapRes!2448))

(declare-fun b!52839 () Bool)

(assert (=> b!52839 (= e!34438 (and e!34437 mapRes!2447))))

(declare-fun condMapEmpty!2448 () Bool)

(declare-fun mapDefault!2448 () ValueCell!786)

(assert (=> b!52839 (= condMapEmpty!2448 (= (arr!1644 (_values!1937 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!786)) mapDefault!2448)))))

(declare-fun b!52840 () Bool)

(assert (=> b!52840 (= e!34441 e!34429)))

(declare-fun res!29987 () Bool)

(assert (=> b!52840 (=> (not res!29987) (not e!34429))))

(assert (=> b!52840 (= res!29987 (contains!628 lt!21351 (select (arr!1643 (_keys!3574 (v!2238 (underlying!162 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1866 0))(
  ( (tuple2!1867 (_1!944 Bool) (_2!944 LongMapFixedSize!480)) )
))
(declare-fun lt!21353 () tuple2!1866)

(declare-fun update!40 (LongMapFixedSize!480 (_ BitVec 64) V!2659) tuple2!1866)

(declare-fun get!982 (ValueCell!786 V!2659) V!2659)

(declare-fun dynLambda!271 (Int (_ BitVec 64)) V!2659)

(assert (=> b!52840 (= lt!21353 (update!40 newMap!16 (select (arr!1643 (_keys!3574 (v!2238 (underlying!162 thiss!992)))) from!355) (get!982 (select (arr!1644 (_values!1937 (v!2238 (underlying!162 thiss!992)))) from!355) (dynLambda!271 (defaultEntry!1954 (v!2238 (underlying!162 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!8260 res!29992) b!52822))

(assert (= (and b!52822 res!29988) b!52832))

(assert (= (and b!52832 res!29985) b!52833))

(assert (= (and b!52833 res!29984) b!52828))

(assert (= (and b!52828 res!29993) b!52840))

(assert (= (and b!52840 res!29987) b!52831))

(assert (= (and b!52831 res!29983) b!52835))

(assert (= (and b!52835 res!29986) b!52821))

(assert (= (and b!52821 res!29989) b!52830))

(assert (= (and b!52830 res!29990) b!52824))

(assert (= (and b!52824 res!29991) b!52825))

(assert (= (and b!52838 condMapEmpty!2447) mapIsEmpty!2448))

(assert (= (and b!52838 (not condMapEmpty!2447)) mapNonEmpty!2447))

(get-info :version)

(assert (= (and mapNonEmpty!2447 ((_ is ValueCellFull!786) mapValue!2448)) b!52829))

(assert (= (and b!52838 ((_ is ValueCellFull!786) mapDefault!2447)) b!52827))

(assert (= b!52820 b!52838))

(assert (= b!52834 b!52820))

(assert (= b!52836 b!52834))

(assert (= start!8260 b!52836))

(assert (= (and b!52839 condMapEmpty!2448) mapIsEmpty!2447))

(assert (= (and b!52839 (not condMapEmpty!2448)) mapNonEmpty!2448))

(assert (= (and mapNonEmpty!2448 ((_ is ValueCellFull!786) mapValue!2447)) b!52826))

(assert (= (and b!52839 ((_ is ValueCellFull!786) mapDefault!2448)) b!52823))

(assert (= b!52837 b!52839))

(assert (= start!8260 b!52837))

(declare-fun b_lambda!2353 () Bool)

(assert (=> (not b_lambda!2353) (not b!52840)))

(declare-fun t!4398 () Bool)

(declare-fun tb!1029 () Bool)

(assert (=> (and b!52820 (= (defaultEntry!1954 (v!2238 (underlying!162 thiss!992))) (defaultEntry!1954 (v!2238 (underlying!162 thiss!992)))) t!4398) tb!1029))

(declare-fun result!1941 () Bool)

(assert (=> tb!1029 (= result!1941 tp_is_empty!2259)))

(assert (=> b!52840 t!4398))

(declare-fun b_and!2915 () Bool)

(assert (= b_and!2911 (and (=> t!4398 result!1941) b_and!2915)))

(declare-fun tb!1031 () Bool)

(declare-fun t!4400 () Bool)

(assert (=> (and b!52837 (= (defaultEntry!1954 newMap!16) (defaultEntry!1954 (v!2238 (underlying!162 thiss!992)))) t!4400) tb!1031))

(declare-fun result!1945 () Bool)

(assert (= result!1945 result!1941))

(assert (=> b!52840 t!4400))

(declare-fun b_and!2917 () Bool)

(assert (= b_and!2913 (and (=> t!4400 result!1945) b_and!2917)))

(declare-fun m!45045 () Bool)

(assert (=> b!52831 m!45045))

(declare-fun m!45047 () Bool)

(assert (=> b!52828 m!45047))

(declare-fun m!45049 () Bool)

(assert (=> b!52828 m!45049))

(declare-fun m!45051 () Bool)

(assert (=> b!52828 m!45051))

(declare-fun m!45053 () Bool)

(assert (=> mapNonEmpty!2447 m!45053))

(declare-fun m!45055 () Bool)

(assert (=> b!52821 m!45055))

(declare-fun m!45057 () Bool)

(assert (=> mapNonEmpty!2448 m!45057))

(declare-fun m!45059 () Bool)

(assert (=> start!8260 m!45059))

(declare-fun m!45061 () Bool)

(assert (=> b!52820 m!45061))

(declare-fun m!45063 () Bool)

(assert (=> b!52820 m!45063))

(declare-fun m!45065 () Bool)

(assert (=> b!52830 m!45065))

(assert (=> b!52825 m!45047))

(assert (=> b!52825 m!45047))

(declare-fun m!45067 () Bool)

(assert (=> b!52825 m!45067))

(declare-fun m!45069 () Bool)

(assert (=> b!52837 m!45069))

(declare-fun m!45071 () Bool)

(assert (=> b!52837 m!45071))

(declare-fun m!45073 () Bool)

(assert (=> b!52832 m!45073))

(declare-fun m!45075 () Bool)

(assert (=> b!52840 m!45075))

(declare-fun m!45077 () Bool)

(assert (=> b!52840 m!45077))

(declare-fun m!45079 () Bool)

(assert (=> b!52840 m!45079))

(assert (=> b!52840 m!45047))

(declare-fun m!45081 () Bool)

(assert (=> b!52840 m!45081))

(assert (=> b!52840 m!45047))

(assert (=> b!52840 m!45077))

(assert (=> b!52840 m!45047))

(assert (=> b!52840 m!45079))

(declare-fun m!45083 () Bool)

(assert (=> b!52840 m!45083))

(assert (=> b!52840 m!45075))

(check-sat (not start!8260) b_and!2915 (not b!52840) (not b!52828) (not b!52820) tp_is_empty!2259 (not b!52832) (not mapNonEmpty!2448) (not b!52837) (not mapNonEmpty!2447) (not b!52825) (not b!52821) (not b_lambda!2353) b_and!2917 (not b_next!1687) (not b_next!1685) (not b!52830) (not b!52831))
(check-sat b_and!2915 b_and!2917 (not b_next!1685) (not b_next!1687))
