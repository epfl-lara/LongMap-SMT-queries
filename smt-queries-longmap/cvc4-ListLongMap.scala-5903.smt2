; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76336 () Bool)

(assert start!76336)

(declare-fun b!895798 () Bool)

(declare-fun b_free!15923 () Bool)

(declare-fun b_next!15923 () Bool)

(assert (=> b!895798 (= b_free!15923 (not b_next!15923))))

(declare-fun tp!55785 () Bool)

(declare-fun b_and!26215 () Bool)

(assert (=> b!895798 (= tp!55785 b_and!26215)))

(declare-fun b!895793 () Bool)

(declare-fun e!500558 () Bool)

(declare-fun tp_is_empty!18251 () Bool)

(assert (=> b!895793 (= e!500558 tp_is_empty!18251)))

(declare-fun mapIsEmpty!28978 () Bool)

(declare-fun mapRes!28978 () Bool)

(assert (=> mapIsEmpty!28978 mapRes!28978))

(declare-fun mapNonEmpty!28978 () Bool)

(declare-fun tp!55784 () Bool)

(assert (=> mapNonEmpty!28978 (= mapRes!28978 (and tp!55784 e!500558))))

(declare-fun mapKey!28978 () (_ BitVec 32))

(declare-datatypes ((array!52508 0))(
  ( (array!52509 (arr!25247 (Array (_ BitVec 32) (_ BitVec 64))) (size!25697 (_ BitVec 32))) )
))
(declare-datatypes ((V!29299 0))(
  ( (V!29300 (val!9176 Int)) )
))
(declare-datatypes ((ValueCell!8644 0))(
  ( (ValueCellFull!8644 (v!11666 V!29299)) (EmptyCell!8644) )
))
(declare-datatypes ((array!52510 0))(
  ( (array!52511 (arr!25248 (Array (_ BitVec 32) ValueCell!8644)) (size!25698 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4304 0))(
  ( (LongMapFixedSize!4305 (defaultEntry!5364 Int) (mask!25973 (_ BitVec 32)) (extraKeys!5060 (_ BitVec 32)) (zeroValue!5164 V!29299) (minValue!5164 V!29299) (_size!2207 (_ BitVec 32)) (_keys!10083 array!52508) (_values!5351 array!52510) (_vacant!2207 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4304)

(declare-fun mapRest!28978 () (Array (_ BitVec 32) ValueCell!8644))

(declare-fun mapValue!28978 () ValueCell!8644)

(assert (=> mapNonEmpty!28978 (= (arr!25248 (_values!5351 thiss!1181)) (store mapRest!28978 mapKey!28978 mapValue!28978))))

(declare-fun b!895794 () Bool)

(declare-fun res!605882 () Bool)

(declare-fun e!500561 () Bool)

(assert (=> b!895794 (=> (not res!605882) (not e!500561))))

(assert (=> b!895794 (= res!605882 (and (= (size!25698 (_values!5351 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25973 thiss!1181))) (= (size!25697 (_keys!10083 thiss!1181)) (size!25698 (_values!5351 thiss!1181))) (bvsge (mask!25973 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5060 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5060 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895795 () Bool)

(declare-fun e!500563 () Bool)

(assert (=> b!895795 (= e!500563 tp_is_empty!18251)))

(declare-fun res!605880 () Bool)

(declare-fun e!500559 () Bool)

(assert (=> start!76336 (=> (not res!605880) (not e!500559))))

(declare-fun valid!1660 (LongMapFixedSize!4304) Bool)

(assert (=> start!76336 (= res!605880 (valid!1660 thiss!1181))))

(assert (=> start!76336 e!500559))

(declare-fun e!500562 () Bool)

(assert (=> start!76336 e!500562))

(assert (=> start!76336 true))

(declare-fun b!895796 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895796 (= e!500561 (not (validKeyInArray!0 key!785)))))

(declare-fun b!895797 () Bool)

(declare-fun res!605881 () Bool)

(assert (=> b!895797 (=> (not res!605881) (not e!500561))))

(declare-datatypes ((List!17818 0))(
  ( (Nil!17815) (Cons!17814 (h!18951 (_ BitVec 64)) (t!25157 List!17818)) )
))
(declare-fun arrayNoDuplicates!0 (array!52508 (_ BitVec 32) List!17818) Bool)

(assert (=> b!895797 (= res!605881 (arrayNoDuplicates!0 (_keys!10083 thiss!1181) #b00000000000000000000000000000000 Nil!17815))))

(declare-fun e!500560 () Bool)

(declare-fun array_inv!19822 (array!52508) Bool)

(declare-fun array_inv!19823 (array!52510) Bool)

(assert (=> b!895798 (= e!500562 (and tp!55785 tp_is_empty!18251 (array_inv!19822 (_keys!10083 thiss!1181)) (array_inv!19823 (_values!5351 thiss!1181)) e!500560))))

(declare-fun b!895799 () Bool)

(assert (=> b!895799 (= e!500560 (and e!500563 mapRes!28978))))

(declare-fun condMapEmpty!28978 () Bool)

(declare-fun mapDefault!28978 () ValueCell!8644)

