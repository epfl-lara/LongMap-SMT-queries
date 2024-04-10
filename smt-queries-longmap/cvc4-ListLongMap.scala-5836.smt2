; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75370 () Bool)

(assert start!75370)

(declare-fun b!887594 () Bool)

(declare-fun b_free!15521 () Bool)

(declare-fun b_next!15521 () Bool)

(assert (=> b!887594 (= b_free!15521 (not b_next!15521))))

(declare-fun tp!54500 () Bool)

(declare-fun b_and!25745 () Bool)

(assert (=> b!887594 (= tp!54500 b_and!25745)))

(declare-fun key!673 () (_ BitVec 64))

(declare-fun b!887590 () Bool)

(declare-datatypes ((V!28763 0))(
  ( (V!28764 (val!8975 Int)) )
))
(declare-fun lt!401417 () V!28763)

(declare-datatypes ((ValueCell!8443 0))(
  ( (ValueCellFull!8443 (v!11435 V!28763)) (EmptyCell!8443) )
))
(declare-datatypes ((array!51660 0))(
  ( (array!51661 (arr!24845 (Array (_ BitVec 32) ValueCell!8443)) (size!25285 (_ BitVec 32))) )
))
(declare-datatypes ((array!51662 0))(
  ( (array!51663 (arr!24846 (Array (_ BitVec 32) (_ BitVec 64))) (size!25286 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3902 0))(
  ( (LongMapFixedSize!3903 (defaultEntry!5142 Int) (mask!25542 (_ BitVec 32)) (extraKeys!4836 (_ BitVec 32)) (zeroValue!4940 V!28763) (minValue!4940 V!28763) (_size!2006 (_ BitVec 32)) (_keys!9819 array!51662) (_values!5127 array!51660) (_vacant!2006 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1062 0))(
  ( (Cell!1063 (v!11436 LongMapFixedSize!3902)) )
))
(declare-datatypes ((LongMap!1062 0))(
  ( (LongMap!1063 (underlying!542 Cell!1062)) )
))
(declare-fun thiss!833 () LongMap!1062)

(declare-fun e!494333 () Bool)

(declare-datatypes ((Option!443 0))(
  ( (Some!442 (v!11437 V!28763)) (None!441) )
))
(declare-fun get!13129 (Option!443) V!28763)

(declare-datatypes ((tuple2!11926 0))(
  ( (tuple2!11927 (_1!5974 (_ BitVec 64)) (_2!5974 V!28763)) )
))
(declare-datatypes ((List!17684 0))(
  ( (Nil!17681) (Cons!17680 (h!18811 tuple2!11926) (t!24977 List!17684)) )
))
(declare-fun getValueByKey!437 (List!17684 (_ BitVec 64)) Option!443)

(declare-datatypes ((ListLongMap!10623 0))(
  ( (ListLongMap!10624 (toList!5327 List!17684)) )
))
(declare-fun map!12090 (LongMap!1062) ListLongMap!10623)

(assert (=> b!887590 (= e!494333 (not (= lt!401417 (get!13129 (getValueByKey!437 (toList!5327 (map!12090 thiss!833)) key!673)))))))

(declare-fun mapIsEmpty!28297 () Bool)

(declare-fun mapRes!28297 () Bool)

(assert (=> mapIsEmpty!28297 mapRes!28297))

(declare-fun b!887591 () Bool)

(declare-fun e!494329 () Bool)

(assert (=> b!887591 (= e!494329 e!494333)))

(declare-fun c!93709 () Bool)

(declare-fun contains!4309 (LongMap!1062 (_ BitVec 64)) Bool)

(assert (=> b!887591 (= c!93709 (contains!4309 thiss!833 key!673))))

(declare-fun apply!396 (LongMapFixedSize!3902 (_ BitVec 64)) V!28763)

(assert (=> b!887591 (= lt!401417 (apply!396 (v!11436 (underlying!542 thiss!833)) key!673))))

(declare-fun mapNonEmpty!28297 () Bool)

(declare-fun tp!54501 () Bool)

(declare-fun e!494327 () Bool)

(assert (=> mapNonEmpty!28297 (= mapRes!28297 (and tp!54501 e!494327))))

(declare-fun mapRest!28297 () (Array (_ BitVec 32) ValueCell!8443))

(declare-fun mapValue!28297 () ValueCell!8443)

(declare-fun mapKey!28297 () (_ BitVec 32))

(assert (=> mapNonEmpty!28297 (= (arr!24845 (_values!5127 (v!11436 (underlying!542 thiss!833)))) (store mapRest!28297 mapKey!28297 mapValue!28297))))

(declare-fun b!887592 () Bool)

(declare-fun e!494325 () Bool)

(declare-fun e!494330 () Bool)

(assert (=> b!887592 (= e!494325 e!494330)))

(declare-fun b!887593 () Bool)

(declare-fun e!494332 () Bool)

(assert (=> b!887593 (= e!494330 e!494332)))

(declare-fun tp_is_empty!17849 () Bool)

(declare-fun e!494326 () Bool)

(declare-fun array_inv!19554 (array!51662) Bool)

(declare-fun array_inv!19555 (array!51660) Bool)

(assert (=> b!887594 (= e!494332 (and tp!54500 tp_is_empty!17849 (array_inv!19554 (_keys!9819 (v!11436 (underlying!542 thiss!833)))) (array_inv!19555 (_values!5127 (v!11436 (underlying!542 thiss!833)))) e!494326))))

(declare-fun b!887595 () Bool)

(declare-fun e!494331 () Bool)

(assert (=> b!887595 (= e!494331 tp_is_empty!17849)))

(declare-fun b!887596 () Bool)

(declare-fun dynLambda!1288 (Int (_ BitVec 64)) V!28763)

(assert (=> b!887596 (= e!494333 (not (= lt!401417 (dynLambda!1288 (defaultEntry!5142 (v!11436 (underlying!542 thiss!833))) key!673))))))

(declare-fun res!602171 () Bool)

(assert (=> start!75370 (=> (not res!602171) (not e!494329))))

(declare-fun valid!1521 (LongMap!1062) Bool)

(assert (=> start!75370 (= res!602171 (valid!1521 thiss!833))))

(assert (=> start!75370 e!494329))

(assert (=> start!75370 e!494325))

(assert (=> start!75370 true))

(declare-fun b!887597 () Bool)

(assert (=> b!887597 (= e!494327 tp_is_empty!17849)))

(declare-fun b!887598 () Bool)

(assert (=> b!887598 (= e!494326 (and e!494331 mapRes!28297))))

(declare-fun condMapEmpty!28297 () Bool)

(declare-fun mapDefault!28297 () ValueCell!8443)

