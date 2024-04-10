; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15218 () Bool)

(assert start!15218)

(declare-fun b!146678 () Bool)

(declare-fun b_free!3141 () Bool)

(declare-fun b_next!3141 () Bool)

(assert (=> b!146678 (= b_free!3141 (not b_next!3141))))

(declare-fun tp!11928 () Bool)

(declare-fun b_and!9199 () Bool)

(assert (=> b!146678 (= tp!11928 b_and!9199)))

(declare-fun b!146681 () Bool)

(declare-fun b_free!3143 () Bool)

(declare-fun b_next!3143 () Bool)

(assert (=> b!146681 (= b_free!3143 (not b_next!3143))))

(declare-fun tp!11925 () Bool)

(declare-fun b_and!9201 () Bool)

(assert (=> b!146681 (= tp!11925 b_and!9201)))

(declare-fun e!95779 () Bool)

(declare-datatypes ((V!3629 0))(
  ( (V!3630 (val!1538 Int)) )
))
(declare-datatypes ((array!5019 0))(
  ( (array!5020 (arr!2371 (Array (_ BitVec 32) (_ BitVec 64))) (size!2647 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1150 0))(
  ( (ValueCellFull!1150 (v!3365 V!3629)) (EmptyCell!1150) )
))
(declare-datatypes ((array!5021 0))(
  ( (array!5022 (arr!2372 (Array (_ BitVec 32) ValueCell!1150)) (size!2648 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1208 0))(
  ( (LongMapFixedSize!1209 (defaultEntry!3020 Int) (mask!7400 (_ BitVec 32)) (extraKeys!2765 (_ BitVec 32)) (zeroValue!2865 V!3629) (minValue!2865 V!3629) (_size!653 (_ BitVec 32)) (_keys!4789 array!5019) (_values!3003 array!5021) (_vacant!653 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!990 0))(
  ( (Cell!991 (v!3366 LongMapFixedSize!1208)) )
))
(declare-datatypes ((LongMap!990 0))(
  ( (LongMap!991 (underlying!506 Cell!990)) )
))
(declare-fun thiss!992 () LongMap!990)

(declare-fun tp_is_empty!2987 () Bool)

(declare-fun e!95772 () Bool)

(declare-fun array_inv!1491 (array!5019) Bool)

(declare-fun array_inv!1492 (array!5021) Bool)

(assert (=> b!146678 (= e!95779 (and tp!11928 tp_is_empty!2987 (array_inv!1491 (_keys!4789 (v!3366 (underlying!506 thiss!992)))) (array_inv!1492 (_values!3003 (v!3366 (underlying!506 thiss!992)))) e!95772))))

(declare-fun b!146679 () Bool)

(declare-fun e!95780 () Bool)

(assert (=> b!146679 (= e!95780 tp_is_empty!2987)))

(declare-fun b!146680 () Bool)

(declare-fun e!95773 () Bool)

(assert (=> b!146680 (= e!95773 tp_is_empty!2987)))

(declare-fun e!95783 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1208)

(declare-fun e!95784 () Bool)

(assert (=> b!146681 (= e!95784 (and tp!11925 tp_is_empty!2987 (array_inv!1491 (_keys!4789 newMap!16)) (array_inv!1492 (_values!3003 newMap!16)) e!95783))))

(declare-fun b!146682 () Bool)

(declare-datatypes ((Unit!4637 0))(
  ( (Unit!4638) )
))
(declare-fun e!95788 () Unit!4637)

(declare-fun Unit!4639 () Unit!4637)

(assert (=> b!146682 (= e!95788 Unit!4639)))

(declare-fun b!146683 () Bool)

(declare-fun e!95781 () Bool)

(declare-fun e!95777 () Bool)

(assert (=> b!146683 (= e!95781 e!95777)))

(declare-fun res!69769 () Bool)

(assert (=> b!146683 (=> (not res!69769) (not e!95777))))

(declare-datatypes ((tuple2!2774 0))(
  ( (tuple2!2775 (_1!1398 Bool) (_2!1398 LongMapFixedSize!1208)) )
))
(declare-fun lt!77249 () tuple2!2774)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146683 (= res!69769 (and (_1!1398 lt!77249) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77259 () Unit!4637)

(assert (=> b!146683 (= lt!77259 e!95788)))

(declare-datatypes ((tuple2!2776 0))(
  ( (tuple2!2777 (_1!1399 (_ BitVec 64)) (_2!1399 V!3629)) )
))
(declare-datatypes ((List!1785 0))(
  ( (Nil!1782) (Cons!1781 (h!2389 tuple2!2776) (t!6510 List!1785)) )
))
(declare-datatypes ((ListLongMap!1785 0))(
  ( (ListLongMap!1786 (toList!908 List!1785)) )
))
(declare-fun lt!77252 () ListLongMap!1785)

(declare-fun c!27647 () Bool)

(declare-fun contains!953 (ListLongMap!1785 (_ BitVec 64)) Bool)

(assert (=> b!146683 (= c!27647 (contains!953 lt!77252 (select (arr!2371 (_keys!4789 (v!3366 (underlying!506 thiss!992)))) from!355)))))

(declare-fun lt!77263 () V!3629)

(declare-fun update!228 (LongMapFixedSize!1208 (_ BitVec 64) V!3629) tuple2!2774)

(assert (=> b!146683 (= lt!77249 (update!228 newMap!16 (select (arr!2371 (_keys!4789 (v!3366 (underlying!506 thiss!992)))) from!355) lt!77263))))

(declare-fun b!146684 () Bool)

(declare-fun res!69770 () Bool)

(declare-fun e!95775 () Bool)

(assert (=> b!146684 (=> (not res!69770) (not e!95775))))

(assert (=> b!146684 (= res!69770 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2647 (_keys!4789 (v!3366 (underlying!506 thiss!992)))))))))

(declare-fun b!146685 () Bool)

(declare-fun e!95782 () Bool)

(declare-fun lt!77257 () tuple2!2774)

(declare-fun map!1476 (LongMapFixedSize!1208) ListLongMap!1785)

(assert (=> b!146685 (= e!95782 (= (map!1476 (_2!1398 lt!77257)) (map!1476 (v!3366 (underlying!506 thiss!992)))))))

(declare-fun b!146686 () Bool)

(declare-fun mapRes!5034 () Bool)

(assert (=> b!146686 (= e!95783 (and e!95773 mapRes!5034))))

(declare-fun condMapEmpty!5033 () Bool)

(declare-fun mapDefault!5034 () ValueCell!1150)

