; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12680 () Bool)

(assert start!12680)

(declare-fun b!109645 () Bool)

(declare-fun b_free!2557 () Bool)

(declare-fun b_next!2557 () Bool)

(assert (=> b!109645 (= b_free!2557 (not b_next!2557))))

(declare-fun tp!10010 () Bool)

(declare-fun b_and!6751 () Bool)

(assert (=> b!109645 (= tp!10010 b_and!6751)))

(declare-fun b!109648 () Bool)

(declare-fun b_free!2559 () Bool)

(declare-fun b_next!2559 () Bool)

(assert (=> b!109648 (= b_free!2559 (not b_next!2559))))

(declare-fun tp!10012 () Bool)

(declare-fun b_and!6753 () Bool)

(assert (=> b!109648 (= tp!10012 b_and!6753)))

(declare-fun b!109631 () Bool)

(declare-fun e!71325 () Bool)

(declare-fun e!71333 () Bool)

(assert (=> b!109631 (= e!71325 (not e!71333))))

(declare-fun res!54272 () Bool)

(assert (=> b!109631 (=> res!54272 e!71333)))

(declare-datatypes ((V!3241 0))(
  ( (V!3242 (val!1392 Int)) )
))
(declare-datatypes ((array!4385 0))(
  ( (array!4386 (arr!2079 (Array (_ BitVec 32) (_ BitVec 64))) (size!2336 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1004 0))(
  ( (ValueCellFull!1004 (v!2927 V!3241)) (EmptyCell!1004) )
))
(declare-datatypes ((array!4387 0))(
  ( (array!4388 (arr!2080 (Array (_ BitVec 32) ValueCell!1004)) (size!2337 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!916 0))(
  ( (LongMapFixedSize!917 (defaultEntry!2626 Int) (mask!6794 (_ BitVec 32)) (extraKeys!2423 (_ BitVec 32)) (zeroValue!2497 V!3241) (minValue!2497 V!3241) (_size!507 (_ BitVec 32)) (_keys!4340 array!4385) (_values!2609 array!4387) (_vacant!507 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!716 0))(
  ( (Cell!717 (v!2928 LongMapFixedSize!916)) )
))
(declare-datatypes ((LongMap!716 0))(
  ( (LongMap!717 (underlying!369 Cell!716)) )
))
(declare-fun thiss!992 () LongMap!716)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!109631 (= res!54272 (not (validMask!0 (mask!6794 (v!2928 (underlying!369 thiss!992))))))))

(declare-datatypes ((tuple2!2436 0))(
  ( (tuple2!2437 (_1!1229 (_ BitVec 64)) (_2!1229 V!3241)) )
))
(declare-datatypes ((List!1629 0))(
  ( (Nil!1626) (Cons!1625 (h!2224 tuple2!2436) (t!5762 List!1629)) )
))
(declare-datatypes ((ListLongMap!1589 0))(
  ( (ListLongMap!1590 (toList!810 List!1629)) )
))
(declare-fun lt!56421 () ListLongMap!1589)

(declare-fun lt!56423 () tuple2!2436)

(declare-fun lt!56427 () tuple2!2436)

(declare-fun +!149 (ListLongMap!1589 tuple2!2436) ListLongMap!1589)

(assert (=> b!109631 (= (+!149 (+!149 lt!56421 lt!56423) lt!56427) (+!149 (+!149 lt!56421 lt!56427) lt!56423))))

(assert (=> b!109631 (= lt!56427 (tuple2!2437 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2497 (v!2928 (underlying!369 thiss!992)))))))

(declare-fun lt!56419 () V!3241)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!109631 (= lt!56423 (tuple2!2437 (select (arr!2079 (_keys!4340 (v!2928 (underlying!369 thiss!992)))) from!355) lt!56419))))

(declare-datatypes ((Unit!3400 0))(
  ( (Unit!3401) )
))
(declare-fun lt!56425 () Unit!3400)

(declare-fun addCommutativeForDiffKeys!61 (ListLongMap!1589 (_ BitVec 64) V!3241 (_ BitVec 64) V!3241) Unit!3400)

(assert (=> b!109631 (= lt!56425 (addCommutativeForDiffKeys!61 lt!56421 (select (arr!2079 (_keys!4340 (v!2928 (underlying!369 thiss!992)))) from!355) lt!56419 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2497 (v!2928 (underlying!369 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!115 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3241 V!3241 (_ BitVec 32) Int) ListLongMap!1589)

(assert (=> b!109631 (= lt!56421 (getCurrentListMapNoExtraKeys!115 (_keys!4340 (v!2928 (underlying!369 thiss!992))) (_values!2609 (v!2928 (underlying!369 thiss!992))) (mask!6794 (v!2928 (underlying!369 thiss!992))) (extraKeys!2423 (v!2928 (underlying!369 thiss!992))) (zeroValue!2497 (v!2928 (underlying!369 thiss!992))) (minValue!2497 (v!2928 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2626 (v!2928 (underlying!369 thiss!992)))))))

(declare-fun b!109632 () Bool)

(declare-fun e!71318 () Bool)

(declare-fun tp_is_empty!2695 () Bool)

(assert (=> b!109632 (= e!71318 tp_is_empty!2695)))

(declare-fun b!109633 () Bool)

(declare-fun e!71320 () Unit!3400)

(declare-fun Unit!3402 () Unit!3400)

(assert (=> b!109633 (= e!71320 Unit!3402)))

(declare-fun b!109634 () Bool)

(declare-fun res!54277 () Bool)

(declare-fun e!71319 () Bool)

(assert (=> b!109634 (=> (not res!54277) (not e!71319))))

(declare-fun newMap!16 () LongMapFixedSize!916)

(assert (=> b!109634 (= res!54277 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6794 newMap!16)) (_size!507 (v!2928 (underlying!369 thiss!992)))))))

(declare-fun b!109635 () Bool)

(declare-fun e!71317 () Bool)

(declare-fun e!71329 () Bool)

(assert (=> b!109635 (= e!71317 e!71329)))

(declare-fun res!54274 () Bool)

(assert (=> start!12680 (=> (not res!54274) (not e!71319))))

(declare-fun valid!428 (LongMap!716) Bool)

(assert (=> start!12680 (= res!54274 (valid!428 thiss!992))))

(assert (=> start!12680 e!71319))

(assert (=> start!12680 e!71317))

(assert (=> start!12680 true))

(declare-fun e!71330 () Bool)

(assert (=> start!12680 e!71330))

(declare-fun b!109636 () Bool)

(declare-fun e!71332 () Bool)

(assert (=> b!109636 (= e!71319 e!71332)))

(declare-fun res!54279 () Bool)

(assert (=> b!109636 (=> (not res!54279) (not e!71332))))

(declare-fun lt!56417 () ListLongMap!1589)

(declare-fun lt!56418 () ListLongMap!1589)

(assert (=> b!109636 (= res!54279 (= lt!56417 lt!56418))))

(declare-fun map!1298 (LongMapFixedSize!916) ListLongMap!1589)

(assert (=> b!109636 (= lt!56418 (map!1298 newMap!16))))

(declare-fun getCurrentListMap!495 (array!4385 array!4387 (_ BitVec 32) (_ BitVec 32) V!3241 V!3241 (_ BitVec 32) Int) ListLongMap!1589)

(assert (=> b!109636 (= lt!56417 (getCurrentListMap!495 (_keys!4340 (v!2928 (underlying!369 thiss!992))) (_values!2609 (v!2928 (underlying!369 thiss!992))) (mask!6794 (v!2928 (underlying!369 thiss!992))) (extraKeys!2423 (v!2928 (underlying!369 thiss!992))) (zeroValue!2497 (v!2928 (underlying!369 thiss!992))) (minValue!2497 (v!2928 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2626 (v!2928 (underlying!369 thiss!992)))))))

(declare-fun b!109637 () Bool)

(declare-fun e!71331 () Bool)

(assert (=> b!109637 (= e!71331 tp_is_empty!2695)))

(declare-fun b!109638 () Bool)

(declare-fun e!71324 () Bool)

(declare-fun e!71323 () Bool)

(declare-fun mapRes!3994 () Bool)

(assert (=> b!109638 (= e!71324 (and e!71323 mapRes!3994))))

(declare-fun condMapEmpty!3994 () Bool)

(declare-fun mapDefault!3994 () ValueCell!1004)

