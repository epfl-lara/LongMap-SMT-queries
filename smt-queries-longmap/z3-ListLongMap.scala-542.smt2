; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14098 () Bool)

(assert start!14098)

(declare-fun b!130775 () Bool)

(declare-fun b_free!2897 () Bool)

(declare-fun b_next!2897 () Bool)

(assert (=> b!130775 (= b_free!2897 (not b_next!2897))))

(declare-fun tp!11121 () Bool)

(declare-fun b_and!8099 () Bool)

(assert (=> b!130775 (= tp!11121 b_and!8099)))

(declare-fun b!130789 () Bool)

(declare-fun b_free!2899 () Bool)

(declare-fun b_next!2899 () Bool)

(assert (=> b!130789 (= b_free!2899 (not b_next!2899))))

(declare-fun tp!11123 () Bool)

(declare-fun b_and!8101 () Bool)

(assert (=> b!130789 (= tp!11123 b_and!8101)))

(declare-fun b!130773 () Bool)

(declare-fun e!85320 () Bool)

(declare-fun tp_is_empty!2865 () Bool)

(assert (=> b!130773 (= e!85320 tp_is_empty!2865)))

(declare-fun mapNonEmpty!4595 () Bool)

(declare-fun mapRes!4596 () Bool)

(declare-fun tp!11122 () Bool)

(declare-fun e!85324 () Bool)

(assert (=> mapNonEmpty!4595 (= mapRes!4596 (and tp!11122 e!85324))))

(declare-fun mapKey!4596 () (_ BitVec 32))

(declare-datatypes ((V!3467 0))(
  ( (V!3468 (val!1477 Int)) )
))
(declare-datatypes ((ValueCell!1089 0))(
  ( (ValueCellFull!1089 (v!3176 V!3467)) (EmptyCell!1089) )
))
(declare-fun mapValue!4595 () ValueCell!1089)

(declare-datatypes ((array!4753 0))(
  ( (array!4754 (arr!2249 (Array (_ BitVec 32) (_ BitVec 64))) (size!2516 (_ BitVec 32))) )
))
(declare-datatypes ((array!4755 0))(
  ( (array!4756 (arr!2250 (Array (_ BitVec 32) ValueCell!1089)) (size!2517 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1086 0))(
  ( (LongMapFixedSize!1087 (defaultEntry!2843 Int) (mask!7131 (_ BitVec 32)) (extraKeys!2612 (_ BitVec 32)) (zeroValue!2700 V!3467) (minValue!2700 V!3467) (_size!592 (_ BitVec 32)) (_keys!4588 array!4753) (_values!2826 array!4755) (_vacant!592 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1086)

(declare-fun mapRest!4595 () (Array (_ BitVec 32) ValueCell!1089))

(assert (=> mapNonEmpty!4595 (= (arr!2250 (_values!2826 newMap!16)) (store mapRest!4595 mapKey!4596 mapValue!4595))))

(declare-fun mapNonEmpty!4596 () Bool)

(declare-fun mapRes!4595 () Bool)

(declare-fun tp!11124 () Bool)

(assert (=> mapNonEmpty!4596 (= mapRes!4595 (and tp!11124 e!85320))))

(declare-fun mapRest!4596 () (Array (_ BitVec 32) ValueCell!1089))

(declare-datatypes ((Cell!878 0))(
  ( (Cell!879 (v!3177 LongMapFixedSize!1086)) )
))
(declare-datatypes ((LongMap!878 0))(
  ( (LongMap!879 (underlying!450 Cell!878)) )
))
(declare-fun thiss!992 () LongMap!878)

(declare-fun mapValue!4596 () ValueCell!1089)

(declare-fun mapKey!4595 () (_ BitVec 32))

(assert (=> mapNonEmpty!4596 (= (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (store mapRest!4596 mapKey!4595 mapValue!4596))))

(declare-fun b!130774 () Bool)

(declare-fun e!85313 () Bool)

(declare-fun e!85323 () Bool)

(assert (=> b!130774 (= e!85313 e!85323)))

(declare-fun res!63050 () Bool)

(assert (=> b!130774 (=> (not res!63050) (not e!85323))))

(declare-datatypes ((tuple2!2612 0))(
  ( (tuple2!2613 (_1!1317 (_ BitVec 64)) (_2!1317 V!3467)) )
))
(declare-datatypes ((List!1710 0))(
  ( (Nil!1707) (Cons!1706 (h!2311 tuple2!2612) (t!6129 List!1710)) )
))
(declare-datatypes ((ListLongMap!1699 0))(
  ( (ListLongMap!1700 (toList!865 List!1710)) )
))
(declare-fun lt!68020 () ListLongMap!1699)

(declare-fun lt!68021 () ListLongMap!1699)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!130774 (= res!63050 (and (= lt!68020 lt!68021) (not (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1401 (LongMapFixedSize!1086) ListLongMap!1699)

(assert (=> b!130774 (= lt!68021 (map!1401 newMap!16))))

(declare-fun getCurrentListMap!542 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 32) Int) ListLongMap!1699)

(assert (=> b!130774 (= lt!68020 (getCurrentListMap!542 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun e!85325 () Bool)

(declare-fun e!85321 () Bool)

(declare-fun array_inv!1415 (array!4753) Bool)

(declare-fun array_inv!1416 (array!4755) Bool)

(assert (=> b!130775 (= e!85325 (and tp!11121 tp_is_empty!2865 (array_inv!1415 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (array_inv!1416 (_values!2826 (v!3177 (underlying!450 thiss!992)))) e!85321))))

(declare-fun b!130776 () Bool)

(declare-fun res!63045 () Bool)

(assert (=> b!130776 (=> (not res!63045) (not e!85313))))

(assert (=> b!130776 (= res!63045 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7131 newMap!16)) (_size!592 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!130777 () Bool)

(declare-fun e!85322 () Bool)

(declare-fun e!85318 () Bool)

(assert (=> b!130777 (= e!85322 (and e!85318 mapRes!4596))))

(declare-fun condMapEmpty!4595 () Bool)

(declare-fun mapDefault!4595 () ValueCell!1089)

(assert (=> b!130777 (= condMapEmpty!4595 (= (arr!2250 (_values!2826 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1089)) mapDefault!4595)))))

(declare-fun b!130778 () Bool)

(assert (=> b!130778 (= e!85318 tp_is_empty!2865)))

(declare-fun b!130779 () Bool)

(declare-fun res!63048 () Bool)

(declare-fun e!85311 () Bool)

(assert (=> b!130779 (=> (not res!63048) (not e!85311))))

(assert (=> b!130779 (= res!63048 (and (= (size!2517 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7131 (v!3177 (underlying!450 thiss!992))))) (= (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (size!2517 (_values!2826 (v!3177 (underlying!450 thiss!992))))) (bvsge (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!130780 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4753 (_ BitVec 32)) Bool)

(assert (=> b!130780 (= e!85311 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun mapIsEmpty!4595 () Bool)

(assert (=> mapIsEmpty!4595 mapRes!4596))

(declare-fun b!130782 () Bool)

(declare-fun e!85317 () Bool)

(assert (=> b!130782 (= e!85317 tp_is_empty!2865)))

(declare-fun b!130783 () Bool)

(declare-fun res!63046 () Bool)

(assert (=> b!130783 (=> (not res!63046) (not e!85313))))

(declare-fun valid!516 (LongMapFixedSize!1086) Bool)

(assert (=> b!130783 (= res!63046 (valid!516 newMap!16))))

(declare-fun b!130784 () Bool)

(declare-fun e!85312 () Bool)

(declare-fun e!85315 () Bool)

(assert (=> b!130784 (= e!85312 e!85315)))

(declare-fun b!130785 () Bool)

(assert (=> b!130785 (= e!85315 e!85325)))

(declare-fun b!130786 () Bool)

(assert (=> b!130786 (= e!85321 (and e!85317 mapRes!4595))))

(declare-fun condMapEmpty!4596 () Bool)

(declare-fun mapDefault!4596 () ValueCell!1089)

(assert (=> b!130786 (= condMapEmpty!4596 (= (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1089)) mapDefault!4596)))))

(declare-fun b!130787 () Bool)

(assert (=> b!130787 (= e!85324 tp_is_empty!2865)))

(declare-fun mapIsEmpty!4596 () Bool)

(assert (=> mapIsEmpty!4596 mapRes!4595))

(declare-fun b!130788 () Bool)

(declare-fun res!63052 () Bool)

(assert (=> b!130788 (=> (not res!63052) (not e!85311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!130788 (= res!63052 (validMask!0 (mask!7131 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!130781 () Bool)

(assert (=> b!130781 (= e!85323 e!85311)))

(declare-fun res!63047 () Bool)

(assert (=> b!130781 (=> (not res!63047) (not e!85311))))

(declare-fun contains!892 (ListLongMap!1699 (_ BitVec 64)) Bool)

(assert (=> b!130781 (= res!63047 (contains!892 lt!68021 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2614 0))(
  ( (tuple2!2615 (_1!1318 Bool) (_2!1318 LongMapFixedSize!1086)) )
))
(declare-fun lt!68022 () tuple2!2614)

(declare-fun update!191 (LongMapFixedSize!1086 (_ BitVec 64) V!3467) tuple2!2614)

(declare-fun get!1469 (ValueCell!1089 V!3467) V!3467)

(declare-fun dynLambda!422 (Int (_ BitVec 64)) V!3467)

(assert (=> b!130781 (= lt!68022 (update!191 newMap!16 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!63049 () Bool)

(assert (=> start!14098 (=> (not res!63049) (not e!85313))))

(declare-fun valid!517 (LongMap!878) Bool)

(assert (=> start!14098 (= res!63049 (valid!517 thiss!992))))

(assert (=> start!14098 e!85313))

(assert (=> start!14098 e!85312))

(assert (=> start!14098 true))

(declare-fun e!85316 () Bool)

(assert (=> start!14098 e!85316))

(assert (=> b!130789 (= e!85316 (and tp!11123 tp_is_empty!2865 (array_inv!1415 (_keys!4588 newMap!16)) (array_inv!1416 (_values!2826 newMap!16)) e!85322))))

(declare-fun b!130790 () Bool)

(declare-fun res!63051 () Bool)

(assert (=> b!130790 (=> (not res!63051) (not e!85313))))

(assert (=> b!130790 (= res!63051 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992)))))))))

(assert (= (and start!14098 res!63049) b!130790))

(assert (= (and b!130790 res!63051) b!130783))

(assert (= (and b!130783 res!63046) b!130776))

(assert (= (and b!130776 res!63045) b!130774))

(assert (= (and b!130774 res!63050) b!130781))

(assert (= (and b!130781 res!63047) b!130788))

(assert (= (and b!130788 res!63052) b!130779))

(assert (= (and b!130779 res!63048) b!130780))

(assert (= (and b!130786 condMapEmpty!4596) mapIsEmpty!4596))

(assert (= (and b!130786 (not condMapEmpty!4596)) mapNonEmpty!4596))

(get-info :version)

(assert (= (and mapNonEmpty!4596 ((_ is ValueCellFull!1089) mapValue!4596)) b!130773))

(assert (= (and b!130786 ((_ is ValueCellFull!1089) mapDefault!4596)) b!130782))

(assert (= b!130775 b!130786))

(assert (= b!130785 b!130775))

(assert (= b!130784 b!130785))

(assert (= start!14098 b!130784))

(assert (= (and b!130777 condMapEmpty!4595) mapIsEmpty!4595))

(assert (= (and b!130777 (not condMapEmpty!4595)) mapNonEmpty!4595))

(assert (= (and mapNonEmpty!4595 ((_ is ValueCellFull!1089) mapValue!4595)) b!130787))

(assert (= (and b!130777 ((_ is ValueCellFull!1089) mapDefault!4595)) b!130778))

(assert (= b!130789 b!130777))

(assert (= start!14098 b!130789))

(declare-fun b_lambda!5825 () Bool)

(assert (=> (not b_lambda!5825) (not b!130781)))

(declare-fun t!6126 () Bool)

(declare-fun tb!2381 () Bool)

(assert (=> (and b!130775 (= (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))) t!6126) tb!2381))

(declare-fun result!3935 () Bool)

(assert (=> tb!2381 (= result!3935 tp_is_empty!2865)))

(assert (=> b!130781 t!6126))

(declare-fun b_and!8103 () Bool)

(assert (= b_and!8099 (and (=> t!6126 result!3935) b_and!8103)))

(declare-fun tb!2383 () Bool)

(declare-fun t!6128 () Bool)

(assert (=> (and b!130789 (= (defaultEntry!2843 newMap!16) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))) t!6128) tb!2383))

(declare-fun result!3939 () Bool)

(assert (= result!3939 result!3935))

(assert (=> b!130781 t!6128))

(declare-fun b_and!8105 () Bool)

(assert (= b_and!8101 (and (=> t!6128 result!3939) b_and!8105)))

(declare-fun m!154185 () Bool)

(assert (=> mapNonEmpty!4596 m!154185))

(declare-fun m!154187 () Bool)

(assert (=> b!130774 m!154187))

(declare-fun m!154189 () Bool)

(assert (=> b!130774 m!154189))

(declare-fun m!154191 () Bool)

(assert (=> b!130774 m!154191))

(declare-fun m!154193 () Bool)

(assert (=> b!130780 m!154193))

(declare-fun m!154195 () Bool)

(assert (=> b!130783 m!154195))

(declare-fun m!154197 () Bool)

(assert (=> mapNonEmpty!4595 m!154197))

(declare-fun m!154199 () Bool)

(assert (=> b!130775 m!154199))

(declare-fun m!154201 () Bool)

(assert (=> b!130775 m!154201))

(declare-fun m!154203 () Bool)

(assert (=> b!130788 m!154203))

(declare-fun m!154205 () Bool)

(assert (=> start!14098 m!154205))

(declare-fun m!154207 () Bool)

(assert (=> b!130781 m!154207))

(declare-fun m!154209 () Bool)

(assert (=> b!130781 m!154209))

(declare-fun m!154211 () Bool)

(assert (=> b!130781 m!154211))

(assert (=> b!130781 m!154187))

(declare-fun m!154213 () Bool)

(assert (=> b!130781 m!154213))

(assert (=> b!130781 m!154187))

(assert (=> b!130781 m!154209))

(assert (=> b!130781 m!154187))

(assert (=> b!130781 m!154211))

(declare-fun m!154215 () Bool)

(assert (=> b!130781 m!154215))

(assert (=> b!130781 m!154207))

(declare-fun m!154217 () Bool)

(assert (=> b!130789 m!154217))

(declare-fun m!154219 () Bool)

(assert (=> b!130789 m!154219))

(check-sat (not b!130783) tp_is_empty!2865 (not b_next!2899) (not b!130780) (not b!130788) (not b!130789) (not mapNonEmpty!4596) (not start!14098) (not b!130781) (not b_lambda!5825) b_and!8105 (not b_next!2897) (not mapNonEmpty!4595) b_and!8103 (not b!130774) (not b!130775))
(check-sat b_and!8103 b_and!8105 (not b_next!2897) (not b_next!2899))
(get-model)

(declare-fun b_lambda!5829 () Bool)

(assert (= b_lambda!5825 (or (and b!130775 b_free!2897) (and b!130789 b_free!2899 (= (defaultEntry!2843 newMap!16) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))))) b_lambda!5829)))

(check-sat b_and!8105 (not b!130783) tp_is_empty!2865 (not b_next!2899) (not b!130780) (not b!130788) (not b!130789) (not start!14098) (not b!130781) (not b_next!2897) (not mapNonEmpty!4595) b_and!8103 (not b!130774) (not b!130775) (not mapNonEmpty!4596) (not b_lambda!5829))
(check-sat b_and!8103 b_and!8105 (not b_next!2897) (not b_next!2899))
(get-model)

(declare-fun d!39859 () Bool)

(declare-fun res!63083 () Bool)

(declare-fun e!85373 () Bool)

(assert (=> d!39859 (=> (not res!63083) (not e!85373))))

(declare-fun simpleValid!90 (LongMapFixedSize!1086) Bool)

(assert (=> d!39859 (= res!63083 (simpleValid!90 newMap!16))))

(assert (=> d!39859 (= (valid!516 newMap!16) e!85373)))

(declare-fun b!130855 () Bool)

(declare-fun res!63084 () Bool)

(assert (=> b!130855 (=> (not res!63084) (not e!85373))))

(declare-fun arrayCountValidKeys!0 (array!4753 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!130855 (= res!63084 (= (arrayCountValidKeys!0 (_keys!4588 newMap!16) #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) (_size!592 newMap!16)))))

(declare-fun b!130856 () Bool)

(declare-fun res!63085 () Bool)

(assert (=> b!130856 (=> (not res!63085) (not e!85373))))

(assert (=> b!130856 (= res!63085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(declare-fun b!130857 () Bool)

(declare-datatypes ((List!1712 0))(
  ( (Nil!1709) (Cons!1708 (h!2313 (_ BitVec 64)) (t!6135 List!1712)) )
))
(declare-fun arrayNoDuplicates!0 (array!4753 (_ BitVec 32) List!1712) Bool)

(assert (=> b!130857 (= e!85373 (arrayNoDuplicates!0 (_keys!4588 newMap!16) #b00000000000000000000000000000000 Nil!1709))))

(assert (= (and d!39859 res!63083) b!130855))

(assert (= (and b!130855 res!63084) b!130856))

(assert (= (and b!130856 res!63085) b!130857))

(declare-fun m!154257 () Bool)

(assert (=> d!39859 m!154257))

(declare-fun m!154259 () Bool)

(assert (=> b!130855 m!154259))

(declare-fun m!154261 () Bool)

(assert (=> b!130856 m!154261))

(declare-fun m!154263 () Bool)

(assert (=> b!130857 m!154263))

(assert (=> b!130783 d!39859))

(declare-fun d!39861 () Bool)

(declare-fun e!85379 () Bool)

(assert (=> d!39861 e!85379))

(declare-fun res!63088 () Bool)

(assert (=> d!39861 (=> res!63088 e!85379)))

(declare-fun lt!68040 () Bool)

(assert (=> d!39861 (= res!63088 (not lt!68040))))

(declare-fun lt!68043 () Bool)

(assert (=> d!39861 (= lt!68040 lt!68043)))

(declare-datatypes ((Unit!4097 0))(
  ( (Unit!4098) )
))
(declare-fun lt!68042 () Unit!4097)

(declare-fun e!85378 () Unit!4097)

(assert (=> d!39861 (= lt!68042 e!85378)))

(declare-fun c!24130 () Bool)

(assert (=> d!39861 (= c!24130 lt!68043)))

(declare-fun containsKey!174 (List!1710 (_ BitVec 64)) Bool)

(assert (=> d!39861 (= lt!68043 (containsKey!174 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> d!39861 (= (contains!892 lt!68021 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) lt!68040)))

(declare-fun b!130864 () Bool)

(declare-fun lt!68041 () Unit!4097)

(assert (=> b!130864 (= e!85378 lt!68041)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!122 (List!1710 (_ BitVec 64)) Unit!4097)

(assert (=> b!130864 (= lt!68041 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-datatypes ((Option!176 0))(
  ( (Some!175 (v!3181 V!3467)) (None!174) )
))
(declare-fun isDefined!123 (Option!176) Bool)

(declare-fun getValueByKey!170 (List!1710 (_ BitVec 64)) Option!176)

(assert (=> b!130864 (isDefined!123 (getValueByKey!170 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun b!130865 () Bool)

(declare-fun Unit!4099 () Unit!4097)

(assert (=> b!130865 (= e!85378 Unit!4099)))

(declare-fun b!130866 () Bool)

(assert (=> b!130866 (= e!85379 (isDefined!123 (getValueByKey!170 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))))

(assert (= (and d!39861 c!24130) b!130864))

(assert (= (and d!39861 (not c!24130)) b!130865))

(assert (= (and d!39861 (not res!63088)) b!130866))

(assert (=> d!39861 m!154187))

(declare-fun m!154265 () Bool)

(assert (=> d!39861 m!154265))

(assert (=> b!130864 m!154187))

(declare-fun m!154267 () Bool)

(assert (=> b!130864 m!154267))

(assert (=> b!130864 m!154187))

(declare-fun m!154269 () Bool)

(assert (=> b!130864 m!154269))

(assert (=> b!130864 m!154269))

(declare-fun m!154271 () Bool)

(assert (=> b!130864 m!154271))

(assert (=> b!130866 m!154187))

(assert (=> b!130866 m!154269))

(assert (=> b!130866 m!154269))

(assert (=> b!130866 m!154271))

(assert (=> b!130781 d!39861))

(declare-fun b!130947 () Bool)

(declare-fun e!85431 () Bool)

(declare-fun e!85434 () Bool)

(assert (=> b!130947 (= e!85431 e!85434)))

(declare-fun c!24158 () Bool)

(declare-fun lt!68114 () tuple2!2614)

(assert (=> b!130947 (= c!24158 (_1!1318 lt!68114))))

(declare-fun bm!14277 () Bool)

(declare-fun call!14280 () ListLongMap!1699)

(declare-fun call!14293 () ListLongMap!1699)

(assert (=> bm!14277 (= call!14280 call!14293)))

(declare-fun b!130948 () Bool)

(declare-fun e!85433 () Bool)

(declare-fun e!85436 () Bool)

(assert (=> b!130948 (= e!85433 e!85436)))

(declare-fun res!63124 () Bool)

(declare-fun call!14288 () Bool)

(assert (=> b!130948 (= res!63124 call!14288)))

(assert (=> b!130948 (=> (not res!63124) (not e!85436))))

(declare-fun bm!14278 () Bool)

(declare-fun call!14286 () ListLongMap!1699)

(declare-fun call!14298 () ListLongMap!1699)

(assert (=> bm!14278 (= call!14286 call!14298)))

(declare-fun e!85432 () ListLongMap!1699)

(declare-fun bm!14279 () Bool)

(declare-fun c!24166 () Bool)

(declare-fun c!24157 () Bool)

(declare-fun +!173 (ListLongMap!1699 tuple2!2612) ListLongMap!1699)

(assert (=> bm!14279 (= call!14293 (+!173 e!85432 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!24159 () Bool)

(assert (=> bm!14279 (= c!24159 c!24166)))

(declare-fun bm!14280 () Bool)

(declare-fun call!14301 () Bool)

(declare-fun call!14281 () Bool)

(assert (=> bm!14280 (= call!14301 call!14281)))

(declare-fun b!130950 () Bool)

(declare-fun e!85425 () Unit!4097)

(declare-fun lt!68102 () Unit!4097)

(assert (=> b!130950 (= e!85425 lt!68102)))

(declare-fun call!14296 () Unit!4097)

(assert (=> b!130950 (= lt!68102 call!14296)))

(declare-datatypes ((SeekEntryResult!273 0))(
  ( (MissingZero!273 (index!3250 (_ BitVec 32))) (Found!273 (index!3251 (_ BitVec 32))) (Intermediate!273 (undefined!1085 Bool) (index!3252 (_ BitVec 32)) (x!15412 (_ BitVec 32))) (Undefined!273) (MissingVacant!273 (index!3253 (_ BitVec 32))) )
))
(declare-fun lt!68123 () SeekEntryResult!273)

(declare-fun call!14291 () SeekEntryResult!273)

(assert (=> b!130950 (= lt!68123 call!14291)))

(declare-fun res!63119 () Bool)

(assert (=> b!130950 (= res!63119 ((_ is Found!273) lt!68123))))

(declare-fun e!85435 () Bool)

(assert (=> b!130950 (=> (not res!63119) (not e!85435))))

(assert (=> b!130950 e!85435))

(declare-fun b!130951 () Bool)

(declare-fun lt!68103 () Unit!4097)

(declare-fun e!85426 () Unit!4097)

(assert (=> b!130951 (= lt!68103 e!85426)))

(declare-fun c!24169 () Bool)

(declare-fun call!14303 () Bool)

(assert (=> b!130951 (= c!24169 call!14303)))

(declare-fun e!85423 () tuple2!2614)

(assert (=> b!130951 (= e!85423 (tuple2!2615 false newMap!16))))

(declare-fun b!130952 () Bool)

(declare-fun res!63128 () Bool)

(declare-fun e!85430 () Bool)

(assert (=> b!130952 (=> (not res!63128) (not e!85430))))

(declare-fun lt!68117 () SeekEntryResult!273)

(assert (=> b!130952 (= res!63128 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3250 lt!68117)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130953 () Bool)

(declare-fun res!63127 () Bool)

(declare-fun call!14299 () Bool)

(assert (=> b!130953 (= res!63127 call!14299)))

(declare-fun e!85438 () Bool)

(assert (=> b!130953 (=> (not res!63127) (not e!85438))))

(declare-fun b!130954 () Bool)

(declare-fun Unit!4100 () Unit!4097)

(assert (=> b!130954 (= e!85426 Unit!4100)))

(declare-fun lt!68118 () Unit!4097)

(assert (=> b!130954 (= lt!68118 call!14296)))

(declare-fun lt!68106 () SeekEntryResult!273)

(declare-fun call!14289 () SeekEntryResult!273)

(assert (=> b!130954 (= lt!68106 call!14289)))

(declare-fun res!63130 () Bool)

(assert (=> b!130954 (= res!63130 ((_ is Found!273) lt!68106))))

(assert (=> b!130954 (=> (not res!63130) (not e!85438))))

(assert (=> b!130954 e!85438))

(declare-fun lt!68104 () Unit!4097)

(assert (=> b!130954 (= lt!68104 lt!68118)))

(assert (=> b!130954 false))

(declare-fun b!130955 () Bool)

(declare-fun c!24162 () Bool)

(declare-fun lt!68108 () SeekEntryResult!273)

(assert (=> b!130955 (= c!24162 ((_ is MissingVacant!273) lt!68108))))

(declare-fun e!85424 () Bool)

(assert (=> b!130955 (= e!85424 e!85433)))

(declare-fun bm!14281 () Bool)

(declare-fun call!14297 () ListLongMap!1699)

(declare-fun call!14285 () ListLongMap!1699)

(assert (=> bm!14281 (= call!14297 call!14285)))

(declare-fun b!130956 () Bool)

(declare-fun e!85428 () tuple2!2614)

(declare-fun e!85440 () tuple2!2614)

(assert (=> b!130956 (= e!85428 e!85440)))

(declare-fun c!24168 () Bool)

(declare-fun lt!68120 () SeekEntryResult!273)

(assert (=> b!130956 (= c!24168 ((_ is MissingZero!273) lt!68120))))

(declare-fun b!130957 () Bool)

(declare-fun res!63125 () Bool)

(declare-fun e!85429 () Bool)

(assert (=> b!130957 (=> (not res!63125) (not e!85429))))

(assert (=> b!130957 (= res!63125 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3250 lt!68108)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!14283 () Bool)

(declare-fun bm!14282 () Bool)

(declare-fun arrayContainsKey!0 (array!4753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!14282 (= call!14283 (arrayContainsKey!0 (_keys!4588 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!14283 () Bool)

(assert (=> bm!14283 (= call!14288 call!14299)))

(declare-fun bm!14284 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 64) Int) Unit!4097)

(assert (=> bm!14284 (= call!14296 (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)))))

(declare-fun b!130958 () Bool)

(declare-fun e!85439 () Bool)

(declare-fun call!14294 () Bool)

(assert (=> b!130958 (= e!85439 (not call!14294))))

(declare-fun b!130959 () Bool)

(declare-fun res!63121 () Bool)

(assert (=> b!130959 (= res!63121 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3253 lt!68108)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130959 (=> (not res!63121) (not e!85436))))

(declare-fun b!130960 () Bool)

(assert (=> b!130960 (= e!85430 (not call!14294))))

(declare-fun b!130961 () Bool)

(assert (=> b!130961 (= e!85435 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68123)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun lt!68098 () (_ BitVec 32))

(declare-fun lt!68121 () array!4755)

(declare-fun bm!14285 () Bool)

(declare-fun lt!68100 () (_ BitVec 32))

(declare-fun c!24164 () Bool)

(assert (=> bm!14285 (= call!14298 (getCurrentListMap!542 (_keys!4588 newMap!16) (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121) (mask!7131 newMap!16) (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun b!130962 () Bool)

(assert (=> b!130962 (= e!85433 ((_ is Undefined!273) lt!68108))))

(declare-fun b!130963 () Bool)

(declare-fun res!63126 () Bool)

(assert (=> b!130963 (= res!63126 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3253 lt!68117)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130963 (=> (not res!63126) (not e!85439))))

(declare-fun b!130964 () Bool)

(declare-fun lt!68115 () Unit!4097)

(declare-fun lt!68111 () Unit!4097)

(assert (=> b!130964 (= lt!68115 lt!68111)))

(declare-fun call!14292 () ListLongMap!1699)

(assert (=> b!130964 (= call!14280 call!14292)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 V!3467 Int) Unit!4097)

(assert (=> b!130964 (= lt!68111 (lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) lt!68098 (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2843 newMap!16)))))

(assert (=> b!130964 (= lt!68098 (bvor (extraKeys!2612 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!85422 () tuple2!2614)

(assert (=> b!130964 (= e!85422 (tuple2!2615 true (LongMapFixedSize!1087 (defaultEntry!2843 newMap!16) (mask!7131 newMap!16) (bvor (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) (zeroValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!592 newMap!16) (_keys!4588 newMap!16) (_values!2826 newMap!16) (_vacant!592 newMap!16))))))

(declare-fun b!130965 () Bool)

(declare-fun res!63118 () Bool)

(assert (=> b!130965 (=> (not res!63118) (not e!85429))))

(assert (=> b!130965 (= res!63118 call!14288)))

(assert (=> b!130965 (= e!85424 e!85429)))

(declare-fun b!130966 () Bool)

(declare-fun lt!68112 () Unit!4097)

(declare-fun lt!68107 () Unit!4097)

(assert (=> b!130966 (= lt!68112 lt!68107)))

(assert (=> b!130966 call!14303))

(declare-fun lemmaValidKeyInArrayIsInListMap!120 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 32) Int) Unit!4097)

(assert (=> b!130966 (= lt!68107 (lemmaValidKeyInArrayIsInListMap!120 (_keys!4588 newMap!16) lt!68121 (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (index!3251 lt!68120) (defaultEntry!2843 newMap!16)))))

(assert (=> b!130966 (= lt!68121 (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16))))))

(declare-fun lt!68101 () Unit!4097)

(declare-fun lt!68119 () Unit!4097)

(assert (=> b!130966 (= lt!68101 lt!68119)))

(assert (=> b!130966 (= call!14293 call!14285)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 32) (_ BitVec 64) V!3467 Int) Unit!4097)

(assert (=> b!130966 (= lt!68119 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (index!3251 lt!68120) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68109 () Unit!4097)

(assert (=> b!130966 (= lt!68109 e!85425)))

(declare-fun c!24163 () Bool)

(assert (=> b!130966 (= c!24163 (contains!892 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> b!130966 (= e!85440 (tuple2!2615 true (LongMapFixedSize!1087 (defaultEntry!2843 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (_size!592 newMap!16) (_keys!4588 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16))) (_vacant!592 newMap!16))))))

(declare-fun b!130967 () Bool)

(declare-fun lt!68113 () Unit!4097)

(declare-fun lt!68116 () Unit!4097)

(assert (=> b!130967 (= lt!68113 lt!68116)))

(assert (=> b!130967 (= call!14280 call!14292)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!59 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 V!3467 Int) Unit!4097)

(assert (=> b!130967 (= lt!68116 (lemmaChangeZeroKeyThenAddPairToListMap!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) lt!68100 (zeroValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2700 newMap!16) (defaultEntry!2843 newMap!16)))))

(assert (=> b!130967 (= lt!68100 (bvor (extraKeys!2612 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!130967 (= e!85422 (tuple2!2615 true (LongMapFixedSize!1087 (defaultEntry!2843 newMap!16) (mask!7131 newMap!16) (bvor (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2700 newMap!16) (_size!592 newMap!16) (_keys!4588 newMap!16) (_values!2826 newMap!16) (_vacant!592 newMap!16))))))

(declare-fun b!130968 () Bool)

(declare-fun call!14290 () Bool)

(assert (=> b!130968 (= e!85429 (not call!14290))))

(declare-fun b!130969 () Bool)

(declare-fun call!14300 () ListLongMap!1699)

(declare-fun call!14284 () ListLongMap!1699)

(assert (=> b!130969 (= e!85434 (= call!14300 call!14284))))

(declare-fun b!130970 () Bool)

(assert (=> b!130970 (= e!85436 (not call!14290))))

(declare-fun bm!14286 () Bool)

(declare-fun call!14302 () tuple2!2614)

(declare-fun c!24167 () Bool)

(declare-fun updateHelperNewKey!59 (LongMapFixedSize!1086 (_ BitVec 64) V!3467 (_ BitVec 32)) tuple2!2614)

(assert (=> bm!14286 (= call!14302 (updateHelperNewKey!59 newMap!16 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120))))))

(declare-fun b!130971 () Bool)

(declare-fun lt!68110 () tuple2!2614)

(assert (=> b!130971 (= e!85428 (tuple2!2615 (_1!1318 lt!68110) (_2!1318 lt!68110)))))

(assert (=> b!130971 (= lt!68110 call!14302)))

(declare-fun bm!14287 () Bool)

(assert (=> bm!14287 (= call!14300 (map!1401 (_2!1318 lt!68114)))))

(declare-fun b!130972 () Bool)

(declare-fun Unit!4101 () Unit!4097)

(assert (=> b!130972 (= e!85425 Unit!4101)))

(declare-fun lt!68099 () Unit!4097)

(declare-fun call!14287 () Unit!4097)

(assert (=> b!130972 (= lt!68099 call!14287)))

(assert (=> b!130972 (= lt!68117 call!14291)))

(declare-fun c!24161 () Bool)

(assert (=> b!130972 (= c!24161 ((_ is MissingZero!273) lt!68117))))

(declare-fun e!85427 () Bool)

(assert (=> b!130972 e!85427))

(declare-fun lt!68124 () Unit!4097)

(assert (=> b!130972 (= lt!68124 lt!68099)))

(assert (=> b!130972 false))

(declare-fun b!130973 () Bool)

(declare-fun res!63129 () Bool)

(assert (=> b!130973 (=> (not res!63129) (not e!85430))))

(assert (=> b!130973 (= res!63129 call!14301)))

(assert (=> b!130973 (= e!85427 e!85430)))

(declare-fun b!130974 () Bool)

(declare-fun lt!68105 () Unit!4097)

(assert (=> b!130974 (= e!85426 lt!68105)))

(assert (=> b!130974 (= lt!68105 call!14287)))

(assert (=> b!130974 (= lt!68108 call!14289)))

(declare-fun c!24165 () Bool)

(assert (=> b!130974 (= c!24165 ((_ is MissingZero!273) lt!68108))))

(assert (=> b!130974 e!85424))

(declare-fun b!130975 () Bool)

(declare-fun res!63123 () Bool)

(assert (=> b!130975 (= res!63123 call!14281)))

(assert (=> b!130975 (=> (not res!63123) (not e!85435))))

(declare-fun bm!14288 () Bool)

(assert (=> bm!14288 (= call!14303 (contains!892 call!14286 (ite c!24164 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68120)))))))

(declare-fun b!130949 () Bool)

(declare-fun e!85437 () Bool)

(assert (=> b!130949 (= e!85434 e!85437)))

(declare-fun res!63117 () Bool)

(assert (=> b!130949 (= res!63117 (contains!892 call!14300 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> b!130949 (=> (not res!63117) (not e!85437))))

(declare-fun d!39863 () Bool)

(assert (=> d!39863 e!85431))

(declare-fun res!63120 () Bool)

(assert (=> d!39863 (=> (not res!63120) (not e!85431))))

(assert (=> d!39863 (= res!63120 (valid!516 (_2!1318 lt!68114)))))

(declare-fun e!85441 () tuple2!2614)

(assert (=> d!39863 (= lt!68114 e!85441)))

(assert (=> d!39863 (= c!24166 (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (bvneg (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))))

(assert (=> d!39863 (valid!516 newMap!16)))

(assert (=> d!39863 (= (update!191 newMap!16 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!68114)))

(declare-fun bm!14289 () Bool)

(assert (=> bm!14289 (= call!14294 call!14283)))

(declare-fun b!130976 () Bool)

(assert (=> b!130976 (= e!85432 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun bm!14290 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 64) Int) Unit!4097)

(assert (=> bm!14290 (= call!14287 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)))))

(declare-fun bm!14291 () Bool)

(assert (=> bm!14291 (= call!14290 call!14283)))

(declare-fun call!14282 () SeekEntryResult!273)

(declare-fun bm!14292 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4753 (_ BitVec 32)) SeekEntryResult!273)

(assert (=> bm!14292 (= call!14282 (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(declare-fun bm!14293 () Bool)

(assert (=> bm!14293 (= call!14289 call!14282)))

(declare-fun bm!14294 () Bool)

(declare-fun call!14295 () Bool)

(assert (=> bm!14294 (= call!14299 call!14295)))

(declare-fun b!130977 () Bool)

(assert (=> b!130977 (= e!85437 (= call!14300 (+!173 call!14284 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130978 () Bool)

(declare-fun lt!68122 () tuple2!2614)

(assert (=> b!130978 (= lt!68122 call!14302)))

(assert (=> b!130978 (= e!85440 (tuple2!2615 (_1!1318 lt!68122) (_2!1318 lt!68122)))))

(declare-fun bm!14295 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14295 (= call!14295 (inRange!0 (ite c!24164 (ite c!24169 (index!3251 lt!68106) (ite c!24165 (index!3250 lt!68108) (index!3253 lt!68108))) (ite c!24163 (index!3251 lt!68123) (ite c!24161 (index!3250 lt!68117) (index!3253 lt!68117)))) (mask!7131 newMap!16)))))

(declare-fun bm!14296 () Bool)

(assert (=> bm!14296 (= call!14281 call!14295)))

(declare-fun bm!14297 () Bool)

(assert (=> bm!14297 (= call!14292 call!14298)))

(declare-fun b!130979 () Bool)

(declare-fun e!85442 () Bool)

(assert (=> b!130979 (= e!85442 e!85439)))

(declare-fun res!63122 () Bool)

(assert (=> b!130979 (= res!63122 call!14301)))

(assert (=> b!130979 (=> (not res!63122) (not e!85439))))

(declare-fun b!130980 () Bool)

(declare-fun c!24160 () Bool)

(assert (=> b!130980 (= c!24160 ((_ is MissingVacant!273) lt!68117))))

(assert (=> b!130980 (= e!85427 e!85442)))

(declare-fun bm!14298 () Bool)

(assert (=> bm!14298 (= call!14285 (getCurrentListMap!542 (_keys!4588 newMap!16) (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun b!130981 () Bool)

(assert (=> b!130981 (= e!85442 ((_ is Undefined!273) lt!68117))))

(declare-fun b!130982 () Bool)

(assert (=> b!130982 (= e!85432 call!14297)))

(declare-fun b!130983 () Bool)

(assert (=> b!130983 (= e!85441 e!85423)))

(assert (=> b!130983 (= lt!68120 (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(assert (=> b!130983 (= c!24164 ((_ is Undefined!273) lt!68120))))

(declare-fun b!130984 () Bool)

(assert (=> b!130984 (= e!85438 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68106)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun bm!14299 () Bool)

(assert (=> bm!14299 (= call!14284 (map!1401 newMap!16))))

(declare-fun bm!14300 () Bool)

(assert (=> bm!14300 (= call!14291 call!14282)))

(declare-fun b!130985 () Bool)

(assert (=> b!130985 (= e!85441 e!85422)))

(assert (=> b!130985 (= c!24157 (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130986 () Bool)

(assert (=> b!130986 (= c!24167 ((_ is MissingVacant!273) lt!68120))))

(assert (=> b!130986 (= e!85423 e!85428)))

(assert (= (and d!39863 c!24166) b!130985))

(assert (= (and d!39863 (not c!24166)) b!130983))

(assert (= (and b!130985 c!24157) b!130967))

(assert (= (and b!130985 (not c!24157)) b!130964))

(assert (= (or b!130967 b!130964) bm!14297))

(assert (= (or b!130967 b!130964) bm!14281))

(assert (= (or b!130967 b!130964) bm!14277))

(assert (= (and b!130983 c!24164) b!130951))

(assert (= (and b!130983 (not c!24164)) b!130986))

(assert (= (and b!130951 c!24169) b!130954))

(assert (= (and b!130951 (not c!24169)) b!130974))

(assert (= (and b!130954 res!63130) b!130953))

(assert (= (and b!130953 res!63127) b!130984))

(assert (= (and b!130974 c!24165) b!130965))

(assert (= (and b!130974 (not c!24165)) b!130955))

(assert (= (and b!130965 res!63118) b!130957))

(assert (= (and b!130957 res!63125) b!130968))

(assert (= (and b!130955 c!24162) b!130948))

(assert (= (and b!130955 (not c!24162)) b!130962))

(assert (= (and b!130948 res!63124) b!130959))

(assert (= (and b!130959 res!63121) b!130970))

(assert (= (or b!130965 b!130948) bm!14283))

(assert (= (or b!130968 b!130970) bm!14291))

(assert (= (or b!130953 bm!14283) bm!14294))

(assert (= (or b!130954 b!130974) bm!14293))

(assert (= (and b!130986 c!24167) b!130971))

(assert (= (and b!130986 (not c!24167)) b!130956))

(assert (= (and b!130956 c!24168) b!130978))

(assert (= (and b!130956 (not c!24168)) b!130966))

(assert (= (and b!130966 c!24163) b!130950))

(assert (= (and b!130966 (not c!24163)) b!130972))

(assert (= (and b!130950 res!63119) b!130975))

(assert (= (and b!130975 res!63123) b!130961))

(assert (= (and b!130972 c!24161) b!130973))

(assert (= (and b!130972 (not c!24161)) b!130980))

(assert (= (and b!130973 res!63129) b!130952))

(assert (= (and b!130952 res!63128) b!130960))

(assert (= (and b!130980 c!24160) b!130979))

(assert (= (and b!130980 (not c!24160)) b!130981))

(assert (= (and b!130979 res!63122) b!130963))

(assert (= (and b!130963 res!63126) b!130958))

(assert (= (or b!130973 b!130979) bm!14280))

(assert (= (or b!130960 b!130958) bm!14289))

(assert (= (or b!130975 bm!14280) bm!14296))

(assert (= (or b!130950 b!130972) bm!14300))

(assert (= (or b!130971 b!130978) bm!14286))

(assert (= (or bm!14291 bm!14289) bm!14282))

(assert (= (or b!130951 b!130966) bm!14278))

(assert (= (or bm!14293 bm!14300) bm!14292))

(assert (= (or bm!14294 bm!14296) bm!14295))

(assert (= (or b!130974 b!130972) bm!14290))

(assert (= (or b!130954 b!130950) bm!14284))

(assert (= (or b!130951 b!130966) bm!14288))

(assert (= (or bm!14297 bm!14278) bm!14285))

(assert (= (or bm!14281 b!130966) bm!14298))

(assert (= (or bm!14277 b!130966) bm!14279))

(assert (= (and bm!14279 c!24159) b!130982))

(assert (= (and bm!14279 (not c!24159)) b!130976))

(assert (= (and d!39863 res!63120) b!130947))

(assert (= (and b!130947 c!24158) b!130949))

(assert (= (and b!130947 (not c!24158)) b!130969))

(assert (= (and b!130949 res!63117) b!130977))

(assert (= (or b!130949 b!130977 b!130969) bm!14287))

(assert (= (or b!130977 b!130969) bm!14299))

(assert (=> bm!14282 m!154187))

(declare-fun m!154273 () Bool)

(assert (=> bm!14282 m!154273))

(declare-fun m!154275 () Bool)

(assert (=> b!130984 m!154275))

(declare-fun m!154277 () Bool)

(assert (=> b!130961 m!154277))

(declare-fun m!154279 () Bool)

(assert (=> d!39863 m!154279))

(assert (=> d!39863 m!154195))

(assert (=> bm!14299 m!154189))

(assert (=> bm!14286 m!154187))

(assert (=> bm!14286 m!154211))

(declare-fun m!154281 () Bool)

(assert (=> bm!14286 m!154281))

(assert (=> b!130949 m!154187))

(declare-fun m!154283 () Bool)

(assert (=> b!130949 m!154283))

(declare-fun m!154285 () Bool)

(assert (=> bm!14295 m!154285))

(declare-fun m!154287 () Bool)

(assert (=> b!130976 m!154287))

(declare-fun m!154289 () Bool)

(assert (=> b!130959 m!154289))

(assert (=> b!130964 m!154211))

(declare-fun m!154291 () Bool)

(assert (=> b!130964 m!154291))

(declare-fun m!154293 () Bool)

(assert (=> b!130966 m!154293))

(declare-fun m!154295 () Bool)

(assert (=> b!130966 m!154295))

(assert (=> b!130966 m!154187))

(assert (=> b!130966 m!154211))

(declare-fun m!154297 () Bool)

(assert (=> b!130966 m!154297))

(assert (=> b!130966 m!154287))

(assert (=> b!130966 m!154187))

(declare-fun m!154299 () Bool)

(assert (=> b!130966 m!154299))

(assert (=> b!130966 m!154287))

(declare-fun m!154301 () Bool)

(assert (=> bm!14288 m!154301))

(declare-fun m!154303 () Bool)

(assert (=> bm!14288 m!154303))

(assert (=> bm!14292 m!154187))

(declare-fun m!154305 () Bool)

(assert (=> bm!14292 m!154305))

(declare-fun m!154307 () Bool)

(assert (=> b!130957 m!154307))

(declare-fun m!154309 () Bool)

(assert (=> b!130977 m!154309))

(declare-fun m!154311 () Bool)

(assert (=> bm!14287 m!154311))

(declare-fun m!154313 () Bool)

(assert (=> bm!14285 m!154313))

(declare-fun m!154315 () Bool)

(assert (=> b!130952 m!154315))

(assert (=> bm!14298 m!154293))

(declare-fun m!154317 () Bool)

(assert (=> bm!14298 m!154317))

(assert (=> bm!14290 m!154187))

(declare-fun m!154319 () Bool)

(assert (=> bm!14290 m!154319))

(declare-fun m!154321 () Bool)

(assert (=> b!130963 m!154321))

(declare-fun m!154323 () Bool)

(assert (=> bm!14279 m!154323))

(assert (=> bm!14284 m!154187))

(declare-fun m!154325 () Bool)

(assert (=> bm!14284 m!154325))

(assert (=> b!130967 m!154211))

(declare-fun m!154327 () Bool)

(assert (=> b!130967 m!154327))

(assert (=> b!130983 m!154187))

(assert (=> b!130983 m!154305))

(assert (=> b!130781 d!39863))

(declare-fun d!39865 () Bool)

(declare-fun c!24172 () Bool)

(assert (=> d!39865 (= c!24172 ((_ is ValueCellFull!1089) (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun e!85445 () V!3467)

(assert (=> d!39865 (= (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85445)))

(declare-fun b!130991 () Bool)

(declare-fun get!1470 (ValueCell!1089 V!3467) V!3467)

(assert (=> b!130991 (= e!85445 (get!1470 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130992 () Bool)

(declare-fun get!1471 (ValueCell!1089 V!3467) V!3467)

(assert (=> b!130992 (= e!85445 (get!1471 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39865 c!24172) b!130991))

(assert (= (and d!39865 (not c!24172)) b!130992))

(assert (=> b!130991 m!154207))

(assert (=> b!130991 m!154209))

(declare-fun m!154329 () Bool)

(assert (=> b!130991 m!154329))

(assert (=> b!130992 m!154207))

(assert (=> b!130992 m!154209))

(declare-fun m!154331 () Bool)

(assert (=> b!130992 m!154331))

(assert (=> b!130781 d!39865))

(declare-fun d!39867 () Bool)

(assert (=> d!39867 (= (array_inv!1415 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvsge (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!130775 d!39867))

(declare-fun d!39869 () Bool)

(assert (=> d!39869 (= (array_inv!1416 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvsge (size!2517 (_values!2826 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!130775 d!39869))

(declare-fun d!39871 () Bool)

(assert (=> d!39871 (= (array_inv!1415 (_keys!4588 newMap!16)) (bvsge (size!2516 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130789 d!39871))

(declare-fun d!39873 () Bool)

(assert (=> d!39873 (= (array_inv!1416 (_values!2826 newMap!16)) (bvsge (size!2517 (_values!2826 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130789 d!39873))

(declare-fun b!131001 () Bool)

(declare-fun e!85453 () Bool)

(declare-fun call!14306 () Bool)

(assert (=> b!131001 (= e!85453 call!14306)))

(declare-fun b!131002 () Bool)

(declare-fun e!85454 () Bool)

(assert (=> b!131002 (= e!85454 e!85453)))

(declare-fun c!24175 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!131002 (= c!24175 (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!39875 () Bool)

(declare-fun res!63135 () Bool)

(assert (=> d!39875 (=> res!63135 e!85454)))

(assert (=> d!39875 (= res!63135 (bvsge #b00000000000000000000000000000000 (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(assert (=> d!39875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))) e!85454)))

(declare-fun b!131003 () Bool)

(declare-fun e!85452 () Bool)

(assert (=> b!131003 (= e!85452 call!14306)))

(declare-fun bm!14303 () Bool)

(assert (=> bm!14303 (= call!14306 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131004 () Bool)

(assert (=> b!131004 (= e!85453 e!85452)))

(declare-fun lt!68133 () (_ BitVec 64))

(assert (=> b!131004 (= lt!68133 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!68131 () Unit!4097)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4753 (_ BitVec 64) (_ BitVec 32)) Unit!4097)

(assert (=> b!131004 (= lt!68131 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68133 #b00000000000000000000000000000000))))

(assert (=> b!131004 (arrayContainsKey!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68133 #b00000000000000000000000000000000)))

(declare-fun lt!68132 () Unit!4097)

(assert (=> b!131004 (= lt!68132 lt!68131)))

(declare-fun res!63136 () Bool)

(assert (=> b!131004 (= res!63136 (= (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))) (Found!273 #b00000000000000000000000000000000)))))

(assert (=> b!131004 (=> (not res!63136) (not e!85452))))

(assert (= (and d!39875 (not res!63135)) b!131002))

(assert (= (and b!131002 c!24175) b!131004))

(assert (= (and b!131002 (not c!24175)) b!131001))

(assert (= (and b!131004 res!63136) b!131003))

(assert (= (or b!131003 b!131001) bm!14303))

(declare-fun m!154333 () Bool)

(assert (=> b!131002 m!154333))

(assert (=> b!131002 m!154333))

(declare-fun m!154335 () Bool)

(assert (=> b!131002 m!154335))

(declare-fun m!154337 () Bool)

(assert (=> bm!14303 m!154337))

(assert (=> b!131004 m!154333))

(declare-fun m!154339 () Bool)

(assert (=> b!131004 m!154339))

(declare-fun m!154341 () Bool)

(assert (=> b!131004 m!154341))

(assert (=> b!131004 m!154333))

(declare-fun m!154343 () Bool)

(assert (=> b!131004 m!154343))

(assert (=> b!130780 d!39875))

(declare-fun d!39877 () Bool)

(assert (=> d!39877 (= (map!1401 newMap!16) (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun bs!5434 () Bool)

(assert (= bs!5434 d!39877))

(assert (=> bs!5434 m!154287))

(assert (=> b!130774 d!39877))

(declare-fun b!131047 () Bool)

(declare-fun e!85484 () Bool)

(declare-fun lt!68179 () ListLongMap!1699)

(declare-fun apply!114 (ListLongMap!1699 (_ BitVec 64)) V!3467)

(assert (=> b!131047 (= e!85484 (= (apply!114 lt!68179 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2517 (_values!2826 (v!3177 (underlying!450 thiss!992))))))))

(assert (=> b!131047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131048 () Bool)

(declare-fun e!85481 () Bool)

(declare-fun e!85483 () Bool)

(assert (=> b!131048 (= e!85481 e!85483)))

(declare-fun res!63161 () Bool)

(declare-fun call!14327 () Bool)

(assert (=> b!131048 (= res!63161 call!14327)))

(assert (=> b!131048 (=> (not res!63161) (not e!85483))))

(declare-fun bm!14318 () Bool)

(declare-fun call!14326 () Bool)

(assert (=> bm!14318 (= call!14326 (contains!892 lt!68179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!39879 () Bool)

(declare-fun e!85486 () Bool)

(assert (=> d!39879 e!85486))

(declare-fun res!63155 () Bool)

(assert (=> d!39879 (=> (not res!63155) (not e!85486))))

(assert (=> d!39879 (= res!63155 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))))

(declare-fun lt!68193 () ListLongMap!1699)

(assert (=> d!39879 (= lt!68179 lt!68193)))

(declare-fun lt!68192 () Unit!4097)

(declare-fun e!85482 () Unit!4097)

(assert (=> d!39879 (= lt!68192 e!85482)))

(declare-fun c!24190 () Bool)

(declare-fun e!85487 () Bool)

(assert (=> d!39879 (= c!24190 e!85487)))

(declare-fun res!63162 () Bool)

(assert (=> d!39879 (=> (not res!63162) (not e!85487))))

(assert (=> d!39879 (= res!63162 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun e!85485 () ListLongMap!1699)

(assert (=> d!39879 (= lt!68193 e!85485)))

(declare-fun c!24193 () Bool)

(assert (=> d!39879 (= c!24193 (and (not (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39879 (validMask!0 (mask!7131 (v!3177 (underlying!450 thiss!992))))))

(assert (=> d!39879 (= (getCurrentListMap!542 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))) lt!68179)))

(declare-fun b!131049 () Bool)

(assert (=> b!131049 (= e!85486 e!85481)))

(declare-fun c!24191 () Bool)

(assert (=> b!131049 (= c!24191 (not (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131050 () Bool)

(declare-fun e!85489 () Bool)

(assert (=> b!131050 (= e!85489 (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!14319 () Bool)

(declare-fun call!14325 () ListLongMap!1699)

(declare-fun call!14321 () ListLongMap!1699)

(assert (=> bm!14319 (= call!14325 call!14321)))

(declare-fun b!131051 () Bool)

(declare-fun Unit!4102 () Unit!4097)

(assert (=> b!131051 (= e!85482 Unit!4102)))

(declare-fun b!131052 () Bool)

(declare-fun c!24192 () Bool)

(assert (=> b!131052 (= c!24192 (and (not (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85493 () ListLongMap!1699)

(declare-fun e!85492 () ListLongMap!1699)

(assert (=> b!131052 (= e!85493 e!85492)))

(declare-fun bm!14320 () Bool)

(assert (=> bm!14320 (= call!14327 (contains!892 lt!68179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131053 () Bool)

(declare-fun res!63158 () Bool)

(assert (=> b!131053 (=> (not res!63158) (not e!85486))))

(declare-fun e!85488 () Bool)

(assert (=> b!131053 (= res!63158 e!85488)))

(declare-fun res!63156 () Bool)

(assert (=> b!131053 (=> res!63156 e!85488)))

(assert (=> b!131053 (= res!63156 (not e!85489))))

(declare-fun res!63160 () Bool)

(assert (=> b!131053 (=> (not res!63160) (not e!85489))))

(assert (=> b!131053 (= res!63160 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131054 () Bool)

(assert (=> b!131054 (= e!85483 (= (apply!114 lt!68179 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131055 () Bool)

(assert (=> b!131055 (= e!85492 call!14325)))

(declare-fun b!131056 () Bool)

(assert (=> b!131056 (= e!85488 e!85484)))

(declare-fun res!63163 () Bool)

(assert (=> b!131056 (=> (not res!63163) (not e!85484))))

(assert (=> b!131056 (= res!63163 (contains!892 lt!68179 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131056 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131057 () Bool)

(declare-fun e!85491 () Bool)

(assert (=> b!131057 (= e!85491 (not call!14326))))

(declare-fun b!131058 () Bool)

(assert (=> b!131058 (= e!85481 (not call!14327))))

(declare-fun b!131059 () Bool)

(declare-fun call!14324 () ListLongMap!1699)

(assert (=> b!131059 (= e!85492 call!14324)))

(declare-fun b!131060 () Bool)

(declare-fun res!63157 () Bool)

(assert (=> b!131060 (=> (not res!63157) (not e!85486))))

(assert (=> b!131060 (= res!63157 e!85491)))

(declare-fun c!24189 () Bool)

(assert (=> b!131060 (= c!24189 (not (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14321 () Bool)

(declare-fun call!14323 () ListLongMap!1699)

(declare-fun call!14322 () ListLongMap!1699)

(assert (=> bm!14321 (= call!14323 call!14322)))

(declare-fun b!131061 () Bool)

(assert (=> b!131061 (= e!85493 call!14325)))

(declare-fun c!24188 () Bool)

(declare-fun bm!14322 () Bool)

(assert (=> bm!14322 (= call!14321 (+!173 (ite c!24193 call!14322 (ite c!24188 call!14323 call!14324)) (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(declare-fun b!131062 () Bool)

(declare-fun e!85490 () Bool)

(assert (=> b!131062 (= e!85491 e!85490)))

(declare-fun res!63159 () Bool)

(assert (=> b!131062 (= res!63159 call!14326)))

(assert (=> b!131062 (=> (not res!63159) (not e!85490))))

(declare-fun b!131063 () Bool)

(declare-fun lt!68187 () Unit!4097)

(assert (=> b!131063 (= e!85482 lt!68187)))

(declare-fun lt!68190 () ListLongMap!1699)

(declare-fun getCurrentListMapNoExtraKeys!139 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 32) Int) ListLongMap!1699)

(assert (=> b!131063 (= lt!68190 (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun lt!68184 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68197 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68197 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68191 () Unit!4097)

(declare-fun addStillContains!90 (ListLongMap!1699 (_ BitVec 64) V!3467 (_ BitVec 64)) Unit!4097)

(assert (=> b!131063 (= lt!68191 (addStillContains!90 lt!68190 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68197))))

(assert (=> b!131063 (contains!892 (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68197)))

(declare-fun lt!68180 () Unit!4097)

(assert (=> b!131063 (= lt!68180 lt!68191)))

(declare-fun lt!68178 () ListLongMap!1699)

(assert (=> b!131063 (= lt!68178 (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun lt!68194 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68194 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68183 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68183 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68181 () Unit!4097)

(declare-fun addApplyDifferent!90 (ListLongMap!1699 (_ BitVec 64) V!3467 (_ BitVec 64)) Unit!4097)

(assert (=> b!131063 (= lt!68181 (addApplyDifferent!90 lt!68178 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68183))))

(assert (=> b!131063 (= (apply!114 (+!173 lt!68178 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68183) (apply!114 lt!68178 lt!68183))))

(declare-fun lt!68195 () Unit!4097)

(assert (=> b!131063 (= lt!68195 lt!68181)))

(declare-fun lt!68196 () ListLongMap!1699)

(assert (=> b!131063 (= lt!68196 (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun lt!68182 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68188 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68188 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68198 () Unit!4097)

(assert (=> b!131063 (= lt!68198 (addApplyDifferent!90 lt!68196 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68188))))

(assert (=> b!131063 (= (apply!114 (+!173 lt!68196 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68188) (apply!114 lt!68196 lt!68188))))

(declare-fun lt!68186 () Unit!4097)

(assert (=> b!131063 (= lt!68186 lt!68198)))

(declare-fun lt!68185 () ListLongMap!1699)

(assert (=> b!131063 (= lt!68185 (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun lt!68189 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68189 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68199 () (_ BitVec 64))

(assert (=> b!131063 (= lt!68199 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!131063 (= lt!68187 (addApplyDifferent!90 lt!68185 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68199))))

(assert (=> b!131063 (= (apply!114 (+!173 lt!68185 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68199) (apply!114 lt!68185 lt!68199))))

(declare-fun b!131064 () Bool)

(assert (=> b!131064 (= e!85490 (= (apply!114 lt!68179 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131065 () Bool)

(assert (=> b!131065 (= e!85487 (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!14323 () Bool)

(assert (=> bm!14323 (= call!14324 call!14323)))

(declare-fun bm!14324 () Bool)

(assert (=> bm!14324 (= call!14322 (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131066 () Bool)

(assert (=> b!131066 (= e!85485 (+!173 call!14321 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131067 () Bool)

(assert (=> b!131067 (= e!85485 e!85493)))

(assert (=> b!131067 (= c!24188 (and (not (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!39879 c!24193) b!131066))

(assert (= (and d!39879 (not c!24193)) b!131067))

(assert (= (and b!131067 c!24188) b!131061))

(assert (= (and b!131067 (not c!24188)) b!131052))

(assert (= (and b!131052 c!24192) b!131055))

(assert (= (and b!131052 (not c!24192)) b!131059))

(assert (= (or b!131055 b!131059) bm!14323))

(assert (= (or b!131061 bm!14323) bm!14321))

(assert (= (or b!131061 b!131055) bm!14319))

(assert (= (or b!131066 bm!14321) bm!14324))

(assert (= (or b!131066 bm!14319) bm!14322))

(assert (= (and d!39879 res!63162) b!131065))

(assert (= (and d!39879 c!24190) b!131063))

(assert (= (and d!39879 (not c!24190)) b!131051))

(assert (= (and d!39879 res!63155) b!131053))

(assert (= (and b!131053 res!63160) b!131050))

(assert (= (and b!131053 (not res!63156)) b!131056))

(assert (= (and b!131056 res!63163) b!131047))

(assert (= (and b!131053 res!63158) b!131060))

(assert (= (and b!131060 c!24189) b!131062))

(assert (= (and b!131060 (not c!24189)) b!131057))

(assert (= (and b!131062 res!63159) b!131064))

(assert (= (or b!131062 b!131057) bm!14318))

(assert (= (and b!131060 res!63157) b!131049))

(assert (= (and b!131049 c!24191) b!131048))

(assert (= (and b!131049 (not c!24191)) b!131058))

(assert (= (and b!131048 res!63161) b!131054))

(assert (= (or b!131048 b!131058) bm!14320))

(declare-fun b_lambda!5831 () Bool)

(assert (=> (not b_lambda!5831) (not b!131047)))

(assert (=> b!131047 t!6126))

(declare-fun b_and!8115 () Bool)

(assert (= b_and!8103 (and (=> t!6126 result!3935) b_and!8115)))

(assert (=> b!131047 t!6128))

(declare-fun b_and!8117 () Bool)

(assert (= b_and!8105 (and (=> t!6128 result!3939) b_and!8117)))

(assert (=> d!39879 m!154203))

(declare-fun m!154345 () Bool)

(assert (=> b!131063 m!154345))

(declare-fun m!154347 () Bool)

(assert (=> b!131063 m!154347))

(declare-fun m!154349 () Bool)

(assert (=> b!131063 m!154349))

(assert (=> b!131063 m!154347))

(declare-fun m!154351 () Bool)

(assert (=> b!131063 m!154351))

(declare-fun m!154353 () Bool)

(assert (=> b!131063 m!154353))

(declare-fun m!154355 () Bool)

(assert (=> b!131063 m!154355))

(declare-fun m!154357 () Bool)

(assert (=> b!131063 m!154357))

(declare-fun m!154359 () Bool)

(assert (=> b!131063 m!154359))

(declare-fun m!154361 () Bool)

(assert (=> b!131063 m!154361))

(declare-fun m!154363 () Bool)

(assert (=> b!131063 m!154363))

(assert (=> b!131063 m!154353))

(declare-fun m!154365 () Bool)

(assert (=> b!131063 m!154365))

(declare-fun m!154367 () Bool)

(assert (=> b!131063 m!154367))

(assert (=> b!131063 m!154363))

(declare-fun m!154369 () Bool)

(assert (=> b!131063 m!154369))

(declare-fun m!154371 () Bool)

(assert (=> b!131063 m!154371))

(declare-fun m!154373 () Bool)

(assert (=> b!131063 m!154373))

(declare-fun m!154375 () Bool)

(assert (=> b!131063 m!154375))

(assert (=> b!131063 m!154365))

(declare-fun m!154377 () Bool)

(assert (=> b!131063 m!154377))

(assert (=> b!131056 m!154375))

(assert (=> b!131056 m!154375))

(declare-fun m!154379 () Bool)

(assert (=> b!131056 m!154379))

(declare-fun m!154381 () Bool)

(assert (=> bm!14320 m!154381))

(declare-fun m!154383 () Bool)

(assert (=> bm!14322 m!154383))

(declare-fun m!154385 () Bool)

(assert (=> bm!14318 m!154385))

(assert (=> b!131047 m!154209))

(declare-fun m!154387 () Bool)

(assert (=> b!131047 m!154387))

(assert (=> b!131047 m!154209))

(declare-fun m!154389 () Bool)

(assert (=> b!131047 m!154389))

(assert (=> b!131047 m!154375))

(assert (=> b!131047 m!154387))

(assert (=> b!131047 m!154375))

(declare-fun m!154391 () Bool)

(assert (=> b!131047 m!154391))

(assert (=> bm!14324 m!154373))

(assert (=> b!131050 m!154375))

(assert (=> b!131050 m!154375))

(declare-fun m!154393 () Bool)

(assert (=> b!131050 m!154393))

(declare-fun m!154395 () Bool)

(assert (=> b!131054 m!154395))

(declare-fun m!154397 () Bool)

(assert (=> b!131066 m!154397))

(assert (=> b!131065 m!154375))

(assert (=> b!131065 m!154375))

(assert (=> b!131065 m!154393))

(declare-fun m!154399 () Bool)

(assert (=> b!131064 m!154399))

(assert (=> b!130774 d!39879))

(declare-fun d!39881 () Bool)

(assert (=> d!39881 (= (validMask!0 (mask!7131 (v!3177 (underlying!450 thiss!992)))) (and (or (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000001111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000011111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000001111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000011111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000001111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000011111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000001111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000011111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000000111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000001111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000011111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000000111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000001111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000011111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000000111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000001111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000011111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000000111111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000001111111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000011111111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00000111111111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00001111111111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00011111111111111111111111111111) (= (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7131 (v!3177 (underlying!450 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!130788 d!39881))

(declare-fun d!39883 () Bool)

(assert (=> d!39883 (= (valid!517 thiss!992) (valid!516 (v!3177 (underlying!450 thiss!992))))))

(declare-fun bs!5435 () Bool)

(assert (= bs!5435 d!39883))

(declare-fun m!154401 () Bool)

(assert (=> bs!5435 m!154401))

(assert (=> start!14098 d!39883))

(declare-fun b!131074 () Bool)

(declare-fun e!85498 () Bool)

(assert (=> b!131074 (= e!85498 tp_is_empty!2865)))

(declare-fun mapIsEmpty!4605 () Bool)

(declare-fun mapRes!4605 () Bool)

(assert (=> mapIsEmpty!4605 mapRes!4605))

(declare-fun b!131075 () Bool)

(declare-fun e!85499 () Bool)

(assert (=> b!131075 (= e!85499 tp_is_empty!2865)))

(declare-fun condMapEmpty!4605 () Bool)

(declare-fun mapDefault!4605 () ValueCell!1089)

(assert (=> mapNonEmpty!4596 (= condMapEmpty!4605 (= mapRest!4596 ((as const (Array (_ BitVec 32) ValueCell!1089)) mapDefault!4605)))))

(assert (=> mapNonEmpty!4596 (= tp!11124 (and e!85499 mapRes!4605))))

(declare-fun mapNonEmpty!4605 () Bool)

(declare-fun tp!11139 () Bool)

(assert (=> mapNonEmpty!4605 (= mapRes!4605 (and tp!11139 e!85498))))

(declare-fun mapValue!4605 () ValueCell!1089)

(declare-fun mapKey!4605 () (_ BitVec 32))

(declare-fun mapRest!4605 () (Array (_ BitVec 32) ValueCell!1089))

(assert (=> mapNonEmpty!4605 (= mapRest!4596 (store mapRest!4605 mapKey!4605 mapValue!4605))))

(assert (= (and mapNonEmpty!4596 condMapEmpty!4605) mapIsEmpty!4605))

(assert (= (and mapNonEmpty!4596 (not condMapEmpty!4605)) mapNonEmpty!4605))

(assert (= (and mapNonEmpty!4605 ((_ is ValueCellFull!1089) mapValue!4605)) b!131074))

(assert (= (and mapNonEmpty!4596 ((_ is ValueCellFull!1089) mapDefault!4605)) b!131075))

(declare-fun m!154403 () Bool)

(assert (=> mapNonEmpty!4605 m!154403))

(declare-fun b!131076 () Bool)

(declare-fun e!85500 () Bool)

(assert (=> b!131076 (= e!85500 tp_is_empty!2865)))

(declare-fun mapIsEmpty!4606 () Bool)

(declare-fun mapRes!4606 () Bool)

(assert (=> mapIsEmpty!4606 mapRes!4606))

(declare-fun b!131077 () Bool)

(declare-fun e!85501 () Bool)

(assert (=> b!131077 (= e!85501 tp_is_empty!2865)))

(declare-fun condMapEmpty!4606 () Bool)

(declare-fun mapDefault!4606 () ValueCell!1089)

(assert (=> mapNonEmpty!4595 (= condMapEmpty!4606 (= mapRest!4595 ((as const (Array (_ BitVec 32) ValueCell!1089)) mapDefault!4606)))))

(assert (=> mapNonEmpty!4595 (= tp!11122 (and e!85501 mapRes!4606))))

(declare-fun mapNonEmpty!4606 () Bool)

(declare-fun tp!11140 () Bool)

(assert (=> mapNonEmpty!4606 (= mapRes!4606 (and tp!11140 e!85500))))

(declare-fun mapKey!4606 () (_ BitVec 32))

(declare-fun mapValue!4606 () ValueCell!1089)

(declare-fun mapRest!4606 () (Array (_ BitVec 32) ValueCell!1089))

(assert (=> mapNonEmpty!4606 (= mapRest!4595 (store mapRest!4606 mapKey!4606 mapValue!4606))))

(assert (= (and mapNonEmpty!4595 condMapEmpty!4606) mapIsEmpty!4606))

(assert (= (and mapNonEmpty!4595 (not condMapEmpty!4606)) mapNonEmpty!4606))

(assert (= (and mapNonEmpty!4606 ((_ is ValueCellFull!1089) mapValue!4606)) b!131076))

(assert (= (and mapNonEmpty!4595 ((_ is ValueCellFull!1089) mapDefault!4606)) b!131077))

(declare-fun m!154405 () Bool)

(assert (=> mapNonEmpty!4606 m!154405))

(declare-fun b_lambda!5833 () Bool)

(assert (= b_lambda!5831 (or (and b!130775 b_free!2897) (and b!130789 b_free!2899 (= (defaultEntry!2843 newMap!16) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))))) b_lambda!5833)))

(check-sat (not b!131063) (not b!130967) (not b!130991) (not bm!14318) (not bm!14290) (not b!130949) (not bm!14292) (not bm!14320) (not d!39863) b_and!8117 (not bm!14286) (not b!131065) (not b!130977) (not bm!14282) (not mapNonEmpty!4605) (not bm!14295) (not b!131054) (not b!130856) (not b_next!2897) (not b!131050) (not bm!14284) tp_is_empty!2865 (not d!39859) (not bm!14285) (not b!131004) (not b!130964) (not b!131064) (not bm!14324) (not b!130864) (not b!130992) (not b_next!2899) (not bm!14298) (not d!39879) (not b!130983) (not bm!14288) (not bm!14322) (not b!130855) (not b_lambda!5833) (not b!131056) (not bm!14287) (not bm!14279) (not d!39883) (not d!39877) (not d!39861) (not mapNonEmpty!4606) (not b!130966) (not bm!14303) (not b_lambda!5829) (not bm!14299) (not b!130857) (not b!131047) (not b!130976) (not b!131066) (not b!130866) b_and!8115 (not b!131002))
(check-sat b_and!8115 b_and!8117 (not b_next!2897) (not b_next!2899))
(get-model)

(declare-fun d!39885 () Bool)

(assert (=> d!39885 (= (+!173 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) lt!68098 (zeroValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68202 () Unit!4097)

(declare-fun choose!799 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 V!3467 Int) Unit!4097)

(assert (=> d!39885 (= lt!68202 (choose!799 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) lt!68098 (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2843 newMap!16)))))

(assert (=> d!39885 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39885 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) lt!68098 (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2843 newMap!16)) lt!68202)))

(declare-fun bs!5436 () Bool)

(assert (= bs!5436 d!39885))

(assert (=> bs!5436 m!154211))

(declare-fun m!154407 () Bool)

(assert (=> bs!5436 m!154407))

(assert (=> bs!5436 m!154287))

(declare-fun m!154409 () Bool)

(assert (=> bs!5436 m!154409))

(assert (=> bs!5436 m!154211))

(declare-fun m!154411 () Bool)

(assert (=> bs!5436 m!154411))

(assert (=> bs!5436 m!154287))

(declare-fun m!154413 () Bool)

(assert (=> bs!5436 m!154413))

(assert (=> b!130964 d!39885))

(declare-fun d!39887 () Bool)

(declare-fun e!85503 () Bool)

(assert (=> d!39887 e!85503))

(declare-fun res!63164 () Bool)

(assert (=> d!39887 (=> res!63164 e!85503)))

(declare-fun lt!68203 () Bool)

(assert (=> d!39887 (= res!63164 (not lt!68203))))

(declare-fun lt!68206 () Bool)

(assert (=> d!39887 (= lt!68203 lt!68206)))

(declare-fun lt!68205 () Unit!4097)

(declare-fun e!85502 () Unit!4097)

(assert (=> d!39887 (= lt!68205 e!85502)))

(declare-fun c!24194 () Bool)

(assert (=> d!39887 (= c!24194 lt!68206)))

(assert (=> d!39887 (= lt!68206 (containsKey!174 (toList!865 lt!68179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39887 (= (contains!892 lt!68179 #b1000000000000000000000000000000000000000000000000000000000000000) lt!68203)))

(declare-fun b!131078 () Bool)

(declare-fun lt!68204 () Unit!4097)

(assert (=> b!131078 (= e!85502 lt!68204)))

(assert (=> b!131078 (= lt!68204 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 lt!68179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131078 (isDefined!123 (getValueByKey!170 (toList!865 lt!68179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131079 () Bool)

(declare-fun Unit!4103 () Unit!4097)

(assert (=> b!131079 (= e!85502 Unit!4103)))

(declare-fun b!131080 () Bool)

(assert (=> b!131080 (= e!85503 (isDefined!123 (getValueByKey!170 (toList!865 lt!68179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39887 c!24194) b!131078))

(assert (= (and d!39887 (not c!24194)) b!131079))

(assert (= (and d!39887 (not res!63164)) b!131080))

(declare-fun m!154415 () Bool)

(assert (=> d!39887 m!154415))

(declare-fun m!154417 () Bool)

(assert (=> b!131078 m!154417))

(declare-fun m!154419 () Bool)

(assert (=> b!131078 m!154419))

(assert (=> b!131078 m!154419))

(declare-fun m!154421 () Bool)

(assert (=> b!131078 m!154421))

(assert (=> b!131080 m!154419))

(assert (=> b!131080 m!154419))

(assert (=> b!131080 m!154421))

(assert (=> bm!14320 d!39887))

(declare-fun d!39889 () Bool)

(declare-fun e!85506 () Bool)

(assert (=> d!39889 e!85506))

(declare-fun res!63170 () Bool)

(assert (=> d!39889 (=> (not res!63170) (not e!85506))))

(declare-fun lt!68218 () ListLongMap!1699)

(assert (=> d!39889 (= res!63170 (contains!892 lt!68218 (_1!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!68215 () List!1710)

(assert (=> d!39889 (= lt!68218 (ListLongMap!1700 lt!68215))))

(declare-fun lt!68216 () Unit!4097)

(declare-fun lt!68217 () Unit!4097)

(assert (=> d!39889 (= lt!68216 lt!68217)))

(assert (=> d!39889 (= (getValueByKey!170 lt!68215 (_1!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!175 (_2!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!85 (List!1710 (_ BitVec 64) V!3467) Unit!4097)

(assert (=> d!39889 (= lt!68217 (lemmaContainsTupThenGetReturnValue!85 lt!68215 (_1!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!88 (List!1710 (_ BitVec 64) V!3467) List!1710)

(assert (=> d!39889 (= lt!68215 (insertStrictlySorted!88 (toList!865 e!85432) (_1!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39889 (= (+!173 e!85432 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!68218)))

(declare-fun b!131085 () Bool)

(declare-fun res!63169 () Bool)

(assert (=> b!131085 (=> (not res!63169) (not e!85506))))

(assert (=> b!131085 (= res!63169 (= (getValueByKey!170 (toList!865 lt!68218) (_1!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!175 (_2!1317 (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!131086 () Bool)

(declare-fun contains!893 (List!1710 tuple2!2612) Bool)

(assert (=> b!131086 (= e!85506 (contains!893 (toList!865 lt!68218) (ite c!24166 (ite c!24157 (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39889 res!63170) b!131085))

(assert (= (and b!131085 res!63169) b!131086))

(declare-fun m!154423 () Bool)

(assert (=> d!39889 m!154423))

(declare-fun m!154425 () Bool)

(assert (=> d!39889 m!154425))

(declare-fun m!154427 () Bool)

(assert (=> d!39889 m!154427))

(declare-fun m!154429 () Bool)

(assert (=> d!39889 m!154429))

(declare-fun m!154431 () Bool)

(assert (=> b!131085 m!154431))

(declare-fun m!154433 () Bool)

(assert (=> b!131086 m!154433))

(assert (=> bm!14279 d!39889))

(declare-fun b!131097 () Bool)

(declare-fun e!85516 () Bool)

(declare-fun call!14330 () Bool)

(assert (=> b!131097 (= e!85516 call!14330)))

(declare-fun d!39891 () Bool)

(declare-fun res!63178 () Bool)

(declare-fun e!85515 () Bool)

(assert (=> d!39891 (=> res!63178 e!85515)))

(assert (=> d!39891 (= res!63178 (bvsge #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(assert (=> d!39891 (= (arrayNoDuplicates!0 (_keys!4588 newMap!16) #b00000000000000000000000000000000 Nil!1709) e!85515)))

(declare-fun b!131098 () Bool)

(assert (=> b!131098 (= e!85516 call!14330)))

(declare-fun b!131099 () Bool)

(declare-fun e!85517 () Bool)

(assert (=> b!131099 (= e!85515 e!85517)))

(declare-fun res!63177 () Bool)

(assert (=> b!131099 (=> (not res!63177) (not e!85517))))

(declare-fun e!85518 () Bool)

(assert (=> b!131099 (= res!63177 (not e!85518))))

(declare-fun res!63179 () Bool)

(assert (=> b!131099 (=> (not res!63179) (not e!85518))))

(assert (=> b!131099 (= res!63179 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131100 () Bool)

(assert (=> b!131100 (= e!85517 e!85516)))

(declare-fun c!24197 () Bool)

(assert (=> b!131100 (= c!24197 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131101 () Bool)

(declare-fun contains!894 (List!1712 (_ BitVec 64)) Bool)

(assert (=> b!131101 (= e!85518 (contains!894 Nil!1709 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14327 () Bool)

(assert (=> bm!14327 (= call!14330 (arrayNoDuplicates!0 (_keys!4588 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24197 (Cons!1708 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000) Nil!1709) Nil!1709)))))

(assert (= (and d!39891 (not res!63178)) b!131099))

(assert (= (and b!131099 res!63179) b!131101))

(assert (= (and b!131099 res!63177) b!131100))

(assert (= (and b!131100 c!24197) b!131097))

(assert (= (and b!131100 (not c!24197)) b!131098))

(assert (= (or b!131097 b!131098) bm!14327))

(declare-fun m!154435 () Bool)

(assert (=> b!131099 m!154435))

(assert (=> b!131099 m!154435))

(declare-fun m!154437 () Bool)

(assert (=> b!131099 m!154437))

(assert (=> b!131100 m!154435))

(assert (=> b!131100 m!154435))

(assert (=> b!131100 m!154437))

(assert (=> b!131101 m!154435))

(assert (=> b!131101 m!154435))

(declare-fun m!154439 () Bool)

(assert (=> b!131101 m!154439))

(assert (=> bm!14327 m!154435))

(declare-fun m!154441 () Bool)

(assert (=> bm!14327 m!154441))

(assert (=> b!130857 d!39891))

(declare-fun b!131115 () Bool)

(declare-fun e!85527 () SeekEntryResult!273)

(declare-fun e!85525 () SeekEntryResult!273)

(assert (=> b!131115 (= e!85527 e!85525)))

(declare-fun lt!68225 () (_ BitVec 64))

(declare-fun lt!68227 () SeekEntryResult!273)

(assert (=> b!131115 (= lt!68225 (select (arr!2249 (_keys!4588 newMap!16)) (index!3252 lt!68227)))))

(declare-fun c!24204 () Bool)

(assert (=> b!131115 (= c!24204 (= lt!68225 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun e!85526 () SeekEntryResult!273)

(declare-fun b!131116 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4753 (_ BitVec 32)) SeekEntryResult!273)

(assert (=> b!131116 (= e!85526 (seekKeyOrZeroReturnVacant!0 (x!15412 lt!68227) (index!3252 lt!68227) (index!3252 lt!68227) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(declare-fun b!131117 () Bool)

(assert (=> b!131117 (= e!85525 (Found!273 (index!3252 lt!68227)))))

(declare-fun b!131118 () Bool)

(assert (=> b!131118 (= e!85526 (MissingZero!273 (index!3252 lt!68227)))))

(declare-fun b!131119 () Bool)

(assert (=> b!131119 (= e!85527 Undefined!273)))

(declare-fun d!39893 () Bool)

(declare-fun lt!68226 () SeekEntryResult!273)

(assert (=> d!39893 (and (or ((_ is Undefined!273) lt!68226) (not ((_ is Found!273) lt!68226)) (and (bvsge (index!3251 lt!68226) #b00000000000000000000000000000000) (bvslt (index!3251 lt!68226) (size!2516 (_keys!4588 newMap!16))))) (or ((_ is Undefined!273) lt!68226) ((_ is Found!273) lt!68226) (not ((_ is MissingZero!273) lt!68226)) (and (bvsge (index!3250 lt!68226) #b00000000000000000000000000000000) (bvslt (index!3250 lt!68226) (size!2516 (_keys!4588 newMap!16))))) (or ((_ is Undefined!273) lt!68226) ((_ is Found!273) lt!68226) ((_ is MissingZero!273) lt!68226) (not ((_ is MissingVacant!273) lt!68226)) (and (bvsge (index!3253 lt!68226) #b00000000000000000000000000000000) (bvslt (index!3253 lt!68226) (size!2516 (_keys!4588 newMap!16))))) (or ((_ is Undefined!273) lt!68226) (ite ((_ is Found!273) lt!68226) (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68226)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (ite ((_ is MissingZero!273) lt!68226) (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3250 lt!68226)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!273) lt!68226) (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3253 lt!68226)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39893 (= lt!68226 e!85527)))

(declare-fun c!24206 () Bool)

(assert (=> d!39893 (= c!24206 (and ((_ is Intermediate!273) lt!68227) (undefined!1085 lt!68227)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4753 (_ BitVec 32)) SeekEntryResult!273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!39893 (= lt!68227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (mask!7131 newMap!16)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(assert (=> d!39893 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39893 (= (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)) lt!68226)))

(declare-fun b!131114 () Bool)

(declare-fun c!24205 () Bool)

(assert (=> b!131114 (= c!24205 (= lt!68225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131114 (= e!85525 e!85526)))

(assert (= (and d!39893 c!24206) b!131119))

(assert (= (and d!39893 (not c!24206)) b!131115))

(assert (= (and b!131115 c!24204) b!131117))

(assert (= (and b!131115 (not c!24204)) b!131114))

(assert (= (and b!131114 c!24205) b!131118))

(assert (= (and b!131114 (not c!24205)) b!131116))

(declare-fun m!154443 () Bool)

(assert (=> b!131115 m!154443))

(assert (=> b!131116 m!154187))

(declare-fun m!154445 () Bool)

(assert (=> b!131116 m!154445))

(declare-fun m!154447 () Bool)

(assert (=> d!39893 m!154447))

(assert (=> d!39893 m!154187))

(declare-fun m!154449 () Bool)

(assert (=> d!39893 m!154449))

(assert (=> d!39893 m!154413))

(assert (=> d!39893 m!154187))

(assert (=> d!39893 m!154447))

(declare-fun m!154451 () Bool)

(assert (=> d!39893 m!154451))

(declare-fun m!154453 () Bool)

(assert (=> d!39893 m!154453))

(declare-fun m!154455 () Bool)

(assert (=> d!39893 m!154455))

(assert (=> bm!14292 d!39893))

(declare-fun b!131120 () Bool)

(declare-fun e!85531 () Bool)

(declare-fun lt!68229 () ListLongMap!1699)

(assert (=> b!131120 (= e!85531 (= (apply!114 lt!68229 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)) (get!1469 (select (arr!2250 (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121)) #b00000000000000000000000000000000) (dynLambda!422 (defaultEntry!2843 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2517 (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121))))))

(assert (=> b!131120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131121 () Bool)

(declare-fun e!85528 () Bool)

(declare-fun e!85530 () Bool)

(assert (=> b!131121 (= e!85528 e!85530)))

(declare-fun res!63186 () Bool)

(declare-fun call!14337 () Bool)

(assert (=> b!131121 (= res!63186 call!14337)))

(assert (=> b!131121 (=> (not res!63186) (not e!85530))))

(declare-fun bm!14328 () Bool)

(declare-fun call!14336 () Bool)

(assert (=> bm!14328 (= call!14336 (contains!892 lt!68229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!39895 () Bool)

(declare-fun e!85533 () Bool)

(assert (=> d!39895 e!85533))

(declare-fun res!63180 () Bool)

(assert (=> d!39895 (=> (not res!63180) (not e!85533))))

(assert (=> d!39895 (= res!63180 (or (bvsge #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))))

(declare-fun lt!68243 () ListLongMap!1699)

(assert (=> d!39895 (= lt!68229 lt!68243)))

(declare-fun lt!68242 () Unit!4097)

(declare-fun e!85529 () Unit!4097)

(assert (=> d!39895 (= lt!68242 e!85529)))

(declare-fun c!24209 () Bool)

(declare-fun e!85534 () Bool)

(assert (=> d!39895 (= c!24209 e!85534)))

(declare-fun res!63187 () Bool)

(assert (=> d!39895 (=> (not res!63187) (not e!85534))))

(assert (=> d!39895 (= res!63187 (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun e!85532 () ListLongMap!1699)

(assert (=> d!39895 (= lt!68243 e!85532)))

(declare-fun c!24212 () Bool)

(assert (=> d!39895 (= c!24212 (and (not (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39895 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39895 (= (getCurrentListMap!542 (_keys!4588 newMap!16) (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121) (mask!7131 newMap!16) (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) lt!68229)))

(declare-fun b!131122 () Bool)

(assert (=> b!131122 (= e!85533 e!85528)))

(declare-fun c!24210 () Bool)

(assert (=> b!131122 (= c!24210 (not (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131123 () Bool)

(declare-fun e!85536 () Bool)

(assert (=> b!131123 (= e!85536 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14329 () Bool)

(declare-fun call!14335 () ListLongMap!1699)

(declare-fun call!14331 () ListLongMap!1699)

(assert (=> bm!14329 (= call!14335 call!14331)))

(declare-fun b!131124 () Bool)

(declare-fun Unit!4104 () Unit!4097)

(assert (=> b!131124 (= e!85529 Unit!4104)))

(declare-fun c!24211 () Bool)

(declare-fun b!131125 () Bool)

(assert (=> b!131125 (= c!24211 (and (not (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85540 () ListLongMap!1699)

(declare-fun e!85539 () ListLongMap!1699)

(assert (=> b!131125 (= e!85540 e!85539)))

(declare-fun bm!14330 () Bool)

(assert (=> bm!14330 (= call!14337 (contains!892 lt!68229 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131126 () Bool)

(declare-fun res!63183 () Bool)

(assert (=> b!131126 (=> (not res!63183) (not e!85533))))

(declare-fun e!85535 () Bool)

(assert (=> b!131126 (= res!63183 e!85535)))

(declare-fun res!63181 () Bool)

(assert (=> b!131126 (=> res!63181 e!85535)))

(assert (=> b!131126 (= res!63181 (not e!85536))))

(declare-fun res!63185 () Bool)

(assert (=> b!131126 (=> (not res!63185) (not e!85536))))

(assert (=> b!131126 (= res!63185 (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131127 () Bool)

(assert (=> b!131127 (= e!85530 (= (apply!114 lt!68229 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16))))))

(declare-fun b!131128 () Bool)

(assert (=> b!131128 (= e!85539 call!14335)))

(declare-fun b!131129 () Bool)

(assert (=> b!131129 (= e!85535 e!85531)))

(declare-fun res!63188 () Bool)

(assert (=> b!131129 (=> (not res!63188) (not e!85531))))

(assert (=> b!131129 (= res!63188 (contains!892 lt!68229 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131130 () Bool)

(declare-fun e!85538 () Bool)

(assert (=> b!131130 (= e!85538 (not call!14336))))

(declare-fun b!131131 () Bool)

(assert (=> b!131131 (= e!85528 (not call!14337))))

(declare-fun b!131132 () Bool)

(declare-fun call!14334 () ListLongMap!1699)

(assert (=> b!131132 (= e!85539 call!14334)))

(declare-fun b!131133 () Bool)

(declare-fun res!63182 () Bool)

(assert (=> b!131133 (=> (not res!63182) (not e!85533))))

(assert (=> b!131133 (= res!63182 e!85538)))

(declare-fun c!24208 () Bool)

(assert (=> b!131133 (= c!24208 (not (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14331 () Bool)

(declare-fun call!14333 () ListLongMap!1699)

(declare-fun call!14332 () ListLongMap!1699)

(assert (=> bm!14331 (= call!14333 call!14332)))

(declare-fun b!131134 () Bool)

(assert (=> b!131134 (= e!85540 call!14335)))

(declare-fun c!24207 () Bool)

(declare-fun bm!14332 () Bool)

(assert (=> bm!14332 (= call!14331 (+!173 (ite c!24212 call!14332 (ite c!24207 call!14333 call!14334)) (ite (or c!24212 c!24207) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16))))))))

(declare-fun b!131135 () Bool)

(declare-fun e!85537 () Bool)

(assert (=> b!131135 (= e!85538 e!85537)))

(declare-fun res!63184 () Bool)

(assert (=> b!131135 (= res!63184 call!14336)))

(assert (=> b!131135 (=> (not res!63184) (not e!85537))))

(declare-fun b!131136 () Bool)

(declare-fun lt!68237 () Unit!4097)

(assert (=> b!131136 (= e!85529 lt!68237)))

(declare-fun lt!68240 () ListLongMap!1699)

(assert (=> b!131136 (= lt!68240 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121) (mask!7131 newMap!16) (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68234 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68247 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68247 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68241 () Unit!4097)

(assert (=> b!131136 (= lt!68241 (addStillContains!90 lt!68240 lt!68234 (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) lt!68247))))

(assert (=> b!131136 (contains!892 (+!173 lt!68240 (tuple2!2613 lt!68234 (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)))) lt!68247)))

(declare-fun lt!68230 () Unit!4097)

(assert (=> b!131136 (= lt!68230 lt!68241)))

(declare-fun lt!68228 () ListLongMap!1699)

(assert (=> b!131136 (= lt!68228 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121) (mask!7131 newMap!16) (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68244 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68244 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68233 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68233 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68231 () Unit!4097)

(assert (=> b!131136 (= lt!68231 (addApplyDifferent!90 lt!68228 lt!68244 (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) lt!68233))))

(assert (=> b!131136 (= (apply!114 (+!173 lt!68228 (tuple2!2613 lt!68244 (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)))) lt!68233) (apply!114 lt!68228 lt!68233))))

(declare-fun lt!68245 () Unit!4097)

(assert (=> b!131136 (= lt!68245 lt!68231)))

(declare-fun lt!68246 () ListLongMap!1699)

(assert (=> b!131136 (= lt!68246 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121) (mask!7131 newMap!16) (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68232 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68232 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68238 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68238 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68248 () Unit!4097)

(assert (=> b!131136 (= lt!68248 (addApplyDifferent!90 lt!68246 lt!68232 (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) lt!68238))))

(assert (=> b!131136 (= (apply!114 (+!173 lt!68246 (tuple2!2613 lt!68232 (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)))) lt!68238) (apply!114 lt!68246 lt!68238))))

(declare-fun lt!68236 () Unit!4097)

(assert (=> b!131136 (= lt!68236 lt!68248)))

(declare-fun lt!68235 () ListLongMap!1699)

(assert (=> b!131136 (= lt!68235 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121) (mask!7131 newMap!16) (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68239 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68239 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68249 () (_ BitVec 64))

(assert (=> b!131136 (= lt!68249 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131136 (= lt!68237 (addApplyDifferent!90 lt!68235 lt!68239 (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) lt!68249))))

(assert (=> b!131136 (= (apply!114 (+!173 lt!68235 (tuple2!2613 lt!68239 (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)))) lt!68249) (apply!114 lt!68235 lt!68249))))

(declare-fun b!131137 () Bool)

(assert (=> b!131137 (= e!85537 (= (apply!114 lt!68229 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16))))))

(declare-fun b!131138 () Bool)

(assert (=> b!131138 (= e!85534 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14333 () Bool)

(assert (=> bm!14333 (= call!14334 call!14333)))

(declare-fun bm!14334 () Bool)

(assert (=> bm!14334 (= call!14332 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite (or c!24166 c!24164) (_values!2826 newMap!16) lt!68121) (mask!7131 newMap!16) (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) (ite (and c!24166 c!24157) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2700 newMap!16)) (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun b!131139 () Bool)

(assert (=> b!131139 (= e!85532 (+!173 call!14331 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24166 (ite c!24157 (minValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2700 newMap!16)))))))

(declare-fun b!131140 () Bool)

(assert (=> b!131140 (= e!85532 e!85540)))

(assert (=> b!131140 (= c!24207 (and (not (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!24166 (ite c!24157 lt!68100 lt!68098) (extraKeys!2612 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!39895 c!24212) b!131139))

(assert (= (and d!39895 (not c!24212)) b!131140))

(assert (= (and b!131140 c!24207) b!131134))

(assert (= (and b!131140 (not c!24207)) b!131125))

(assert (= (and b!131125 c!24211) b!131128))

(assert (= (and b!131125 (not c!24211)) b!131132))

(assert (= (or b!131128 b!131132) bm!14333))

(assert (= (or b!131134 bm!14333) bm!14331))

(assert (= (or b!131134 b!131128) bm!14329))

(assert (= (or b!131139 bm!14331) bm!14334))

(assert (= (or b!131139 bm!14329) bm!14332))

(assert (= (and d!39895 res!63187) b!131138))

(assert (= (and d!39895 c!24209) b!131136))

(assert (= (and d!39895 (not c!24209)) b!131124))

(assert (= (and d!39895 res!63180) b!131126))

(assert (= (and b!131126 res!63185) b!131123))

(assert (= (and b!131126 (not res!63181)) b!131129))

(assert (= (and b!131129 res!63188) b!131120))

(assert (= (and b!131126 res!63183) b!131133))

(assert (= (and b!131133 c!24208) b!131135))

(assert (= (and b!131133 (not c!24208)) b!131130))

(assert (= (and b!131135 res!63184) b!131137))

(assert (= (or b!131135 b!131130) bm!14328))

(assert (= (and b!131133 res!63182) b!131122))

(assert (= (and b!131122 c!24210) b!131121))

(assert (= (and b!131122 (not c!24210)) b!131131))

(assert (= (and b!131121 res!63186) b!131127))

(assert (= (or b!131121 b!131131) bm!14330))

(declare-fun b_lambda!5835 () Bool)

(assert (=> (not b_lambda!5835) (not b!131120)))

(declare-fun t!6137 () Bool)

(declare-fun tb!2389 () Bool)

(assert (=> (and b!130775 (= (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) (defaultEntry!2843 newMap!16)) t!6137) tb!2389))

(declare-fun result!3949 () Bool)

(assert (=> tb!2389 (= result!3949 tp_is_empty!2865)))

(assert (=> b!131120 t!6137))

(declare-fun b_and!8119 () Bool)

(assert (= b_and!8115 (and (=> t!6137 result!3949) b_and!8119)))

(declare-fun t!6139 () Bool)

(declare-fun tb!2391 () Bool)

(assert (=> (and b!130789 (= (defaultEntry!2843 newMap!16) (defaultEntry!2843 newMap!16)) t!6139) tb!2391))

(declare-fun result!3951 () Bool)

(assert (= result!3951 result!3949))

(assert (=> b!131120 t!6139))

(declare-fun b_and!8121 () Bool)

(assert (= b_and!8117 (and (=> t!6139 result!3951) b_and!8121)))

(assert (=> d!39895 m!154413))

(declare-fun m!154457 () Bool)

(assert (=> b!131136 m!154457))

(declare-fun m!154459 () Bool)

(assert (=> b!131136 m!154459))

(declare-fun m!154461 () Bool)

(assert (=> b!131136 m!154461))

(assert (=> b!131136 m!154459))

(declare-fun m!154463 () Bool)

(assert (=> b!131136 m!154463))

(declare-fun m!154465 () Bool)

(assert (=> b!131136 m!154465))

(declare-fun m!154467 () Bool)

(assert (=> b!131136 m!154467))

(declare-fun m!154469 () Bool)

(assert (=> b!131136 m!154469))

(declare-fun m!154471 () Bool)

(assert (=> b!131136 m!154471))

(declare-fun m!154473 () Bool)

(assert (=> b!131136 m!154473))

(declare-fun m!154475 () Bool)

(assert (=> b!131136 m!154475))

(assert (=> b!131136 m!154465))

(declare-fun m!154477 () Bool)

(assert (=> b!131136 m!154477))

(declare-fun m!154479 () Bool)

(assert (=> b!131136 m!154479))

(assert (=> b!131136 m!154475))

(declare-fun m!154481 () Bool)

(assert (=> b!131136 m!154481))

(declare-fun m!154483 () Bool)

(assert (=> b!131136 m!154483))

(declare-fun m!154485 () Bool)

(assert (=> b!131136 m!154485))

(assert (=> b!131136 m!154435))

(assert (=> b!131136 m!154477))

(declare-fun m!154487 () Bool)

(assert (=> b!131136 m!154487))

(assert (=> b!131129 m!154435))

(assert (=> b!131129 m!154435))

(declare-fun m!154489 () Bool)

(assert (=> b!131129 m!154489))

(declare-fun m!154491 () Bool)

(assert (=> bm!14330 m!154491))

(declare-fun m!154493 () Bool)

(assert (=> bm!14332 m!154493))

(declare-fun m!154495 () Bool)

(assert (=> bm!14328 m!154495))

(declare-fun m!154497 () Bool)

(assert (=> b!131120 m!154497))

(declare-fun m!154499 () Bool)

(assert (=> b!131120 m!154499))

(assert (=> b!131120 m!154497))

(declare-fun m!154501 () Bool)

(assert (=> b!131120 m!154501))

(assert (=> b!131120 m!154435))

(assert (=> b!131120 m!154499))

(assert (=> b!131120 m!154435))

(declare-fun m!154503 () Bool)

(assert (=> b!131120 m!154503))

(assert (=> bm!14334 m!154485))

(assert (=> b!131123 m!154435))

(assert (=> b!131123 m!154435))

(assert (=> b!131123 m!154437))

(declare-fun m!154505 () Bool)

(assert (=> b!131127 m!154505))

(declare-fun m!154507 () Bool)

(assert (=> b!131139 m!154507))

(assert (=> b!131138 m!154435))

(assert (=> b!131138 m!154435))

(assert (=> b!131138 m!154437))

(declare-fun m!154509 () Bool)

(assert (=> b!131137 m!154509))

(assert (=> bm!14285 d!39895))

(declare-fun b!131141 () Bool)

(declare-fun e!85542 () Bool)

(declare-fun call!14338 () Bool)

(assert (=> b!131141 (= e!85542 call!14338)))

(declare-fun b!131142 () Bool)

(declare-fun e!85543 () Bool)

(assert (=> b!131142 (= e!85543 e!85542)))

(declare-fun c!24213 () Bool)

(assert (=> b!131142 (= c!24213 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39897 () Bool)

(declare-fun res!63189 () Bool)

(assert (=> d!39897 (=> res!63189 e!85543)))

(assert (=> d!39897 (= res!63189 (bvsge #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(assert (=> d!39897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4588 newMap!16) (mask!7131 newMap!16)) e!85543)))

(declare-fun b!131143 () Bool)

(declare-fun e!85541 () Bool)

(assert (=> b!131143 (= e!85541 call!14338)))

(declare-fun bm!14335 () Bool)

(assert (=> bm!14335 (= call!14338 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(declare-fun b!131144 () Bool)

(assert (=> b!131144 (= e!85542 e!85541)))

(declare-fun lt!68252 () (_ BitVec 64))

(assert (=> b!131144 (= lt!68252 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68250 () Unit!4097)

(assert (=> b!131144 (= lt!68250 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4588 newMap!16) lt!68252 #b00000000000000000000000000000000))))

(assert (=> b!131144 (arrayContainsKey!0 (_keys!4588 newMap!16) lt!68252 #b00000000000000000000000000000000)))

(declare-fun lt!68251 () Unit!4097)

(assert (=> b!131144 (= lt!68251 lt!68250)))

(declare-fun res!63190 () Bool)

(assert (=> b!131144 (= res!63190 (= (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000) (_keys!4588 newMap!16) (mask!7131 newMap!16)) (Found!273 #b00000000000000000000000000000000)))))

(assert (=> b!131144 (=> (not res!63190) (not e!85541))))

(assert (= (and d!39897 (not res!63189)) b!131142))

(assert (= (and b!131142 c!24213) b!131144))

(assert (= (and b!131142 (not c!24213)) b!131141))

(assert (= (and b!131144 res!63190) b!131143))

(assert (= (or b!131143 b!131141) bm!14335))

(assert (=> b!131142 m!154435))

(assert (=> b!131142 m!154435))

(assert (=> b!131142 m!154437))

(declare-fun m!154511 () Bool)

(assert (=> bm!14335 m!154511))

(assert (=> b!131144 m!154435))

(declare-fun m!154513 () Bool)

(assert (=> b!131144 m!154513))

(declare-fun m!154515 () Bool)

(assert (=> b!131144 m!154515))

(assert (=> b!131144 m!154435))

(declare-fun m!154517 () Bool)

(assert (=> b!131144 m!154517))

(assert (=> b!130856 d!39897))

(declare-fun b!131153 () Bool)

(declare-fun e!85548 () (_ BitVec 32))

(declare-fun call!14341 () (_ BitVec 32))

(assert (=> b!131153 (= e!85548 (bvadd #b00000000000000000000000000000001 call!14341))))

(declare-fun b!131154 () Bool)

(assert (=> b!131154 (= e!85548 call!14341)))

(declare-fun b!131155 () Bool)

(declare-fun e!85549 () (_ BitVec 32))

(assert (=> b!131155 (= e!85549 #b00000000000000000000000000000000)))

(declare-fun bm!14338 () Bool)

(assert (=> bm!14338 (= call!14341 (arrayCountValidKeys!0 (_keys!4588 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131156 () Bool)

(assert (=> b!131156 (= e!85549 e!85548)))

(declare-fun c!24219 () Bool)

(assert (=> b!131156 (= c!24219 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39899 () Bool)

(declare-fun lt!68255 () (_ BitVec 32))

(assert (=> d!39899 (and (bvsge lt!68255 #b00000000000000000000000000000000) (bvsle lt!68255 (bvsub (size!2516 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39899 (= lt!68255 e!85549)))

(declare-fun c!24218 () Bool)

(assert (=> d!39899 (= c!24218 (bvsge #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(assert (=> d!39899 (and (bvsle #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2516 (_keys!4588 newMap!16)) (size!2516 (_keys!4588 newMap!16))))))

(assert (=> d!39899 (= (arrayCountValidKeys!0 (_keys!4588 newMap!16) #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) lt!68255)))

(assert (= (and d!39899 c!24218) b!131155))

(assert (= (and d!39899 (not c!24218)) b!131156))

(assert (= (and b!131156 c!24219) b!131153))

(assert (= (and b!131156 (not c!24219)) b!131154))

(assert (= (or b!131153 b!131154) bm!14338))

(declare-fun m!154519 () Bool)

(assert (=> bm!14338 m!154519))

(assert (=> b!131156 m!154435))

(assert (=> b!131156 m!154435))

(assert (=> b!131156 m!154437))

(assert (=> b!130855 d!39899))

(declare-fun d!39901 () Bool)

(declare-fun e!85550 () Bool)

(assert (=> d!39901 e!85550))

(declare-fun res!63192 () Bool)

(assert (=> d!39901 (=> (not res!63192) (not e!85550))))

(declare-fun lt!68259 () ListLongMap!1699)

(assert (=> d!39901 (= res!63192 (contains!892 lt!68259 (_1!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(declare-fun lt!68256 () List!1710)

(assert (=> d!39901 (= lt!68259 (ListLongMap!1700 lt!68256))))

(declare-fun lt!68257 () Unit!4097)

(declare-fun lt!68258 () Unit!4097)

(assert (=> d!39901 (= lt!68257 lt!68258)))

(assert (=> d!39901 (= (getValueByKey!170 lt!68256 (_1!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39901 (= lt!68258 (lemmaContainsTupThenGetReturnValue!85 lt!68256 (_1!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39901 (= lt!68256 (insertStrictlySorted!88 (toList!865 call!14321) (_1!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39901 (= (+!173 call!14321 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68259)))

(declare-fun b!131157 () Bool)

(declare-fun res!63191 () Bool)

(assert (=> b!131157 (=> (not res!63191) (not e!85550))))

(assert (=> b!131157 (= res!63191 (= (getValueByKey!170 (toList!865 lt!68259) (_1!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(declare-fun b!131158 () Bool)

(assert (=> b!131158 (= e!85550 (contains!893 (toList!865 lt!68259) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))

(assert (= (and d!39901 res!63192) b!131157))

(assert (= (and b!131157 res!63191) b!131158))

(declare-fun m!154521 () Bool)

(assert (=> d!39901 m!154521))

(declare-fun m!154523 () Bool)

(assert (=> d!39901 m!154523))

(declare-fun m!154525 () Bool)

(assert (=> d!39901 m!154525))

(declare-fun m!154527 () Bool)

(assert (=> d!39901 m!154527))

(declare-fun m!154529 () Bool)

(assert (=> b!131157 m!154529))

(declare-fun m!154531 () Bool)

(assert (=> b!131158 m!154531))

(assert (=> b!131066 d!39901))

(declare-fun c!24225 () Bool)

(declare-fun call!14347 () Bool)

(declare-fun bm!14343 () Bool)

(declare-fun lt!68265 () SeekEntryResult!273)

(assert (=> bm!14343 (= call!14347 (inRange!0 (ite c!24225 (index!3250 lt!68265) (index!3253 lt!68265)) (mask!7131 newMap!16)))))

(declare-fun b!131175 () Bool)

(declare-fun res!63202 () Bool)

(declare-fun e!85560 () Bool)

(assert (=> b!131175 (=> (not res!63202) (not e!85560))))

(assert (=> b!131175 (= res!63202 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3253 lt!68265)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131175 (and (bvsge (index!3253 lt!68265) #b00000000000000000000000000000000) (bvslt (index!3253 lt!68265) (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131176 () Bool)

(declare-fun e!85559 () Bool)

(assert (=> b!131176 (= e!85559 ((_ is Undefined!273) lt!68265))))

(declare-fun d!39903 () Bool)

(declare-fun e!85561 () Bool)

(assert (=> d!39903 e!85561))

(assert (=> d!39903 (= c!24225 ((_ is MissingZero!273) lt!68265))))

(assert (=> d!39903 (= lt!68265 (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(declare-fun lt!68264 () Unit!4097)

(declare-fun choose!800 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 64) Int) Unit!4097)

(assert (=> d!39903 (= lt!68264 (choose!800 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)))))

(assert (=> d!39903 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39903 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)) lt!68264)))

(declare-fun b!131177 () Bool)

(assert (=> b!131177 (and (bvsge (index!3250 lt!68265) #b00000000000000000000000000000000) (bvslt (index!3250 lt!68265) (size!2516 (_keys!4588 newMap!16))))))

(declare-fun res!63201 () Bool)

(assert (=> b!131177 (= res!63201 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3250 lt!68265)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85562 () Bool)

(assert (=> b!131177 (=> (not res!63201) (not e!85562))))

(declare-fun b!131178 () Bool)

(assert (=> b!131178 (= e!85561 e!85559)))

(declare-fun c!24224 () Bool)

(assert (=> b!131178 (= c!24224 ((_ is MissingVacant!273) lt!68265))))

(declare-fun call!14346 () Bool)

(declare-fun bm!14344 () Bool)

(assert (=> bm!14344 (= call!14346 (arrayContainsKey!0 (_keys!4588 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131179 () Bool)

(declare-fun res!63204 () Bool)

(assert (=> b!131179 (=> (not res!63204) (not e!85560))))

(assert (=> b!131179 (= res!63204 call!14347)))

(assert (=> b!131179 (= e!85559 e!85560)))

(declare-fun b!131180 () Bool)

(assert (=> b!131180 (= e!85562 (not call!14346))))

(declare-fun b!131181 () Bool)

(assert (=> b!131181 (= e!85560 (not call!14346))))

(declare-fun b!131182 () Bool)

(assert (=> b!131182 (= e!85561 e!85562)))

(declare-fun res!63203 () Bool)

(assert (=> b!131182 (= res!63203 call!14347)))

(assert (=> b!131182 (=> (not res!63203) (not e!85562))))

(assert (= (and d!39903 c!24225) b!131182))

(assert (= (and d!39903 (not c!24225)) b!131178))

(assert (= (and b!131182 res!63203) b!131177))

(assert (= (and b!131177 res!63201) b!131180))

(assert (= (and b!131178 c!24224) b!131179))

(assert (= (and b!131178 (not c!24224)) b!131176))

(assert (= (and b!131179 res!63204) b!131175))

(assert (= (and b!131175 res!63202) b!131181))

(assert (= (or b!131182 b!131179) bm!14343))

(assert (= (or b!131180 b!131181) bm!14344))

(declare-fun m!154533 () Bool)

(assert (=> b!131175 m!154533))

(assert (=> bm!14344 m!154187))

(assert (=> bm!14344 m!154273))

(declare-fun m!154535 () Bool)

(assert (=> bm!14343 m!154535))

(declare-fun m!154537 () Bool)

(assert (=> b!131177 m!154537))

(assert (=> d!39903 m!154187))

(assert (=> d!39903 m!154305))

(assert (=> d!39903 m!154187))

(declare-fun m!154539 () Bool)

(assert (=> d!39903 m!154539))

(assert (=> d!39903 m!154413))

(assert (=> bm!14290 d!39903))

(declare-fun b!131191 () Bool)

(declare-fun res!63214 () Bool)

(declare-fun e!85565 () Bool)

(assert (=> b!131191 (=> (not res!63214) (not e!85565))))

(assert (=> b!131191 (= res!63214 (and (= (size!2517 (_values!2826 newMap!16)) (bvadd (mask!7131 newMap!16) #b00000000000000000000000000000001)) (= (size!2516 (_keys!4588 newMap!16)) (size!2517 (_values!2826 newMap!16))) (bvsge (_size!592 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!592 newMap!16) (bvadd (mask!7131 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!131193 () Bool)

(declare-fun res!63213 () Bool)

(assert (=> b!131193 (=> (not res!63213) (not e!85565))))

(declare-fun size!2520 (LongMapFixedSize!1086) (_ BitVec 32))

(assert (=> b!131193 (= res!63213 (= (size!2520 newMap!16) (bvadd (_size!592 newMap!16) (bvsdiv (bvadd (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!131192 () Bool)

(declare-fun res!63215 () Bool)

(assert (=> b!131192 (=> (not res!63215) (not e!85565))))

(assert (=> b!131192 (= res!63215 (bvsge (size!2520 newMap!16) (_size!592 newMap!16)))))

(declare-fun d!39905 () Bool)

(declare-fun res!63216 () Bool)

(assert (=> d!39905 (=> (not res!63216) (not e!85565))))

(assert (=> d!39905 (= res!63216 (validMask!0 (mask!7131 newMap!16)))))

(assert (=> d!39905 (= (simpleValid!90 newMap!16) e!85565)))

(declare-fun b!131194 () Bool)

(assert (=> b!131194 (= e!85565 (and (bvsge (extraKeys!2612 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2612 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!592 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!39905 res!63216) b!131191))

(assert (= (and b!131191 res!63214) b!131192))

(assert (= (and b!131192 res!63215) b!131193))

(assert (= (and b!131193 res!63213) b!131194))

(declare-fun m!154541 () Bool)

(assert (=> b!131193 m!154541))

(assert (=> b!131192 m!154541))

(assert (=> d!39905 m!154413))

(assert (=> d!39859 d!39905))

(declare-fun d!39907 () Bool)

(assert (=> d!39907 (= (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131050 d!39907))

(declare-fun b!131219 () Bool)

(declare-fun res!63228 () Bool)

(declare-fun e!85584 () Bool)

(assert (=> b!131219 (=> (not res!63228) (not e!85584))))

(declare-fun lt!68284 () ListLongMap!1699)

(assert (=> b!131219 (= res!63228 (not (contains!892 lt!68284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131220 () Bool)

(assert (=> b!131220 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(assert (=> b!131220 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2517 (_values!2826 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun e!85580 () Bool)

(assert (=> b!131220 (= e!85580 (= (apply!114 lt!68284 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!39909 () Bool)

(assert (=> d!39909 e!85584))

(declare-fun res!63227 () Bool)

(assert (=> d!39909 (=> (not res!63227) (not e!85584))))

(assert (=> d!39909 (= res!63227 (not (contains!892 lt!68284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!85586 () ListLongMap!1699)

(assert (=> d!39909 (= lt!68284 e!85586)))

(declare-fun c!24236 () Bool)

(assert (=> d!39909 (= c!24236 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(assert (=> d!39909 (validMask!0 (mask!7131 (v!3177 (underlying!450 thiss!992))))))

(assert (=> d!39909 (= (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))) lt!68284)))

(declare-fun b!131221 () Bool)

(declare-fun e!85581 () Bool)

(assert (=> b!131221 (= e!85584 e!85581)))

(declare-fun c!24235 () Bool)

(declare-fun e!85582 () Bool)

(assert (=> b!131221 (= c!24235 e!85582)))

(declare-fun res!63226 () Bool)

(assert (=> b!131221 (=> (not res!63226) (not e!85582))))

(assert (=> b!131221 (= res!63226 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131222 () Bool)

(assert (=> b!131222 (= e!85586 (ListLongMap!1700 Nil!1707))))

(declare-fun b!131223 () Bool)

(assert (=> b!131223 (= e!85582 (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131223 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun e!85583 () Bool)

(declare-fun b!131224 () Bool)

(assert (=> b!131224 (= e!85583 (= lt!68284 (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131225 () Bool)

(declare-fun isEmpty!405 (ListLongMap!1699) Bool)

(assert (=> b!131225 (= e!85583 (isEmpty!405 lt!68284))))

(declare-fun b!131226 () Bool)

(assert (=> b!131226 (= e!85581 e!85583)))

(declare-fun c!24234 () Bool)

(assert (=> b!131226 (= c!24234 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131227 () Bool)

(declare-fun e!85585 () ListLongMap!1699)

(declare-fun call!14350 () ListLongMap!1699)

(assert (=> b!131227 (= e!85585 call!14350)))

(declare-fun b!131228 () Bool)

(assert (=> b!131228 (= e!85586 e!85585)))

(declare-fun c!24237 () Bool)

(assert (=> b!131228 (= c!24237 (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131229 () Bool)

(assert (=> b!131229 (= e!85581 e!85580)))

(assert (=> b!131229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun res!63225 () Bool)

(assert (=> b!131229 (= res!63225 (contains!892 lt!68284 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131229 (=> (not res!63225) (not e!85580))))

(declare-fun b!131230 () Bool)

(declare-fun lt!68281 () Unit!4097)

(declare-fun lt!68283 () Unit!4097)

(assert (=> b!131230 (= lt!68281 lt!68283)))

(declare-fun lt!68285 () (_ BitVec 64))

(declare-fun lt!68282 () ListLongMap!1699)

(declare-fun lt!68286 () (_ BitVec 64))

(declare-fun lt!68280 () V!3467)

(assert (=> b!131230 (not (contains!892 (+!173 lt!68282 (tuple2!2613 lt!68286 lt!68280)) lt!68285))))

(declare-fun addStillNotContains!59 (ListLongMap!1699 (_ BitVec 64) V!3467 (_ BitVec 64)) Unit!4097)

(assert (=> b!131230 (= lt!68283 (addStillNotContains!59 lt!68282 lt!68286 lt!68280 lt!68285))))

(assert (=> b!131230 (= lt!68285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!131230 (= lt!68280 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131230 (= lt!68286 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!131230 (= lt!68282 call!14350)))

(assert (=> b!131230 (= e!85585 (+!173 call!14350 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!14347 () Bool)

(assert (=> bm!14347 (= call!14350 (getCurrentListMapNoExtraKeys!139 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (_values!2826 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992))) (extraKeys!2612 (v!3177 (underlying!450 thiss!992))) (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) (minValue!2700 (v!3177 (underlying!450 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992)))))))

(assert (= (and d!39909 c!24236) b!131222))

(assert (= (and d!39909 (not c!24236)) b!131228))

(assert (= (and b!131228 c!24237) b!131230))

(assert (= (and b!131228 (not c!24237)) b!131227))

(assert (= (or b!131230 b!131227) bm!14347))

(assert (= (and d!39909 res!63227) b!131219))

(assert (= (and b!131219 res!63228) b!131221))

(assert (= (and b!131221 res!63226) b!131223))

(assert (= (and b!131221 c!24235) b!131229))

(assert (= (and b!131221 (not c!24235)) b!131226))

(assert (= (and b!131229 res!63225) b!131220))

(assert (= (and b!131226 c!24234) b!131224))

(assert (= (and b!131226 (not c!24234)) b!131225))

(declare-fun b_lambda!5837 () Bool)

(assert (=> (not b_lambda!5837) (not b!131220)))

(assert (=> b!131220 t!6126))

(declare-fun b_and!8123 () Bool)

(assert (= b_and!8119 (and (=> t!6126 result!3935) b_and!8123)))

(assert (=> b!131220 t!6128))

(declare-fun b_and!8125 () Bool)

(assert (= b_and!8121 (and (=> t!6128 result!3939) b_and!8125)))

(declare-fun b_lambda!5839 () Bool)

(assert (=> (not b_lambda!5839) (not b!131230)))

(assert (=> b!131230 t!6126))

(declare-fun b_and!8127 () Bool)

(assert (= b_and!8123 (and (=> t!6126 result!3935) b_and!8127)))

(assert (=> b!131230 t!6128))

(declare-fun b_and!8129 () Bool)

(assert (= b_and!8125 (and (=> t!6128 result!3939) b_and!8129)))

(declare-fun m!154543 () Bool)

(assert (=> d!39909 m!154543))

(assert (=> d!39909 m!154203))

(assert (=> b!131228 m!154375))

(assert (=> b!131228 m!154375))

(assert (=> b!131228 m!154393))

(declare-fun m!154545 () Bool)

(assert (=> b!131225 m!154545))

(declare-fun m!154547 () Bool)

(assert (=> b!131219 m!154547))

(assert (=> b!131223 m!154375))

(assert (=> b!131223 m!154375))

(assert (=> b!131223 m!154393))

(assert (=> b!131220 m!154387))

(assert (=> b!131220 m!154375))

(declare-fun m!154549 () Bool)

(assert (=> b!131220 m!154549))

(assert (=> b!131220 m!154209))

(assert (=> b!131220 m!154387))

(assert (=> b!131220 m!154209))

(assert (=> b!131220 m!154389))

(assert (=> b!131220 m!154375))

(assert (=> b!131230 m!154387))

(declare-fun m!154551 () Bool)

(assert (=> b!131230 m!154551))

(declare-fun m!154553 () Bool)

(assert (=> b!131230 m!154553))

(declare-fun m!154555 () Bool)

(assert (=> b!131230 m!154555))

(assert (=> b!131230 m!154387))

(assert (=> b!131230 m!154209))

(assert (=> b!131230 m!154389))

(assert (=> b!131230 m!154551))

(assert (=> b!131230 m!154375))

(assert (=> b!131230 m!154209))

(declare-fun m!154557 () Bool)

(assert (=> b!131230 m!154557))

(declare-fun m!154559 () Bool)

(assert (=> b!131224 m!154559))

(assert (=> bm!14347 m!154559))

(assert (=> b!131229 m!154375))

(assert (=> b!131229 m!154375))

(declare-fun m!154561 () Bool)

(assert (=> b!131229 m!154561))

(assert (=> bm!14324 d!39909))

(declare-fun b!131231 () Bool)

(declare-fun e!85590 () Bool)

(declare-fun lt!68288 () ListLongMap!1699)

(assert (=> b!131231 (= e!85590 (= (apply!114 lt!68288 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)) (get!1469 (select (arr!2250 (_values!2826 newMap!16)) #b00000000000000000000000000000000) (dynLambda!422 (defaultEntry!2843 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2517 (_values!2826 newMap!16))))))

(assert (=> b!131231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131232 () Bool)

(declare-fun e!85587 () Bool)

(declare-fun e!85589 () Bool)

(assert (=> b!131232 (= e!85587 e!85589)))

(declare-fun res!63235 () Bool)

(declare-fun call!14357 () Bool)

(assert (=> b!131232 (= res!63235 call!14357)))

(assert (=> b!131232 (=> (not res!63235) (not e!85589))))

(declare-fun bm!14348 () Bool)

(declare-fun call!14356 () Bool)

(assert (=> bm!14348 (= call!14356 (contains!892 lt!68288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!39911 () Bool)

(declare-fun e!85592 () Bool)

(assert (=> d!39911 e!85592))

(declare-fun res!63229 () Bool)

(assert (=> d!39911 (=> (not res!63229) (not e!85592))))

(assert (=> d!39911 (= res!63229 (or (bvsge #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))))

(declare-fun lt!68302 () ListLongMap!1699)

(assert (=> d!39911 (= lt!68288 lt!68302)))

(declare-fun lt!68301 () Unit!4097)

(declare-fun e!85588 () Unit!4097)

(assert (=> d!39911 (= lt!68301 e!85588)))

(declare-fun c!24240 () Bool)

(declare-fun e!85593 () Bool)

(assert (=> d!39911 (= c!24240 e!85593)))

(declare-fun res!63236 () Bool)

(assert (=> d!39911 (=> (not res!63236) (not e!85593))))

(assert (=> d!39911 (= res!63236 (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun e!85591 () ListLongMap!1699)

(assert (=> d!39911 (= lt!68302 e!85591)))

(declare-fun c!24243 () Bool)

(assert (=> d!39911 (= c!24243 (and (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39911 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39911 (= (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) lt!68288)))

(declare-fun b!131233 () Bool)

(assert (=> b!131233 (= e!85592 e!85587)))

(declare-fun c!24241 () Bool)

(assert (=> b!131233 (= c!24241 (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131234 () Bool)

(declare-fun e!85595 () Bool)

(assert (=> b!131234 (= e!85595 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14349 () Bool)

(declare-fun call!14355 () ListLongMap!1699)

(declare-fun call!14351 () ListLongMap!1699)

(assert (=> bm!14349 (= call!14355 call!14351)))

(declare-fun b!131235 () Bool)

(declare-fun Unit!4105 () Unit!4097)

(assert (=> b!131235 (= e!85588 Unit!4105)))

(declare-fun b!131236 () Bool)

(declare-fun c!24242 () Bool)

(assert (=> b!131236 (= c!24242 (and (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85599 () ListLongMap!1699)

(declare-fun e!85598 () ListLongMap!1699)

(assert (=> b!131236 (= e!85599 e!85598)))

(declare-fun bm!14350 () Bool)

(assert (=> bm!14350 (= call!14357 (contains!892 lt!68288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131237 () Bool)

(declare-fun res!63232 () Bool)

(assert (=> b!131237 (=> (not res!63232) (not e!85592))))

(declare-fun e!85594 () Bool)

(assert (=> b!131237 (= res!63232 e!85594)))

(declare-fun res!63230 () Bool)

(assert (=> b!131237 (=> res!63230 e!85594)))

(assert (=> b!131237 (= res!63230 (not e!85595))))

(declare-fun res!63234 () Bool)

(assert (=> b!131237 (=> (not res!63234) (not e!85595))))

(assert (=> b!131237 (= res!63234 (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131238 () Bool)

(assert (=> b!131238 (= e!85589 (= (apply!114 lt!68288 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2700 newMap!16)))))

(declare-fun b!131239 () Bool)

(assert (=> b!131239 (= e!85598 call!14355)))

(declare-fun b!131240 () Bool)

(assert (=> b!131240 (= e!85594 e!85590)))

(declare-fun res!63237 () Bool)

(assert (=> b!131240 (=> (not res!63237) (not e!85590))))

(assert (=> b!131240 (= res!63237 (contains!892 lt!68288 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131240 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131241 () Bool)

(declare-fun e!85597 () Bool)

(assert (=> b!131241 (= e!85597 (not call!14356))))

(declare-fun b!131242 () Bool)

(assert (=> b!131242 (= e!85587 (not call!14357))))

(declare-fun b!131243 () Bool)

(declare-fun call!14354 () ListLongMap!1699)

(assert (=> b!131243 (= e!85598 call!14354)))

(declare-fun b!131244 () Bool)

(declare-fun res!63231 () Bool)

(assert (=> b!131244 (=> (not res!63231) (not e!85592))))

(assert (=> b!131244 (= res!63231 e!85597)))

(declare-fun c!24239 () Bool)

(assert (=> b!131244 (= c!24239 (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14351 () Bool)

(declare-fun call!14353 () ListLongMap!1699)

(declare-fun call!14352 () ListLongMap!1699)

(assert (=> bm!14351 (= call!14353 call!14352)))

(declare-fun b!131245 () Bool)

(assert (=> b!131245 (= e!85599 call!14355)))

(declare-fun c!24238 () Bool)

(declare-fun bm!14352 () Bool)

(assert (=> bm!14352 (= call!14351 (+!173 (ite c!24243 call!14352 (ite c!24238 call!14353 call!14354)) (ite (or c!24243 c!24238) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 newMap!16)) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 newMap!16)))))))

(declare-fun b!131246 () Bool)

(declare-fun e!85596 () Bool)

(assert (=> b!131246 (= e!85597 e!85596)))

(declare-fun res!63233 () Bool)

(assert (=> b!131246 (= res!63233 call!14356)))

(assert (=> b!131246 (=> (not res!63233) (not e!85596))))

(declare-fun b!131247 () Bool)

(declare-fun lt!68296 () Unit!4097)

(assert (=> b!131247 (= e!85588 lt!68296)))

(declare-fun lt!68299 () ListLongMap!1699)

(assert (=> b!131247 (= lt!68299 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68293 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68306 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68306 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68300 () Unit!4097)

(assert (=> b!131247 (= lt!68300 (addStillContains!90 lt!68299 lt!68293 (zeroValue!2700 newMap!16) lt!68306))))

(assert (=> b!131247 (contains!892 (+!173 lt!68299 (tuple2!2613 lt!68293 (zeroValue!2700 newMap!16))) lt!68306)))

(declare-fun lt!68289 () Unit!4097)

(assert (=> b!131247 (= lt!68289 lt!68300)))

(declare-fun lt!68287 () ListLongMap!1699)

(assert (=> b!131247 (= lt!68287 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68303 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68292 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68292 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68290 () Unit!4097)

(assert (=> b!131247 (= lt!68290 (addApplyDifferent!90 lt!68287 lt!68303 (minValue!2700 newMap!16) lt!68292))))

(assert (=> b!131247 (= (apply!114 (+!173 lt!68287 (tuple2!2613 lt!68303 (minValue!2700 newMap!16))) lt!68292) (apply!114 lt!68287 lt!68292))))

(declare-fun lt!68304 () Unit!4097)

(assert (=> b!131247 (= lt!68304 lt!68290)))

(declare-fun lt!68305 () ListLongMap!1699)

(assert (=> b!131247 (= lt!68305 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68291 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68297 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68297 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68307 () Unit!4097)

(assert (=> b!131247 (= lt!68307 (addApplyDifferent!90 lt!68305 lt!68291 (zeroValue!2700 newMap!16) lt!68297))))

(assert (=> b!131247 (= (apply!114 (+!173 lt!68305 (tuple2!2613 lt!68291 (zeroValue!2700 newMap!16))) lt!68297) (apply!114 lt!68305 lt!68297))))

(declare-fun lt!68295 () Unit!4097)

(assert (=> b!131247 (= lt!68295 lt!68307)))

(declare-fun lt!68294 () ListLongMap!1699)

(assert (=> b!131247 (= lt!68294 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68298 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68298 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68308 () (_ BitVec 64))

(assert (=> b!131247 (= lt!68308 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131247 (= lt!68296 (addApplyDifferent!90 lt!68294 lt!68298 (minValue!2700 newMap!16) lt!68308))))

(assert (=> b!131247 (= (apply!114 (+!173 lt!68294 (tuple2!2613 lt!68298 (minValue!2700 newMap!16))) lt!68308) (apply!114 lt!68294 lt!68308))))

(declare-fun b!131248 () Bool)

(assert (=> b!131248 (= e!85596 (= (apply!114 lt!68288 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2700 newMap!16)))))

(declare-fun b!131249 () Bool)

(assert (=> b!131249 (= e!85593 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14353 () Bool)

(assert (=> bm!14353 (= call!14354 call!14353)))

(declare-fun bm!14354 () Bool)

(assert (=> bm!14354 (= call!14352 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun b!131250 () Bool)

(assert (=> b!131250 (= e!85591 (+!173 call!14351 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 newMap!16))))))

(declare-fun b!131251 () Bool)

(assert (=> b!131251 (= e!85591 e!85599)))

(assert (=> b!131251 (= c!24238 (and (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!39911 c!24243) b!131250))

(assert (= (and d!39911 (not c!24243)) b!131251))

(assert (= (and b!131251 c!24238) b!131245))

(assert (= (and b!131251 (not c!24238)) b!131236))

(assert (= (and b!131236 c!24242) b!131239))

(assert (= (and b!131236 (not c!24242)) b!131243))

(assert (= (or b!131239 b!131243) bm!14353))

(assert (= (or b!131245 bm!14353) bm!14351))

(assert (= (or b!131245 b!131239) bm!14349))

(assert (= (or b!131250 bm!14351) bm!14354))

(assert (= (or b!131250 bm!14349) bm!14352))

(assert (= (and d!39911 res!63236) b!131249))

(assert (= (and d!39911 c!24240) b!131247))

(assert (= (and d!39911 (not c!24240)) b!131235))

(assert (= (and d!39911 res!63229) b!131237))

(assert (= (and b!131237 res!63234) b!131234))

(assert (= (and b!131237 (not res!63230)) b!131240))

(assert (= (and b!131240 res!63237) b!131231))

(assert (= (and b!131237 res!63232) b!131244))

(assert (= (and b!131244 c!24239) b!131246))

(assert (= (and b!131244 (not c!24239)) b!131241))

(assert (= (and b!131246 res!63233) b!131248))

(assert (= (or b!131246 b!131241) bm!14348))

(assert (= (and b!131244 res!63231) b!131233))

(assert (= (and b!131233 c!24241) b!131232))

(assert (= (and b!131233 (not c!24241)) b!131242))

(assert (= (and b!131232 res!63235) b!131238))

(assert (= (or b!131232 b!131242) bm!14350))

(declare-fun b_lambda!5841 () Bool)

(assert (=> (not b_lambda!5841) (not b!131231)))

(assert (=> b!131231 t!6137))

(declare-fun b_and!8131 () Bool)

(assert (= b_and!8127 (and (=> t!6137 result!3949) b_and!8131)))

(assert (=> b!131231 t!6139))

(declare-fun b_and!8133 () Bool)

(assert (= b_and!8129 (and (=> t!6139 result!3951) b_and!8133)))

(assert (=> d!39911 m!154413))

(declare-fun m!154563 () Bool)

(assert (=> b!131247 m!154563))

(declare-fun m!154565 () Bool)

(assert (=> b!131247 m!154565))

(declare-fun m!154567 () Bool)

(assert (=> b!131247 m!154567))

(assert (=> b!131247 m!154565))

(declare-fun m!154569 () Bool)

(assert (=> b!131247 m!154569))

(declare-fun m!154571 () Bool)

(assert (=> b!131247 m!154571))

(declare-fun m!154573 () Bool)

(assert (=> b!131247 m!154573))

(declare-fun m!154575 () Bool)

(assert (=> b!131247 m!154575))

(declare-fun m!154577 () Bool)

(assert (=> b!131247 m!154577))

(declare-fun m!154579 () Bool)

(assert (=> b!131247 m!154579))

(declare-fun m!154581 () Bool)

(assert (=> b!131247 m!154581))

(assert (=> b!131247 m!154571))

(declare-fun m!154583 () Bool)

(assert (=> b!131247 m!154583))

(declare-fun m!154585 () Bool)

(assert (=> b!131247 m!154585))

(assert (=> b!131247 m!154581))

(declare-fun m!154587 () Bool)

(assert (=> b!131247 m!154587))

(declare-fun m!154589 () Bool)

(assert (=> b!131247 m!154589))

(declare-fun m!154591 () Bool)

(assert (=> b!131247 m!154591))

(assert (=> b!131247 m!154435))

(assert (=> b!131247 m!154583))

(declare-fun m!154593 () Bool)

(assert (=> b!131247 m!154593))

(assert (=> b!131240 m!154435))

(assert (=> b!131240 m!154435))

(declare-fun m!154595 () Bool)

(assert (=> b!131240 m!154595))

(declare-fun m!154597 () Bool)

(assert (=> bm!14350 m!154597))

(declare-fun m!154599 () Bool)

(assert (=> bm!14352 m!154599))

(declare-fun m!154601 () Bool)

(assert (=> bm!14348 m!154601))

(assert (=> b!131231 m!154497))

(declare-fun m!154603 () Bool)

(assert (=> b!131231 m!154603))

(assert (=> b!131231 m!154497))

(declare-fun m!154605 () Bool)

(assert (=> b!131231 m!154605))

(assert (=> b!131231 m!154435))

(assert (=> b!131231 m!154603))

(assert (=> b!131231 m!154435))

(declare-fun m!154607 () Bool)

(assert (=> b!131231 m!154607))

(assert (=> bm!14354 m!154591))

(assert (=> b!131234 m!154435))

(assert (=> b!131234 m!154435))

(assert (=> b!131234 m!154437))

(declare-fun m!154609 () Bool)

(assert (=> b!131238 m!154609))

(declare-fun m!154611 () Bool)

(assert (=> b!131250 m!154611))

(assert (=> b!131249 m!154435))

(assert (=> b!131249 m!154435))

(assert (=> b!131249 m!154437))

(declare-fun m!154613 () Bool)

(assert (=> b!131248 m!154613))

(assert (=> b!130976 d!39911))

(declare-fun d!39913 () Bool)

(declare-fun e!85601 () Bool)

(assert (=> d!39913 e!85601))

(declare-fun res!63238 () Bool)

(assert (=> d!39913 (=> res!63238 e!85601)))

(declare-fun lt!68309 () Bool)

(assert (=> d!39913 (= res!63238 (not lt!68309))))

(declare-fun lt!68312 () Bool)

(assert (=> d!39913 (= lt!68309 lt!68312)))

(declare-fun lt!68311 () Unit!4097)

(declare-fun e!85600 () Unit!4097)

(assert (=> d!39913 (= lt!68311 e!85600)))

(declare-fun c!24244 () Bool)

(assert (=> d!39913 (= c!24244 lt!68312)))

(assert (=> d!39913 (= lt!68312 (containsKey!174 (toList!865 lt!68179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39913 (= (contains!892 lt!68179 #b0000000000000000000000000000000000000000000000000000000000000000) lt!68309)))

(declare-fun b!131252 () Bool)

(declare-fun lt!68310 () Unit!4097)

(assert (=> b!131252 (= e!85600 lt!68310)))

(assert (=> b!131252 (= lt!68310 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 lt!68179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131252 (isDefined!123 (getValueByKey!170 (toList!865 lt!68179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131253 () Bool)

(declare-fun Unit!4106 () Unit!4097)

(assert (=> b!131253 (= e!85600 Unit!4106)))

(declare-fun b!131254 () Bool)

(assert (=> b!131254 (= e!85601 (isDefined!123 (getValueByKey!170 (toList!865 lt!68179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39913 c!24244) b!131252))

(assert (= (and d!39913 (not c!24244)) b!131253))

(assert (= (and d!39913 (not res!63238)) b!131254))

(declare-fun m!154615 () Bool)

(assert (=> d!39913 m!154615))

(declare-fun m!154617 () Bool)

(assert (=> b!131252 m!154617))

(declare-fun m!154619 () Bool)

(assert (=> b!131252 m!154619))

(assert (=> b!131252 m!154619))

(declare-fun m!154621 () Bool)

(assert (=> b!131252 m!154621))

(assert (=> b!131254 m!154619))

(assert (=> b!131254 m!154619))

(assert (=> b!131254 m!154621))

(assert (=> bm!14318 d!39913))

(assert (=> b!131065 d!39907))

(declare-fun d!39915 () Bool)

(declare-fun e!85603 () Bool)

(assert (=> d!39915 e!85603))

(declare-fun res!63239 () Bool)

(assert (=> d!39915 (=> res!63239 e!85603)))

(declare-fun lt!68313 () Bool)

(assert (=> d!39915 (= res!63239 (not lt!68313))))

(declare-fun lt!68316 () Bool)

(assert (=> d!39915 (= lt!68313 lt!68316)))

(declare-fun lt!68315 () Unit!4097)

(declare-fun e!85602 () Unit!4097)

(assert (=> d!39915 (= lt!68315 e!85602)))

(declare-fun c!24245 () Bool)

(assert (=> d!39915 (= c!24245 lt!68316)))

(assert (=> d!39915 (= lt!68316 (containsKey!174 (toList!865 call!14286) (ite c!24164 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68120)))))))

(assert (=> d!39915 (= (contains!892 call!14286 (ite c!24164 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68120)))) lt!68313)))

(declare-fun b!131255 () Bool)

(declare-fun lt!68314 () Unit!4097)

(assert (=> b!131255 (= e!85602 lt!68314)))

(assert (=> b!131255 (= lt!68314 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 call!14286) (ite c!24164 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68120)))))))

(assert (=> b!131255 (isDefined!123 (getValueByKey!170 (toList!865 call!14286) (ite c!24164 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68120)))))))

(declare-fun b!131256 () Bool)

(declare-fun Unit!4107 () Unit!4097)

(assert (=> b!131256 (= e!85602 Unit!4107)))

(declare-fun b!131257 () Bool)

(assert (=> b!131257 (= e!85603 (isDefined!123 (getValueByKey!170 (toList!865 call!14286) (ite c!24164 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68120))))))))

(assert (= (and d!39915 c!24245) b!131255))

(assert (= (and d!39915 (not c!24245)) b!131256))

(assert (= (and d!39915 (not res!63239)) b!131257))

(declare-fun m!154623 () Bool)

(assert (=> d!39915 m!154623))

(declare-fun m!154625 () Bool)

(assert (=> b!131255 m!154625))

(declare-fun m!154627 () Bool)

(assert (=> b!131255 m!154627))

(assert (=> b!131255 m!154627))

(declare-fun m!154629 () Bool)

(assert (=> b!131255 m!154629))

(assert (=> b!131257 m!154627))

(assert (=> b!131257 m!154627))

(assert (=> b!131257 m!154629))

(assert (=> bm!14288 d!39915))

(declare-fun d!39917 () Bool)

(declare-fun get!1472 (Option!176) V!3467)

(assert (=> d!39917 (= (apply!114 lt!68179 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1472 (getValueByKey!170 (toList!865 lt!68179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5437 () Bool)

(assert (= bs!5437 d!39917))

(assert (=> bs!5437 m!154619))

(assert (=> bs!5437 m!154619))

(declare-fun m!154631 () Bool)

(assert (=> bs!5437 m!154631))

(assert (=> b!131064 d!39917))

(declare-fun d!39919 () Bool)

(declare-fun e!85606 () Bool)

(assert (=> d!39919 e!85606))

(declare-fun res!63245 () Bool)

(assert (=> d!39919 (=> (not res!63245) (not e!85606))))

(declare-fun lt!68322 () SeekEntryResult!273)

(assert (=> d!39919 (= res!63245 ((_ is Found!273) lt!68322))))

(assert (=> d!39919 (= lt!68322 (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(declare-fun lt!68321 () Unit!4097)

(declare-fun choose!801 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 64) Int) Unit!4097)

(assert (=> d!39919 (= lt!68321 (choose!801 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)))))

(assert (=> d!39919 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39919 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)) lt!68321)))

(declare-fun b!131262 () Bool)

(declare-fun res!63244 () Bool)

(assert (=> b!131262 (=> (not res!63244) (not e!85606))))

(assert (=> b!131262 (= res!63244 (inRange!0 (index!3251 lt!68322) (mask!7131 newMap!16)))))

(declare-fun b!131263 () Bool)

(assert (=> b!131263 (= e!85606 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68322)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> b!131263 (and (bvsge (index!3251 lt!68322) #b00000000000000000000000000000000) (bvslt (index!3251 lt!68322) (size!2516 (_keys!4588 newMap!16))))))

(assert (= (and d!39919 res!63245) b!131262))

(assert (= (and b!131262 res!63244) b!131263))

(assert (=> d!39919 m!154187))

(assert (=> d!39919 m!154305))

(assert (=> d!39919 m!154187))

(declare-fun m!154633 () Bool)

(assert (=> d!39919 m!154633))

(assert (=> d!39919 m!154413))

(declare-fun m!154635 () Bool)

(assert (=> b!131262 m!154635))

(declare-fun m!154637 () Bool)

(assert (=> b!131263 m!154637))

(assert (=> bm!14284 d!39919))

(declare-fun d!39921 () Bool)

(assert (=> d!39921 (= (apply!114 lt!68179 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1472 (getValueByKey!170 (toList!865 lt!68179) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5438 () Bool)

(assert (= bs!5438 d!39921))

(assert (=> bs!5438 m!154375))

(declare-fun m!154639 () Bool)

(assert (=> bs!5438 m!154639))

(assert (=> bs!5438 m!154639))

(declare-fun m!154641 () Bool)

(assert (=> bs!5438 m!154641))

(assert (=> b!131047 d!39921))

(declare-fun d!39923 () Bool)

(declare-fun c!24246 () Bool)

(assert (=> d!39923 (= c!24246 ((_ is ValueCellFull!1089) (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!85607 () V!3467)

(assert (=> d!39923 (= (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85607)))

(declare-fun b!131264 () Bool)

(assert (=> b!131264 (= e!85607 (get!1470 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131265 () Bool)

(assert (=> b!131265 (= e!85607 (get!1471 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39923 c!24246) b!131264))

(assert (= (and d!39923 (not c!24246)) b!131265))

(assert (=> b!131264 m!154387))

(assert (=> b!131264 m!154209))

(declare-fun m!154643 () Bool)

(assert (=> b!131264 m!154643))

(assert (=> b!131265 m!154387))

(assert (=> b!131265 m!154209))

(declare-fun m!154645 () Bool)

(assert (=> b!131265 m!154645))

(assert (=> b!131047 d!39923))

(declare-fun d!39925 () Bool)

(declare-fun res!63246 () Bool)

(declare-fun e!85608 () Bool)

(assert (=> d!39925 (=> (not res!63246) (not e!85608))))

(assert (=> d!39925 (= res!63246 (simpleValid!90 (_2!1318 lt!68114)))))

(assert (=> d!39925 (= (valid!516 (_2!1318 lt!68114)) e!85608)))

(declare-fun b!131266 () Bool)

(declare-fun res!63247 () Bool)

(assert (=> b!131266 (=> (not res!63247) (not e!85608))))

(assert (=> b!131266 (= res!63247 (= (arrayCountValidKeys!0 (_keys!4588 (_2!1318 lt!68114)) #b00000000000000000000000000000000 (size!2516 (_keys!4588 (_2!1318 lt!68114)))) (_size!592 (_2!1318 lt!68114))))))

(declare-fun b!131267 () Bool)

(declare-fun res!63248 () Bool)

(assert (=> b!131267 (=> (not res!63248) (not e!85608))))

(assert (=> b!131267 (= res!63248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4588 (_2!1318 lt!68114)) (mask!7131 (_2!1318 lt!68114))))))

(declare-fun b!131268 () Bool)

(assert (=> b!131268 (= e!85608 (arrayNoDuplicates!0 (_keys!4588 (_2!1318 lt!68114)) #b00000000000000000000000000000000 Nil!1709))))

(assert (= (and d!39925 res!63246) b!131266))

(assert (= (and b!131266 res!63247) b!131267))

(assert (= (and b!131267 res!63248) b!131268))

(declare-fun m!154647 () Bool)

(assert (=> d!39925 m!154647))

(declare-fun m!154649 () Bool)

(assert (=> b!131266 m!154649))

(declare-fun m!154651 () Bool)

(assert (=> b!131267 m!154651))

(declare-fun m!154653 () Bool)

(assert (=> b!131268 m!154653))

(assert (=> d!39863 d!39925))

(assert (=> d!39863 d!39859))

(assert (=> bm!14299 d!39877))

(declare-fun d!39927 () Bool)

(declare-fun e!85610 () Bool)

(assert (=> d!39927 e!85610))

(declare-fun res!63249 () Bool)

(assert (=> d!39927 (=> res!63249 e!85610)))

(declare-fun lt!68323 () Bool)

(assert (=> d!39927 (= res!63249 (not lt!68323))))

(declare-fun lt!68326 () Bool)

(assert (=> d!39927 (= lt!68323 lt!68326)))

(declare-fun lt!68325 () Unit!4097)

(declare-fun e!85609 () Unit!4097)

(assert (=> d!39927 (= lt!68325 e!85609)))

(declare-fun c!24247 () Bool)

(assert (=> d!39927 (= c!24247 lt!68326)))

(assert (=> d!39927 (= lt!68326 (containsKey!174 (toList!865 (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68197))))

(assert (=> d!39927 (= (contains!892 (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68197) lt!68323)))

(declare-fun b!131269 () Bool)

(declare-fun lt!68324 () Unit!4097)

(assert (=> b!131269 (= e!85609 lt!68324)))

(assert (=> b!131269 (= lt!68324 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68197))))

(assert (=> b!131269 (isDefined!123 (getValueByKey!170 (toList!865 (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68197))))

(declare-fun b!131270 () Bool)

(declare-fun Unit!4108 () Unit!4097)

(assert (=> b!131270 (= e!85609 Unit!4108)))

(declare-fun b!131271 () Bool)

(assert (=> b!131271 (= e!85610 (isDefined!123 (getValueByKey!170 (toList!865 (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68197)))))

(assert (= (and d!39927 c!24247) b!131269))

(assert (= (and d!39927 (not c!24247)) b!131270))

(assert (= (and d!39927 (not res!63249)) b!131271))

(declare-fun m!154655 () Bool)

(assert (=> d!39927 m!154655))

(declare-fun m!154657 () Bool)

(assert (=> b!131269 m!154657))

(declare-fun m!154659 () Bool)

(assert (=> b!131269 m!154659))

(assert (=> b!131269 m!154659))

(declare-fun m!154661 () Bool)

(assert (=> b!131269 m!154661))

(assert (=> b!131271 m!154659))

(assert (=> b!131271 m!154659))

(assert (=> b!131271 m!154661))

(assert (=> b!131063 d!39927))

(declare-fun d!39929 () Bool)

(assert (=> d!39929 (= (apply!114 (+!173 lt!68196 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68188) (apply!114 lt!68196 lt!68188))))

(declare-fun lt!68329 () Unit!4097)

(declare-fun choose!802 (ListLongMap!1699 (_ BitVec 64) V!3467 (_ BitVec 64)) Unit!4097)

(assert (=> d!39929 (= lt!68329 (choose!802 lt!68196 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68188))))

(declare-fun e!85613 () Bool)

(assert (=> d!39929 e!85613))

(declare-fun res!63252 () Bool)

(assert (=> d!39929 (=> (not res!63252) (not e!85613))))

(assert (=> d!39929 (= res!63252 (contains!892 lt!68196 lt!68188))))

(assert (=> d!39929 (= (addApplyDifferent!90 lt!68196 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68188) lt!68329)))

(declare-fun b!131275 () Bool)

(assert (=> b!131275 (= e!85613 (not (= lt!68188 lt!68182)))))

(assert (= (and d!39929 res!63252) b!131275))

(declare-fun m!154663 () Bool)

(assert (=> d!39929 m!154663))

(assert (=> d!39929 m!154365))

(assert (=> d!39929 m!154377))

(assert (=> d!39929 m!154349))

(declare-fun m!154665 () Bool)

(assert (=> d!39929 m!154665))

(assert (=> d!39929 m!154365))

(assert (=> b!131063 d!39929))

(declare-fun d!39931 () Bool)

(assert (=> d!39931 (= (apply!114 (+!173 lt!68185 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68199) (apply!114 lt!68185 lt!68199))))

(declare-fun lt!68330 () Unit!4097)

(assert (=> d!39931 (= lt!68330 (choose!802 lt!68185 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68199))))

(declare-fun e!85614 () Bool)

(assert (=> d!39931 e!85614))

(declare-fun res!63253 () Bool)

(assert (=> d!39931 (=> (not res!63253) (not e!85614))))

(assert (=> d!39931 (= res!63253 (contains!892 lt!68185 lt!68199))))

(assert (=> d!39931 (= (addApplyDifferent!90 lt!68185 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68199) lt!68330)))

(declare-fun b!131276 () Bool)

(assert (=> b!131276 (= e!85614 (not (= lt!68199 lt!68189)))))

(assert (= (and d!39931 res!63253) b!131276))

(declare-fun m!154667 () Bool)

(assert (=> d!39931 m!154667))

(assert (=> d!39931 m!154347))

(assert (=> d!39931 m!154351))

(assert (=> d!39931 m!154361))

(declare-fun m!154669 () Bool)

(assert (=> d!39931 m!154669))

(assert (=> d!39931 m!154347))

(assert (=> b!131063 d!39931))

(assert (=> b!131063 d!39909))

(declare-fun d!39933 () Bool)

(assert (=> d!39933 (= (apply!114 lt!68196 lt!68188) (get!1472 (getValueByKey!170 (toList!865 lt!68196) lt!68188)))))

(declare-fun bs!5439 () Bool)

(assert (= bs!5439 d!39933))

(declare-fun m!154671 () Bool)

(assert (=> bs!5439 m!154671))

(assert (=> bs!5439 m!154671))

(declare-fun m!154673 () Bool)

(assert (=> bs!5439 m!154673))

(assert (=> b!131063 d!39933))

(declare-fun d!39935 () Bool)

(assert (=> d!39935 (= (apply!114 lt!68185 lt!68199) (get!1472 (getValueByKey!170 (toList!865 lt!68185) lt!68199)))))

(declare-fun bs!5440 () Bool)

(assert (= bs!5440 d!39935))

(declare-fun m!154675 () Bool)

(assert (=> bs!5440 m!154675))

(assert (=> bs!5440 m!154675))

(declare-fun m!154677 () Bool)

(assert (=> bs!5440 m!154677))

(assert (=> b!131063 d!39935))

(declare-fun d!39937 () Bool)

(assert (=> d!39937 (= (apply!114 lt!68178 lt!68183) (get!1472 (getValueByKey!170 (toList!865 lt!68178) lt!68183)))))

(declare-fun bs!5441 () Bool)

(assert (= bs!5441 d!39937))

(declare-fun m!154679 () Bool)

(assert (=> bs!5441 m!154679))

(assert (=> bs!5441 m!154679))

(declare-fun m!154681 () Bool)

(assert (=> bs!5441 m!154681))

(assert (=> b!131063 d!39937))

(declare-fun d!39939 () Bool)

(declare-fun e!85615 () Bool)

(assert (=> d!39939 e!85615))

(declare-fun res!63255 () Bool)

(assert (=> d!39939 (=> (not res!63255) (not e!85615))))

(declare-fun lt!68334 () ListLongMap!1699)

(assert (=> d!39939 (= res!63255 (contains!892 lt!68334 (_1!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(declare-fun lt!68331 () List!1710)

(assert (=> d!39939 (= lt!68334 (ListLongMap!1700 lt!68331))))

(declare-fun lt!68332 () Unit!4097)

(declare-fun lt!68333 () Unit!4097)

(assert (=> d!39939 (= lt!68332 lt!68333)))

(assert (=> d!39939 (= (getValueByKey!170 lt!68331 (_1!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39939 (= lt!68333 (lemmaContainsTupThenGetReturnValue!85 lt!68331 (_1!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39939 (= lt!68331 (insertStrictlySorted!88 (toList!865 lt!68178) (_1!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39939 (= (+!173 lt!68178 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68334)))

(declare-fun b!131277 () Bool)

(declare-fun res!63254 () Bool)

(assert (=> b!131277 (=> (not res!63254) (not e!85615))))

(assert (=> b!131277 (= res!63254 (= (getValueByKey!170 (toList!865 lt!68334) (_1!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(declare-fun b!131278 () Bool)

(assert (=> b!131278 (= e!85615 (contains!893 (toList!865 lt!68334) (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))

(assert (= (and d!39939 res!63255) b!131277))

(assert (= (and b!131277 res!63254) b!131278))

(declare-fun m!154683 () Bool)

(assert (=> d!39939 m!154683))

(declare-fun m!154685 () Bool)

(assert (=> d!39939 m!154685))

(declare-fun m!154687 () Bool)

(assert (=> d!39939 m!154687))

(declare-fun m!154689 () Bool)

(assert (=> d!39939 m!154689))

(declare-fun m!154691 () Bool)

(assert (=> b!131277 m!154691))

(declare-fun m!154693 () Bool)

(assert (=> b!131278 m!154693))

(assert (=> b!131063 d!39939))

(declare-fun d!39941 () Bool)

(declare-fun e!85616 () Bool)

(assert (=> d!39941 e!85616))

(declare-fun res!63257 () Bool)

(assert (=> d!39941 (=> (not res!63257) (not e!85616))))

(declare-fun lt!68338 () ListLongMap!1699)

(assert (=> d!39941 (= res!63257 (contains!892 lt!68338 (_1!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(declare-fun lt!68335 () List!1710)

(assert (=> d!39941 (= lt!68338 (ListLongMap!1700 lt!68335))))

(declare-fun lt!68336 () Unit!4097)

(declare-fun lt!68337 () Unit!4097)

(assert (=> d!39941 (= lt!68336 lt!68337)))

(assert (=> d!39941 (= (getValueByKey!170 lt!68335 (_1!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39941 (= lt!68337 (lemmaContainsTupThenGetReturnValue!85 lt!68335 (_1!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39941 (= lt!68335 (insertStrictlySorted!88 (toList!865 lt!68190) (_1!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39941 (= (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68338)))

(declare-fun b!131279 () Bool)

(declare-fun res!63256 () Bool)

(assert (=> b!131279 (=> (not res!63256) (not e!85616))))

(assert (=> b!131279 (= res!63256 (= (getValueByKey!170 (toList!865 lt!68338) (_1!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(declare-fun b!131280 () Bool)

(assert (=> b!131280 (= e!85616 (contains!893 (toList!865 lt!68338) (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))))))

(assert (= (and d!39941 res!63257) b!131279))

(assert (= (and b!131279 res!63256) b!131280))

(declare-fun m!154695 () Bool)

(assert (=> d!39941 m!154695))

(declare-fun m!154697 () Bool)

(assert (=> d!39941 m!154697))

(declare-fun m!154699 () Bool)

(assert (=> d!39941 m!154699))

(declare-fun m!154701 () Bool)

(assert (=> d!39941 m!154701))

(declare-fun m!154703 () Bool)

(assert (=> b!131279 m!154703))

(declare-fun m!154705 () Bool)

(assert (=> b!131280 m!154705))

(assert (=> b!131063 d!39941))

(declare-fun d!39943 () Bool)

(declare-fun e!85617 () Bool)

(assert (=> d!39943 e!85617))

(declare-fun res!63259 () Bool)

(assert (=> d!39943 (=> (not res!63259) (not e!85617))))

(declare-fun lt!68342 () ListLongMap!1699)

(assert (=> d!39943 (= res!63259 (contains!892 lt!68342 (_1!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(declare-fun lt!68339 () List!1710)

(assert (=> d!39943 (= lt!68342 (ListLongMap!1700 lt!68339))))

(declare-fun lt!68340 () Unit!4097)

(declare-fun lt!68341 () Unit!4097)

(assert (=> d!39943 (= lt!68340 lt!68341)))

(assert (=> d!39943 (= (getValueByKey!170 lt!68339 (_1!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39943 (= lt!68341 (lemmaContainsTupThenGetReturnValue!85 lt!68339 (_1!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39943 (= lt!68339 (insertStrictlySorted!88 (toList!865 lt!68185) (_1!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39943 (= (+!173 lt!68185 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68342)))

(declare-fun b!131281 () Bool)

(declare-fun res!63258 () Bool)

(assert (=> b!131281 (=> (not res!63258) (not e!85617))))

(assert (=> b!131281 (= res!63258 (= (getValueByKey!170 (toList!865 lt!68342) (_1!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(declare-fun b!131282 () Bool)

(assert (=> b!131282 (= e!85617 (contains!893 (toList!865 lt!68342) (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))

(assert (= (and d!39943 res!63259) b!131281))

(assert (= (and b!131281 res!63258) b!131282))

(declare-fun m!154707 () Bool)

(assert (=> d!39943 m!154707))

(declare-fun m!154709 () Bool)

(assert (=> d!39943 m!154709))

(declare-fun m!154711 () Bool)

(assert (=> d!39943 m!154711))

(declare-fun m!154713 () Bool)

(assert (=> d!39943 m!154713))

(declare-fun m!154715 () Bool)

(assert (=> b!131281 m!154715))

(declare-fun m!154717 () Bool)

(assert (=> b!131282 m!154717))

(assert (=> b!131063 d!39943))

(declare-fun d!39945 () Bool)

(assert (=> d!39945 (= (apply!114 (+!173 lt!68178 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68183) (apply!114 lt!68178 lt!68183))))

(declare-fun lt!68343 () Unit!4097)

(assert (=> d!39945 (= lt!68343 (choose!802 lt!68178 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68183))))

(declare-fun e!85618 () Bool)

(assert (=> d!39945 e!85618))

(declare-fun res!63260 () Bool)

(assert (=> d!39945 (=> (not res!63260) (not e!85618))))

(assert (=> d!39945 (= res!63260 (contains!892 lt!68178 lt!68183))))

(assert (=> d!39945 (= (addApplyDifferent!90 lt!68178 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68183) lt!68343)))

(declare-fun b!131283 () Bool)

(assert (=> b!131283 (= e!85618 (not (= lt!68183 lt!68194)))))

(assert (= (and d!39945 res!63260) b!131283))

(declare-fun m!154719 () Bool)

(assert (=> d!39945 m!154719))

(assert (=> d!39945 m!154363))

(assert (=> d!39945 m!154369))

(assert (=> d!39945 m!154357))

(declare-fun m!154721 () Bool)

(assert (=> d!39945 m!154721))

(assert (=> d!39945 m!154363))

(assert (=> b!131063 d!39945))

(declare-fun d!39947 () Bool)

(assert (=> d!39947 (contains!892 (+!173 lt!68190 (tuple2!2613 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68197)))

(declare-fun lt!68346 () Unit!4097)

(declare-fun choose!803 (ListLongMap!1699 (_ BitVec 64) V!3467 (_ BitVec 64)) Unit!4097)

(assert (=> d!39947 (= lt!68346 (choose!803 lt!68190 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68197))))

(assert (=> d!39947 (contains!892 lt!68190 lt!68197)))

(assert (=> d!39947 (= (addStillContains!90 lt!68190 lt!68184 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))) lt!68197) lt!68346)))

(declare-fun bs!5442 () Bool)

(assert (= bs!5442 d!39947))

(assert (=> bs!5442 m!154353))

(assert (=> bs!5442 m!154353))

(assert (=> bs!5442 m!154355))

(declare-fun m!154723 () Bool)

(assert (=> bs!5442 m!154723))

(declare-fun m!154725 () Bool)

(assert (=> bs!5442 m!154725))

(assert (=> b!131063 d!39947))

(declare-fun d!39949 () Bool)

(declare-fun e!85619 () Bool)

(assert (=> d!39949 e!85619))

(declare-fun res!63262 () Bool)

(assert (=> d!39949 (=> (not res!63262) (not e!85619))))

(declare-fun lt!68350 () ListLongMap!1699)

(assert (=> d!39949 (= res!63262 (contains!892 lt!68350 (_1!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(declare-fun lt!68347 () List!1710)

(assert (=> d!39949 (= lt!68350 (ListLongMap!1700 lt!68347))))

(declare-fun lt!68348 () Unit!4097)

(declare-fun lt!68349 () Unit!4097)

(assert (=> d!39949 (= lt!68348 lt!68349)))

(assert (=> d!39949 (= (getValueByKey!170 lt!68347 (_1!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39949 (= lt!68349 (lemmaContainsTupThenGetReturnValue!85 lt!68347 (_1!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39949 (= lt!68347 (insertStrictlySorted!88 (toList!865 lt!68196) (_1!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) (_2!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (=> d!39949 (= (+!173 lt!68196 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68350)))

(declare-fun b!131285 () Bool)

(declare-fun res!63261 () Bool)

(assert (=> b!131285 (=> (not res!63261) (not e!85619))))

(assert (=> b!131285 (= res!63261 (= (getValueByKey!170 (toList!865 lt!68350) (_1!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) (Some!175 (_2!1317 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(declare-fun b!131286 () Bool)

(assert (=> b!131286 (= e!85619 (contains!893 (toList!865 lt!68350) (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))))))

(assert (= (and d!39949 res!63262) b!131285))

(assert (= (and b!131285 res!63261) b!131286))

(declare-fun m!154727 () Bool)

(assert (=> d!39949 m!154727))

(declare-fun m!154729 () Bool)

(assert (=> d!39949 m!154729))

(declare-fun m!154731 () Bool)

(assert (=> d!39949 m!154731))

(declare-fun m!154733 () Bool)

(assert (=> d!39949 m!154733))

(declare-fun m!154735 () Bool)

(assert (=> b!131285 m!154735))

(declare-fun m!154737 () Bool)

(assert (=> b!131286 m!154737))

(assert (=> b!131063 d!39949))

(declare-fun d!39951 () Bool)

(assert (=> d!39951 (= (apply!114 (+!173 lt!68185 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68199) (get!1472 (getValueByKey!170 (toList!865 (+!173 lt!68185 (tuple2!2613 lt!68189 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68199)))))

(declare-fun bs!5443 () Bool)

(assert (= bs!5443 d!39951))

(declare-fun m!154739 () Bool)

(assert (=> bs!5443 m!154739))

(assert (=> bs!5443 m!154739))

(declare-fun m!154741 () Bool)

(assert (=> bs!5443 m!154741))

(assert (=> b!131063 d!39951))

(declare-fun d!39953 () Bool)

(assert (=> d!39953 (= (apply!114 (+!173 lt!68196 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68188) (get!1472 (getValueByKey!170 (toList!865 (+!173 lt!68196 (tuple2!2613 lt!68182 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68188)))))

(declare-fun bs!5444 () Bool)

(assert (= bs!5444 d!39953))

(declare-fun m!154743 () Bool)

(assert (=> bs!5444 m!154743))

(assert (=> bs!5444 m!154743))

(declare-fun m!154745 () Bool)

(assert (=> bs!5444 m!154745))

(assert (=> b!131063 d!39953))

(declare-fun d!39955 () Bool)

(assert (=> d!39955 (= (apply!114 (+!173 lt!68178 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992))))) lt!68183) (get!1472 (getValueByKey!170 (toList!865 (+!173 lt!68178 (tuple2!2613 lt!68194 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68183)))))

(declare-fun bs!5445 () Bool)

(assert (= bs!5445 d!39955))

(declare-fun m!154747 () Bool)

(assert (=> bs!5445 m!154747))

(assert (=> bs!5445 m!154747))

(declare-fun m!154749 () Bool)

(assert (=> bs!5445 m!154749))

(assert (=> b!131063 d!39955))

(declare-fun d!39957 () Bool)

(declare-fun res!63267 () Bool)

(declare-fun e!85624 () Bool)

(assert (=> d!39957 (=> res!63267 e!85624)))

(assert (=> d!39957 (= res!63267 (= (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> d!39957 (= (arrayContainsKey!0 (_keys!4588 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b00000000000000000000000000000000) e!85624)))

(declare-fun b!131291 () Bool)

(declare-fun e!85625 () Bool)

(assert (=> b!131291 (= e!85624 e!85625)))

(declare-fun res!63268 () Bool)

(assert (=> b!131291 (=> (not res!63268) (not e!85625))))

(assert (=> b!131291 (= res!63268 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131292 () Bool)

(assert (=> b!131292 (= e!85625 (arrayContainsKey!0 (_keys!4588 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39957 (not res!63267)) b!131291))

(assert (= (and b!131291 res!63268) b!131292))

(assert (=> d!39957 m!154435))

(assert (=> b!131292 m!154187))

(declare-fun m!154751 () Bool)

(assert (=> b!131292 m!154751))

(assert (=> bm!14282 d!39957))

(declare-fun d!39959 () Bool)

(assert (=> d!39959 (arrayContainsKey!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68133 #b00000000000000000000000000000000)))

(declare-fun lt!68353 () Unit!4097)

(declare-fun choose!13 (array!4753 (_ BitVec 64) (_ BitVec 32)) Unit!4097)

(assert (=> d!39959 (= lt!68353 (choose!13 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68133 #b00000000000000000000000000000000))))

(assert (=> d!39959 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!39959 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68133 #b00000000000000000000000000000000) lt!68353)))

(declare-fun bs!5446 () Bool)

(assert (= bs!5446 d!39959))

(assert (=> bs!5446 m!154341))

(declare-fun m!154753 () Bool)

(assert (=> bs!5446 m!154753))

(assert (=> b!131004 d!39959))

(declare-fun d!39961 () Bool)

(declare-fun res!63269 () Bool)

(declare-fun e!85626 () Bool)

(assert (=> d!39961 (=> res!63269 e!85626)))

(assert (=> d!39961 (= res!63269 (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) lt!68133))))

(assert (=> d!39961 (= (arrayContainsKey!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68133 #b00000000000000000000000000000000) e!85626)))

(declare-fun b!131293 () Bool)

(declare-fun e!85627 () Bool)

(assert (=> b!131293 (= e!85626 e!85627)))

(declare-fun res!63270 () Bool)

(assert (=> b!131293 (=> (not res!63270) (not e!85627))))

(assert (=> b!131293 (= res!63270 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(declare-fun b!131294 () Bool)

(assert (=> b!131294 (= e!85627 (arrayContainsKey!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39961 (not res!63269)) b!131293))

(assert (= (and b!131293 res!63270) b!131294))

(assert (=> d!39961 m!154333))

(declare-fun m!154755 () Bool)

(assert (=> b!131294 m!154755))

(assert (=> b!131004 d!39961))

(declare-fun b!131296 () Bool)

(declare-fun e!85630 () SeekEntryResult!273)

(declare-fun e!85628 () SeekEntryResult!273)

(assert (=> b!131296 (= e!85630 e!85628)))

(declare-fun lt!68354 () (_ BitVec 64))

(declare-fun lt!68356 () SeekEntryResult!273)

(assert (=> b!131296 (= lt!68354 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (index!3252 lt!68356)))))

(declare-fun c!24248 () Bool)

(assert (=> b!131296 (= c!24248 (= lt!68354 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131297 () Bool)

(declare-fun e!85629 () SeekEntryResult!273)

(assert (=> b!131297 (= e!85629 (seekKeyOrZeroReturnVacant!0 (x!15412 lt!68356) (index!3252 lt!68356) (index!3252 lt!68356) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131298 () Bool)

(assert (=> b!131298 (= e!85628 (Found!273 (index!3252 lt!68356)))))

(declare-fun b!131299 () Bool)

(assert (=> b!131299 (= e!85629 (MissingZero!273 (index!3252 lt!68356)))))

(declare-fun b!131300 () Bool)

(assert (=> b!131300 (= e!85630 Undefined!273)))

(declare-fun d!39963 () Bool)

(declare-fun lt!68355 () SeekEntryResult!273)

(assert (=> d!39963 (and (or ((_ is Undefined!273) lt!68355) (not ((_ is Found!273) lt!68355)) (and (bvsge (index!3251 lt!68355) #b00000000000000000000000000000000) (bvslt (index!3251 lt!68355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))) (or ((_ is Undefined!273) lt!68355) ((_ is Found!273) lt!68355) (not ((_ is MissingZero!273) lt!68355)) (and (bvsge (index!3250 lt!68355) #b00000000000000000000000000000000) (bvslt (index!3250 lt!68355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))) (or ((_ is Undefined!273) lt!68355) ((_ is Found!273) lt!68355) ((_ is MissingZero!273) lt!68355) (not ((_ is MissingVacant!273) lt!68355)) (and (bvsge (index!3253 lt!68355) #b00000000000000000000000000000000) (bvslt (index!3253 lt!68355) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))) (or ((_ is Undefined!273) lt!68355) (ite ((_ is Found!273) lt!68355) (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (index!3251 lt!68355)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!273) lt!68355) (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (index!3250 lt!68355)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!273) lt!68355) (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (index!3253 lt!68355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39963 (= lt!68355 e!85630)))

(declare-fun c!24250 () Bool)

(assert (=> d!39963 (= c!24250 (and ((_ is Intermediate!273) lt!68356) (undefined!1085 lt!68356)))))

(assert (=> d!39963 (= lt!68356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) (mask!7131 (v!3177 (underlying!450 thiss!992)))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))))))

(assert (=> d!39963 (validMask!0 (mask!7131 (v!3177 (underlying!450 thiss!992))))))

(assert (=> d!39963 (= (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))) lt!68355)))

(declare-fun b!131295 () Bool)

(declare-fun c!24249 () Bool)

(assert (=> b!131295 (= c!24249 (= lt!68354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131295 (= e!85628 e!85629)))

(assert (= (and d!39963 c!24250) b!131300))

(assert (= (and d!39963 (not c!24250)) b!131296))

(assert (= (and b!131296 c!24248) b!131298))

(assert (= (and b!131296 (not c!24248)) b!131295))

(assert (= (and b!131295 c!24249) b!131299))

(assert (= (and b!131295 (not c!24249)) b!131297))

(declare-fun m!154757 () Bool)

(assert (=> b!131296 m!154757))

(assert (=> b!131297 m!154333))

(declare-fun m!154759 () Bool)

(assert (=> b!131297 m!154759))

(declare-fun m!154761 () Bool)

(assert (=> d!39963 m!154761))

(assert (=> d!39963 m!154333))

(declare-fun m!154763 () Bool)

(assert (=> d!39963 m!154763))

(assert (=> d!39963 m!154203))

(assert (=> d!39963 m!154333))

(assert (=> d!39963 m!154761))

(declare-fun m!154765 () Bool)

(assert (=> d!39963 m!154765))

(declare-fun m!154767 () Bool)

(assert (=> d!39963 m!154767))

(declare-fun m!154769 () Bool)

(assert (=> d!39963 m!154769))

(assert (=> b!131004 d!39963))

(assert (=> b!130983 d!39893))

(declare-fun d!39965 () Bool)

(declare-fun e!85631 () Bool)

(assert (=> d!39965 e!85631))

(declare-fun res!63272 () Bool)

(assert (=> d!39965 (=> (not res!63272) (not e!85631))))

(declare-fun lt!68360 () ListLongMap!1699)

(assert (=> d!39965 (= res!63272 (contains!892 lt!68360 (_1!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(declare-fun lt!68357 () List!1710)

(assert (=> d!39965 (= lt!68360 (ListLongMap!1700 lt!68357))))

(declare-fun lt!68358 () Unit!4097)

(declare-fun lt!68359 () Unit!4097)

(assert (=> d!39965 (= lt!68358 lt!68359)))

(assert (=> d!39965 (= (getValueByKey!170 lt!68357 (_1!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))) (Some!175 (_2!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(assert (=> d!39965 (= lt!68359 (lemmaContainsTupThenGetReturnValue!85 lt!68357 (_1!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (_2!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(assert (=> d!39965 (= lt!68357 (insertStrictlySorted!88 (toList!865 (ite c!24193 call!14322 (ite c!24188 call!14323 call!14324))) (_1!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) (_2!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))))))

(assert (=> d!39965 (= (+!173 (ite c!24193 call!14322 (ite c!24188 call!14323 call!14324)) (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))) lt!68360)))

(declare-fun b!131301 () Bool)

(declare-fun res!63271 () Bool)

(assert (=> b!131301 (=> (not res!63271) (not e!85631))))

(assert (=> b!131301 (= res!63271 (= (getValueByKey!170 (toList!865 lt!68360) (_1!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992))))))) (Some!175 (_2!1317 (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))))

(declare-fun b!131302 () Bool)

(assert (=> b!131302 (= e!85631 (contains!893 (toList!865 lt!68360) (ite (or c!24193 c!24188) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 (v!3177 (underlying!450 thiss!992)))) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 (v!3177 (underlying!450 thiss!992)))))))))

(assert (= (and d!39965 res!63272) b!131301))

(assert (= (and b!131301 res!63271) b!131302))

(declare-fun m!154771 () Bool)

(assert (=> d!39965 m!154771))

(declare-fun m!154773 () Bool)

(assert (=> d!39965 m!154773))

(declare-fun m!154775 () Bool)

(assert (=> d!39965 m!154775))

(declare-fun m!154777 () Bool)

(assert (=> d!39965 m!154777))

(declare-fun m!154779 () Bool)

(assert (=> b!131301 m!154779))

(declare-fun m!154781 () Bool)

(assert (=> b!131302 m!154781))

(assert (=> bm!14322 d!39965))

(assert (=> d!39879 d!39881))

(declare-fun d!39967 () Bool)

(assert (=> d!39967 (= (map!1401 (_2!1318 lt!68114)) (getCurrentListMap!542 (_keys!4588 (_2!1318 lt!68114)) (_values!2826 (_2!1318 lt!68114)) (mask!7131 (_2!1318 lt!68114)) (extraKeys!2612 (_2!1318 lt!68114)) (zeroValue!2700 (_2!1318 lt!68114)) (minValue!2700 (_2!1318 lt!68114)) #b00000000000000000000000000000000 (defaultEntry!2843 (_2!1318 lt!68114))))))

(declare-fun bs!5447 () Bool)

(assert (= bs!5447 d!39967))

(declare-fun m!154783 () Bool)

(assert (=> bs!5447 m!154783))

(assert (=> bm!14287 d!39967))

(declare-fun b!131303 () Bool)

(declare-fun e!85633 () Bool)

(declare-fun call!14358 () Bool)

(assert (=> b!131303 (= e!85633 call!14358)))

(declare-fun b!131304 () Bool)

(declare-fun e!85634 () Bool)

(assert (=> b!131304 (= e!85634 e!85633)))

(declare-fun c!24251 () Bool)

(assert (=> b!131304 (= c!24251 (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!39969 () Bool)

(declare-fun res!63273 () Bool)

(assert (=> d!39969 (=> res!63273 e!85634)))

(assert (=> d!39969 (= res!63273 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))))))

(assert (=> d!39969 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))) e!85634)))

(declare-fun b!131305 () Bool)

(declare-fun e!85632 () Bool)

(assert (=> b!131305 (= e!85632 call!14358)))

(declare-fun bm!14355 () Bool)

(assert (=> bm!14355 (= call!14358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131306 () Bool)

(assert (=> b!131306 (= e!85633 e!85632)))

(declare-fun lt!68363 () (_ BitVec 64))

(assert (=> b!131306 (= lt!68363 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!68361 () Unit!4097)

(assert (=> b!131306 (= lt!68361 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68363 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!131306 (arrayContainsKey!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) lt!68363 #b00000000000000000000000000000000)))

(declare-fun lt!68362 () Unit!4097)

(assert (=> b!131306 (= lt!68362 lt!68361)))

(declare-fun res!63274 () Bool)

(assert (=> b!131306 (= res!63274 (= (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))) (Found!273 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!131306 (=> (not res!63274) (not e!85632))))

(assert (= (and d!39969 (not res!63273)) b!131304))

(assert (= (and b!131304 c!24251) b!131306))

(assert (= (and b!131304 (not c!24251)) b!131303))

(assert (= (and b!131306 res!63274) b!131305))

(assert (= (or b!131305 b!131303) bm!14355))

(declare-fun m!154785 () Bool)

(assert (=> b!131304 m!154785))

(assert (=> b!131304 m!154785))

(declare-fun m!154787 () Bool)

(assert (=> b!131304 m!154787))

(declare-fun m!154789 () Bool)

(assert (=> bm!14355 m!154789))

(assert (=> b!131306 m!154785))

(declare-fun m!154791 () Bool)

(assert (=> b!131306 m!154791))

(declare-fun m!154793 () Bool)

(assert (=> b!131306 m!154793))

(assert (=> b!131306 m!154785))

(declare-fun m!154795 () Bool)

(assert (=> b!131306 m!154795))

(assert (=> bm!14303 d!39969))

(declare-fun d!39971 () Bool)

(declare-fun res!63279 () Bool)

(declare-fun e!85639 () Bool)

(assert (=> d!39971 (=> res!63279 e!85639)))

(assert (=> d!39971 (= res!63279 (and ((_ is Cons!1706) (toList!865 lt!68021)) (= (_1!1317 (h!2311 (toList!865 lt!68021))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))))

(assert (=> d!39971 (= (containsKey!174 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) e!85639)))

(declare-fun b!131311 () Bool)

(declare-fun e!85640 () Bool)

(assert (=> b!131311 (= e!85639 e!85640)))

(declare-fun res!63280 () Bool)

(assert (=> b!131311 (=> (not res!63280) (not e!85640))))

(assert (=> b!131311 (= res!63280 (and (or (not ((_ is Cons!1706) (toList!865 lt!68021))) (bvsle (_1!1317 (h!2311 (toList!865 lt!68021))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))) ((_ is Cons!1706) (toList!865 lt!68021)) (bvslt (_1!1317 (h!2311 (toList!865 lt!68021))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))))

(declare-fun b!131312 () Bool)

(assert (=> b!131312 (= e!85640 (containsKey!174 (t!6129 (toList!865 lt!68021)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (= (and d!39971 (not res!63279)) b!131311))

(assert (= (and b!131311 res!63280) b!131312))

(assert (=> b!131312 m!154187))

(declare-fun m!154797 () Bool)

(assert (=> b!131312 m!154797))

(assert (=> d!39861 d!39971))

(declare-fun lt!68365 () ListLongMap!1699)

(declare-fun b!131313 () Bool)

(declare-fun e!85644 () Bool)

(assert (=> b!131313 (= e!85644 (= (apply!114 lt!68365 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)) (get!1469 (select (arr!2250 (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!422 (defaultEntry!2843 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2517 (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))))))))

(assert (=> b!131313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131314 () Bool)

(declare-fun e!85641 () Bool)

(declare-fun e!85643 () Bool)

(assert (=> b!131314 (= e!85641 e!85643)))

(declare-fun res!63287 () Bool)

(declare-fun call!14365 () Bool)

(assert (=> b!131314 (= res!63287 call!14365)))

(assert (=> b!131314 (=> (not res!63287) (not e!85643))))

(declare-fun bm!14356 () Bool)

(declare-fun call!14364 () Bool)

(assert (=> bm!14356 (= call!14364 (contains!892 lt!68365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!39973 () Bool)

(declare-fun e!85646 () Bool)

(assert (=> d!39973 e!85646))

(declare-fun res!63281 () Bool)

(assert (=> d!39973 (=> (not res!63281) (not e!85646))))

(assert (=> d!39973 (= res!63281 (or (bvsge #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))))

(declare-fun lt!68379 () ListLongMap!1699)

(assert (=> d!39973 (= lt!68365 lt!68379)))

(declare-fun lt!68378 () Unit!4097)

(declare-fun e!85642 () Unit!4097)

(assert (=> d!39973 (= lt!68378 e!85642)))

(declare-fun c!24254 () Bool)

(declare-fun e!85647 () Bool)

(assert (=> d!39973 (= c!24254 e!85647)))

(declare-fun res!63288 () Bool)

(assert (=> d!39973 (=> (not res!63288) (not e!85647))))

(assert (=> d!39973 (= res!63288 (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun e!85645 () ListLongMap!1699)

(assert (=> d!39973 (= lt!68379 e!85645)))

(declare-fun c!24257 () Bool)

(assert (=> d!39973 (= c!24257 (and (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39973 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39973 (= (getCurrentListMap!542 (_keys!4588 newMap!16) (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) lt!68365)))

(declare-fun b!131315 () Bool)

(assert (=> b!131315 (= e!85646 e!85641)))

(declare-fun c!24255 () Bool)

(assert (=> b!131315 (= c!24255 (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131316 () Bool)

(declare-fun e!85649 () Bool)

(assert (=> b!131316 (= e!85649 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14357 () Bool)

(declare-fun call!14363 () ListLongMap!1699)

(declare-fun call!14359 () ListLongMap!1699)

(assert (=> bm!14357 (= call!14363 call!14359)))

(declare-fun b!131317 () Bool)

(declare-fun Unit!4109 () Unit!4097)

(assert (=> b!131317 (= e!85642 Unit!4109)))

(declare-fun b!131318 () Bool)

(declare-fun c!24256 () Bool)

(assert (=> b!131318 (= c!24256 (and (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85653 () ListLongMap!1699)

(declare-fun e!85652 () ListLongMap!1699)

(assert (=> b!131318 (= e!85653 e!85652)))

(declare-fun bm!14358 () Bool)

(assert (=> bm!14358 (= call!14365 (contains!892 lt!68365 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131319 () Bool)

(declare-fun res!63284 () Bool)

(assert (=> b!131319 (=> (not res!63284) (not e!85646))))

(declare-fun e!85648 () Bool)

(assert (=> b!131319 (= res!63284 e!85648)))

(declare-fun res!63282 () Bool)

(assert (=> b!131319 (=> res!63282 e!85648)))

(assert (=> b!131319 (= res!63282 (not e!85649))))

(declare-fun res!63286 () Bool)

(assert (=> b!131319 (=> (not res!63286) (not e!85649))))

(assert (=> b!131319 (= res!63286 (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131320 () Bool)

(assert (=> b!131320 (= e!85643 (= (apply!114 lt!68365 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2700 newMap!16)))))

(declare-fun b!131321 () Bool)

(assert (=> b!131321 (= e!85652 call!14363)))

(declare-fun b!131322 () Bool)

(assert (=> b!131322 (= e!85648 e!85644)))

(declare-fun res!63289 () Bool)

(assert (=> b!131322 (=> (not res!63289) (not e!85644))))

(assert (=> b!131322 (= res!63289 (contains!892 lt!68365 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))))))

(declare-fun b!131323 () Bool)

(declare-fun e!85651 () Bool)

(assert (=> b!131323 (= e!85651 (not call!14364))))

(declare-fun b!131324 () Bool)

(assert (=> b!131324 (= e!85641 (not call!14365))))

(declare-fun b!131325 () Bool)

(declare-fun call!14362 () ListLongMap!1699)

(assert (=> b!131325 (= e!85652 call!14362)))

(declare-fun b!131326 () Bool)

(declare-fun res!63283 () Bool)

(assert (=> b!131326 (=> (not res!63283) (not e!85646))))

(assert (=> b!131326 (= res!63283 e!85651)))

(declare-fun c!24253 () Bool)

(assert (=> b!131326 (= c!24253 (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14359 () Bool)

(declare-fun call!14361 () ListLongMap!1699)

(declare-fun call!14360 () ListLongMap!1699)

(assert (=> bm!14359 (= call!14361 call!14360)))

(declare-fun b!131327 () Bool)

(assert (=> b!131327 (= e!85653 call!14363)))

(declare-fun c!24252 () Bool)

(declare-fun bm!14360 () Bool)

(assert (=> bm!14360 (= call!14359 (+!173 (ite c!24257 call!14360 (ite c!24252 call!14361 call!14362)) (ite (or c!24257 c!24252) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2700 newMap!16)) (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 newMap!16)))))))

(declare-fun b!131328 () Bool)

(declare-fun e!85650 () Bool)

(assert (=> b!131328 (= e!85651 e!85650)))

(declare-fun res!63285 () Bool)

(assert (=> b!131328 (= res!63285 call!14364)))

(assert (=> b!131328 (=> (not res!63285) (not e!85650))))

(declare-fun b!131329 () Bool)

(declare-fun lt!68373 () Unit!4097)

(assert (=> b!131329 (= e!85642 lt!68373)))

(declare-fun lt!68376 () ListLongMap!1699)

(assert (=> b!131329 (= lt!68376 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68370 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68383 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68383 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68377 () Unit!4097)

(assert (=> b!131329 (= lt!68377 (addStillContains!90 lt!68376 lt!68370 (zeroValue!2700 newMap!16) lt!68383))))

(assert (=> b!131329 (contains!892 (+!173 lt!68376 (tuple2!2613 lt!68370 (zeroValue!2700 newMap!16))) lt!68383)))

(declare-fun lt!68366 () Unit!4097)

(assert (=> b!131329 (= lt!68366 lt!68377)))

(declare-fun lt!68364 () ListLongMap!1699)

(assert (=> b!131329 (= lt!68364 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68380 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68380 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68369 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68369 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68367 () Unit!4097)

(assert (=> b!131329 (= lt!68367 (addApplyDifferent!90 lt!68364 lt!68380 (minValue!2700 newMap!16) lt!68369))))

(assert (=> b!131329 (= (apply!114 (+!173 lt!68364 (tuple2!2613 lt!68380 (minValue!2700 newMap!16))) lt!68369) (apply!114 lt!68364 lt!68369))))

(declare-fun lt!68381 () Unit!4097)

(assert (=> b!131329 (= lt!68381 lt!68367)))

(declare-fun lt!68382 () ListLongMap!1699)

(assert (=> b!131329 (= lt!68382 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68368 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68374 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68374 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68384 () Unit!4097)

(assert (=> b!131329 (= lt!68384 (addApplyDifferent!90 lt!68382 lt!68368 (zeroValue!2700 newMap!16) lt!68374))))

(assert (=> b!131329 (= (apply!114 (+!173 lt!68382 (tuple2!2613 lt!68368 (zeroValue!2700 newMap!16))) lt!68374) (apply!114 lt!68382 lt!68374))))

(declare-fun lt!68372 () Unit!4097)

(assert (=> b!131329 (= lt!68372 lt!68384)))

(declare-fun lt!68371 () ListLongMap!1699)

(assert (=> b!131329 (= lt!68371 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68375 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68375 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68385 () (_ BitVec 64))

(assert (=> b!131329 (= lt!68385 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131329 (= lt!68373 (addApplyDifferent!90 lt!68371 lt!68375 (minValue!2700 newMap!16) lt!68385))))

(assert (=> b!131329 (= (apply!114 (+!173 lt!68371 (tuple2!2613 lt!68375 (minValue!2700 newMap!16))) lt!68385) (apply!114 lt!68371 lt!68385))))

(declare-fun b!131330 () Bool)

(assert (=> b!131330 (= e!85650 (= (apply!114 lt!68365 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2700 newMap!16)))))

(declare-fun b!131331 () Bool)

(assert (=> b!131331 (= e!85647 (validKeyInArray!0 (select (arr!2249 (_keys!4588 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14361 () Bool)

(assert (=> bm!14361 (= call!14362 call!14361)))

(declare-fun bm!14362 () Bool)

(assert (=> bm!14362 (= call!14360 (getCurrentListMapNoExtraKeys!139 (_keys!4588 newMap!16) (ite c!24166 (_values!2826 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16)))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun b!131332 () Bool)

(assert (=> b!131332 (= e!85645 (+!173 call!14359 (tuple2!2613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2700 newMap!16))))))

(declare-fun b!131333 () Bool)

(assert (=> b!131333 (= e!85645 e!85653)))

(assert (=> b!131333 (= c!24252 (and (not (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2612 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!39973 c!24257) b!131332))

(assert (= (and d!39973 (not c!24257)) b!131333))

(assert (= (and b!131333 c!24252) b!131327))

(assert (= (and b!131333 (not c!24252)) b!131318))

(assert (= (and b!131318 c!24256) b!131321))

(assert (= (and b!131318 (not c!24256)) b!131325))

(assert (= (or b!131321 b!131325) bm!14361))

(assert (= (or b!131327 bm!14361) bm!14359))

(assert (= (or b!131327 b!131321) bm!14357))

(assert (= (or b!131332 bm!14359) bm!14362))

(assert (= (or b!131332 bm!14357) bm!14360))

(assert (= (and d!39973 res!63288) b!131331))

(assert (= (and d!39973 c!24254) b!131329))

(assert (= (and d!39973 (not c!24254)) b!131317))

(assert (= (and d!39973 res!63281) b!131319))

(assert (= (and b!131319 res!63286) b!131316))

(assert (= (and b!131319 (not res!63282)) b!131322))

(assert (= (and b!131322 res!63289) b!131313))

(assert (= (and b!131319 res!63284) b!131326))

(assert (= (and b!131326 c!24253) b!131328))

(assert (= (and b!131326 (not c!24253)) b!131323))

(assert (= (and b!131328 res!63285) b!131330))

(assert (= (or b!131328 b!131323) bm!14356))

(assert (= (and b!131326 res!63283) b!131315))

(assert (= (and b!131315 c!24255) b!131314))

(assert (= (and b!131315 (not c!24255)) b!131324))

(assert (= (and b!131314 res!63287) b!131320))

(assert (= (or b!131314 b!131324) bm!14358))

(declare-fun b_lambda!5843 () Bool)

(assert (=> (not b_lambda!5843) (not b!131313)))

(assert (=> b!131313 t!6137))

(declare-fun b_and!8135 () Bool)

(assert (= b_and!8131 (and (=> t!6137 result!3949) b_and!8135)))

(assert (=> b!131313 t!6139))

(declare-fun b_and!8137 () Bool)

(assert (= b_and!8133 (and (=> t!6139 result!3951) b_and!8137)))

(assert (=> d!39973 m!154413))

(declare-fun m!154799 () Bool)

(assert (=> b!131329 m!154799))

(declare-fun m!154801 () Bool)

(assert (=> b!131329 m!154801))

(declare-fun m!154803 () Bool)

(assert (=> b!131329 m!154803))

(assert (=> b!131329 m!154801))

(declare-fun m!154805 () Bool)

(assert (=> b!131329 m!154805))

(declare-fun m!154807 () Bool)

(assert (=> b!131329 m!154807))

(declare-fun m!154809 () Bool)

(assert (=> b!131329 m!154809))

(declare-fun m!154811 () Bool)

(assert (=> b!131329 m!154811))

(declare-fun m!154813 () Bool)

(assert (=> b!131329 m!154813))

(declare-fun m!154815 () Bool)

(assert (=> b!131329 m!154815))

(declare-fun m!154817 () Bool)

(assert (=> b!131329 m!154817))

(assert (=> b!131329 m!154807))

(declare-fun m!154819 () Bool)

(assert (=> b!131329 m!154819))

(declare-fun m!154821 () Bool)

(assert (=> b!131329 m!154821))

(assert (=> b!131329 m!154817))

(declare-fun m!154823 () Bool)

(assert (=> b!131329 m!154823))

(declare-fun m!154825 () Bool)

(assert (=> b!131329 m!154825))

(declare-fun m!154827 () Bool)

(assert (=> b!131329 m!154827))

(assert (=> b!131329 m!154435))

(assert (=> b!131329 m!154819))

(declare-fun m!154829 () Bool)

(assert (=> b!131329 m!154829))

(assert (=> b!131322 m!154435))

(assert (=> b!131322 m!154435))

(declare-fun m!154831 () Bool)

(assert (=> b!131322 m!154831))

(declare-fun m!154833 () Bool)

(assert (=> bm!14358 m!154833))

(declare-fun m!154835 () Bool)

(assert (=> bm!14360 m!154835))

(declare-fun m!154837 () Bool)

(assert (=> bm!14356 m!154837))

(assert (=> b!131313 m!154497))

(declare-fun m!154839 () Bool)

(assert (=> b!131313 m!154839))

(assert (=> b!131313 m!154497))

(declare-fun m!154841 () Bool)

(assert (=> b!131313 m!154841))

(assert (=> b!131313 m!154435))

(assert (=> b!131313 m!154839))

(assert (=> b!131313 m!154435))

(declare-fun m!154843 () Bool)

(assert (=> b!131313 m!154843))

(assert (=> bm!14362 m!154827))

(assert (=> b!131316 m!154435))

(assert (=> b!131316 m!154435))

(assert (=> b!131316 m!154437))

(declare-fun m!154845 () Bool)

(assert (=> b!131320 m!154845))

(declare-fun m!154847 () Bool)

(assert (=> b!131332 m!154847))

(assert (=> b!131331 m!154435))

(assert (=> b!131331 m!154435))

(assert (=> b!131331 m!154437))

(declare-fun m!154849 () Bool)

(assert (=> b!131330 m!154849))

(assert (=> bm!14298 d!39973))

(declare-fun b!131368 () Bool)

(declare-fun c!24267 () Bool)

(declare-fun lt!68452 () SeekEntryResult!273)

(assert (=> b!131368 (= c!24267 ((_ is MissingVacant!273) lt!68452))))

(declare-fun e!85674 () Bool)

(declare-fun e!85671 () Bool)

(assert (=> b!131368 (= e!85674 e!85671)))

(declare-fun b!131369 () Bool)

(declare-fun e!85677 () Unit!4097)

(declare-fun Unit!4110 () Unit!4097)

(assert (=> b!131369 (= e!85677 Unit!4110)))

(declare-fun b!131370 () Bool)

(declare-fun res!63314 () Bool)

(declare-fun e!85676 () Bool)

(assert (=> b!131370 (=> (not res!63314) (not e!85676))))

(declare-fun call!14375 () Bool)

(assert (=> b!131370 (= res!63314 call!14375)))

(assert (=> b!131370 (= e!85674 e!85676)))

(declare-fun b!131371 () Bool)

(declare-fun e!85675 () Unit!4097)

(declare-fun Unit!4111 () Unit!4097)

(assert (=> b!131371 (= e!85675 Unit!4111)))

(declare-fun lt!68447 () Unit!4097)

(assert (=> b!131371 (= lt!68447 (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68450 () SeekEntryResult!273)

(declare-fun call!14374 () SeekEntryResult!273)

(assert (=> b!131371 (= lt!68450 call!14374)))

(declare-fun res!63313 () Bool)

(assert (=> b!131371 (= res!63313 ((_ is Found!273) lt!68450))))

(declare-fun e!85673 () Bool)

(assert (=> b!131371 (=> (not res!63313) (not e!85673))))

(assert (=> b!131371 e!85673))

(declare-fun lt!68474 () Unit!4097)

(assert (=> b!131371 (= lt!68474 lt!68447)))

(assert (=> b!131371 false))

(declare-fun b!131372 () Bool)

(declare-fun e!85672 () Bool)

(assert (=> b!131372 (= e!85671 e!85672)))

(declare-fun res!63315 () Bool)

(assert (=> b!131372 (= res!63315 call!14375)))

(assert (=> b!131372 (=> (not res!63315) (not e!85672))))

(declare-fun bm!14371 () Bool)

(declare-fun call!14376 () Bool)

(assert (=> bm!14371 (= call!14376 (arrayContainsKey!0 (_keys!4588 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131373 () Bool)

(declare-fun res!63312 () Bool)

(declare-fun e!85670 () Bool)

(assert (=> b!131373 (=> (not res!63312) (not e!85670))))

(declare-fun lt!68469 () tuple2!2614)

(assert (=> b!131373 (= res!63312 (valid!516 (_2!1318 lt!68469)))))

(declare-fun b!131374 () Bool)

(declare-fun res!63310 () Bool)

(assert (=> b!131374 (=> (not res!63310) (not e!85676))))

(assert (=> b!131374 (= res!63310 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3250 lt!68452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131375 () Bool)

(assert (=> b!131375 (= e!85671 ((_ is Undefined!273) lt!68452))))

(declare-fun b!131376 () Bool)

(declare-fun Unit!4112 () Unit!4097)

(assert (=> b!131376 (= e!85677 Unit!4112)))

(declare-fun lt!68464 () Unit!4097)

(declare-fun lemmaArrayContainsKeyThenInListMap!40 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 64) (_ BitVec 32) Int) Unit!4097)

(assert (=> b!131376 (= lt!68464 (lemmaArrayContainsKeyThenInListMap!40 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(assert (=> b!131376 (contains!892 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))

(declare-fun lt!68458 () Unit!4097)

(assert (=> b!131376 (= lt!68458 lt!68464)))

(assert (=> b!131376 false))

(declare-fun call!14377 () Bool)

(declare-fun c!24268 () Bool)

(declare-fun bm!14372 () Bool)

(declare-fun c!24269 () Bool)

(assert (=> bm!14372 (= call!14377 (inRange!0 (ite c!24269 (index!3251 lt!68450) (ite c!24268 (index!3250 lt!68452) (index!3253 lt!68452))) (mask!7131 newMap!16)))))

(declare-fun b!131377 () Bool)

(assert (=> b!131377 (= e!85676 (not call!14376))))

(declare-fun b!131378 () Bool)

(assert (=> b!131378 (= e!85672 (not call!14376))))

(declare-fun b!131379 () Bool)

(declare-fun res!63309 () Bool)

(assert (=> b!131379 (= res!63309 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3253 lt!68452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131379 (=> (not res!63309) (not e!85672))))

(declare-fun b!131380 () Bool)

(declare-fun lt!68471 () Unit!4097)

(assert (=> b!131380 (= e!85675 lt!68471)))

(assert (=> b!131380 (= lt!68471 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (defaultEntry!2843 newMap!16)))))

(assert (=> b!131380 (= lt!68452 call!14374)))

(assert (=> b!131380 (= c!24268 ((_ is MissingZero!273) lt!68452))))

(assert (=> b!131380 e!85674))

(declare-fun b!131381 () Bool)

(assert (=> b!131381 (= e!85673 (= (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68450)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun d!39975 () Bool)

(assert (=> d!39975 e!85670))

(declare-fun res!63316 () Bool)

(assert (=> d!39975 (=> (not res!63316) (not e!85670))))

(assert (=> d!39975 (= res!63316 (_1!1318 lt!68469))))

(assert (=> d!39975 (= lt!68469 (tuple2!2615 true (LongMapFixedSize!1087 (defaultEntry!2843 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (bvadd (_size!592 newMap!16) #b00000000000000000000000000000001) (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16))) (_vacant!592 newMap!16))))))

(declare-fun lt!68467 () Unit!4097)

(declare-fun lt!68449 () Unit!4097)

(assert (=> d!39975 (= lt!68467 lt!68449)))

(declare-fun lt!68459 () array!4755)

(declare-fun lt!68446 () array!4753)

(assert (=> d!39975 (contains!892 (getCurrentListMap!542 lt!68446 lt!68459 (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (select (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120))))))

(assert (=> d!39975 (= lt!68449 (lemmaValidKeyInArrayIsInListMap!120 lt!68446 lt!68459 (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (defaultEntry!2843 newMap!16)))))

(assert (=> d!39975 (= lt!68459 (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16))))))

(assert (=> d!39975 (= lt!68446 (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))))))

(declare-fun lt!68457 () Unit!4097)

(declare-fun lt!68448 () Unit!4097)

(assert (=> d!39975 (= lt!68457 lt!68448)))

(declare-fun lt!68462 () array!4753)

(assert (=> d!39975 (= (arrayCountValidKeys!0 lt!68462 (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (bvadd (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4753 (_ BitVec 32)) Unit!4097)

(assert (=> d!39975 (= lt!68448 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!68462 (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120))))))

(assert (=> d!39975 (= lt!68462 (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))))))

(declare-fun lt!68472 () Unit!4097)

(declare-fun lt!68463 () Unit!4097)

(assert (=> d!39975 (= lt!68472 lt!68463)))

(declare-fun lt!68455 () array!4753)

(assert (=> d!39975 (arrayContainsKey!0 lt!68455 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!39975 (= lt!68463 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!68455 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120))))))

(assert (=> d!39975 (= lt!68455 (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))))))

(declare-fun lt!68454 () Unit!4097)

(declare-fun lt!68461 () Unit!4097)

(assert (=> d!39975 (= lt!68454 lt!68461)))

(assert (=> d!39975 (= (+!173 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!542 (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!40 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 32) (_ BitVec 64) V!3467 Int) Unit!4097)

(assert (=> d!39975 (= lt!68461 (lemmaAddValidKeyToArrayThenAddPairToListMap!40 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68475 () Unit!4097)

(declare-fun lt!68456 () Unit!4097)

(assert (=> d!39975 (= lt!68475 lt!68456)))

(assert (=> d!39975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))) (mask!7131 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4753 (_ BitVec 32) (_ BitVec 32)) Unit!4097)

(assert (=> d!39975 (= lt!68456 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (mask!7131 newMap!16)))))

(declare-fun lt!68453 () Unit!4097)

(declare-fun lt!68473 () Unit!4097)

(assert (=> d!39975 (= lt!68453 lt!68473)))

(assert (=> d!39975 (= (arrayCountValidKeys!0 (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))) #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4588 newMap!16) #b00000000000000000000000000000000 (size!2516 (_keys!4588 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4753 (_ BitVec 32) (_ BitVec 64)) Unit!4097)

(assert (=> d!39975 (= lt!68473 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4588 newMap!16) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun lt!68468 () Unit!4097)

(declare-fun lt!68466 () Unit!4097)

(assert (=> d!39975 (= lt!68468 lt!68466)))

(declare-fun lt!68470 () List!1712)

(declare-fun lt!68460 () (_ BitVec 32))

(assert (=> d!39975 (arrayNoDuplicates!0 (array!4754 (store (arr!2249 (_keys!4588 newMap!16)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) (size!2516 (_keys!4588 newMap!16))) lt!68460 lt!68470)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4753 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1712) Unit!4097)

(assert (=> d!39975 (= lt!68466 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4588 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120)) lt!68460 lt!68470))))

(assert (=> d!39975 (= lt!68470 Nil!1709)))

(assert (=> d!39975 (= lt!68460 #b00000000000000000000000000000000)))

(declare-fun lt!68451 () Unit!4097)

(assert (=> d!39975 (= lt!68451 e!85677)))

(declare-fun c!24266 () Bool)

(assert (=> d!39975 (= c!24266 (arrayContainsKey!0 (_keys!4588 newMap!16) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!68465 () Unit!4097)

(assert (=> d!39975 (= lt!68465 e!85675)))

(assert (=> d!39975 (= c!24269 (contains!892 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> d!39975 (valid!516 newMap!16)))

(assert (=> d!39975 (= (updateHelperNewKey!59 newMap!16 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24167 (index!3253 lt!68120) (index!3250 lt!68120))) lt!68469)))

(declare-fun b!131382 () Bool)

(declare-fun res!63308 () Bool)

(assert (=> b!131382 (= res!63308 call!14377)))

(assert (=> b!131382 (=> (not res!63308) (not e!85673))))

(declare-fun b!131383 () Bool)

(declare-fun res!63311 () Bool)

(assert (=> b!131383 (=> (not res!63311) (not e!85670))))

(assert (=> b!131383 (= res!63311 (contains!892 (map!1401 (_2!1318 lt!68469)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun bm!14373 () Bool)

(assert (=> bm!14373 (= call!14374 (seekEntryOrOpen!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (_keys!4588 newMap!16) (mask!7131 newMap!16)))))

(declare-fun bm!14374 () Bool)

(assert (=> bm!14374 (= call!14375 call!14377)))

(declare-fun b!131384 () Bool)

(assert (=> b!131384 (= e!85670 (= (map!1401 (_2!1318 lt!68469)) (+!173 (map!1401 newMap!16) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39975 c!24269) b!131371))

(assert (= (and d!39975 (not c!24269)) b!131380))

(assert (= (and b!131371 res!63313) b!131382))

(assert (= (and b!131382 res!63308) b!131381))

(assert (= (and b!131380 c!24268) b!131370))

(assert (= (and b!131380 (not c!24268)) b!131368))

(assert (= (and b!131370 res!63314) b!131374))

(assert (= (and b!131374 res!63310) b!131377))

(assert (= (and b!131368 c!24267) b!131372))

(assert (= (and b!131368 (not c!24267)) b!131375))

(assert (= (and b!131372 res!63315) b!131379))

(assert (= (and b!131379 res!63309) b!131378))

(assert (= (or b!131370 b!131372) bm!14374))

(assert (= (or b!131377 b!131378) bm!14371))

(assert (= (or b!131382 bm!14374) bm!14372))

(assert (= (or b!131371 b!131380) bm!14373))

(assert (= (and d!39975 c!24266) b!131376))

(assert (= (and d!39975 (not c!24266)) b!131369))

(assert (= (and d!39975 res!63316) b!131373))

(assert (= (and b!131373 res!63312) b!131383))

(assert (= (and b!131383 res!63311) b!131384))

(assert (=> b!131380 m!154187))

(assert (=> b!131380 m!154319))

(declare-fun m!154851 () Bool)

(assert (=> d!39975 m!154851))

(declare-fun m!154853 () Bool)

(assert (=> d!39975 m!154853))

(assert (=> d!39975 m!154287))

(declare-fun m!154855 () Bool)

(assert (=> d!39975 m!154855))

(assert (=> d!39975 m!154195))

(declare-fun m!154857 () Bool)

(assert (=> d!39975 m!154857))

(declare-fun m!154859 () Bool)

(assert (=> d!39975 m!154859))

(declare-fun m!154861 () Bool)

(assert (=> d!39975 m!154861))

(declare-fun m!154863 () Bool)

(assert (=> d!39975 m!154863))

(assert (=> d!39975 m!154187))

(declare-fun m!154865 () Bool)

(assert (=> d!39975 m!154865))

(assert (=> d!39975 m!154287))

(assert (=> d!39975 m!154187))

(assert (=> d!39975 m!154299))

(declare-fun m!154867 () Bool)

(assert (=> d!39975 m!154867))

(assert (=> d!39975 m!154187))

(declare-fun m!154869 () Bool)

(assert (=> d!39975 m!154869))

(declare-fun m!154871 () Bool)

(assert (=> d!39975 m!154871))

(declare-fun m!154873 () Bool)

(assert (=> d!39975 m!154873))

(assert (=> d!39975 m!154187))

(assert (=> d!39975 m!154211))

(declare-fun m!154875 () Bool)

(assert (=> d!39975 m!154875))

(assert (=> d!39975 m!154873))

(assert (=> d!39975 m!154859))

(declare-fun m!154877 () Bool)

(assert (=> d!39975 m!154877))

(declare-fun m!154879 () Bool)

(assert (=> d!39975 m!154879))

(assert (=> d!39975 m!154187))

(declare-fun m!154881 () Bool)

(assert (=> d!39975 m!154881))

(assert (=> d!39975 m!154187))

(declare-fun m!154883 () Bool)

(assert (=> d!39975 m!154883))

(assert (=> d!39975 m!154187))

(declare-fun m!154885 () Bool)

(assert (=> d!39975 m!154885))

(assert (=> d!39975 m!154259))

(declare-fun m!154887 () Bool)

(assert (=> d!39975 m!154887))

(assert (=> d!39975 m!154187))

(assert (=> d!39975 m!154273))

(assert (=> d!39975 m!154287))

(declare-fun m!154889 () Bool)

(assert (=> b!131373 m!154889))

(assert (=> b!131376 m!154187))

(declare-fun m!154891 () Bool)

(assert (=> b!131376 m!154891))

(assert (=> b!131376 m!154287))

(assert (=> b!131376 m!154287))

(assert (=> b!131376 m!154187))

(assert (=> b!131376 m!154299))

(declare-fun m!154893 () Bool)

(assert (=> b!131374 m!154893))

(declare-fun m!154895 () Bool)

(assert (=> b!131381 m!154895))

(declare-fun m!154897 () Bool)

(assert (=> b!131383 m!154897))

(assert (=> b!131383 m!154897))

(assert (=> b!131383 m!154187))

(declare-fun m!154899 () Bool)

(assert (=> b!131383 m!154899))

(assert (=> bm!14371 m!154187))

(assert (=> bm!14371 m!154273))

(assert (=> b!131384 m!154897))

(assert (=> b!131384 m!154189))

(assert (=> b!131384 m!154189))

(declare-fun m!154901 () Bool)

(assert (=> b!131384 m!154901))

(assert (=> b!131371 m!154187))

(assert (=> b!131371 m!154325))

(declare-fun m!154903 () Bool)

(assert (=> bm!14372 m!154903))

(declare-fun m!154905 () Bool)

(assert (=> b!131379 m!154905))

(assert (=> bm!14373 m!154187))

(assert (=> bm!14373 m!154305))

(assert (=> bm!14286 d!39975))

(declare-fun d!39977 () Bool)

(assert (=> d!39977 (= (validKeyInArray!0 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131002 d!39977))

(declare-fun d!39979 () Bool)

(assert (=> d!39979 (= (get!1471 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130992 d!39979))

(declare-fun d!39981 () Bool)

(declare-fun e!85679 () Bool)

(assert (=> d!39981 e!85679))

(declare-fun res!63317 () Bool)

(assert (=> d!39981 (=> res!63317 e!85679)))

(declare-fun lt!68476 () Bool)

(assert (=> d!39981 (= res!63317 (not lt!68476))))

(declare-fun lt!68479 () Bool)

(assert (=> d!39981 (= lt!68476 lt!68479)))

(declare-fun lt!68478 () Unit!4097)

(declare-fun e!85678 () Unit!4097)

(assert (=> d!39981 (= lt!68478 e!85678)))

(declare-fun c!24270 () Bool)

(assert (=> d!39981 (= c!24270 lt!68479)))

(assert (=> d!39981 (= lt!68479 (containsKey!174 (toList!865 lt!68179) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!39981 (= (contains!892 lt!68179 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!68476)))

(declare-fun b!131385 () Bool)

(declare-fun lt!68477 () Unit!4097)

(assert (=> b!131385 (= e!85678 lt!68477)))

(assert (=> b!131385 (= lt!68477 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 lt!68179) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131385 (isDefined!123 (getValueByKey!170 (toList!865 lt!68179) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131386 () Bool)

(declare-fun Unit!4113 () Unit!4097)

(assert (=> b!131386 (= e!85678 Unit!4113)))

(declare-fun b!131387 () Bool)

(assert (=> b!131387 (= e!85679 (isDefined!123 (getValueByKey!170 (toList!865 lt!68179) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!39981 c!24270) b!131385))

(assert (= (and d!39981 (not c!24270)) b!131386))

(assert (= (and d!39981 (not res!63317)) b!131387))

(assert (=> d!39981 m!154375))

(declare-fun m!154907 () Bool)

(assert (=> d!39981 m!154907))

(assert (=> b!131385 m!154375))

(declare-fun m!154909 () Bool)

(assert (=> b!131385 m!154909))

(assert (=> b!131385 m!154375))

(assert (=> b!131385 m!154639))

(assert (=> b!131385 m!154639))

(declare-fun m!154911 () Bool)

(assert (=> b!131385 m!154911))

(assert (=> b!131387 m!154375))

(assert (=> b!131387 m!154639))

(assert (=> b!131387 m!154639))

(assert (=> b!131387 m!154911))

(assert (=> b!131056 d!39981))

(assert (=> d!39877 d!39911))

(declare-fun d!39983 () Bool)

(assert (=> d!39983 (= (+!173 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (tuple2!2613 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) lt!68100 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)))))

(declare-fun lt!68482 () Unit!4097)

(declare-fun choose!804 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 V!3467 Int) Unit!4097)

(assert (=> d!39983 (= lt!68482 (choose!804 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) lt!68100 (zeroValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2700 newMap!16) (defaultEntry!2843 newMap!16)))))

(assert (=> d!39983 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39983 (= (lemmaChangeZeroKeyThenAddPairToListMap!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) lt!68100 (zeroValue!2700 newMap!16) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2700 newMap!16) (defaultEntry!2843 newMap!16)) lt!68482)))

(declare-fun bs!5448 () Bool)

(assert (= bs!5448 d!39983))

(assert (=> bs!5448 m!154413))

(assert (=> bs!5448 m!154211))

(declare-fun m!154913 () Bool)

(assert (=> bs!5448 m!154913))

(assert (=> bs!5448 m!154287))

(assert (=> bs!5448 m!154287))

(declare-fun m!154915 () Bool)

(assert (=> bs!5448 m!154915))

(assert (=> bs!5448 m!154211))

(declare-fun m!154917 () Bool)

(assert (=> bs!5448 m!154917))

(assert (=> b!130967 d!39983))

(declare-fun d!39985 () Bool)

(assert (=> d!39985 (= (get!1470 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3176 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> b!130991 d!39985))

(declare-fun d!39987 () Bool)

(declare-fun isEmpty!406 (Option!176) Bool)

(assert (=> d!39987 (= (isDefined!123 (getValueByKey!170 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))) (not (isEmpty!406 (getValueByKey!170 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))))

(declare-fun bs!5449 () Bool)

(assert (= bs!5449 d!39987))

(assert (=> bs!5449 m!154269))

(declare-fun m!154919 () Bool)

(assert (=> bs!5449 m!154919))

(assert (=> b!130866 d!39987))

(declare-fun b!131397 () Bool)

(declare-fun e!85684 () Option!176)

(declare-fun e!85685 () Option!176)

(assert (=> b!131397 (= e!85684 e!85685)))

(declare-fun c!24276 () Bool)

(assert (=> b!131397 (= c!24276 (and ((_ is Cons!1706) (toList!865 lt!68021)) (not (= (_1!1317 (h!2311 (toList!865 lt!68021))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))))

(declare-fun d!39989 () Bool)

(declare-fun c!24275 () Bool)

(assert (=> d!39989 (= c!24275 (and ((_ is Cons!1706) (toList!865 lt!68021)) (= (_1!1317 (h!2311 (toList!865 lt!68021))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))))

(assert (=> d!39989 (= (getValueByKey!170 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) e!85684)))

(declare-fun b!131398 () Bool)

(assert (=> b!131398 (= e!85685 (getValueByKey!170 (t!6129 (toList!865 lt!68021)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun b!131396 () Bool)

(assert (=> b!131396 (= e!85684 (Some!175 (_2!1317 (h!2311 (toList!865 lt!68021)))))))

(declare-fun b!131399 () Bool)

(assert (=> b!131399 (= e!85685 None!174)))

(assert (= (and d!39989 c!24275) b!131396))

(assert (= (and d!39989 (not c!24275)) b!131397))

(assert (= (and b!131397 c!24276) b!131398))

(assert (= (and b!131397 (not c!24276)) b!131399))

(assert (=> b!131398 m!154187))

(declare-fun m!154921 () Bool)

(assert (=> b!131398 m!154921))

(assert (=> b!130866 d!39989))

(declare-fun d!39991 () Bool)

(assert (=> d!39991 (= (inRange!0 (ite c!24164 (ite c!24169 (index!3251 lt!68106) (ite c!24165 (index!3250 lt!68108) (index!3253 lt!68108))) (ite c!24163 (index!3251 lt!68123) (ite c!24161 (index!3250 lt!68117) (index!3253 lt!68117)))) (mask!7131 newMap!16)) (and (bvsge (ite c!24164 (ite c!24169 (index!3251 lt!68106) (ite c!24165 (index!3250 lt!68108) (index!3253 lt!68108))) (ite c!24163 (index!3251 lt!68123) (ite c!24161 (index!3250 lt!68117) (index!3253 lt!68117)))) #b00000000000000000000000000000000) (bvslt (ite c!24164 (ite c!24169 (index!3251 lt!68106) (ite c!24165 (index!3250 lt!68108) (index!3253 lt!68108))) (ite c!24163 (index!3251 lt!68123) (ite c!24161 (index!3250 lt!68117) (index!3253 lt!68117)))) (bvadd (mask!7131 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14295 d!39991))

(declare-fun d!39993 () Bool)

(declare-fun res!63318 () Bool)

(declare-fun e!85686 () Bool)

(assert (=> d!39993 (=> (not res!63318) (not e!85686))))

(assert (=> d!39993 (= res!63318 (simpleValid!90 (v!3177 (underlying!450 thiss!992))))))

(assert (=> d!39993 (= (valid!516 (v!3177 (underlying!450 thiss!992))) e!85686)))

(declare-fun b!131400 () Bool)

(declare-fun res!63319 () Bool)

(assert (=> b!131400 (=> (not res!63319) (not e!85686))))

(assert (=> b!131400 (= res!63319 (= (arrayCountValidKeys!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000000 (size!2516 (_keys!4588 (v!3177 (underlying!450 thiss!992))))) (_size!592 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131401 () Bool)

(declare-fun res!63320 () Bool)

(assert (=> b!131401 (=> (not res!63320) (not e!85686))))

(assert (=> b!131401 (= res!63320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4588 (v!3177 (underlying!450 thiss!992))) (mask!7131 (v!3177 (underlying!450 thiss!992)))))))

(declare-fun b!131402 () Bool)

(assert (=> b!131402 (= e!85686 (arrayNoDuplicates!0 (_keys!4588 (v!3177 (underlying!450 thiss!992))) #b00000000000000000000000000000000 Nil!1709))))

(assert (= (and d!39993 res!63318) b!131400))

(assert (= (and b!131400 res!63319) b!131401))

(assert (= (and b!131401 res!63320) b!131402))

(declare-fun m!154923 () Bool)

(assert (=> d!39993 m!154923))

(declare-fun m!154925 () Bool)

(assert (=> b!131400 m!154925))

(assert (=> b!131401 m!154193))

(declare-fun m!154927 () Bool)

(assert (=> b!131402 m!154927))

(assert (=> d!39883 d!39993))

(declare-fun d!39995 () Bool)

(declare-fun e!85689 () Bool)

(assert (=> d!39995 e!85689))

(declare-fun res!63323 () Bool)

(assert (=> d!39995 (=> (not res!63323) (not e!85689))))

(assert (=> d!39995 (= res!63323 (and (bvsge (index!3251 lt!68120) #b00000000000000000000000000000000) (bvslt (index!3251 lt!68120) (size!2516 (_keys!4588 newMap!16)))))))

(declare-fun lt!68485 () Unit!4097)

(declare-fun choose!805 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 32) Int) Unit!4097)

(assert (=> d!39995 (= lt!68485 (choose!805 (_keys!4588 newMap!16) lt!68121 (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (index!3251 lt!68120) (defaultEntry!2843 newMap!16)))))

(assert (=> d!39995 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39995 (= (lemmaValidKeyInArrayIsInListMap!120 (_keys!4588 newMap!16) lt!68121 (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (index!3251 lt!68120) (defaultEntry!2843 newMap!16)) lt!68485)))

(declare-fun b!131405 () Bool)

(assert (=> b!131405 (= e!85689 (contains!892 (getCurrentListMap!542 (_keys!4588 newMap!16) lt!68121 (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (select (arr!2249 (_keys!4588 newMap!16)) (index!3251 lt!68120))))))

(assert (= (and d!39995 res!63323) b!131405))

(declare-fun m!154929 () Bool)

(assert (=> d!39995 m!154929))

(assert (=> d!39995 m!154413))

(declare-fun m!154931 () Bool)

(assert (=> b!131405 m!154931))

(assert (=> b!131405 m!154301))

(assert (=> b!131405 m!154931))

(assert (=> b!131405 m!154301))

(declare-fun m!154933 () Bool)

(assert (=> b!131405 m!154933))

(assert (=> b!130966 d!39995))

(declare-fun d!39997 () Bool)

(declare-fun e!85692 () Bool)

(assert (=> d!39997 e!85692))

(declare-fun res!63326 () Bool)

(assert (=> d!39997 (=> (not res!63326) (not e!85692))))

(assert (=> d!39997 (= res!63326 (and (bvsge (index!3251 lt!68120) #b00000000000000000000000000000000) (bvslt (index!3251 lt!68120) (size!2517 (_values!2826 newMap!16)))))))

(declare-fun lt!68488 () Unit!4097)

(declare-fun choose!806 (array!4753 array!4755 (_ BitVec 32) (_ BitVec 32) V!3467 V!3467 (_ BitVec 32) (_ BitVec 64) V!3467 Int) Unit!4097)

(assert (=> d!39997 (= lt!68488 (choose!806 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (index!3251 lt!68120) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2843 newMap!16)))))

(assert (=> d!39997 (validMask!0 (mask!7131 newMap!16))))

(assert (=> d!39997 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) (index!3251 lt!68120) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2843 newMap!16)) lt!68488)))

(declare-fun b!131408 () Bool)

(assert (=> b!131408 (= e!85692 (= (+!173 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!542 (_keys!4588 newMap!16) (array!4756 (store (arr!2250 (_values!2826 newMap!16)) (index!3251 lt!68120) (ValueCellFull!1089 (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2517 (_values!2826 newMap!16))) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16))))))

(assert (= (and d!39997 res!63326) b!131408))

(assert (=> d!39997 m!154187))

(assert (=> d!39997 m!154211))

(declare-fun m!154935 () Bool)

(assert (=> d!39997 m!154935))

(assert (=> d!39997 m!154413))

(assert (=> b!131408 m!154287))

(assert (=> b!131408 m!154287))

(assert (=> b!131408 m!154855))

(assert (=> b!131408 m!154293))

(declare-fun m!154937 () Bool)

(assert (=> b!131408 m!154937))

(assert (=> b!130966 d!39997))

(declare-fun d!39999 () Bool)

(declare-fun e!85694 () Bool)

(assert (=> d!39999 e!85694))

(declare-fun res!63327 () Bool)

(assert (=> d!39999 (=> res!63327 e!85694)))

(declare-fun lt!68489 () Bool)

(assert (=> d!39999 (= res!63327 (not lt!68489))))

(declare-fun lt!68492 () Bool)

(assert (=> d!39999 (= lt!68489 lt!68492)))

(declare-fun lt!68491 () Unit!4097)

(declare-fun e!85693 () Unit!4097)

(assert (=> d!39999 (= lt!68491 e!85693)))

(declare-fun c!24277 () Bool)

(assert (=> d!39999 (= c!24277 lt!68492)))

(assert (=> d!39999 (= lt!68492 (containsKey!174 (toList!865 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> d!39999 (= (contains!892 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16)) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) lt!68489)))

(declare-fun b!131409 () Bool)

(declare-fun lt!68490 () Unit!4097)

(assert (=> b!131409 (= e!85693 lt!68490)))

(assert (=> b!131409 (= lt!68490 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> b!131409 (isDefined!123 (getValueByKey!170 (toList!865 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun b!131410 () Bool)

(declare-fun Unit!4114 () Unit!4097)

(assert (=> b!131410 (= e!85693 Unit!4114)))

(declare-fun b!131411 () Bool)

(assert (=> b!131411 (= e!85694 (isDefined!123 (getValueByKey!170 (toList!865 (getCurrentListMap!542 (_keys!4588 newMap!16) (_values!2826 newMap!16) (mask!7131 newMap!16) (extraKeys!2612 newMap!16) (zeroValue!2700 newMap!16) (minValue!2700 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2843 newMap!16))) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))))

(assert (= (and d!39999 c!24277) b!131409))

(assert (= (and d!39999 (not c!24277)) b!131410))

(assert (= (and d!39999 (not res!63327)) b!131411))

(assert (=> d!39999 m!154187))

(declare-fun m!154939 () Bool)

(assert (=> d!39999 m!154939))

(assert (=> b!131409 m!154187))

(declare-fun m!154941 () Bool)

(assert (=> b!131409 m!154941))

(assert (=> b!131409 m!154187))

(declare-fun m!154943 () Bool)

(assert (=> b!131409 m!154943))

(assert (=> b!131409 m!154943))

(declare-fun m!154945 () Bool)

(assert (=> b!131409 m!154945))

(assert (=> b!131411 m!154187))

(assert (=> b!131411 m!154943))

(assert (=> b!131411 m!154943))

(assert (=> b!131411 m!154945))

(assert (=> b!130966 d!39999))

(assert (=> b!130966 d!39911))

(declare-fun d!40001 () Bool)

(assert (=> d!40001 (= (apply!114 lt!68179 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1472 (getValueByKey!170 (toList!865 lt!68179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5450 () Bool)

(assert (= bs!5450 d!40001))

(assert (=> bs!5450 m!154419))

(assert (=> bs!5450 m!154419))

(declare-fun m!154947 () Bool)

(assert (=> bs!5450 m!154947))

(assert (=> b!131054 d!40001))

(declare-fun d!40003 () Bool)

(declare-fun e!85696 () Bool)

(assert (=> d!40003 e!85696))

(declare-fun res!63328 () Bool)

(assert (=> d!40003 (=> res!63328 e!85696)))

(declare-fun lt!68493 () Bool)

(assert (=> d!40003 (= res!63328 (not lt!68493))))

(declare-fun lt!68496 () Bool)

(assert (=> d!40003 (= lt!68493 lt!68496)))

(declare-fun lt!68495 () Unit!4097)

(declare-fun e!85695 () Unit!4097)

(assert (=> d!40003 (= lt!68495 e!85695)))

(declare-fun c!24278 () Bool)

(assert (=> d!40003 (= c!24278 lt!68496)))

(assert (=> d!40003 (= lt!68496 (containsKey!174 (toList!865 call!14300) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> d!40003 (= (contains!892 call!14300 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) lt!68493)))

(declare-fun b!131412 () Bool)

(declare-fun lt!68494 () Unit!4097)

(assert (=> b!131412 (= e!85695 lt!68494)))

(assert (=> b!131412 (= lt!68494 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 call!14300) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (=> b!131412 (isDefined!123 (getValueByKey!170 (toList!865 call!14300) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun b!131413 () Bool)

(declare-fun Unit!4115 () Unit!4097)

(assert (=> b!131413 (= e!85695 Unit!4115)))

(declare-fun b!131414 () Bool)

(assert (=> b!131414 (= e!85696 (isDefined!123 (getValueByKey!170 (toList!865 call!14300) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355))))))

(assert (= (and d!40003 c!24278) b!131412))

(assert (= (and d!40003 (not c!24278)) b!131413))

(assert (= (and d!40003 (not res!63328)) b!131414))

(assert (=> d!40003 m!154187))

(declare-fun m!154949 () Bool)

(assert (=> d!40003 m!154949))

(assert (=> b!131412 m!154187))

(declare-fun m!154951 () Bool)

(assert (=> b!131412 m!154951))

(assert (=> b!131412 m!154187))

(declare-fun m!154953 () Bool)

(assert (=> b!131412 m!154953))

(assert (=> b!131412 m!154953))

(declare-fun m!154955 () Bool)

(assert (=> b!131412 m!154955))

(assert (=> b!131414 m!154187))

(assert (=> b!131414 m!154953))

(assert (=> b!131414 m!154953))

(assert (=> b!131414 m!154955))

(assert (=> b!130949 d!40003))

(declare-fun d!40005 () Bool)

(assert (=> d!40005 (isDefined!123 (getValueByKey!170 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun lt!68499 () Unit!4097)

(declare-fun choose!807 (List!1710 (_ BitVec 64)) Unit!4097)

(assert (=> d!40005 (= lt!68499 (choose!807 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(declare-fun e!85699 () Bool)

(assert (=> d!40005 e!85699))

(declare-fun res!63331 () Bool)

(assert (=> d!40005 (=> (not res!63331) (not e!85699))))

(declare-fun isStrictlySorted!320 (List!1710) Bool)

(assert (=> d!40005 (= res!63331 (isStrictlySorted!320 (toList!865 lt!68021)))))

(assert (=> d!40005 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)) lt!68499)))

(declare-fun b!131417 () Bool)

(assert (=> b!131417 (= e!85699 (containsKey!174 (toList!865 lt!68021) (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355)))))

(assert (= (and d!40005 res!63331) b!131417))

(assert (=> d!40005 m!154187))

(assert (=> d!40005 m!154269))

(assert (=> d!40005 m!154269))

(assert (=> d!40005 m!154271))

(assert (=> d!40005 m!154187))

(declare-fun m!154957 () Bool)

(assert (=> d!40005 m!154957))

(declare-fun m!154959 () Bool)

(assert (=> d!40005 m!154959))

(assert (=> b!131417 m!154187))

(assert (=> b!131417 m!154265))

(assert (=> b!130864 d!40005))

(assert (=> b!130864 d!39987))

(assert (=> b!130864 d!39989))

(declare-fun d!40007 () Bool)

(declare-fun e!85700 () Bool)

(assert (=> d!40007 e!85700))

(declare-fun res!63333 () Bool)

(assert (=> d!40007 (=> (not res!63333) (not e!85700))))

(declare-fun lt!68503 () ListLongMap!1699)

(assert (=> d!40007 (= res!63333 (contains!892 lt!68503 (_1!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!68500 () List!1710)

(assert (=> d!40007 (= lt!68503 (ListLongMap!1700 lt!68500))))

(declare-fun lt!68501 () Unit!4097)

(declare-fun lt!68502 () Unit!4097)

(assert (=> d!40007 (= lt!68501 lt!68502)))

(assert (=> d!40007 (= (getValueByKey!170 lt!68500 (_1!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!175 (_2!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40007 (= lt!68502 (lemmaContainsTupThenGetReturnValue!85 lt!68500 (_1!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40007 (= lt!68500 (insertStrictlySorted!88 (toList!865 call!14284) (_1!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40007 (= (+!173 call!14284 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!68503)))

(declare-fun b!131418 () Bool)

(declare-fun res!63332 () Bool)

(assert (=> b!131418 (=> (not res!63332) (not e!85700))))

(assert (=> b!131418 (= res!63332 (= (getValueByKey!170 (toList!865 lt!68503) (_1!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!175 (_2!1317 (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!131419 () Bool)

(assert (=> b!131419 (= e!85700 (contains!893 (toList!865 lt!68503) (tuple2!2613 (select (arr!2249 (_keys!4588 (v!3177 (underlying!450 thiss!992)))) from!355) (get!1469 (select (arr!2250 (_values!2826 (v!3177 (underlying!450 thiss!992)))) from!355) (dynLambda!422 (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!40007 res!63333) b!131418))

(assert (= (and b!131418 res!63332) b!131419))

(declare-fun m!154961 () Bool)

(assert (=> d!40007 m!154961))

(declare-fun m!154963 () Bool)

(assert (=> d!40007 m!154963))

(declare-fun m!154965 () Bool)

(assert (=> d!40007 m!154965))

(declare-fun m!154967 () Bool)

(assert (=> d!40007 m!154967))

(declare-fun m!154969 () Bool)

(assert (=> b!131418 m!154969))

(declare-fun m!154971 () Bool)

(assert (=> b!131419 m!154971))

(assert (=> b!130977 d!40007))

(declare-fun b!131420 () Bool)

(declare-fun e!85701 () Bool)

(assert (=> b!131420 (= e!85701 tp_is_empty!2865)))

(declare-fun mapIsEmpty!4607 () Bool)

(declare-fun mapRes!4607 () Bool)

(assert (=> mapIsEmpty!4607 mapRes!4607))

(declare-fun b!131421 () Bool)

(declare-fun e!85702 () Bool)

(assert (=> b!131421 (= e!85702 tp_is_empty!2865)))

(declare-fun condMapEmpty!4607 () Bool)

(declare-fun mapDefault!4607 () ValueCell!1089)

(assert (=> mapNonEmpty!4605 (= condMapEmpty!4607 (= mapRest!4605 ((as const (Array (_ BitVec 32) ValueCell!1089)) mapDefault!4607)))))

(assert (=> mapNonEmpty!4605 (= tp!11139 (and e!85702 mapRes!4607))))

(declare-fun mapNonEmpty!4607 () Bool)

(declare-fun tp!11141 () Bool)

(assert (=> mapNonEmpty!4607 (= mapRes!4607 (and tp!11141 e!85701))))

(declare-fun mapValue!4607 () ValueCell!1089)

(declare-fun mapKey!4607 () (_ BitVec 32))

(declare-fun mapRest!4607 () (Array (_ BitVec 32) ValueCell!1089))

(assert (=> mapNonEmpty!4607 (= mapRest!4605 (store mapRest!4607 mapKey!4607 mapValue!4607))))

(assert (= (and mapNonEmpty!4605 condMapEmpty!4607) mapIsEmpty!4607))

(assert (= (and mapNonEmpty!4605 (not condMapEmpty!4607)) mapNonEmpty!4607))

(assert (= (and mapNonEmpty!4607 ((_ is ValueCellFull!1089) mapValue!4607)) b!131420))

(assert (= (and mapNonEmpty!4605 ((_ is ValueCellFull!1089) mapDefault!4607)) b!131421))

(declare-fun m!154973 () Bool)

(assert (=> mapNonEmpty!4607 m!154973))

(declare-fun b!131422 () Bool)

(declare-fun e!85703 () Bool)

(assert (=> b!131422 (= e!85703 tp_is_empty!2865)))

(declare-fun mapIsEmpty!4608 () Bool)

(declare-fun mapRes!4608 () Bool)

(assert (=> mapIsEmpty!4608 mapRes!4608))

(declare-fun b!131423 () Bool)

(declare-fun e!85704 () Bool)

(assert (=> b!131423 (= e!85704 tp_is_empty!2865)))

(declare-fun condMapEmpty!4608 () Bool)

(declare-fun mapDefault!4608 () ValueCell!1089)

(assert (=> mapNonEmpty!4606 (= condMapEmpty!4608 (= mapRest!4606 ((as const (Array (_ BitVec 32) ValueCell!1089)) mapDefault!4608)))))

(assert (=> mapNonEmpty!4606 (= tp!11140 (and e!85704 mapRes!4608))))

(declare-fun mapNonEmpty!4608 () Bool)

(declare-fun tp!11142 () Bool)

(assert (=> mapNonEmpty!4608 (= mapRes!4608 (and tp!11142 e!85703))))

(declare-fun mapKey!4608 () (_ BitVec 32))

(declare-fun mapValue!4608 () ValueCell!1089)

(declare-fun mapRest!4608 () (Array (_ BitVec 32) ValueCell!1089))

(assert (=> mapNonEmpty!4608 (= mapRest!4606 (store mapRest!4608 mapKey!4608 mapValue!4608))))

(assert (= (and mapNonEmpty!4606 condMapEmpty!4608) mapIsEmpty!4608))

(assert (= (and mapNonEmpty!4606 (not condMapEmpty!4608)) mapNonEmpty!4608))

(assert (= (and mapNonEmpty!4608 ((_ is ValueCellFull!1089) mapValue!4608)) b!131422))

(assert (= (and mapNonEmpty!4606 ((_ is ValueCellFull!1089) mapDefault!4608)) b!131423))

(declare-fun m!154975 () Bool)

(assert (=> mapNonEmpty!4608 m!154975))

(declare-fun b_lambda!5845 () Bool)

(assert (= b_lambda!5835 (or (and b!130775 b_free!2897 (= (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) (defaultEntry!2843 newMap!16))) (and b!130789 b_free!2899) b_lambda!5845)))

(declare-fun b_lambda!5847 () Bool)

(assert (= b_lambda!5837 (or (and b!130775 b_free!2897) (and b!130789 b_free!2899 (= (defaultEntry!2843 newMap!16) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))))) b_lambda!5847)))

(declare-fun b_lambda!5849 () Bool)

(assert (= b_lambda!5839 (or (and b!130775 b_free!2897) (and b!130789 b_free!2899 (= (defaultEntry!2843 newMap!16) (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))))) b_lambda!5849)))

(declare-fun b_lambda!5851 () Bool)

(assert (= b_lambda!5841 (or (and b!130775 b_free!2897 (= (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) (defaultEntry!2843 newMap!16))) (and b!130789 b_free!2899) b_lambda!5851)))

(declare-fun b_lambda!5853 () Bool)

(assert (= b_lambda!5843 (or (and b!130775 b_free!2897 (= (defaultEntry!2843 (v!3177 (underlying!450 thiss!992))) (defaultEntry!2843 newMap!16))) (and b!130789 b_free!2899) b_lambda!5853)))

(check-sat (not b!131294) (not bm!14371) (not b!131262) (not d!39893) (not d!39987) (not b!131234) (not b!131142) (not d!39921) (not b!131277) (not b!131371) (not b!131329) (not b!131193) (not b_lambda!5851) (not b!131080) (not d!39901) (not b!131278) (not b!131224) (not mapNonEmpty!4608) (not b!131376) (not d!39959) (not b!131225) (not bm!14356) (not b!131312) (not b!131385) (not d!39925) (not b!131116) (not b!131138) (not d!39903) (not b!131383) (not b!131100) (not b_next!2897) (not b!131240) (not b!131158) (not bm!14344) (not b!131408) (not b!131257) tp_is_empty!2865 (not b!131137) (not bm!14350) (not d!39917) (not b!131279) (not b!131144) (not b!131269) (not d!39887) (not b!131418) (not d!39967) (not b!131268) (not b_lambda!5853) (not b!131223) (not d!39975) (not d!39995) (not d!39945) (not d!39963) (not b!131313) (not b!131238) (not b!131297) (not b!131280) (not d!39929) (not d!39931) (not d!39911) (not b!131099) (not d!39905) (not d!39949) (not b!131139) (not b!131157) (not b!131332) (not bm!14358) (not d!39933) (not bm!14348) (not b!131380) (not bm!14360) (not bm!14328) (not b!131400) (not b!131252) (not d!39909) (not d!39885) (not d!40003) (not b_next!2899) (not b!131271) (not b!131127) (not b!131086) (not d!39913) (not d!39889) (not b!131129) (not b!131330) (not b!131402) (not d!39993) (not d!40007) (not b_lambda!5847) (not bm!14355) (not b_lambda!5845) (not bm!14373) (not b!131255) (not bm!14332) (not b!131267) (not d!39999) (not bm!14327) (not b!131401) (not d!39939) (not b!131398) (not b!131285) (not b!131387) (not b!131228) (not bm!14338) (not b!131320) (not d!39981) (not d!39953) (not b_lambda!5833) (not b!131405) (not d!39915) (not b!131412) (not b!131247) (not d!39997) (not b!131414) (not d!39937) (not b!131302) (not b!131316) (not b!131282) (not bm!14334) (not b!131229) (not b!131230) (not d!40001) (not b!131101) (not bm!14343) (not d!39965) (not b!131078) (not b!131409) (not d!39919) (not b!131281) (not b!131411) (not bm!14330) (not b!131231) (not b!131419) (not b!131266) (not d!39983) (not d!39941) (not b!131248) (not b!131250) (not bm!14354) (not b!131417) (not b!131301) (not b!131265) (not b!131085) (not b!131304) (not b!131219) (not mapNonEmpty!4607) (not b_lambda!5849) (not b!131384) (not b!131136) (not d!39943) (not d!39895) (not bm!14347) b_and!8137 (not b!131249) (not b!131220) (not b!131192) (not b!131322) (not b_lambda!5829) (not b!131264) (not bm!14335) (not bm!14362) (not d!39973) (not b!131123) (not bm!14352) (not d!40005) (not d!39955) (not b!131292) (not d!39947) (not d!39951) (not d!39935) b_and!8135 (not bm!14372) (not b!131331) (not b!131286) (not b!131254) (not b!131306) (not b!131120) (not b!131373) (not d!39927) (not b!131156))
(check-sat b_and!8135 b_and!8137 (not b_next!2897) (not b_next!2899))
