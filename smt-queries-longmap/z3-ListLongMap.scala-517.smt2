; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13060 () Bool)

(assert start!13060)

(declare-fun b!113830 () Bool)

(declare-fun b_free!2597 () Bool)

(declare-fun b_next!2597 () Bool)

(assert (=> b!113830 (= b_free!2597 (not b_next!2597))))

(declare-fun tp!10149 () Bool)

(declare-fun b_and!6987 () Bool)

(assert (=> b!113830 (= tp!10149 b_and!6987)))

(declare-fun b!113820 () Bool)

(declare-fun b_free!2599 () Bool)

(declare-fun b_next!2599 () Bool)

(assert (=> b!113820 (= b_free!2599 (not b_next!2599))))

(declare-fun tp!10151 () Bool)

(declare-fun b_and!6989 () Bool)

(assert (=> b!113820 (= tp!10151 b_and!6989)))

(declare-fun b!113813 () Bool)

(declare-datatypes ((Unit!3553 0))(
  ( (Unit!3554) )
))
(declare-fun e!73967 () Unit!3553)

(declare-fun Unit!3555 () Unit!3553)

(assert (=> b!113813 (= e!73967 Unit!3555)))

(declare-fun b!113814 () Bool)

(declare-fun e!73966 () Bool)

(declare-fun e!73969 () Bool)

(assert (=> b!113814 (= e!73966 e!73969)))

(declare-fun res!56078 () Bool)

(assert (=> b!113814 (=> (not res!56078) (not e!73969))))

(declare-datatypes ((V!3267 0))(
  ( (V!3268 (val!1402 Int)) )
))
(declare-datatypes ((array!4431 0))(
  ( (array!4432 (arr!2099 (Array (_ BitVec 32) (_ BitVec 64))) (size!2359 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1014 0))(
  ( (ValueCellFull!1014 (v!2971 V!3267)) (EmptyCell!1014) )
))
(declare-datatypes ((array!4433 0))(
  ( (array!4434 (arr!2100 (Array (_ BitVec 32) ValueCell!1014)) (size!2360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!936 0))(
  ( (LongMapFixedSize!937 (defaultEntry!2674 Int) (mask!6864 (_ BitVec 32)) (extraKeys!2463 (_ BitVec 32)) (zeroValue!2541 V!3267) (minValue!2541 V!3267) (_size!517 (_ BitVec 32)) (_keys!4396 array!4431) (_values!2657 array!4433) (_vacant!517 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!736 0))(
  ( (Cell!737 (v!2972 LongMapFixedSize!936)) )
))
(declare-datatypes ((LongMap!736 0))(
  ( (LongMap!737 (underlying!379 Cell!736)) )
))
(declare-fun thiss!992 () LongMap!736)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!113814 (= res!56078 (and (not (= (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!59121 () V!3267)

(declare-fun get!1367 (ValueCell!1014 V!3267) V!3267)

(declare-fun dynLambda!395 (Int (_ BitVec 64)) V!3267)

(assert (=> b!113814 (= lt!59121 (get!1367 (select (arr!2100 (_values!2657 (v!2972 (underlying!379 thiss!992)))) from!355) (dynLambda!395 (defaultEntry!2674 (v!2972 (underlying!379 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113815 () Bool)

(declare-fun res!56082 () Bool)

(declare-fun e!73956 () Bool)

(assert (=> b!113815 (=> (not res!56082) (not e!73956))))

(declare-fun newMap!16 () LongMapFixedSize!936)

(declare-fun valid!440 (LongMapFixedSize!936) Bool)

(assert (=> b!113815 (= res!56082 (valid!440 newMap!16))))

(declare-fun b!113816 () Bool)

(declare-fun Unit!3556 () Unit!3553)

(assert (=> b!113816 (= e!73967 Unit!3556)))

(declare-fun lt!59117 () Unit!3553)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!117 (array!4431 array!4433 (_ BitVec 32) (_ BitVec 32) V!3267 V!3267 (_ BitVec 64) (_ BitVec 32) Int) Unit!3553)

(assert (=> b!113816 (= lt!59117 (lemmaListMapContainsThenArrayContainsFrom!117 (_keys!4396 (v!2972 (underlying!379 thiss!992))) (_values!2657 (v!2972 (underlying!379 thiss!992))) (mask!6864 (v!2972 (underlying!379 thiss!992))) (extraKeys!2463 (v!2972 (underlying!379 thiss!992))) (zeroValue!2541 (v!2972 (underlying!379 thiss!992))) (minValue!2541 (v!2972 (underlying!379 thiss!992))) (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2674 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!113816 (arrayContainsKey!0 (_keys!4396 (v!2972 (underlying!379 thiss!992))) (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59126 () Unit!3553)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4431 (_ BitVec 32) (_ BitVec 32)) Unit!3553)

(assert (=> b!113816 (= lt!59126 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4396 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1643 0))(
  ( (Nil!1640) (Cons!1639 (h!2239 (_ BitVec 64)) (t!5833 List!1643)) )
))
(declare-fun arrayNoDuplicates!0 (array!4431 (_ BitVec 32) List!1643) Bool)

(assert (=> b!113816 (arrayNoDuplicates!0 (_keys!4396 (v!2972 (underlying!379 thiss!992))) from!355 Nil!1640)))

(declare-fun lt!59120 () Unit!3553)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4431 (_ BitVec 32) (_ BitVec 64) List!1643) Unit!3553)

(assert (=> b!113816 (= lt!59120 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4396 (v!2972 (underlying!379 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) (Cons!1639 (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) Nil!1640)))))

(assert (=> b!113816 false))

(declare-fun b!113817 () Bool)

(declare-fun e!73964 () Bool)

(assert (=> b!113817 (= e!73969 e!73964)))

(declare-fun res!56081 () Bool)

(assert (=> b!113817 (=> (not res!56081) (not e!73964))))

(declare-datatypes ((tuple2!2460 0))(
  ( (tuple2!2461 (_1!1241 Bool) (_2!1241 LongMapFixedSize!936)) )
))
(declare-fun lt!59116 () tuple2!2460)

(assert (=> b!113817 (= res!56081 (and (_1!1241 lt!59116) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59115 () Unit!3553)

(assert (=> b!113817 (= lt!59115 e!73967)))

(declare-fun c!20399 () Bool)

(declare-datatypes ((tuple2!2462 0))(
  ( (tuple2!2463 (_1!1242 (_ BitVec 64)) (_2!1242 V!3267)) )
))
(declare-datatypes ((List!1644 0))(
  ( (Nil!1641) (Cons!1640 (h!2240 tuple2!2462) (t!5834 List!1644)) )
))
(declare-datatypes ((ListLongMap!1603 0))(
  ( (ListLongMap!1604 (toList!817 List!1644)) )
))
(declare-fun lt!59122 () ListLongMap!1603)

(declare-fun contains!849 (ListLongMap!1603 (_ BitVec 64)) Bool)

(assert (=> b!113817 (= c!20399 (contains!849 lt!59122 (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355)))))

(declare-fun update!167 (LongMapFixedSize!936 (_ BitVec 64) V!3267) tuple2!2460)

(assert (=> b!113817 (= lt!59116 (update!167 newMap!16 (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) lt!59121))))

(declare-fun b!113818 () Bool)

(declare-fun e!73958 () Bool)

(assert (=> b!113818 (= e!73964 (not e!73958))))

(declare-fun res!56080 () Bool)

(assert (=> b!113818 (=> res!56080 e!73958)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!113818 (= res!56080 (not (validMask!0 (mask!6864 (v!2972 (underlying!379 thiss!992))))))))

(declare-fun lt!59118 () ListLongMap!1603)

(declare-fun lt!59125 () tuple2!2462)

(declare-fun lt!59119 () tuple2!2462)

(declare-fun +!155 (ListLongMap!1603 tuple2!2462) ListLongMap!1603)

(assert (=> b!113818 (= (+!155 (+!155 lt!59118 lt!59125) lt!59119) (+!155 (+!155 lt!59118 lt!59119) lt!59125))))

(assert (=> b!113818 (= lt!59119 (tuple2!2463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2541 (v!2972 (underlying!379 thiss!992)))))))

(assert (=> b!113818 (= lt!59125 (tuple2!2463 (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) lt!59121))))

(declare-fun lt!59124 () Unit!3553)

(declare-fun addCommutativeForDiffKeys!67 (ListLongMap!1603 (_ BitVec 64) V!3267 (_ BitVec 64) V!3267) Unit!3553)

(assert (=> b!113818 (= lt!59124 (addCommutativeForDiffKeys!67 lt!59118 (select (arr!2099 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) from!355) lt!59121 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2541 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!121 (array!4431 array!4433 (_ BitVec 32) (_ BitVec 32) V!3267 V!3267 (_ BitVec 32) Int) ListLongMap!1603)

(assert (=> b!113818 (= lt!59118 (getCurrentListMapNoExtraKeys!121 (_keys!4396 (v!2972 (underlying!379 thiss!992))) (_values!2657 (v!2972 (underlying!379 thiss!992))) (mask!6864 (v!2972 (underlying!379 thiss!992))) (extraKeys!2463 (v!2972 (underlying!379 thiss!992))) (zeroValue!2541 (v!2972 (underlying!379 thiss!992))) (minValue!2541 (v!2972 (underlying!379 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2674 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun b!113819 () Bool)

(declare-fun e!73973 () Bool)

(declare-fun tp_is_empty!2715 () Bool)

(assert (=> b!113819 (= e!73973 tp_is_empty!2715)))

(declare-fun e!73961 () Bool)

(declare-fun e!73959 () Bool)

(declare-fun array_inv!1321 (array!4431) Bool)

(declare-fun array_inv!1322 (array!4433) Bool)

(assert (=> b!113820 (= e!73961 (and tp!10151 tp_is_empty!2715 (array_inv!1321 (_keys!4396 newMap!16)) (array_inv!1322 (_values!2657 newMap!16)) e!73959))))

(declare-fun b!113821 () Bool)

(declare-fun e!73960 () Bool)

(declare-fun e!73972 () Bool)

(assert (=> b!113821 (= e!73960 e!73972)))

(declare-fun b!113822 () Bool)

(declare-fun res!56073 () Bool)

(assert (=> b!113822 (=> res!56073 e!73958)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4431 (_ BitVec 32)) Bool)

(assert (=> b!113822 (= res!56073 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4396 (v!2972 (underlying!379 thiss!992))) (mask!6864 (v!2972 (underlying!379 thiss!992))))))))

(declare-fun mapNonEmpty!4073 () Bool)

(declare-fun mapRes!4073 () Bool)

(declare-fun tp!10150 () Bool)

(assert (=> mapNonEmpty!4073 (= mapRes!4073 (and tp!10150 e!73973))))

(declare-fun mapKey!4073 () (_ BitVec 32))

(declare-fun mapRest!4074 () (Array (_ BitVec 32) ValueCell!1014))

(declare-fun mapValue!4073 () ValueCell!1014)

(assert (=> mapNonEmpty!4073 (= (arr!2100 (_values!2657 (v!2972 (underlying!379 thiss!992)))) (store mapRest!4074 mapKey!4073 mapValue!4073))))

(declare-fun b!113823 () Bool)

(assert (=> b!113823 (= e!73956 e!73966)))

(declare-fun res!56083 () Bool)

(assert (=> b!113823 (=> (not res!56083) (not e!73966))))

(declare-fun lt!59123 () ListLongMap!1603)

(assert (=> b!113823 (= res!56083 (= lt!59123 lt!59122))))

(declare-fun map!1310 (LongMapFixedSize!936) ListLongMap!1603)

(assert (=> b!113823 (= lt!59122 (map!1310 newMap!16))))

(declare-fun getCurrentListMap!501 (array!4431 array!4433 (_ BitVec 32) (_ BitVec 32) V!3267 V!3267 (_ BitVec 32) Int) ListLongMap!1603)

(assert (=> b!113823 (= lt!59123 (getCurrentListMap!501 (_keys!4396 (v!2972 (underlying!379 thiss!992))) (_values!2657 (v!2972 (underlying!379 thiss!992))) (mask!6864 (v!2972 (underlying!379 thiss!992))) (extraKeys!2463 (v!2972 (underlying!379 thiss!992))) (zeroValue!2541 (v!2972 (underlying!379 thiss!992))) (minValue!2541 (v!2972 (underlying!379 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2674 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun b!113824 () Bool)

(declare-fun e!73962 () Bool)

(assert (=> b!113824 (= e!73962 tp_is_empty!2715)))

(declare-fun b!113825 () Bool)

(declare-fun e!73965 () Bool)

(assert (=> b!113825 (= e!73965 tp_is_empty!2715)))

(declare-fun b!113826 () Bool)

(declare-fun mapRes!4074 () Bool)

(assert (=> b!113826 (= e!73959 (and e!73965 mapRes!4074))))

(declare-fun condMapEmpty!4073 () Bool)

(declare-fun mapDefault!4073 () ValueCell!1014)

(assert (=> b!113826 (= condMapEmpty!4073 (= (arr!2100 (_values!2657 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1014)) mapDefault!4073)))))

(declare-fun b!113827 () Bool)

(declare-fun e!73957 () Bool)

(assert (=> b!113827 (= e!73957 (and e!73962 mapRes!4073))))

(declare-fun condMapEmpty!4074 () Bool)

(declare-fun mapDefault!4074 () ValueCell!1014)

(assert (=> b!113827 (= condMapEmpty!4074 (= (arr!2100 (_values!2657 (v!2972 (underlying!379 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1014)) mapDefault!4074)))))

(declare-fun mapIsEmpty!4073 () Bool)

(assert (=> mapIsEmpty!4073 mapRes!4074))

(declare-fun b!113828 () Bool)

(declare-fun res!56074 () Bool)

(assert (=> b!113828 (=> (not res!56074) (not e!73956))))

(assert (=> b!113828 (= res!56074 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2359 (_keys!4396 (v!2972 (underlying!379 thiss!992)))))))))

(declare-fun mapIsEmpty!4074 () Bool)

(assert (=> mapIsEmpty!4074 mapRes!4073))

(declare-fun b!113829 () Bool)

(declare-fun e!73970 () Bool)

(assert (=> b!113829 (= e!73970 tp_is_empty!2715)))

(declare-fun e!73968 () Bool)

(assert (=> b!113830 (= e!73968 (and tp!10149 tp_is_empty!2715 (array_inv!1321 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) (array_inv!1322 (_values!2657 (v!2972 (underlying!379 thiss!992)))) e!73957))))

(declare-fun res!56076 () Bool)

(assert (=> start!13060 (=> (not res!56076) (not e!73956))))

(declare-fun valid!441 (LongMap!736) Bool)

(assert (=> start!13060 (= res!56076 (valid!441 thiss!992))))

(assert (=> start!13060 e!73956))

(assert (=> start!13060 e!73960))

(assert (=> start!13060 true))

(assert (=> start!13060 e!73961))

(declare-fun mapNonEmpty!4074 () Bool)

(declare-fun tp!10152 () Bool)

(assert (=> mapNonEmpty!4074 (= mapRes!4074 (and tp!10152 e!73970))))

(declare-fun mapRest!4073 () (Array (_ BitVec 32) ValueCell!1014))

(declare-fun mapValue!4074 () ValueCell!1014)

(declare-fun mapKey!4074 () (_ BitVec 32))

(assert (=> mapNonEmpty!4074 (= (arr!2100 (_values!2657 newMap!16)) (store mapRest!4073 mapKey!4074 mapValue!4074))))

(declare-fun b!113831 () Bool)

(assert (=> b!113831 (= e!73972 e!73968)))

(declare-fun b!113832 () Bool)

(declare-fun res!56079 () Bool)

(assert (=> b!113832 (=> res!56079 e!73958)))

(assert (=> b!113832 (= res!56079 (not (arrayNoDuplicates!0 (_keys!4396 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000 Nil!1640)))))

(declare-fun b!113833 () Bool)

(declare-fun res!56077 () Bool)

(assert (=> b!113833 (=> (not res!56077) (not e!73956))))

(assert (=> b!113833 (= res!56077 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6864 newMap!16)) (_size!517 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun b!113834 () Bool)

(declare-fun res!56075 () Bool)

(assert (=> b!113834 (=> res!56075 e!73958)))

(assert (=> b!113834 (= res!56075 (or (not (= (size!2360 (_values!2657 (v!2972 (underlying!379 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6864 (v!2972 (underlying!379 thiss!992)))))) (not (= (size!2359 (_keys!4396 (v!2972 (underlying!379 thiss!992)))) (size!2360 (_values!2657 (v!2972 (underlying!379 thiss!992)))))) (bvslt (mask!6864 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2463 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2463 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!113835 () Bool)

(assert (=> b!113835 (= e!73958 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(assert (= (and start!13060 res!56076) b!113828))

(assert (= (and b!113828 res!56074) b!113815))

(assert (= (and b!113815 res!56082) b!113833))

(assert (= (and b!113833 res!56077) b!113823))

(assert (= (and b!113823 res!56083) b!113814))

(assert (= (and b!113814 res!56078) b!113817))

(assert (= (and b!113817 c!20399) b!113816))

(assert (= (and b!113817 (not c!20399)) b!113813))

(assert (= (and b!113817 res!56081) b!113818))

(assert (= (and b!113818 (not res!56080)) b!113834))

(assert (= (and b!113834 (not res!56075)) b!113822))

(assert (= (and b!113822 (not res!56073)) b!113832))

(assert (= (and b!113832 (not res!56079)) b!113835))

(assert (= (and b!113827 condMapEmpty!4074) mapIsEmpty!4074))

(assert (= (and b!113827 (not condMapEmpty!4074)) mapNonEmpty!4073))

(get-info :version)

(assert (= (and mapNonEmpty!4073 ((_ is ValueCellFull!1014) mapValue!4073)) b!113819))

(assert (= (and b!113827 ((_ is ValueCellFull!1014) mapDefault!4074)) b!113824))

(assert (= b!113830 b!113827))

(assert (= b!113831 b!113830))

(assert (= b!113821 b!113831))

(assert (= start!13060 b!113821))

(assert (= (and b!113826 condMapEmpty!4073) mapIsEmpty!4073))

(assert (= (and b!113826 (not condMapEmpty!4073)) mapNonEmpty!4074))

(assert (= (and mapNonEmpty!4074 ((_ is ValueCellFull!1014) mapValue!4074)) b!113829))

(assert (= (and b!113826 ((_ is ValueCellFull!1014) mapDefault!4073)) b!113825))

(assert (= b!113820 b!113826))

(assert (= start!13060 b!113820))

(declare-fun b_lambda!5095 () Bool)

(assert (=> (not b_lambda!5095) (not b!113814)))

(declare-fun t!5830 () Bool)

(declare-fun tb!2153 () Bool)

(assert (=> (and b!113830 (= (defaultEntry!2674 (v!2972 (underlying!379 thiss!992))) (defaultEntry!2674 (v!2972 (underlying!379 thiss!992)))) t!5830) tb!2153))

(declare-fun result!3599 () Bool)

(assert (=> tb!2153 (= result!3599 tp_is_empty!2715)))

(assert (=> b!113814 t!5830))

(declare-fun b_and!6991 () Bool)

(assert (= b_and!6987 (and (=> t!5830 result!3599) b_and!6991)))

(declare-fun t!5832 () Bool)

(declare-fun tb!2155 () Bool)

(assert (=> (and b!113820 (= (defaultEntry!2674 newMap!16) (defaultEntry!2674 (v!2972 (underlying!379 thiss!992)))) t!5832) tb!2155))

(declare-fun result!3603 () Bool)

(assert (= result!3603 result!3599))

(assert (=> b!113814 t!5832))

(declare-fun b_and!6993 () Bool)

(assert (= b_and!6989 (and (=> t!5832 result!3603) b_and!6993)))

(declare-fun m!130191 () Bool)

(assert (=> b!113823 m!130191))

(declare-fun m!130193 () Bool)

(assert (=> b!113823 m!130193))

(declare-fun m!130195 () Bool)

(assert (=> b!113830 m!130195))

(declare-fun m!130197 () Bool)

(assert (=> b!113830 m!130197))

(declare-fun m!130199 () Bool)

(assert (=> b!113814 m!130199))

(declare-fun m!130201 () Bool)

(assert (=> b!113814 m!130201))

(declare-fun m!130203 () Bool)

(assert (=> b!113814 m!130203))

(assert (=> b!113814 m!130201))

(assert (=> b!113814 m!130203))

(declare-fun m!130205 () Bool)

(assert (=> b!113814 m!130205))

(declare-fun m!130207 () Bool)

(assert (=> mapNonEmpty!4073 m!130207))

(declare-fun m!130209 () Bool)

(assert (=> b!113822 m!130209))

(declare-fun m!130211 () Bool)

(assert (=> b!113832 m!130211))

(declare-fun m!130213 () Bool)

(assert (=> b!113820 m!130213))

(declare-fun m!130215 () Bool)

(assert (=> b!113820 m!130215))

(declare-fun m!130217 () Bool)

(assert (=> mapNonEmpty!4074 m!130217))

(declare-fun m!130219 () Bool)

(assert (=> start!13060 m!130219))

(assert (=> b!113817 m!130199))

(assert (=> b!113817 m!130199))

(declare-fun m!130221 () Bool)

(assert (=> b!113817 m!130221))

(assert (=> b!113817 m!130199))

(declare-fun m!130223 () Bool)

(assert (=> b!113817 m!130223))

(declare-fun m!130225 () Bool)

(assert (=> b!113815 m!130225))

(declare-fun m!130227 () Bool)

(assert (=> b!113816 m!130227))

(declare-fun m!130229 () Bool)

(assert (=> b!113816 m!130229))

(assert (=> b!113816 m!130199))

(declare-fun m!130231 () Bool)

(assert (=> b!113816 m!130231))

(assert (=> b!113816 m!130199))

(assert (=> b!113816 m!130199))

(declare-fun m!130233 () Bool)

(assert (=> b!113816 m!130233))

(assert (=> b!113816 m!130199))

(declare-fun m!130235 () Bool)

(assert (=> b!113816 m!130235))

(declare-fun m!130237 () Bool)

(assert (=> b!113818 m!130237))

(assert (=> b!113818 m!130199))

(declare-fun m!130239 () Bool)

(assert (=> b!113818 m!130239))

(assert (=> b!113818 m!130199))

(declare-fun m!130241 () Bool)

(assert (=> b!113818 m!130241))

(declare-fun m!130243 () Bool)

(assert (=> b!113818 m!130243))

(assert (=> b!113818 m!130243))

(declare-fun m!130245 () Bool)

(assert (=> b!113818 m!130245))

(assert (=> b!113818 m!130239))

(declare-fun m!130247 () Bool)

(assert (=> b!113818 m!130247))

(declare-fun m!130249 () Bool)

(assert (=> b!113818 m!130249))

(check-sat (not b!113818) (not b!113830) (not b!113817) (not b!113814) (not b_next!2599) (not b!113832) tp_is_empty!2715 (not b_next!2597) (not b!113823) (not b_lambda!5095) b_and!6991 (not b!113822) b_and!6993 (not b!113820) (not start!13060) (not b!113815) (not b!113816) (not mapNonEmpty!4073) (not mapNonEmpty!4074))
(check-sat b_and!6991 b_and!6993 (not b_next!2597) (not b_next!2599))
