; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17010 () Bool)

(assert start!17010)

(declare-fun b!170909 () Bool)

(declare-fun b_free!4235 () Bool)

(declare-fun b_next!4235 () Bool)

(assert (=> b!170909 (= b_free!4235 (not b_next!4235))))

(declare-fun tp!15334 () Bool)

(declare-fun b_and!10649 () Bool)

(assert (=> b!170909 (= tp!15334 b_and!10649)))

(declare-fun b!170908 () Bool)

(declare-fun e!112839 () Bool)

(declare-fun tp_is_empty!4007 () Bool)

(assert (=> b!170908 (= e!112839 tp_is_empty!4007)))

(declare-datatypes ((V!4989 0))(
  ( (V!4990 (val!2048 Int)) )
))
(declare-datatypes ((ValueCell!1660 0))(
  ( (ValueCellFull!1660 (v!3913 V!4989)) (EmptyCell!1660) )
))
(declare-datatypes ((array!7127 0))(
  ( (array!7128 (arr!3391 (Array (_ BitVec 32) (_ BitVec 64))) (size!3684 (_ BitVec 32))) )
))
(declare-datatypes ((array!7129 0))(
  ( (array!7130 (arr!3392 (Array (_ BitVec 32) ValueCell!1660)) (size!3685 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2228 0))(
  ( (LongMapFixedSize!2229 (defaultEntry!3556 Int) (mask!8384 (_ BitVec 32)) (extraKeys!3297 (_ BitVec 32)) (zeroValue!3399 V!4989) (minValue!3399 V!4989) (_size!1163 (_ BitVec 32)) (_keys!5388 array!7127) (_values!3539 array!7129) (_vacant!1163 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2228)

(declare-fun e!112838 () Bool)

(declare-fun e!112842 () Bool)

(declare-fun array_inv!2171 (array!7127) Bool)

(declare-fun array_inv!2172 (array!7129) Bool)

(assert (=> b!170909 (= e!112842 (and tp!15334 tp_is_empty!4007 (array_inv!2171 (_keys!5388 thiss!1248)) (array_inv!2172 (_values!3539 thiss!1248)) e!112838))))

(declare-fun mapIsEmpty!6803 () Bool)

(declare-fun mapRes!6803 () Bool)

(assert (=> mapIsEmpty!6803 mapRes!6803))

(declare-fun b!170910 () Bool)

(declare-fun e!112837 () Bool)

(declare-fun e!112840 () Bool)

(assert (=> b!170910 (= e!112837 e!112840)))

(declare-fun res!81254 () Bool)

(assert (=> b!170910 (=> (not res!81254) (not e!112840))))

(declare-datatypes ((tuple2!3236 0))(
  ( (tuple2!3237 (_1!1629 (_ BitVec 64)) (_2!1629 V!4989)) )
))
(declare-datatypes ((List!2194 0))(
  ( (Nil!2191) (Cons!2190 (h!2807 tuple2!3236) (t!6996 List!2194)) )
))
(declare-datatypes ((ListLongMap!2163 0))(
  ( (ListLongMap!2164 (toList!1097 List!2194)) )
))
(declare-fun lt!85054 () ListLongMap!2163)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1145 (ListLongMap!2163 (_ BitVec 64)) Bool)

(assert (=> b!170910 (= res!81254 (contains!1145 lt!85054 key!828))))

(declare-fun lt!85053 () LongMapFixedSize!2228)

(declare-fun map!1854 (LongMapFixedSize!2228) ListLongMap!2163)

(assert (=> b!170910 (= lt!85054 (map!1854 lt!85053))))

(declare-fun b!170911 () Bool)

(declare-fun res!81253 () Bool)

(declare-fun e!112835 () Bool)

(assert (=> b!170911 (=> (not res!81253) (not e!112835))))

(assert (=> b!170911 (= res!81253 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6803 () Bool)

(declare-fun tp!15335 () Bool)

(declare-fun e!112841 () Bool)

(assert (=> mapNonEmpty!6803 (= mapRes!6803 (and tp!15335 e!112841))))

(declare-fun mapKey!6803 () (_ BitVec 32))

(declare-fun mapValue!6803 () ValueCell!1660)

(declare-fun mapRest!6803 () (Array (_ BitVec 32) ValueCell!1660))

(assert (=> mapNonEmpty!6803 (= (arr!3392 (_values!3539 thiss!1248)) (store mapRest!6803 mapKey!6803 mapValue!6803))))

(declare-fun b!170912 () Bool)

(assert (=> b!170912 (= e!112838 (and e!112839 mapRes!6803))))

(declare-fun condMapEmpty!6803 () Bool)

(declare-fun mapDefault!6803 () ValueCell!1660)

