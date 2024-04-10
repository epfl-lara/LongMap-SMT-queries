; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15266 () Bool)

(assert start!15266)

(declare-fun b!147393 () Bool)

(declare-fun b_free!3165 () Bool)

(declare-fun b_next!3165 () Bool)

(assert (=> b!147393 (= b_free!3165 (not b_next!3165))))

(declare-fun tp!12003 () Bool)

(declare-fun b_and!9267 () Bool)

(assert (=> b!147393 (= tp!12003 b_and!9267)))

(declare-fun b!147391 () Bool)

(declare-fun b_free!3167 () Bool)

(declare-fun b_next!3167 () Bool)

(assert (=> b!147391 (= b_free!3167 (not b_next!3167))))

(declare-fun tp!12004 () Bool)

(declare-fun b_and!9269 () Bool)

(assert (=> b!147391 (= tp!12004 b_and!9269)))

(declare-fun b!147390 () Bool)

(declare-fun e!96281 () Bool)

(declare-fun tp_is_empty!2999 () Bool)

(assert (=> b!147390 (= e!96281 tp_is_empty!2999)))

(declare-fun e!96282 () Bool)

(declare-fun e!96289 () Bool)

(declare-datatypes ((V!3645 0))(
  ( (V!3646 (val!1544 Int)) )
))
(declare-datatypes ((array!5045 0))(
  ( (array!5046 (arr!2383 (Array (_ BitVec 32) (_ BitVec 64))) (size!2659 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1156 0))(
  ( (ValueCellFull!1156 (v!3379 V!3645)) (EmptyCell!1156) )
))
(declare-datatypes ((array!5047 0))(
  ( (array!5048 (arr!2384 (Array (_ BitVec 32) ValueCell!1156)) (size!2660 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1220 0))(
  ( (LongMapFixedSize!1221 (defaultEntry!3029 Int) (mask!7413 (_ BitVec 32)) (extraKeys!2774 (_ BitVec 32)) (zeroValue!2874 V!3645) (minValue!2874 V!3645) (_size!659 (_ BitVec 32)) (_keys!4798 array!5045) (_values!3012 array!5047) (_vacant!659 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1220)

(declare-fun array_inv!1499 (array!5045) Bool)

(declare-fun array_inv!1500 (array!5047) Bool)

(assert (=> b!147391 (= e!96289 (and tp!12004 tp_is_empty!2999 (array_inv!1499 (_keys!4798 newMap!16)) (array_inv!1500 (_values!3012 newMap!16)) e!96282))))

(declare-fun b!147392 () Bool)

(declare-datatypes ((Unit!4661 0))(
  ( (Unit!4662) )
))
(declare-fun e!96296 () Unit!4661)

(declare-fun Unit!4663 () Unit!4661)

(assert (=> b!147392 (= e!96296 Unit!4663)))

(declare-fun e!96291 () Bool)

(declare-datatypes ((Cell!1002 0))(
  ( (Cell!1003 (v!3380 LongMapFixedSize!1220)) )
))
(declare-datatypes ((LongMap!1002 0))(
  ( (LongMap!1003 (underlying!512 Cell!1002)) )
))
(declare-fun thiss!992 () LongMap!1002)

(declare-fun e!96288 () Bool)

(assert (=> b!147393 (= e!96288 (and tp!12003 tp_is_empty!2999 (array_inv!1499 (_keys!4798 (v!3380 (underlying!512 thiss!992)))) (array_inv!1500 (_values!3012 (v!3380 (underlying!512 thiss!992)))) e!96291))))

(declare-fun b!147394 () Bool)

(declare-fun e!96285 () Bool)

(declare-fun e!96286 () Bool)

(assert (=> b!147394 (= e!96285 e!96286)))

(declare-fun b!147395 () Bool)

(declare-fun e!96283 () Bool)

(assert (=> b!147395 (= e!96283 (not true))))

(declare-datatypes ((tuple2!2792 0))(
  ( (tuple2!2793 (_1!1407 (_ BitVec 64)) (_2!1407 V!3645)) )
))
(declare-datatypes ((List!1792 0))(
  ( (Nil!1789) (Cons!1788 (h!2396 tuple2!2792) (t!6541 List!1792)) )
))
(declare-datatypes ((ListLongMap!1795 0))(
  ( (ListLongMap!1796 (toList!913 List!1792)) )
))
(declare-fun lt!77781 () ListLongMap!1795)

(declare-fun lt!77780 () tuple2!2792)

(declare-fun lt!77785 () tuple2!2792)

(declare-fun +!189 (ListLongMap!1795 tuple2!2792) ListLongMap!1795)

(assert (=> b!147395 (= (+!189 (+!189 lt!77781 lt!77780) lt!77785) (+!189 (+!189 lt!77781 lt!77785) lt!77780))))

(assert (=> b!147395 (= lt!77785 (tuple2!2793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2874 (v!3380 (underlying!512 thiss!992)))))))

(declare-fun lt!77788 () V!3645)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!147395 (= lt!77780 (tuple2!2793 (select (arr!2383 (_keys!4798 (v!3380 (underlying!512 thiss!992)))) from!355) lt!77788))))

(declare-fun lt!77783 () Unit!4661)

(declare-fun addCommutativeForDiffKeys!82 (ListLongMap!1795 (_ BitVec 64) V!3645 (_ BitVec 64) V!3645) Unit!4661)

(assert (=> b!147395 (= lt!77783 (addCommutativeForDiffKeys!82 lt!77781 (select (arr!2383 (_keys!4798 (v!3380 (underlying!512 thiss!992)))) from!355) lt!77788 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2874 (v!3380 (underlying!512 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!158 (array!5045 array!5047 (_ BitVec 32) (_ BitVec 32) V!3645 V!3645 (_ BitVec 32) Int) ListLongMap!1795)

(assert (=> b!147395 (= lt!77781 (getCurrentListMapNoExtraKeys!158 (_keys!4798 (v!3380 (underlying!512 thiss!992))) (_values!3012 (v!3380 (underlying!512 thiss!992))) (mask!7413 (v!3380 (underlying!512 thiss!992))) (extraKeys!2774 (v!3380 (underlying!512 thiss!992))) (zeroValue!2874 (v!3380 (underlying!512 thiss!992))) (minValue!2874 (v!3380 (underlying!512 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3029 (v!3380 (underlying!512 thiss!992)))))))

(declare-fun b!147396 () Bool)

(declare-fun res!70036 () Bool)

(declare-fun e!96290 () Bool)

(assert (=> b!147396 (=> (not res!70036) (not e!96290))))

(assert (=> b!147396 (= res!70036 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7413 newMap!16)) (_size!659 (v!3380 (underlying!512 thiss!992)))))))

(declare-fun mapNonEmpty!5073 () Bool)

(declare-fun mapRes!5073 () Bool)

(declare-fun tp!12001 () Bool)

(assert (=> mapNonEmpty!5073 (= mapRes!5073 (and tp!12001 e!96281))))

(declare-fun mapKey!5073 () (_ BitVec 32))

(declare-fun mapRest!5074 () (Array (_ BitVec 32) ValueCell!1156))

(declare-fun mapValue!5074 () ValueCell!1156)

(assert (=> mapNonEmpty!5073 (= (arr!2384 (_values!3012 (v!3380 (underlying!512 thiss!992)))) (store mapRest!5074 mapKey!5073 mapValue!5074))))

(declare-fun mapNonEmpty!5074 () Bool)

(declare-fun mapRes!5074 () Bool)

(declare-fun tp!12002 () Bool)

(declare-fun e!96280 () Bool)

(assert (=> mapNonEmpty!5074 (= mapRes!5074 (and tp!12002 e!96280))))

(declare-fun mapKey!5074 () (_ BitVec 32))

(declare-fun mapRest!5073 () (Array (_ BitVec 32) ValueCell!1156))

(declare-fun mapValue!5073 () ValueCell!1156)

(assert (=> mapNonEmpty!5074 (= (arr!2384 (_values!3012 newMap!16)) (store mapRest!5073 mapKey!5074 mapValue!5073))))

(declare-fun b!147398 () Bool)

(assert (=> b!147398 (= e!96280 tp_is_empty!2999)))

(declare-fun b!147399 () Bool)

(declare-fun e!96287 () Bool)

(assert (=> b!147399 (= e!96282 (and e!96287 mapRes!5074))))

(declare-fun condMapEmpty!5073 () Bool)

(declare-fun mapDefault!5073 () ValueCell!1156)

