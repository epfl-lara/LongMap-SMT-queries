; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8304 () Bool)

(assert start!8304)

(declare-fun b!54261 () Bool)

(declare-fun b_free!1773 () Bool)

(declare-fun b_next!1773 () Bool)

(assert (=> b!54261 (= b_free!1773 (not b_next!1773))))

(declare-fun tp!7419 () Bool)

(declare-fun b_and!3087 () Bool)

(assert (=> b!54261 (= tp!7419 b_and!3087)))

(declare-fun b!54263 () Bool)

(declare-fun b_free!1775 () Bool)

(declare-fun b_next!1775 () Bool)

(assert (=> b!54263 (= b_free!1775 (not b_next!1775))))

(declare-fun tp!7422 () Bool)

(declare-fun b_and!3089 () Bool)

(assert (=> b!54263 (= tp!7422 b_and!3089)))

(declare-fun b!54250 () Bool)

(declare-fun e!35423 () Bool)

(declare-fun e!35422 () Bool)

(declare-fun mapRes!2580 () Bool)

(assert (=> b!54250 (= e!35423 (and e!35422 mapRes!2580))))

(declare-fun condMapEmpty!2579 () Bool)

(declare-datatypes ((V!2717 0))(
  ( (V!2718 (val!1196 Int)) )
))
(declare-datatypes ((array!3529 0))(
  ( (array!3530 (arr!1687 (Array (_ BitVec 32) (_ BitVec 64))) (size!1916 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!808 0))(
  ( (ValueCellFull!808 (v!2278 V!2717)) (EmptyCell!808) )
))
(declare-datatypes ((array!3531 0))(
  ( (array!3532 (arr!1688 (Array (_ BitVec 32) ValueCell!808)) (size!1917 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!524 0))(
  ( (LongMapFixedSize!525 (defaultEntry!1976 Int) (mask!5819 (_ BitVec 32)) (extraKeys!1867 (_ BitVec 32)) (zeroValue!1894 V!2717) (minValue!1894 V!2717) (_size!311 (_ BitVec 32)) (_keys!3596 array!3529) (_values!1959 array!3531) (_vacant!311 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!340 0))(
  ( (Cell!341 (v!2279 LongMapFixedSize!524)) )
))
(declare-datatypes ((LongMap!340 0))(
  ( (LongMap!341 (underlying!181 Cell!340)) )
))
(declare-fun thiss!992 () LongMap!340)

(declare-fun mapDefault!2580 () ValueCell!808)

