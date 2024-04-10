; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8094 () Bool)

(assert start!8094)

(declare-fun b!51047 () Bool)

(declare-fun b_free!1581 () Bool)

(declare-fun b_next!1581 () Bool)

(assert (=> b!51047 (= b_free!1581 (not b_next!1581))))

(declare-fun tp!6816 () Bool)

(declare-fun b_and!2791 () Bool)

(assert (=> b!51047 (= tp!6816 b_and!2791)))

(declare-fun b!51041 () Bool)

(declare-fun b_free!1583 () Bool)

(declare-fun b_next!1583 () Bool)

(assert (=> b!51041 (= b_free!1583 (not b_next!1583))))

(declare-fun tp!6815 () Bool)

(declare-fun b_and!2793 () Bool)

(assert (=> b!51041 (= tp!6815 b_and!2793)))

(declare-fun b!51033 () Bool)

(declare-fun e!33059 () Bool)

(declare-fun e!33067 () Bool)

(assert (=> b!51033 (= e!33059 e!33067)))

(declare-fun b!51034 () Bool)

(declare-fun e!33064 () Bool)

(declare-datatypes ((V!2589 0))(
  ( (V!2590 (val!1148 Int)) )
))
(declare-datatypes ((array!3329 0))(
  ( (array!3330 (arr!1591 (Array (_ BitVec 32) (_ BitVec 64))) (size!1816 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!760 0))(
  ( (ValueCellFull!760 (v!2183 V!2589)) (EmptyCell!760) )
))
(declare-datatypes ((array!3331 0))(
  ( (array!3332 (arr!1592 (Array (_ BitVec 32) ValueCell!760)) (size!1817 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!428 0))(
  ( (LongMapFixedSize!429 (defaultEntry!1928 Int) (mask!5727 (_ BitVec 32)) (extraKeys!1819 (_ BitVec 32)) (zeroValue!1846 V!2589) (minValue!1846 V!2589) (_size!263 (_ BitVec 32)) (_keys!3540 array!3329) (_values!1911 array!3331) (_vacant!263 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!252 0))(
  ( (Cell!253 (v!2184 LongMapFixedSize!428)) )
))
(declare-datatypes ((LongMap!252 0))(
  ( (LongMap!253 (underlying!137 Cell!252)) )
))
(declare-fun thiss!992 () LongMap!252)

(assert (=> b!51034 (= e!33064 (and (= (size!1817 (_values!1911 (v!2184 (underlying!137 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5727 (v!2184 (underlying!137 thiss!992))))) (= (size!1816 (_keys!3540 (v!2184 (underlying!137 thiss!992)))) (size!1817 (_values!1911 (v!2184 (underlying!137 thiss!992))))) (bvsge (mask!5727 (v!2184 (underlying!137 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!1819 (v!2184 (underlying!137 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!51035 () Bool)

(declare-fun e!33063 () Bool)

(declare-fun e!33060 () Bool)

(declare-fun mapRes!2263 () Bool)

(assert (=> b!51035 (= e!33063 (and e!33060 mapRes!2263))))

(declare-fun condMapEmpty!2264 () Bool)

(declare-fun mapDefault!2263 () ValueCell!760)

