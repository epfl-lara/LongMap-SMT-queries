; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3116 () Bool)

(assert start!3116)

(declare-fun b!19003 () Bool)

(declare-fun b_free!659 () Bool)

(declare-fun b_next!659 () Bool)

(assert (=> b!19003 (= b_free!659 (not b_next!659))))

(declare-fun tp!3172 () Bool)

(declare-fun b_and!1319 () Bool)

(assert (=> b!19003 (= tp!3172 b_and!1319)))

(declare-fun mapNonEmpty!823 () Bool)

(declare-fun mapRes!823 () Bool)

(declare-fun tp!3171 () Bool)

(declare-fun e!12195 () Bool)

(assert (=> mapNonEmpty!823 (= mapRes!823 (and tp!3171 e!12195))))

(declare-datatypes ((V!1055 0))(
  ( (V!1056 (val!488 Int)) )
))
(declare-datatypes ((ValueCell!262 0))(
  ( (ValueCellFull!262 (v!1489 V!1055)) (EmptyCell!262) )
))
(declare-fun mapValue!823 () ValueCell!262)

(declare-datatypes ((array!1053 0))(
  ( (array!1054 (arr!507 (Array (_ BitVec 32) ValueCell!262)) (size!597 (_ BitVec 32))) )
))
(declare-datatypes ((array!1055 0))(
  ( (array!1056 (arr!508 (Array (_ BitVec 32) (_ BitVec 64))) (size!598 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!110 0))(
  ( (LongMapFixedSize!111 (defaultEntry!1674 Int) (mask!4611 (_ BitVec 32)) (extraKeys!1584 (_ BitVec 32)) (zeroValue!1608 V!1055) (minValue!1608 V!1055) (_size!88 (_ BitVec 32)) (_keys!3099 array!1055) (_values!1670 array!1053) (_vacant!88 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!110 0))(
  ( (Cell!111 (v!1490 LongMapFixedSize!110)) )
))
(declare-datatypes ((LongMap!110 0))(
  ( (LongMap!111 (underlying!66 Cell!110)) )
))
(declare-fun thiss!848 () LongMap!110)

(declare-fun mapKey!823 () (_ BitVec 32))

(declare-fun mapRest!823 () (Array (_ BitVec 32) ValueCell!262))

(assert (=> mapNonEmpty!823 (= (arr!507 (_values!1670 (v!1490 (underlying!66 thiss!848)))) (store mapRest!823 mapKey!823 mapValue!823))))

(declare-fun b!18996 () Bool)

(declare-fun e!12189 () Bool)

(declare-fun e!12188 () Bool)

(assert (=> b!18996 (= e!12189 e!12188)))

(declare-fun res!13051 () Bool)

(assert (=> b!18996 (=> res!13051 e!12188)))

(declare-datatypes ((tuple2!810 0))(
  ( (tuple2!811 (_1!407 Bool) (_2!407 LongMap!110)) )
))
(declare-fun lt!5358 () tuple2!810)

(declare-fun valid!51 (LongMap!110) Bool)

(assert (=> b!18996 (= res!13051 (not (valid!51 (_2!407 lt!5358))))))

(declare-fun res!13049 () Bool)

(declare-fun e!12193 () Bool)

(assert (=> start!3116 (=> (not res!13049) (not e!12193))))

(assert (=> start!3116 (= res!13049 (valid!51 thiss!848))))

(assert (=> start!3116 e!12193))

(declare-fun e!12194 () Bool)

(assert (=> start!3116 e!12194))

(declare-fun mapIsEmpty!823 () Bool)

(assert (=> mapIsEmpty!823 mapRes!823))

(declare-fun b!18997 () Bool)

(declare-fun e!12187 () Bool)

(assert (=> b!18997 (= e!12194 e!12187)))

(declare-fun b!18998 () Bool)

(declare-fun e!12197 () tuple2!810)

(declare-fun repack!27 (LongMap!110) tuple2!810)

(assert (=> b!18998 (= e!12197 (repack!27 thiss!848))))

(declare-fun b!18999 () Bool)

(declare-fun e!12192 () Bool)

(assert (=> b!18999 (= e!12187 e!12192)))

(declare-fun b!19000 () Bool)

(declare-datatypes ((tuple2!812 0))(
  ( (tuple2!813 (_1!408 (_ BitVec 64)) (_2!408 V!1055)) )
))
(declare-datatypes ((List!543 0))(
  ( (Nil!540) (Cons!539 (h!1105 tuple2!812) (t!3186 List!543)) )
))
(declare-datatypes ((ListLongMap!543 0))(
  ( (ListLongMap!544 (toList!287 List!543)) )
))
(declare-fun map!360 (LongMap!110) ListLongMap!543)

(assert (=> b!19000 (= e!12188 (not (= (map!360 (_2!407 lt!5358)) (map!360 thiss!848))))))

(declare-fun b!19001 () Bool)

(declare-fun tp_is_empty!923 () Bool)

(assert (=> b!19001 (= e!12195 tp_is_empty!923)))

(declare-fun b!19002 () Bool)

(declare-fun e!12196 () Bool)

(declare-fun e!12191 () Bool)

(assert (=> b!19002 (= e!12196 (and e!12191 mapRes!823))))

(declare-fun condMapEmpty!823 () Bool)

(declare-fun mapDefault!823 () ValueCell!262)

