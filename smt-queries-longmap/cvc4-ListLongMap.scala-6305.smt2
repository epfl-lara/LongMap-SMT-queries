; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80736 () Bool)

(assert start!80736)

(declare-fun b!946846 () Bool)

(declare-fun b_free!18155 () Bool)

(declare-fun b_next!18155 () Bool)

(assert (=> b!946846 (= b_free!18155 (not b_next!18155))))

(declare-fun tp!63014 () Bool)

(declare-fun b_and!29577 () Bool)

(assert (=> b!946846 (= tp!63014 b_and!29577)))

(declare-fun mapNonEmpty!32859 () Bool)

(declare-fun mapRes!32859 () Bool)

(declare-fun tp!63013 () Bool)

(declare-fun e!532840 () Bool)

(assert (=> mapNonEmpty!32859 (= mapRes!32859 (and tp!63013 e!532840))))

(declare-fun mapKey!32859 () (_ BitVec 32))

(declare-datatypes ((V!32515 0))(
  ( (V!32516 (val!10382 Int)) )
))
(declare-datatypes ((ValueCell!9850 0))(
  ( (ValueCellFull!9850 (v!12916 V!32515)) (EmptyCell!9850) )
))
(declare-fun mapRest!32859 () (Array (_ BitVec 32) ValueCell!9850))

(declare-datatypes ((array!57316 0))(
  ( (array!57317 (arr!27572 (Array (_ BitVec 32) ValueCell!9850)) (size!28044 (_ BitVec 32))) )
))
(declare-datatypes ((array!57318 0))(
  ( (array!57319 (arr!27573 (Array (_ BitVec 32) (_ BitVec 64))) (size!28045 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4850 0))(
  ( (LongMapFixedSize!4851 (defaultEntry!5722 Int) (mask!27439 (_ BitVec 32)) (extraKeys!5454 (_ BitVec 32)) (zeroValue!5558 V!32515) (minValue!5558 V!32515) (_size!2480 (_ BitVec 32)) (_keys!10623 array!57318) (_values!5745 array!57316) (_vacant!2480 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4850)

(declare-fun mapValue!32859 () ValueCell!9850)

(assert (=> mapNonEmpty!32859 (= (arr!27572 (_values!5745 thiss!1141)) (store mapRest!32859 mapKey!32859 mapValue!32859))))

(declare-fun b!946843 () Bool)

(declare-fun tp_is_empty!20663 () Bool)

(assert (=> b!946843 (= e!532840 tp_is_empty!20663)))

(declare-fun b!946844 () Bool)

(declare-fun e!532835 () Bool)

(declare-fun e!532839 () Bool)

(assert (=> b!946844 (= e!532835 (and e!532839 mapRes!32859))))

(declare-fun condMapEmpty!32859 () Bool)

(declare-fun mapDefault!32859 () ValueCell!9850)

