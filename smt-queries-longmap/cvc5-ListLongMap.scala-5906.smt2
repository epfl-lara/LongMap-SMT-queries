; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76390 () Bool)

(assert start!76390)

(declare-fun b!896081 () Bool)

(declare-fun b_free!15937 () Bool)

(declare-fun b_next!15937 () Bool)

(assert (=> b!896081 (= b_free!15937 (not b_next!15937))))

(declare-fun tp!55835 () Bool)

(declare-fun b_and!26229 () Bool)

(assert (=> b!896081 (= tp!55835 b_and!26229)))

(declare-fun res!605995 () Bool)

(declare-fun e!500790 () Bool)

(assert (=> start!76390 (=> (not res!605995) (not e!500790))))

(declare-datatypes ((array!52542 0))(
  ( (array!52543 (arr!25261 (Array (_ BitVec 32) (_ BitVec 64))) (size!25711 (_ BitVec 32))) )
))
(declare-datatypes ((V!29319 0))(
  ( (V!29320 (val!9183 Int)) )
))
(declare-datatypes ((ValueCell!8651 0))(
  ( (ValueCellFull!8651 (v!11673 V!29319)) (EmptyCell!8651) )
))
(declare-datatypes ((array!52544 0))(
  ( (array!52545 (arr!25262 (Array (_ BitVec 32) ValueCell!8651)) (size!25712 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4318 0))(
  ( (LongMapFixedSize!4319 (defaultEntry!5371 Int) (mask!25995 (_ BitVec 32)) (extraKeys!5069 (_ BitVec 32)) (zeroValue!5173 V!29319) (minValue!5173 V!29319) (_size!2214 (_ BitVec 32)) (_keys!10096 array!52542) (_values!5360 array!52544) (_vacant!2214 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4318)

(declare-fun valid!1665 (LongMapFixedSize!4318) Bool)

(assert (=> start!76390 (= res!605995 (valid!1665 thiss!1181))))

(assert (=> start!76390 e!500790))

(declare-fun e!500788 () Bool)

(assert (=> start!76390 e!500788))

(assert (=> start!76390 true))

(declare-fun tp_is_empty!18265 () Bool)

(declare-fun e!500786 () Bool)

(declare-fun array_inv!19830 (array!52542) Bool)

(declare-fun array_inv!19831 (array!52544) Bool)

(assert (=> b!896081 (= e!500788 (and tp!55835 tp_is_empty!18265 (array_inv!19830 (_keys!10096 thiss!1181)) (array_inv!19831 (_values!5360 thiss!1181)) e!500786))))

(declare-fun b!896082 () Bool)

(declare-fun e!500792 () Bool)

(assert (=> b!896082 (= e!500792 tp_is_empty!18265)))

(declare-fun b!896083 () Bool)

(declare-fun mapRes!29008 () Bool)

(assert (=> b!896083 (= e!500786 (and e!500792 mapRes!29008))))

(declare-fun condMapEmpty!29008 () Bool)

(declare-fun mapDefault!29008 () ValueCell!8651)

