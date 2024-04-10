; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17146 () Bool)

(assert start!17146)

(declare-fun b!172308 () Bool)

(declare-fun b_free!4249 () Bool)

(declare-fun b_next!4249 () Bool)

(assert (=> b!172308 (= b_free!4249 (not b_next!4249))))

(declare-fun tp!15390 () Bool)

(declare-fun b_and!10689 () Bool)

(assert (=> b!172308 (= tp!15390 b_and!10689)))

(declare-fun b!172306 () Bool)

(declare-fun res!81819 () Bool)

(declare-fun e!113729 () Bool)

(assert (=> b!172306 (=> (not res!81819) (not e!113729))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172306 (= res!81819 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172307 () Bool)

(declare-fun e!113732 () Bool)

(declare-fun tp_is_empty!4021 () Bool)

(assert (=> b!172307 (= e!113732 tp_is_empty!4021)))

(declare-fun mapIsEmpty!6837 () Bool)

(declare-fun mapRes!6837 () Bool)

(assert (=> mapIsEmpty!6837 mapRes!6837))

(declare-fun mapNonEmpty!6837 () Bool)

(declare-fun tp!15389 () Bool)

(declare-fun e!113731 () Bool)

(assert (=> mapNonEmpty!6837 (= mapRes!6837 (and tp!15389 e!113731))))

(declare-fun mapKey!6837 () (_ BitVec 32))

(declare-datatypes ((V!5009 0))(
  ( (V!5010 (val!2055 Int)) )
))
(declare-datatypes ((ValueCell!1667 0))(
  ( (ValueCellFull!1667 (v!3923 V!5009)) (EmptyCell!1667) )
))
(declare-fun mapRest!6837 () (Array (_ BitVec 32) ValueCell!1667))

(declare-datatypes ((array!7161 0))(
  ( (array!7162 (arr!3405 (Array (_ BitVec 32) (_ BitVec 64))) (size!3701 (_ BitVec 32))) )
))
(declare-datatypes ((array!7163 0))(
  ( (array!7164 (arr!3406 (Array (_ BitVec 32) ValueCell!1667)) (size!3702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2242 0))(
  ( (LongMapFixedSize!2243 (defaultEntry!3567 Int) (mask!8408 (_ BitVec 32)) (extraKeys!3306 (_ BitVec 32)) (zeroValue!3408 V!5009) (minValue!3410 V!5009) (_size!1170 (_ BitVec 32)) (_keys!5403 array!7161) (_values!3550 array!7163) (_vacant!1170 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2242)

(declare-fun mapValue!6837 () ValueCell!1667)

(assert (=> mapNonEmpty!6837 (= (arr!3406 (_values!3550 thiss!1248)) (store mapRest!6837 mapKey!6837 mapValue!6837))))

(declare-fun e!113730 () Bool)

(declare-fun e!113728 () Bool)

(declare-fun array_inv!2181 (array!7161) Bool)

(declare-fun array_inv!2182 (array!7163) Bool)

(assert (=> b!172308 (= e!113730 (and tp!15390 tp_is_empty!4021 (array_inv!2181 (_keys!5403 thiss!1248)) (array_inv!2182 (_values!3550 thiss!1248)) e!113728))))

(declare-fun b!172309 () Bool)

(assert (=> b!172309 (= e!113731 tp_is_empty!4021)))

(declare-fun b!172310 () Bool)

(declare-fun res!81818 () Bool)

(assert (=> b!172310 (=> (not res!81818) (not e!113729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172310 (= res!81818 (validMask!0 (mask!8408 thiss!1248)))))

(declare-fun res!81817 () Bool)

(assert (=> start!17146 (=> (not res!81817) (not e!113729))))

(declare-fun valid!952 (LongMapFixedSize!2242) Bool)

(assert (=> start!17146 (= res!81817 (valid!952 thiss!1248))))

(assert (=> start!17146 e!113729))

(assert (=> start!17146 e!113730))

(assert (=> start!17146 true))

(declare-fun b!172311 () Bool)

(assert (=> b!172311 (= e!113728 (and e!113732 mapRes!6837))))

(declare-fun condMapEmpty!6837 () Bool)

(declare-fun mapDefault!6837 () ValueCell!1667)

