; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8232 () Bool)

(assert start!8232)

(declare-fun b!52140 () Bool)

(declare-fun b_free!1629 () Bool)

(declare-fun b_next!1629 () Bool)

(assert (=> b!52140 (= b_free!1629 (not b_next!1629))))

(declare-fun tp!6988 () Bool)

(declare-fun b_and!2839 () Bool)

(assert (=> b!52140 (= tp!6988 b_and!2839)))

(declare-fun b!52157 () Bool)

(declare-fun b_free!1631 () Bool)

(declare-fun b_next!1631 () Bool)

(assert (=> b!52157 (= b_free!1631 (not b_next!1631))))

(declare-fun tp!6990 () Bool)

(declare-fun b_and!2841 () Bool)

(assert (=> b!52157 (= tp!6990 b_and!2841)))

(declare-fun res!29734 () Bool)

(declare-fun e!33854 () Bool)

(assert (=> start!8232 (=> (not res!29734) (not e!33854))))

(declare-datatypes ((V!2621 0))(
  ( (V!2622 (val!1160 Int)) )
))
(declare-datatypes ((array!3385 0))(
  ( (array!3386 (arr!1615 (Array (_ BitVec 32) (_ BitVec 64))) (size!1844 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!772 0))(
  ( (ValueCellFull!772 (v!2210 V!2621)) (EmptyCell!772) )
))
(declare-datatypes ((array!3387 0))(
  ( (array!3388 (arr!1616 (Array (_ BitVec 32) ValueCell!772)) (size!1845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!452 0))(
  ( (LongMapFixedSize!453 (defaultEntry!1940 Int) (mask!5759 (_ BitVec 32)) (extraKeys!1831 (_ BitVec 32)) (zeroValue!1858 V!2621) (minValue!1858 V!2621) (_size!275 (_ BitVec 32)) (_keys!3560 array!3385) (_values!1923 array!3387) (_vacant!275 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!276 0))(
  ( (Cell!277 (v!2211 LongMapFixedSize!452)) )
))
(declare-datatypes ((LongMap!276 0))(
  ( (LongMap!277 (underlying!149 Cell!276)) )
))
(declare-fun thiss!992 () LongMap!276)

(declare-fun valid!160 (LongMap!276) Bool)

(assert (=> start!8232 (= res!29734 (valid!160 thiss!992))))

(assert (=> start!8232 e!33854))

(declare-fun e!33857 () Bool)

(assert (=> start!8232 e!33857))

(assert (=> start!8232 true))

(declare-fun e!33859 () Bool)

(assert (=> start!8232 e!33859))

(declare-fun e!33866 () Bool)

(declare-fun tp_is_empty!2231 () Bool)

(declare-fun e!33862 () Bool)

(declare-fun array_inv!993 (array!3385) Bool)

(declare-fun array_inv!994 (array!3387) Bool)

(assert (=> b!52140 (= e!33866 (and tp!6988 tp_is_empty!2231 (array_inv!993 (_keys!3560 (v!2211 (underlying!149 thiss!992)))) (array_inv!994 (_values!1923 (v!2211 (underlying!149 thiss!992)))) e!33862))))

(declare-fun b!52141 () Bool)

(declare-fun res!29736 () Bool)

(assert (=> b!52141 (=> (not res!29736) (not e!33854))))

(declare-fun newMap!16 () LongMapFixedSize!452)

(declare-fun valid!161 (LongMapFixedSize!452) Bool)

(assert (=> b!52141 (= res!29736 (valid!161 newMap!16))))

(declare-fun b!52142 () Bool)

(declare-fun e!33865 () Bool)

(assert (=> b!52142 (= e!33857 e!33865)))

(declare-fun b!52143 () Bool)

(assert (=> b!52143 (= e!33865 e!33866)))

(declare-fun b!52144 () Bool)

(declare-fun e!33858 () Bool)

(declare-fun mapRes!2364 () Bool)

(assert (=> b!52144 (= e!33862 (and e!33858 mapRes!2364))))

(declare-fun condMapEmpty!2364 () Bool)

(declare-fun mapDefault!2364 () ValueCell!772)

