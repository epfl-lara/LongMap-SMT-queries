; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14706 () Bool)

(assert start!14706)

(declare-fun b!139194 () Bool)

(declare-fun b_free!3021 () Bool)

(declare-fun b_next!3021 () Bool)

(assert (=> b!139194 (= b_free!3021 (not b_next!3021))))

(declare-fun tp!11535 () Bool)

(declare-fun b_and!8679 () Bool)

(assert (=> b!139194 (= tp!11535 b_and!8679)))

(declare-fun b!139190 () Bool)

(declare-fun b_free!3023 () Bool)

(declare-fun b_next!3023 () Bool)

(assert (=> b!139190 (= b_free!3023 (not b_next!3023))))

(declare-fun tp!11536 () Bool)

(declare-fun b_and!8681 () Bool)

(assert (=> b!139190 (= tp!11536 b_and!8681)))

(declare-fun b!139185 () Bool)

(declare-fun e!90787 () Bool)

(declare-fun e!90780 () Bool)

(assert (=> b!139185 (= e!90787 e!90780)))

(declare-fun res!66596 () Bool)

(assert (=> b!139185 (=> (not res!66596) (not e!90780))))

(declare-datatypes ((V!3549 0))(
  ( (V!3550 (val!1508 Int)) )
))
(declare-datatypes ((array!4889 0))(
  ( (array!4890 (arr!2311 (Array (_ BitVec 32) (_ BitVec 64))) (size!2583 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1120 0))(
  ( (ValueCellFull!1120 (v!3275 V!3549)) (EmptyCell!1120) )
))
(declare-datatypes ((array!4891 0))(
  ( (array!4892 (arr!2312 (Array (_ BitVec 32) ValueCell!1120)) (size!2584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1148 0))(
  ( (LongMapFixedSize!1149 (defaultEntry!2938 Int) (mask!7276 (_ BitVec 32)) (extraKeys!2693 (_ BitVec 32)) (zeroValue!2788 V!3549) (minValue!2788 V!3549) (_size!623 (_ BitVec 32)) (_keys!4697 array!4889) (_values!2921 array!4891) (_vacant!623 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!934 0))(
  ( (Cell!935 (v!3276 LongMapFixedSize!1148)) )
))
(declare-datatypes ((LongMap!934 0))(
  ( (LongMap!935 (underlying!478 Cell!934)) )
))
(declare-fun thiss!992 () LongMap!934)

(declare-datatypes ((tuple2!2694 0))(
  ( (tuple2!2695 (_1!1358 (_ BitVec 64)) (_2!1358 V!3549)) )
))
(declare-datatypes ((List!1743 0))(
  ( (Nil!1740) (Cons!1739 (h!2346 tuple2!2694) (t!6319 List!1743)) )
))
(declare-datatypes ((ListLongMap!1743 0))(
  ( (ListLongMap!1744 (toList!887 List!1743)) )
))
(declare-fun lt!72793 () ListLongMap!1743)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!922 (ListLongMap!1743 (_ BitVec 64)) Bool)

(assert (=> b!139185 (= res!66596 (contains!922 lt!72793 (select (arr!2311 (_keys!4697 (v!3276 (underlying!478 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2696 0))(
  ( (tuple2!2697 (_1!1359 Bool) (_2!1359 LongMapFixedSize!1148)) )
))
(declare-fun lt!72797 () tuple2!2696)

(declare-fun newMap!16 () LongMapFixedSize!1148)

(declare-fun update!210 (LongMapFixedSize!1148 (_ BitVec 64) V!3549) tuple2!2696)

(declare-fun get!1525 (ValueCell!1120 V!3549) V!3549)

(declare-fun dynLambda!441 (Int (_ BitVec 64)) V!3549)

(assert (=> b!139185 (= lt!72797 (update!210 newMap!16 (select (arr!2311 (_keys!4697 (v!3276 (underlying!478 thiss!992)))) from!355) (get!1525 (select (arr!2312 (_values!2921 (v!3276 (underlying!478 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2938 (v!3276 (underlying!478 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!66595 () Bool)

(declare-fun e!90776 () Bool)

(assert (=> start!14706 (=> (not res!66595) (not e!90776))))

(declare-fun valid!555 (LongMap!934) Bool)

(assert (=> start!14706 (= res!66595 (valid!555 thiss!992))))

(assert (=> start!14706 e!90776))

(declare-fun e!90775 () Bool)

(assert (=> start!14706 e!90775))

(assert (=> start!14706 true))

(declare-fun e!90778 () Bool)

(assert (=> start!14706 e!90778))

(declare-fun mapIsEmpty!4821 () Bool)

(declare-fun mapRes!4822 () Bool)

(assert (=> mapIsEmpty!4821 mapRes!4822))

(declare-fun b!139186 () Bool)

(declare-fun e!90785 () Bool)

(declare-fun tp_is_empty!2927 () Bool)

(assert (=> b!139186 (= e!90785 tp_is_empty!2927)))

(declare-fun b!139187 () Bool)

(declare-fun e!90784 () Bool)

(assert (=> b!139187 (= e!90775 e!90784)))

(declare-fun b!139188 () Bool)

(declare-fun e!90774 () Bool)

(declare-fun e!90783 () Bool)

(assert (=> b!139188 (= e!90774 (and e!90783 mapRes!4822))))

(declare-fun condMapEmpty!4821 () Bool)

(declare-fun mapDefault!4822 () ValueCell!1120)

