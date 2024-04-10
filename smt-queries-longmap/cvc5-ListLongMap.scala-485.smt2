; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10508 () Bool)

(assert start!10508)

(declare-fun b!82620 () Bool)

(declare-fun b_free!2209 () Bool)

(declare-fun b_next!2209 () Bool)

(assert (=> b!82620 (= b_free!2209 (not b_next!2209))))

(declare-fun tp!8844 () Bool)

(declare-fun b_and!5015 () Bool)

(assert (=> b!82620 (= tp!8844 b_and!5015)))

(declare-fun b!82629 () Bool)

(declare-fun b_free!2211 () Bool)

(declare-fun b_next!2211 () Bool)

(assert (=> b!82629 (= b_free!2211 (not b_next!2211))))

(declare-fun tp!8845 () Bool)

(declare-fun b_and!5017 () Bool)

(assert (=> b!82629 (= tp!8845 b_and!5017)))

(declare-fun res!42839 () Bool)

(declare-fun e!53910 () Bool)

(assert (=> start!10508 (=> (not res!42839) (not e!53910))))

(declare-datatypes ((V!3009 0))(
  ( (V!3010 (val!1305 Int)) )
))
(declare-datatypes ((array!3999 0))(
  ( (array!4000 (arr!1905 (Array (_ BitVec 32) (_ BitVec 64))) (size!2148 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!917 0))(
  ( (ValueCellFull!917 (v!2621 V!3009)) (EmptyCell!917) )
))
(declare-datatypes ((array!4001 0))(
  ( (array!4002 (arr!1906 (Array (_ BitVec 32) ValueCell!917)) (size!2149 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!742 0))(
  ( (LongMapFixedSize!743 (defaultEntry!2313 Int) (mask!6329 (_ BitVec 32)) (extraKeys!2156 (_ BitVec 32)) (zeroValue!2207 V!3009) (minValue!2207 V!3009) (_size!420 (_ BitVec 32)) (_keys!3981 array!3999) (_values!2296 array!4001) (_vacant!420 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!544 0))(
  ( (Cell!545 (v!2622 LongMapFixedSize!742)) )
))
(declare-datatypes ((LongMap!544 0))(
  ( (LongMap!545 (underlying!283 Cell!544)) )
))
(declare-fun thiss!992 () LongMap!544)

(declare-fun valid!318 (LongMap!544) Bool)

(assert (=> start!10508 (= res!42839 (valid!318 thiss!992))))

(assert (=> start!10508 e!53910))

(declare-fun e!53906 () Bool)

(assert (=> start!10508 e!53906))

(assert (=> start!10508 true))

(declare-fun e!53904 () Bool)

(assert (=> start!10508 e!53904))

(declare-fun b!82619 () Bool)

(declare-fun e!53907 () Bool)

(declare-fun tp_is_empty!2521 () Bool)

(assert (=> b!82619 (= e!53907 tp_is_empty!2521)))

(declare-fun e!53896 () Bool)

(declare-fun e!53894 () Bool)

(declare-fun array_inv!1177 (array!3999) Bool)

(declare-fun array_inv!1178 (array!4001) Bool)

(assert (=> b!82620 (= e!53896 (and tp!8844 tp_is_empty!2521 (array_inv!1177 (_keys!3981 (v!2622 (underlying!283 thiss!992)))) (array_inv!1178 (_values!2296 (v!2622 (underlying!283 thiss!992)))) e!53894))))

(declare-fun b!82621 () Bool)

(declare-fun e!53901 () Bool)

(assert (=> b!82621 (= e!53901 tp_is_empty!2521)))

(declare-fun b!82622 () Bool)

(declare-fun res!42841 () Bool)

(assert (=> b!82622 (=> (not res!42841) (not e!53910))))

(declare-fun newMap!16 () LongMapFixedSize!742)

(assert (=> b!82622 (= res!42841 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6329 newMap!16)) (_size!420 (v!2622 (underlying!283 thiss!992)))))))

(declare-fun b!82623 () Bool)

(declare-fun e!53908 () Bool)

(declare-fun mapRes!3349 () Bool)

(assert (=> b!82623 (= e!53894 (and e!53908 mapRes!3349))))

(declare-fun condMapEmpty!3350 () Bool)

(declare-fun mapDefault!3349 () ValueCell!917)

