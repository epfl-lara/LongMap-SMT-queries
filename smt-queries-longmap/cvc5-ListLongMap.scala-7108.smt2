; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90094 () Bool)

(assert start!90094)

(declare-fun b!1032143 () Bool)

(declare-fun b_free!20701 () Bool)

(declare-fun b_next!20701 () Bool)

(assert (=> b!1032143 (= b_free!20701 (not b_next!20701))))

(declare-fun tp!73174 () Bool)

(declare-fun b_and!33169 () Bool)

(assert (=> b!1032143 (= tp!73174 b_and!33169)))

(declare-fun b!1032138 () Bool)

(declare-fun e!583090 () Bool)

(declare-fun e!583095 () Bool)

(declare-fun mapRes!38085 () Bool)

(assert (=> b!1032138 (= e!583090 (and e!583095 mapRes!38085))))

(declare-fun condMapEmpty!38085 () Bool)

(declare-datatypes ((V!37435 0))(
  ( (V!37436 (val!12261 Int)) )
))
(declare-datatypes ((ValueCell!11507 0))(
  ( (ValueCellFull!11507 (v!14838 V!37435)) (EmptyCell!11507) )
))
(declare-datatypes ((array!64906 0))(
  ( (array!64907 (arr!31255 (Array (_ BitVec 32) (_ BitVec 64))) (size!31772 (_ BitVec 32))) )
))
(declare-datatypes ((array!64908 0))(
  ( (array!64909 (arr!31256 (Array (_ BitVec 32) ValueCell!11507)) (size!31773 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5608 0))(
  ( (LongMapFixedSize!5609 (defaultEntry!6178 Int) (mask!29988 (_ BitVec 32)) (extraKeys!5910 (_ BitVec 32)) (zeroValue!6014 V!37435) (minValue!6014 V!37435) (_size!2859 (_ BitVec 32)) (_keys!11351 array!64906) (_values!6201 array!64908) (_vacant!2859 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5608)

(declare-fun mapDefault!38085 () ValueCell!11507)

