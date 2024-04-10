; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8162 () Bool)

(assert start!8162)

(declare-fun b!51502 () Bool)

(declare-fun b_free!1597 () Bool)

(declare-fun b_next!1597 () Bool)

(assert (=> b!51502 (= b_free!1597 (not b_next!1597))))

(declare-fun tp!6881 () Bool)

(declare-fun b_and!2807 () Bool)

(assert (=> b!51502 (= tp!6881 b_and!2807)))

(declare-fun b!51506 () Bool)

(declare-fun b_free!1599 () Bool)

(declare-fun b_next!1599 () Bool)

(assert (=> b!51506 (= b_free!1599 (not b_next!1599))))

(declare-fun tp!6880 () Bool)

(declare-fun b_and!2809 () Bool)

(assert (=> b!51506 (= tp!6880 b_and!2809)))

(declare-fun b!51497 () Bool)

(declare-fun e!33403 () Bool)

(declare-fun tp_is_empty!2215 () Bool)

(assert (=> b!51497 (= e!33403 tp_is_empty!2215)))

(declare-fun b!51498 () Bool)

(declare-fun e!33396 () Bool)

(declare-datatypes ((V!2601 0))(
  ( (V!2602 (val!1152 Int)) )
))
(declare-datatypes ((array!3349 0))(
  ( (array!3350 (arr!1599 (Array (_ BitVec 32) (_ BitVec 64))) (size!1826 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!764 0))(
  ( (ValueCellFull!764 (v!2193 V!2601)) (EmptyCell!764) )
))
(declare-datatypes ((array!3351 0))(
  ( (array!3352 (arr!1600 (Array (_ BitVec 32) ValueCell!764)) (size!1827 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!436 0))(
  ( (LongMapFixedSize!437 (defaultEntry!1932 Int) (mask!5741 (_ BitVec 32)) (extraKeys!1823 (_ BitVec 32)) (zeroValue!1850 V!2601) (minValue!1850 V!2601) (_size!267 (_ BitVec 32)) (_keys!3548 array!3349) (_values!1915 array!3351) (_vacant!267 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!260 0))(
  ( (Cell!261 (v!2194 LongMapFixedSize!436)) )
))
(declare-datatypes ((LongMap!260 0))(
  ( (LongMap!261 (underlying!141 Cell!260)) )
))
(declare-fun thiss!992 () LongMap!260)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3349 (_ BitVec 32)) Bool)

(assert (=> b!51498 (= e!33396 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3548 (v!2194 (underlying!141 thiss!992))) (mask!5741 (v!2194 (underlying!141 thiss!992))))))))

(declare-fun b!51499 () Bool)

(declare-fun e!33406 () Bool)

(declare-fun e!33402 () Bool)

(declare-fun mapRes!2304 () Bool)

(assert (=> b!51499 (= e!33406 (and e!33402 mapRes!2304))))

(declare-fun condMapEmpty!2304 () Bool)

(declare-fun mapDefault!2303 () ValueCell!764)

