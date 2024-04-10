; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14576 () Bool)

(assert start!14576)

(declare-fun b!137690 () Bool)

(declare-fun b_free!2969 () Bool)

(declare-fun b_next!2969 () Bool)

(assert (=> b!137690 (= b_free!2969 (not b_next!2969))))

(declare-fun tp!11369 () Bool)

(declare-fun b_and!8547 () Bool)

(assert (=> b!137690 (= tp!11369 b_and!8547)))

(declare-fun b!137694 () Bool)

(declare-fun b_free!2971 () Bool)

(declare-fun b_next!2971 () Bool)

(assert (=> b!137694 (= b_free!2971 (not b_next!2971))))

(declare-fun tp!11367 () Bool)

(declare-fun b_and!8549 () Bool)

(assert (=> b!137694 (= tp!11367 b_and!8549)))

(declare-fun b!137685 () Bool)

(declare-fun e!89690 () Bool)

(declare-fun tp_is_empty!2901 () Bool)

(assert (=> b!137685 (= e!89690 tp_is_empty!2901)))

(declare-fun b!137686 () Bool)

(declare-fun e!89689 () Bool)

(assert (=> b!137686 (= e!89689 tp_is_empty!2901)))

(declare-fun mapNonEmpty!4733 () Bool)

(declare-fun mapRes!4734 () Bool)

(declare-fun tp!11370 () Bool)

(declare-fun e!89695 () Bool)

(assert (=> mapNonEmpty!4733 (= mapRes!4734 (and tp!11370 e!89695))))

(declare-datatypes ((V!3515 0))(
  ( (V!3516 (val!1495 Int)) )
))
(declare-datatypes ((array!4833 0))(
  ( (array!4834 (arr!2285 (Array (_ BitVec 32) (_ BitVec 64))) (size!2556 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1107 0))(
  ( (ValueCellFull!1107 (v!3242 V!3515)) (EmptyCell!1107) )
))
(declare-datatypes ((array!4835 0))(
  ( (array!4836 (arr!2286 (Array (_ BitVec 32) ValueCell!1107)) (size!2557 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1122 0))(
  ( (LongMapFixedSize!1123 (defaultEntry!2913 Int) (mask!7239 (_ BitVec 32)) (extraKeys!2670 (_ BitVec 32)) (zeroValue!2764 V!3515) (minValue!2764 V!3515) (_size!610 (_ BitVec 32)) (_keys!4670 array!4833) (_values!2896 array!4835) (_vacant!610 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1122)

(declare-fun mapValue!4733 () ValueCell!1107)

(declare-fun mapKey!4733 () (_ BitVec 32))

(declare-fun mapRest!4734 () (Array (_ BitVec 32) ValueCell!1107))

(assert (=> mapNonEmpty!4733 (= (arr!2286 (_values!2896 newMap!16)) (store mapRest!4734 mapKey!4733 mapValue!4733))))

(declare-fun mapNonEmpty!4734 () Bool)

(declare-fun mapRes!4733 () Bool)

(declare-fun tp!11368 () Bool)

(declare-fun e!89697 () Bool)

(assert (=> mapNonEmpty!4734 (= mapRes!4733 (and tp!11368 e!89697))))

(declare-datatypes ((Cell!910 0))(
  ( (Cell!911 (v!3243 LongMapFixedSize!1122)) )
))
(declare-datatypes ((LongMap!910 0))(
  ( (LongMap!911 (underlying!466 Cell!910)) )
))
(declare-fun thiss!992 () LongMap!910)

(declare-fun mapKey!4734 () (_ BitVec 32))

(declare-fun mapValue!4734 () ValueCell!1107)

(declare-fun mapRest!4733 () (Array (_ BitVec 32) ValueCell!1107))

(assert (=> mapNonEmpty!4734 (= (arr!2286 (_values!2896 (v!3243 (underlying!466 thiss!992)))) (store mapRest!4733 mapKey!4734 mapValue!4734))))

(declare-fun b!137687 () Bool)

(declare-fun res!65992 () Bool)

(declare-fun e!89699 () Bool)

(assert (=> b!137687 (=> (not res!65992) (not e!89699))))

(assert (=> b!137687 (= res!65992 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7239 newMap!16)) (_size!610 (v!3243 (underlying!466 thiss!992)))))))

(declare-fun b!137688 () Bool)

(declare-fun e!89694 () Bool)

(assert (=> b!137688 (= e!89694 (and e!89689 mapRes!4734))))

(declare-fun condMapEmpty!4733 () Bool)

(declare-fun mapDefault!4733 () ValueCell!1107)

(assert (=> b!137688 (= condMapEmpty!4733 (= (arr!2286 (_values!2896 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1107)) mapDefault!4733)))))

(declare-fun e!89698 () Bool)

(declare-fun e!89692 () Bool)

(declare-fun array_inv!1437 (array!4833) Bool)

(declare-fun array_inv!1438 (array!4835) Bool)

(assert (=> b!137690 (= e!89698 (and tp!11369 tp_is_empty!2901 (array_inv!1437 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) (array_inv!1438 (_values!2896 (v!3243 (underlying!466 thiss!992)))) e!89692))))

(declare-fun b!137691 () Bool)

(declare-fun e!89700 () Bool)

(assert (=> b!137691 (= e!89700 (not (or (bvsge (size!2556 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!2556 (_keys!4670 (v!3243 (underlying!466 thiss!992))))))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!4833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137691 (arrayContainsKey!0 (_keys!4670 (v!3243 (underlying!466 thiss!992))) (select (arr!2285 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4338 0))(
  ( (Unit!4339) )
))
(declare-fun lt!71992 () Unit!4338)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!132 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3515 V!3515 (_ BitVec 64) (_ BitVec 32) Int) Unit!4338)

(assert (=> b!137691 (= lt!71992 (lemmaListMapContainsThenArrayContainsFrom!132 (_keys!4670 (v!3243 (underlying!466 thiss!992))) (_values!2896 (v!3243 (underlying!466 thiss!992))) (mask!7239 (v!3243 (underlying!466 thiss!992))) (extraKeys!2670 (v!3243 (underlying!466 thiss!992))) (zeroValue!2764 (v!3243 (underlying!466 thiss!992))) (minValue!2764 (v!3243 (underlying!466 thiss!992))) (select (arr!2285 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2913 (v!3243 (underlying!466 thiss!992)))))))

(declare-fun mapIsEmpty!4733 () Bool)

(assert (=> mapIsEmpty!4733 mapRes!4734))

(declare-fun mapIsEmpty!4734 () Bool)

(assert (=> mapIsEmpty!4734 mapRes!4733))

(declare-fun b!137692 () Bool)

(assert (=> b!137692 (= e!89692 (and e!89690 mapRes!4733))))

(declare-fun condMapEmpty!4734 () Bool)

(declare-fun mapDefault!4734 () ValueCell!1107)

(assert (=> b!137692 (= condMapEmpty!4734 (= (arr!2286 (_values!2896 (v!3243 (underlying!466 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1107)) mapDefault!4734)))))

(declare-fun b!137693 () Bool)

(declare-fun e!89688 () Bool)

(assert (=> b!137693 (= e!89688 e!89700)))

(declare-fun res!65993 () Bool)

(assert (=> b!137693 (=> (not res!65993) (not e!89700))))

(declare-datatypes ((tuple2!2660 0))(
  ( (tuple2!2661 (_1!1341 (_ BitVec 64)) (_2!1341 V!3515)) )
))
(declare-datatypes ((List!1729 0))(
  ( (Nil!1726) (Cons!1725 (h!2332 tuple2!2660) (t!6249 List!1729)) )
))
(declare-datatypes ((ListLongMap!1725 0))(
  ( (ListLongMap!1726 (toList!878 List!1729)) )
))
(declare-fun lt!71989 () ListLongMap!1725)

(declare-fun contains!911 (ListLongMap!1725 (_ BitVec 64)) Bool)

(assert (=> b!137693 (= res!65993 (contains!911 lt!71989 (select (arr!2285 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2662 0))(
  ( (tuple2!2663 (_1!1342 Bool) (_2!1342 LongMapFixedSize!1122)) )
))
(declare-fun lt!71990 () tuple2!2662)

(declare-fun update!202 (LongMapFixedSize!1122 (_ BitVec 64) V!3515) tuple2!2662)

(declare-fun get!1504 (ValueCell!1107 V!3515) V!3515)

(declare-fun dynLambda!433 (Int (_ BitVec 64)) V!3515)

(assert (=> b!137693 (= lt!71990 (update!202 newMap!16 (select (arr!2285 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) from!355) (get!1504 (select (arr!2286 (_values!2896 (v!3243 (underlying!466 thiss!992)))) from!355) (dynLambda!433 (defaultEntry!2913 (v!3243 (underlying!466 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!89691 () Bool)

(assert (=> b!137694 (= e!89691 (and tp!11367 tp_is_empty!2901 (array_inv!1437 (_keys!4670 newMap!16)) (array_inv!1438 (_values!2896 newMap!16)) e!89694))))

(declare-fun b!137695 () Bool)

(assert (=> b!137695 (= e!89697 tp_is_empty!2901)))

(declare-fun b!137696 () Bool)

(declare-fun res!65989 () Bool)

(assert (=> b!137696 (=> (not res!65989) (not e!89699))))

(assert (=> b!137696 (= res!65989 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2556 (_keys!4670 (v!3243 (underlying!466 thiss!992)))))))))

(declare-fun b!137697 () Bool)

(declare-fun e!89701 () Bool)

(declare-fun e!89693 () Bool)

(assert (=> b!137697 (= e!89701 e!89693)))

(declare-fun b!137698 () Bool)

(assert (=> b!137698 (= e!89699 e!89688)))

(declare-fun res!65991 () Bool)

(assert (=> b!137698 (=> (not res!65991) (not e!89688))))

(declare-fun lt!71991 () ListLongMap!1725)

(assert (=> b!137698 (= res!65991 (and (= lt!71991 lt!71989) (not (= (select (arr!2285 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2285 (_keys!4670 (v!3243 (underlying!466 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1425 (LongMapFixedSize!1122) ListLongMap!1725)

(assert (=> b!137698 (= lt!71989 (map!1425 newMap!16))))

(declare-fun getCurrentListMap!554 (array!4833 array!4835 (_ BitVec 32) (_ BitVec 32) V!3515 V!3515 (_ BitVec 32) Int) ListLongMap!1725)

(assert (=> b!137698 (= lt!71991 (getCurrentListMap!554 (_keys!4670 (v!3243 (underlying!466 thiss!992))) (_values!2896 (v!3243 (underlying!466 thiss!992))) (mask!7239 (v!3243 (underlying!466 thiss!992))) (extraKeys!2670 (v!3243 (underlying!466 thiss!992))) (zeroValue!2764 (v!3243 (underlying!466 thiss!992))) (minValue!2764 (v!3243 (underlying!466 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2913 (v!3243 (underlying!466 thiss!992)))))))

(declare-fun b!137699 () Bool)

(declare-fun res!65990 () Bool)

(assert (=> b!137699 (=> (not res!65990) (not e!89699))))

(declare-fun valid!541 (LongMapFixedSize!1122) Bool)

(assert (=> b!137699 (= res!65990 (valid!541 newMap!16))))

(declare-fun b!137700 () Bool)

(assert (=> b!137700 (= e!89695 tp_is_empty!2901)))

(declare-fun res!65988 () Bool)

(assert (=> start!14576 (=> (not res!65988) (not e!89699))))

(declare-fun valid!542 (LongMap!910) Bool)

(assert (=> start!14576 (= res!65988 (valid!542 thiss!992))))

(assert (=> start!14576 e!89699))

(assert (=> start!14576 e!89701))

(assert (=> start!14576 true))

(assert (=> start!14576 e!89691))

(declare-fun b!137689 () Bool)

(assert (=> b!137689 (= e!89693 e!89698)))

(assert (= (and start!14576 res!65988) b!137696))

(assert (= (and b!137696 res!65989) b!137699))

(assert (= (and b!137699 res!65990) b!137687))

(assert (= (and b!137687 res!65992) b!137698))

(assert (= (and b!137698 res!65991) b!137693))

(assert (= (and b!137693 res!65993) b!137691))

(assert (= (and b!137692 condMapEmpty!4734) mapIsEmpty!4734))

(assert (= (and b!137692 (not condMapEmpty!4734)) mapNonEmpty!4734))

(get-info :version)

(assert (= (and mapNonEmpty!4734 ((_ is ValueCellFull!1107) mapValue!4734)) b!137695))

(assert (= (and b!137692 ((_ is ValueCellFull!1107) mapDefault!4734)) b!137685))

(assert (= b!137690 b!137692))

(assert (= b!137689 b!137690))

(assert (= b!137697 b!137689))

(assert (= start!14576 b!137697))

(assert (= (and b!137688 condMapEmpty!4733) mapIsEmpty!4733))

(assert (= (and b!137688 (not condMapEmpty!4733)) mapNonEmpty!4733))

(assert (= (and mapNonEmpty!4733 ((_ is ValueCellFull!1107) mapValue!4733)) b!137700))

(assert (= (and b!137688 ((_ is ValueCellFull!1107) mapDefault!4733)) b!137686))

(assert (= b!137694 b!137688))

(assert (= start!14576 b!137694))

(declare-fun b_lambda!6165 () Bool)

(assert (=> (not b_lambda!6165) (not b!137693)))

(declare-fun t!6246 () Bool)

(declare-fun tb!2481 () Bool)

(assert (=> (and b!137690 (= (defaultEntry!2913 (v!3243 (underlying!466 thiss!992))) (defaultEntry!2913 (v!3243 (underlying!466 thiss!992)))) t!6246) tb!2481))

(declare-fun result!4079 () Bool)

(assert (=> tb!2481 (= result!4079 tp_is_empty!2901)))

(assert (=> b!137693 t!6246))

(declare-fun b_and!8551 () Bool)

(assert (= b_and!8547 (and (=> t!6246 result!4079) b_and!8551)))

(declare-fun t!6248 () Bool)

(declare-fun tb!2483 () Bool)

(assert (=> (and b!137694 (= (defaultEntry!2913 newMap!16) (defaultEntry!2913 (v!3243 (underlying!466 thiss!992)))) t!6248) tb!2483))

(declare-fun result!4083 () Bool)

(assert (= result!4083 result!4079))

(assert (=> b!137693 t!6248))

(declare-fun b_and!8553 () Bool)

(assert (= b_and!8549 (and (=> t!6248 result!4083) b_and!8553)))

(declare-fun m!164573 () Bool)

(assert (=> b!137691 m!164573))

(assert (=> b!137691 m!164573))

(declare-fun m!164575 () Bool)

(assert (=> b!137691 m!164575))

(assert (=> b!137691 m!164573))

(declare-fun m!164577 () Bool)

(assert (=> b!137691 m!164577))

(declare-fun m!164579 () Bool)

(assert (=> b!137694 m!164579))

(declare-fun m!164581 () Bool)

(assert (=> b!137694 m!164581))

(assert (=> b!137698 m!164573))

(declare-fun m!164583 () Bool)

(assert (=> b!137698 m!164583))

(declare-fun m!164585 () Bool)

(assert (=> b!137698 m!164585))

(declare-fun m!164587 () Bool)

(assert (=> mapNonEmpty!4734 m!164587))

(declare-fun m!164589 () Bool)

(assert (=> start!14576 m!164589))

(declare-fun m!164591 () Bool)

(assert (=> b!137699 m!164591))

(assert (=> b!137693 m!164573))

(declare-fun m!164593 () Bool)

(assert (=> b!137693 m!164593))

(declare-fun m!164595 () Bool)

(assert (=> b!137693 m!164595))

(declare-fun m!164597 () Bool)

(assert (=> b!137693 m!164597))

(declare-fun m!164599 () Bool)

(assert (=> b!137693 m!164599))

(assert (=> b!137693 m!164573))

(assert (=> b!137693 m!164597))

(assert (=> b!137693 m!164573))

(assert (=> b!137693 m!164599))

(declare-fun m!164601 () Bool)

(assert (=> b!137693 m!164601))

(assert (=> b!137693 m!164595))

(declare-fun m!164603 () Bool)

(assert (=> mapNonEmpty!4733 m!164603))

(declare-fun m!164605 () Bool)

(assert (=> b!137690 m!164605))

(declare-fun m!164607 () Bool)

(assert (=> b!137690 m!164607))

(check-sat tp_is_empty!2901 b_and!8551 (not b!137693) (not mapNonEmpty!4733) (not b_next!2971) (not b!137699) (not b!137691) (not mapNonEmpty!4734) (not b!137690) b_and!8553 (not start!14576) (not b_next!2969) (not b!137698) (not b!137694) (not b_lambda!6165))
(check-sat b_and!8551 b_and!8553 (not b_next!2969) (not b_next!2971))
