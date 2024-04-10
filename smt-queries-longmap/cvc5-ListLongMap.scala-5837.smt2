; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75388 () Bool)

(assert start!75388)

(declare-fun b!887689 () Bool)

(declare-fun b_free!15523 () Bool)

(declare-fun b_next!15523 () Bool)

(assert (=> b!887689 (= b_free!15523 (not b_next!15523))))

(declare-fun tp!54510 () Bool)

(declare-fun b_and!25759 () Bool)

(assert (=> b!887689 (= tp!54510 b_and!25759)))

(declare-fun e!494401 () Bool)

(declare-datatypes ((V!28767 0))(
  ( (V!28768 (val!8976 Int)) )
))
(declare-datatypes ((array!51666 0))(
  ( (array!51667 (arr!24847 (Array (_ BitVec 32) (_ BitVec 64))) (size!25287 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8444 0))(
  ( (ValueCellFull!8444 (v!11438 V!28767)) (EmptyCell!8444) )
))
(declare-datatypes ((array!51668 0))(
  ( (array!51669 (arr!24848 (Array (_ BitVec 32) ValueCell!8444)) (size!25288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3904 0))(
  ( (LongMapFixedSize!3905 (defaultEntry!5143 Int) (mask!25545 (_ BitVec 32)) (extraKeys!4837 (_ BitVec 32)) (zeroValue!4941 V!28767) (minValue!4941 V!28767) (_size!2007 (_ BitVec 32)) (_keys!9820 array!51666) (_values!5128 array!51668) (_vacant!2007 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1064 0))(
  ( (Cell!1065 (v!11439 LongMapFixedSize!3904)) )
))
(declare-datatypes ((LongMap!1064 0))(
  ( (LongMap!1065 (underlying!543 Cell!1064)) )
))
(declare-fun thiss!821 () LongMap!1064)

(declare-fun e!494398 () Bool)

(declare-fun tp_is_empty!17851 () Bool)

(declare-fun array_inv!19556 (array!51666) Bool)

(declare-fun array_inv!19557 (array!51668) Bool)

(assert (=> b!887689 (= e!494401 (and tp!54510 tp_is_empty!17851 (array_inv!19556 (_keys!9820 (v!11439 (underlying!543 thiss!821)))) (array_inv!19557 (_values!5128 (v!11439 (underlying!543 thiss!821)))) e!494398))))

(declare-fun b!887690 () Bool)

(declare-fun e!494399 () Bool)

(declare-fun e!494395 () Bool)

(assert (=> b!887690 (= e!494399 e!494395)))

(declare-fun mapIsEmpty!28303 () Bool)

(declare-fun mapRes!28303 () Bool)

(assert (=> mapIsEmpty!28303 mapRes!28303))

(declare-fun b!887692 () Bool)

(declare-fun e!494400 () Bool)

(declare-fun valid!1523 (LongMapFixedSize!3904) Bool)

(assert (=> b!887692 (= e!494400 (not (valid!1523 (v!11439 (underlying!543 thiss!821)))))))

(declare-fun b!887693 () Bool)

(declare-fun e!494397 () Bool)

(assert (=> b!887693 (= e!494397 tp_is_empty!17851)))

(declare-fun b!887694 () Bool)

(declare-fun e!494402 () Bool)

(assert (=> b!887694 (= e!494402 tp_is_empty!17851)))

(declare-fun b!887695 () Bool)

(assert (=> b!887695 (= e!494395 e!494401)))

(declare-fun mapNonEmpty!28303 () Bool)

(declare-fun tp!54509 () Bool)

(assert (=> mapNonEmpty!28303 (= mapRes!28303 (and tp!54509 e!494402))))

(declare-fun mapRest!28303 () (Array (_ BitVec 32) ValueCell!8444))

(declare-fun mapValue!28303 () ValueCell!8444)

(declare-fun mapKey!28303 () (_ BitVec 32))

(assert (=> mapNonEmpty!28303 (= (arr!24848 (_values!5128 (v!11439 (underlying!543 thiss!821)))) (store mapRest!28303 mapKey!28303 mapValue!28303))))

(declare-fun b!887691 () Bool)

(assert (=> b!887691 (= e!494398 (and e!494397 mapRes!28303))))

(declare-fun condMapEmpty!28303 () Bool)

(declare-fun mapDefault!28303 () ValueCell!8444)

