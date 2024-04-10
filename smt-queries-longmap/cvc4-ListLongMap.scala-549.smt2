; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14584 () Bool)

(assert start!14584)

(declare-fun b!137888 () Bool)

(declare-fun b_free!2985 () Bool)

(declare-fun b_next!2985 () Bool)

(assert (=> b!137888 (= b_free!2985 (not b_next!2985))))

(declare-fun tp!11418 () Bool)

(declare-fun b_and!8579 () Bool)

(assert (=> b!137888 (= tp!11418 b_and!8579)))

(declare-fun b!137891 () Bool)

(declare-fun b_free!2987 () Bool)

(declare-fun b_next!2987 () Bool)

(assert (=> b!137891 (= b_free!2987 (not b_next!2987))))

(declare-fun tp!11415 () Bool)

(declare-fun b_and!8581 () Bool)

(assert (=> b!137891 (= tp!11415 b_and!8581)))

(declare-fun b!137885 () Bool)

(declare-fun e!89867 () Bool)

(declare-fun e!89874 () Bool)

(assert (=> b!137885 (= e!89867 e!89874)))

(declare-fun res!66065 () Bool)

(assert (=> b!137885 (=> (not res!66065) (not e!89874))))

(declare-datatypes ((V!3525 0))(
  ( (V!3526 (val!1499 Int)) )
))
(declare-datatypes ((array!4849 0))(
  ( (array!4850 (arr!2293 (Array (_ BitVec 32) (_ BitVec 64))) (size!2564 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1111 0))(
  ( (ValueCellFull!1111 (v!3250 V!3525)) (EmptyCell!1111) )
))
(declare-datatypes ((array!4851 0))(
  ( (array!4852 (arr!2294 (Array (_ BitVec 32) ValueCell!1111)) (size!2565 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1130 0))(
  ( (LongMapFixedSize!1131 (defaultEntry!2917 Int) (mask!7245 (_ BitVec 32)) (extraKeys!2674 (_ BitVec 32)) (zeroValue!2768 V!3525) (minValue!2768 V!3525) (_size!614 (_ BitVec 32)) (_keys!4674 array!4849) (_values!2900 array!4851) (_vacant!614 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!918 0))(
  ( (Cell!919 (v!3251 LongMapFixedSize!1130)) )
))
(declare-datatypes ((LongMap!918 0))(
  ( (LongMap!919 (underlying!470 Cell!918)) )
))
(declare-fun thiss!992 () LongMap!918)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2672 0))(
  ( (tuple2!2673 (_1!1347 (_ BitVec 64)) (_2!1347 V!3525)) )
))
(declare-datatypes ((List!1732 0))(
  ( (Nil!1729) (Cons!1728 (h!2335 tuple2!2672) (t!6268 List!1732)) )
))
(declare-datatypes ((ListLongMap!1731 0))(
  ( (ListLongMap!1732 (toList!881 List!1732)) )
))
(declare-fun lt!72040 () ListLongMap!1731)

(declare-fun contains!914 (ListLongMap!1731 (_ BitVec 64)) Bool)

(assert (=> b!137885 (= res!66065 (contains!914 lt!72040 (select (arr!2293 (_keys!4674 (v!3251 (underlying!470 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1130)

(declare-datatypes ((tuple2!2674 0))(
  ( (tuple2!2675 (_1!1348 Bool) (_2!1348 LongMapFixedSize!1130)) )
))
(declare-fun lt!72039 () tuple2!2674)

(declare-fun update!205 (LongMapFixedSize!1130 (_ BitVec 64) V!3525) tuple2!2674)

(declare-fun get!1509 (ValueCell!1111 V!3525) V!3525)

(declare-fun dynLambda!436 (Int (_ BitVec 64)) V!3525)

(assert (=> b!137885 (= lt!72039 (update!205 newMap!16 (select (arr!2293 (_keys!4674 (v!3251 (underlying!470 thiss!992)))) from!355) (get!1509 (select (arr!2294 (_values!2900 (v!3251 (underlying!470 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2917 (v!3251 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137886 () Bool)

(declare-fun e!89881 () Bool)

(declare-fun e!89871 () Bool)

(assert (=> b!137886 (= e!89881 e!89871)))

(declare-fun b!137887 () Bool)

(declare-fun e!89876 () Bool)

(declare-fun tp_is_empty!2909 () Bool)

(assert (=> b!137887 (= e!89876 tp_is_empty!2909)))

(declare-fun e!89878 () Bool)

(declare-fun array_inv!1441 (array!4849) Bool)

(declare-fun array_inv!1442 (array!4851) Bool)

(assert (=> b!137888 (= e!89871 (and tp!11418 tp_is_empty!2909 (array_inv!1441 (_keys!4674 (v!3251 (underlying!470 thiss!992)))) (array_inv!1442 (_values!2900 (v!3251 (underlying!470 thiss!992)))) e!89878))))

(declare-fun b!137889 () Bool)

(declare-fun e!89872 () Bool)

(assert (=> b!137889 (= e!89872 tp_is_empty!2909)))

(declare-fun res!66061 () Bool)

(declare-fun e!89869 () Bool)

(assert (=> start!14584 (=> (not res!66061) (not e!89869))))

(declare-fun valid!546 (LongMap!918) Bool)

(assert (=> start!14584 (= res!66061 (valid!546 thiss!992))))

(assert (=> start!14584 e!89869))

(declare-fun e!89880 () Bool)

(assert (=> start!14584 e!89880))

(assert (=> start!14584 true))

(declare-fun e!89875 () Bool)

(assert (=> start!14584 e!89875))

(declare-fun b!137890 () Bool)

(declare-fun e!89873 () Bool)

(declare-fun mapRes!4758 () Bool)

(assert (=> b!137890 (= e!89878 (and e!89873 mapRes!4758))))

(declare-fun condMapEmpty!4758 () Bool)

(declare-fun mapDefault!4757 () ValueCell!1111)

