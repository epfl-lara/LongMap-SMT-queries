; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14586 () Bool)

(assert start!14586)

(declare-fun b!137941 () Bool)

(declare-fun b_free!2989 () Bool)

(declare-fun b_next!2989 () Bool)

(assert (=> b!137941 (= b_free!2989 (not b_next!2989))))

(declare-fun tp!11430 () Bool)

(declare-fun b_and!8587 () Bool)

(assert (=> b!137941 (= tp!11430 b_and!8587)))

(declare-fun b!137945 () Bool)

(declare-fun b_free!2991 () Bool)

(declare-fun b_next!2991 () Bool)

(assert (=> b!137945 (= b_free!2991 (not b_next!2991))))

(declare-fun tp!11428 () Bool)

(declare-fun b_and!8589 () Bool)

(assert (=> b!137945 (= tp!11428 b_and!8589)))

(declare-fun b!137937 () Bool)

(declare-fun e!89920 () Bool)

(declare-fun e!89918 () Bool)

(assert (=> b!137937 (= e!89920 e!89918)))

(declare-fun res!66082 () Bool)

(assert (=> b!137937 (=> (not res!66082) (not e!89918))))

(declare-datatypes ((V!3529 0))(
  ( (V!3530 (val!1500 Int)) )
))
(declare-datatypes ((tuple2!2676 0))(
  ( (tuple2!2677 (_1!1349 (_ BitVec 64)) (_2!1349 V!3529)) )
))
(declare-datatypes ((List!1733 0))(
  ( (Nil!1730) (Cons!1729 (h!2336 tuple2!2676) (t!6273 List!1733)) )
))
(declare-datatypes ((ListLongMap!1733 0))(
  ( (ListLongMap!1734 (toList!882 List!1733)) )
))
(declare-fun lt!72049 () ListLongMap!1733)

(declare-datatypes ((array!4853 0))(
  ( (array!4854 (arr!2295 (Array (_ BitVec 32) (_ BitVec 64))) (size!2566 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1112 0))(
  ( (ValueCellFull!1112 (v!3252 V!3529)) (EmptyCell!1112) )
))
(declare-datatypes ((array!4855 0))(
  ( (array!4856 (arr!2296 (Array (_ BitVec 32) ValueCell!1112)) (size!2567 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1132 0))(
  ( (LongMapFixedSize!1133 (defaultEntry!2918 Int) (mask!7248 (_ BitVec 32)) (extraKeys!2675 (_ BitVec 32)) (zeroValue!2769 V!3529) (minValue!2769 V!3529) (_size!615 (_ BitVec 32)) (_keys!4675 array!4853) (_values!2901 array!4855) (_vacant!615 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!920 0))(
  ( (Cell!921 (v!3253 LongMapFixedSize!1132)) )
))
(declare-datatypes ((LongMap!920 0))(
  ( (LongMap!921 (underlying!471 Cell!920)) )
))
(declare-fun thiss!992 () LongMap!920)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!915 (ListLongMap!1733 (_ BitVec 64)) Bool)

(assert (=> b!137937 (= res!66082 (contains!915 lt!72049 (select (arr!2295 (_keys!4675 (v!3253 (underlying!471 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2678 0))(
  ( (tuple2!2679 (_1!1350 Bool) (_2!1350 LongMapFixedSize!1132)) )
))
(declare-fun lt!72050 () tuple2!2678)

(declare-fun newMap!16 () LongMapFixedSize!1132)

(declare-fun update!206 (LongMapFixedSize!1132 (_ BitVec 64) V!3529) tuple2!2678)

(declare-fun get!1512 (ValueCell!1112 V!3529) V!3529)

(declare-fun dynLambda!437 (Int (_ BitVec 64)) V!3529)

(assert (=> b!137937 (= lt!72050 (update!206 newMap!16 (select (arr!2295 (_keys!4675 (v!3253 (underlying!471 thiss!992)))) from!355) (get!1512 (select (arr!2296 (_values!2901 (v!3253 (underlying!471 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2918 (v!3253 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137938 () Bool)

(declare-fun e!89914 () Bool)

(declare-fun tp_is_empty!2911 () Bool)

(assert (=> b!137938 (= e!89914 tp_is_empty!2911)))

(declare-fun b!137939 () Bool)

(declare-fun e!89916 () Bool)

(declare-datatypes ((List!1734 0))(
  ( (Nil!1731) (Cons!1730 (h!2337 (_ BitVec 64)) (t!6274 List!1734)) )
))
(declare-fun arrayNoDuplicates!0 (array!4853 (_ BitVec 32) List!1734) Bool)

(assert (=> b!137939 (= e!89916 (arrayNoDuplicates!0 (_keys!4675 (v!3253 (underlying!471 thiss!992))) #b00000000000000000000000000000000 Nil!1731))))

(declare-fun b!137940 () Bool)

(declare-fun e!89921 () Bool)

(assert (=> b!137940 (= e!89921 tp_is_empty!2911)))

(declare-fun e!89915 () Bool)

(declare-fun e!89926 () Bool)

(declare-fun array_inv!1443 (array!4853) Bool)

(declare-fun array_inv!1444 (array!4855) Bool)

(assert (=> b!137941 (= e!89915 (and tp!11430 tp_is_empty!2911 (array_inv!1443 (_keys!4675 (v!3253 (underlying!471 thiss!992)))) (array_inv!1444 (_values!2901 (v!3253 (underlying!471 thiss!992)))) e!89926))))

(declare-fun mapNonEmpty!4763 () Bool)

(declare-fun mapRes!4763 () Bool)

(declare-fun tp!11429 () Bool)

(assert (=> mapNonEmpty!4763 (= mapRes!4763 (and tp!11429 e!89921))))

(declare-fun mapValue!4764 () ValueCell!1112)

(declare-fun mapKey!4763 () (_ BitVec 32))

(declare-fun mapRest!4763 () (Array (_ BitVec 32) ValueCell!1112))

(assert (=> mapNonEmpty!4763 (= (arr!2296 (_values!2901 (v!3253 (underlying!471 thiss!992)))) (store mapRest!4763 mapKey!4763 mapValue!4764))))

(declare-fun b!137942 () Bool)

(declare-fun res!66081 () Bool)

(declare-fun e!89922 () Bool)

(assert (=> b!137942 (=> (not res!66081) (not e!89922))))

(assert (=> b!137942 (= res!66081 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2566 (_keys!4675 (v!3253 (underlying!471 thiss!992)))))))))

(declare-fun b!137943 () Bool)

(declare-fun e!89929 () Bool)

(assert (=> b!137943 (= e!89929 e!89915)))

(declare-fun b!137944 () Bool)

(declare-fun e!89919 () Bool)

(assert (=> b!137944 (= e!89919 e!89929)))

(declare-fun e!89925 () Bool)

(declare-fun e!89917 () Bool)

(assert (=> b!137945 (= e!89917 (and tp!11428 tp_is_empty!2911 (array_inv!1443 (_keys!4675 newMap!16)) (array_inv!1444 (_values!2901 newMap!16)) e!89925))))

(declare-fun b!137946 () Bool)

(declare-fun e!89928 () Bool)

(assert (=> b!137946 (= e!89928 tp_is_empty!2911)))

(declare-fun mapIsEmpty!4763 () Bool)

(declare-fun mapRes!4764 () Bool)

(assert (=> mapIsEmpty!4763 mapRes!4764))

(declare-fun b!137947 () Bool)

(declare-fun res!66080 () Bool)

(assert (=> b!137947 (=> (not res!66080) (not e!89922))))

(assert (=> b!137947 (= res!66080 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7248 newMap!16)) (_size!615 (v!3253 (underlying!471 thiss!992)))))))

(declare-fun mapNonEmpty!4764 () Bool)

(declare-fun tp!11427 () Bool)

(assert (=> mapNonEmpty!4764 (= mapRes!4764 (and tp!11427 e!89928))))

(declare-fun mapRest!4764 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapValue!4763 () ValueCell!1112)

(declare-fun mapKey!4764 () (_ BitVec 32))

(assert (=> mapNonEmpty!4764 (= (arr!2296 (_values!2901 newMap!16)) (store mapRest!4764 mapKey!4764 mapValue!4763))))

(declare-fun b!137948 () Bool)

(declare-fun e!89924 () Bool)

(assert (=> b!137948 (= e!89924 tp_is_empty!2911)))

(declare-fun b!137949 () Bool)

(assert (=> b!137949 (= e!89926 (and e!89914 mapRes!4763))))

(declare-fun condMapEmpty!4764 () Bool)

(declare-fun mapDefault!4763 () ValueCell!1112)

