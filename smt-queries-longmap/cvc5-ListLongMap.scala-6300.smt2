; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80584 () Bool)

(assert start!80584)

(declare-fun b!945939 () Bool)

(declare-fun b_free!18121 () Bool)

(declare-fun b_next!18121 () Bool)

(assert (=> b!945939 (= b_free!18121 (not b_next!18121))))

(declare-fun tp!62894 () Bool)

(declare-fun b_and!29543 () Bool)

(assert (=> b!945939 (= tp!62894 b_and!29543)))

(declare-fun b!945937 () Bool)

(declare-fun e!532144 () Bool)

(declare-fun tp_is_empty!20629 () Bool)

(assert (=> b!945937 (= e!532144 tp_is_empty!20629)))

(declare-fun b!945938 () Bool)

(declare-fun e!532138 () Bool)

(declare-fun e!532142 () Bool)

(declare-fun mapRes!32790 () Bool)

(assert (=> b!945938 (= e!532138 (and e!532142 mapRes!32790))))

(declare-fun condMapEmpty!32790 () Bool)

(declare-datatypes ((V!32471 0))(
  ( (V!32472 (val!10365 Int)) )
))
(declare-datatypes ((ValueCell!9833 0))(
  ( (ValueCellFull!9833 (v!12899 V!32471)) (EmptyCell!9833) )
))
(declare-datatypes ((array!57238 0))(
  ( (array!57239 (arr!27538 (Array (_ BitVec 32) ValueCell!9833)) (size!28007 (_ BitVec 32))) )
))
(declare-datatypes ((array!57240 0))(
  ( (array!57241 (arr!27539 (Array (_ BitVec 32) (_ BitVec 64))) (size!28008 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4816 0))(
  ( (LongMapFixedSize!4817 (defaultEntry!5705 Int) (mask!27390 (_ BitVec 32)) (extraKeys!5437 (_ BitVec 32)) (zeroValue!5541 V!32471) (minValue!5541 V!32471) (_size!2463 (_ BitVec 32)) (_keys!10592 array!57240) (_values!5728 array!57238) (_vacant!2463 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4816)

(declare-fun mapDefault!32790 () ValueCell!9833)

