; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7980 () Bool)

(assert start!7980)

(declare-fun b!50080 () Bool)

(declare-fun b_free!1533 () Bool)

(declare-fun b_next!1533 () Bool)

(assert (=> b!50080 (= b_free!1533 (not b_next!1533))))

(declare-fun tp!6649 () Bool)

(declare-fun b_and!2743 () Bool)

(assert (=> b!50080 (= tp!6649 b_and!2743)))

(declare-fun b!50079 () Bool)

(declare-fun b_free!1535 () Bool)

(declare-fun b_next!1535 () Bool)

(assert (=> b!50079 (= b_free!1535 (not b_next!1535))))

(declare-fun tp!6648 () Bool)

(declare-fun b_and!2745 () Bool)

(assert (=> b!50079 (= tp!6648 b_and!2745)))

(declare-fun b!50071 () Bool)

(declare-fun e!32328 () Bool)

(declare-datatypes ((V!2557 0))(
  ( (V!2558 (val!1136 Int)) )
))
(declare-datatypes ((array!3275 0))(
  ( (array!3276 (arr!1567 (Array (_ BitVec 32) (_ BitVec 64))) (size!1789 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!748 0))(
  ( (ValueCellFull!748 (v!2157 V!2557)) (EmptyCell!748) )
))
(declare-datatypes ((array!3277 0))(
  ( (array!3278 (arr!1568 (Array (_ BitVec 32) ValueCell!748)) (size!1790 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!404 0))(
  ( (LongMapFixedSize!405 (defaultEntry!1916 Int) (mask!5698 (_ BitVec 32)) (extraKeys!1807 (_ BitVec 32)) (zeroValue!1834 V!2557) (minValue!1834 V!2557) (_size!251 (_ BitVec 32)) (_keys!3522 array!3275) (_values!1899 array!3277) (_vacant!251 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!230 0))(
  ( (Cell!231 (v!2158 LongMapFixedSize!404)) )
))
(declare-datatypes ((LongMap!230 0))(
  ( (LongMap!231 (underlying!126 Cell!230)) )
))
(declare-fun thiss!992 () LongMap!230)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50071 (= e!32328 (not (validMask!0 (mask!5698 (v!2158 (underlying!126 thiss!992))))))))

(declare-fun b!50072 () Bool)

(declare-fun e!32329 () Bool)

(declare-fun tp_is_empty!2183 () Bool)

(assert (=> b!50072 (= e!32329 tp_is_empty!2183)))

(declare-fun b!50073 () Bool)

(declare-fun e!32326 () Bool)

(declare-fun e!32320 () Bool)

(assert (=> b!50073 (= e!32326 e!32320)))

(declare-fun b!50074 () Bool)

(declare-fun e!32330 () Bool)

(assert (=> b!50074 (= e!32330 tp_is_empty!2183)))

(declare-fun b!50075 () Bool)

(declare-fun res!28888 () Bool)

(assert (=> b!50075 (=> (not res!28888) (not e!32328))))

(declare-fun newMap!16 () LongMapFixedSize!404)

(declare-fun valid!132 (LongMapFixedSize!404) Bool)

(assert (=> b!50075 (= res!28888 (valid!132 newMap!16))))

(declare-fun b!50076 () Bool)

(declare-fun res!28887 () Bool)

(assert (=> b!50076 (=> (not res!28887) (not e!32328))))

(assert (=> b!50076 (= res!28887 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5698 newMap!16)) (_size!251 (v!2158 (underlying!126 thiss!992)))))))

(declare-fun mapNonEmpty!2167 () Bool)

(declare-fun mapRes!2168 () Bool)

(declare-fun tp!6647 () Bool)

(assert (=> mapNonEmpty!2167 (= mapRes!2168 (and tp!6647 e!32329))))

(declare-fun mapRest!2167 () (Array (_ BitVec 32) ValueCell!748))

(declare-fun mapValue!2167 () ValueCell!748)

(declare-fun mapKey!2168 () (_ BitVec 32))

(assert (=> mapNonEmpty!2167 (= (arr!1568 (_values!1899 (v!2158 (underlying!126 thiss!992)))) (store mapRest!2167 mapKey!2168 mapValue!2167))))

(declare-fun res!28889 () Bool)

(assert (=> start!7980 (=> (not res!28889) (not e!32328))))

(declare-fun valid!133 (LongMap!230) Bool)

(assert (=> start!7980 (= res!28889 (valid!133 thiss!992))))

(assert (=> start!7980 e!32328))

(assert (=> start!7980 e!32326))

(assert (=> start!7980 true))

(declare-fun e!32323 () Bool)

(assert (=> start!7980 e!32323))

(declare-fun b!50077 () Bool)

(declare-fun e!32322 () Bool)

(assert (=> b!50077 (= e!32322 tp_is_empty!2183)))

(declare-fun b!50078 () Bool)

(declare-fun e!32324 () Bool)

(assert (=> b!50078 (= e!32320 e!32324)))

(declare-fun mapIsEmpty!2167 () Bool)

(assert (=> mapIsEmpty!2167 mapRes!2168))

(declare-fun e!32325 () Bool)

(declare-fun array_inv!959 (array!3275) Bool)

(declare-fun array_inv!960 (array!3277) Bool)

(assert (=> b!50079 (= e!32323 (and tp!6648 tp_is_empty!2183 (array_inv!959 (_keys!3522 newMap!16)) (array_inv!960 (_values!1899 newMap!16)) e!32325))))

(declare-fun e!32321 () Bool)

(assert (=> b!50080 (= e!32324 (and tp!6649 tp_is_empty!2183 (array_inv!959 (_keys!3522 (v!2158 (underlying!126 thiss!992)))) (array_inv!960 (_values!1899 (v!2158 (underlying!126 thiss!992)))) e!32321))))

(declare-fun b!50081 () Bool)

(declare-fun mapRes!2167 () Bool)

(assert (=> b!50081 (= e!32325 (and e!32330 mapRes!2167))))

(declare-fun condMapEmpty!2167 () Bool)

(declare-fun mapDefault!2167 () ValueCell!748)

