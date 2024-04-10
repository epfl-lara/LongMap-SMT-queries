; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15256 () Bool)

(assert start!15256)

(declare-fun b!147114 () Bool)

(declare-fun b_free!3145 () Bool)

(declare-fun b_next!3145 () Bool)

(assert (=> b!147114 (= b_free!3145 (not b_next!3145))))

(declare-fun tp!11942 () Bool)

(declare-fun b_and!9227 () Bool)

(assert (=> b!147114 (= tp!11942 b_and!9227)))

(declare-fun b!147118 () Bool)

(declare-fun b_free!3147 () Bool)

(declare-fun b_next!3147 () Bool)

(assert (=> b!147118 (= b_free!3147 (not b_next!3147))))

(declare-fun tp!11944 () Bool)

(declare-fun b_and!9229 () Bool)

(assert (=> b!147118 (= tp!11944 b_and!9229)))

(declare-fun b!147102 () Bool)

(declare-fun e!96039 () Bool)

(declare-fun e!96041 () Bool)

(assert (=> b!147102 (= e!96039 e!96041)))

(declare-fun b!147103 () Bool)

(declare-fun e!96040 () Bool)

(declare-fun e!96033 () Bool)

(assert (=> b!147103 (= e!96040 e!96033)))

(declare-fun res!69935 () Bool)

(assert (=> b!147103 (=> (not res!69935) (not e!96033))))

(declare-datatypes ((V!3633 0))(
  ( (V!3634 (val!1539 Int)) )
))
(declare-datatypes ((array!5025 0))(
  ( (array!5026 (arr!2373 (Array (_ BitVec 32) (_ BitVec 64))) (size!2649 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1151 0))(
  ( (ValueCellFull!1151 (v!3369 V!3633)) (EmptyCell!1151) )
))
(declare-datatypes ((array!5027 0))(
  ( (array!5028 (arr!2374 (Array (_ BitVec 32) ValueCell!1151)) (size!2650 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1210 0))(
  ( (LongMapFixedSize!1211 (defaultEntry!3024 Int) (mask!7406 (_ BitVec 32)) (extraKeys!2769 (_ BitVec 32)) (zeroValue!2869 V!3633) (minValue!2869 V!3633) (_size!654 (_ BitVec 32)) (_keys!4793 array!5025) (_values!3007 array!5027) (_vacant!654 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!992 0))(
  ( (Cell!993 (v!3370 LongMapFixedSize!1210)) )
))
(declare-datatypes ((LongMap!992 0))(
  ( (LongMap!993 (underlying!507 Cell!992)) )
))
(declare-fun thiss!992 () LongMap!992)

(declare-datatypes ((tuple2!2778 0))(
  ( (tuple2!2779 (_1!1400 (_ BitVec 64)) (_2!1400 V!3633)) )
))
(declare-datatypes ((List!1786 0))(
  ( (Nil!1783) (Cons!1782 (h!2390 tuple2!2778) (t!6515 List!1786)) )
))
(declare-datatypes ((ListLongMap!1787 0))(
  ( (ListLongMap!1788 (toList!909 List!1786)) )
))
(declare-fun lt!77631 () ListLongMap!1787)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!77628 () ListLongMap!1787)

(assert (=> b!147103 (= res!69935 (and (= lt!77631 lt!77628) (not (= (select (arr!2373 (_keys!4793 (v!3370 (underlying!507 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2373 (_keys!4793 (v!3370 (underlying!507 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1210)

(declare-fun map!1479 (LongMapFixedSize!1210) ListLongMap!1787)

(assert (=> b!147103 (= lt!77628 (map!1479 newMap!16))))

(declare-fun getCurrentListMap!577 (array!5025 array!5027 (_ BitVec 32) (_ BitVec 32) V!3633 V!3633 (_ BitVec 32) Int) ListLongMap!1787)

(assert (=> b!147103 (= lt!77631 (getCurrentListMap!577 (_keys!4793 (v!3370 (underlying!507 thiss!992))) (_values!3007 (v!3370 (underlying!507 thiss!992))) (mask!7406 (v!3370 (underlying!507 thiss!992))) (extraKeys!2769 (v!3370 (underlying!507 thiss!992))) (zeroValue!2869 (v!3370 (underlying!507 thiss!992))) (minValue!2869 (v!3370 (underlying!507 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3024 (v!3370 (underlying!507 thiss!992)))))))

(declare-fun b!147104 () Bool)

(declare-datatypes ((Unit!4647 0))(
  ( (Unit!4648) )
))
(declare-fun e!96034 () Unit!4647)

(declare-fun Unit!4649 () Unit!4647)

(assert (=> b!147104 (= e!96034 Unit!4649)))

(declare-fun mapNonEmpty!5043 () Bool)

(declare-fun mapRes!5044 () Bool)

(declare-fun tp!11943 () Bool)

(declare-fun e!96038 () Bool)

(assert (=> mapNonEmpty!5043 (= mapRes!5044 (and tp!11943 e!96038))))

(declare-fun mapRest!5043 () (Array (_ BitVec 32) ValueCell!1151))

(declare-fun mapValue!5043 () ValueCell!1151)

(declare-fun mapKey!5043 () (_ BitVec 32))

(assert (=> mapNonEmpty!5043 (= (arr!2374 (_values!3007 newMap!16)) (store mapRest!5043 mapKey!5043 mapValue!5043))))

(declare-fun b!147105 () Bool)

(declare-fun e!96047 () Bool)

(assert (=> b!147105 (= e!96033 e!96047)))

(declare-fun res!69939 () Bool)

(assert (=> b!147105 (=> (not res!69939) (not e!96047))))

(declare-datatypes ((tuple2!2780 0))(
  ( (tuple2!2781 (_1!1401 Bool) (_2!1401 LongMapFixedSize!1210)) )
))
(declare-fun lt!77634 () tuple2!2780)

(assert (=> b!147105 (= res!69939 (and (_1!1401 lt!77634) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77635 () Unit!4647)

(assert (=> b!147105 (= lt!77635 e!96034)))

(declare-fun c!27755 () Bool)

(declare-fun contains!956 (ListLongMap!1787 (_ BitVec 64)) Bool)

(assert (=> b!147105 (= c!27755 (contains!956 lt!77628 (select (arr!2373 (_keys!4793 (v!3370 (underlying!507 thiss!992)))) from!355)))))

(declare-fun update!229 (LongMapFixedSize!1210 (_ BitVec 64) V!3633) tuple2!2780)

(declare-fun get!1583 (ValueCell!1151 V!3633) V!3633)

(declare-fun dynLambda!461 (Int (_ BitVec 64)) V!3633)

(assert (=> b!147105 (= lt!77634 (update!229 newMap!16 (select (arr!2373 (_keys!4793 (v!3370 (underlying!507 thiss!992)))) from!355) (get!1583 (select (arr!2374 (_values!3007 (v!3370 (underlying!507 thiss!992)))) from!355) (dynLambda!461 (defaultEntry!3024 (v!3370 (underlying!507 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!147106 () Bool)

(declare-fun res!69938 () Bool)

(assert (=> b!147106 (=> (not res!69938) (not e!96040))))

(assert (=> b!147106 (= res!69938 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2649 (_keys!4793 (v!3370 (underlying!507 thiss!992)))))))))

(declare-fun mapIsEmpty!5043 () Bool)

(assert (=> mapIsEmpty!5043 mapRes!5044))

(declare-fun b!147107 () Bool)

(declare-fun res!69936 () Bool)

(assert (=> b!147107 (=> (not res!69936) (not e!96040))))

(assert (=> b!147107 (= res!69936 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7406 newMap!16)) (_size!654 (v!3370 (underlying!507 thiss!992)))))))

(declare-fun b!147108 () Bool)

(declare-fun res!69937 () Bool)

(assert (=> b!147108 (=> (not res!69937) (not e!96040))))

(declare-fun valid!590 (LongMapFixedSize!1210) Bool)

(assert (=> b!147108 (= res!69937 (valid!590 newMap!16))))

(declare-fun b!147109 () Bool)

(declare-fun e!96035 () Bool)

(assert (=> b!147109 (= e!96041 e!96035)))

(declare-fun mapNonEmpty!5044 () Bool)

(declare-fun mapRes!5043 () Bool)

(declare-fun tp!11941 () Bool)

(declare-fun e!96045 () Bool)

(assert (=> mapNonEmpty!5044 (= mapRes!5043 (and tp!11941 e!96045))))

(declare-fun mapValue!5044 () ValueCell!1151)

(declare-fun mapKey!5044 () (_ BitVec 32))

(declare-fun mapRest!5044 () (Array (_ BitVec 32) ValueCell!1151))

(assert (=> mapNonEmpty!5044 (= (arr!2374 (_values!3007 (v!3370 (underlying!507 thiss!992)))) (store mapRest!5044 mapKey!5044 mapValue!5044))))

(declare-fun b!147110 () Bool)

(declare-fun e!96042 () Bool)

(declare-fun tp_is_empty!2989 () Bool)

(assert (=> b!147110 (= e!96042 tp_is_empty!2989)))

(declare-fun res!69934 () Bool)

(assert (=> start!15256 (=> (not res!69934) (not e!96040))))

(declare-fun valid!591 (LongMap!992) Bool)

(assert (=> start!15256 (= res!69934 (valid!591 thiss!992))))

(assert (=> start!15256 e!96040))

(assert (=> start!15256 e!96039))

(assert (=> start!15256 true))

(declare-fun e!96043 () Bool)

(assert (=> start!15256 e!96043))

(declare-fun b!147111 () Bool)

(declare-fun e!96044 () Bool)

(declare-fun e!96036 () Bool)

(assert (=> b!147111 (= e!96044 (and e!96036 mapRes!5044))))

(declare-fun condMapEmpty!5043 () Bool)

(declare-fun mapDefault!5044 () ValueCell!1151)

