; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8238 () Bool)

(assert start!8238)

(declare-fun b!52263 () Bool)

(declare-fun b_free!1641 () Bool)

(declare-fun b_next!1641 () Bool)

(assert (=> b!52263 (= b_free!1641 (not b_next!1641))))

(declare-fun tp!7026 () Bool)

(declare-fun b_and!2851 () Bool)

(assert (=> b!52263 (= tp!7026 b_and!2851)))

(declare-fun b!52256 () Bool)

(declare-fun b_free!1643 () Bool)

(declare-fun b_next!1643 () Bool)

(assert (=> b!52256 (= b_free!1643 (not b_next!1643))))

(declare-fun tp!7024 () Bool)

(declare-fun b_and!2853 () Bool)

(assert (=> b!52256 (= tp!7024 b_and!2853)))

(declare-fun b!52254 () Bool)

(declare-fun e!33982 () Bool)

(declare-fun tp_is_empty!2237 () Bool)

(assert (=> b!52254 (= e!33982 tp_is_empty!2237)))

(declare-fun b!52255 () Bool)

(declare-fun e!33971 () Bool)

(assert (=> b!52255 (= e!33971 tp_is_empty!2237)))

(declare-fun e!33981 () Bool)

(declare-datatypes ((V!2629 0))(
  ( (V!2630 (val!1163 Int)) )
))
(declare-datatypes ((array!3397 0))(
  ( (array!3398 (arr!1621 (Array (_ BitVec 32) (_ BitVec 64))) (size!1850 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!775 0))(
  ( (ValueCellFull!775 (v!2216 V!2629)) (EmptyCell!775) )
))
(declare-datatypes ((array!3399 0))(
  ( (array!3400 (arr!1622 (Array (_ BitVec 32) ValueCell!775)) (size!1851 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!458 0))(
  ( (LongMapFixedSize!459 (defaultEntry!1943 Int) (mask!5764 (_ BitVec 32)) (extraKeys!1834 (_ BitVec 32)) (zeroValue!1861 V!2629) (minValue!1861 V!2629) (_size!278 (_ BitVec 32)) (_keys!3563 array!3397) (_values!1926 array!3399) (_vacant!278 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!458)

(declare-fun e!33975 () Bool)

(declare-fun array_inv!999 (array!3397) Bool)

(declare-fun array_inv!1000 (array!3399) Bool)

(assert (=> b!52256 (= e!33981 (and tp!7024 tp_is_empty!2237 (array_inv!999 (_keys!3563 newMap!16)) (array_inv!1000 (_values!1926 newMap!16)) e!33975))))

(declare-fun mapNonEmpty!2381 () Bool)

(declare-fun mapRes!2382 () Bool)

(declare-fun tp!7025 () Bool)

(declare-fun e!33983 () Bool)

(assert (=> mapNonEmpty!2381 (= mapRes!2382 (and tp!7025 e!33983))))

(declare-fun mapRest!2382 () (Array (_ BitVec 32) ValueCell!775))

(declare-fun mapValue!2382 () ValueCell!775)

(declare-fun mapKey!2382 () (_ BitVec 32))

(assert (=> mapNonEmpty!2381 (= (arr!1622 (_values!1926 newMap!16)) (store mapRest!2382 mapKey!2382 mapValue!2382))))

(declare-fun b!52257 () Bool)

(declare-fun e!33972 () Bool)

(assert (=> b!52257 (= e!33975 (and e!33972 mapRes!2382))))

(declare-fun condMapEmpty!2381 () Bool)

(declare-fun mapDefault!2381 () ValueCell!775)

