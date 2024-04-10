; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16850 () Bool)

(assert start!16850)

(declare-fun b!169810 () Bool)

(declare-fun b_free!4169 () Bool)

(declare-fun b_next!4169 () Bool)

(assert (=> b!169810 (= b_free!4169 (not b_next!4169))))

(declare-fun tp!15112 () Bool)

(declare-fun b_and!10583 () Bool)

(assert (=> b!169810 (= tp!15112 b_and!10583)))

(declare-fun res!80730 () Bool)

(declare-fun e!112005 () Bool)

(assert (=> start!16850 (=> (not res!80730) (not e!112005))))

(declare-datatypes ((V!4901 0))(
  ( (V!4902 (val!2015 Int)) )
))
(declare-datatypes ((ValueCell!1627 0))(
  ( (ValueCellFull!1627 (v!3880 V!4901)) (EmptyCell!1627) )
))
(declare-datatypes ((array!6981 0))(
  ( (array!6982 (arr!3325 (Array (_ BitVec 32) (_ BitVec 64))) (size!3614 (_ BitVec 32))) )
))
(declare-datatypes ((array!6983 0))(
  ( (array!6984 (arr!3326 (Array (_ BitVec 32) ValueCell!1627)) (size!3615 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2162 0))(
  ( (LongMapFixedSize!2163 (defaultEntry!3523 Int) (mask!8316 (_ BitVec 32)) (extraKeys!3264 (_ BitVec 32)) (zeroValue!3366 V!4901) (minValue!3366 V!4901) (_size!1130 (_ BitVec 32)) (_keys!5349 array!6981) (_values!3506 array!6983) (_vacant!1130 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2162)

(declare-fun valid!929 (LongMapFixedSize!2162) Bool)

(assert (=> start!16850 (= res!80730 (valid!929 thiss!1248))))

(assert (=> start!16850 e!112005))

(declare-fun e!112009 () Bool)

(assert (=> start!16850 e!112009))

(assert (=> start!16850 true))

(declare-fun mapIsEmpty!6679 () Bool)

(declare-fun mapRes!6679 () Bool)

(assert (=> mapIsEmpty!6679 mapRes!6679))

(declare-fun tp_is_empty!3941 () Bool)

(declare-fun e!112008 () Bool)

(declare-fun array_inv!2133 (array!6981) Bool)

(declare-fun array_inv!2134 (array!6983) Bool)

(assert (=> b!169810 (= e!112009 (and tp!15112 tp_is_empty!3941 (array_inv!2133 (_keys!5349 thiss!1248)) (array_inv!2134 (_values!3506 thiss!1248)) e!112008))))

(declare-fun b!169811 () Bool)

(assert (=> b!169811 (= e!112005 (not (= (size!3615 (_values!3506 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8316 thiss!1248)))))))

(declare-fun b!169812 () Bool)

(declare-fun res!80728 () Bool)

(assert (=> b!169812 (=> (not res!80728) (not e!112005))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169812 (= res!80728 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169813 () Bool)

(declare-fun e!112007 () Bool)

(assert (=> b!169813 (= e!112007 tp_is_empty!3941)))

(declare-fun mapNonEmpty!6679 () Bool)

(declare-fun tp!15111 () Bool)

(assert (=> mapNonEmpty!6679 (= mapRes!6679 (and tp!15111 e!112007))))

(declare-fun mapValue!6679 () ValueCell!1627)

(declare-fun mapKey!6679 () (_ BitVec 32))

(declare-fun mapRest!6679 () (Array (_ BitVec 32) ValueCell!1627))

(assert (=> mapNonEmpty!6679 (= (arr!3326 (_values!3506 thiss!1248)) (store mapRest!6679 mapKey!6679 mapValue!6679))))

(declare-fun b!169814 () Bool)

(declare-fun res!80729 () Bool)

(assert (=> b!169814 (=> (not res!80729) (not e!112005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169814 (= res!80729 (validMask!0 (mask!8316 thiss!1248)))))

(declare-fun b!169815 () Bool)

(declare-fun e!112006 () Bool)

(assert (=> b!169815 (= e!112008 (and e!112006 mapRes!6679))))

(declare-fun condMapEmpty!6679 () Bool)

(declare-fun mapDefault!6679 () ValueCell!1627)

