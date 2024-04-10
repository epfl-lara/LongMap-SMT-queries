; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75916 () Bool)

(assert start!75916)

(declare-fun b!893224 () Bool)

(declare-fun b_free!15851 () Bool)

(declare-fun b_next!15851 () Bool)

(assert (=> b!893224 (= b_free!15851 (not b_next!15851))))

(declare-fun tp!55524 () Bool)

(declare-fun b_and!26113 () Bool)

(assert (=> b!893224 (= tp!55524 b_and!26113)))

(declare-fun b!893223 () Bool)

(declare-fun e!498817 () Bool)

(declare-fun tp_is_empty!18179 () Bool)

(assert (=> b!893223 (= e!498817 tp_is_empty!18179)))

(declare-fun res!604956 () Bool)

(declare-fun e!498818 () Bool)

(assert (=> start!75916 (=> (not res!604956) (not e!498818))))

(declare-datatypes ((array!52340 0))(
  ( (array!52341 (arr!25175 (Array (_ BitVec 32) (_ BitVec 64))) (size!25619 (_ BitVec 32))) )
))
(declare-datatypes ((V!29203 0))(
  ( (V!29204 (val!9140 Int)) )
))
(declare-datatypes ((ValueCell!8608 0))(
  ( (ValueCellFull!8608 (v!11621 V!29203)) (EmptyCell!8608) )
))
(declare-datatypes ((array!52342 0))(
  ( (array!52343 (arr!25176 (Array (_ BitVec 32) ValueCell!8608)) (size!25620 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4232 0))(
  ( (LongMapFixedSize!4233 (defaultEntry!5316 Int) (mask!25842 (_ BitVec 32)) (extraKeys!5011 (_ BitVec 32)) (zeroValue!5115 V!29203) (minValue!5115 V!29203) (_size!2171 (_ BitVec 32)) (_keys!10001 array!52340) (_values!5302 array!52342) (_vacant!2171 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4232)

(declare-fun valid!1636 (LongMapFixedSize!4232) Bool)

(assert (=> start!75916 (= res!604956 (valid!1636 thiss!1181))))

(assert (=> start!75916 e!498818))

(declare-fun e!498822 () Bool)

(assert (=> start!75916 e!498822))

(assert (=> start!75916 true))

(declare-fun e!498816 () Bool)

(declare-fun array_inv!19772 (array!52340) Bool)

(declare-fun array_inv!19773 (array!52342) Bool)

(assert (=> b!893224 (= e!498822 (and tp!55524 tp_is_empty!18179 (array_inv!19772 (_keys!10001 thiss!1181)) (array_inv!19773 (_values!5302 thiss!1181)) e!498816))))

(declare-fun b!893225 () Bool)

(declare-fun res!604954 () Bool)

(assert (=> b!893225 (=> (not res!604954) (not e!498818))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!893225 (= res!604954 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28826 () Bool)

(declare-fun mapRes!28826 () Bool)

(assert (=> mapIsEmpty!28826 mapRes!28826))

(declare-fun b!893226 () Bool)

(declare-fun e!498815 () Bool)

(assert (=> b!893226 (= e!498815 tp_is_empty!18179)))

(declare-fun b!893227 () Bool)

(assert (=> b!893227 (= e!498816 (and e!498817 mapRes!28826))))

(declare-fun condMapEmpty!28826 () Bool)

(declare-fun mapDefault!28826 () ValueCell!8608)

