; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14572 () Bool)

(assert start!14572)

(declare-fun b!137779 () Bool)

(declare-fun b_free!2953 () Bool)

(declare-fun b_next!2953 () Bool)

(assert (=> b!137779 (= b_free!2953 (not b_next!2953))))

(declare-fun tp!11319 () Bool)

(declare-fun b_and!8541 () Bool)

(assert (=> b!137779 (= tp!11319 b_and!8541)))

(declare-fun b!137778 () Bool)

(declare-fun b_free!2955 () Bool)

(declare-fun b_next!2955 () Bool)

(assert (=> b!137778 (= b_free!2955 (not b_next!2955))))

(declare-fun tp!11320 () Bool)

(declare-fun b_and!8543 () Bool)

(assert (=> b!137778 (= tp!11320 b_and!8543)))

(declare-fun b!137776 () Bool)

(declare-fun res!66018 () Bool)

(declare-fun e!89684 () Bool)

(assert (=> b!137776 (=> (not res!66018) (not e!89684))))

(declare-datatypes ((V!3505 0))(
  ( (V!3506 (val!1491 Int)) )
))
(declare-datatypes ((array!4803 0))(
  ( (array!4804 (arr!2270 (Array (_ BitVec 32) (_ BitVec 64))) (size!2541 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1103 0))(
  ( (ValueCellFull!1103 (v!3235 V!3505)) (EmptyCell!1103) )
))
(declare-datatypes ((array!4805 0))(
  ( (array!4806 (arr!2271 (Array (_ BitVec 32) ValueCell!1103)) (size!2542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1114 0))(
  ( (LongMapFixedSize!1115 (defaultEntry!2909 Int) (mask!7233 (_ BitVec 32)) (extraKeys!2666 (_ BitVec 32)) (zeroValue!2760 V!3505) (minValue!2760 V!3505) (_size!606 (_ BitVec 32)) (_keys!4666 array!4803) (_values!2892 array!4805) (_vacant!606 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1114)

(declare-fun valid!548 (LongMapFixedSize!1114) Bool)

(assert (=> b!137776 (= res!66018 (valid!548 newMap!16))))

(declare-fun b!137777 () Bool)

(declare-fun res!66017 () Bool)

(assert (=> b!137777 (=> (not res!66017) (not e!89684))))

(declare-datatypes ((Cell!902 0))(
  ( (Cell!903 (v!3236 LongMapFixedSize!1114)) )
))
(declare-datatypes ((LongMap!902 0))(
  ( (LongMap!903 (underlying!462 Cell!902)) )
))
(declare-fun thiss!992 () LongMap!902)

(assert (=> b!137777 (= res!66017 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7233 newMap!16)) (_size!606 (v!3236 (underlying!462 thiss!992)))))))

(declare-fun mapIsEmpty!4709 () Bool)

(declare-fun mapRes!4709 () Bool)

(assert (=> mapIsEmpty!4709 mapRes!4709))

(declare-fun e!89687 () Bool)

(declare-fun tp_is_empty!2893 () Bool)

(declare-fun e!89688 () Bool)

(declare-fun array_inv!1415 (array!4803) Bool)

(declare-fun array_inv!1416 (array!4805) Bool)

(assert (=> b!137778 (= e!89688 (and tp!11320 tp_is_empty!2893 (array_inv!1415 (_keys!4666 newMap!16)) (array_inv!1416 (_values!2892 newMap!16)) e!89687))))

(declare-fun e!89690 () Bool)

(declare-fun e!89683 () Bool)

(assert (=> b!137779 (= e!89690 (and tp!11319 tp_is_empty!2893 (array_inv!1415 (_keys!4666 (v!3236 (underlying!462 thiss!992)))) (array_inv!1416 (_values!2892 (v!3236 (underlying!462 thiss!992)))) e!89683))))

(declare-fun b!137780 () Bool)

(declare-fun e!89681 () Bool)

(declare-fun mapRes!4710 () Bool)

(assert (=> b!137780 (= e!89683 (and e!89681 mapRes!4710))))

(declare-fun condMapEmpty!4709 () Bool)

(declare-fun mapDefault!4709 () ValueCell!1103)

(assert (=> b!137780 (= condMapEmpty!4709 (= (arr!2271 (_values!2892 (v!3236 (underlying!462 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1103)) mapDefault!4709)))))

(declare-fun b!137781 () Bool)

(declare-fun res!66022 () Bool)

(assert (=> b!137781 (=> (not res!66022) (not e!89684))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!137781 (= res!66022 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2541 (_keys!4666 (v!3236 (underlying!462 thiss!992)))))))))

(declare-fun mapNonEmpty!4709 () Bool)

(declare-fun tp!11321 () Bool)

(declare-fun e!89677 () Bool)

(assert (=> mapNonEmpty!4709 (= mapRes!4709 (and tp!11321 e!89677))))

(declare-fun mapValue!4710 () ValueCell!1103)

(declare-fun mapRest!4709 () (Array (_ BitVec 32) ValueCell!1103))

(declare-fun mapKey!4710 () (_ BitVec 32))

(assert (=> mapNonEmpty!4709 (= (arr!2271 (_values!2892 newMap!16)) (store mapRest!4709 mapKey!4710 mapValue!4710))))

(declare-fun b!137782 () Bool)

(declare-fun e!89682 () Bool)

(assert (=> b!137782 (= e!89682 tp_is_empty!2893)))

(declare-fun res!66020 () Bool)

(assert (=> start!14572 (=> (not res!66020) (not e!89684))))

(declare-fun valid!549 (LongMap!902) Bool)

(assert (=> start!14572 (= res!66020 (valid!549 thiss!992))))

(assert (=> start!14572 e!89684))

(declare-fun e!89676 () Bool)

(assert (=> start!14572 e!89676))

(assert (=> start!14572 true))

(assert (=> start!14572 e!89688))

(declare-fun b!137783 () Bool)

(declare-fun e!89686 () Bool)

(assert (=> b!137783 (= e!89686 tp_is_empty!2893)))

(declare-fun mapIsEmpty!4710 () Bool)

(assert (=> mapIsEmpty!4710 mapRes!4710))

(declare-fun mapNonEmpty!4710 () Bool)

(declare-fun tp!11322 () Bool)

(assert (=> mapNonEmpty!4710 (= mapRes!4710 (and tp!11322 e!89682))))

(declare-fun mapRest!4710 () (Array (_ BitVec 32) ValueCell!1103))

(declare-fun mapValue!4709 () ValueCell!1103)

(declare-fun mapKey!4709 () (_ BitVec 32))

(assert (=> mapNonEmpty!4710 (= (arr!2271 (_values!2892 (v!3236 (underlying!462 thiss!992)))) (store mapRest!4710 mapKey!4709 mapValue!4709))))

(declare-fun b!137784 () Bool)

(assert (=> b!137784 (= e!89681 tp_is_empty!2893)))

(declare-fun b!137785 () Bool)

(declare-fun e!89689 () Bool)

(assert (=> b!137785 (= e!89676 e!89689)))

(declare-fun b!137786 () Bool)

(assert (=> b!137786 (= e!89687 (and e!89686 mapRes!4709))))

(declare-fun condMapEmpty!4710 () Bool)

(declare-fun mapDefault!4710 () ValueCell!1103)

(assert (=> b!137786 (= condMapEmpty!4710 (= (arr!2271 (_values!2892 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1103)) mapDefault!4710)))))

(declare-fun b!137787 () Bool)

(declare-fun e!89679 () Bool)

(assert (=> b!137787 (= e!89679 (not true))))

(declare-fun arrayContainsKey!0 (array!4803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137787 (arrayContainsKey!0 (_keys!4666 (v!3236 (underlying!462 thiss!992))) (select (arr!2270 (_keys!4666 (v!3236 (underlying!462 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4339 0))(
  ( (Unit!4340) )
))
(declare-fun lt!72116 () Unit!4339)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!126 (array!4803 array!4805 (_ BitVec 32) (_ BitVec 32) V!3505 V!3505 (_ BitVec 64) (_ BitVec 32) Int) Unit!4339)

(assert (=> b!137787 (= lt!72116 (lemmaListMapContainsThenArrayContainsFrom!126 (_keys!4666 (v!3236 (underlying!462 thiss!992))) (_values!2892 (v!3236 (underlying!462 thiss!992))) (mask!7233 (v!3236 (underlying!462 thiss!992))) (extraKeys!2666 (v!3236 (underlying!462 thiss!992))) (zeroValue!2760 (v!3236 (underlying!462 thiss!992))) (minValue!2760 (v!3236 (underlying!462 thiss!992))) (select (arr!2270 (_keys!4666 (v!3236 (underlying!462 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2909 (v!3236 (underlying!462 thiss!992)))))))

(declare-fun b!137788 () Bool)

(declare-fun e!89680 () Bool)

(assert (=> b!137788 (= e!89680 e!89679)))

(declare-fun res!66021 () Bool)

(assert (=> b!137788 (=> (not res!66021) (not e!89679))))

(declare-datatypes ((tuple2!2582 0))(
  ( (tuple2!2583 (_1!1302 (_ BitVec 64)) (_2!1302 V!3505)) )
))
(declare-datatypes ((List!1702 0))(
  ( (Nil!1699) (Cons!1698 (h!2305 tuple2!2582) (t!6202 List!1702)) )
))
(declare-datatypes ((ListLongMap!1663 0))(
  ( (ListLongMap!1664 (toList!847 List!1702)) )
))
(declare-fun lt!72119 () ListLongMap!1663)

(declare-fun contains!892 (ListLongMap!1663 (_ BitVec 64)) Bool)

(assert (=> b!137788 (= res!66021 (contains!892 lt!72119 (select (arr!2270 (_keys!4666 (v!3236 (underlying!462 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2584 0))(
  ( (tuple2!2585 (_1!1303 Bool) (_2!1303 LongMapFixedSize!1114)) )
))
(declare-fun lt!72118 () tuple2!2584)

(declare-fun update!200 (LongMapFixedSize!1114 (_ BitVec 64) V!3505) tuple2!2584)

(declare-fun get!1505 (ValueCell!1103 V!3505) V!3505)

(declare-fun dynLambda!430 (Int (_ BitVec 64)) V!3505)

(assert (=> b!137788 (= lt!72118 (update!200 newMap!16 (select (arr!2270 (_keys!4666 (v!3236 (underlying!462 thiss!992)))) from!355) (get!1505 (select (arr!2271 (_values!2892 (v!3236 (underlying!462 thiss!992)))) from!355) (dynLambda!430 (defaultEntry!2909 (v!3236 (underlying!462 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137789 () Bool)

(assert (=> b!137789 (= e!89677 tp_is_empty!2893)))

(declare-fun b!137790 () Bool)

(assert (=> b!137790 (= e!89684 e!89680)))

(declare-fun res!66019 () Bool)

(assert (=> b!137790 (=> (not res!66019) (not e!89680))))

(declare-fun lt!72117 () ListLongMap!1663)

(assert (=> b!137790 (= res!66019 (and (= lt!72117 lt!72119) (not (= (select (arr!2270 (_keys!4666 (v!3236 (underlying!462 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2270 (_keys!4666 (v!3236 (underlying!462 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1408 (LongMapFixedSize!1114) ListLongMap!1663)

(assert (=> b!137790 (= lt!72119 (map!1408 newMap!16))))

(declare-fun getCurrentListMap!522 (array!4803 array!4805 (_ BitVec 32) (_ BitVec 32) V!3505 V!3505 (_ BitVec 32) Int) ListLongMap!1663)

(assert (=> b!137790 (= lt!72117 (getCurrentListMap!522 (_keys!4666 (v!3236 (underlying!462 thiss!992))) (_values!2892 (v!3236 (underlying!462 thiss!992))) (mask!7233 (v!3236 (underlying!462 thiss!992))) (extraKeys!2666 (v!3236 (underlying!462 thiss!992))) (zeroValue!2760 (v!3236 (underlying!462 thiss!992))) (minValue!2760 (v!3236 (underlying!462 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2909 (v!3236 (underlying!462 thiss!992)))))))

(declare-fun b!137791 () Bool)

(assert (=> b!137791 (= e!89689 e!89690)))

(assert (= (and start!14572 res!66020) b!137781))

(assert (= (and b!137781 res!66022) b!137776))

(assert (= (and b!137776 res!66018) b!137777))

(assert (= (and b!137777 res!66017) b!137790))

(assert (= (and b!137790 res!66019) b!137788))

(assert (= (and b!137788 res!66021) b!137787))

(assert (= (and b!137780 condMapEmpty!4709) mapIsEmpty!4710))

(assert (= (and b!137780 (not condMapEmpty!4709)) mapNonEmpty!4710))

(get-info :version)

(assert (= (and mapNonEmpty!4710 ((_ is ValueCellFull!1103) mapValue!4709)) b!137782))

(assert (= (and b!137780 ((_ is ValueCellFull!1103) mapDefault!4709)) b!137784))

(assert (= b!137779 b!137780))

(assert (= b!137791 b!137779))

(assert (= b!137785 b!137791))

(assert (= start!14572 b!137785))

(assert (= (and b!137786 condMapEmpty!4710) mapIsEmpty!4709))

(assert (= (and b!137786 (not condMapEmpty!4710)) mapNonEmpty!4709))

(assert (= (and mapNonEmpty!4709 ((_ is ValueCellFull!1103) mapValue!4710)) b!137789))

(assert (= (and b!137786 ((_ is ValueCellFull!1103) mapDefault!4710)) b!137783))

(assert (= b!137778 b!137786))

(assert (= start!14572 b!137778))

(declare-fun b_lambda!6187 () Bool)

(assert (=> (not b_lambda!6187) (not b!137788)))

(declare-fun t!6199 () Bool)

(declare-fun tb!2461 () Bool)

(assert (=> (and b!137779 (= (defaultEntry!2909 (v!3236 (underlying!462 thiss!992))) (defaultEntry!2909 (v!3236 (underlying!462 thiss!992)))) t!6199) tb!2461))

(declare-fun result!4051 () Bool)

(assert (=> tb!2461 (= result!4051 tp_is_empty!2893)))

(assert (=> b!137788 t!6199))

(declare-fun b_and!8545 () Bool)

(assert (= b_and!8541 (and (=> t!6199 result!4051) b_and!8545)))

(declare-fun tb!2463 () Bool)

(declare-fun t!6201 () Bool)

(assert (=> (and b!137778 (= (defaultEntry!2909 newMap!16) (defaultEntry!2909 (v!3236 (underlying!462 thiss!992)))) t!6201) tb!2463))

(declare-fun result!4055 () Bool)

(assert (= result!4055 result!4051))

(assert (=> b!137788 t!6201))

(declare-fun b_and!8547 () Bool)

(assert (= b_and!8543 (and (=> t!6201 result!4055) b_and!8547)))

(declare-fun m!165039 () Bool)

(assert (=> b!137779 m!165039))

(declare-fun m!165041 () Bool)

(assert (=> b!137779 m!165041))

(declare-fun m!165043 () Bool)

(assert (=> b!137787 m!165043))

(assert (=> b!137787 m!165043))

(declare-fun m!165045 () Bool)

(assert (=> b!137787 m!165045))

(assert (=> b!137787 m!165043))

(declare-fun m!165047 () Bool)

(assert (=> b!137787 m!165047))

(assert (=> b!137790 m!165043))

(declare-fun m!165049 () Bool)

(assert (=> b!137790 m!165049))

(declare-fun m!165051 () Bool)

(assert (=> b!137790 m!165051))

(declare-fun m!165053 () Bool)

(assert (=> b!137776 m!165053))

(assert (=> b!137788 m!165043))

(declare-fun m!165055 () Bool)

(assert (=> b!137788 m!165055))

(declare-fun m!165057 () Bool)

(assert (=> b!137788 m!165057))

(declare-fun m!165059 () Bool)

(assert (=> b!137788 m!165059))

(declare-fun m!165061 () Bool)

(assert (=> b!137788 m!165061))

(assert (=> b!137788 m!165043))

(assert (=> b!137788 m!165059))

(assert (=> b!137788 m!165043))

(assert (=> b!137788 m!165061))

(declare-fun m!165063 () Bool)

(assert (=> b!137788 m!165063))

(assert (=> b!137788 m!165057))

(declare-fun m!165065 () Bool)

(assert (=> start!14572 m!165065))

(declare-fun m!165067 () Bool)

(assert (=> b!137778 m!165067))

(declare-fun m!165069 () Bool)

(assert (=> b!137778 m!165069))

(declare-fun m!165071 () Bool)

(assert (=> mapNonEmpty!4710 m!165071))

(declare-fun m!165073 () Bool)

(assert (=> mapNonEmpty!4709 m!165073))

(check-sat (not b!137776) (not b_next!2955) (not b!137788) (not b!137778) b_and!8545 (not b_next!2953) (not b!137790) (not mapNonEmpty!4710) (not b!137779) (not b_lambda!6187) (not start!14572) (not b!137787) b_and!8547 tp_is_empty!2893 (not mapNonEmpty!4709))
(check-sat b_and!8545 b_and!8547 (not b_next!2953) (not b_next!2955))
