; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8084 () Bool)

(assert start!8084)

(declare-fun b!50821 () Bool)

(declare-fun b_free!1561 () Bool)

(declare-fun b_next!1561 () Bool)

(assert (=> b!50821 (= b_free!1561 (not b_next!1561))))

(declare-fun tp!6758 () Bool)

(declare-fun b_and!2771 () Bool)

(assert (=> b!50821 (= tp!6758 b_and!2771)))

(declare-fun b!50810 () Bool)

(declare-fun b_free!1563 () Bool)

(declare-fun b_next!1563 () Bool)

(assert (=> b!50810 (= b_free!1563 (not b_next!1563))))

(declare-fun tp!6757 () Bool)

(declare-fun b_and!2773 () Bool)

(assert (=> b!50810 (= tp!6757 b_and!2773)))

(declare-fun mapIsEmpty!2233 () Bool)

(declare-fun mapRes!2233 () Bool)

(assert (=> mapIsEmpty!2233 mapRes!2233))

(declare-fun b!50808 () Bool)

(declare-fun res!29189 () Bool)

(declare-fun e!32869 () Bool)

(assert (=> b!50808 (=> (not res!29189) (not e!32869))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2577 0))(
  ( (V!2578 (val!1143 Int)) )
))
(declare-datatypes ((array!3309 0))(
  ( (array!3310 (arr!1581 (Array (_ BitVec 32) (_ BitVec 64))) (size!1806 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!755 0))(
  ( (ValueCellFull!755 (v!2174 V!2577)) (EmptyCell!755) )
))
(declare-datatypes ((array!3311 0))(
  ( (array!3312 (arr!1582 (Array (_ BitVec 32) ValueCell!755)) (size!1807 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!418 0))(
  ( (LongMapFixedSize!419 (defaultEntry!1923 Int) (mask!5720 (_ BitVec 32)) (extraKeys!1814 (_ BitVec 32)) (zeroValue!1841 V!2577) (minValue!1841 V!2577) (_size!258 (_ BitVec 32)) (_keys!3535 array!3309) (_values!1906 array!3311) (_vacant!258 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!244 0))(
  ( (Cell!245 (v!2175 LongMapFixedSize!418)) )
))
(declare-datatypes ((LongMap!244 0))(
  ( (LongMap!245 (underlying!133 Cell!244)) )
))
(declare-fun thiss!992 () LongMap!244)

(assert (=> b!50808 (= res!29189 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1806 (_keys!3535 (v!2175 (underlying!133 thiss!992)))))))))

(declare-fun mapNonEmpty!2233 () Bool)

(declare-fun tp!6755 () Bool)

(declare-fun e!32870 () Bool)

(assert (=> mapNonEmpty!2233 (= mapRes!2233 (and tp!6755 e!32870))))

(declare-fun mapKey!2233 () (_ BitVec 32))

(declare-fun mapValue!2233 () ValueCell!755)

(declare-fun mapRest!2233 () (Array (_ BitVec 32) ValueCell!755))

(declare-fun newMap!16 () LongMapFixedSize!418)

(assert (=> mapNonEmpty!2233 (= (arr!1582 (_values!1906 newMap!16)) (store mapRest!2233 mapKey!2233 mapValue!2233))))

(declare-fun mapNonEmpty!2234 () Bool)

(declare-fun mapRes!2234 () Bool)

(declare-fun tp!6756 () Bool)

(declare-fun e!32874 () Bool)

(assert (=> mapNonEmpty!2234 (= mapRes!2234 (and tp!6756 e!32874))))

(declare-fun mapKey!2234 () (_ BitVec 32))

(declare-fun mapRest!2234 () (Array (_ BitVec 32) ValueCell!755))

(declare-fun mapValue!2234 () ValueCell!755)

(assert (=> mapNonEmpty!2234 (= (arr!1582 (_values!1906 (v!2175 (underlying!133 thiss!992)))) (store mapRest!2234 mapKey!2234 mapValue!2234))))

(declare-fun b!50809 () Bool)

(declare-fun e!32867 () Bool)

(declare-fun e!32875 () Bool)

(assert (=> b!50809 (= e!32867 e!32875)))

(declare-fun e!32866 () Bool)

(declare-fun tp_is_empty!2197 () Bool)

(declare-fun e!32872 () Bool)

(declare-fun array_inv!969 (array!3309) Bool)

(declare-fun array_inv!970 (array!3311) Bool)

(assert (=> b!50810 (= e!32872 (and tp!6757 tp_is_empty!2197 (array_inv!969 (_keys!3535 newMap!16)) (array_inv!970 (_values!1906 newMap!16)) e!32866))))

(declare-fun b!50811 () Bool)

(declare-fun res!29186 () Bool)

(assert (=> b!50811 (=> (not res!29186) (not e!32869))))

(declare-fun valid!139 (LongMapFixedSize!418) Bool)

(assert (=> b!50811 (= res!29186 (valid!139 newMap!16))))

(declare-fun b!50812 () Bool)

(declare-fun res!29187 () Bool)

(assert (=> b!50812 (=> (not res!29187) (not e!32869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50812 (= res!29187 (validMask!0 (mask!5720 (v!2175 (underlying!133 thiss!992)))))))

(declare-fun b!50813 () Bool)

(declare-fun e!32865 () Bool)

(assert (=> b!50813 (= e!32865 tp_is_empty!2197)))

(declare-fun b!50814 () Bool)

(declare-fun e!32864 () Bool)

(assert (=> b!50814 (= e!32864 e!32867)))

(declare-fun b!50815 () Bool)

(declare-fun e!32863 () Bool)

(assert (=> b!50815 (= e!32863 tp_is_empty!2197)))

(declare-fun b!50816 () Bool)

(declare-fun e!32871 () Bool)

(assert (=> b!50816 (= e!32871 (and e!32865 mapRes!2234))))

(declare-fun condMapEmpty!2233 () Bool)

(declare-fun mapDefault!2233 () ValueCell!755)

