; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10514 () Bool)

(assert start!10514)

(declare-fun b!82809 () Bool)

(declare-fun b_free!2221 () Bool)

(declare-fun b_next!2221 () Bool)

(assert (=> b!82809 (= b_free!2221 (not b_next!2221))))

(declare-fun tp!8880 () Bool)

(declare-fun b_and!5039 () Bool)

(assert (=> b!82809 (= tp!8880 b_and!5039)))

(declare-fun b!82815 () Bool)

(declare-fun b_free!2223 () Bool)

(declare-fun b_next!2223 () Bool)

(assert (=> b!82815 (= b_free!2223 (not b_next!2223))))

(declare-fun tp!8882 () Bool)

(declare-fun b_and!5041 () Bool)

(assert (=> b!82815 (= tp!8882 b_and!5041)))

(declare-fun b!82805 () Bool)

(declare-fun res!42911 () Bool)

(declare-fun e!54063 () Bool)

(assert (=> b!82805 (=> (not res!42911) (not e!54063))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3017 0))(
  ( (V!3018 (val!1308 Int)) )
))
(declare-datatypes ((array!4011 0))(
  ( (array!4012 (arr!1911 (Array (_ BitVec 32) (_ BitVec 64))) (size!2154 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!920 0))(
  ( (ValueCellFull!920 (v!2627 V!3017)) (EmptyCell!920) )
))
(declare-datatypes ((array!4013 0))(
  ( (array!4014 (arr!1912 (Array (_ BitVec 32) ValueCell!920)) (size!2155 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!748 0))(
  ( (LongMapFixedSize!749 (defaultEntry!2316 Int) (mask!6334 (_ BitVec 32)) (extraKeys!2159 (_ BitVec 32)) (zeroValue!2210 V!3017) (minValue!2210 V!3017) (_size!423 (_ BitVec 32)) (_keys!3984 array!4011) (_values!2299 array!4013) (_vacant!423 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!550 0))(
  ( (Cell!551 (v!2628 LongMapFixedSize!748)) )
))
(declare-datatypes ((LongMap!550 0))(
  ( (LongMap!551 (underlying!286 Cell!550)) )
))
(declare-fun thiss!992 () LongMap!550)

(assert (=> b!82805 (= res!42911 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2154 (_keys!3984 (v!2628 (underlying!286 thiss!992)))))))))

(declare-fun b!82806 () Bool)

(declare-fun e!54065 () Bool)

(declare-fun tp_is_empty!2527 () Bool)

(assert (=> b!82806 (= e!54065 tp_is_empty!2527)))

(declare-fun mapNonEmpty!3367 () Bool)

(declare-fun mapRes!3368 () Bool)

(declare-fun tp!8881 () Bool)

(assert (=> mapNonEmpty!3367 (= mapRes!3368 (and tp!8881 e!54065))))

(declare-fun mapValue!3367 () ValueCell!920)

(declare-fun mapRest!3368 () (Array (_ BitVec 32) ValueCell!920))

(declare-fun newMap!16 () LongMapFixedSize!748)

(declare-fun mapKey!3368 () (_ BitVec 32))

(assert (=> mapNonEmpty!3367 (= (arr!1912 (_values!2299 newMap!16)) (store mapRest!3368 mapKey!3368 mapValue!3367))))

(declare-fun b!82807 () Bool)

(declare-fun e!54056 () Bool)

(declare-fun e!54073 () Bool)

(assert (=> b!82807 (= e!54056 (not e!54073))))

(declare-fun res!42906 () Bool)

(assert (=> b!82807 (=> res!42906 e!54073)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!82807 (= res!42906 (not (validMask!0 (mask!6334 (v!2628 (underlying!286 thiss!992))))))))

(declare-datatypes ((tuple2!2186 0))(
  ( (tuple2!2187 (_1!1104 (_ BitVec 64)) (_2!1104 V!3017)) )
))
(declare-datatypes ((List!1515 0))(
  ( (Nil!1512) (Cons!1511 (h!2101 tuple2!2186) (t!5211 List!1515)) )
))
(declare-datatypes ((ListLongMap!1455 0))(
  ( (ListLongMap!1456 (toList!743 List!1515)) )
))
(declare-fun lt!38800 () ListLongMap!1455)

(declare-fun lt!38796 () tuple2!2186)

(declare-fun lt!38811 () tuple2!2186)

(declare-fun lt!38805 () ListLongMap!1455)

(declare-fun +!108 (ListLongMap!1455 tuple2!2186) ListLongMap!1455)

(assert (=> b!82807 (= (+!108 lt!38805 lt!38796) (+!108 (+!108 lt!38800 lt!38796) lt!38811))))

(assert (=> b!82807 (= lt!38796 (tuple2!2187 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2210 (v!2628 (underlying!286 thiss!992)))))))

(declare-fun lt!38799 () V!3017)

(declare-datatypes ((Unit!2427 0))(
  ( (Unit!2428) )
))
(declare-fun lt!38798 () Unit!2427)

(declare-fun addCommutativeForDiffKeys!27 (ListLongMap!1455 (_ BitVec 64) V!3017 (_ BitVec 64) V!3017) Unit!2427)

(assert (=> b!82807 (= lt!38798 (addCommutativeForDiffKeys!27 lt!38800 (select (arr!1911 (_keys!3984 (v!2628 (underlying!286 thiss!992)))) from!355) lt!38799 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2210 (v!2628 (underlying!286 thiss!992)))))))

(declare-fun lt!38806 () ListLongMap!1455)

(assert (=> b!82807 (= lt!38806 lt!38805)))

(assert (=> b!82807 (= lt!38805 (+!108 lt!38800 lt!38811))))

(declare-fun lt!38797 () ListLongMap!1455)

(declare-fun lt!38812 () tuple2!2186)

(assert (=> b!82807 (= lt!38806 (+!108 lt!38797 lt!38812))))

(declare-fun lt!38795 () ListLongMap!1455)

(assert (=> b!82807 (= lt!38800 (+!108 lt!38795 lt!38812))))

(assert (=> b!82807 (= lt!38812 (tuple2!2187 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2210 (v!2628 (underlying!286 thiss!992)))))))

(assert (=> b!82807 (= lt!38797 (+!108 lt!38795 lt!38811))))

(assert (=> b!82807 (= lt!38811 (tuple2!2187 (select (arr!1911 (_keys!3984 (v!2628 (underlying!286 thiss!992)))) from!355) lt!38799))))

(declare-fun lt!38807 () Unit!2427)

(assert (=> b!82807 (= lt!38807 (addCommutativeForDiffKeys!27 lt!38795 (select (arr!1911 (_keys!3984 (v!2628 (underlying!286 thiss!992)))) from!355) lt!38799 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2210 (v!2628 (underlying!286 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!73 (array!4011 array!4013 (_ BitVec 32) (_ BitVec 32) V!3017 V!3017 (_ BitVec 32) Int) ListLongMap!1455)

(assert (=> b!82807 (= lt!38795 (getCurrentListMapNoExtraKeys!73 (_keys!3984 (v!2628 (underlying!286 thiss!992))) (_values!2299 (v!2628 (underlying!286 thiss!992))) (mask!6334 (v!2628 (underlying!286 thiss!992))) (extraKeys!2159 (v!2628 (underlying!286 thiss!992))) (zeroValue!2210 (v!2628 (underlying!286 thiss!992))) (minValue!2210 (v!2628 (underlying!286 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2316 (v!2628 (underlying!286 thiss!992)))))))

(declare-fun b!82808 () Bool)

(declare-fun e!54067 () Bool)

(declare-fun e!54069 () Bool)

(assert (=> b!82808 (= e!54067 e!54069)))

(declare-fun mapIsEmpty!3367 () Bool)

(assert (=> mapIsEmpty!3367 mapRes!3368))

(declare-fun e!54072 () Bool)

(declare-fun e!54061 () Bool)

(declare-fun array_inv!1181 (array!4011) Bool)

(declare-fun array_inv!1182 (array!4013) Bool)

(assert (=> b!82809 (= e!54072 (and tp!8880 tp_is_empty!2527 (array_inv!1181 (_keys!3984 (v!2628 (underlying!286 thiss!992)))) (array_inv!1182 (_values!2299 (v!2628 (underlying!286 thiss!992)))) e!54061))))

(declare-fun b!82810 () Bool)

(declare-fun e!54066 () Bool)

(declare-fun mapRes!3367 () Bool)

(assert (=> b!82810 (= e!54061 (and e!54066 mapRes!3367))))

(declare-fun condMapEmpty!3367 () Bool)

(declare-fun mapDefault!3367 () ValueCell!920)

