; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14572 () Bool)

(assert start!14572)

(declare-fun b!137892 () Bool)

(declare-fun b_free!2953 () Bool)

(declare-fun b_next!2953 () Bool)

(assert (=> b!137892 (= b_free!2953 (not b_next!2953))))

(declare-fun tp!11320 () Bool)

(declare-fun b_and!8521 () Bool)

(assert (=> b!137892 (= tp!11320 b_and!8521)))

(declare-fun b!137895 () Bool)

(declare-fun b_free!2955 () Bool)

(declare-fun b_next!2955 () Bool)

(assert (=> b!137895 (= b_free!2955 (not b_next!2955))))

(declare-fun tp!11322 () Bool)

(declare-fun b_and!8523 () Bool)

(assert (=> b!137895 (= tp!11322 b_and!8523)))

(declare-fun b!137889 () Bool)

(declare-fun e!89741 () Bool)

(declare-fun e!89748 () Bool)

(assert (=> b!137889 (= e!89741 e!89748)))

(declare-fun res!66009 () Bool)

(assert (=> b!137889 (=> (not res!66009) (not e!89748))))

(declare-datatypes ((V!3505 0))(
  ( (V!3506 (val!1491 Int)) )
))
(declare-datatypes ((array!4797 0))(
  ( (array!4798 (arr!2266 (Array (_ BitVec 32) (_ BitVec 64))) (size!2538 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1103 0))(
  ( (ValueCellFull!1103 (v!3230 V!3505)) (EmptyCell!1103) )
))
(declare-datatypes ((array!4799 0))(
  ( (array!4800 (arr!2267 (Array (_ BitVec 32) ValueCell!1103)) (size!2539 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1114 0))(
  ( (LongMapFixedSize!1115 (defaultEntry!2909 Int) (mask!7232 (_ BitVec 32)) (extraKeys!2666 (_ BitVec 32)) (zeroValue!2760 V!3505) (minValue!2760 V!3505) (_size!606 (_ BitVec 32)) (_keys!4665 array!4797) (_values!2892 array!4799) (_vacant!606 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!898 0))(
  ( (Cell!899 (v!3231 LongMapFixedSize!1114)) )
))
(declare-datatypes ((LongMap!898 0))(
  ( (LongMap!899 (underlying!460 Cell!898)) )
))
(declare-fun thiss!992 () LongMap!898)

(declare-datatypes ((tuple2!2610 0))(
  ( (tuple2!2611 (_1!1316 (_ BitVec 64)) (_2!1316 V!3505)) )
))
(declare-datatypes ((List!1720 0))(
  ( (Nil!1717) (Cons!1716 (h!2323 tuple2!2610) (t!6219 List!1720)) )
))
(declare-datatypes ((ListLongMap!1685 0))(
  ( (ListLongMap!1686 (toList!858 List!1720)) )
))
(declare-fun lt!72051 () ListLongMap!1685)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!72048 () ListLongMap!1685)

(assert (=> b!137889 (= res!66009 (and (= lt!72048 lt!72051) (not (= (select (arr!2266 (_keys!4665 (v!3231 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2266 (_keys!4665 (v!3231 (underlying!460 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1114)

(declare-fun map!1402 (LongMapFixedSize!1114) ListLongMap!1685)

(assert (=> b!137889 (= lt!72051 (map!1402 newMap!16))))

(declare-fun getCurrentListMap!524 (array!4797 array!4799 (_ BitVec 32) (_ BitVec 32) V!3505 V!3505 (_ BitVec 32) Int) ListLongMap!1685)

(assert (=> b!137889 (= lt!72048 (getCurrentListMap!524 (_keys!4665 (v!3231 (underlying!460 thiss!992))) (_values!2892 (v!3231 (underlying!460 thiss!992))) (mask!7232 (v!3231 (underlying!460 thiss!992))) (extraKeys!2666 (v!3231 (underlying!460 thiss!992))) (zeroValue!2760 (v!3231 (underlying!460 thiss!992))) (minValue!2760 (v!3231 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2909 (v!3231 (underlying!460 thiss!992)))))))

(declare-fun b!137890 () Bool)

(declare-fun e!89747 () Bool)

(declare-fun e!89737 () Bool)

(declare-fun mapRes!4709 () Bool)

(assert (=> b!137890 (= e!89747 (and e!89737 mapRes!4709))))

(declare-fun condMapEmpty!4709 () Bool)

(declare-fun mapDefault!4709 () ValueCell!1103)

(assert (=> b!137890 (= condMapEmpty!4709 (= (arr!2267 (_values!2892 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1103)) mapDefault!4709)))))

(declare-fun b!137891 () Bool)

(declare-fun e!89739 () Bool)

(declare-fun tp_is_empty!2893 () Bool)

(assert (=> b!137891 (= e!89739 tp_is_empty!2893)))

(declare-fun e!89734 () Bool)

(declare-fun e!89746 () Bool)

(declare-fun array_inv!1445 (array!4797) Bool)

(declare-fun array_inv!1446 (array!4799) Bool)

(assert (=> b!137892 (= e!89734 (and tp!11320 tp_is_empty!2893 (array_inv!1445 (_keys!4665 (v!3231 (underlying!460 thiss!992)))) (array_inv!1446 (_values!2892 (v!3231 (underlying!460 thiss!992)))) e!89746))))

(declare-fun mapIsEmpty!4709 () Bool)

(assert (=> mapIsEmpty!4709 mapRes!4709))

(declare-fun mapNonEmpty!4709 () Bool)

(declare-fun mapRes!4710 () Bool)

(declare-fun tp!11321 () Bool)

(assert (=> mapNonEmpty!4709 (= mapRes!4710 (and tp!11321 e!89739))))

(declare-fun mapValue!4709 () ValueCell!1103)

(declare-fun mapRest!4709 () (Array (_ BitVec 32) ValueCell!1103))

(declare-fun mapKey!4709 () (_ BitVec 32))

(assert (=> mapNonEmpty!4709 (= (arr!2267 (_values!2892 (v!3231 (underlying!460 thiss!992)))) (store mapRest!4709 mapKey!4709 mapValue!4709))))

(declare-fun b!137893 () Bool)

(declare-fun res!66010 () Bool)

(assert (=> b!137893 (=> (not res!66010) (not e!89741))))

(declare-fun valid!539 (LongMapFixedSize!1114) Bool)

(assert (=> b!137893 (= res!66010 (valid!539 newMap!16))))

(declare-fun b!137894 () Bool)

(declare-fun res!66012 () Bool)

(assert (=> b!137894 (=> (not res!66012) (not e!89741))))

(assert (=> b!137894 (= res!66012 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7232 newMap!16)) (_size!606 (v!3231 (underlying!460 thiss!992)))))))

(declare-fun e!89736 () Bool)

(assert (=> b!137895 (= e!89736 (and tp!11322 tp_is_empty!2893 (array_inv!1445 (_keys!4665 newMap!16)) (array_inv!1446 (_values!2892 newMap!16)) e!89747))))

(declare-fun b!137896 () Bool)

(declare-fun e!89742 () Bool)

(assert (=> b!137896 (= e!89742 (not true))))

(declare-fun arrayContainsKey!0 (array!4797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137896 (arrayContainsKey!0 (_keys!4665 (v!3231 (underlying!460 thiss!992))) (select (arr!2266 (_keys!4665 (v!3231 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4348 0))(
  ( (Unit!4349) )
))
(declare-fun lt!72049 () Unit!4348)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!132 (array!4797 array!4799 (_ BitVec 32) (_ BitVec 32) V!3505 V!3505 (_ BitVec 64) (_ BitVec 32) Int) Unit!4348)

(assert (=> b!137896 (= lt!72049 (lemmaListMapContainsThenArrayContainsFrom!132 (_keys!4665 (v!3231 (underlying!460 thiss!992))) (_values!2892 (v!3231 (underlying!460 thiss!992))) (mask!7232 (v!3231 (underlying!460 thiss!992))) (extraKeys!2666 (v!3231 (underlying!460 thiss!992))) (zeroValue!2760 (v!3231 (underlying!460 thiss!992))) (minValue!2760 (v!3231 (underlying!460 thiss!992))) (select (arr!2266 (_keys!4665 (v!3231 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2909 (v!3231 (underlying!460 thiss!992)))))))

(declare-fun mapIsEmpty!4710 () Bool)

(assert (=> mapIsEmpty!4710 mapRes!4710))

(declare-fun mapNonEmpty!4710 () Bool)

(declare-fun tp!11319 () Bool)

(declare-fun e!89743 () Bool)

(assert (=> mapNonEmpty!4710 (= mapRes!4709 (and tp!11319 e!89743))))

(declare-fun mapRest!4710 () (Array (_ BitVec 32) ValueCell!1103))

(declare-fun mapKey!4710 () (_ BitVec 32))

(declare-fun mapValue!4710 () ValueCell!1103)

(assert (=> mapNonEmpty!4710 (= (arr!2267 (_values!2892 newMap!16)) (store mapRest!4710 mapKey!4710 mapValue!4710))))

(declare-fun b!137897 () Bool)

(declare-fun e!89745 () Bool)

(assert (=> b!137897 (= e!89745 tp_is_empty!2893)))

(declare-fun res!66013 () Bool)

(assert (=> start!14572 (=> (not res!66013) (not e!89741))))

(declare-fun valid!540 (LongMap!898) Bool)

(assert (=> start!14572 (= res!66013 (valid!540 thiss!992))))

(assert (=> start!14572 e!89741))

(declare-fun e!89735 () Bool)

(assert (=> start!14572 e!89735))

(assert (=> start!14572 true))

(assert (=> start!14572 e!89736))

(declare-fun b!137898 () Bool)

(declare-fun res!66011 () Bool)

(assert (=> b!137898 (=> (not res!66011) (not e!89741))))

(assert (=> b!137898 (= res!66011 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2538 (_keys!4665 (v!3231 (underlying!460 thiss!992)))))))))

(declare-fun b!137899 () Bool)

(assert (=> b!137899 (= e!89746 (and e!89745 mapRes!4710))))

(declare-fun condMapEmpty!4710 () Bool)

(declare-fun mapDefault!4710 () ValueCell!1103)

(assert (=> b!137899 (= condMapEmpty!4710 (= (arr!2267 (_values!2892 (v!3231 (underlying!460 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1103)) mapDefault!4710)))))

(declare-fun b!137900 () Bool)

(assert (=> b!137900 (= e!89737 tp_is_empty!2893)))

(declare-fun b!137901 () Bool)

(assert (=> b!137901 (= e!89748 e!89742)))

(declare-fun res!66008 () Bool)

(assert (=> b!137901 (=> (not res!66008) (not e!89742))))

(declare-fun contains!897 (ListLongMap!1685 (_ BitVec 64)) Bool)

(assert (=> b!137901 (= res!66008 (contains!897 lt!72051 (select (arr!2266 (_keys!4665 (v!3231 (underlying!460 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2612 0))(
  ( (tuple2!2613 (_1!1317 Bool) (_2!1317 LongMapFixedSize!1114)) )
))
(declare-fun lt!72050 () tuple2!2612)

(declare-fun update!198 (LongMapFixedSize!1114 (_ BitVec 64) V!3505) tuple2!2612)

(declare-fun get!1496 (ValueCell!1103 V!3505) V!3505)

(declare-fun dynLambda!424 (Int (_ BitVec 64)) V!3505)

(assert (=> b!137901 (= lt!72050 (update!198 newMap!16 (select (arr!2266 (_keys!4665 (v!3231 (underlying!460 thiss!992)))) from!355) (get!1496 (select (arr!2267 (_values!2892 (v!3231 (underlying!460 thiss!992)))) from!355) (dynLambda!424 (defaultEntry!2909 (v!3231 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137902 () Bool)

(assert (=> b!137902 (= e!89743 tp_is_empty!2893)))

(declare-fun b!137903 () Bool)

(declare-fun e!89738 () Bool)

(assert (=> b!137903 (= e!89738 e!89734)))

(declare-fun b!137904 () Bool)

(assert (=> b!137904 (= e!89735 e!89738)))

(assert (= (and start!14572 res!66013) b!137898))

(assert (= (and b!137898 res!66011) b!137893))

(assert (= (and b!137893 res!66010) b!137894))

(assert (= (and b!137894 res!66012) b!137889))

(assert (= (and b!137889 res!66009) b!137901))

(assert (= (and b!137901 res!66008) b!137896))

(assert (= (and b!137899 condMapEmpty!4710) mapIsEmpty!4710))

(assert (= (and b!137899 (not condMapEmpty!4710)) mapNonEmpty!4709))

(get-info :version)

(assert (= (and mapNonEmpty!4709 ((_ is ValueCellFull!1103) mapValue!4709)) b!137891))

(assert (= (and b!137899 ((_ is ValueCellFull!1103) mapDefault!4710)) b!137897))

(assert (= b!137892 b!137899))

(assert (= b!137903 b!137892))

(assert (= b!137904 b!137903))

(assert (= start!14572 b!137904))

(assert (= (and b!137890 condMapEmpty!4709) mapIsEmpty!4709))

(assert (= (and b!137890 (not condMapEmpty!4709)) mapNonEmpty!4710))

(assert (= (and mapNonEmpty!4710 ((_ is ValueCellFull!1103) mapValue!4710)) b!137902))

(assert (= (and b!137890 ((_ is ValueCellFull!1103) mapDefault!4709)) b!137900))

(assert (= b!137895 b!137890))

(assert (= start!14572 b!137895))

(declare-fun b_lambda!6167 () Bool)

(assert (=> (not b_lambda!6167) (not b!137901)))

(declare-fun t!6216 () Bool)

(declare-fun tb!2461 () Bool)

(assert (=> (and b!137892 (= (defaultEntry!2909 (v!3231 (underlying!460 thiss!992))) (defaultEntry!2909 (v!3231 (underlying!460 thiss!992)))) t!6216) tb!2461))

(declare-fun result!4051 () Bool)

(assert (=> tb!2461 (= result!4051 tp_is_empty!2893)))

(assert (=> b!137901 t!6216))

(declare-fun b_and!8525 () Bool)

(assert (= b_and!8521 (and (=> t!6216 result!4051) b_and!8525)))

(declare-fun tb!2463 () Bool)

(declare-fun t!6218 () Bool)

(assert (=> (and b!137895 (= (defaultEntry!2909 newMap!16) (defaultEntry!2909 (v!3231 (underlying!460 thiss!992)))) t!6218) tb!2463))

(declare-fun result!4055 () Bool)

(assert (= result!4055 result!4051))

(assert (=> b!137901 t!6218))

(declare-fun b_and!8527 () Bool)

(assert (= b_and!8523 (and (=> t!6218 result!4055) b_and!8527)))

(declare-fun m!164859 () Bool)

(assert (=> b!137896 m!164859))

(assert (=> b!137896 m!164859))

(declare-fun m!164861 () Bool)

(assert (=> b!137896 m!164861))

(assert (=> b!137896 m!164859))

(declare-fun m!164863 () Bool)

(assert (=> b!137896 m!164863))

(declare-fun m!164865 () Bool)

(assert (=> mapNonEmpty!4710 m!164865))

(declare-fun m!164867 () Bool)

(assert (=> b!137893 m!164867))

(declare-fun m!164869 () Bool)

(assert (=> mapNonEmpty!4709 m!164869))

(declare-fun m!164871 () Bool)

(assert (=> b!137892 m!164871))

(declare-fun m!164873 () Bool)

(assert (=> b!137892 m!164873))

(declare-fun m!164875 () Bool)

(assert (=> b!137901 m!164875))

(declare-fun m!164877 () Bool)

(assert (=> b!137901 m!164877))

(declare-fun m!164879 () Bool)

(assert (=> b!137901 m!164879))

(assert (=> b!137901 m!164859))

(declare-fun m!164881 () Bool)

(assert (=> b!137901 m!164881))

(assert (=> b!137901 m!164859))

(assert (=> b!137901 m!164877))

(assert (=> b!137901 m!164859))

(assert (=> b!137901 m!164879))

(declare-fun m!164883 () Bool)

(assert (=> b!137901 m!164883))

(assert (=> b!137901 m!164875))

(assert (=> b!137889 m!164859))

(declare-fun m!164885 () Bool)

(assert (=> b!137889 m!164885))

(declare-fun m!164887 () Bool)

(assert (=> b!137889 m!164887))

(declare-fun m!164889 () Bool)

(assert (=> b!137895 m!164889))

(declare-fun m!164891 () Bool)

(assert (=> b!137895 m!164891))

(declare-fun m!164893 () Bool)

(assert (=> start!14572 m!164893))

(check-sat (not b!137889) (not start!14572) (not b!137896) (not b!137895) (not b_lambda!6167) tp_is_empty!2893 b_and!8527 (not mapNonEmpty!4709) (not b!137901) (not b!137892) (not mapNonEmpty!4710) (not b_next!2955) (not b_next!2953) b_and!8525 (not b!137893))
(check-sat b_and!8525 b_and!8527 (not b_next!2953) (not b_next!2955))
