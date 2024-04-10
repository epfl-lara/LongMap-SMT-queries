; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80374 () Bool)

(assert start!80374)

(declare-fun b!943938 () Bool)

(declare-fun b_free!18017 () Bool)

(declare-fun b_next!18017 () Bool)

(assert (=> b!943938 (= b_free!18017 (not b_next!18017))))

(declare-fun tp!62560 () Bool)

(declare-fun b_and!29435 () Bool)

(assert (=> b!943938 (= tp!62560 b_and!29435)))

(declare-fun b!943937 () Bool)

(declare-fun res!634147 () Bool)

(declare-fun e!530759 () Bool)

(assert (=> b!943937 (=> (not res!634147) (not e!530759))))

(declare-datatypes ((V!32331 0))(
  ( (V!32332 (val!10313 Int)) )
))
(declare-datatypes ((ValueCell!9781 0))(
  ( (ValueCellFull!9781 (v!12845 V!32331)) (EmptyCell!9781) )
))
(declare-datatypes ((array!57018 0))(
  ( (array!57019 (arr!27434 (Array (_ BitVec 32) ValueCell!9781)) (size!27900 (_ BitVec 32))) )
))
(declare-datatypes ((array!57020 0))(
  ( (array!57021 (arr!27435 (Array (_ BitVec 32) (_ BitVec 64))) (size!27901 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4712 0))(
  ( (LongMapFixedSize!4713 (defaultEntry!5651 Int) (mask!27289 (_ BitVec 32)) (extraKeys!5383 (_ BitVec 32)) (zeroValue!5487 V!32331) (minValue!5487 V!32331) (_size!2411 (_ BitVec 32)) (_keys!10529 array!57020) (_values!5674 array!57018) (_vacant!2411 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4712)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13452 0))(
  ( (tuple2!13453 (_1!6737 (_ BitVec 64)) (_2!6737 V!32331)) )
))
(declare-datatypes ((List!19260 0))(
  ( (Nil!19257) (Cons!19256 (h!20407 tuple2!13452) (t!27577 List!19260)) )
))
(declare-datatypes ((ListLongMap!12149 0))(
  ( (ListLongMap!12150 (toList!6090 List!19260)) )
))
(declare-fun contains!5162 (ListLongMap!12149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3324 (array!57020 array!57018 (_ BitVec 32) (_ BitVec 32) V!32331 V!32331 (_ BitVec 32) Int) ListLongMap!12149)

(assert (=> b!943937 (= res!634147 (contains!5162 (getCurrentListMap!3324 (_keys!10529 thiss!1141) (_values!5674 thiss!1141) (mask!27289 thiss!1141) (extraKeys!5383 thiss!1141) (zeroValue!5487 thiss!1141) (minValue!5487 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5651 thiss!1141)) key!756))))

(declare-fun tp_is_empty!20525 () Bool)

(declare-fun e!530760 () Bool)

(declare-fun e!530761 () Bool)

(declare-fun array_inv!21318 (array!57020) Bool)

(declare-fun array_inv!21319 (array!57018) Bool)

(assert (=> b!943938 (= e!530760 (and tp!62560 tp_is_empty!20525 (array_inv!21318 (_keys!10529 thiss!1141)) (array_inv!21319 (_values!5674 thiss!1141)) e!530761))))

(declare-fun b!943939 () Bool)

(assert (=> b!943939 (= e!530759 (not true))))

(declare-fun arrayContainsKey!0 (array!57020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943939 (arrayContainsKey!0 (_keys!10529 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31828 0))(
  ( (Unit!31829) )
))
(declare-fun lt!425478 () Unit!31828)

(declare-fun lemmaKeyInListMapIsInArray!294 (array!57020 array!57018 (_ BitVec 32) (_ BitVec 32) V!32331 V!32331 (_ BitVec 64) Int) Unit!31828)

(assert (=> b!943939 (= lt!425478 (lemmaKeyInListMapIsInArray!294 (_keys!10529 thiss!1141) (_values!5674 thiss!1141) (mask!27289 thiss!1141) (extraKeys!5383 thiss!1141) (zeroValue!5487 thiss!1141) (minValue!5487 thiss!1141) key!756 (defaultEntry!5651 thiss!1141)))))

(declare-fun b!943940 () Bool)

(declare-fun e!530757 () Bool)

(declare-fun mapRes!32613 () Bool)

(assert (=> b!943940 (= e!530761 (and e!530757 mapRes!32613))))

(declare-fun condMapEmpty!32613 () Bool)

(declare-fun mapDefault!32613 () ValueCell!9781)

