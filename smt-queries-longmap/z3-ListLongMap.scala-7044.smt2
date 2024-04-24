; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89510 () Bool)

(assert start!89510)

(declare-fun b!1025027 () Bool)

(declare-fun b_free!20317 () Bool)

(declare-fun b_next!20317 () Bool)

(assert (=> b!1025027 (= b_free!20317 (not b_next!20317))))

(declare-fun tp!71985 () Bool)

(declare-fun b_and!32555 () Bool)

(assert (=> b!1025027 (= tp!71985 b_and!32555)))

(declare-fun b!1025022 () Bool)

(declare-fun res!686071 () Bool)

(declare-fun e!577733 () Bool)

(assert (=> b!1025022 (=> (not res!686071) (not e!577733))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025022 (= res!686071 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1025023 () Bool)

(declare-fun e!577734 () Bool)

(declare-fun e!577731 () Bool)

(declare-fun mapRes!37473 () Bool)

(assert (=> b!1025023 (= e!577734 (and e!577731 mapRes!37473))))

(declare-fun condMapEmpty!37473 () Bool)

(declare-datatypes ((V!36923 0))(
  ( (V!36924 (val!12069 Int)) )
))
(declare-datatypes ((ValueCell!11315 0))(
  ( (ValueCellFull!11315 (v!14634 V!36923)) (EmptyCell!11315) )
))
(declare-datatypes ((array!64167 0))(
  ( (array!64168 (arr!30889 (Array (_ BitVec 32) (_ BitVec 64))) (size!31401 (_ BitVec 32))) )
))
(declare-datatypes ((array!64169 0))(
  ( (array!64170 (arr!30890 (Array (_ BitVec 32) ValueCell!11315)) (size!31402 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5224 0))(
  ( (LongMapFixedSize!5225 (defaultEntry!5964 Int) (mask!29653 (_ BitVec 32)) (extraKeys!5696 (_ BitVec 32)) (zeroValue!5800 V!36923) (minValue!5800 V!36923) (_size!2667 (_ BitVec 32)) (_keys!11147 array!64167) (_values!5987 array!64169) (_vacant!2667 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5224)

(declare-fun mapDefault!37473 () ValueCell!11315)

(assert (=> b!1025023 (= condMapEmpty!37473 (= (arr!30890 (_values!5987 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11315)) mapDefault!37473)))))

(declare-fun b!1025024 () Bool)

(assert (=> b!1025024 (= e!577733 (not true))))

(declare-fun lt!450978 () Bool)

(declare-fun lt!450979 () V!36923)

(declare-fun valid!1995 (LongMapFixedSize!5224) Bool)

(assert (=> b!1025024 (= lt!450978 (valid!1995 (LongMapFixedSize!5225 (defaultEntry!5964 thiss!1427) (mask!29653 thiss!1427) (bvand (extraKeys!5696 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5800 thiss!1427) lt!450979 (_size!2667 thiss!1427) (_keys!11147 thiss!1427) (_values!5987 thiss!1427) (_vacant!2667 thiss!1427))))))

(declare-datatypes ((tuple2!15518 0))(
  ( (tuple2!15519 (_1!7770 (_ BitVec 64)) (_2!7770 V!36923)) )
))
(declare-datatypes ((List!21703 0))(
  ( (Nil!21700) (Cons!21699 (h!22906 tuple2!15518) (t!30741 List!21703)) )
))
(declare-datatypes ((ListLongMap!13663 0))(
  ( (ListLongMap!13664 (toList!6847 List!21703)) )
))
(declare-fun -!470 (ListLongMap!13663 (_ BitVec 64)) ListLongMap!13663)

(declare-fun getCurrentListMap!3893 (array!64167 array!64169 (_ BitVec 32) (_ BitVec 32) V!36923 V!36923 (_ BitVec 32) Int) ListLongMap!13663)

(assert (=> b!1025024 (= (-!470 (getCurrentListMap!3893 (_keys!11147 thiss!1427) (_values!5987 thiss!1427) (mask!29653 thiss!1427) (extraKeys!5696 thiss!1427) (zeroValue!5800 thiss!1427) (minValue!5800 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5964 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3893 (_keys!11147 thiss!1427) (_values!5987 thiss!1427) (mask!29653 thiss!1427) (bvand (extraKeys!5696 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5800 thiss!1427) lt!450979 #b00000000000000000000000000000000 (defaultEntry!5964 thiss!1427)))))

(declare-datatypes ((Unit!33334 0))(
  ( (Unit!33335) )
))
(declare-fun lt!450980 () Unit!33334)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!4 (array!64167 array!64169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36923 V!36923 V!36923 Int) Unit!33334)

(assert (=> b!1025024 (= lt!450980 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!4 (_keys!11147 thiss!1427) (_values!5987 thiss!1427) (mask!29653 thiss!1427) (extraKeys!5696 thiss!1427) (bvand (extraKeys!5696 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5800 thiss!1427) (minValue!5800 thiss!1427) lt!450979 (defaultEntry!5964 thiss!1427)))))

(declare-fun dynLambda!1964 (Int (_ BitVec 64)) V!36923)

(assert (=> b!1025024 (= lt!450979 (dynLambda!1964 (defaultEntry!5964 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025025 () Bool)

(declare-fun e!577732 () Bool)

(declare-fun tp_is_empty!24037 () Bool)

(assert (=> b!1025025 (= e!577732 tp_is_empty!24037)))

(declare-fun res!686072 () Bool)

(assert (=> start!89510 (=> (not res!686072) (not e!577733))))

(assert (=> start!89510 (= res!686072 (valid!1995 thiss!1427))))

(assert (=> start!89510 e!577733))

(declare-fun e!577729 () Bool)

(assert (=> start!89510 e!577729))

(assert (=> start!89510 true))

(declare-fun mapIsEmpty!37473 () Bool)

(assert (=> mapIsEmpty!37473 mapRes!37473))

(declare-fun b!1025026 () Bool)

(assert (=> b!1025026 (= e!577731 tp_is_empty!24037)))

(declare-fun mapNonEmpty!37473 () Bool)

(declare-fun tp!71986 () Bool)

(assert (=> mapNonEmpty!37473 (= mapRes!37473 (and tp!71986 e!577732))))

(declare-fun mapValue!37473 () ValueCell!11315)

(declare-fun mapKey!37473 () (_ BitVec 32))

(declare-fun mapRest!37473 () (Array (_ BitVec 32) ValueCell!11315))

(assert (=> mapNonEmpty!37473 (= (arr!30890 (_values!5987 thiss!1427)) (store mapRest!37473 mapKey!37473 mapValue!37473))))

(declare-fun array_inv!23949 (array!64167) Bool)

(declare-fun array_inv!23950 (array!64169) Bool)

(assert (=> b!1025027 (= e!577729 (and tp!71985 tp_is_empty!24037 (array_inv!23949 (_keys!11147 thiss!1427)) (array_inv!23950 (_values!5987 thiss!1427)) e!577734))))

(assert (= (and start!89510 res!686072) b!1025022))

(assert (= (and b!1025022 res!686071) b!1025024))

(assert (= (and b!1025023 condMapEmpty!37473) mapIsEmpty!37473))

(assert (= (and b!1025023 (not condMapEmpty!37473)) mapNonEmpty!37473))

(get-info :version)

(assert (= (and mapNonEmpty!37473 ((_ is ValueCellFull!11315) mapValue!37473)) b!1025025))

(assert (= (and b!1025023 ((_ is ValueCellFull!11315) mapDefault!37473)) b!1025026))

(assert (= b!1025027 b!1025023))

(assert (= start!89510 b!1025027))

(declare-fun b_lambda!15711 () Bool)

(assert (=> (not b_lambda!15711) (not b!1025024)))

(declare-fun t!30740 () Bool)

(declare-fun tb!6861 () Bool)

(assert (=> (and b!1025027 (= (defaultEntry!5964 thiss!1427) (defaultEntry!5964 thiss!1427)) t!30740) tb!6861))

(declare-fun result!14039 () Bool)

(assert (=> tb!6861 (= result!14039 tp_is_empty!24037)))

(assert (=> b!1025024 t!30740))

(declare-fun b_and!32557 () Bool)

(assert (= b_and!32555 (and (=> t!30740 result!14039) b_and!32557)))

(declare-fun m!943957 () Bool)

(assert (=> b!1025024 m!943957))

(declare-fun m!943959 () Bool)

(assert (=> b!1025024 m!943959))

(declare-fun m!943961 () Bool)

(assert (=> b!1025024 m!943961))

(declare-fun m!943963 () Bool)

(assert (=> b!1025024 m!943963))

(declare-fun m!943965 () Bool)

(assert (=> b!1025024 m!943965))

(declare-fun m!943967 () Bool)

(assert (=> b!1025024 m!943967))

(assert (=> b!1025024 m!943963))

(declare-fun m!943969 () Bool)

(assert (=> start!89510 m!943969))

(declare-fun m!943971 () Bool)

(assert (=> mapNonEmpty!37473 m!943971))

(declare-fun m!943973 () Bool)

(assert (=> b!1025027 m!943973))

(declare-fun m!943975 () Bool)

(assert (=> b!1025027 m!943975))

(check-sat (not b!1025027) (not b!1025024) tp_is_empty!24037 (not start!89510) (not b_next!20317) b_and!32557 (not b_lambda!15711) (not mapNonEmpty!37473))
(check-sat b_and!32557 (not b_next!20317))
