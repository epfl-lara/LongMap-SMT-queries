; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8334 () Bool)

(assert start!8334)

(declare-fun b!54928 () Bool)

(declare-fun b_free!1825 () Bool)

(declare-fun b_next!1825 () Bool)

(assert (=> b!54928 (= b_free!1825 (not b_next!1825))))

(declare-fun tp!7577 () Bool)

(declare-fun b_and!3189 () Bool)

(assert (=> b!54928 (= tp!7577 b_and!3189)))

(declare-fun b!54932 () Bool)

(declare-fun b_free!1827 () Bool)

(declare-fun b_next!1827 () Bool)

(assert (=> b!54932 (= b_free!1827 (not b_next!1827))))

(declare-fun tp!7578 () Bool)

(declare-fun b_and!3191 () Bool)

(assert (=> b!54932 (= tp!7578 b_and!3191)))

(declare-fun b!54922 () Bool)

(declare-fun e!36003 () Bool)

(declare-fun tp_is_empty!2329 () Bool)

(assert (=> b!54922 (= e!36003 tp_is_empty!2329)))

(declare-fun b!54923 () Bool)

(declare-fun e!36010 () Bool)

(assert (=> b!54923 (= e!36010 tp_is_empty!2329)))

(declare-fun b!54924 () Bool)

(declare-fun e!36008 () Bool)

(declare-fun e!35999 () Bool)

(assert (=> b!54924 (= e!36008 e!35999)))

(declare-fun res!30998 () Bool)

(declare-fun e!36009 () Bool)

(assert (=> start!8334 (=> (not res!30998) (not e!36009))))

(declare-datatypes ((V!2753 0))(
  ( (V!2754 (val!1209 Int)) )
))
(declare-datatypes ((array!3567 0))(
  ( (array!3568 (arr!1706 (Array (_ BitVec 32) (_ BitVec 64))) (size!1935 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!821 0))(
  ( (ValueCellFull!821 (v!2306 V!2753)) (EmptyCell!821) )
))
(declare-datatypes ((array!3569 0))(
  ( (array!3570 (arr!1707 (Array (_ BitVec 32) ValueCell!821)) (size!1936 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!550 0))(
  ( (LongMapFixedSize!551 (defaultEntry!1989 Int) (mask!5842 (_ BitVec 32)) (extraKeys!1880 (_ BitVec 32)) (zeroValue!1907 V!2753) (minValue!1907 V!2753) (_size!324 (_ BitVec 32)) (_keys!3609 array!3567) (_values!1972 array!3569) (_vacant!324 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!368 0))(
  ( (Cell!369 (v!2307 LongMapFixedSize!550)) )
))
(declare-datatypes ((LongMap!368 0))(
  ( (LongMap!369 (underlying!195 Cell!368)) )
))
(declare-fun thiss!992 () LongMap!368)

(declare-fun valid!229 (LongMap!368) Bool)

(assert (=> start!8334 (= res!30998 (valid!229 thiss!992))))

(assert (=> start!8334 e!36009))

(declare-fun e!36004 () Bool)

(assert (=> start!8334 e!36004))

(assert (=> start!8334 true))

(declare-fun e!35995 () Bool)

(assert (=> start!8334 e!35995))

(declare-fun mapNonEmpty!2657 () Bool)

(declare-fun mapRes!2658 () Bool)

(declare-fun tp!7576 () Bool)

(assert (=> mapNonEmpty!2657 (= mapRes!2658 (and tp!7576 e!36003))))

(declare-fun mapKey!2658 () (_ BitVec 32))

(declare-fun mapRest!2657 () (Array (_ BitVec 32) ValueCell!821))

(declare-fun mapValue!2658 () ValueCell!821)

(assert (=> mapNonEmpty!2657 (= (arr!1707 (_values!1972 (v!2307 (underlying!195 thiss!992)))) (store mapRest!2657 mapKey!2658 mapValue!2658))))

(declare-fun b!54925 () Bool)

(declare-fun e!36000 () Bool)

(assert (=> b!54925 (= e!36000 tp_is_empty!2329)))

(declare-fun b!54926 () Bool)

(declare-fun e!36006 () Bool)

(assert (=> b!54926 (= e!36006 tp_is_empty!2329)))

(declare-fun mapIsEmpty!2657 () Bool)

(declare-fun mapRes!2657 () Bool)

(assert (=> mapIsEmpty!2657 mapRes!2657))

(declare-fun mapNonEmpty!2658 () Bool)

(declare-fun tp!7575 () Bool)

(assert (=> mapNonEmpty!2658 (= mapRes!2657 (and tp!7575 e!36010))))

(declare-fun mapRest!2658 () (Array (_ BitVec 32) ValueCell!821))

(declare-fun newMap!16 () LongMapFixedSize!550)

(declare-fun mapValue!2657 () ValueCell!821)

(declare-fun mapKey!2657 () (_ BitVec 32))

(assert (=> mapNonEmpty!2658 (= (arr!1707 (_values!1972 newMap!16)) (store mapRest!2658 mapKey!2657 mapValue!2657))))

(declare-fun b!54927 () Bool)

(declare-fun res!31000 () Bool)

(assert (=> b!54927 (=> (not res!31000) (not e!36009))))

(declare-fun valid!230 (LongMapFixedSize!550) Bool)

(assert (=> b!54927 (= res!31000 (valid!230 newMap!16))))

(declare-fun e!35998 () Bool)

(declare-fun array_inv!1049 (array!3567) Bool)

(declare-fun array_inv!1050 (array!3569) Bool)

(assert (=> b!54928 (= e!35999 (and tp!7577 tp_is_empty!2329 (array_inv!1049 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) (array_inv!1050 (_values!1972 (v!2307 (underlying!195 thiss!992)))) e!35998))))

(declare-fun b!54929 () Bool)

(declare-fun e!36002 () Bool)

(assert (=> b!54929 (= e!36002 true)))

(declare-fun lt!21757 () Bool)

(declare-datatypes ((List!1377 0))(
  ( (Nil!1374) (Cons!1373 (h!1953 (_ BitVec 64)) (t!4571 List!1377)) )
))
(declare-fun arrayNoDuplicates!0 (array!3567 (_ BitVec 32) List!1377) Bool)

(assert (=> b!54929 (= lt!21757 (arrayNoDuplicates!0 (_keys!3609 (v!2307 (underlying!195 thiss!992))) #b00000000000000000000000000000000 Nil!1374))))

(declare-fun b!54930 () Bool)

(assert (=> b!54930 (= e!35998 (and e!36000 mapRes!2658))))

(declare-fun condMapEmpty!2658 () Bool)

(declare-fun mapDefault!2657 () ValueCell!821)

(assert (=> b!54930 (= condMapEmpty!2658 (= (arr!1707 (_values!1972 (v!2307 (underlying!195 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!821)) mapDefault!2657)))))

(declare-fun b!54931 () Bool)

(declare-fun e!36007 () Bool)

(assert (=> b!54931 (= e!36007 (not e!36002))))

(declare-fun res!31001 () Bool)

(assert (=> b!54931 (=> res!31001 e!36002)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54931 (= res!31001 (or (bvsge (size!1935 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1935 (_keys!3609 (v!2307 (underlying!195 thiss!992))))) (bvsgt from!355 (size!1935 (_keys!3609 (v!2307 (underlying!195 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54931 (arrayContainsKey!0 (_keys!3609 (v!2307 (underlying!195 thiss!992))) (select (arr!1706 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1452 0))(
  ( (Unit!1453) )
))
(declare-fun lt!21759 () Unit!1452)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!10 (array!3567 array!3569 (_ BitVec 32) (_ BitVec 32) V!2753 V!2753 (_ BitVec 64) (_ BitVec 32) Int) Unit!1452)

(assert (=> b!54931 (= lt!21759 (lemmaListMapContainsThenArrayContainsFrom!10 (_keys!3609 (v!2307 (underlying!195 thiss!992))) (_values!1972 (v!2307 (underlying!195 thiss!992))) (mask!5842 (v!2307 (underlying!195 thiss!992))) (extraKeys!1880 (v!2307 (underlying!195 thiss!992))) (zeroValue!1907 (v!2307 (underlying!195 thiss!992))) (minValue!1907 (v!2307 (underlying!195 thiss!992))) (select (arr!1706 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1989 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun e!36005 () Bool)

(assert (=> b!54932 (= e!35995 (and tp!7578 tp_is_empty!2329 (array_inv!1049 (_keys!3609 newMap!16)) (array_inv!1050 (_values!1972 newMap!16)) e!36005))))

(declare-fun b!54933 () Bool)

(assert (=> b!54933 (= e!36004 e!36008)))

(declare-fun mapIsEmpty!2658 () Bool)

(assert (=> mapIsEmpty!2658 mapRes!2658))

(declare-fun b!54934 () Bool)

(declare-fun e!35996 () Bool)

(assert (=> b!54934 (= e!35996 e!36007)))

(declare-fun res!30997 () Bool)

(assert (=> b!54934 (=> (not res!30997) (not e!36007))))

(declare-datatypes ((tuple2!1940 0))(
  ( (tuple2!1941 (_1!981 (_ BitVec 64)) (_2!981 V!2753)) )
))
(declare-datatypes ((List!1378 0))(
  ( (Nil!1375) (Cons!1374 (h!1954 tuple2!1940) (t!4572 List!1378)) )
))
(declare-datatypes ((ListLongMap!1301 0))(
  ( (ListLongMap!1302 (toList!666 List!1378)) )
))
(declare-fun lt!21758 () ListLongMap!1301)

(declare-fun contains!643 (ListLongMap!1301 (_ BitVec 64)) Bool)

(assert (=> b!54934 (= res!30997 (contains!643 lt!21758 (select (arr!1706 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1942 0))(
  ( (tuple2!1943 (_1!982 Bool) (_2!982 LongMapFixedSize!550)) )
))
(declare-fun lt!21760 () tuple2!1942)

(declare-fun update!70 (LongMapFixedSize!550 (_ BitVec 64) V!2753) tuple2!1942)

(declare-fun get!1029 (ValueCell!821 V!2753) V!2753)

(declare-fun dynLambda!288 (Int (_ BitVec 64)) V!2753)

(assert (=> b!54934 (= lt!21760 (update!70 newMap!16 (select (arr!1706 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) from!355) (get!1029 (select (arr!1707 (_values!1972 (v!2307 (underlying!195 thiss!992)))) from!355) (dynLambda!288 (defaultEntry!1989 (v!2307 (underlying!195 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54935 () Bool)

(assert (=> b!54935 (= e!36005 (and e!36006 mapRes!2657))))

(declare-fun condMapEmpty!2657 () Bool)

(declare-fun mapDefault!2658 () ValueCell!821)

(assert (=> b!54935 (= condMapEmpty!2657 (= (arr!1707 (_values!1972 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!821)) mapDefault!2658)))))

(declare-fun b!54936 () Bool)

(declare-fun res!31003 () Bool)

(assert (=> b!54936 (=> (not res!31003) (not e!36009))))

(assert (=> b!54936 (= res!31003 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5842 newMap!16)) (_size!324 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun b!54937 () Bool)

(assert (=> b!54937 (= e!36009 e!35996)))

(declare-fun res!30999 () Bool)

(assert (=> b!54937 (=> (not res!30999) (not e!35996))))

(declare-fun lt!21761 () ListLongMap!1301)

(assert (=> b!54937 (= res!30999 (and (= lt!21761 lt!21758) (not (= (select (arr!1706 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1706 (_keys!3609 (v!2307 (underlying!195 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1067 (LongMapFixedSize!550) ListLongMap!1301)

(assert (=> b!54937 (= lt!21758 (map!1067 newMap!16))))

(declare-fun getCurrentListMap!369 (array!3567 array!3569 (_ BitVec 32) (_ BitVec 32) V!2753 V!2753 (_ BitVec 32) Int) ListLongMap!1301)

(assert (=> b!54937 (= lt!21761 (getCurrentListMap!369 (_keys!3609 (v!2307 (underlying!195 thiss!992))) (_values!1972 (v!2307 (underlying!195 thiss!992))) (mask!5842 (v!2307 (underlying!195 thiss!992))) (extraKeys!1880 (v!2307 (underlying!195 thiss!992))) (zeroValue!1907 (v!2307 (underlying!195 thiss!992))) (minValue!1907 (v!2307 (underlying!195 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1989 (v!2307 (underlying!195 thiss!992)))))))

(declare-fun b!54938 () Bool)

(declare-fun res!31002 () Bool)

(assert (=> b!54938 (=> (not res!31002) (not e!36009))))

(assert (=> b!54938 (= res!31002 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1935 (_keys!3609 (v!2307 (underlying!195 thiss!992)))))))))

(assert (= (and start!8334 res!30998) b!54938))

(assert (= (and b!54938 res!31002) b!54927))

(assert (= (and b!54927 res!31000) b!54936))

(assert (= (and b!54936 res!31003) b!54937))

(assert (= (and b!54937 res!30999) b!54934))

(assert (= (and b!54934 res!30997) b!54931))

(assert (= (and b!54931 (not res!31001)) b!54929))

(assert (= (and b!54930 condMapEmpty!2658) mapIsEmpty!2658))

(assert (= (and b!54930 (not condMapEmpty!2658)) mapNonEmpty!2657))

(get-info :version)

(assert (= (and mapNonEmpty!2657 ((_ is ValueCellFull!821) mapValue!2658)) b!54922))

(assert (= (and b!54930 ((_ is ValueCellFull!821) mapDefault!2657)) b!54925))

(assert (= b!54928 b!54930))

(assert (= b!54924 b!54928))

(assert (= b!54933 b!54924))

(assert (= start!8334 b!54933))

(assert (= (and b!54935 condMapEmpty!2657) mapIsEmpty!2657))

(assert (= (and b!54935 (not condMapEmpty!2657)) mapNonEmpty!2658))

(assert (= (and mapNonEmpty!2658 ((_ is ValueCellFull!821) mapValue!2657)) b!54923))

(assert (= (and b!54935 ((_ is ValueCellFull!821) mapDefault!2658)) b!54926))

(assert (= b!54932 b!54935))

(assert (= start!8334 b!54932))

(declare-fun b_lambda!2423 () Bool)

(assert (=> (not b_lambda!2423) (not b!54934)))

(declare-fun t!4568 () Bool)

(declare-fun tb!1169 () Bool)

(assert (=> (and b!54928 (= (defaultEntry!1989 (v!2307 (underlying!195 thiss!992))) (defaultEntry!1989 (v!2307 (underlying!195 thiss!992)))) t!4568) tb!1169))

(declare-fun result!2151 () Bool)

(assert (=> tb!1169 (= result!2151 tp_is_empty!2329)))

(assert (=> b!54934 t!4568))

(declare-fun b_and!3193 () Bool)

(assert (= b_and!3189 (and (=> t!4568 result!2151) b_and!3193)))

(declare-fun t!4570 () Bool)

(declare-fun tb!1171 () Bool)

(assert (=> (and b!54932 (= (defaultEntry!1989 newMap!16) (defaultEntry!1989 (v!2307 (underlying!195 thiss!992)))) t!4570) tb!1171))

(declare-fun result!2155 () Bool)

(assert (= result!2155 result!2151))

(assert (=> b!54934 t!4570))

(declare-fun b_and!3195 () Bool)

(assert (= b_and!3191 (and (=> t!4570 result!2155) b_and!3195)))

(declare-fun m!46303 () Bool)

(assert (=> b!54932 m!46303))

(declare-fun m!46305 () Bool)

(assert (=> b!54932 m!46305))

(declare-fun m!46307 () Bool)

(assert (=> b!54937 m!46307))

(declare-fun m!46309 () Bool)

(assert (=> b!54937 m!46309))

(declare-fun m!46311 () Bool)

(assert (=> b!54937 m!46311))

(declare-fun m!46313 () Bool)

(assert (=> mapNonEmpty!2657 m!46313))

(assert (=> b!54931 m!46307))

(assert (=> b!54931 m!46307))

(declare-fun m!46315 () Bool)

(assert (=> b!54931 m!46315))

(assert (=> b!54931 m!46307))

(declare-fun m!46317 () Bool)

(assert (=> b!54931 m!46317))

(declare-fun m!46319 () Bool)

(assert (=> b!54928 m!46319))

(declare-fun m!46321 () Bool)

(assert (=> b!54928 m!46321))

(declare-fun m!46323 () Bool)

(assert (=> b!54927 m!46323))

(declare-fun m!46325 () Bool)

(assert (=> start!8334 m!46325))

(declare-fun m!46327 () Bool)

(assert (=> mapNonEmpty!2658 m!46327))

(declare-fun m!46329 () Bool)

(assert (=> b!54934 m!46329))

(declare-fun m!46331 () Bool)

(assert (=> b!54934 m!46331))

(declare-fun m!46333 () Bool)

(assert (=> b!54934 m!46333))

(assert (=> b!54934 m!46307))

(declare-fun m!46335 () Bool)

(assert (=> b!54934 m!46335))

(assert (=> b!54934 m!46307))

(assert (=> b!54934 m!46331))

(assert (=> b!54934 m!46307))

(assert (=> b!54934 m!46333))

(declare-fun m!46337 () Bool)

(assert (=> b!54934 m!46337))

(assert (=> b!54934 m!46329))

(declare-fun m!46339 () Bool)

(assert (=> b!54929 m!46339))

(check-sat (not mapNonEmpty!2657) (not start!8334) (not b!54932) (not b!54931) tp_is_empty!2329 (not b_next!1827) (not b!54927) (not b!54929) (not b_next!1825) b_and!3193 b_and!3195 (not b!54928) (not b!54934) (not b_lambda!2423) (not mapNonEmpty!2658) (not b!54937))
(check-sat b_and!3193 b_and!3195 (not b_next!1825) (not b_next!1827))
