; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13524 () Bool)

(assert start!13524)

(declare-fun b!124077 () Bool)

(declare-fun b_free!2821 () Bool)

(declare-fun b_next!2821 () Bool)

(assert (=> b!124077 (= b_free!2821 (not b_next!2821))))

(declare-fun tp!10858 () Bool)

(declare-fun b_and!7601 () Bool)

(assert (=> b!124077 (= tp!10858 b_and!7601)))

(declare-fun b!124072 () Bool)

(declare-fun b_free!2823 () Bool)

(declare-fun b_next!2823 () Bool)

(assert (=> b!124072 (= b_free!2823 (not b_next!2823))))

(declare-fun tp!10859 () Bool)

(declare-fun b_and!7603 () Bool)

(assert (=> b!124072 (= tp!10859 b_and!7603)))

(declare-fun b!124066 () Bool)

(declare-fun e!81073 () Bool)

(declare-fun tp_is_empty!2827 () Bool)

(assert (=> b!124066 (= e!81073 tp_is_empty!2827)))

(declare-fun mapIsEmpty!4445 () Bool)

(declare-fun mapRes!4445 () Bool)

(assert (=> mapIsEmpty!4445 mapRes!4445))

(declare-fun b!124067 () Bool)

(declare-fun e!81081 () Bool)

(assert (=> b!124067 (= e!81081 tp_is_empty!2827)))

(declare-fun b!124068 () Bool)

(declare-fun res!60142 () Bool)

(declare-fun e!81070 () Bool)

(assert (=> b!124068 (=> (not res!60142) (not e!81070))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3417 0))(
  ( (V!3418 (val!1458 Int)) )
))
(declare-datatypes ((array!4647 0))(
  ( (array!4648 (arr!2200 (Array (_ BitVec 32) (_ BitVec 64))) (size!2464 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1070 0))(
  ( (ValueCellFull!1070 (v!3092 V!3417)) (EmptyCell!1070) )
))
(declare-datatypes ((array!4649 0))(
  ( (array!4650 (arr!2201 (Array (_ BitVec 32) ValueCell!1070)) (size!2465 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1048 0))(
  ( (LongMapFixedSize!1049 (defaultEntry!2759 Int) (mask!7001 (_ BitVec 32)) (extraKeys!2544 (_ BitVec 32)) (zeroValue!2624 V!3417) (minValue!2624 V!3417) (_size!573 (_ BitVec 32)) (_keys!4487 array!4647) (_values!2742 array!4649) (_vacant!573 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!836 0))(
  ( (Cell!837 (v!3093 LongMapFixedSize!1048)) )
))
(declare-datatypes ((LongMap!836 0))(
  ( (LongMap!837 (underlying!429 Cell!836)) )
))
(declare-fun thiss!992 () LongMap!836)

(assert (=> b!124068 (= res!60142 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992)))))))))

(declare-fun res!60143 () Bool)

(assert (=> start!13524 (=> (not res!60143) (not e!81070))))

(declare-fun valid!500 (LongMap!836) Bool)

(assert (=> start!13524 (= res!60143 (valid!500 thiss!992))))

(assert (=> start!13524 e!81070))

(declare-fun e!81080 () Bool)

(assert (=> start!13524 e!81080))

(assert (=> start!13524 true))

(declare-fun e!81079 () Bool)

(assert (=> start!13524 e!81079))

(declare-fun b!124069 () Bool)

(declare-fun e!81069 () Bool)

(assert (=> b!124069 (= e!81080 e!81069)))

(declare-fun b!124070 () Bool)

(declare-fun e!81068 () Bool)

(assert (=> b!124070 (= e!81070 e!81068)))

(declare-fun res!60146 () Bool)

(assert (=> b!124070 (=> (not res!60146) (not e!81068))))

(declare-datatypes ((tuple2!2526 0))(
  ( (tuple2!2527 (_1!1274 (_ BitVec 64)) (_2!1274 V!3417)) )
))
(declare-datatypes ((List!1686 0))(
  ( (Nil!1683) (Cons!1682 (h!2283 tuple2!2526) (t!5992 List!1686)) )
))
(declare-datatypes ((ListLongMap!1639 0))(
  ( (ListLongMap!1640 (toList!835 List!1686)) )
))
(declare-fun lt!63743 () ListLongMap!1639)

(declare-fun lt!63742 () ListLongMap!1639)

(assert (=> b!124070 (= res!60146 (and (= lt!63743 lt!63742) (not (= (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1048)

(declare-fun map!1362 (LongMapFixedSize!1048) ListLongMap!1639)

(assert (=> b!124070 (= lt!63742 (map!1362 newMap!16))))

(declare-fun getCurrentListMap!506 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) Int) ListLongMap!1639)

(assert (=> b!124070 (= lt!63743 (getCurrentListMap!506 (_keys!4487 (v!3093 (underlying!429 thiss!992))) (_values!2742 (v!3093 (underlying!429 thiss!992))) (mask!7001 (v!3093 (underlying!429 thiss!992))) (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) (minValue!2624 (v!3093 (underlying!429 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun mapNonEmpty!4445 () Bool)

(declare-fun mapRes!4446 () Bool)

(declare-fun tp!10860 () Bool)

(declare-fun e!81072 () Bool)

(assert (=> mapNonEmpty!4445 (= mapRes!4446 (and tp!10860 e!81072))))

(declare-fun mapValue!4446 () ValueCell!1070)

(declare-fun mapKey!4445 () (_ BitVec 32))

(declare-fun mapRest!4446 () (Array (_ BitVec 32) ValueCell!1070))

(assert (=> mapNonEmpty!4445 (= (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) (store mapRest!4446 mapKey!4445 mapValue!4446))))

(declare-fun b!124071 () Bool)

(declare-fun e!81074 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!124071 (= e!81074 (not (validMask!0 (mask!7001 (v!3093 (underlying!429 thiss!992))))))))

(declare-fun e!81071 () Bool)

(declare-fun array_inv!1397 (array!4647) Bool)

(declare-fun array_inv!1398 (array!4649) Bool)

(assert (=> b!124072 (= e!81079 (and tp!10859 tp_is_empty!2827 (array_inv!1397 (_keys!4487 newMap!16)) (array_inv!1398 (_values!2742 newMap!16)) e!81071))))

(declare-fun b!124073 () Bool)

(assert (=> b!124073 (= e!81068 e!81074)))

(declare-fun res!60147 () Bool)

(assert (=> b!124073 (=> (not res!60147) (not e!81074))))

(declare-fun contains!861 (ListLongMap!1639 (_ BitVec 64)) Bool)

(assert (=> b!124073 (= res!60147 (contains!861 lt!63742 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2528 0))(
  ( (tuple2!2529 (_1!1275 Bool) (_2!1275 LongMapFixedSize!1048)) )
))
(declare-fun lt!63741 () tuple2!2528)

(declare-fun update!179 (LongMapFixedSize!1048 (_ BitVec 64) V!3417) tuple2!2528)

(declare-fun get!1429 (ValueCell!1070 V!3417) V!3417)

(declare-fun dynLambda!405 (Int (_ BitVec 64)) V!3417)

(assert (=> b!124073 (= lt!63741 (update!179 newMap!16 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!124074 () Bool)

(declare-fun e!81075 () Bool)

(assert (=> b!124074 (= e!81069 e!81075)))

(declare-fun mapIsEmpty!4446 () Bool)

(assert (=> mapIsEmpty!4446 mapRes!4446))

(declare-fun b!124075 () Bool)

(declare-fun res!60145 () Bool)

(assert (=> b!124075 (=> (not res!60145) (not e!81070))))

(declare-fun valid!501 (LongMapFixedSize!1048) Bool)

(assert (=> b!124075 (= res!60145 (valid!501 newMap!16))))

(declare-fun b!124076 () Bool)

(declare-fun e!81077 () Bool)

(assert (=> b!124076 (= e!81077 tp_is_empty!2827)))

(declare-fun e!81067 () Bool)

(assert (=> b!124077 (= e!81075 (and tp!10858 tp_is_empty!2827 (array_inv!1397 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (array_inv!1398 (_values!2742 (v!3093 (underlying!429 thiss!992)))) e!81067))))

(declare-fun b!124078 () Bool)

(declare-fun res!60144 () Bool)

(assert (=> b!124078 (=> (not res!60144) (not e!81070))))

(assert (=> b!124078 (= res!60144 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7001 newMap!16)) (_size!573 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun b!124079 () Bool)

(assert (=> b!124079 (= e!81072 tp_is_empty!2827)))

(declare-fun b!124080 () Bool)

(assert (=> b!124080 (= e!81067 (and e!81081 mapRes!4446))))

(declare-fun condMapEmpty!4445 () Bool)

(declare-fun mapDefault!4445 () ValueCell!1070)

(assert (=> b!124080 (= condMapEmpty!4445 (= (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4445)))))

(declare-fun b!124081 () Bool)

(assert (=> b!124081 (= e!81071 (and e!81073 mapRes!4445))))

(declare-fun condMapEmpty!4446 () Bool)

(declare-fun mapDefault!4446 () ValueCell!1070)

(assert (=> b!124081 (= condMapEmpty!4446 (= (arr!2201 (_values!2742 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4446)))))

(declare-fun mapNonEmpty!4446 () Bool)

(declare-fun tp!10857 () Bool)

(assert (=> mapNonEmpty!4446 (= mapRes!4445 (and tp!10857 e!81077))))

(declare-fun mapRest!4445 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapKey!4446 () (_ BitVec 32))

(declare-fun mapValue!4445 () ValueCell!1070)

(assert (=> mapNonEmpty!4446 (= (arr!2201 (_values!2742 newMap!16)) (store mapRest!4445 mapKey!4446 mapValue!4445))))

(assert (= (and start!13524 res!60143) b!124068))

(assert (= (and b!124068 res!60142) b!124075))

(assert (= (and b!124075 res!60145) b!124078))

(assert (= (and b!124078 res!60144) b!124070))

(assert (= (and b!124070 res!60146) b!124073))

(assert (= (and b!124073 res!60147) b!124071))

(assert (= (and b!124080 condMapEmpty!4445) mapIsEmpty!4446))

(assert (= (and b!124080 (not condMapEmpty!4445)) mapNonEmpty!4445))

(get-info :version)

(assert (= (and mapNonEmpty!4445 ((_ is ValueCellFull!1070) mapValue!4446)) b!124079))

(assert (= (and b!124080 ((_ is ValueCellFull!1070) mapDefault!4445)) b!124067))

(assert (= b!124077 b!124080))

(assert (= b!124074 b!124077))

(assert (= b!124069 b!124074))

(assert (= start!13524 b!124069))

(assert (= (and b!124081 condMapEmpty!4446) mapIsEmpty!4445))

(assert (= (and b!124081 (not condMapEmpty!4446)) mapNonEmpty!4446))

(assert (= (and mapNonEmpty!4446 ((_ is ValueCellFull!1070) mapValue!4445)) b!124076))

(assert (= (and b!124081 ((_ is ValueCellFull!1070) mapDefault!4446)) b!124066))

(assert (= b!124072 b!124081))

(assert (= start!13524 b!124072))

(declare-fun b_lambda!5443 () Bool)

(assert (=> (not b_lambda!5443) (not b!124073)))

(declare-fun t!5989 () Bool)

(declare-fun tb!2269 () Bool)

(assert (=> (and b!124077 (= (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))) t!5989) tb!2269))

(declare-fun result!3775 () Bool)

(assert (=> tb!2269 (= result!3775 tp_is_empty!2827)))

(assert (=> b!124073 t!5989))

(declare-fun b_and!7605 () Bool)

(assert (= b_and!7601 (and (=> t!5989 result!3775) b_and!7605)))

(declare-fun t!5991 () Bool)

(declare-fun tb!2271 () Bool)

(assert (=> (and b!124072 (= (defaultEntry!2759 newMap!16) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))) t!5991) tb!2271))

(declare-fun result!3779 () Bool)

(assert (= result!3779 result!3775))

(assert (=> b!124073 t!5991))

(declare-fun b_and!7607 () Bool)

(assert (= b_and!7603 (and (=> t!5991 result!3779) b_and!7607)))

(declare-fun m!144159 () Bool)

(assert (=> b!124072 m!144159))

(declare-fun m!144161 () Bool)

(assert (=> b!124072 m!144161))

(declare-fun m!144163 () Bool)

(assert (=> mapNonEmpty!4445 m!144163))

(declare-fun m!144165 () Bool)

(assert (=> b!124071 m!144165))

(declare-fun m!144167 () Bool)

(assert (=> mapNonEmpty!4446 m!144167))

(declare-fun m!144169 () Bool)

(assert (=> start!13524 m!144169))

(declare-fun m!144171 () Bool)

(assert (=> b!124075 m!144171))

(declare-fun m!144173 () Bool)

(assert (=> b!124070 m!144173))

(declare-fun m!144175 () Bool)

(assert (=> b!124070 m!144175))

(declare-fun m!144177 () Bool)

(assert (=> b!124070 m!144177))

(declare-fun m!144179 () Bool)

(assert (=> b!124077 m!144179))

(declare-fun m!144181 () Bool)

(assert (=> b!124077 m!144181))

(declare-fun m!144183 () Bool)

(assert (=> b!124073 m!144183))

(declare-fun m!144185 () Bool)

(assert (=> b!124073 m!144185))

(declare-fun m!144187 () Bool)

(assert (=> b!124073 m!144187))

(assert (=> b!124073 m!144173))

(assert (=> b!124073 m!144185))

(assert (=> b!124073 m!144173))

(declare-fun m!144189 () Bool)

(assert (=> b!124073 m!144189))

(assert (=> b!124073 m!144173))

(assert (=> b!124073 m!144187))

(declare-fun m!144191 () Bool)

(assert (=> b!124073 m!144191))

(assert (=> b!124073 m!144183))

(check-sat (not mapNonEmpty!4446) (not b!124072) (not b!124075) (not b_next!2823) (not b_next!2821) (not b!124077) (not b!124071) tp_is_empty!2827 b_and!7607 b_and!7605 (not mapNonEmpty!4445) (not b!124070) (not b_lambda!5443) (not b!124073) (not start!13524))
(check-sat b_and!7605 b_and!7607 (not b_next!2821) (not b_next!2823))
(get-model)

(declare-fun b_lambda!5449 () Bool)

(assert (= b_lambda!5443 (or (and b!124077 b_free!2821) (and b!124072 b_free!2823 (= (defaultEntry!2759 newMap!16) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))))) b_lambda!5449)))

(check-sat (not mapNonEmpty!4446) (not b_lambda!5449) (not b!124072) (not b!124070) (not b!124075) (not b_next!2823) (not b_next!2821) (not b!124077) (not b!124071) tp_is_empty!2827 b_and!7607 b_and!7605 (not mapNonEmpty!4445) (not b!124073) (not start!13524))
(check-sat b_and!7605 b_and!7607 (not b_next!2821) (not b_next!2823))
(get-model)

(declare-fun d!37355 () Bool)

(assert (=> d!37355 (= (validMask!0 (mask!7001 (v!3093 (underlying!429 thiss!992)))) (and (or (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000001111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000011111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000001111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000011111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000001111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000011111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000001111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000011111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000000111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000001111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000011111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000000111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000001111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000011111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000000111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000001111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000011111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000000111111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000001111111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000011111111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00000111111111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00001111111111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00011111111111111111111111111111) (= (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7001 (v!3093 (underlying!429 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!124071 d!37355))

(declare-fun d!37357 () Bool)

(declare-fun res!60190 () Bool)

(declare-fun e!81174 () Bool)

(assert (=> d!37357 (=> (not res!60190) (not e!81174))))

(declare-fun simpleValid!85 (LongMapFixedSize!1048) Bool)

(assert (=> d!37357 (= res!60190 (simpleValid!85 newMap!16))))

(assert (=> d!37357 (= (valid!501 newMap!16) e!81174)))

(declare-fun b!124190 () Bool)

(declare-fun res!60191 () Bool)

(assert (=> b!124190 (=> (not res!60191) (not e!81174))))

(declare-fun arrayCountValidKeys!0 (array!4647 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!124190 (= res!60191 (= (arrayCountValidKeys!0 (_keys!4487 newMap!16) #b00000000000000000000000000000000 (size!2464 (_keys!4487 newMap!16))) (_size!573 newMap!16)))))

(declare-fun b!124191 () Bool)

(declare-fun res!60192 () Bool)

(assert (=> b!124191 (=> (not res!60192) (not e!81174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4647 (_ BitVec 32)) Bool)

(assert (=> b!124191 (= res!60192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4487 newMap!16) (mask!7001 newMap!16)))))

(declare-fun b!124192 () Bool)

(declare-datatypes ((List!1688 0))(
  ( (Nil!1685) (Cons!1684 (h!2285 (_ BitVec 64)) (t!6002 List!1688)) )
))
(declare-fun arrayNoDuplicates!0 (array!4647 (_ BitVec 32) List!1688) Bool)

(assert (=> b!124192 (= e!81174 (arrayNoDuplicates!0 (_keys!4487 newMap!16) #b00000000000000000000000000000000 Nil!1685))))

(assert (= (and d!37357 res!60190) b!124190))

(assert (= (and b!124190 res!60191) b!124191))

(assert (= (and b!124191 res!60192) b!124192))

(declare-fun m!144261 () Bool)

(assert (=> d!37357 m!144261))

(declare-fun m!144263 () Bool)

(assert (=> b!124190 m!144263))

(declare-fun m!144265 () Bool)

(assert (=> b!124191 m!144265))

(declare-fun m!144267 () Bool)

(assert (=> b!124192 m!144267))

(assert (=> b!124075 d!37357))

(declare-fun d!37359 () Bool)

(assert (=> d!37359 (= (map!1362 newMap!16) (getCurrentListMap!506 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun bs!5140 () Bool)

(assert (= bs!5140 d!37359))

(declare-fun m!144269 () Bool)

(assert (=> bs!5140 m!144269))

(assert (=> b!124070 d!37359))

(declare-fun b!124235 () Bool)

(declare-fun res!60219 () Bool)

(declare-fun e!81202 () Bool)

(assert (=> b!124235 (=> (not res!60219) (not e!81202))))

(declare-fun e!81201 () Bool)

(assert (=> b!124235 (= res!60219 e!81201)))

(declare-fun res!60218 () Bool)

(assert (=> b!124235 (=> res!60218 e!81201)))

(declare-fun e!81210 () Bool)

(assert (=> b!124235 (= res!60218 (not e!81210))))

(declare-fun res!60213 () Bool)

(assert (=> b!124235 (=> (not res!60213) (not e!81210))))

(assert (=> b!124235 (= res!60213 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992))))))))

(declare-fun b!124236 () Bool)

(declare-fun e!81208 () ListLongMap!1639)

(declare-fun call!13173 () ListLongMap!1639)

(assert (=> b!124236 (= e!81208 call!13173)))

(declare-fun b!124237 () Bool)

(declare-fun e!81203 () ListLongMap!1639)

(declare-fun e!81209 () ListLongMap!1639)

(assert (=> b!124237 (= e!81203 e!81209)))

(declare-fun c!22594 () Bool)

(assert (=> b!124237 (= c!22594 (and (not (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124239 () Bool)

(declare-fun e!81211 () Bool)

(declare-fun lt!63807 () ListLongMap!1639)

(declare-fun apply!109 (ListLongMap!1639 (_ BitVec 64)) V!3417)

(assert (=> b!124239 (= e!81211 (= (apply!109 lt!63807 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2624 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun b!124240 () Bool)

(declare-fun res!60211 () Bool)

(assert (=> b!124240 (=> (not res!60211) (not e!81202))))

(declare-fun e!81205 () Bool)

(assert (=> b!124240 (= res!60211 e!81205)))

(declare-fun c!22591 () Bool)

(assert (=> b!124240 (= c!22591 (not (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124241 () Bool)

(declare-datatypes ((Unit!3859 0))(
  ( (Unit!3860) )
))
(declare-fun e!81206 () Unit!3859)

(declare-fun Unit!3861 () Unit!3859)

(assert (=> b!124241 (= e!81206 Unit!3861)))

(declare-fun bm!13169 () Bool)

(declare-fun call!13176 () ListLongMap!1639)

(declare-fun call!13174 () ListLongMap!1639)

(assert (=> bm!13169 (= call!13176 call!13174)))

(declare-fun b!124242 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!124242 (= e!81210 (validKeyInArray!0 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124243 () Bool)

(declare-fun call!13172 () ListLongMap!1639)

(declare-fun +!156 (ListLongMap!1639 tuple2!2526) ListLongMap!1639)

(assert (=> b!124243 (= e!81203 (+!156 call!13172 (tuple2!2527 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2624 (v!3093 (underlying!429 thiss!992))))))))

(declare-fun bm!13170 () Bool)

(declare-fun call!13178 () Bool)

(assert (=> bm!13170 (= call!13178 (contains!861 lt!63807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124244 () Bool)

(declare-fun e!81212 () Bool)

(assert (=> b!124244 (= e!81202 e!81212)))

(declare-fun c!22595 () Bool)

(assert (=> b!124244 (= c!22595 (not (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13171 () Bool)

(declare-fun call!13177 () ListLongMap!1639)

(declare-fun getCurrentListMapNoExtraKeys!121 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) Int) ListLongMap!1639)

(assert (=> bm!13171 (= call!13177 (getCurrentListMapNoExtraKeys!121 (_keys!4487 (v!3093 (underlying!429 thiss!992))) (_values!2742 (v!3093 (underlying!429 thiss!992))) (mask!7001 (v!3093 (underlying!429 thiss!992))) (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) (minValue!2624 (v!3093 (underlying!429 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun b!124245 () Bool)

(assert (=> b!124245 (= e!81209 call!13173)))

(declare-fun b!124238 () Bool)

(assert (=> b!124238 (= e!81205 e!81211)))

(declare-fun res!60217 () Bool)

(assert (=> b!124238 (= res!60217 call!13178)))

(assert (=> b!124238 (=> (not res!60217) (not e!81211))))

(declare-fun d!37361 () Bool)

(assert (=> d!37361 e!81202))

(declare-fun res!60214 () Bool)

(assert (=> d!37361 (=> (not res!60214) (not e!81202))))

(assert (=> d!37361 (= res!60214 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992))))))))))

(declare-fun lt!63810 () ListLongMap!1639)

(assert (=> d!37361 (= lt!63807 lt!63810)))

(declare-fun lt!63814 () Unit!3859)

(assert (=> d!37361 (= lt!63814 e!81206)))

(declare-fun c!22592 () Bool)

(declare-fun e!81207 () Bool)

(assert (=> d!37361 (= c!22592 e!81207)))

(declare-fun res!60216 () Bool)

(assert (=> d!37361 (=> (not res!60216) (not e!81207))))

(assert (=> d!37361 (= res!60216 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992))))))))

(assert (=> d!37361 (= lt!63810 e!81203)))

(declare-fun c!22593 () Bool)

(assert (=> d!37361 (= c!22593 (and (not (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37361 (validMask!0 (mask!7001 (v!3093 (underlying!429 thiss!992))))))

(assert (=> d!37361 (= (getCurrentListMap!506 (_keys!4487 (v!3093 (underlying!429 thiss!992))) (_values!2742 (v!3093 (underlying!429 thiss!992))) (mask!7001 (v!3093 (underlying!429 thiss!992))) (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) (minValue!2624 (v!3093 (underlying!429 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))) lt!63807)))

(declare-fun bm!13172 () Bool)

(assert (=> bm!13172 (= call!13174 call!13177)))

(declare-fun b!124246 () Bool)

(declare-fun e!81213 () Bool)

(assert (=> b!124246 (= e!81213 (= (apply!109 lt!63807 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2624 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun b!124247 () Bool)

(declare-fun call!13175 () Bool)

(assert (=> b!124247 (= e!81212 (not call!13175))))

(declare-fun b!124248 () Bool)

(declare-fun e!81204 () Bool)

(assert (=> b!124248 (= e!81201 e!81204)))

(declare-fun res!60212 () Bool)

(assert (=> b!124248 (=> (not res!60212) (not e!81204))))

(assert (=> b!124248 (= res!60212 (contains!861 lt!63807 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124248 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992))))))))

(declare-fun bm!13173 () Bool)

(assert (=> bm!13173 (= call!13172 (+!156 (ite c!22593 call!13177 (ite c!22594 call!13174 call!13176)) (ite (or c!22593 c!22594) (tuple2!2527 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2624 (v!3093 (underlying!429 thiss!992)))) (tuple2!2527 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2624 (v!3093 (underlying!429 thiss!992)))))))))

(declare-fun bm!13174 () Bool)

(assert (=> bm!13174 (= call!13173 call!13172)))

(declare-fun b!124249 () Bool)

(assert (=> b!124249 (= e!81207 (validKeyInArray!0 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13175 () Bool)

(assert (=> bm!13175 (= call!13175 (contains!861 lt!63807 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124250 () Bool)

(declare-fun lt!63822 () Unit!3859)

(assert (=> b!124250 (= e!81206 lt!63822)))

(declare-fun lt!63811 () ListLongMap!1639)

(assert (=> b!124250 (= lt!63811 (getCurrentListMapNoExtraKeys!121 (_keys!4487 (v!3093 (underlying!429 thiss!992))) (_values!2742 (v!3093 (underlying!429 thiss!992))) (mask!7001 (v!3093 (underlying!429 thiss!992))) (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) (minValue!2624 (v!3093 (underlying!429 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun lt!63817 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63818 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63818 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63816 () Unit!3859)

(declare-fun addStillContains!85 (ListLongMap!1639 (_ BitVec 64) V!3417 (_ BitVec 64)) Unit!3859)

(assert (=> b!124250 (= lt!63816 (addStillContains!85 lt!63811 lt!63817 (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) lt!63818))))

(assert (=> b!124250 (contains!861 (+!156 lt!63811 (tuple2!2527 lt!63817 (zeroValue!2624 (v!3093 (underlying!429 thiss!992))))) lt!63818)))

(declare-fun lt!63815 () Unit!3859)

(assert (=> b!124250 (= lt!63815 lt!63816)))

(declare-fun lt!63826 () ListLongMap!1639)

(assert (=> b!124250 (= lt!63826 (getCurrentListMapNoExtraKeys!121 (_keys!4487 (v!3093 (underlying!429 thiss!992))) (_values!2742 (v!3093 (underlying!429 thiss!992))) (mask!7001 (v!3093 (underlying!429 thiss!992))) (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) (minValue!2624 (v!3093 (underlying!429 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun lt!63825 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63825 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63827 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63827 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63812 () Unit!3859)

(declare-fun addApplyDifferent!85 (ListLongMap!1639 (_ BitVec 64) V!3417 (_ BitVec 64)) Unit!3859)

(assert (=> b!124250 (= lt!63812 (addApplyDifferent!85 lt!63826 lt!63825 (minValue!2624 (v!3093 (underlying!429 thiss!992))) lt!63827))))

(assert (=> b!124250 (= (apply!109 (+!156 lt!63826 (tuple2!2527 lt!63825 (minValue!2624 (v!3093 (underlying!429 thiss!992))))) lt!63827) (apply!109 lt!63826 lt!63827))))

(declare-fun lt!63821 () Unit!3859)

(assert (=> b!124250 (= lt!63821 lt!63812)))

(declare-fun lt!63808 () ListLongMap!1639)

(assert (=> b!124250 (= lt!63808 (getCurrentListMapNoExtraKeys!121 (_keys!4487 (v!3093 (underlying!429 thiss!992))) (_values!2742 (v!3093 (underlying!429 thiss!992))) (mask!7001 (v!3093 (underlying!429 thiss!992))) (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) (minValue!2624 (v!3093 (underlying!429 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun lt!63819 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63824 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63824 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63820 () Unit!3859)

(assert (=> b!124250 (= lt!63820 (addApplyDifferent!85 lt!63808 lt!63819 (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) lt!63824))))

(assert (=> b!124250 (= (apply!109 (+!156 lt!63808 (tuple2!2527 lt!63819 (zeroValue!2624 (v!3093 (underlying!429 thiss!992))))) lt!63824) (apply!109 lt!63808 lt!63824))))

(declare-fun lt!63823 () Unit!3859)

(assert (=> b!124250 (= lt!63823 lt!63820)))

(declare-fun lt!63806 () ListLongMap!1639)

(assert (=> b!124250 (= lt!63806 (getCurrentListMapNoExtraKeys!121 (_keys!4487 (v!3093 (underlying!429 thiss!992))) (_values!2742 (v!3093 (underlying!429 thiss!992))) (mask!7001 (v!3093 (underlying!429 thiss!992))) (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) (zeroValue!2624 (v!3093 (underlying!429 thiss!992))) (minValue!2624 (v!3093 (underlying!429 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992)))))))

(declare-fun lt!63809 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63813 () (_ BitVec 64))

(assert (=> b!124250 (= lt!63813 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!124250 (= lt!63822 (addApplyDifferent!85 lt!63806 lt!63809 (minValue!2624 (v!3093 (underlying!429 thiss!992))) lt!63813))))

(assert (=> b!124250 (= (apply!109 (+!156 lt!63806 (tuple2!2527 lt!63809 (minValue!2624 (v!3093 (underlying!429 thiss!992))))) lt!63813) (apply!109 lt!63806 lt!63813))))

(declare-fun b!124251 () Bool)

(assert (=> b!124251 (= e!81212 e!81213)))

(declare-fun res!60215 () Bool)

(assert (=> b!124251 (= res!60215 call!13175)))

(assert (=> b!124251 (=> (not res!60215) (not e!81213))))

(declare-fun b!124252 () Bool)

(assert (=> b!124252 (= e!81208 call!13176)))

(declare-fun b!124253 () Bool)

(declare-fun c!22596 () Bool)

(assert (=> b!124253 (= c!22596 (and (not (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2544 (v!3093 (underlying!429 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124253 (= e!81209 e!81208)))

(declare-fun b!124254 () Bool)

(assert (=> b!124254 (= e!81205 (not call!13178))))

(declare-fun b!124255 () Bool)

(assert (=> b!124255 (= e!81204 (= (apply!109 lt!63807 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124255 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2465 (_values!2742 (v!3093 (underlying!429 thiss!992))))))))

(assert (=> b!124255 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992))))))))

(assert (= (and d!37361 c!22593) b!124243))

(assert (= (and d!37361 (not c!22593)) b!124237))

(assert (= (and b!124237 c!22594) b!124245))

(assert (= (and b!124237 (not c!22594)) b!124253))

(assert (= (and b!124253 c!22596) b!124236))

(assert (= (and b!124253 (not c!22596)) b!124252))

(assert (= (or b!124236 b!124252) bm!13169))

(assert (= (or b!124245 bm!13169) bm!13172))

(assert (= (or b!124245 b!124236) bm!13174))

(assert (= (or b!124243 bm!13172) bm!13171))

(assert (= (or b!124243 bm!13174) bm!13173))

(assert (= (and d!37361 res!60216) b!124249))

(assert (= (and d!37361 c!22592) b!124250))

(assert (= (and d!37361 (not c!22592)) b!124241))

(assert (= (and d!37361 res!60214) b!124235))

(assert (= (and b!124235 res!60213) b!124242))

(assert (= (and b!124235 (not res!60218)) b!124248))

(assert (= (and b!124248 res!60212) b!124255))

(assert (= (and b!124235 res!60219) b!124240))

(assert (= (and b!124240 c!22591) b!124238))

(assert (= (and b!124240 (not c!22591)) b!124254))

(assert (= (and b!124238 res!60217) b!124239))

(assert (= (or b!124238 b!124254) bm!13170))

(assert (= (and b!124240 res!60211) b!124244))

(assert (= (and b!124244 c!22595) b!124251))

(assert (= (and b!124244 (not c!22595)) b!124247))

(assert (= (and b!124251 res!60215) b!124246))

(assert (= (or b!124251 b!124247) bm!13175))

(declare-fun b_lambda!5451 () Bool)

(assert (=> (not b_lambda!5451) (not b!124255)))

(assert (=> b!124255 t!5989))

(declare-fun b_and!7625 () Bool)

(assert (= b_and!7605 (and (=> t!5989 result!3775) b_and!7625)))

(assert (=> b!124255 t!5991))

(declare-fun b_and!7627 () Bool)

(assert (= b_and!7607 (and (=> t!5991 result!3779) b_and!7627)))

(declare-fun m!144271 () Bool)

(assert (=> b!124243 m!144271))

(declare-fun m!144273 () Bool)

(assert (=> bm!13173 m!144273))

(declare-fun m!144275 () Bool)

(assert (=> b!124250 m!144275))

(declare-fun m!144277 () Bool)

(assert (=> b!124250 m!144277))

(declare-fun m!144279 () Bool)

(assert (=> b!124250 m!144279))

(declare-fun m!144281 () Bool)

(assert (=> b!124250 m!144281))

(declare-fun m!144283 () Bool)

(assert (=> b!124250 m!144283))

(declare-fun m!144285 () Bool)

(assert (=> b!124250 m!144285))

(declare-fun m!144287 () Bool)

(assert (=> b!124250 m!144287))

(assert (=> b!124250 m!144283))

(declare-fun m!144289 () Bool)

(assert (=> b!124250 m!144289))

(declare-fun m!144291 () Bool)

(assert (=> b!124250 m!144291))

(declare-fun m!144293 () Bool)

(assert (=> b!124250 m!144293))

(declare-fun m!144295 () Bool)

(assert (=> b!124250 m!144295))

(declare-fun m!144297 () Bool)

(assert (=> b!124250 m!144297))

(declare-fun m!144299 () Bool)

(assert (=> b!124250 m!144299))

(declare-fun m!144301 () Bool)

(assert (=> b!124250 m!144301))

(assert (=> b!124250 m!144297))

(assert (=> b!124250 m!144279))

(declare-fun m!144303 () Bool)

(assert (=> b!124250 m!144303))

(assert (=> b!124250 m!144293))

(declare-fun m!144305 () Bool)

(assert (=> b!124250 m!144305))

(declare-fun m!144307 () Bool)

(assert (=> b!124250 m!144307))

(declare-fun m!144309 () Bool)

(assert (=> b!124246 m!144309))

(assert (=> b!124242 m!144277))

(assert (=> b!124242 m!144277))

(declare-fun m!144311 () Bool)

(assert (=> b!124242 m!144311))

(assert (=> b!124249 m!144277))

(assert (=> b!124249 m!144277))

(assert (=> b!124249 m!144311))

(assert (=> d!37361 m!144165))

(declare-fun m!144313 () Bool)

(assert (=> b!124239 m!144313))

(declare-fun m!144315 () Bool)

(assert (=> bm!13175 m!144315))

(assert (=> b!124255 m!144277))

(declare-fun m!144317 () Bool)

(assert (=> b!124255 m!144317))

(assert (=> b!124255 m!144185))

(declare-fun m!144319 () Bool)

(assert (=> b!124255 m!144319))

(assert (=> b!124255 m!144317))

(assert (=> b!124255 m!144277))

(declare-fun m!144321 () Bool)

(assert (=> b!124255 m!144321))

(assert (=> b!124255 m!144185))

(assert (=> bm!13171 m!144289))

(assert (=> b!124248 m!144277))

(assert (=> b!124248 m!144277))

(declare-fun m!144323 () Bool)

(assert (=> b!124248 m!144323))

(declare-fun m!144325 () Bool)

(assert (=> bm!13170 m!144325))

(assert (=> b!124070 d!37361))

(declare-fun d!37363 () Bool)

(declare-fun e!81219 () Bool)

(assert (=> d!37363 e!81219))

(declare-fun res!60222 () Bool)

(assert (=> d!37363 (=> res!60222 e!81219)))

(declare-fun lt!63839 () Bool)

(assert (=> d!37363 (= res!60222 (not lt!63839))))

(declare-fun lt!63838 () Bool)

(assert (=> d!37363 (= lt!63839 lt!63838)))

(declare-fun lt!63836 () Unit!3859)

(declare-fun e!81218 () Unit!3859)

(assert (=> d!37363 (= lt!63836 e!81218)))

(declare-fun c!22599 () Bool)

(assert (=> d!37363 (= c!22599 lt!63838)))

(declare-fun containsKey!167 (List!1686 (_ BitVec 64)) Bool)

(assert (=> d!37363 (= lt!63838 (containsKey!167 (toList!835 lt!63742) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(assert (=> d!37363 (= (contains!861 lt!63742 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)) lt!63839)))

(declare-fun b!124262 () Bool)

(declare-fun lt!63837 () Unit!3859)

(assert (=> b!124262 (= e!81218 lt!63837)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!116 (List!1686 (_ BitVec 64)) Unit!3859)

(assert (=> b!124262 (= lt!63837 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!835 lt!63742) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(declare-datatypes ((Option!169 0))(
  ( (Some!168 (v!3099 V!3417)) (None!167) )
))
(declare-fun isDefined!117 (Option!169) Bool)

(declare-fun getValueByKey!163 (List!1686 (_ BitVec 64)) Option!169)

(assert (=> b!124262 (isDefined!117 (getValueByKey!163 (toList!835 lt!63742) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(declare-fun b!124263 () Bool)

(declare-fun Unit!3862 () Unit!3859)

(assert (=> b!124263 (= e!81218 Unit!3862)))

(declare-fun b!124264 () Bool)

(assert (=> b!124264 (= e!81219 (isDefined!117 (getValueByKey!163 (toList!835 lt!63742) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355))))))

(assert (= (and d!37363 c!22599) b!124262))

(assert (= (and d!37363 (not c!22599)) b!124263))

(assert (= (and d!37363 (not res!60222)) b!124264))

(assert (=> d!37363 m!144173))

(declare-fun m!144327 () Bool)

(assert (=> d!37363 m!144327))

(assert (=> b!124262 m!144173))

(declare-fun m!144329 () Bool)

(assert (=> b!124262 m!144329))

(assert (=> b!124262 m!144173))

(declare-fun m!144331 () Bool)

(assert (=> b!124262 m!144331))

(assert (=> b!124262 m!144331))

(declare-fun m!144333 () Bool)

(assert (=> b!124262 m!144333))

(assert (=> b!124264 m!144173))

(assert (=> b!124264 m!144331))

(assert (=> b!124264 m!144331))

(assert (=> b!124264 m!144333))

(assert (=> b!124073 d!37363))

(declare-fun call!13246 () Unit!3859)

(declare-fun bm!13224 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!54 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 64) Int) Unit!3859)

(assert (=> bm!13224 (= call!13246 (lemmaInListMapThenSeekEntryOrOpenFindsIt!54 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (defaultEntry!2759 newMap!16)))))

(declare-fun b!124349 () Bool)

(declare-fun res!60264 () Bool)

(declare-fun e!81278 () Bool)

(assert (=> b!124349 (=> (not res!60264) (not e!81278))))

(declare-datatypes ((SeekEntryResult!271 0))(
  ( (MissingZero!271 (index!3238 (_ BitVec 32))) (Found!271 (index!3239 (_ BitVec 32))) (Intermediate!271 (undefined!1083 Bool) (index!3240 (_ BitVec 32)) (x!14779 (_ BitVec 32))) (Undefined!271) (MissingVacant!271 (index!3241 (_ BitVec 32))) )
))
(declare-fun lt!63917 () SeekEntryResult!271)

(assert (=> b!124349 (= res!60264 (= (select (arr!2200 (_keys!4487 newMap!16)) (index!3238 lt!63917)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124350 () Bool)

(declare-fun lt!63916 () Unit!3859)

(declare-fun lt!63905 () Unit!3859)

(assert (=> b!124350 (= lt!63916 lt!63905)))

(declare-fun call!13243 () ListLongMap!1639)

(declare-fun lt!63919 () SeekEntryResult!271)

(assert (=> b!124350 (contains!861 call!13243 (select (arr!2200 (_keys!4487 newMap!16)) (index!3239 lt!63919)))))

(declare-fun lt!63906 () array!4649)

(declare-fun lemmaValidKeyInArrayIsInListMap!113 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) Int) Unit!3859)

(assert (=> b!124350 (= lt!63905 (lemmaValidKeyInArrayIsInListMap!113 (_keys!4487 newMap!16) lt!63906 (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (index!3239 lt!63919) (defaultEntry!2759 newMap!16)))))

(assert (=> b!124350 (= lt!63906 (array!4650 (store (arr!2201 (_values!2742 newMap!16)) (index!3239 lt!63919) (ValueCellFull!1070 (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2465 (_values!2742 newMap!16))))))

(declare-fun lt!63901 () Unit!3859)

(declare-fun lt!63909 () Unit!3859)

(assert (=> b!124350 (= lt!63901 lt!63909)))

(declare-fun call!13234 () ListLongMap!1639)

(declare-fun call!13238 () ListLongMap!1639)

(assert (=> b!124350 (= call!13234 call!13238)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!54 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) (_ BitVec 64) V!3417 Int) Unit!3859)

(assert (=> b!124350 (= lt!63909 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!54 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (index!3239 lt!63919) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2759 newMap!16)))))

(declare-fun lt!63913 () Unit!3859)

(declare-fun e!81271 () Unit!3859)

(assert (=> b!124350 (= lt!63913 e!81271)))

(declare-fun c!22640 () Bool)

(declare-fun call!13237 () Bool)

(assert (=> b!124350 (= c!22640 call!13237)))

(declare-fun e!81267 () tuple2!2528)

(assert (=> b!124350 (= e!81267 (tuple2!2529 true (LongMapFixedSize!1049 (defaultEntry!2759 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (_size!573 newMap!16) (_keys!4487 newMap!16) (array!4650 (store (arr!2201 (_values!2742 newMap!16)) (index!3239 lt!63919) (ValueCellFull!1070 (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2465 (_values!2742 newMap!16))) (_vacant!573 newMap!16))))))

(declare-fun b!124351 () Bool)

(declare-fun call!13239 () Bool)

(assert (=> b!124351 (= e!81278 (not call!13239))))

(declare-fun bm!13226 () Bool)

(declare-fun call!13230 () ListLongMap!1639)

(declare-fun lt!63910 () tuple2!2528)

(assert (=> bm!13226 (= call!13230 (map!1362 (_2!1275 lt!63910)))))

(declare-fun e!81272 () ListLongMap!1639)

(declare-fun bm!13227 () Bool)

(declare-fun c!22634 () Bool)

(declare-fun c!22631 () Bool)

(assert (=> bm!13227 (= call!13234 (+!156 e!81272 (ite c!22631 (ite c!22634 (tuple2!2527 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2527 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2527 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!22639 () Bool)

(assert (=> bm!13227 (= c!22639 c!22631)))

(declare-fun b!124352 () Bool)

(declare-fun res!60251 () Bool)

(declare-fun call!13245 () Bool)

(assert (=> b!124352 (= res!60251 call!13245)))

(declare-fun e!81265 () Bool)

(assert (=> b!124352 (=> (not res!60251) (not e!81265))))

(declare-fun b!124353 () Bool)

(declare-fun c!22629 () Bool)

(assert (=> b!124353 (= c!22629 ((_ is MissingVacant!271) lt!63919))))

(declare-fun e!81283 () tuple2!2528)

(declare-fun e!81266 () tuple2!2528)

(assert (=> b!124353 (= e!81283 e!81266)))

(declare-fun bm!13228 () Bool)

(declare-fun call!13231 () SeekEntryResult!271)

(declare-fun call!13241 () SeekEntryResult!271)

(assert (=> bm!13228 (= call!13231 call!13241)))

(declare-fun b!124354 () Bool)

(declare-fun lt!63897 () Unit!3859)

(declare-fun lt!63920 () Unit!3859)

(assert (=> b!124354 (= lt!63897 lt!63920)))

(declare-fun call!13229 () ListLongMap!1639)

(declare-fun call!13242 () ListLongMap!1639)

(assert (=> b!124354 (= call!13229 call!13242)))

(declare-fun lt!63911 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!54 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 V!3417 Int) Unit!3859)

(assert (=> b!124354 (= lt!63920 (lemmaChangeZeroKeyThenAddPairToListMap!54 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) lt!63911 (zeroValue!2624 newMap!16) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2624 newMap!16) (defaultEntry!2759 newMap!16)))))

(assert (=> b!124354 (= lt!63911 (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!81282 () tuple2!2528)

(assert (=> b!124354 (= e!81282 (tuple2!2529 true (LongMapFixedSize!1049 (defaultEntry!2759 newMap!16) (mask!7001 newMap!16) (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000001) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2624 newMap!16) (_size!573 newMap!16) (_keys!4487 newMap!16) (_values!2742 newMap!16) (_vacant!573 newMap!16))))))

(declare-fun b!124355 () Bool)

(declare-fun lt!63898 () SeekEntryResult!271)

(assert (=> b!124355 (= e!81265 (= (select (arr!2200 (_keys!4487 newMap!16)) (index!3239 lt!63898)) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(declare-fun b!124356 () Bool)

(declare-fun res!60263 () Bool)

(declare-fun e!81273 () Bool)

(assert (=> b!124356 (=> (not res!60263) (not e!81273))))

(declare-fun call!13247 () Bool)

(assert (=> b!124356 (= res!60263 call!13247)))

(declare-fun e!81280 () Bool)

(assert (=> b!124356 (= e!81280 e!81273)))

(declare-fun b!124357 () Bool)

(declare-fun res!60255 () Bool)

(declare-fun lt!63912 () SeekEntryResult!271)

(assert (=> b!124357 (= res!60255 (= (select (arr!2200 (_keys!4487 newMap!16)) (index!3241 lt!63912)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81268 () Bool)

(assert (=> b!124357 (=> (not res!60255) (not e!81268))))

(declare-fun bm!13229 () Bool)

(declare-fun call!13235 () ListLongMap!1639)

(assert (=> bm!13229 (= call!13235 call!13238)))

(declare-fun b!124358 () Bool)

(assert (=> b!124358 (= e!81266 e!81267)))

(declare-fun c!22630 () Bool)

(assert (=> b!124358 (= c!22630 ((_ is MissingZero!271) lt!63919))))

(declare-fun bm!13230 () Bool)

(declare-fun call!13233 () Unit!3859)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!54 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 64) Int) Unit!3859)

(assert (=> bm!13230 (= call!13233 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!54 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (defaultEntry!2759 newMap!16)))))

(declare-fun bm!13231 () Bool)

(declare-fun call!13228 () ListLongMap!1639)

(assert (=> bm!13231 (= call!13228 (map!1362 newMap!16))))

(declare-fun b!124359 () Bool)

(declare-fun call!13236 () Bool)

(assert (=> b!124359 (= e!81268 (not call!13236))))

(declare-fun bm!13232 () Bool)

(declare-fun call!13249 () Bool)

(declare-fun call!13227 () Bool)

(assert (=> bm!13232 (= call!13249 call!13227)))

(declare-fun bm!13233 () Bool)

(declare-fun call!13250 () Bool)

(assert (=> bm!13233 (= call!13245 call!13250)))

(declare-fun bm!13234 () Bool)

(assert (=> bm!13234 (= call!13229 call!13234)))

(declare-fun b!124360 () Bool)

(declare-fun e!81279 () Bool)

(assert (=> b!124360 (= e!81279 e!81268)))

(declare-fun res!60260 () Bool)

(assert (=> b!124360 (= res!60260 call!13247)))

(assert (=> b!124360 (=> (not res!60260) (not e!81268))))

(declare-fun b!124361 () Bool)

(assert (=> b!124361 (= e!81273 (not call!13236))))

(declare-fun b!124362 () Bool)

(declare-fun lt!63894 () Unit!3859)

(declare-fun lt!63903 () Unit!3859)

(assert (=> b!124362 (= lt!63894 lt!63903)))

(assert (=> b!124362 (= call!13229 call!13235)))

(declare-fun lt!63902 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!54 (array!4647 array!4649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 V!3417 Int) Unit!3859)

(assert (=> b!124362 (= lt!63903 (lemmaChangeLongMinValueKeyThenAddPairToListMap!54 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) lt!63902 (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2759 newMap!16)))))

(assert (=> b!124362 (= lt!63902 (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!124362 (= e!81282 (tuple2!2529 true (LongMapFixedSize!1049 (defaultEntry!2759 newMap!16) (mask!7001 newMap!16) (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000010) (zeroValue!2624 newMap!16) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!573 newMap!16) (_keys!4487 newMap!16) (_values!2742 newMap!16) (_vacant!573 newMap!16))))))

(declare-fun b!124363 () Bool)

(declare-fun lt!63914 () Unit!3859)

(assert (=> b!124363 (= e!81271 lt!63914)))

(assert (=> b!124363 (= lt!63914 call!13246)))

(declare-fun lt!63908 () SeekEntryResult!271)

(assert (=> b!124363 (= lt!63908 call!13231)))

(declare-fun res!60254 () Bool)

(assert (=> b!124363 (= res!60254 ((_ is Found!271) lt!63908))))

(declare-fun e!81269 () Bool)

(assert (=> b!124363 (=> (not res!60254) (not e!81269))))

(assert (=> b!124363 e!81269))

(declare-fun bm!13235 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4647 (_ BitVec 32)) SeekEntryResult!271)

(assert (=> bm!13235 (= call!13241 (seekEntryOrOpen!0 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (_keys!4487 newMap!16) (mask!7001 newMap!16)))))

(declare-fun bm!13236 () Bool)

(assert (=> bm!13236 (= call!13227 call!13250)))

(declare-fun b!124364 () Bool)

(declare-fun e!81285 () Bool)

(declare-fun e!81274 () Bool)

(assert (=> b!124364 (= e!81285 e!81274)))

(declare-fun res!60256 () Bool)

(assert (=> b!124364 (= res!60256 (contains!861 call!13230 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(assert (=> b!124364 (=> (not res!60256) (not e!81274))))

(declare-fun bm!13237 () Bool)

(assert (=> bm!13237 (= call!13247 call!13245)))

(declare-fun b!124365 () Bool)

(declare-fun e!81270 () tuple2!2528)

(assert (=> b!124365 (= e!81270 e!81283)))

(assert (=> b!124365 (= lt!63919 (seekEntryOrOpen!0 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (_keys!4487 newMap!16) (mask!7001 newMap!16)))))

(declare-fun c!22628 () Bool)

(assert (=> b!124365 (= c!22628 ((_ is Undefined!271) lt!63919))))

(declare-fun bm!13238 () Bool)

(declare-fun call!13248 () SeekEntryResult!271)

(assert (=> bm!13238 (= call!13248 call!13241)))

(declare-fun call!13232 () tuple2!2528)

(declare-fun bm!13239 () Bool)

(declare-fun updateHelperNewKey!54 (LongMapFixedSize!1048 (_ BitVec 64) V!3417 (_ BitVec 32)) tuple2!2528)

(assert (=> bm!13239 (= call!13232 (updateHelperNewKey!54 newMap!16 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22629 (index!3241 lt!63919) (index!3238 lt!63919))))))

(declare-fun b!124366 () Bool)

(assert (=> b!124366 (= e!81272 (ite c!22634 call!13235 call!13242))))

(declare-fun b!124367 () Bool)

(assert (=> b!124367 (= e!81269 (= (select (arr!2200 (_keys!4487 newMap!16)) (index!3239 lt!63908)) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(declare-fun b!124368 () Bool)

(declare-fun c!22635 () Bool)

(assert (=> b!124368 (= c!22635 ((_ is MissingVacant!271) lt!63917))))

(declare-fun e!81277 () Bool)

(declare-fun e!81275 () Bool)

(assert (=> b!124368 (= e!81277 e!81275)))

(declare-fun b!124369 () Bool)

(declare-fun lt!63904 () tuple2!2528)

(assert (=> b!124369 (= lt!63904 call!13232)))

(assert (=> b!124369 (= e!81267 (tuple2!2529 (_1!1275 lt!63904) (_2!1275 lt!63904)))))

(declare-fun b!124370 () Bool)

(declare-fun e!81281 () Bool)

(assert (=> b!124370 (= e!81275 e!81281)))

(declare-fun res!60261 () Bool)

(assert (=> b!124370 (= res!60261 call!13249)))

(assert (=> b!124370 (=> (not res!60261) (not e!81281))))

(declare-fun bm!13240 () Bool)

(declare-fun call!13240 () Bool)

(assert (=> bm!13240 (= call!13236 call!13240)))

(declare-fun b!124371 () Bool)

(assert (=> b!124371 (= e!81285 (= call!13230 call!13228))))

(declare-fun b!124372 () Bool)

(declare-fun lt!63918 () tuple2!2528)

(assert (=> b!124372 (= e!81266 (tuple2!2529 (_1!1275 lt!63918) (_2!1275 lt!63918)))))

(assert (=> b!124372 (= lt!63918 call!13232)))

(declare-fun bm!13241 () Bool)

(declare-fun call!13244 () ListLongMap!1639)

(assert (=> bm!13241 (= call!13243 call!13244)))

(declare-fun b!124373 () Bool)

(declare-fun res!60252 () Bool)

(assert (=> b!124373 (= res!60252 call!13227)))

(assert (=> b!124373 (=> (not res!60252) (not e!81269))))

(declare-fun bm!13242 () Bool)

(assert (=> bm!13242 (= call!13239 call!13240)))

(declare-fun b!124374 () Bool)

(declare-fun e!81276 () Bool)

(assert (=> b!124374 (= e!81276 e!81285)))

(declare-fun c!22638 () Bool)

(assert (=> b!124374 (= c!22638 (_1!1275 lt!63910))))

(declare-fun b!124375 () Bool)

(assert (=> b!124375 (= e!81275 ((_ is Undefined!271) lt!63917))))

(declare-fun b!124376 () Bool)

(assert (=> b!124376 (= e!81272 (getCurrentListMap!506 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun b!124377 () Bool)

(declare-fun e!81264 () ListLongMap!1639)

(assert (=> b!124377 (= e!81264 call!13243)))

(declare-fun b!124378 () Bool)

(assert (=> b!124378 (= e!81264 (getCurrentListMap!506 (_keys!4487 newMap!16) (_values!2742 newMap!16) (mask!7001 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun b!124379 () Bool)

(declare-fun lt!63896 () Unit!3859)

(declare-fun e!81284 () Unit!3859)

(assert (=> b!124379 (= lt!63896 e!81284)))

(declare-fun c!22637 () Bool)

(assert (=> b!124379 (= c!22637 call!13237)))

(assert (=> b!124379 (= e!81283 (tuple2!2529 false newMap!16))))

(declare-fun b!124380 () Bool)

(declare-fun Unit!3863 () Unit!3859)

(assert (=> b!124380 (= e!81284 Unit!3863)))

(declare-fun lt!63895 () Unit!3859)

(assert (=> b!124380 (= lt!63895 call!13246)))

(assert (=> b!124380 (= lt!63898 call!13248)))

(declare-fun res!60257 () Bool)

(assert (=> b!124380 (= res!60257 ((_ is Found!271) lt!63898))))

(assert (=> b!124380 (=> (not res!60257) (not e!81265))))

(assert (=> b!124380 e!81265))

(declare-fun lt!63900 () Unit!3859)

(assert (=> b!124380 (= lt!63900 lt!63895)))

(assert (=> b!124380 false))

(declare-fun bm!13243 () Bool)

(declare-fun c!22633 () Bool)

(assert (=> bm!13243 (= c!22633 c!22628)))

(assert (=> bm!13243 (= call!13237 (contains!861 e!81264 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(declare-fun b!124381 () Bool)

(declare-fun res!60262 () Bool)

(assert (=> b!124381 (=> (not res!60262) (not e!81273))))

(assert (=> b!124381 (= res!60262 (= (select (arr!2200 (_keys!4487 newMap!16)) (index!3238 lt!63912)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124382 () Bool)

(assert (=> b!124382 (= e!81279 ((_ is Undefined!271) lt!63912))))

(declare-fun bm!13244 () Bool)

(declare-fun arrayContainsKey!0 (array!4647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13244 (= call!13240 (arrayContainsKey!0 (_keys!4487 newMap!16) (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!13245 () Bool)

(assert (=> bm!13245 (= call!13242 call!13244)))

(declare-fun b!124383 () Bool)

(declare-fun res!60253 () Bool)

(assert (=> b!124383 (= res!60253 (= (select (arr!2200 (_keys!4487 newMap!16)) (index!3241 lt!63917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124383 (=> (not res!60253) (not e!81281))))

(declare-fun b!124384 () Bool)

(declare-fun lt!63899 () Unit!3859)

(assert (=> b!124384 (= e!81284 lt!63899)))

(assert (=> b!124384 (= lt!63899 call!13233)))

(assert (=> b!124384 (= lt!63912 call!13248)))

(declare-fun c!22641 () Bool)

(assert (=> b!124384 (= c!22641 ((_ is MissingZero!271) lt!63912))))

(assert (=> b!124384 e!81280))

(declare-fun b!124385 () Bool)

(assert (=> b!124385 (= e!81281 (not call!13239))))

(declare-fun b!124386 () Bool)

(declare-fun c!22632 () Bool)

(assert (=> b!124386 (= c!22632 ((_ is MissingVacant!271) lt!63912))))

(assert (=> b!124386 (= e!81280 e!81279)))

(declare-fun b!124387 () Bool)

(declare-fun res!60258 () Bool)

(assert (=> b!124387 (=> (not res!60258) (not e!81278))))

(assert (=> b!124387 (= res!60258 call!13249)))

(assert (=> b!124387 (= e!81277 e!81278)))

(declare-fun bm!13246 () Bool)

(assert (=> bm!13246 (= call!13244 (getCurrentListMap!506 (_keys!4487 newMap!16) (ite (or c!22631 c!22628) (_values!2742 newMap!16) lt!63906) (mask!7001 newMap!16) (ite (and c!22631 c!22634) lt!63911 (extraKeys!2544 newMap!16)) (ite (and c!22631 c!22634) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2624 newMap!16)) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun b!124388 () Bool)

(assert (=> b!124388 (= e!81274 (= call!13230 (+!156 call!13228 (tuple2!2527 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13247 () Bool)

(declare-fun c!22636 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13247 (= call!13250 (inRange!0 (ite c!22628 (ite c!22637 (index!3239 lt!63898) (ite c!22641 (index!3238 lt!63912) (index!3241 lt!63912))) (ite c!22640 (index!3239 lt!63908) (ite c!22636 (index!3238 lt!63917) (index!3241 lt!63917)))) (mask!7001 newMap!16)))))

(declare-fun b!124389 () Bool)

(assert (=> b!124389 (= e!81270 e!81282)))

(assert (=> b!124389 (= c!22634 (= (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124390 () Bool)

(declare-fun Unit!3864 () Unit!3859)

(assert (=> b!124390 (= e!81271 Unit!3864)))

(declare-fun lt!63915 () Unit!3859)

(assert (=> b!124390 (= lt!63915 call!13233)))

(assert (=> b!124390 (= lt!63917 call!13231)))

(assert (=> b!124390 (= c!22636 ((_ is MissingZero!271) lt!63917))))

(assert (=> b!124390 e!81277))

(declare-fun lt!63907 () Unit!3859)

(assert (=> b!124390 (= lt!63907 lt!63915)))

(assert (=> b!124390 false))

(declare-fun d!37365 () Bool)

(assert (=> d!37365 e!81276))

(declare-fun res!60259 () Bool)

(assert (=> d!37365 (=> (not res!60259) (not e!81276))))

(assert (=> d!37365 (= res!60259 (valid!501 (_2!1275 lt!63910)))))

(assert (=> d!37365 (= lt!63910 e!81270)))

(assert (=> d!37365 (= c!22631 (= (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (bvneg (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355))))))

(assert (=> d!37365 (valid!501 newMap!16)))

(assert (=> d!37365 (= (update!179 newMap!16 (select (arr!2200 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) from!355) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!63910)))

(declare-fun bm!13225 () Bool)

(assert (=> bm!13225 (= call!13238 (getCurrentListMap!506 (_keys!4487 newMap!16) (ite c!22631 (_values!2742 newMap!16) (array!4650 (store (arr!2201 (_values!2742 newMap!16)) (index!3239 lt!63919) (ValueCellFull!1070 (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2465 (_values!2742 newMap!16)))) (mask!7001 newMap!16) (ite c!22631 (ite c!22634 (extraKeys!2544 newMap!16) lt!63902) (extraKeys!2544 newMap!16)) (zeroValue!2624 newMap!16) (ite c!22631 (ite c!22634 (minValue!2624 newMap!16) (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2624 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(assert (= (and d!37365 c!22631) b!124389))

(assert (= (and d!37365 (not c!22631)) b!124365))

(assert (= (and b!124389 c!22634) b!124354))

(assert (= (and b!124389 (not c!22634)) b!124362))

(assert (= (or b!124354 b!124362) bm!13245))

(assert (= (or b!124354 b!124362) bm!13229))

(assert (= (or b!124354 b!124362) bm!13234))

(assert (= (and b!124365 c!22628) b!124379))

(assert (= (and b!124365 (not c!22628)) b!124353))

(assert (= (and b!124379 c!22637) b!124380))

(assert (= (and b!124379 (not c!22637)) b!124384))

(assert (= (and b!124380 res!60257) b!124352))

(assert (= (and b!124352 res!60251) b!124355))

(assert (= (and b!124384 c!22641) b!124356))

(assert (= (and b!124384 (not c!22641)) b!124386))

(assert (= (and b!124356 res!60263) b!124381))

(assert (= (and b!124381 res!60262) b!124361))

(assert (= (and b!124386 c!22632) b!124360))

(assert (= (and b!124386 (not c!22632)) b!124382))

(assert (= (and b!124360 res!60260) b!124357))

(assert (= (and b!124357 res!60255) b!124359))

(assert (= (or b!124356 b!124360) bm!13237))

(assert (= (or b!124361 b!124359) bm!13240))

(assert (= (or b!124352 bm!13237) bm!13233))

(assert (= (or b!124380 b!124384) bm!13238))

(assert (= (and b!124353 c!22629) b!124372))

(assert (= (and b!124353 (not c!22629)) b!124358))

(assert (= (and b!124358 c!22630) b!124369))

(assert (= (and b!124358 (not c!22630)) b!124350))

(assert (= (and b!124350 c!22640) b!124363))

(assert (= (and b!124350 (not c!22640)) b!124390))

(assert (= (and b!124363 res!60254) b!124373))

(assert (= (and b!124373 res!60252) b!124367))

(assert (= (and b!124390 c!22636) b!124387))

(assert (= (and b!124390 (not c!22636)) b!124368))

(assert (= (and b!124387 res!60258) b!124349))

(assert (= (and b!124349 res!60264) b!124351))

(assert (= (and b!124368 c!22635) b!124370))

(assert (= (and b!124368 (not c!22635)) b!124375))

(assert (= (and b!124370 res!60261) b!124383))

(assert (= (and b!124383 res!60253) b!124385))

(assert (= (or b!124387 b!124370) bm!13232))

(assert (= (or b!124351 b!124385) bm!13242))

(assert (= (or b!124373 bm!13232) bm!13236))

(assert (= (or b!124363 b!124390) bm!13228))

(assert (= (or b!124372 b!124369) bm!13239))

(assert (= (or bm!13240 bm!13242) bm!13244))

(assert (= (or b!124379 b!124350) bm!13241))

(assert (= (or b!124384 b!124390) bm!13230))

(assert (= (or bm!13233 bm!13236) bm!13247))

(assert (= (or bm!13238 bm!13228) bm!13235))

(assert (= (or b!124380 b!124363) bm!13224))

(assert (= (or b!124379 b!124350) bm!13243))

(assert (= (and bm!13243 c!22633) b!124377))

(assert (= (and bm!13243 (not c!22633)) b!124378))

(assert (= (or bm!13229 b!124350) bm!13225))

(assert (= (or bm!13245 bm!13241) bm!13246))

(assert (= (or bm!13234 b!124350) bm!13227))

(assert (= (and bm!13227 c!22639) b!124366))

(assert (= (and bm!13227 (not c!22639)) b!124376))

(assert (= (and d!37365 res!60259) b!124374))

(assert (= (and b!124374 c!22638) b!124364))

(assert (= (and b!124374 (not c!22638)) b!124371))

(assert (= (and b!124364 res!60256) b!124388))

(assert (= (or b!124388 b!124371) bm!13231))

(assert (= (or b!124364 b!124388 b!124371) bm!13226))

(declare-fun m!144335 () Bool)

(assert (=> d!37365 m!144335))

(assert (=> d!37365 m!144171))

(assert (=> b!124354 m!144187))

(declare-fun m!144337 () Bool)

(assert (=> b!124354 m!144337))

(assert (=> b!124378 m!144269))

(assert (=> bm!13235 m!144173))

(declare-fun m!144339 () Bool)

(assert (=> bm!13235 m!144339))

(assert (=> bm!13239 m!144173))

(assert (=> bm!13239 m!144187))

(declare-fun m!144341 () Bool)

(assert (=> bm!13239 m!144341))

(declare-fun m!144343 () Bool)

(assert (=> bm!13227 m!144343))

(declare-fun m!144345 () Bool)

(assert (=> b!124367 m!144345))

(declare-fun m!144347 () Bool)

(assert (=> b!124381 m!144347))

(assert (=> bm!13243 m!144173))

(declare-fun m!144349 () Bool)

(assert (=> bm!13243 m!144349))

(assert (=> b!124364 m!144173))

(declare-fun m!144351 () Bool)

(assert (=> b!124364 m!144351))

(declare-fun m!144353 () Bool)

(assert (=> b!124350 m!144353))

(declare-fun m!144355 () Bool)

(assert (=> b!124350 m!144355))

(assert (=> b!124350 m!144353))

(declare-fun m!144357 () Bool)

(assert (=> b!124350 m!144357))

(assert (=> b!124350 m!144173))

(assert (=> b!124350 m!144187))

(declare-fun m!144359 () Bool)

(assert (=> b!124350 m!144359))

(declare-fun m!144361 () Bool)

(assert (=> b!124350 m!144361))

(declare-fun m!144363 () Bool)

(assert (=> bm!13247 m!144363))

(assert (=> b!124365 m!144173))

(assert (=> b!124365 m!144339))

(declare-fun m!144365 () Bool)

(assert (=> b!124349 m!144365))

(assert (=> bm!13224 m!144173))

(declare-fun m!144367 () Bool)

(assert (=> bm!13224 m!144367))

(declare-fun m!144369 () Bool)

(assert (=> b!124355 m!144369))

(declare-fun m!144371 () Bool)

(assert (=> b!124388 m!144371))

(assert (=> bm!13230 m!144173))

(declare-fun m!144373 () Bool)

(assert (=> bm!13230 m!144373))

(declare-fun m!144375 () Bool)

(assert (=> bm!13226 m!144375))

(assert (=> bm!13244 m!144173))

(declare-fun m!144377 () Bool)

(assert (=> bm!13244 m!144377))

(assert (=> b!124376 m!144269))

(assert (=> bm!13231 m!144175))

(assert (=> b!124362 m!144187))

(declare-fun m!144379 () Bool)

(assert (=> b!124362 m!144379))

(declare-fun m!144381 () Bool)

(assert (=> b!124357 m!144381))

(declare-fun m!144383 () Bool)

(assert (=> bm!13246 m!144383))

(declare-fun m!144385 () Bool)

(assert (=> b!124383 m!144385))

(assert (=> bm!13225 m!144355))

(declare-fun m!144387 () Bool)

(assert (=> bm!13225 m!144387))

(assert (=> b!124073 d!37365))

(declare-fun d!37367 () Bool)

(declare-fun c!22644 () Bool)

(assert (=> d!37367 (= c!22644 ((_ is ValueCellFull!1070) (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355)))))

(declare-fun e!81288 () V!3417)

(assert (=> d!37367 (= (get!1429 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81288)))

(declare-fun b!124395 () Bool)

(declare-fun get!1431 (ValueCell!1070 V!3417) V!3417)

(assert (=> b!124395 (= e!81288 (get!1431 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124396 () Bool)

(declare-fun get!1432 (ValueCell!1070 V!3417) V!3417)

(assert (=> b!124396 (= e!81288 (get!1432 (select (arr!2201 (_values!2742 (v!3093 (underlying!429 thiss!992)))) from!355) (dynLambda!405 (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37367 c!22644) b!124395))

(assert (= (and d!37367 (not c!22644)) b!124396))

(assert (=> b!124395 m!144183))

(assert (=> b!124395 m!144185))

(declare-fun m!144389 () Bool)

(assert (=> b!124395 m!144389))

(assert (=> b!124396 m!144183))

(assert (=> b!124396 m!144185))

(declare-fun m!144391 () Bool)

(assert (=> b!124396 m!144391))

(assert (=> b!124073 d!37367))

(declare-fun d!37369 () Bool)

(assert (=> d!37369 (= (array_inv!1397 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) (bvsge (size!2464 (_keys!4487 (v!3093 (underlying!429 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124077 d!37369))

(declare-fun d!37371 () Bool)

(assert (=> d!37371 (= (array_inv!1398 (_values!2742 (v!3093 (underlying!429 thiss!992)))) (bvsge (size!2465 (_values!2742 (v!3093 (underlying!429 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124077 d!37371))

(declare-fun d!37373 () Bool)

(assert (=> d!37373 (= (array_inv!1397 (_keys!4487 newMap!16)) (bvsge (size!2464 (_keys!4487 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124072 d!37373))

(declare-fun d!37375 () Bool)

(assert (=> d!37375 (= (array_inv!1398 (_values!2742 newMap!16)) (bvsge (size!2465 (_values!2742 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124072 d!37375))

(declare-fun d!37377 () Bool)

(assert (=> d!37377 (= (valid!500 thiss!992) (valid!501 (v!3093 (underlying!429 thiss!992))))))

(declare-fun bs!5141 () Bool)

(assert (= bs!5141 d!37377))

(declare-fun m!144393 () Bool)

(assert (=> bs!5141 m!144393))

(assert (=> start!13524 d!37377))

(declare-fun condMapEmpty!4461 () Bool)

(declare-fun mapDefault!4461 () ValueCell!1070)

(assert (=> mapNonEmpty!4445 (= condMapEmpty!4461 (= mapRest!4446 ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4461)))))

(declare-fun e!81293 () Bool)

(declare-fun mapRes!4461 () Bool)

(assert (=> mapNonEmpty!4445 (= tp!10860 (and e!81293 mapRes!4461))))

(declare-fun mapIsEmpty!4461 () Bool)

(assert (=> mapIsEmpty!4461 mapRes!4461))

(declare-fun b!124403 () Bool)

(declare-fun e!81294 () Bool)

(assert (=> b!124403 (= e!81294 tp_is_empty!2827)))

(declare-fun b!124404 () Bool)

(assert (=> b!124404 (= e!81293 tp_is_empty!2827)))

(declare-fun mapNonEmpty!4461 () Bool)

(declare-fun tp!10887 () Bool)

(assert (=> mapNonEmpty!4461 (= mapRes!4461 (and tp!10887 e!81294))))

(declare-fun mapRest!4461 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapKey!4461 () (_ BitVec 32))

(declare-fun mapValue!4461 () ValueCell!1070)

(assert (=> mapNonEmpty!4461 (= mapRest!4446 (store mapRest!4461 mapKey!4461 mapValue!4461))))

(assert (= (and mapNonEmpty!4445 condMapEmpty!4461) mapIsEmpty!4461))

(assert (= (and mapNonEmpty!4445 (not condMapEmpty!4461)) mapNonEmpty!4461))

(assert (= (and mapNonEmpty!4461 ((_ is ValueCellFull!1070) mapValue!4461)) b!124403))

(assert (= (and mapNonEmpty!4445 ((_ is ValueCellFull!1070) mapDefault!4461)) b!124404))

(declare-fun m!144395 () Bool)

(assert (=> mapNonEmpty!4461 m!144395))

(declare-fun condMapEmpty!4462 () Bool)

(declare-fun mapDefault!4462 () ValueCell!1070)

(assert (=> mapNonEmpty!4446 (= condMapEmpty!4462 (= mapRest!4445 ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4462)))))

(declare-fun e!81295 () Bool)

(declare-fun mapRes!4462 () Bool)

(assert (=> mapNonEmpty!4446 (= tp!10857 (and e!81295 mapRes!4462))))

(declare-fun mapIsEmpty!4462 () Bool)

(assert (=> mapIsEmpty!4462 mapRes!4462))

(declare-fun b!124405 () Bool)

(declare-fun e!81296 () Bool)

(assert (=> b!124405 (= e!81296 tp_is_empty!2827)))

(declare-fun b!124406 () Bool)

(assert (=> b!124406 (= e!81295 tp_is_empty!2827)))

(declare-fun mapNonEmpty!4462 () Bool)

(declare-fun tp!10888 () Bool)

(assert (=> mapNonEmpty!4462 (= mapRes!4462 (and tp!10888 e!81296))))

(declare-fun mapRest!4462 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapValue!4462 () ValueCell!1070)

(declare-fun mapKey!4462 () (_ BitVec 32))

(assert (=> mapNonEmpty!4462 (= mapRest!4445 (store mapRest!4462 mapKey!4462 mapValue!4462))))

(assert (= (and mapNonEmpty!4446 condMapEmpty!4462) mapIsEmpty!4462))

(assert (= (and mapNonEmpty!4446 (not condMapEmpty!4462)) mapNonEmpty!4462))

(assert (= (and mapNonEmpty!4462 ((_ is ValueCellFull!1070) mapValue!4462)) b!124405))

(assert (= (and mapNonEmpty!4446 ((_ is ValueCellFull!1070) mapDefault!4462)) b!124406))

(declare-fun m!144397 () Bool)

(assert (=> mapNonEmpty!4462 m!144397))

(declare-fun b_lambda!5453 () Bool)

(assert (= b_lambda!5451 (or (and b!124077 b_free!2821) (and b!124072 b_free!2823 (= (defaultEntry!2759 newMap!16) (defaultEntry!2759 (v!3093 (underlying!429 thiss!992))))) b_lambda!5453)))

(check-sat (not b!124354) (not bm!13231) (not b!124249) (not b!124364) (not d!37365) (not bm!13244) (not b!124262) (not d!37363) (not b!124378) (not b!124243) (not b_lambda!5449) (not d!37359) (not mapNonEmpty!4461) (not d!37357) (not bm!13224) (not mapNonEmpty!4462) (not b!124250) (not b!124396) (not b!124255) (not b!124246) b_and!7625 (not b!124350) (not b!124388) (not b!124395) (not b!124264) (not b!124191) (not bm!13235) (not bm!13175) (not b!124248) (not b_next!2823) (not bm!13226) (not bm!13225) (not bm!13227) (not b!124365) (not bm!13171) (not b_next!2821) (not d!37361) b_and!7627 (not b!124376) (not b!124190) (not bm!13243) (not bm!13246) (not b_lambda!5453) (not b!124242) (not bm!13230) tp_is_empty!2827 (not b!124239) (not bm!13173) (not bm!13239) (not bm!13170) (not d!37377) (not bm!13247) (not b!124192) (not b!124362))
(check-sat b_and!7625 b_and!7627 (not b_next!2821) (not b_next!2823))
