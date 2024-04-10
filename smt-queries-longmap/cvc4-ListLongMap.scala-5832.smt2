; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75290 () Bool)

(assert start!75290)

(declare-fun b!887035 () Bool)

(declare-fun b_free!15497 () Bool)

(declare-fun b_next!15497 () Bool)

(assert (=> b!887035 (= b_free!15497 (not b_next!15497))))

(declare-fun tp!54421 () Bool)

(declare-fun b_and!25703 () Bool)

(assert (=> b!887035 (= tp!54421 b_and!25703)))

(declare-fun mapIsEmpty!28254 () Bool)

(declare-fun mapRes!28254 () Bool)

(assert (=> mapIsEmpty!28254 mapRes!28254))

(declare-fun res!602044 () Bool)

(declare-fun e!493862 () Bool)

(assert (=> start!75290 (=> (not res!602044) (not e!493862))))

(declare-datatypes ((V!28731 0))(
  ( (V!28732 (val!8963 Int)) )
))
(declare-datatypes ((ValueCell!8431 0))(
  ( (ValueCellFull!8431 (v!11406 V!28731)) (EmptyCell!8431) )
))
(declare-datatypes ((array!51608 0))(
  ( (array!51609 (arr!24821 (Array (_ BitVec 32) ValueCell!8431)) (size!25261 (_ BitVec 32))) )
))
(declare-datatypes ((array!51610 0))(
  ( (array!51611 (arr!24822 (Array (_ BitVec 32) (_ BitVec 64))) (size!25262 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3878 0))(
  ( (LongMapFixedSize!3879 (defaultEntry!5127 Int) (mask!25516 (_ BitVec 32)) (extraKeys!4820 (_ BitVec 32)) (zeroValue!4924 V!28731) (minValue!4924 V!28731) (_size!1994 (_ BitVec 32)) (_keys!9802 array!51610) (_values!5111 array!51608) (_vacant!1994 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1038 0))(
  ( (Cell!1039 (v!11407 LongMapFixedSize!3878)) )
))
(declare-datatypes ((LongMap!1038 0))(
  ( (LongMap!1039 (underlying!530 Cell!1038)) )
))
(declare-fun thiss!833 () LongMap!1038)

(declare-fun valid!1510 (LongMap!1038) Bool)

(assert (=> start!75290 (= res!602044 (valid!1510 thiss!833))))

(assert (=> start!75290 e!493862))

(declare-fun e!493860 () Bool)

(assert (=> start!75290 e!493860))

(declare-fun e!493859 () Bool)

(declare-fun e!493863 () Bool)

(declare-fun tp_is_empty!17825 () Bool)

(declare-fun array_inv!19542 (array!51610) Bool)

(declare-fun array_inv!19543 (array!51608) Bool)

(assert (=> b!887035 (= e!493859 (and tp!54421 tp_is_empty!17825 (array_inv!19542 (_keys!9802 (v!11407 (underlying!530 thiss!833)))) (array_inv!19543 (_values!5111 (v!11407 (underlying!530 thiss!833)))) e!493863))))

(declare-fun b!887036 () Bool)

(declare-fun e!493856 () Bool)

(assert (=> b!887036 (= e!493856 e!493859)))

(declare-fun b!887037 () Bool)

(declare-fun valid!1511 (LongMapFixedSize!3878) Bool)

(assert (=> b!887037 (= e!493862 (not (valid!1511 (v!11407 (underlying!530 thiss!833)))))))

(declare-fun b!887038 () Bool)

(declare-fun e!493857 () Bool)

(assert (=> b!887038 (= e!493863 (and e!493857 mapRes!28254))))

(declare-fun condMapEmpty!28254 () Bool)

(declare-fun mapDefault!28254 () ValueCell!8431)

