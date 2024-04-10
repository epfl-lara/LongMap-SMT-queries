; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15062 () Bool)

(assert start!15062)

(declare-fun b!144582 () Bool)

(declare-fun b_free!3061 () Bool)

(declare-fun b_next!3061 () Bool)

(assert (=> b!144582 (= b_free!3061 (not b_next!3061))))

(declare-fun tp!11676 () Bool)

(declare-fun b_and!9007 () Bool)

(assert (=> b!144582 (= tp!11676 b_and!9007)))

(declare-fun b!144564 () Bool)

(declare-fun b_free!3063 () Bool)

(declare-fun b_next!3063 () Bool)

(assert (=> b!144564 (= b_free!3063 (not b_next!3063))))

(declare-fun tp!11675 () Bool)

(declare-fun b_and!9009 () Bool)

(assert (=> b!144564 (= tp!11675 b_and!9009)))

(declare-fun b!144563 () Bool)

(declare-fun res!68866 () Bool)

(declare-fun e!94212 () Bool)

(assert (=> b!144563 (=> (not res!68866) (not e!94212))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3577 0))(
  ( (V!3578 (val!1518 Int)) )
))
(declare-datatypes ((array!4935 0))(
  ( (array!4936 (arr!2331 (Array (_ BitVec 32) (_ BitVec 64))) (size!2606 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1130 0))(
  ( (ValueCellFull!1130 (v!3317 V!3577)) (EmptyCell!1130) )
))
(declare-datatypes ((array!4937 0))(
  ( (array!4938 (arr!2332 (Array (_ BitVec 32) ValueCell!1130)) (size!2607 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1168 0))(
  ( (LongMapFixedSize!1169 (defaultEntry!2988 Int) (mask!7352 (_ BitVec 32)) (extraKeys!2735 (_ BitVec 32)) (zeroValue!2834 V!3577) (minValue!2834 V!3577) (_size!633 (_ BitVec 32)) (_keys!4755 array!4935) (_values!2971 array!4937) (_vacant!633 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!952 0))(
  ( (Cell!953 (v!3318 LongMapFixedSize!1168)) )
))
(declare-datatypes ((LongMap!952 0))(
  ( (LongMap!953 (underlying!487 Cell!952)) )
))
(declare-fun thiss!992 () LongMap!952)

(assert (=> b!144563 (= res!68866 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2606 (_keys!4755 (v!3318 (underlying!487 thiss!992)))))))))

(declare-fun mapIsEmpty!4903 () Bool)

(declare-fun mapRes!4903 () Bool)

(assert (=> mapIsEmpty!4903 mapRes!4903))

(declare-fun mapNonEmpty!4903 () Bool)

(declare-fun mapRes!4904 () Bool)

(declare-fun tp!11677 () Bool)

(declare-fun e!94209 () Bool)

(assert (=> mapNonEmpty!4903 (= mapRes!4904 (and tp!11677 e!94209))))

(declare-fun mapValue!4903 () ValueCell!1130)

(declare-fun mapRest!4903 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapKey!4903 () (_ BitVec 32))

(assert (=> mapNonEmpty!4903 (= (arr!2332 (_values!2971 (v!3318 (underlying!487 thiss!992)))) (store mapRest!4903 mapKey!4903 mapValue!4903))))

(declare-fun e!94206 () Bool)

(declare-fun e!94210 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1168)

(declare-fun tp_is_empty!2947 () Bool)

(declare-fun array_inv!1467 (array!4935) Bool)

(declare-fun array_inv!1468 (array!4937) Bool)

(assert (=> b!144564 (= e!94210 (and tp!11675 tp_is_empty!2947 (array_inv!1467 (_keys!4755 newMap!16)) (array_inv!1468 (_values!2971 newMap!16)) e!94206))))

(declare-fun b!144565 () Bool)

(declare-fun res!68862 () Bool)

(declare-fun e!94218 () Bool)

(assert (=> b!144565 (=> res!68862 e!94218)))

(declare-datatypes ((List!1756 0))(
  ( (Nil!1753) (Cons!1752 (h!2360 (_ BitVec 64)) (t!6397 List!1756)) )
))
(declare-fun lt!75936 () List!1756)

(declare-fun noDuplicate!54 (List!1756) Bool)

(assert (=> b!144565 (= res!68862 (not (noDuplicate!54 lt!75936)))))

(declare-fun b!144566 () Bool)

(declare-fun e!94220 () Bool)

(assert (=> b!144566 (= e!94220 tp_is_empty!2947)))

(declare-fun b!144567 () Bool)

(declare-fun e!94211 () Bool)

(assert (=> b!144567 (= e!94211 tp_is_empty!2947)))

(declare-fun b!144568 () Bool)

(declare-fun e!94214 () Bool)

(declare-fun e!94219 () Bool)

(assert (=> b!144568 (= e!94214 e!94219)))

(declare-fun res!68868 () Bool)

(assert (=> b!144568 (=> (not res!68868) (not e!94219))))

(declare-datatypes ((tuple2!2718 0))(
  ( (tuple2!2719 (_1!1370 (_ BitVec 64)) (_2!1370 V!3577)) )
))
(declare-datatypes ((List!1757 0))(
  ( (Nil!1754) (Cons!1753 (h!2361 tuple2!2718) (t!6398 List!1757)) )
))
(declare-datatypes ((ListLongMap!1755 0))(
  ( (ListLongMap!1756 (toList!893 List!1757)) )
))
(declare-fun lt!75939 () ListLongMap!1755)

(declare-fun contains!935 (ListLongMap!1755 (_ BitVec 64)) Bool)

(assert (=> b!144568 (= res!68868 (contains!935 lt!75939 (select (arr!2331 (_keys!4755 (v!3318 (underlying!487 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2720 0))(
  ( (tuple2!2721 (_1!1371 Bool) (_2!1371 LongMapFixedSize!1168)) )
))
(declare-fun lt!75935 () tuple2!2720)

(declare-fun update!216 (LongMapFixedSize!1168 (_ BitVec 64) V!3577) tuple2!2720)

(declare-fun get!1548 (ValueCell!1130 V!3577) V!3577)

(declare-fun dynLambda!447 (Int (_ BitVec 64)) V!3577)

(assert (=> b!144568 (= lt!75935 (update!216 newMap!16 (select (arr!2331 (_keys!4755 (v!3318 (underlying!487 thiss!992)))) from!355) (get!1548 (select (arr!2332 (_values!2971 (v!3318 (underlying!487 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!2988 (v!3318 (underlying!487 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!144569 () Bool)

(declare-fun e!94216 () Bool)

(declare-fun e!94207 () Bool)

(assert (=> b!144569 (= e!94216 e!94207)))

(declare-fun b!144570 () Bool)

(declare-fun e!94215 () Bool)

(assert (=> b!144570 (= e!94215 (and e!94211 mapRes!4904))))

(declare-fun condMapEmpty!4904 () Bool)

(declare-fun mapDefault!4904 () ValueCell!1130)

