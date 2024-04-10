; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75490 () Bool)

(assert start!75490)

(declare-fun b!888337 () Bool)

(declare-fun b_free!15561 () Bool)

(declare-fun b_next!15561 () Bool)

(assert (=> b!888337 (= b_free!15561 (not b_next!15561))))

(declare-fun tp!54634 () Bool)

(declare-fun b_and!25799 () Bool)

(assert (=> b!888337 (= tp!54634 b_and!25799)))

(declare-fun e!494951 () Bool)

(declare-datatypes ((array!51748 0))(
  ( (array!51749 (arr!24885 (Array (_ BitVec 32) (_ BitVec 64))) (size!25326 (_ BitVec 32))) )
))
(declare-datatypes ((V!28817 0))(
  ( (V!28818 (val!8995 Int)) )
))
(declare-datatypes ((ValueCell!8463 0))(
  ( (ValueCellFull!8463 (v!11468 V!28817)) (EmptyCell!8463) )
))
(declare-datatypes ((array!51750 0))(
  ( (array!51751 (arr!24886 (Array (_ BitVec 32) ValueCell!8463)) (size!25327 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3942 0))(
  ( (LongMapFixedSize!3943 (defaultEntry!5165 Int) (mask!25583 (_ BitVec 32)) (extraKeys!4859 (_ BitVec 32)) (zeroValue!4963 V!28817) (minValue!4963 V!28817) (_size!2026 (_ BitVec 32)) (_keys!9844 array!51748) (_values!5150 array!51750) (_vacant!2026 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3942)

(declare-fun e!494947 () Bool)

(declare-fun tp_is_empty!17889 () Bool)

(declare-fun array_inv!19584 (array!51748) Bool)

(declare-fun array_inv!19585 (array!51750) Bool)

(assert (=> b!888337 (= e!494951 (and tp!54634 tp_is_empty!17889 (array_inv!19584 (_keys!9844 thiss!1181)) (array_inv!19585 (_values!5150 thiss!1181)) e!494947))))

(declare-fun mapIsEmpty!28370 () Bool)

(declare-fun mapRes!28370 () Bool)

(assert (=> mapIsEmpty!28370 mapRes!28370))

(declare-fun mapNonEmpty!28370 () Bool)

(declare-fun tp!54633 () Bool)

(declare-fun e!494949 () Bool)

(assert (=> mapNonEmpty!28370 (= mapRes!28370 (and tp!54633 e!494949))))

(declare-fun mapRest!28370 () (Array (_ BitVec 32) ValueCell!8463))

(declare-fun mapKey!28370 () (_ BitVec 32))

(declare-fun mapValue!28370 () ValueCell!8463)

(assert (=> mapNonEmpty!28370 (= (arr!24886 (_values!5150 thiss!1181)) (store mapRest!28370 mapKey!28370 mapValue!28370))))

(declare-fun lt!401718 () Bool)

(declare-fun valid!1538 (LongMapFixedSize!3942) Bool)

(assert (=> start!75490 (= lt!401718 (valid!1538 thiss!1181))))

(assert (=> start!75490 false))

(assert (=> start!75490 e!494951))

(declare-fun b!888338 () Bool)

(declare-fun e!494948 () Bool)

(assert (=> b!888338 (= e!494947 (and e!494948 mapRes!28370))))

(declare-fun condMapEmpty!28370 () Bool)

(declare-fun mapDefault!28370 () ValueCell!8463)

(assert (=> b!888338 (= condMapEmpty!28370 (= (arr!24886 (_values!5150 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8463)) mapDefault!28370)))))

(declare-fun b!888339 () Bool)

(assert (=> b!888339 (= e!494949 tp_is_empty!17889)))

(declare-fun b!888340 () Bool)

(assert (=> b!888340 (= e!494948 tp_is_empty!17889)))

(assert (= (and b!888338 condMapEmpty!28370) mapIsEmpty!28370))

(assert (= (and b!888338 (not condMapEmpty!28370)) mapNonEmpty!28370))

(get-info :version)

(assert (= (and mapNonEmpty!28370 ((_ is ValueCellFull!8463) mapValue!28370)) b!888339))

(assert (= (and b!888338 ((_ is ValueCellFull!8463) mapDefault!28370)) b!888340))

(assert (= b!888337 b!888338))

(assert (= start!75490 b!888337))

(declare-fun m!827683 () Bool)

(assert (=> b!888337 m!827683))

(declare-fun m!827685 () Bool)

(assert (=> b!888337 m!827685))

(declare-fun m!827687 () Bool)

(assert (=> mapNonEmpty!28370 m!827687))

(declare-fun m!827689 () Bool)

(assert (=> start!75490 m!827689))

(check-sat (not start!75490) (not mapNonEmpty!28370) (not b!888337) (not b_next!15561) tp_is_empty!17889 b_and!25799)
(check-sat b_and!25799 (not b_next!15561))
