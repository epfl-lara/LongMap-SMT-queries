; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90760 () Bool)

(assert start!90760)

(declare-fun b!1037650 () Bool)

(declare-fun b_free!20911 () Bool)

(declare-fun b_next!20911 () Bool)

(assert (=> b!1037650 (= b_free!20911 (not b_next!20911))))

(declare-fun tp!73884 () Bool)

(declare-fun b_and!33443 () Bool)

(assert (=> b!1037650 (= tp!73884 b_and!33443)))

(declare-fun mapNonEmpty!38481 () Bool)

(declare-fun mapRes!38481 () Bool)

(declare-fun tp!73885 () Bool)

(declare-fun e!587018 () Bool)

(assert (=> mapNonEmpty!38481 (= mapRes!38481 (and tp!73885 e!587018))))

(declare-fun mapKey!38481 () (_ BitVec 32))

(declare-datatypes ((V!37715 0))(
  ( (V!37716 (val!12366 Int)) )
))
(declare-datatypes ((ValueCell!11612 0))(
  ( (ValueCellFull!11612 (v!14949 V!37715)) (EmptyCell!11612) )
))
(declare-fun mapValue!38481 () ValueCell!11612)

(declare-datatypes ((array!65370 0))(
  ( (array!65371 (arr!31465 (Array (_ BitVec 32) (_ BitVec 64))) (size!31995 (_ BitVec 32))) )
))
(declare-datatypes ((array!65372 0))(
  ( (array!65373 (arr!31466 (Array (_ BitVec 32) ValueCell!11612)) (size!31996 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5818 0))(
  ( (LongMapFixedSize!5819 (defaultEntry!6291 Int) (mask!30216 (_ BitVec 32)) (extraKeys!6019 (_ BitVec 32)) (zeroValue!6125 V!37715) (minValue!6125 V!37715) (_size!2964 (_ BitVec 32)) (_keys!11489 array!65370) (_values!6314 array!65372) (_vacant!2964 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5818)

(declare-fun mapRest!38481 () (Array (_ BitVec 32) ValueCell!11612))

(assert (=> mapNonEmpty!38481 (= (arr!31466 (_values!6314 thiss!1427)) (store mapRest!38481 mapKey!38481 mapValue!38481))))

(declare-fun b!1037648 () Bool)

(declare-fun res!692276 () Bool)

(declare-fun e!587017 () Bool)

(assert (=> b!1037648 (=> (not res!692276) (not e!587017))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037648 (= res!692276 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037649 () Bool)

(declare-fun e!587014 () Bool)

(declare-fun e!587015 () Bool)

(assert (=> b!1037649 (= e!587014 (and e!587015 mapRes!38481))))

(declare-fun condMapEmpty!38481 () Bool)

(declare-fun mapDefault!38481 () ValueCell!11612)

