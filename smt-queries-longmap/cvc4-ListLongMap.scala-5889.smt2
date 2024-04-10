; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75904 () Bool)

(assert start!75904)

(declare-fun b!893073 () Bool)

(declare-fun b_free!15839 () Bool)

(declare-fun b_next!15839 () Bool)

(assert (=> b!893073 (= b_free!15839 (not b_next!15839))))

(declare-fun tp!55488 () Bool)

(declare-fun b_and!26101 () Bool)

(assert (=> b!893073 (= tp!55488 b_and!26101)))

(declare-fun b!893072 () Bool)

(declare-fun e!498674 () Bool)

(declare-fun tp_is_empty!18167 () Bool)

(assert (=> b!893072 (= e!498674 tp_is_empty!18167)))

(declare-datatypes ((array!52316 0))(
  ( (array!52317 (arr!25163 (Array (_ BitVec 32) (_ BitVec 64))) (size!25607 (_ BitVec 32))) )
))
(declare-datatypes ((V!29187 0))(
  ( (V!29188 (val!9134 Int)) )
))
(declare-datatypes ((ValueCell!8602 0))(
  ( (ValueCellFull!8602 (v!11613 V!29187)) (EmptyCell!8602) )
))
(declare-datatypes ((array!52318 0))(
  ( (array!52319 (arr!25164 (Array (_ BitVec 32) ValueCell!8602)) (size!25608 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4220 0))(
  ( (LongMapFixedSize!4221 (defaultEntry!5310 Int) (mask!25832 (_ BitVec 32)) (extraKeys!5005 (_ BitVec 32)) (zeroValue!5109 V!29187) (minValue!5109 V!29187) (_size!2165 (_ BitVec 32)) (_keys!9995 array!52316) (_values!5296 array!52318) (_vacant!2165 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4220)

(declare-fun e!498673 () Bool)

(declare-fun e!498672 () Bool)

(declare-fun array_inv!19762 (array!52316) Bool)

(declare-fun array_inv!19763 (array!52318) Bool)

(assert (=> b!893073 (= e!498673 (and tp!55488 tp_is_empty!18167 (array_inv!19762 (_keys!9995 thiss!1181)) (array_inv!19763 (_values!5296 thiss!1181)) e!498672))))

(declare-fun res!604877 () Bool)

(declare-fun e!498676 () Bool)

(assert (=> start!75904 (=> (not res!604877) (not e!498676))))

(declare-fun valid!1631 (LongMapFixedSize!4220) Bool)

(assert (=> start!75904 (= res!604877 (valid!1631 thiss!1181))))

(assert (=> start!75904 e!498676))

(assert (=> start!75904 e!498673))

(assert (=> start!75904 true))

(declare-fun b!893074 () Bool)

(declare-fun e!498677 () Bool)

(assert (=> b!893074 (= e!498677 tp_is_empty!18167)))

(declare-fun b!893075 () Bool)

(declare-fun mapRes!28808 () Bool)

(assert (=> b!893075 (= e!498672 (and e!498674 mapRes!28808))))

(declare-fun condMapEmpty!28808 () Bool)

(declare-fun mapDefault!28808 () ValueCell!8602)

