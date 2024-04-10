; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8198 () Bool)

(assert start!8198)

(declare-fun b!51861 () Bool)

(declare-fun b_free!1617 () Bool)

(declare-fun b_next!1617 () Bool)

(assert (=> b!51861 (= b_free!1617 (not b_next!1617))))

(declare-fun tp!6947 () Bool)

(declare-fun b_and!2827 () Bool)

(assert (=> b!51861 (= tp!6947 b_and!2827)))

(declare-fun b!51866 () Bool)

(declare-fun b_free!1619 () Bool)

(declare-fun b_next!1619 () Bool)

(assert (=> b!51866 (= b_free!1619 (not b_next!1619))))

(declare-fun tp!6946 () Bool)

(declare-fun b_and!2829 () Bool)

(assert (=> b!51866 (= tp!6946 b_and!2829)))

(declare-fun b!51854 () Bool)

(declare-fun e!33663 () Bool)

(declare-fun tp_is_empty!2225 () Bool)

(assert (=> b!51854 (= e!33663 tp_is_empty!2225)))

(declare-fun mapIsEmpty!2339 () Bool)

(declare-fun mapRes!2340 () Bool)

(assert (=> mapIsEmpty!2339 mapRes!2340))

(declare-fun b!51855 () Bool)

(declare-fun res!29604 () Bool)

(declare-fun e!33664 () Bool)

(assert (=> b!51855 (=> (not res!29604) (not e!33664))))

(declare-datatypes ((V!2613 0))(
  ( (V!2614 (val!1157 Int)) )
))
(declare-datatypes ((array!3371 0))(
  ( (array!3372 (arr!1609 (Array (_ BitVec 32) (_ BitVec 64))) (size!1837 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!769 0))(
  ( (ValueCellFull!769 (v!2203 V!2613)) (EmptyCell!769) )
))
(declare-datatypes ((array!3373 0))(
  ( (array!3374 (arr!1610 (Array (_ BitVec 32) ValueCell!769)) (size!1838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!446 0))(
  ( (LongMapFixedSize!447 (defaultEntry!1937 Int) (mask!5751 (_ BitVec 32)) (extraKeys!1828 (_ BitVec 32)) (zeroValue!1855 V!2613) (minValue!1855 V!2613) (_size!272 (_ BitVec 32)) (_keys!3555 array!3371) (_values!1920 array!3373) (_vacant!272 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!270 0))(
  ( (Cell!271 (v!2204 LongMapFixedSize!446)) )
))
(declare-datatypes ((LongMap!270 0))(
  ( (LongMap!271 (underlying!146 Cell!270)) )
))
(declare-fun thiss!992 () LongMap!270)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3371 (_ BitVec 32)) Bool)

(assert (=> b!51855 (= res!29604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3555 (v!2204 (underlying!146 thiss!992))) (mask!5751 (v!2204 (underlying!146 thiss!992)))))))

(declare-fun res!29600 () Bool)

(assert (=> start!8198 (=> (not res!29600) (not e!33664))))

(declare-fun valid!155 (LongMap!270) Bool)

(assert (=> start!8198 (= res!29600 (valid!155 thiss!992))))

(assert (=> start!8198 e!33664))

(declare-fun e!33658 () Bool)

(assert (=> start!8198 e!33658))

(assert (=> start!8198 true))

(declare-fun e!33661 () Bool)

(assert (=> start!8198 e!33661))

(declare-fun b!51856 () Bool)

(declare-fun res!29601 () Bool)

(assert (=> b!51856 (=> (not res!29601) (not e!33664))))

(assert (=> b!51856 (= res!29601 (and (= (size!1838 (_values!1920 (v!2204 (underlying!146 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5751 (v!2204 (underlying!146 thiss!992))))) (= (size!1837 (_keys!3555 (v!2204 (underlying!146 thiss!992)))) (size!1838 (_values!1920 (v!2204 (underlying!146 thiss!992))))) (bvsge (mask!5751 (v!2204 (underlying!146 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1828 (v!2204 (underlying!146 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1828 (v!2204 (underlying!146 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51857 () Bool)

(declare-fun res!29603 () Bool)

(assert (=> b!51857 (=> (not res!29603) (not e!33664))))

(declare-fun newMap!16 () LongMapFixedSize!446)

(assert (=> b!51857 (= res!29603 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5751 newMap!16)) (_size!272 (v!2204 (underlying!146 thiss!992)))))))

(declare-fun mapNonEmpty!2339 () Bool)

(declare-fun mapRes!2339 () Bool)

(declare-fun tp!6948 () Bool)

(declare-fun e!33665 () Bool)

(assert (=> mapNonEmpty!2339 (= mapRes!2339 (and tp!6948 e!33665))))

(declare-fun mapValue!2340 () ValueCell!769)

(declare-fun mapRest!2340 () (Array (_ BitVec 32) ValueCell!769))

(declare-fun mapKey!2340 () (_ BitVec 32))

(assert (=> mapNonEmpty!2339 (= (arr!1610 (_values!1920 (v!2204 (underlying!146 thiss!992)))) (store mapRest!2340 mapKey!2340 mapValue!2340))))

(declare-fun b!51858 () Bool)

(declare-fun e!33657 () Bool)

(declare-fun e!33666 () Bool)

(assert (=> b!51858 (= e!33657 e!33666)))

(declare-fun b!51859 () Bool)

(declare-fun e!33662 () Bool)

(declare-fun e!33660 () Bool)

(assert (=> b!51859 (= e!33662 (and e!33660 mapRes!2339))))

(declare-fun condMapEmpty!2339 () Bool)

(declare-fun mapDefault!2340 () ValueCell!769)

