; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14424 () Bool)

(assert start!14424)

(declare-fun b!135830 () Bool)

(declare-fun b_free!2933 () Bool)

(declare-fun b_next!2933 () Bool)

(assert (=> b!135830 (= b_free!2933 (not b_next!2933))))

(declare-fun tp!11254 () Bool)

(declare-fun b_and!8395 () Bool)

(assert (=> b!135830 (= tp!11254 b_and!8395)))

(declare-fun b!135831 () Bool)

(declare-fun b_free!2935 () Bool)

(declare-fun b_next!2935 () Bool)

(assert (=> b!135831 (= b_free!2935 (not b_next!2935))))

(declare-fun tp!11252 () Bool)

(declare-fun b_and!8397 () Bool)

(assert (=> b!135831 (= tp!11252 b_and!8397)))

(declare-fun b!135824 () Bool)

(declare-fun e!88462 () Bool)

(declare-fun e!88457 () Bool)

(assert (=> b!135824 (= e!88462 e!88457)))

(declare-fun b!135825 () Bool)

(declare-fun e!88455 () Bool)

(declare-fun e!88466 () Bool)

(assert (=> b!135825 (= e!88455 e!88466)))

(declare-fun res!65209 () Bool)

(assert (=> b!135825 (=> (not res!65209) (not e!88466))))

(declare-datatypes ((V!3491 0))(
  ( (V!3492 (val!1486 Int)) )
))
(declare-datatypes ((tuple2!2634 0))(
  ( (tuple2!2635 (_1!1328 (_ BitVec 64)) (_2!1328 V!3491)) )
))
(declare-datatypes ((List!1720 0))(
  ( (Nil!1717) (Cons!1716 (h!2322 tuple2!2634) (t!6196 List!1720)) )
))
(declare-datatypes ((ListLongMap!1711 0))(
  ( (ListLongMap!1712 (toList!871 List!1720)) )
))
(declare-fun lt!70917 () ListLongMap!1711)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((array!4795 0))(
  ( (array!4796 (arr!2267 (Array (_ BitVec 32) (_ BitVec 64))) (size!2537 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1098 0))(
  ( (ValueCellFull!1098 (v!3215 V!3491)) (EmptyCell!1098) )
))
(declare-datatypes ((array!4797 0))(
  ( (array!4798 (arr!2268 (Array (_ BitVec 32) ValueCell!1098)) (size!2538 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1104 0))(
  ( (LongMapFixedSize!1105 (defaultEntry!2886 Int) (mask!7198 (_ BitVec 32)) (extraKeys!2647 (_ BitVec 32)) (zeroValue!2739 V!3491) (minValue!2739 V!3491) (_size!601 (_ BitVec 32)) (_keys!4639 array!4795) (_values!2869 array!4797) (_vacant!601 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!894 0))(
  ( (Cell!895 (v!3216 LongMapFixedSize!1104)) )
))
(declare-datatypes ((LongMap!894 0))(
  ( (LongMap!895 (underlying!458 Cell!894)) )
))
(declare-fun thiss!992 () LongMap!894)

(declare-fun contains!903 (ListLongMap!1711 (_ BitVec 64)) Bool)

(assert (=> b!135825 (= res!65209 (contains!903 lt!70917 (select (arr!2267 (_keys!4639 (v!3216 (underlying!458 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2636 0))(
  ( (tuple2!2637 (_1!1329 Bool) (_2!1329 LongMapFixedSize!1104)) )
))
(declare-fun lt!70918 () tuple2!2636)

(declare-fun newMap!16 () LongMapFixedSize!1104)

(declare-fun update!196 (LongMapFixedSize!1104 (_ BitVec 64) V!3491) tuple2!2636)

(declare-fun get!1489 (ValueCell!1098 V!3491) V!3491)

(declare-fun dynLambda!427 (Int (_ BitVec 64)) V!3491)

(assert (=> b!135825 (= lt!70918 (update!196 newMap!16 (select (arr!2267 (_keys!4639 (v!3216 (underlying!458 thiss!992)))) from!355) (get!1489 (select (arr!2268 (_values!2869 (v!3216 (underlying!458 thiss!992)))) from!355) (dynLambda!427 (defaultEntry!2886 (v!3216 (underlying!458 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!135826 () Bool)

(declare-fun e!88467 () Bool)

(declare-fun tp_is_empty!2883 () Bool)

(assert (=> b!135826 (= e!88467 tp_is_empty!2883)))

(declare-fun b!135827 () Bool)

(declare-fun res!65199 () Bool)

(assert (=> b!135827 (=> (not res!65199) (not e!88466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!135827 (= res!65199 (validMask!0 (mask!7198 (v!3216 (underlying!458 thiss!992)))))))

(declare-fun b!135828 () Bool)

(declare-fun e!88458 () Bool)

(assert (=> b!135828 (= e!88458 e!88455)))

(declare-fun res!65205 () Bool)

(assert (=> b!135828 (=> (not res!65205) (not e!88455))))

(declare-fun lt!70916 () ListLongMap!1711)

(assert (=> b!135828 (= res!65205 (and (= lt!70916 lt!70917) (not (= (select (arr!2267 (_keys!4639 (v!3216 (underlying!458 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2267 (_keys!4639 (v!3216 (underlying!458 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1413 (LongMapFixedSize!1104) ListLongMap!1711)

(assert (=> b!135828 (= lt!70917 (map!1413 newMap!16))))

(declare-fun getCurrentListMap!548 (array!4795 array!4797 (_ BitVec 32) (_ BitVec 32) V!3491 V!3491 (_ BitVec 32) Int) ListLongMap!1711)

(assert (=> b!135828 (= lt!70916 (getCurrentListMap!548 (_keys!4639 (v!3216 (underlying!458 thiss!992))) (_values!2869 (v!3216 (underlying!458 thiss!992))) (mask!7198 (v!3216 (underlying!458 thiss!992))) (extraKeys!2647 (v!3216 (underlying!458 thiss!992))) (zeroValue!2739 (v!3216 (underlying!458 thiss!992))) (minValue!2739 (v!3216 (underlying!458 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2886 (v!3216 (underlying!458 thiss!992)))))))

(declare-fun b!135829 () Bool)

(declare-fun e!88454 () Bool)

(assert (=> b!135829 (= e!88454 tp_is_empty!2883)))

(declare-fun e!88461 () Bool)

(declare-fun e!88459 () Bool)

(declare-fun array_inv!1425 (array!4795) Bool)

(declare-fun array_inv!1426 (array!4797) Bool)

(assert (=> b!135830 (= e!88461 (and tp!11254 tp_is_empty!2883 (array_inv!1425 (_keys!4639 (v!3216 (underlying!458 thiss!992)))) (array_inv!1426 (_values!2869 (v!3216 (underlying!458 thiss!992)))) e!88459))))

(declare-fun e!88456 () Bool)

(declare-fun e!88464 () Bool)

(assert (=> b!135831 (= e!88464 (and tp!11252 tp_is_empty!2883 (array_inv!1425 (_keys!4639 newMap!16)) (array_inv!1426 (_values!2869 newMap!16)) e!88456))))

(declare-fun b!135832 () Bool)

(declare-fun e!88463 () Bool)

(declare-fun mapRes!4671 () Bool)

(assert (=> b!135832 (= e!88456 (and e!88463 mapRes!4671))))

(declare-fun condMapEmpty!4671 () Bool)

(declare-fun mapDefault!4671 () ValueCell!1098)

(assert (=> b!135832 (= condMapEmpty!4671 (= (arr!2268 (_values!2869 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1098)) mapDefault!4671)))))

(declare-fun b!135833 () Bool)

(declare-fun res!65203 () Bool)

(assert (=> b!135833 (=> (not res!65203) (not e!88458))))

(declare-fun valid!527 (LongMapFixedSize!1104) Bool)

(assert (=> b!135833 (= res!65203 (valid!527 newMap!16))))

(declare-fun b!135834 () Bool)

(assert (=> b!135834 (= e!88466 (not (contains!903 lt!70916 (select (arr!2267 (_keys!4639 (v!3216 (underlying!458 thiss!992)))) from!355))))))

(declare-fun b!135835 () Bool)

(declare-fun res!65204 () Bool)

(assert (=> b!135835 (=> (not res!65204) (not e!88466))))

(declare-datatypes ((List!1721 0))(
  ( (Nil!1718) (Cons!1717 (h!2323 (_ BitVec 64)) (t!6197 List!1721)) )
))
(declare-fun arrayNoDuplicates!0 (array!4795 (_ BitVec 32) List!1721) Bool)

(assert (=> b!135835 (= res!65204 (arrayNoDuplicates!0 (_keys!4639 (v!3216 (underlying!458 thiss!992))) #b00000000000000000000000000000000 Nil!1718))))

(declare-fun mapNonEmpty!4671 () Bool)

(declare-fun mapRes!4672 () Bool)

(declare-fun tp!11253 () Bool)

(assert (=> mapNonEmpty!4671 (= mapRes!4672 (and tp!11253 e!88454))))

(declare-fun mapRest!4671 () (Array (_ BitVec 32) ValueCell!1098))

(declare-fun mapValue!4671 () ValueCell!1098)

(declare-fun mapKey!4671 () (_ BitVec 32))

(assert (=> mapNonEmpty!4671 (= (arr!2268 (_values!2869 (v!3216 (underlying!458 thiss!992)))) (store mapRest!4671 mapKey!4671 mapValue!4671))))

(declare-fun b!135836 () Bool)

(declare-fun res!65207 () Bool)

(assert (=> b!135836 (=> (not res!65207) (not e!88458))))

(assert (=> b!135836 (= res!65207 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7198 newMap!16)) (_size!601 (v!3216 (underlying!458 thiss!992)))))))

(declare-fun b!135837 () Bool)

(declare-fun res!65208 () Bool)

(assert (=> b!135837 (=> (not res!65208) (not e!88466))))

(assert (=> b!135837 (= res!65208 (and (= (size!2538 (_values!2869 (v!3216 (underlying!458 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7198 (v!3216 (underlying!458 thiss!992))))) (= (size!2537 (_keys!4639 (v!3216 (underlying!458 thiss!992)))) (size!2538 (_values!2869 (v!3216 (underlying!458 thiss!992))))) (bvsge (mask!7198 (v!3216 (underlying!458 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2647 (v!3216 (underlying!458 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2647 (v!3216 (underlying!458 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!135838 () Bool)

(declare-fun res!65202 () Bool)

(assert (=> b!135838 (=> (not res!65202) (not e!88466))))

(assert (=> b!135838 (= res!65202 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2537 (_keys!4639 (v!3216 (underlying!458 thiss!992)))))))))

(declare-fun b!135839 () Bool)

(assert (=> b!135839 (= e!88463 tp_is_empty!2883)))

(declare-fun b!135840 () Bool)

(assert (=> b!135840 (= e!88459 (and e!88467 mapRes!4672))))

(declare-fun condMapEmpty!4672 () Bool)

(declare-fun mapDefault!4672 () ValueCell!1098)

(assert (=> b!135840 (= condMapEmpty!4672 (= (arr!2268 (_values!2869 (v!3216 (underlying!458 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1098)) mapDefault!4672)))))

(declare-fun b!135841 () Bool)

(declare-fun res!65200 () Bool)

(assert (=> b!135841 (=> (not res!65200) (not e!88466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4795 (_ BitVec 32)) Bool)

(assert (=> b!135841 (= res!65200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4639 (v!3216 (underlying!458 thiss!992))) (mask!7198 (v!3216 (underlying!458 thiss!992)))))))

(declare-fun b!135842 () Bool)

(assert (=> b!135842 (= e!88457 e!88461)))

(declare-fun mapIsEmpty!4672 () Bool)

(assert (=> mapIsEmpty!4672 mapRes!4672))

(declare-fun b!135843 () Bool)

(declare-fun res!65201 () Bool)

(assert (=> b!135843 (=> (not res!65201) (not e!88458))))

(assert (=> b!135843 (= res!65201 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2537 (_keys!4639 (v!3216 (underlying!458 thiss!992)))))))))

(declare-fun mapNonEmpty!4672 () Bool)

(declare-fun tp!11251 () Bool)

(declare-fun e!88460 () Bool)

(assert (=> mapNonEmpty!4672 (= mapRes!4671 (and tp!11251 e!88460))))

(declare-fun mapValue!4672 () ValueCell!1098)

(declare-fun mapKey!4672 () (_ BitVec 32))

(declare-fun mapRest!4672 () (Array (_ BitVec 32) ValueCell!1098))

(assert (=> mapNonEmpty!4672 (= (arr!2268 (_values!2869 newMap!16)) (store mapRest!4672 mapKey!4672 mapValue!4672))))

(declare-fun b!135844 () Bool)

(assert (=> b!135844 (= e!88460 tp_is_empty!2883)))

(declare-fun mapIsEmpty!4671 () Bool)

(assert (=> mapIsEmpty!4671 mapRes!4671))

(declare-fun res!65206 () Bool)

(assert (=> start!14424 (=> (not res!65206) (not e!88458))))

(declare-fun valid!528 (LongMap!894) Bool)

(assert (=> start!14424 (= res!65206 (valid!528 thiss!992))))

(assert (=> start!14424 e!88458))

(assert (=> start!14424 e!88462))

(assert (=> start!14424 true))

(assert (=> start!14424 e!88464))

(assert (= (and start!14424 res!65206) b!135843))

(assert (= (and b!135843 res!65201) b!135833))

(assert (= (and b!135833 res!65203) b!135836))

(assert (= (and b!135836 res!65207) b!135828))

(assert (= (and b!135828 res!65205) b!135825))

(assert (= (and b!135825 res!65209) b!135827))

(assert (= (and b!135827 res!65199) b!135837))

(assert (= (and b!135837 res!65208) b!135841))

(assert (= (and b!135841 res!65200) b!135835))

(assert (= (and b!135835 res!65204) b!135838))

(assert (= (and b!135838 res!65202) b!135834))

(assert (= (and b!135840 condMapEmpty!4672) mapIsEmpty!4672))

(assert (= (and b!135840 (not condMapEmpty!4672)) mapNonEmpty!4671))

(get-info :version)

(assert (= (and mapNonEmpty!4671 ((_ is ValueCellFull!1098) mapValue!4671)) b!135829))

(assert (= (and b!135840 ((_ is ValueCellFull!1098) mapDefault!4672)) b!135826))

(assert (= b!135830 b!135840))

(assert (= b!135842 b!135830))

(assert (= b!135824 b!135842))

(assert (= start!14424 b!135824))

(assert (= (and b!135832 condMapEmpty!4671) mapIsEmpty!4671))

(assert (= (and b!135832 (not condMapEmpty!4671)) mapNonEmpty!4672))

(assert (= (and mapNonEmpty!4672 ((_ is ValueCellFull!1098) mapValue!4672)) b!135844))

(assert (= (and b!135832 ((_ is ValueCellFull!1098) mapDefault!4671)) b!135839))

(assert (= b!135831 b!135832))

(assert (= start!14424 b!135831))

(declare-fun b_lambda!6067 () Bool)

(assert (=> (not b_lambda!6067) (not b!135825)))

(declare-fun t!6193 () Bool)

(declare-fun tb!2437 () Bool)

(assert (=> (and b!135830 (= (defaultEntry!2886 (v!3216 (underlying!458 thiss!992))) (defaultEntry!2886 (v!3216 (underlying!458 thiss!992)))) t!6193) tb!2437))

(declare-fun result!4015 () Bool)

(assert (=> tb!2437 (= result!4015 tp_is_empty!2883)))

(assert (=> b!135825 t!6193))

(declare-fun b_and!8399 () Bool)

(assert (= b_and!8395 (and (=> t!6193 result!4015) b_and!8399)))

(declare-fun t!6195 () Bool)

(declare-fun tb!2439 () Bool)

(assert (=> (and b!135831 (= (defaultEntry!2886 newMap!16) (defaultEntry!2886 (v!3216 (underlying!458 thiss!992)))) t!6195) tb!2439))

(declare-fun result!4019 () Bool)

(assert (= result!4019 result!4015))

(assert (=> b!135825 t!6195))

(declare-fun b_and!8401 () Bool)

(assert (= b_and!8397 (and (=> t!6195 result!4019) b_and!8401)))

(declare-fun m!161963 () Bool)

(assert (=> b!135825 m!161963))

(declare-fun m!161965 () Bool)

(assert (=> b!135825 m!161965))

(declare-fun m!161967 () Bool)

(assert (=> b!135825 m!161967))

(declare-fun m!161969 () Bool)

(assert (=> b!135825 m!161969))

(declare-fun m!161971 () Bool)

(assert (=> b!135825 m!161971))

(assert (=> b!135825 m!161969))

(assert (=> b!135825 m!161965))

(assert (=> b!135825 m!161969))

(assert (=> b!135825 m!161967))

(declare-fun m!161973 () Bool)

(assert (=> b!135825 m!161973))

(assert (=> b!135825 m!161963))

(assert (=> b!135828 m!161969))

(declare-fun m!161975 () Bool)

(assert (=> b!135828 m!161975))

(declare-fun m!161977 () Bool)

(assert (=> b!135828 m!161977))

(declare-fun m!161979 () Bool)

(assert (=> start!14424 m!161979))

(declare-fun m!161981 () Bool)

(assert (=> b!135827 m!161981))

(declare-fun m!161983 () Bool)

(assert (=> b!135841 m!161983))

(assert (=> b!135834 m!161969))

(assert (=> b!135834 m!161969))

(declare-fun m!161985 () Bool)

(assert (=> b!135834 m!161985))

(declare-fun m!161987 () Bool)

(assert (=> b!135835 m!161987))

(declare-fun m!161989 () Bool)

(assert (=> mapNonEmpty!4672 m!161989))

(declare-fun m!161991 () Bool)

(assert (=> b!135833 m!161991))

(declare-fun m!161993 () Bool)

(assert (=> b!135830 m!161993))

(declare-fun m!161995 () Bool)

(assert (=> b!135830 m!161995))

(declare-fun m!161997 () Bool)

(assert (=> b!135831 m!161997))

(declare-fun m!161999 () Bool)

(assert (=> b!135831 m!161999))

(declare-fun m!162001 () Bool)

(assert (=> mapNonEmpty!4671 m!162001))

(check-sat (not b_next!2933) (not mapNonEmpty!4671) (not b!135831) (not b!135825) (not b_lambda!6067) (not b_next!2935) (not start!14424) (not b!135830) (not b!135833) b_and!8399 (not mapNonEmpty!4672) (not b!135827) (not b!135841) (not b!135828) b_and!8401 (not b!135835) tp_is_empty!2883 (not b!135834))
(check-sat b_and!8399 b_and!8401 (not b_next!2933) (not b_next!2935))
