; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75430 () Bool)

(assert start!75430)

(declare-fun b!887960 () Bool)

(declare-fun b_free!15545 () Bool)

(declare-fun b_next!15545 () Bool)

(assert (=> b!887960 (= b_free!15545 (not b_next!15545))))

(declare-fun tp!54582 () Bool)

(declare-fun b_and!25781 () Bool)

(assert (=> b!887960 (= tp!54582 b_and!25781)))

(declare-fun lt!401528 () Bool)

(declare-datatypes ((array!51714 0))(
  ( (array!51715 (arr!24869 (Array (_ BitVec 32) (_ BitVec 64))) (size!25309 (_ BitVec 32))) )
))
(declare-datatypes ((V!28795 0))(
  ( (V!28796 (val!8987 Int)) )
))
(declare-datatypes ((ValueCell!8455 0))(
  ( (ValueCellFull!8455 (v!11459 V!28795)) (EmptyCell!8455) )
))
(declare-datatypes ((array!51716 0))(
  ( (array!51717 (arr!24870 (Array (_ BitVec 32) ValueCell!8455)) (size!25310 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3926 0))(
  ( (LongMapFixedSize!3927 (defaultEntry!5154 Int) (mask!25562 (_ BitVec 32)) (extraKeys!4848 (_ BitVec 32)) (zeroValue!4952 V!28795) (minValue!4952 V!28795) (_size!2018 (_ BitVec 32)) (_keys!9831 array!51714) (_values!5139 array!51716) (_vacant!2018 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3926)

(declare-fun valid!1531 (LongMapFixedSize!3926) Bool)

(assert (=> start!75430 (= lt!401528 (valid!1531 thiss!1181))))

(assert (=> start!75430 false))

(declare-fun e!494673 () Bool)

(assert (=> start!75430 e!494673))

(declare-fun e!494671 () Bool)

(declare-fun tp_is_empty!17873 () Bool)

(declare-fun array_inv!19574 (array!51714) Bool)

(declare-fun array_inv!19575 (array!51716) Bool)

(assert (=> b!887960 (= e!494673 (and tp!54582 tp_is_empty!17873 (array_inv!19574 (_keys!9831 thiss!1181)) (array_inv!19575 (_values!5139 thiss!1181)) e!494671))))

(declare-fun mapIsEmpty!28342 () Bool)

(declare-fun mapRes!28342 () Bool)

(assert (=> mapIsEmpty!28342 mapRes!28342))

(declare-fun b!887961 () Bool)

(declare-fun e!494672 () Bool)

(assert (=> b!887961 (= e!494672 tp_is_empty!17873)))

(declare-fun b!887962 () Bool)

(declare-fun e!494674 () Bool)

(assert (=> b!887962 (= e!494674 tp_is_empty!17873)))

(declare-fun mapNonEmpty!28342 () Bool)

(declare-fun tp!54581 () Bool)

(assert (=> mapNonEmpty!28342 (= mapRes!28342 (and tp!54581 e!494672))))

(declare-fun mapValue!28342 () ValueCell!8455)

(declare-fun mapRest!28342 () (Array (_ BitVec 32) ValueCell!8455))

(declare-fun mapKey!28342 () (_ BitVec 32))

(assert (=> mapNonEmpty!28342 (= (arr!24870 (_values!5139 thiss!1181)) (store mapRest!28342 mapKey!28342 mapValue!28342))))

(declare-fun b!887963 () Bool)

(assert (=> b!887963 (= e!494671 (and e!494674 mapRes!28342))))

(declare-fun condMapEmpty!28342 () Bool)

(declare-fun mapDefault!28342 () ValueCell!8455)

