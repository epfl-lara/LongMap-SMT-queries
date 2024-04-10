; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75366 () Bool)

(assert start!75366)

(declare-fun b!887537 () Bool)

(declare-fun b_free!15517 () Bool)

(declare-fun b_next!15517 () Bool)

(assert (=> b!887537 (= b_free!15517 (not b_next!15517))))

(declare-fun tp!54489 () Bool)

(declare-fun b_and!25737 () Bool)

(assert (=> b!887537 (= tp!54489 b_and!25737)))

(declare-fun key!673 () (_ BitVec 64))

(declare-datatypes ((V!28759 0))(
  ( (V!28760 (val!8973 Int)) )
))
(declare-fun lt!401411 () V!28759)

(declare-fun b!887532 () Bool)

(declare-fun e!494272 () Bool)

(declare-datatypes ((ValueCell!8441 0))(
  ( (ValueCellFull!8441 (v!11429 V!28759)) (EmptyCell!8441) )
))
(declare-datatypes ((array!51652 0))(
  ( (array!51653 (arr!24841 (Array (_ BitVec 32) ValueCell!8441)) (size!25281 (_ BitVec 32))) )
))
(declare-datatypes ((array!51654 0))(
  ( (array!51655 (arr!24842 (Array (_ BitVec 32) (_ BitVec 64))) (size!25282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3898 0))(
  ( (LongMapFixedSize!3899 (defaultEntry!5140 Int) (mask!25540 (_ BitVec 32)) (extraKeys!4834 (_ BitVec 32)) (zeroValue!4938 V!28759) (minValue!4938 V!28759) (_size!2004 (_ BitVec 32)) (_keys!9817 array!51654) (_values!5125 array!51652) (_vacant!2004 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1058 0))(
  ( (Cell!1059 (v!11430 LongMapFixedSize!3898)) )
))
(declare-datatypes ((LongMap!1058 0))(
  ( (LongMap!1059 (underlying!540 Cell!1058)) )
))
(declare-fun thiss!833 () LongMap!1058)

(declare-datatypes ((Option!441 0))(
  ( (Some!440 (v!11431 V!28759)) (None!439) )
))
(declare-fun get!13127 (Option!441) V!28759)

(declare-datatypes ((tuple2!11922 0))(
  ( (tuple2!11923 (_1!5972 (_ BitVec 64)) (_2!5972 V!28759)) )
))
(declare-datatypes ((List!17682 0))(
  ( (Nil!17679) (Cons!17678 (h!18809 tuple2!11922) (t!24971 List!17682)) )
))
(declare-fun getValueByKey!435 (List!17682 (_ BitVec 64)) Option!441)

(declare-datatypes ((ListLongMap!10619 0))(
  ( (ListLongMap!10620 (toList!5325 List!17682)) )
))
(declare-fun map!12088 (LongMap!1058) ListLongMap!10619)

(assert (=> b!887532 (= e!494272 (not (= lt!401411 (get!13127 (getValueByKey!435 (toList!5325 (map!12088 thiss!833)) key!673)))))))

(declare-fun b!887533 () Bool)

(declare-fun e!494276 () Bool)

(assert (=> b!887533 (= e!494276 e!494272)))

(declare-fun c!93703 () Bool)

(declare-fun contains!4307 (LongMap!1058 (_ BitVec 64)) Bool)

(assert (=> b!887533 (= c!93703 (contains!4307 thiss!833 key!673))))

(declare-fun apply!394 (LongMapFixedSize!3898 (_ BitVec 64)) V!28759)

(assert (=> b!887533 (= lt!401411 (apply!394 (v!11430 (underlying!540 thiss!833)) key!673))))

(declare-fun res!602165 () Bool)

(assert (=> start!75366 (=> (not res!602165) (not e!494276))))

(declare-fun valid!1519 (LongMap!1058) Bool)

(assert (=> start!75366 (= res!602165 (valid!1519 thiss!833))))

(assert (=> start!75366 e!494276))

(declare-fun e!494274 () Bool)

(assert (=> start!75366 e!494274))

(assert (=> start!75366 true))

(declare-fun b!887534 () Bool)

(declare-fun e!494271 () Bool)

(declare-fun e!494278 () Bool)

(declare-fun mapRes!28291 () Bool)

(assert (=> b!887534 (= e!494271 (and e!494278 mapRes!28291))))

(declare-fun condMapEmpty!28291 () Bool)

(declare-fun mapDefault!28291 () ValueCell!8441)

