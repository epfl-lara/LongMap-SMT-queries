; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8166 () Bool)

(assert start!8166)

(declare-fun b!51603 () Bool)

(declare-fun b_free!1605 () Bool)

(declare-fun b_next!1605 () Bool)

(assert (=> b!51603 (= b_free!1605 (not b_next!1605))))

(declare-fun tp!6904 () Bool)

(declare-fun b_and!2815 () Bool)

(assert (=> b!51603 (= tp!6904 b_and!2815)))

(declare-fun b!51598 () Bool)

(declare-fun b_free!1607 () Bool)

(declare-fun b_next!1607 () Bool)

(assert (=> b!51598 (= b_free!1607 (not b_next!1607))))

(declare-fun tp!6906 () Bool)

(declare-fun b_and!2817 () Bool)

(assert (=> b!51598 (= tp!6906 b_and!2817)))

(declare-fun b!51593 () Bool)

(declare-fun res!29490 () Bool)

(declare-fun e!33477 () Bool)

(assert (=> b!51593 (=> (not res!29490) (not e!33477))))

(declare-datatypes ((V!2605 0))(
  ( (V!2606 (val!1154 Int)) )
))
(declare-datatypes ((array!3357 0))(
  ( (array!3358 (arr!1603 (Array (_ BitVec 32) (_ BitVec 64))) (size!1830 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!766 0))(
  ( (ValueCellFull!766 (v!2197 V!2605)) (EmptyCell!766) )
))
(declare-datatypes ((array!3359 0))(
  ( (array!3360 (arr!1604 (Array (_ BitVec 32) ValueCell!766)) (size!1831 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!440 0))(
  ( (LongMapFixedSize!441 (defaultEntry!1934 Int) (mask!5743 (_ BitVec 32)) (extraKeys!1825 (_ BitVec 32)) (zeroValue!1852 V!2605) (minValue!1852 V!2605) (_size!269 (_ BitVec 32)) (_keys!3550 array!3357) (_values!1917 array!3359) (_vacant!269 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!264 0))(
  ( (Cell!265 (v!2198 LongMapFixedSize!440)) )
))
(declare-datatypes ((LongMap!264 0))(
  ( (LongMap!265 (underlying!143 Cell!264)) )
))
(declare-fun thiss!992 () LongMap!264)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51593 (= res!29490 (validMask!0 (mask!5743 (v!2198 (underlying!143 thiss!992)))))))

(declare-fun b!51594 () Bool)

(declare-fun res!29489 () Bool)

(assert (=> b!51594 (=> (not res!29489) (not e!33477))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51594 (= res!29489 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1830 (_keys!3550 (v!2198 (underlying!143 thiss!992)))))))))

(declare-fun b!51595 () Bool)

(declare-fun res!29492 () Bool)

(assert (=> b!51595 (=> (not res!29492) (not e!33477))))

(assert (=> b!51595 (= res!29492 (and (= (size!1831 (_values!1917 (v!2198 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5743 (v!2198 (underlying!143 thiss!992))))) (= (size!1830 (_keys!3550 (v!2198 (underlying!143 thiss!992)))) (size!1831 (_values!1917 (v!2198 (underlying!143 thiss!992))))) (bvsge (mask!5743 (v!2198 (underlying!143 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1825 (v!2198 (underlying!143 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1825 (v!2198 (underlying!143 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51596 () Bool)

(declare-fun e!33476 () Bool)

(declare-fun e!33473 () Bool)

(assert (=> b!51596 (= e!33476 e!33473)))

(declare-fun b!51597 () Bool)

(declare-fun e!33475 () Bool)

(declare-fun e!33484 () Bool)

(declare-fun mapRes!2315 () Bool)

(assert (=> b!51597 (= e!33475 (and e!33484 mapRes!2315))))

(declare-fun condMapEmpty!2316 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!440)

(declare-fun mapDefault!2315 () ValueCell!766)

