; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13118 () Bool)

(assert start!13118)

(declare-fun b!114850 () Bool)

(declare-fun b_free!2645 () Bool)

(declare-fun b_next!2645 () Bool)

(assert (=> b!114850 (= b_free!2645 (not b_next!2645))))

(declare-fun tp!10300 () Bool)

(declare-fun b_and!7095 () Bool)

(assert (=> b!114850 (= tp!10300 b_and!7095)))

(declare-fun b!114837 () Bool)

(declare-fun b_free!2647 () Bool)

(declare-fun b_next!2647 () Bool)

(assert (=> b!114837 (= b_free!2647 (not b_next!2647))))

(declare-fun tp!10297 () Bool)

(declare-fun b_and!7097 () Bool)

(assert (=> b!114837 (= tp!10297 b_and!7097)))

(declare-fun b!114835 () Bool)

(declare-datatypes ((Unit!3586 0))(
  ( (Unit!3587) )
))
(declare-fun e!74747 () Unit!3586)

(declare-fun Unit!3588 () Unit!3586)

(assert (=> b!114835 (= e!74747 Unit!3588)))

(declare-fun lt!59873 () Unit!3586)

(declare-datatypes ((V!3299 0))(
  ( (V!3300 (val!1414 Int)) )
))
(declare-datatypes ((array!4481 0))(
  ( (array!4482 (arr!2123 (Array (_ BitVec 32) (_ BitVec 64))) (size!2383 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1026 0))(
  ( (ValueCellFull!1026 (v!2997 V!3299)) (EmptyCell!1026) )
))
(declare-datatypes ((array!4483 0))(
  ( (array!4484 (arr!2124 (Array (_ BitVec 32) ValueCell!1026)) (size!2384 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!960 0))(
  ( (LongMapFixedSize!961 (defaultEntry!2689 Int) (mask!6887 (_ BitVec 32)) (extraKeys!2478 (_ BitVec 32)) (zeroValue!2556 V!3299) (minValue!2556 V!3299) (_size!529 (_ BitVec 32)) (_keys!4411 array!4481) (_values!2672 array!4483) (_vacant!529 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!760 0))(
  ( (Cell!761 (v!2998 LongMapFixedSize!960)) )
))
(declare-datatypes ((LongMap!760 0))(
  ( (LongMap!761 (underlying!391 Cell!760)) )
))
(declare-fun thiss!992 () LongMap!760)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!122 (array!4481 array!4483 (_ BitVec 32) (_ BitVec 32) V!3299 V!3299 (_ BitVec 64) (_ BitVec 32) Int) Unit!3586)

(assert (=> b!114835 (= lt!59873 (lemmaListMapContainsThenArrayContainsFrom!122 (_keys!4411 (v!2998 (underlying!391 thiss!992))) (_values!2672 (v!2998 (underlying!391 thiss!992))) (mask!6887 (v!2998 (underlying!391 thiss!992))) (extraKeys!2478 (v!2998 (underlying!391 thiss!992))) (zeroValue!2556 (v!2998 (underlying!391 thiss!992))) (minValue!2556 (v!2998 (underlying!391 thiss!992))) (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2689 (v!2998 (underlying!391 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114835 (arrayContainsKey!0 (_keys!4411 (v!2998 (underlying!391 thiss!992))) (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59870 () Unit!3586)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4481 (_ BitVec 32) (_ BitVec 32)) Unit!3586)

(assert (=> b!114835 (= lt!59870 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4411 (v!2998 (underlying!391 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1656 0))(
  ( (Nil!1653) (Cons!1652 (h!2252 (_ BitVec 64)) (t!5894 List!1656)) )
))
(declare-fun arrayNoDuplicates!0 (array!4481 (_ BitVec 32) List!1656) Bool)

(assert (=> b!114835 (arrayNoDuplicates!0 (_keys!4411 (v!2998 (underlying!391 thiss!992))) from!355 Nil!1653)))

(declare-fun lt!59868 () Unit!3586)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4481 (_ BitVec 32) (_ BitVec 64) List!1656) Unit!3586)

(assert (=> b!114835 (= lt!59868 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4411 (v!2998 (underlying!391 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355) (Cons!1652 (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355) Nil!1653)))))

(assert (=> b!114835 false))

(declare-fun b!114836 () Bool)

(declare-fun e!74757 () Bool)

(declare-fun e!74756 () Bool)

(declare-fun mapRes!4150 () Bool)

(assert (=> b!114836 (= e!74757 (and e!74756 mapRes!4150))))

(declare-fun condMapEmpty!4150 () Bool)

(declare-fun mapDefault!4149 () ValueCell!1026)

(assert (=> b!114836 (= condMapEmpty!4150 (= (arr!2124 (_values!2672 (v!2998 (underlying!391 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1026)) mapDefault!4149)))))

(declare-fun e!74750 () Bool)

(declare-fun e!74753 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!960)

(declare-fun tp_is_empty!2739 () Bool)

(declare-fun array_inv!1337 (array!4481) Bool)

(declare-fun array_inv!1338 (array!4483) Bool)

(assert (=> b!114837 (= e!74750 (and tp!10297 tp_is_empty!2739 (array_inv!1337 (_keys!4411 newMap!16)) (array_inv!1338 (_values!2672 newMap!16)) e!74753))))

(declare-fun b!114838 () Bool)

(declare-fun e!74746 () Bool)

(assert (=> b!114838 (= e!74746 tp_is_empty!2739)))

(declare-fun b!114839 () Bool)

(declare-fun e!74744 () Bool)

(assert (=> b!114839 (= e!74744 false)))

(declare-fun lt!59871 () Unit!3586)

(assert (=> b!114839 (= lt!59871 e!74747)))

(declare-fun c!20513 () Bool)

(declare-datatypes ((tuple2!2488 0))(
  ( (tuple2!2489 (_1!1255 (_ BitVec 64)) (_2!1255 V!3299)) )
))
(declare-datatypes ((List!1657 0))(
  ( (Nil!1654) (Cons!1653 (h!2253 tuple2!2488) (t!5895 List!1657)) )
))
(declare-datatypes ((ListLongMap!1619 0))(
  ( (ListLongMap!1620 (toList!825 List!1657)) )
))
(declare-fun lt!59872 () ListLongMap!1619)

(declare-fun contains!857 (ListLongMap!1619 (_ BitVec 64)) Bool)

(assert (=> b!114839 (= c!20513 (contains!857 lt!59872 (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2490 0))(
  ( (tuple2!2491 (_1!1256 Bool) (_2!1256 LongMapFixedSize!960)) )
))
(declare-fun lt!59869 () tuple2!2490)

(declare-fun update!173 (LongMapFixedSize!960 (_ BitVec 64) V!3299) tuple2!2490)

(declare-fun get!1382 (ValueCell!1026 V!3299) V!3299)

(declare-fun dynLambda!400 (Int (_ BitVec 64)) V!3299)

(assert (=> b!114839 (= lt!59869 (update!173 newMap!16 (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355) (get!1382 (select (arr!2124 (_values!2672 (v!2998 (underlying!391 thiss!992)))) from!355) (dynLambda!400 (defaultEntry!2689 (v!2998 (underlying!391 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!114840 () Bool)

(declare-fun res!56475 () Bool)

(declare-fun e!74743 () Bool)

(assert (=> b!114840 (=> (not res!56475) (not e!74743))))

(declare-fun valid!452 (LongMapFixedSize!960) Bool)

(assert (=> b!114840 (= res!56475 (valid!452 newMap!16))))

(declare-fun b!114841 () Bool)

(declare-fun e!74752 () Bool)

(assert (=> b!114841 (= e!74752 tp_is_empty!2739)))

(declare-fun b!114842 () Bool)

(declare-fun e!74751 () Bool)

(assert (=> b!114842 (= e!74751 tp_is_empty!2739)))

(declare-fun mapIsEmpty!4149 () Bool)

(assert (=> mapIsEmpty!4149 mapRes!4150))

(declare-fun b!114843 () Bool)

(assert (=> b!114843 (= e!74743 e!74744)))

(declare-fun res!56473 () Bool)

(assert (=> b!114843 (=> (not res!56473) (not e!74744))))

(declare-fun lt!59874 () ListLongMap!1619)

(assert (=> b!114843 (= res!56473 (and (= lt!59874 lt!59872) (not (= (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2123 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1325 (LongMapFixedSize!960) ListLongMap!1619)

(assert (=> b!114843 (= lt!59872 (map!1325 newMap!16))))

(declare-fun getCurrentListMap!508 (array!4481 array!4483 (_ BitVec 32) (_ BitVec 32) V!3299 V!3299 (_ BitVec 32) Int) ListLongMap!1619)

(assert (=> b!114843 (= lt!59874 (getCurrentListMap!508 (_keys!4411 (v!2998 (underlying!391 thiss!992))) (_values!2672 (v!2998 (underlying!391 thiss!992))) (mask!6887 (v!2998 (underlying!391 thiss!992))) (extraKeys!2478 (v!2998 (underlying!391 thiss!992))) (zeroValue!2556 (v!2998 (underlying!391 thiss!992))) (minValue!2556 (v!2998 (underlying!391 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2689 (v!2998 (underlying!391 thiss!992)))))))

(declare-fun b!114834 () Bool)

(assert (=> b!114834 (= e!74756 tp_is_empty!2739)))

(declare-fun res!56476 () Bool)

(assert (=> start!13118 (=> (not res!56476) (not e!74743))))

(declare-fun valid!453 (LongMap!760) Bool)

(assert (=> start!13118 (= res!56476 (valid!453 thiss!992))))

(assert (=> start!13118 e!74743))

(declare-fun e!74754 () Bool)

(assert (=> start!13118 e!74754))

(assert (=> start!13118 true))

(assert (=> start!13118 e!74750))

(declare-fun b!114844 () Bool)

(declare-fun res!56472 () Bool)

(assert (=> b!114844 (=> (not res!56472) (not e!74743))))

(assert (=> b!114844 (= res!56472 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6887 newMap!16)) (_size!529 (v!2998 (underlying!391 thiss!992)))))))

(declare-fun mapIsEmpty!4150 () Bool)

(declare-fun mapRes!4149 () Bool)

(assert (=> mapIsEmpty!4150 mapRes!4149))

(declare-fun b!114845 () Bool)

(declare-fun Unit!3589 () Unit!3586)

(assert (=> b!114845 (= e!74747 Unit!3589)))

(declare-fun b!114846 () Bool)

(declare-fun e!74755 () Bool)

(declare-fun e!74749 () Bool)

(assert (=> b!114846 (= e!74755 e!74749)))

(declare-fun mapNonEmpty!4149 () Bool)

(declare-fun tp!10298 () Bool)

(assert (=> mapNonEmpty!4149 (= mapRes!4150 (and tp!10298 e!74746))))

(declare-fun mapKey!4150 () (_ BitVec 32))

(declare-fun mapRest!4150 () (Array (_ BitVec 32) ValueCell!1026))

(declare-fun mapValue!4150 () ValueCell!1026)

(assert (=> mapNonEmpty!4149 (= (arr!2124 (_values!2672 (v!2998 (underlying!391 thiss!992)))) (store mapRest!4150 mapKey!4150 mapValue!4150))))

(declare-fun b!114847 () Bool)

(assert (=> b!114847 (= e!74753 (and e!74752 mapRes!4149))))

(declare-fun condMapEmpty!4149 () Bool)

(declare-fun mapDefault!4150 () ValueCell!1026)

(assert (=> b!114847 (= condMapEmpty!4149 (= (arr!2124 (_values!2672 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1026)) mapDefault!4150)))))

(declare-fun b!114848 () Bool)

(assert (=> b!114848 (= e!74754 e!74755)))

(declare-fun mapNonEmpty!4150 () Bool)

(declare-fun tp!10299 () Bool)

(assert (=> mapNonEmpty!4150 (= mapRes!4149 (and tp!10299 e!74751))))

(declare-fun mapValue!4149 () ValueCell!1026)

(declare-fun mapKey!4149 () (_ BitVec 32))

(declare-fun mapRest!4149 () (Array (_ BitVec 32) ValueCell!1026))

(assert (=> mapNonEmpty!4150 (= (arr!2124 (_values!2672 newMap!16)) (store mapRest!4149 mapKey!4149 mapValue!4149))))

(declare-fun b!114849 () Bool)

(declare-fun res!56474 () Bool)

(assert (=> b!114849 (=> (not res!56474) (not e!74743))))

(assert (=> b!114849 (= res!56474 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2383 (_keys!4411 (v!2998 (underlying!391 thiss!992)))))))))

(assert (=> b!114850 (= e!74749 (and tp!10300 tp_is_empty!2739 (array_inv!1337 (_keys!4411 (v!2998 (underlying!391 thiss!992)))) (array_inv!1338 (_values!2672 (v!2998 (underlying!391 thiss!992)))) e!74757))))

(assert (= (and start!13118 res!56476) b!114849))

(assert (= (and b!114849 res!56474) b!114840))

(assert (= (and b!114840 res!56475) b!114844))

(assert (= (and b!114844 res!56472) b!114843))

(assert (= (and b!114843 res!56473) b!114839))

(assert (= (and b!114839 c!20513) b!114835))

(assert (= (and b!114839 (not c!20513)) b!114845))

(assert (= (and b!114836 condMapEmpty!4150) mapIsEmpty!4149))

(assert (= (and b!114836 (not condMapEmpty!4150)) mapNonEmpty!4149))

(get-info :version)

(assert (= (and mapNonEmpty!4149 ((_ is ValueCellFull!1026) mapValue!4150)) b!114838))

(assert (= (and b!114836 ((_ is ValueCellFull!1026) mapDefault!4149)) b!114834))

(assert (= b!114850 b!114836))

(assert (= b!114846 b!114850))

(assert (= b!114848 b!114846))

(assert (= start!13118 b!114848))

(assert (= (and b!114847 condMapEmpty!4149) mapIsEmpty!4150))

(assert (= (and b!114847 (not condMapEmpty!4149)) mapNonEmpty!4150))

(assert (= (and mapNonEmpty!4150 ((_ is ValueCellFull!1026) mapValue!4149)) b!114842))

(assert (= (and b!114847 ((_ is ValueCellFull!1026) mapDefault!4150)) b!114841))

(assert (= b!114837 b!114847))

(assert (= start!13118 b!114837))

(declare-fun b_lambda!5133 () Bool)

(assert (=> (not b_lambda!5133) (not b!114839)))

(declare-fun t!5891 () Bool)

(declare-fun tb!2201 () Bool)

(assert (=> (and b!114850 (= (defaultEntry!2689 (v!2998 (underlying!391 thiss!992))) (defaultEntry!2689 (v!2998 (underlying!391 thiss!992)))) t!5891) tb!2201))

(declare-fun result!3673 () Bool)

(assert (=> tb!2201 (= result!3673 tp_is_empty!2739)))

(assert (=> b!114839 t!5891))

(declare-fun b_and!7099 () Bool)

(assert (= b_and!7095 (and (=> t!5891 result!3673) b_and!7099)))

(declare-fun tb!2203 () Bool)

(declare-fun t!5893 () Bool)

(assert (=> (and b!114837 (= (defaultEntry!2689 newMap!16) (defaultEntry!2689 (v!2998 (underlying!391 thiss!992)))) t!5893) tb!2203))

(declare-fun result!3677 () Bool)

(assert (= result!3677 result!3673))

(assert (=> b!114839 t!5893))

(declare-fun b_and!7101 () Bool)

(assert (= b_and!7097 (and (=> t!5893 result!3677) b_and!7101)))

(declare-fun m!131197 () Bool)

(assert (=> start!13118 m!131197))

(declare-fun m!131199 () Bool)

(assert (=> mapNonEmpty!4150 m!131199))

(declare-fun m!131201 () Bool)

(assert (=> b!114850 m!131201))

(declare-fun m!131203 () Bool)

(assert (=> b!114850 m!131203))

(declare-fun m!131205 () Bool)

(assert (=> mapNonEmpty!4149 m!131205))

(declare-fun m!131207 () Bool)

(assert (=> b!114839 m!131207))

(declare-fun m!131209 () Bool)

(assert (=> b!114839 m!131209))

(declare-fun m!131211 () Bool)

(assert (=> b!114839 m!131211))

(declare-fun m!131213 () Bool)

(assert (=> b!114839 m!131213))

(declare-fun m!131215 () Bool)

(assert (=> b!114839 m!131215))

(assert (=> b!114839 m!131213))

(assert (=> b!114839 m!131209))

(assert (=> b!114839 m!131213))

(assert (=> b!114839 m!131211))

(declare-fun m!131217 () Bool)

(assert (=> b!114839 m!131217))

(assert (=> b!114839 m!131207))

(declare-fun m!131219 () Bool)

(assert (=> b!114837 m!131219))

(declare-fun m!131221 () Bool)

(assert (=> b!114837 m!131221))

(assert (=> b!114843 m!131213))

(declare-fun m!131223 () Bool)

(assert (=> b!114843 m!131223))

(declare-fun m!131225 () Bool)

(assert (=> b!114843 m!131225))

(declare-fun m!131227 () Bool)

(assert (=> b!114835 m!131227))

(declare-fun m!131229 () Bool)

(assert (=> b!114835 m!131229))

(assert (=> b!114835 m!131213))

(declare-fun m!131231 () Bool)

(assert (=> b!114835 m!131231))

(assert (=> b!114835 m!131213))

(assert (=> b!114835 m!131213))

(declare-fun m!131233 () Bool)

(assert (=> b!114835 m!131233))

(assert (=> b!114835 m!131213))

(declare-fun m!131235 () Bool)

(assert (=> b!114835 m!131235))

(declare-fun m!131237 () Bool)

(assert (=> b!114840 m!131237))

(check-sat (not b!114840) (not b!114850) (not b!114835) (not b!114837) (not start!13118) b_and!7099 b_and!7101 (not b_next!2645) (not mapNonEmpty!4149) (not mapNonEmpty!4150) (not b_lambda!5133) (not b!114839) (not b!114843) (not b_next!2647) tp_is_empty!2739)
(check-sat b_and!7099 b_and!7101 (not b_next!2645) (not b_next!2647))
