; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8292 () Bool)

(assert start!8292)

(declare-fun b!53880 () Bool)

(declare-fun b_free!1749 () Bool)

(declare-fun b_next!1749 () Bool)

(assert (=> b!53880 (= b_free!1749 (not b_next!1749))))

(declare-fun tp!7349 () Bool)

(declare-fun b_and!3039 () Bool)

(assert (=> b!53880 (= tp!7349 b_and!3039)))

(declare-fun b!53865 () Bool)

(declare-fun b_free!1751 () Bool)

(declare-fun b_next!1751 () Bool)

(assert (=> b!53865 (= b_free!1751 (not b_next!1751))))

(declare-fun tp!7348 () Bool)

(declare-fun b_and!3041 () Bool)

(assert (=> b!53865 (= tp!7348 b_and!3041)))

(declare-fun mapNonEmpty!2543 () Bool)

(declare-fun mapRes!2543 () Bool)

(declare-fun tp!7347 () Bool)

(declare-fun e!35159 () Bool)

(assert (=> mapNonEmpty!2543 (= mapRes!2543 (and tp!7347 e!35159))))

(declare-datatypes ((V!2701 0))(
  ( (V!2702 (val!1190 Int)) )
))
(declare-datatypes ((ValueCell!802 0))(
  ( (ValueCellFull!802 (v!2267 V!2701)) (EmptyCell!802) )
))
(declare-fun mapRest!2543 () (Array (_ BitVec 32) ValueCell!802))

(declare-fun mapKey!2543 () (_ BitVec 32))

(declare-datatypes ((array!3505 0))(
  ( (array!3506 (arr!1675 (Array (_ BitVec 32) (_ BitVec 64))) (size!1904 (_ BitVec 32))) )
))
(declare-datatypes ((array!3507 0))(
  ( (array!3508 (arr!1676 (Array (_ BitVec 32) ValueCell!802)) (size!1905 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!512 0))(
  ( (LongMapFixedSize!513 (defaultEntry!1970 Int) (mask!5809 (_ BitVec 32)) (extraKeys!1861 (_ BitVec 32)) (zeroValue!1888 V!2701) (minValue!1888 V!2701) (_size!305 (_ BitVec 32)) (_keys!3590 array!3505) (_values!1953 array!3507) (_vacant!305 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!512)

(declare-fun mapValue!2543 () ValueCell!802)

(assert (=> mapNonEmpty!2543 (= (arr!1676 (_values!1953 newMap!16)) (store mapRest!2543 mapKey!2543 mapValue!2543))))

(declare-fun b!53860 () Bool)

(declare-fun e!35158 () Bool)

(declare-fun e!35161 () Bool)

(assert (=> b!53860 (= e!35158 (and e!35161 mapRes!2543))))

(declare-fun condMapEmpty!2543 () Bool)

(declare-fun mapDefault!2544 () ValueCell!802)

