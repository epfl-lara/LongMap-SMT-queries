; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8382 () Bool)

(assert start!8382)

(declare-fun b!56605 () Bool)

(declare-fun b_free!1929 () Bool)

(declare-fun b_next!1929 () Bool)

(assert (=> b!56605 (= b_free!1929 (not b_next!1929))))

(declare-fun tp!7887 () Bool)

(declare-fun b_and!3399 () Bool)

(assert (=> b!56605 (= tp!7887 b_and!3399)))

(declare-fun b!56619 () Bool)

(declare-fun b_free!1931 () Bool)

(declare-fun b_next!1931 () Bool)

(assert (=> b!56619 (= b_free!1931 (not b_next!1931))))

(declare-fun tp!7888 () Bool)

(declare-fun b_and!3401 () Bool)

(assert (=> b!56619 (= tp!7888 b_and!3401)))

(declare-fun tp_is_empty!2381 () Bool)

(declare-fun e!37287 () Bool)

(declare-fun e!37293 () Bool)

(declare-datatypes ((V!2821 0))(
  ( (V!2822 (val!1235 Int)) )
))
(declare-datatypes ((array!3685 0))(
  ( (array!3686 (arr!1765 (Array (_ BitVec 32) (_ BitVec 64))) (size!1994 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!847 0))(
  ( (ValueCellFull!847 (v!2355 V!2821)) (EmptyCell!847) )
))
(declare-datatypes ((array!3687 0))(
  ( (array!3688 (arr!1766 (Array (_ BitVec 32) ValueCell!847)) (size!1995 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!602 0))(
  ( (LongMapFixedSize!603 (defaultEntry!2015 Int) (mask!5884 (_ BitVec 32)) (extraKeys!1906 (_ BitVec 32)) (zeroValue!1933 V!2821) (minValue!1933 V!2821) (_size!350 (_ BitVec 32)) (_keys!3635 array!3685) (_values!1998 array!3687) (_vacant!350 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!416 0))(
  ( (Cell!417 (v!2356 LongMapFixedSize!602)) )
))
(declare-datatypes ((LongMap!416 0))(
  ( (LongMap!417 (underlying!219 Cell!416)) )
))
(declare-fun thiss!992 () LongMap!416)

(declare-fun array_inv!1093 (array!3685) Bool)

(declare-fun array_inv!1094 (array!3687) Bool)

(assert (=> b!56605 (= e!37287 (and tp!7887 tp_is_empty!2381 (array_inv!1093 (_keys!3635 (v!2356 (underlying!219 thiss!992)))) (array_inv!1094 (_values!1998 (v!2356 (underlying!219 thiss!992)))) e!37293))))

(declare-fun b!56606 () Bool)

(declare-fun e!37295 () Bool)

(declare-fun e!37285 () Bool)

(declare-fun mapRes!2813 () Bool)

(assert (=> b!56606 (= e!37295 (and e!37285 mapRes!2813))))

(declare-fun condMapEmpty!2813 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!602)

(declare-fun mapDefault!2813 () ValueCell!847)

