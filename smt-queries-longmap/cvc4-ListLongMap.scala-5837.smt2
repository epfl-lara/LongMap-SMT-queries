; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75392 () Bool)

(assert start!75392)

(declare-fun b!887732 () Bool)

(declare-fun b_free!15527 () Bool)

(declare-fun b_next!15527 () Bool)

(assert (=> b!887732 (= b_free!15527 (not b_next!15527))))

(declare-fun tp!54521 () Bool)

(declare-fun b_and!25763 () Bool)

(assert (=> b!887732 (= tp!54521 b_and!25763)))

(declare-fun b!887731 () Bool)

(declare-fun e!494445 () Bool)

(declare-fun e!494443 () Bool)

(declare-fun mapRes!28309 () Bool)

(assert (=> b!887731 (= e!494445 (and e!494443 mapRes!28309))))

(declare-fun condMapEmpty!28309 () Bool)

(declare-datatypes ((V!28771 0))(
  ( (V!28772 (val!8978 Int)) )
))
(declare-datatypes ((array!51674 0))(
  ( (array!51675 (arr!24851 (Array (_ BitVec 32) (_ BitVec 64))) (size!25291 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8446 0))(
  ( (ValueCellFull!8446 (v!11442 V!28771)) (EmptyCell!8446) )
))
(declare-datatypes ((array!51676 0))(
  ( (array!51677 (arr!24852 (Array (_ BitVec 32) ValueCell!8446)) (size!25292 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3908 0))(
  ( (LongMapFixedSize!3909 (defaultEntry!5145 Int) (mask!25547 (_ BitVec 32)) (extraKeys!4839 (_ BitVec 32)) (zeroValue!4943 V!28771) (minValue!4943 V!28771) (_size!2009 (_ BitVec 32)) (_keys!9822 array!51674) (_values!5130 array!51676) (_vacant!2009 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1068 0))(
  ( (Cell!1069 (v!11443 LongMapFixedSize!3908)) )
))
(declare-datatypes ((LongMap!1068 0))(
  ( (LongMap!1069 (underlying!545 Cell!1068)) )
))
(declare-fun thiss!821 () LongMap!1068)

(declare-fun mapDefault!28309 () ValueCell!8446)

