; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8234 () Bool)

(assert start!8234)

(declare-fun b!52188 () Bool)

(declare-fun b_free!1633 () Bool)

(declare-fun b_next!1633 () Bool)

(assert (=> b!52188 (= b_free!1633 (not b_next!1633))))

(declare-fun tp!7002 () Bool)

(declare-fun b_and!2843 () Bool)

(assert (=> b!52188 (= tp!7002 b_and!2843)))

(declare-fun b!52184 () Bool)

(declare-fun b_free!1635 () Bool)

(declare-fun b_next!1635 () Bool)

(assert (=> b!52184 (= b_free!1635 (not b_next!1635))))

(declare-fun tp!7001 () Bool)

(declare-fun b_and!2845 () Bool)

(assert (=> b!52184 (= tp!7001 b_and!2845)))

(declare-fun b!52182 () Bool)

(declare-fun e!33904 () Bool)

(declare-fun tp_is_empty!2233 () Bool)

(assert (=> b!52182 (= e!33904 tp_is_empty!2233)))

(declare-fun b!52183 () Bool)

(declare-fun e!33898 () Bool)

(assert (=> b!52183 (= e!33898 tp_is_empty!2233)))

(declare-fun e!33895 () Bool)

(declare-fun e!33903 () Bool)

(declare-datatypes ((V!2625 0))(
  ( (V!2626 (val!1161 Int)) )
))
(declare-datatypes ((array!3389 0))(
  ( (array!3390 (arr!1617 (Array (_ BitVec 32) (_ BitVec 64))) (size!1846 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!773 0))(
  ( (ValueCellFull!773 (v!2212 V!2625)) (EmptyCell!773) )
))
(declare-datatypes ((array!3391 0))(
  ( (array!3392 (arr!1618 (Array (_ BitVec 32) ValueCell!773)) (size!1847 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!454 0))(
  ( (LongMapFixedSize!455 (defaultEntry!1941 Int) (mask!5762 (_ BitVec 32)) (extraKeys!1832 (_ BitVec 32)) (zeroValue!1859 V!2625) (minValue!1859 V!2625) (_size!276 (_ BitVec 32)) (_keys!3561 array!3389) (_values!1924 array!3391) (_vacant!276 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!454)

(declare-fun array_inv!995 (array!3389) Bool)

(declare-fun array_inv!996 (array!3391) Bool)

(assert (=> b!52184 (= e!33903 (and tp!7001 tp_is_empty!2233 (array_inv!995 (_keys!3561 newMap!16)) (array_inv!996 (_values!1924 newMap!16)) e!33895))))

(declare-fun mapNonEmpty!2369 () Bool)

(declare-fun mapRes!2370 () Bool)

(declare-fun tp!6999 () Bool)

(assert (=> mapNonEmpty!2369 (= mapRes!2370 (and tp!6999 e!33898))))

(declare-fun mapRest!2370 () (Array (_ BitVec 32) ValueCell!773))

(declare-fun mapValue!2370 () ValueCell!773)

(declare-fun mapKey!2369 () (_ BitVec 32))

(assert (=> mapNonEmpty!2369 (= (arr!1618 (_values!1924 newMap!16)) (store mapRest!2370 mapKey!2369 mapValue!2370))))

(declare-fun mapIsEmpty!2369 () Bool)

(declare-fun mapRes!2369 () Bool)

(assert (=> mapIsEmpty!2369 mapRes!2369))

(declare-fun b!52185 () Bool)

(declare-fun e!33893 () Bool)

(declare-fun e!33899 () Bool)

(assert (=> b!52185 (= e!33893 e!33899)))

(declare-fun mapNonEmpty!2370 () Bool)

(declare-fun tp!7000 () Bool)

(assert (=> mapNonEmpty!2370 (= mapRes!2369 (and tp!7000 e!33904))))

(declare-datatypes ((Cell!278 0))(
  ( (Cell!279 (v!2213 LongMapFixedSize!454)) )
))
(declare-datatypes ((LongMap!278 0))(
  ( (LongMap!279 (underlying!150 Cell!278)) )
))
(declare-fun thiss!992 () LongMap!278)

(declare-fun mapRest!2369 () (Array (_ BitVec 32) ValueCell!773))

(declare-fun mapValue!2369 () ValueCell!773)

(declare-fun mapKey!2370 () (_ BitVec 32))

(assert (=> mapNonEmpty!2370 (= (arr!1618 (_values!1924 (v!2213 (underlying!150 thiss!992)))) (store mapRest!2369 mapKey!2370 mapValue!2369))))

(declare-fun b!52186 () Bool)

(declare-fun e!33905 () Bool)

(assert (=> b!52186 (= e!33905 tp_is_empty!2233)))

(declare-fun mapIsEmpty!2370 () Bool)

(assert (=> mapIsEmpty!2370 mapRes!2370))

(declare-fun res!29743 () Bool)

(declare-fun e!33897 () Bool)

(assert (=> start!8234 (=> (not res!29743) (not e!33897))))

(declare-fun valid!162 (LongMap!278) Bool)

(assert (=> start!8234 (= res!29743 (valid!162 thiss!992))))

(assert (=> start!8234 e!33897))

(assert (=> start!8234 e!33893))

(assert (=> start!8234 true))

(assert (=> start!8234 e!33903))

(declare-fun b!52187 () Bool)

(declare-fun e!33894 () Bool)

(declare-fun e!33900 () Bool)

(assert (=> b!52187 (= e!33894 (and e!33900 mapRes!2369))))

(declare-fun condMapEmpty!2369 () Bool)

(declare-fun mapDefault!2369 () ValueCell!773)

