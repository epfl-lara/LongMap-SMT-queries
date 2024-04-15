; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8334 () Bool)

(assert start!8334)

(declare-fun b!54918 () Bool)

(declare-fun b_free!1825 () Bool)

(declare-fun b_next!1825 () Bool)

(assert (=> b!54918 (= b_free!1825 (not b_next!1825))))

(declare-fun tp!7577 () Bool)

(declare-fun b_and!3193 () Bool)

(assert (=> b!54918 (= tp!7577 b_and!3193)))

(declare-fun b!54916 () Bool)

(declare-fun b_free!1827 () Bool)

(declare-fun b_next!1827 () Bool)

(assert (=> b!54916 (= b_free!1827 (not b_next!1827))))

(declare-fun tp!7575 () Bool)

(declare-fun b_and!3195 () Bool)

(assert (=> b!54916 (= tp!7575 b_and!3195)))

(declare-fun b!54913 () Bool)

(declare-fun e!35999 () Bool)

(declare-fun e!35990 () Bool)

(assert (=> b!54913 (= e!35999 e!35990)))

(declare-fun b!54914 () Bool)

(declare-fun res!31005 () Bool)

(declare-fun e!35995 () Bool)

(assert (=> b!54914 (=> (not res!31005) (not e!35995))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2753 0))(
  ( (V!2754 (val!1209 Int)) )
))
(declare-datatypes ((array!3561 0))(
  ( (array!3562 (arr!1702 (Array (_ BitVec 32) (_ BitVec 64))) (size!1932 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!821 0))(
  ( (ValueCellFull!821 (v!2300 V!2753)) (EmptyCell!821) )
))
(declare-datatypes ((array!3563 0))(
  ( (array!3564 (arr!1703 (Array (_ BitVec 32) ValueCell!821)) (size!1933 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!550 0))(
  ( (LongMapFixedSize!551 (defaultEntry!1989 Int) (mask!5841 (_ BitVec 32)) (extraKeys!1880 (_ BitVec 32)) (zeroValue!1907 V!2753) (minValue!1907 V!2753) (_size!324 (_ BitVec 32)) (_keys!3608 array!3561) (_values!1972 array!3563) (_vacant!324 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!362 0))(
  ( (Cell!363 (v!2301 LongMapFixedSize!550)) )
))
(declare-datatypes ((LongMap!362 0))(
  ( (LongMap!363 (underlying!192 Cell!362)) )
))
(declare-fun thiss!992 () LongMap!362)

(assert (=> b!54914 (= res!31005 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1932 (_keys!3608 (v!2301 (underlying!192 thiss!992)))))))))

(declare-fun b!54915 () Bool)

(declare-fun e!35991 () Bool)

(declare-fun tp_is_empty!2329 () Bool)

(assert (=> b!54915 (= e!35991 tp_is_empty!2329)))

(declare-fun newMap!16 () LongMapFixedSize!550)

(declare-fun e!36002 () Bool)

(declare-fun e!35997 () Bool)

(declare-fun array_inv!1047 (array!3561) Bool)

(declare-fun array_inv!1048 (array!3563) Bool)

(assert (=> b!54916 (= e!36002 (and tp!7575 tp_is_empty!2329 (array_inv!1047 (_keys!3608 newMap!16)) (array_inv!1048 (_values!1972 newMap!16)) e!35997))))

(declare-fun mapIsEmpty!2657 () Bool)

(declare-fun mapRes!2658 () Bool)

(assert (=> mapIsEmpty!2657 mapRes!2658))

(declare-fun b!54917 () Bool)

(declare-fun e!35993 () Bool)

(declare-fun e!35992 () Bool)

(assert (=> b!54917 (= e!35993 (not e!35992))))

(declare-fun res!31007 () Bool)

(assert (=> b!54917 (=> res!31007 e!35992)))

(assert (=> b!54917 (= res!31007 (or (bvsge (size!1932 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1932 (_keys!3608 (v!2301 (underlying!192 thiss!992))))) (bvsgt from!355 (size!1932 (_keys!3608 (v!2301 (underlying!192 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54917 (arrayContainsKey!0 (_keys!3608 (v!2301 (underlying!192 thiss!992))) (select (arr!1702 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1442 0))(
  ( (Unit!1443) )
))
(declare-fun lt!21786 () Unit!1442)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!8 (array!3561 array!3563 (_ BitVec 32) (_ BitVec 32) V!2753 V!2753 (_ BitVec 64) (_ BitVec 32) Int) Unit!1442)

(assert (=> b!54917 (= lt!21786 (lemmaListMapContainsThenArrayContainsFrom!8 (_keys!3608 (v!2301 (underlying!192 thiss!992))) (_values!1972 (v!2301 (underlying!192 thiss!992))) (mask!5841 (v!2301 (underlying!192 thiss!992))) (extraKeys!1880 (v!2301 (underlying!192 thiss!992))) (zeroValue!1907 (v!2301 (underlying!192 thiss!992))) (minValue!1907 (v!2301 (underlying!192 thiss!992))) (select (arr!1702 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1989 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun res!31002 () Bool)

(assert (=> start!8334 (=> (not res!31002) (not e!35995))))

(declare-fun valid!217 (LongMap!362) Bool)

(assert (=> start!8334 (= res!31002 (valid!217 thiss!992))))

(assert (=> start!8334 e!35995))

(declare-fun e!35998 () Bool)

(assert (=> start!8334 e!35998))

(assert (=> start!8334 true))

(assert (=> start!8334 e!36002))

(declare-fun e!35996 () Bool)

(assert (=> b!54918 (= e!35990 (and tp!7577 tp_is_empty!2329 (array_inv!1047 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) (array_inv!1048 (_values!1972 (v!2301 (underlying!192 thiss!992)))) e!35996))))

(declare-fun b!54919 () Bool)

(assert (=> b!54919 (= e!35992 true)))

(declare-fun lt!21787 () Bool)

(declare-datatypes ((List!1391 0))(
  ( (Nil!1388) (Cons!1387 (h!1967 (_ BitVec 64)) (t!4584 List!1391)) )
))
(declare-fun arrayNoDuplicates!0 (array!3561 (_ BitVec 32) List!1391) Bool)

(assert (=> b!54919 (= lt!21787 (arrayNoDuplicates!0 (_keys!3608 (v!2301 (underlying!192 thiss!992))) #b00000000000000000000000000000000 Nil!1388))))

(declare-fun b!54920 () Bool)

(declare-fun e!36000 () Bool)

(assert (=> b!54920 (= e!36000 tp_is_empty!2329)))

(declare-fun b!54921 () Bool)

(assert (=> b!54921 (= e!35998 e!35999)))

(declare-fun b!54922 () Bool)

(declare-fun res!31004 () Bool)

(assert (=> b!54922 (=> (not res!31004) (not e!35995))))

(declare-fun valid!218 (LongMapFixedSize!550) Bool)

(assert (=> b!54922 (= res!31004 (valid!218 newMap!16))))

(declare-fun b!54923 () Bool)

(declare-fun e!36001 () Bool)

(assert (=> b!54923 (= e!36001 e!35993)))

(declare-fun res!31008 () Bool)

(assert (=> b!54923 (=> (not res!31008) (not e!35993))))

(declare-datatypes ((tuple2!1958 0))(
  ( (tuple2!1959 (_1!990 (_ BitVec 64)) (_2!990 V!2753)) )
))
(declare-datatypes ((List!1392 0))(
  ( (Nil!1389) (Cons!1388 (h!1968 tuple2!1958) (t!4585 List!1392)) )
))
(declare-datatypes ((ListLongMap!1315 0))(
  ( (ListLongMap!1316 (toList!673 List!1392)) )
))
(declare-fun lt!21784 () ListLongMap!1315)

(declare-fun contains!647 (ListLongMap!1315 (_ BitVec 64)) Bool)

(assert (=> b!54923 (= res!31008 (contains!647 lt!21784 (select (arr!1702 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1960 0))(
  ( (tuple2!1961 (_1!991 Bool) (_2!991 LongMapFixedSize!550)) )
))
(declare-fun lt!21788 () tuple2!1960)

(declare-fun update!66 (LongMapFixedSize!550 (_ BitVec 64) V!2753) tuple2!1960)

(declare-fun get!1028 (ValueCell!821 V!2753) V!2753)

(declare-fun dynLambda!290 (Int (_ BitVec 64)) V!2753)

(assert (=> b!54923 (= lt!21788 (update!66 newMap!16 (select (arr!1702 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) from!355) (get!1028 (select (arr!1703 (_values!1972 (v!2301 (underlying!192 thiss!992)))) from!355) (dynLambda!290 (defaultEntry!1989 (v!2301 (underlying!192 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!2657 () Bool)

(declare-fun mapRes!2657 () Bool)

(declare-fun tp!7576 () Bool)

(assert (=> mapNonEmpty!2657 (= mapRes!2657 (and tp!7576 e!36000))))

(declare-fun mapKey!2657 () (_ BitVec 32))

(declare-fun mapRest!2658 () (Array (_ BitVec 32) ValueCell!821))

(declare-fun mapValue!2658 () ValueCell!821)

(assert (=> mapNonEmpty!2657 (= (arr!1703 (_values!1972 (v!2301 (underlying!192 thiss!992)))) (store mapRest!2658 mapKey!2657 mapValue!2658))))

(declare-fun b!54924 () Bool)

(declare-fun e!36003 () Bool)

(assert (=> b!54924 (= e!36003 tp_is_empty!2329)))

(declare-fun mapIsEmpty!2658 () Bool)

(assert (=> mapIsEmpty!2658 mapRes!2657))

(declare-fun b!54925 () Bool)

(assert (=> b!54925 (= e!35995 e!36001)))

(declare-fun res!31006 () Bool)

(assert (=> b!54925 (=> (not res!31006) (not e!36001))))

(declare-fun lt!21785 () ListLongMap!1315)

(assert (=> b!54925 (= res!31006 (and (= lt!21785 lt!21784) (not (= (select (arr!1702 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1702 (_keys!3608 (v!2301 (underlying!192 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1065 (LongMapFixedSize!550) ListLongMap!1315)

(assert (=> b!54925 (= lt!21784 (map!1065 newMap!16))))

(declare-fun getCurrentListMap!373 (array!3561 array!3563 (_ BitVec 32) (_ BitVec 32) V!2753 V!2753 (_ BitVec 32) Int) ListLongMap!1315)

(assert (=> b!54925 (= lt!21785 (getCurrentListMap!373 (_keys!3608 (v!2301 (underlying!192 thiss!992))) (_values!1972 (v!2301 (underlying!192 thiss!992))) (mask!5841 (v!2301 (underlying!192 thiss!992))) (extraKeys!1880 (v!2301 (underlying!192 thiss!992))) (zeroValue!1907 (v!2301 (underlying!192 thiss!992))) (minValue!1907 (v!2301 (underlying!192 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1989 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun b!54926 () Bool)

(declare-fun e!36004 () Bool)

(assert (=> b!54926 (= e!36004 tp_is_empty!2329)))

(declare-fun b!54927 () Bool)

(declare-fun res!31003 () Bool)

(assert (=> b!54927 (=> (not res!31003) (not e!35995))))

(assert (=> b!54927 (= res!31003 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5841 newMap!16)) (_size!324 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun b!54928 () Bool)

(assert (=> b!54928 (= e!35996 (and e!36004 mapRes!2657))))

(declare-fun condMapEmpty!2658 () Bool)

(declare-fun mapDefault!2657 () ValueCell!821)

(assert (=> b!54928 (= condMapEmpty!2658 (= (arr!1703 (_values!1972 (v!2301 (underlying!192 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!821)) mapDefault!2657)))))

(declare-fun b!54929 () Bool)

(assert (=> b!54929 (= e!35997 (and e!36003 mapRes!2658))))

(declare-fun condMapEmpty!2657 () Bool)

(declare-fun mapDefault!2658 () ValueCell!821)

(assert (=> b!54929 (= condMapEmpty!2657 (= (arr!1703 (_values!1972 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!821)) mapDefault!2658)))))

(declare-fun mapNonEmpty!2658 () Bool)

(declare-fun tp!7578 () Bool)

(assert (=> mapNonEmpty!2658 (= mapRes!2658 (and tp!7578 e!35991))))

(declare-fun mapKey!2658 () (_ BitVec 32))

(declare-fun mapValue!2657 () ValueCell!821)

(declare-fun mapRest!2657 () (Array (_ BitVec 32) ValueCell!821))

(assert (=> mapNonEmpty!2658 (= (arr!1703 (_values!1972 newMap!16)) (store mapRest!2657 mapKey!2658 mapValue!2657))))

(assert (= (and start!8334 res!31002) b!54914))

(assert (= (and b!54914 res!31005) b!54922))

(assert (= (and b!54922 res!31004) b!54927))

(assert (= (and b!54927 res!31003) b!54925))

(assert (= (and b!54925 res!31006) b!54923))

(assert (= (and b!54923 res!31008) b!54917))

(assert (= (and b!54917 (not res!31007)) b!54919))

(assert (= (and b!54928 condMapEmpty!2658) mapIsEmpty!2658))

(assert (= (and b!54928 (not condMapEmpty!2658)) mapNonEmpty!2657))

(get-info :version)

(assert (= (and mapNonEmpty!2657 ((_ is ValueCellFull!821) mapValue!2658)) b!54920))

(assert (= (and b!54928 ((_ is ValueCellFull!821) mapDefault!2657)) b!54926))

(assert (= b!54918 b!54928))

(assert (= b!54913 b!54918))

(assert (= b!54921 b!54913))

(assert (= start!8334 b!54921))

(assert (= (and b!54929 condMapEmpty!2657) mapIsEmpty!2657))

(assert (= (and b!54929 (not condMapEmpty!2657)) mapNonEmpty!2658))

(assert (= (and mapNonEmpty!2658 ((_ is ValueCellFull!821) mapValue!2657)) b!54915))

(assert (= (and b!54929 ((_ is ValueCellFull!821) mapDefault!2658)) b!54924))

(assert (= b!54916 b!54929))

(assert (= start!8334 b!54916))

(declare-fun b_lambda!2427 () Bool)

(assert (=> (not b_lambda!2427) (not b!54923)))

(declare-fun t!4581 () Bool)

(declare-fun tb!1169 () Bool)

(assert (=> (and b!54918 (= (defaultEntry!1989 (v!2301 (underlying!192 thiss!992))) (defaultEntry!1989 (v!2301 (underlying!192 thiss!992)))) t!4581) tb!1169))

(declare-fun result!2151 () Bool)

(assert (=> tb!1169 (= result!2151 tp_is_empty!2329)))

(assert (=> b!54923 t!4581))

(declare-fun b_and!3197 () Bool)

(assert (= b_and!3193 (and (=> t!4581 result!2151) b_and!3197)))

(declare-fun tb!1171 () Bool)

(declare-fun t!4583 () Bool)

(assert (=> (and b!54916 (= (defaultEntry!1989 newMap!16) (defaultEntry!1989 (v!2301 (underlying!192 thiss!992)))) t!4583) tb!1171))

(declare-fun result!2155 () Bool)

(assert (= result!2155 result!2151))

(assert (=> b!54923 t!4583))

(declare-fun b_and!3199 () Bool)

(assert (= b_and!3195 (and (=> t!4583 result!2155) b_and!3199)))

(declare-fun m!46345 () Bool)

(assert (=> mapNonEmpty!2658 m!46345))

(declare-fun m!46347 () Bool)

(assert (=> start!8334 m!46347))

(declare-fun m!46349 () Bool)

(assert (=> b!54919 m!46349))

(declare-fun m!46351 () Bool)

(assert (=> b!54925 m!46351))

(declare-fun m!46353 () Bool)

(assert (=> b!54925 m!46353))

(declare-fun m!46355 () Bool)

(assert (=> b!54925 m!46355))

(declare-fun m!46357 () Bool)

(assert (=> b!54916 m!46357))

(declare-fun m!46359 () Bool)

(assert (=> b!54916 m!46359))

(declare-fun m!46361 () Bool)

(assert (=> b!54923 m!46361))

(declare-fun m!46363 () Bool)

(assert (=> b!54923 m!46363))

(declare-fun m!46365 () Bool)

(assert (=> b!54923 m!46365))

(assert (=> b!54923 m!46351))

(assert (=> b!54923 m!46351))

(declare-fun m!46367 () Bool)

(assert (=> b!54923 m!46367))

(assert (=> b!54923 m!46363))

(assert (=> b!54923 m!46351))

(assert (=> b!54923 m!46365))

(declare-fun m!46369 () Bool)

(assert (=> b!54923 m!46369))

(assert (=> b!54923 m!46361))

(declare-fun m!46371 () Bool)

(assert (=> mapNonEmpty!2657 m!46371))

(assert (=> b!54917 m!46351))

(assert (=> b!54917 m!46351))

(declare-fun m!46373 () Bool)

(assert (=> b!54917 m!46373))

(assert (=> b!54917 m!46351))

(declare-fun m!46375 () Bool)

(assert (=> b!54917 m!46375))

(declare-fun m!46377 () Bool)

(assert (=> b!54922 m!46377))

(declare-fun m!46379 () Bool)

(assert (=> b!54918 m!46379))

(declare-fun m!46381 () Bool)

(assert (=> b!54918 m!46381))

(check-sat (not start!8334) (not b!54919) (not b!54922) (not b!54925) (not b!54917) (not b!54918) b_and!3199 (not mapNonEmpty!2657) (not b!54916) b_and!3197 (not b!54923) tp_is_empty!2329 (not b_lambda!2427) (not b_next!1825) (not b_next!1827) (not mapNonEmpty!2658))
(check-sat b_and!3197 b_and!3199 (not b_next!1825) (not b_next!1827))
