; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8240 () Bool)

(assert start!8240)

(declare-fun b!52306 () Bool)

(declare-fun b_free!1645 () Bool)

(declare-fun b_next!1645 () Bool)

(assert (=> b!52306 (= b_free!1645 (not b_next!1645))))

(declare-fun tp!7037 () Bool)

(declare-fun b_and!2855 () Bool)

(assert (=> b!52306 (= tp!7037 b_and!2855)))

(declare-fun b!52307 () Bool)

(declare-fun b_free!1647 () Bool)

(declare-fun b_next!1647 () Bool)

(assert (=> b!52307 (= b_free!1647 (not b_next!1647))))

(declare-fun tp!7036 () Bool)

(declare-fun b_and!2857 () Bool)

(assert (=> b!52307 (= tp!7036 b_and!2857)))

(declare-fun b!52294 () Bool)

(declare-fun res!29766 () Bool)

(declare-fun e!34017 () Bool)

(assert (=> b!52294 (=> (not res!29766) (not e!34017))))

(declare-datatypes ((V!2633 0))(
  ( (V!2634 (val!1164 Int)) )
))
(declare-datatypes ((array!3401 0))(
  ( (array!3402 (arr!1623 (Array (_ BitVec 32) (_ BitVec 64))) (size!1852 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!776 0))(
  ( (ValueCellFull!776 (v!2217 V!2633)) (EmptyCell!776) )
))
(declare-datatypes ((array!3403 0))(
  ( (array!3404 (arr!1624 (Array (_ BitVec 32) ValueCell!776)) (size!1853 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!460 0))(
  ( (LongMapFixedSize!461 (defaultEntry!1944 Int) (mask!5767 (_ BitVec 32)) (extraKeys!1835 (_ BitVec 32)) (zeroValue!1862 V!2633) (minValue!1862 V!2633) (_size!279 (_ BitVec 32)) (_keys!3564 array!3401) (_values!1927 array!3403) (_vacant!279 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!460)

(declare-datatypes ((Cell!282 0))(
  ( (Cell!283 (v!2218 LongMapFixedSize!460)) )
))
(declare-datatypes ((LongMap!282 0))(
  ( (LongMap!283 (underlying!152 Cell!282)) )
))
(declare-fun thiss!992 () LongMap!282)

(assert (=> b!52294 (= res!29766 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5767 newMap!16)) (_size!279 (v!2218 (underlying!152 thiss!992)))))))

(declare-fun b!52295 () Bool)

(declare-fun e!34013 () Bool)

(declare-fun tp_is_empty!2239 () Bool)

(assert (=> b!52295 (= e!34013 tp_is_empty!2239)))

(declare-fun b!52296 () Bool)

(declare-fun e!34019 () Bool)

(declare-fun e!34021 () Bool)

(assert (=> b!52296 (= e!34019 e!34021)))

(declare-fun mapIsEmpty!2387 () Bool)

(declare-fun mapRes!2388 () Bool)

(assert (=> mapIsEmpty!2387 mapRes!2388))

(declare-fun b!52297 () Bool)

(declare-fun res!29767 () Bool)

(assert (=> b!52297 (=> (not res!29767) (not e!34017))))

(declare-fun valid!165 (LongMapFixedSize!460) Bool)

(assert (=> b!52297 (= res!29767 (valid!165 newMap!16))))

(declare-fun mapNonEmpty!2387 () Bool)

(declare-fun tp!7035 () Bool)

(declare-fun e!34020 () Bool)

(assert (=> mapNonEmpty!2387 (= mapRes!2388 (and tp!7035 e!34020))))

(declare-fun mapRest!2387 () (Array (_ BitVec 32) ValueCell!776))

(declare-fun mapKey!2387 () (_ BitVec 32))

(declare-fun mapValue!2387 () ValueCell!776)

(assert (=> mapNonEmpty!2387 (= (arr!1624 (_values!1927 (v!2218 (underlying!152 thiss!992)))) (store mapRest!2387 mapKey!2387 mapValue!2387))))

(declare-fun b!52298 () Bool)

(declare-fun e!34018 () Bool)

(assert (=> b!52298 (= e!34018 (and e!34013 mapRes!2388))))

(declare-fun condMapEmpty!2387 () Bool)

(declare-fun mapDefault!2388 () ValueCell!776)

