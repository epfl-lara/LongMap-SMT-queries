; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8090 () Bool)

(assert start!8090)

(declare-fun b!50957 () Bool)

(declare-fun b_free!1573 () Bool)

(declare-fun b_next!1573 () Bool)

(assert (=> b!50957 (= b_free!1573 (not b_next!1573))))

(declare-fun tp!6792 () Bool)

(declare-fun b_and!2783 () Bool)

(assert (=> b!50957 (= tp!6792 b_and!2783)))

(declare-fun b!50945 () Bool)

(declare-fun b_free!1575 () Bool)

(declare-fun b_next!1575 () Bool)

(assert (=> b!50945 (= b_free!1575 (not b_next!1575))))

(declare-fun tp!6794 () Bool)

(declare-fun b_and!2785 () Bool)

(assert (=> b!50945 (= tp!6794 b_and!2785)))

(declare-fun b!50943 () Bool)

(declare-fun res!29230 () Bool)

(declare-fun e!32990 () Bool)

(assert (=> b!50943 (=> (not res!29230) (not e!32990))))

(declare-datatypes ((V!2585 0))(
  ( (V!2586 (val!1146 Int)) )
))
(declare-datatypes ((array!3321 0))(
  ( (array!3322 (arr!1587 (Array (_ BitVec 32) (_ BitVec 64))) (size!1812 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!758 0))(
  ( (ValueCellFull!758 (v!2179 V!2585)) (EmptyCell!758) )
))
(declare-datatypes ((array!3323 0))(
  ( (array!3324 (arr!1588 (Array (_ BitVec 32) ValueCell!758)) (size!1813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!424 0))(
  ( (LongMapFixedSize!425 (defaultEntry!1926 Int) (mask!5725 (_ BitVec 32)) (extraKeys!1817 (_ BitVec 32)) (zeroValue!1844 V!2585) (minValue!1844 V!2585) (_size!261 (_ BitVec 32)) (_keys!3538 array!3321) (_values!1909 array!3323) (_vacant!261 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!424)

(declare-fun valid!142 (LongMapFixedSize!424) Bool)

(assert (=> b!50943 (= res!29230 (valid!142 newMap!16))))

(declare-fun res!29231 () Bool)

(assert (=> start!8090 (=> (not res!29231) (not e!32990))))

(declare-datatypes ((Cell!248 0))(
  ( (Cell!249 (v!2180 LongMapFixedSize!424)) )
))
(declare-datatypes ((LongMap!248 0))(
  ( (LongMap!249 (underlying!135 Cell!248)) )
))
(declare-fun thiss!992 () LongMap!248)

(declare-fun valid!143 (LongMap!248) Bool)

(assert (=> start!8090 (= res!29231 (valid!143 thiss!992))))

(assert (=> start!8090 e!32990))

(declare-fun e!32980 () Bool)

(assert (=> start!8090 e!32980))

(assert (=> start!8090 true))

(declare-fun e!32981 () Bool)

(assert (=> start!8090 e!32981))

(declare-fun b!50944 () Bool)

(declare-fun res!29233 () Bool)

(assert (=> b!50944 (=> (not res!29233) (not e!32990))))

(assert (=> b!50944 (= res!29233 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5725 newMap!16)) (_size!261 (v!2180 (underlying!135 thiss!992)))))))

(declare-fun e!32992 () Bool)

(declare-fun tp_is_empty!2203 () Bool)

(declare-fun array_inv!973 (array!3321) Bool)

(declare-fun array_inv!974 (array!3323) Bool)

(assert (=> b!50945 (= e!32981 (and tp!6794 tp_is_empty!2203 (array_inv!973 (_keys!3538 newMap!16)) (array_inv!974 (_values!1909 newMap!16)) e!32992))))

(declare-fun b!50946 () Bool)

(declare-fun e!32989 () Bool)

(assert (=> b!50946 (= e!32989 tp_is_empty!2203)))

(declare-fun b!50947 () Bool)

(declare-fun e!32991 () Bool)

(assert (=> b!50947 (= e!32980 e!32991)))

(declare-fun mapIsEmpty!2251 () Bool)

(declare-fun mapRes!2252 () Bool)

(assert (=> mapIsEmpty!2251 mapRes!2252))

(declare-fun b!50948 () Bool)

(declare-fun e!32986 () Bool)

(declare-fun e!32987 () Bool)

(assert (=> b!50948 (= e!32986 (and e!32987 mapRes!2252))))

(declare-fun condMapEmpty!2252 () Bool)

(declare-fun mapDefault!2252 () ValueCell!758)

