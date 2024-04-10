; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8280 () Bool)

(assert start!8280)

(declare-fun b!53481 () Bool)

(declare-fun b_free!1725 () Bool)

(declare-fun b_next!1725 () Bool)

(assert (=> b!53481 (= b_free!1725 (not b_next!1725))))

(declare-fun tp!7276 () Bool)

(declare-fun b_and!2991 () Bool)

(assert (=> b!53481 (= tp!7276 b_and!2991)))

(declare-fun b!53473 () Bool)

(declare-fun b_free!1727 () Bool)

(declare-fun b_next!1727 () Bool)

(assert (=> b!53473 (= b_free!1727 (not b_next!1727))))

(declare-fun tp!7275 () Bool)

(declare-fun b_and!2993 () Bool)

(assert (=> b!53473 (= tp!7275 b_and!2993)))

(declare-fun mapIsEmpty!2507 () Bool)

(declare-fun mapRes!2508 () Bool)

(assert (=> mapIsEmpty!2507 mapRes!2508))

(declare-fun b!53470 () Bool)

(declare-fun e!34890 () Bool)

(declare-fun e!34881 () Bool)

(declare-fun mapRes!2507 () Bool)

(assert (=> b!53470 (= e!34890 (and e!34881 mapRes!2507))))

(declare-fun condMapEmpty!2508 () Bool)

(declare-datatypes ((V!2685 0))(
  ( (V!2686 (val!1184 Int)) )
))
(declare-datatypes ((array!3481 0))(
  ( (array!3482 (arr!1663 (Array (_ BitVec 32) (_ BitVec 64))) (size!1892 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!796 0))(
  ( (ValueCellFull!796 (v!2256 V!2685)) (EmptyCell!796) )
))
(declare-datatypes ((array!3483 0))(
  ( (array!3484 (arr!1664 (Array (_ BitVec 32) ValueCell!796)) (size!1893 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!500 0))(
  ( (LongMapFixedSize!501 (defaultEntry!1964 Int) (mask!5799 (_ BitVec 32)) (extraKeys!1855 (_ BitVec 32)) (zeroValue!1882 V!2685) (minValue!1882 V!2685) (_size!299 (_ BitVec 32)) (_keys!3584 array!3481) (_values!1947 array!3483) (_vacant!299 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!500)

(declare-fun mapDefault!2508 () ValueCell!796)

