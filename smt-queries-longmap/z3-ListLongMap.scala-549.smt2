; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14582 () Bool)

(assert start!14582)

(declare-fun b!137848 () Bool)

(declare-fun b_free!2981 () Bool)

(declare-fun b_next!2981 () Bool)

(assert (=> b!137848 (= b_free!2981 (not b_next!2981))))

(declare-fun tp!11403 () Bool)

(declare-fun b_and!8571 () Bool)

(assert (=> b!137848 (= tp!11403 b_and!8571)))

(declare-fun b!137837 () Bool)

(declare-fun b_free!2983 () Bool)

(declare-fun b_next!2983 () Bool)

(assert (=> b!137837 (= b_free!2983 (not b_next!2983))))

(declare-fun tp!11404 () Bool)

(declare-fun b_and!8573 () Bool)

(assert (=> b!137837 (= tp!11404 b_and!8573)))

(declare-fun b!137835 () Bool)

(declare-fun e!89822 () Bool)

(declare-fun e!89832 () Bool)

(declare-fun mapRes!4751 () Bool)

(assert (=> b!137835 (= e!89822 (and e!89832 mapRes!4751))))

(declare-fun condMapEmpty!4752 () Bool)

(declare-datatypes ((V!3523 0))(
  ( (V!3524 (val!1498 Int)) )
))
(declare-datatypes ((array!4845 0))(
  ( (array!4846 (arr!2291 (Array (_ BitVec 32) (_ BitVec 64))) (size!2562 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1110 0))(
  ( (ValueCellFull!1110 (v!3248 V!3523)) (EmptyCell!1110) )
))
(declare-datatypes ((array!4847 0))(
  ( (array!4848 (arr!2292 (Array (_ BitVec 32) ValueCell!1110)) (size!2563 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1128 0))(
  ( (LongMapFixedSize!1129 (defaultEntry!2916 Int) (mask!7244 (_ BitVec 32)) (extraKeys!2673 (_ BitVec 32)) (zeroValue!2767 V!3523) (minValue!2767 V!3523) (_size!613 (_ BitVec 32)) (_keys!4673 array!4845) (_values!2899 array!4847) (_vacant!613 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1128)

(declare-fun mapDefault!4752 () ValueCell!1110)

(assert (=> b!137835 (= condMapEmpty!4752 (= (arr!2292 (_values!2899 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1110)) mapDefault!4752)))))

(declare-fun b!137836 () Bool)

(declare-fun e!89823 () Bool)

(declare-fun tp_is_empty!2907 () Bool)

(assert (=> b!137836 (= e!89823 tp_is_empty!2907)))

(declare-fun res!66047 () Bool)

(declare-fun e!89825 () Bool)

(assert (=> start!14582 (=> (not res!66047) (not e!89825))))

(declare-datatypes ((Cell!916 0))(
  ( (Cell!917 (v!3249 LongMapFixedSize!1128)) )
))
(declare-datatypes ((LongMap!916 0))(
  ( (LongMap!917 (underlying!469 Cell!916)) )
))
(declare-fun thiss!992 () LongMap!916)

(declare-fun valid!544 (LongMap!916) Bool)

(assert (=> start!14582 (= res!66047 (valid!544 thiss!992))))

(assert (=> start!14582 e!89825))

(declare-fun e!89835 () Bool)

(assert (=> start!14582 e!89835))

(assert (=> start!14582 true))

(declare-fun e!89824 () Bool)

(assert (=> start!14582 e!89824))

(declare-fun array_inv!1439 (array!4845) Bool)

(declare-fun array_inv!1440 (array!4847) Bool)

(assert (=> b!137837 (= e!89824 (and tp!11404 tp_is_empty!2907 (array_inv!1439 (_keys!4673 newMap!16)) (array_inv!1440 (_values!2899 newMap!16)) e!89822))))

(declare-fun b!137838 () Bool)

(declare-fun e!89828 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!137838 (= e!89828 (not (or (bvsge (size!2562 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!2562 (_keys!4673 (v!3249 (underlying!469 thiss!992))))) (bvsle from!355 (size!2562 (_keys!4673 (v!3249 (underlying!469 thiss!992))))))))))

(declare-fun arrayContainsKey!0 (array!4845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137838 (arrayContainsKey!0 (_keys!4673 (v!3249 (underlying!469 thiss!992))) (select (arr!2291 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4342 0))(
  ( (Unit!4343) )
))
(declare-fun lt!72027 () Unit!4342)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!134 (array!4845 array!4847 (_ BitVec 32) (_ BitVec 32) V!3523 V!3523 (_ BitVec 64) (_ BitVec 32) Int) Unit!4342)

(assert (=> b!137838 (= lt!72027 (lemmaListMapContainsThenArrayContainsFrom!134 (_keys!4673 (v!3249 (underlying!469 thiss!992))) (_values!2899 (v!3249 (underlying!469 thiss!992))) (mask!7244 (v!3249 (underlying!469 thiss!992))) (extraKeys!2673 (v!3249 (underlying!469 thiss!992))) (zeroValue!2767 (v!3249 (underlying!469 thiss!992))) (minValue!2767 (v!3249 (underlying!469 thiss!992))) (select (arr!2291 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2916 (v!3249 (underlying!469 thiss!992)))))))

(declare-fun b!137839 () Bool)

(declare-fun e!89827 () Bool)

(assert (=> b!137839 (= e!89827 e!89828)))

(declare-fun res!66043 () Bool)

(assert (=> b!137839 (=> (not res!66043) (not e!89828))))

(declare-datatypes ((tuple2!2668 0))(
  ( (tuple2!2669 (_1!1345 (_ BitVec 64)) (_2!1345 V!3523)) )
))
(declare-datatypes ((List!1731 0))(
  ( (Nil!1728) (Cons!1727 (h!2334 tuple2!2668) (t!6263 List!1731)) )
))
(declare-datatypes ((ListLongMap!1729 0))(
  ( (ListLongMap!1730 (toList!880 List!1731)) )
))
(declare-fun lt!72025 () ListLongMap!1729)

(declare-fun contains!913 (ListLongMap!1729 (_ BitVec 64)) Bool)

(assert (=> b!137839 (= res!66043 (contains!913 lt!72025 (select (arr!2291 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2670 0))(
  ( (tuple2!2671 (_1!1346 Bool) (_2!1346 LongMapFixedSize!1128)) )
))
(declare-fun lt!72028 () tuple2!2670)

(declare-fun update!204 (LongMapFixedSize!1128 (_ BitVec 64) V!3523) tuple2!2670)

(declare-fun get!1508 (ValueCell!1110 V!3523) V!3523)

(declare-fun dynLambda!435 (Int (_ BitVec 64)) V!3523)

(assert (=> b!137839 (= lt!72028 (update!204 newMap!16 (select (arr!2291 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) from!355) (get!1508 (select (arr!2292 (_values!2899 (v!3249 (underlying!469 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2916 (v!3249 (underlying!469 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!4751 () Bool)

(assert (=> mapIsEmpty!4751 mapRes!4751))

(declare-fun mapIsEmpty!4752 () Bool)

(declare-fun mapRes!4752 () Bool)

(assert (=> mapIsEmpty!4752 mapRes!4752))

(declare-fun b!137840 () Bool)

(declare-fun e!89836 () Bool)

(assert (=> b!137840 (= e!89836 tp_is_empty!2907)))

(declare-fun b!137841 () Bool)

(assert (=> b!137841 (= e!89825 e!89827)))

(declare-fun res!66045 () Bool)

(assert (=> b!137841 (=> (not res!66045) (not e!89827))))

(declare-fun lt!72026 () ListLongMap!1729)

(assert (=> b!137841 (= res!66045 (and (= lt!72026 lt!72025) (not (= (select (arr!2291 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2291 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1429 (LongMapFixedSize!1128) ListLongMap!1729)

(assert (=> b!137841 (= lt!72025 (map!1429 newMap!16))))

(declare-fun getCurrentListMap!556 (array!4845 array!4847 (_ BitVec 32) (_ BitVec 32) V!3523 V!3523 (_ BitVec 32) Int) ListLongMap!1729)

(assert (=> b!137841 (= lt!72026 (getCurrentListMap!556 (_keys!4673 (v!3249 (underlying!469 thiss!992))) (_values!2899 (v!3249 (underlying!469 thiss!992))) (mask!7244 (v!3249 (underlying!469 thiss!992))) (extraKeys!2673 (v!3249 (underlying!469 thiss!992))) (zeroValue!2767 (v!3249 (underlying!469 thiss!992))) (minValue!2767 (v!3249 (underlying!469 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2916 (v!3249 (underlying!469 thiss!992)))))))

(declare-fun b!137842 () Bool)

(declare-fun res!66042 () Bool)

(assert (=> b!137842 (=> (not res!66042) (not e!89825))))

(assert (=> b!137842 (= res!66042 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7244 newMap!16)) (_size!613 (v!3249 (underlying!469 thiss!992)))))))

(declare-fun mapNonEmpty!4751 () Bool)

(declare-fun tp!11406 () Bool)

(assert (=> mapNonEmpty!4751 (= mapRes!4751 (and tp!11406 e!89823))))

(declare-fun mapValue!4752 () ValueCell!1110)

(declare-fun mapKey!4752 () (_ BitVec 32))

(declare-fun mapRest!4752 () (Array (_ BitVec 32) ValueCell!1110))

(assert (=> mapNonEmpty!4751 (= (arr!2292 (_values!2899 newMap!16)) (store mapRest!4752 mapKey!4752 mapValue!4752))))

(declare-fun b!137843 () Bool)

(assert (=> b!137843 (= e!89832 tp_is_empty!2907)))

(declare-fun b!137844 () Bool)

(declare-fun e!89833 () Bool)

(declare-fun e!89826 () Bool)

(assert (=> b!137844 (= e!89833 (and e!89826 mapRes!4752))))

(declare-fun condMapEmpty!4751 () Bool)

(declare-fun mapDefault!4751 () ValueCell!1110)

(assert (=> b!137844 (= condMapEmpty!4751 (= (arr!2292 (_values!2899 (v!3249 (underlying!469 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1110)) mapDefault!4751)))))

(declare-fun b!137845 () Bool)

(declare-fun res!66044 () Bool)

(assert (=> b!137845 (=> (not res!66044) (not e!89825))))

(declare-fun valid!545 (LongMapFixedSize!1128) Bool)

(assert (=> b!137845 (= res!66044 (valid!545 newMap!16))))

(declare-fun b!137846 () Bool)

(declare-fun e!89829 () Bool)

(assert (=> b!137846 (= e!89835 e!89829)))

(declare-fun b!137847 () Bool)

(assert (=> b!137847 (= e!89826 tp_is_empty!2907)))

(declare-fun e!89834 () Bool)

(assert (=> b!137848 (= e!89834 (and tp!11403 tp_is_empty!2907 (array_inv!1439 (_keys!4673 (v!3249 (underlying!469 thiss!992)))) (array_inv!1440 (_values!2899 (v!3249 (underlying!469 thiss!992)))) e!89833))))

(declare-fun mapNonEmpty!4752 () Bool)

(declare-fun tp!11405 () Bool)

(assert (=> mapNonEmpty!4752 (= mapRes!4752 (and tp!11405 e!89836))))

(declare-fun mapValue!4751 () ValueCell!1110)

(declare-fun mapKey!4751 () (_ BitVec 32))

(declare-fun mapRest!4751 () (Array (_ BitVec 32) ValueCell!1110))

(assert (=> mapNonEmpty!4752 (= (arr!2292 (_values!2899 (v!3249 (underlying!469 thiss!992)))) (store mapRest!4751 mapKey!4751 mapValue!4751))))

(declare-fun b!137849 () Bool)

(declare-fun res!66046 () Bool)

(assert (=> b!137849 (=> (not res!66046) (not e!89825))))

(assert (=> b!137849 (= res!66046 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2562 (_keys!4673 (v!3249 (underlying!469 thiss!992)))))))))

(declare-fun b!137850 () Bool)

(assert (=> b!137850 (= e!89829 e!89834)))

(assert (= (and start!14582 res!66047) b!137849))

(assert (= (and b!137849 res!66046) b!137845))

(assert (= (and b!137845 res!66044) b!137842))

(assert (= (and b!137842 res!66042) b!137841))

(assert (= (and b!137841 res!66045) b!137839))

(assert (= (and b!137839 res!66043) b!137838))

(assert (= (and b!137844 condMapEmpty!4751) mapIsEmpty!4752))

(assert (= (and b!137844 (not condMapEmpty!4751)) mapNonEmpty!4752))

(get-info :version)

(assert (= (and mapNonEmpty!4752 ((_ is ValueCellFull!1110) mapValue!4751)) b!137840))

(assert (= (and b!137844 ((_ is ValueCellFull!1110) mapDefault!4751)) b!137847))

(assert (= b!137848 b!137844))

(assert (= b!137850 b!137848))

(assert (= b!137846 b!137850))

(assert (= start!14582 b!137846))

(assert (= (and b!137835 condMapEmpty!4752) mapIsEmpty!4751))

(assert (= (and b!137835 (not condMapEmpty!4752)) mapNonEmpty!4751))

(assert (= (and mapNonEmpty!4751 ((_ is ValueCellFull!1110) mapValue!4752)) b!137836))

(assert (= (and b!137835 ((_ is ValueCellFull!1110) mapDefault!4752)) b!137843))

(assert (= b!137837 b!137835))

(assert (= start!14582 b!137837))

(declare-fun b_lambda!6171 () Bool)

(assert (=> (not b_lambda!6171) (not b!137839)))

(declare-fun t!6260 () Bool)

(declare-fun tb!2493 () Bool)

(assert (=> (and b!137848 (= (defaultEntry!2916 (v!3249 (underlying!469 thiss!992))) (defaultEntry!2916 (v!3249 (underlying!469 thiss!992)))) t!6260) tb!2493))

(declare-fun result!4097 () Bool)

(assert (=> tb!2493 (= result!4097 tp_is_empty!2907)))

(assert (=> b!137839 t!6260))

(declare-fun b_and!8575 () Bool)

(assert (= b_and!8571 (and (=> t!6260 result!4097) b_and!8575)))

(declare-fun tb!2495 () Bool)

(declare-fun t!6262 () Bool)

(assert (=> (and b!137837 (= (defaultEntry!2916 newMap!16) (defaultEntry!2916 (v!3249 (underlying!469 thiss!992)))) t!6262) tb!2495))

(declare-fun result!4101 () Bool)

(assert (= result!4101 result!4097))

(assert (=> b!137839 t!6262))

(declare-fun b_and!8577 () Bool)

(assert (= b_and!8573 (and (=> t!6262 result!4101) b_and!8577)))

(declare-fun m!164681 () Bool)

(assert (=> mapNonEmpty!4752 m!164681))

(declare-fun m!164683 () Bool)

(assert (=> b!137841 m!164683))

(declare-fun m!164685 () Bool)

(assert (=> b!137841 m!164685))

(declare-fun m!164687 () Bool)

(assert (=> b!137841 m!164687))

(assert (=> b!137838 m!164683))

(assert (=> b!137838 m!164683))

(declare-fun m!164689 () Bool)

(assert (=> b!137838 m!164689))

(assert (=> b!137838 m!164683))

(declare-fun m!164691 () Bool)

(assert (=> b!137838 m!164691))

(declare-fun m!164693 () Bool)

(assert (=> b!137837 m!164693))

(declare-fun m!164695 () Bool)

(assert (=> b!137837 m!164695))

(declare-fun m!164697 () Bool)

(assert (=> b!137848 m!164697))

(declare-fun m!164699 () Bool)

(assert (=> b!137848 m!164699))

(declare-fun m!164701 () Bool)

(assert (=> mapNonEmpty!4751 m!164701))

(declare-fun m!164703 () Bool)

(assert (=> b!137839 m!164703))

(declare-fun m!164705 () Bool)

(assert (=> b!137839 m!164705))

(declare-fun m!164707 () Bool)

(assert (=> b!137839 m!164707))

(assert (=> b!137839 m!164683))

(assert (=> b!137839 m!164683))

(assert (=> b!137839 m!164707))

(declare-fun m!164709 () Bool)

(assert (=> b!137839 m!164709))

(assert (=> b!137839 m!164703))

(assert (=> b!137839 m!164683))

(declare-fun m!164711 () Bool)

(assert (=> b!137839 m!164711))

(assert (=> b!137839 m!164705))

(declare-fun m!164713 () Bool)

(assert (=> start!14582 m!164713))

(declare-fun m!164715 () Bool)

(assert (=> b!137845 m!164715))

(check-sat (not b!137848) (not b!137839) b_and!8577 (not b!137837) (not b!137845) b_and!8575 (not b!137838) (not b_lambda!6171) (not b_next!2983) tp_is_empty!2907 (not mapNonEmpty!4751) (not b_next!2981) (not b!137841) (not start!14582) (not mapNonEmpty!4752))
(check-sat b_and!8575 b_and!8577 (not b_next!2981) (not b_next!2983))
