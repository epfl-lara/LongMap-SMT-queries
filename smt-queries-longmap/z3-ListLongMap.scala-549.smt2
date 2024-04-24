; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14584 () Bool)

(assert start!14584)

(declare-fun b!138076 () Bool)

(declare-fun b_free!2977 () Bool)

(declare-fun b_next!2977 () Bool)

(assert (=> b!138076 (= b_free!2977 (not b_next!2977))))

(declare-fun tp!11392 () Bool)

(declare-fun b_and!8589 () Bool)

(assert (=> b!138076 (= tp!11392 b_and!8589)))

(declare-fun b!138086 () Bool)

(declare-fun b_free!2979 () Bool)

(declare-fun b_next!2979 () Bool)

(assert (=> b!138086 (= b_free!2979 (not b_next!2979))))

(declare-fun tp!11394 () Bool)

(declare-fun b_and!8591 () Bool)

(assert (=> b!138086 (= tp!11394 b_and!8591)))

(declare-fun mapNonEmpty!4745 () Bool)

(declare-fun mapRes!4746 () Bool)

(declare-fun tp!11391 () Bool)

(declare-fun e!89946 () Bool)

(assert (=> mapNonEmpty!4745 (= mapRes!4746 (and tp!11391 e!89946))))

(declare-datatypes ((V!3521 0))(
  ( (V!3522 (val!1497 Int)) )
))
(declare-datatypes ((array!4827 0))(
  ( (array!4828 (arr!2282 (Array (_ BitVec 32) (_ BitVec 64))) (size!2553 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1109 0))(
  ( (ValueCellFull!1109 (v!3247 V!3521)) (EmptyCell!1109) )
))
(declare-datatypes ((array!4829 0))(
  ( (array!4830 (arr!2283 (Array (_ BitVec 32) ValueCell!1109)) (size!2554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1126 0))(
  ( (LongMapFixedSize!1127 (defaultEntry!2915 Int) (mask!7243 (_ BitVec 32)) (extraKeys!2672 (_ BitVec 32)) (zeroValue!2766 V!3521) (minValue!2766 V!3521) (_size!612 (_ BitVec 32)) (_keys!4672 array!4827) (_values!2898 array!4829) (_vacant!612 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!914 0))(
  ( (Cell!915 (v!3248 LongMapFixedSize!1126)) )
))
(declare-datatypes ((LongMap!914 0))(
  ( (LongMap!915 (underlying!468 Cell!914)) )
))
(declare-fun thiss!992 () LongMap!914)

(declare-fun mapRest!4746 () (Array (_ BitVec 32) ValueCell!1109))

(declare-fun mapKey!4745 () (_ BitVec 32))

(declare-fun mapValue!4746 () ValueCell!1109)

(assert (=> mapNonEmpty!4745 (= (arr!2283 (_values!2898 (v!3248 (underlying!468 thiss!992)))) (store mapRest!4746 mapKey!4745 mapValue!4746))))

(declare-fun tp_is_empty!2905 () Bool)

(declare-fun e!89952 () Bool)

(declare-fun e!89957 () Bool)

(declare-fun array_inv!1423 (array!4827) Bool)

(declare-fun array_inv!1424 (array!4829) Bool)

(assert (=> b!138076 (= e!89952 (and tp!11392 tp_is_empty!2905 (array_inv!1423 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) (array_inv!1424 (_values!2898 (v!3248 (underlying!468 thiss!992)))) e!89957))))

(declare-fun b!138077 () Bool)

(declare-fun e!89960 () Bool)

(assert (=> b!138077 (= e!89960 tp_is_empty!2905)))

(declare-fun b!138078 () Bool)

(declare-fun e!89947 () Bool)

(declare-fun e!89949 () Bool)

(assert (=> b!138078 (= e!89947 e!89949)))

(declare-fun res!66128 () Bool)

(assert (=> b!138078 (=> (not res!66128) (not e!89949))))

(declare-datatypes ((tuple2!2598 0))(
  ( (tuple2!2599 (_1!1310 (_ BitVec 64)) (_2!1310 V!3521)) )
))
(declare-datatypes ((List!1707 0))(
  ( (Nil!1704) (Cons!1703 (h!2310 tuple2!2598) (t!6231 List!1707)) )
))
(declare-datatypes ((ListLongMap!1673 0))(
  ( (ListLongMap!1674 (toList!852 List!1707)) )
))
(declare-fun lt!72189 () ListLongMap!1673)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!895 (ListLongMap!1673 (_ BitVec 64)) Bool)

(assert (=> b!138078 (= res!66128 (contains!895 lt!72189 (select (arr!2282 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2600 0))(
  ( (tuple2!2601 (_1!1311 Bool) (_2!1311 LongMapFixedSize!1126)) )
))
(declare-fun lt!72191 () tuple2!2600)

(declare-fun newMap!16 () LongMapFixedSize!1126)

(declare-fun update!203 (LongMapFixedSize!1126 (_ BitVec 64) V!3521) tuple2!2600)

(declare-fun get!1512 (ValueCell!1109 V!3521) V!3521)

(declare-fun dynLambda!433 (Int (_ BitVec 64)) V!3521)

(assert (=> b!138078 (= lt!72191 (update!203 newMap!16 (select (arr!2282 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) from!355) (get!1512 (select (arr!2283 (_values!2898 (v!3248 (underlying!468 thiss!992)))) from!355) (dynLambda!433 (defaultEntry!2915 (v!3248 (underlying!468 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138079 () Bool)

(declare-fun e!89958 () Bool)

(assert (=> b!138079 (= e!89958 tp_is_empty!2905)))

(declare-fun b!138080 () Bool)

(declare-fun e!89955 () Bool)

(assert (=> b!138080 (= e!89955 e!89947)))

(declare-fun res!66130 () Bool)

(assert (=> b!138080 (=> (not res!66130) (not e!89947))))

(declare-fun lt!72188 () ListLongMap!1673)

(assert (=> b!138080 (= res!66130 (and (= lt!72188 lt!72189) (not (= (select (arr!2282 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2282 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1416 (LongMapFixedSize!1126) ListLongMap!1673)

(assert (=> b!138080 (= lt!72189 (map!1416 newMap!16))))

(declare-fun getCurrentListMap!526 (array!4827 array!4829 (_ BitVec 32) (_ BitVec 32) V!3521 V!3521 (_ BitVec 32) Int) ListLongMap!1673)

(assert (=> b!138080 (= lt!72188 (getCurrentListMap!526 (_keys!4672 (v!3248 (underlying!468 thiss!992))) (_values!2898 (v!3248 (underlying!468 thiss!992))) (mask!7243 (v!3248 (underlying!468 thiss!992))) (extraKeys!2672 (v!3248 (underlying!468 thiss!992))) (zeroValue!2766 (v!3248 (underlying!468 thiss!992))) (minValue!2766 (v!3248 (underlying!468 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2915 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138081 () Bool)

(declare-fun e!89954 () Bool)

(declare-fun mapRes!4745 () Bool)

(assert (=> b!138081 (= e!89954 (and e!89960 mapRes!4745))))

(declare-fun condMapEmpty!4745 () Bool)

(declare-fun mapDefault!4746 () ValueCell!1109)

(assert (=> b!138081 (= condMapEmpty!4745 (= (arr!2283 (_values!2898 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1109)) mapDefault!4746)))))

(declare-fun b!138082 () Bool)

(declare-fun e!89950 () Bool)

(assert (=> b!138082 (= e!89950 e!89952)))

(declare-fun b!138083 () Bool)

(assert (=> b!138083 (= e!89946 tp_is_empty!2905)))

(declare-fun b!138085 () Bool)

(declare-fun e!89959 () Bool)

(assert (=> b!138085 (= e!89957 (and e!89959 mapRes!4746))))

(declare-fun condMapEmpty!4746 () Bool)

(declare-fun mapDefault!4745 () ValueCell!1109)

(assert (=> b!138085 (= condMapEmpty!4746 (= (arr!2283 (_values!2898 (v!3248 (underlying!468 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1109)) mapDefault!4745)))))

(declare-fun e!89956 () Bool)

(assert (=> b!138086 (= e!89956 (and tp!11394 tp_is_empty!2905 (array_inv!1423 (_keys!4672 newMap!16)) (array_inv!1424 (_values!2898 newMap!16)) e!89954))))

(declare-fun b!138087 () Bool)

(declare-fun res!66126 () Bool)

(assert (=> b!138087 (=> (not res!66126) (not e!89955))))

(assert (=> b!138087 (= res!66126 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7243 newMap!16)) (_size!612 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138088 () Bool)

(declare-fun res!66129 () Bool)

(assert (=> b!138088 (=> (not res!66129) (not e!89955))))

(assert (=> b!138088 (= res!66129 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2553 (_keys!4672 (v!3248 (underlying!468 thiss!992)))))))))

(declare-fun b!138089 () Bool)

(declare-fun res!66127 () Bool)

(assert (=> b!138089 (=> (not res!66127) (not e!89955))))

(declare-fun valid!553 (LongMapFixedSize!1126) Bool)

(assert (=> b!138089 (= res!66127 (valid!553 newMap!16))))

(declare-fun b!138090 () Bool)

(assert (=> b!138090 (= e!89949 (not (or (bvsge (size!2553 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!2553 (_keys!4672 (v!3248 (underlying!468 thiss!992))))) (bvsle from!355 (size!2553 (_keys!4672 (v!3248 (underlying!468 thiss!992))))))))))

(declare-fun arrayContainsKey!0 (array!4827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138090 (arrayContainsKey!0 (_keys!4672 (v!3248 (underlying!468 thiss!992))) (select (arr!2282 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4347 0))(
  ( (Unit!4348) )
))
(declare-fun lt!72190 () Unit!4347)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!130 (array!4827 array!4829 (_ BitVec 32) (_ BitVec 32) V!3521 V!3521 (_ BitVec 64) (_ BitVec 32) Int) Unit!4347)

(assert (=> b!138090 (= lt!72190 (lemmaListMapContainsThenArrayContainsFrom!130 (_keys!4672 (v!3248 (underlying!468 thiss!992))) (_values!2898 (v!3248 (underlying!468 thiss!992))) (mask!7243 (v!3248 (underlying!468 thiss!992))) (extraKeys!2672 (v!3248 (underlying!468 thiss!992))) (zeroValue!2766 (v!3248 (underlying!468 thiss!992))) (minValue!2766 (v!3248 (underlying!468 thiss!992))) (select (arr!2282 (_keys!4672 (v!3248 (underlying!468 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2915 (v!3248 (underlying!468 thiss!992)))))))

(declare-fun b!138091 () Bool)

(declare-fun e!89948 () Bool)

(assert (=> b!138091 (= e!89948 e!89950)))

(declare-fun mapIsEmpty!4745 () Bool)

(assert (=> mapIsEmpty!4745 mapRes!4746))

(declare-fun mapNonEmpty!4746 () Bool)

(declare-fun tp!11393 () Bool)

(assert (=> mapNonEmpty!4746 (= mapRes!4745 (and tp!11393 e!89958))))

(declare-fun mapRest!4745 () (Array (_ BitVec 32) ValueCell!1109))

(declare-fun mapKey!4746 () (_ BitVec 32))

(declare-fun mapValue!4745 () ValueCell!1109)

(assert (=> mapNonEmpty!4746 (= (arr!2283 (_values!2898 newMap!16)) (store mapRest!4745 mapKey!4746 mapValue!4745))))

(declare-fun mapIsEmpty!4746 () Bool)

(assert (=> mapIsEmpty!4746 mapRes!4745))

(declare-fun res!66125 () Bool)

(assert (=> start!14584 (=> (not res!66125) (not e!89955))))

(declare-fun valid!554 (LongMap!914) Bool)

(assert (=> start!14584 (= res!66125 (valid!554 thiss!992))))

(assert (=> start!14584 e!89955))

(assert (=> start!14584 e!89948))

(assert (=> start!14584 true))

(assert (=> start!14584 e!89956))

(declare-fun b!138084 () Bool)

(assert (=> b!138084 (= e!89959 tp_is_empty!2905)))

(assert (= (and start!14584 res!66125) b!138088))

(assert (= (and b!138088 res!66129) b!138089))

(assert (= (and b!138089 res!66127) b!138087))

(assert (= (and b!138087 res!66126) b!138080))

(assert (= (and b!138080 res!66130) b!138078))

(assert (= (and b!138078 res!66128) b!138090))

(assert (= (and b!138085 condMapEmpty!4746) mapIsEmpty!4745))

(assert (= (and b!138085 (not condMapEmpty!4746)) mapNonEmpty!4745))

(get-info :version)

(assert (= (and mapNonEmpty!4745 ((_ is ValueCellFull!1109) mapValue!4746)) b!138083))

(assert (= (and b!138085 ((_ is ValueCellFull!1109) mapDefault!4745)) b!138084))

(assert (= b!138076 b!138085))

(assert (= b!138082 b!138076))

(assert (= b!138091 b!138082))

(assert (= start!14584 b!138091))

(assert (= (and b!138081 condMapEmpty!4745) mapIsEmpty!4746))

(assert (= (and b!138081 (not condMapEmpty!4745)) mapNonEmpty!4746))

(assert (= (and mapNonEmpty!4746 ((_ is ValueCellFull!1109) mapValue!4745)) b!138079))

(assert (= (and b!138081 ((_ is ValueCellFull!1109) mapDefault!4746)) b!138077))

(assert (= b!138086 b!138081))

(assert (= start!14584 b!138086))

(declare-fun b_lambda!6199 () Bool)

(assert (=> (not b_lambda!6199) (not b!138078)))

(declare-fun t!6228 () Bool)

(declare-fun tb!2485 () Bool)

(assert (=> (and b!138076 (= (defaultEntry!2915 (v!3248 (underlying!468 thiss!992))) (defaultEntry!2915 (v!3248 (underlying!468 thiss!992)))) t!6228) tb!2485))

(declare-fun result!4087 () Bool)

(assert (=> tb!2485 (= result!4087 tp_is_empty!2905)))

(assert (=> b!138078 t!6228))

(declare-fun b_and!8593 () Bool)

(assert (= b_and!8589 (and (=> t!6228 result!4087) b_and!8593)))

(declare-fun t!6230 () Bool)

(declare-fun tb!2487 () Bool)

(assert (=> (and b!138086 (= (defaultEntry!2915 newMap!16) (defaultEntry!2915 (v!3248 (underlying!468 thiss!992)))) t!6230) tb!2487))

(declare-fun result!4091 () Bool)

(assert (= result!4091 result!4087))

(assert (=> b!138078 t!6230))

(declare-fun b_and!8595 () Bool)

(assert (= b_and!8591 (and (=> t!6230 result!4091) b_and!8595)))

(declare-fun m!165255 () Bool)

(assert (=> mapNonEmpty!4745 m!165255))

(declare-fun m!165257 () Bool)

(assert (=> b!138089 m!165257))

(declare-fun m!165259 () Bool)

(assert (=> b!138078 m!165259))

(declare-fun m!165261 () Bool)

(assert (=> b!138078 m!165261))

(declare-fun m!165263 () Bool)

(assert (=> b!138078 m!165263))

(declare-fun m!165265 () Bool)

(assert (=> b!138078 m!165265))

(assert (=> b!138078 m!165265))

(declare-fun m!165267 () Bool)

(assert (=> b!138078 m!165267))

(assert (=> b!138078 m!165261))

(assert (=> b!138078 m!165265))

(assert (=> b!138078 m!165263))

(declare-fun m!165269 () Bool)

(assert (=> b!138078 m!165269))

(assert (=> b!138078 m!165259))

(assert (=> b!138090 m!165265))

(assert (=> b!138090 m!165265))

(declare-fun m!165271 () Bool)

(assert (=> b!138090 m!165271))

(assert (=> b!138090 m!165265))

(declare-fun m!165273 () Bool)

(assert (=> b!138090 m!165273))

(declare-fun m!165275 () Bool)

(assert (=> mapNonEmpty!4746 m!165275))

(declare-fun m!165277 () Bool)

(assert (=> b!138076 m!165277))

(declare-fun m!165279 () Bool)

(assert (=> b!138076 m!165279))

(declare-fun m!165281 () Bool)

(assert (=> b!138086 m!165281))

(declare-fun m!165283 () Bool)

(assert (=> b!138086 m!165283))

(assert (=> b!138080 m!165265))

(declare-fun m!165285 () Bool)

(assert (=> b!138080 m!165285))

(declare-fun m!165287 () Bool)

(assert (=> b!138080 m!165287))

(declare-fun m!165289 () Bool)

(assert (=> start!14584 m!165289))

(check-sat (not b!138090) tp_is_empty!2905 (not b!138080) (not b!138086) (not mapNonEmpty!4746) b_and!8595 (not b_next!2979) (not b!138089) (not b_lambda!6199) (not b_next!2977) (not start!14584) b_and!8593 (not b!138078) (not mapNonEmpty!4745) (not b!138076))
(check-sat b_and!8593 b_and!8595 (not b_next!2977) (not b_next!2979))
