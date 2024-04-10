; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8340 () Bool)

(assert start!8340)

(declare-fun b!55256 () Bool)

(declare-fun b_free!1845 () Bool)

(declare-fun b_next!1845 () Bool)

(assert (=> b!55256 (= b_free!1845 (not b_next!1845))))

(declare-fun tp!7635 () Bool)

(declare-fun b_and!3231 () Bool)

(assert (=> b!55256 (= tp!7635 b_and!3231)))

(declare-fun b!55258 () Bool)

(declare-fun b_free!1847 () Bool)

(declare-fun b_next!1847 () Bool)

(assert (=> b!55258 (= b_free!1847 (not b_next!1847))))

(declare-fun tp!7636 () Bool)

(declare-fun b_and!3233 () Bool)

(assert (=> b!55258 (= tp!7636 b_and!3233)))

(declare-fun res!31132 () Bool)

(declare-fun e!36281 () Bool)

(assert (=> start!8340 (=> (not res!31132) (not e!36281))))

(declare-datatypes ((V!2765 0))(
  ( (V!2766 (val!1214 Int)) )
))
(declare-datatypes ((array!3601 0))(
  ( (array!3602 (arr!1723 (Array (_ BitVec 32) (_ BitVec 64))) (size!1952 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!826 0))(
  ( (ValueCellFull!826 (v!2314 V!2765)) (EmptyCell!826) )
))
(declare-datatypes ((array!3603 0))(
  ( (array!3604 (arr!1724 (Array (_ BitVec 32) ValueCell!826)) (size!1953 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!560 0))(
  ( (LongMapFixedSize!561 (defaultEntry!1994 Int) (mask!5849 (_ BitVec 32)) (extraKeys!1885 (_ BitVec 32)) (zeroValue!1912 V!2765) (minValue!1912 V!2765) (_size!329 (_ BitVec 32)) (_keys!3614 array!3601) (_values!1977 array!3603) (_vacant!329 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!376 0))(
  ( (Cell!377 (v!2315 LongMapFixedSize!560)) )
))
(declare-datatypes ((LongMap!376 0))(
  ( (LongMap!377 (underlying!199 Cell!376)) )
))
(declare-fun thiss!992 () LongMap!376)

(declare-fun valid!222 (LongMap!376) Bool)

(assert (=> start!8340 (= res!31132 (valid!222 thiss!992))))

(assert (=> start!8340 e!36281))

(declare-fun e!36284 () Bool)

(assert (=> start!8340 e!36284))

(assert (=> start!8340 true))

(declare-fun e!36278 () Bool)

(assert (=> start!8340 e!36278))

(declare-fun b!55244 () Bool)

(declare-fun e!36286 () Bool)

(declare-fun e!36279 () Bool)

(declare-fun mapRes!2687 () Bool)

(assert (=> b!55244 (= e!36286 (and e!36279 mapRes!2687))))

(declare-fun condMapEmpty!2688 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!560)

(declare-fun mapDefault!2688 () ValueCell!826)

