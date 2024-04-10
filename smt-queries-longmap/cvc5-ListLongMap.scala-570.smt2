; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15562 () Bool)

(assert start!15562)

(declare-fun b!154815 () Bool)

(declare-fun b_free!3229 () Bool)

(declare-fun b_next!3229 () Bool)

(assert (=> b!154815 (= b_free!3229 (not b_next!3229))))

(declare-fun tp!12211 () Bool)

(declare-fun b_and!9643 () Bool)

(assert (=> b!154815 (= tp!12211 b_and!9643)))

(declare-fun e!101135 () Bool)

(declare-fun e!101138 () Bool)

(declare-fun tp_is_empty!3031 () Bool)

(declare-datatypes ((V!3689 0))(
  ( (V!3690 (val!1560 Int)) )
))
(declare-datatypes ((ValueCell!1172 0))(
  ( (ValueCellFull!1172 (v!3425 V!3689)) (EmptyCell!1172) )
))
(declare-datatypes ((array!5115 0))(
  ( (array!5116 (arr!2415 (Array (_ BitVec 32) (_ BitVec 64))) (size!2693 (_ BitVec 32))) )
))
(declare-datatypes ((array!5117 0))(
  ( (array!5118 (arr!2416 (Array (_ BitVec 32) ValueCell!1172)) (size!2694 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1252 0))(
  ( (LongMapFixedSize!1253 (defaultEntry!3068 Int) (mask!7477 (_ BitVec 32)) (extraKeys!2809 (_ BitVec 32)) (zeroValue!2911 V!3689) (minValue!2911 V!3689) (_size!675 (_ BitVec 32)) (_keys!4843 array!5115) (_values!3051 array!5117) (_vacant!675 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1252)

(declare-fun array_inv!1525 (array!5115) Bool)

(declare-fun array_inv!1526 (array!5117) Bool)

(assert (=> b!154815 (= e!101138 (and tp!12211 tp_is_empty!3031 (array_inv!1525 (_keys!4843 thiss!1248)) (array_inv!1526 (_values!3051 thiss!1248)) e!101135))))

(declare-fun b!154816 () Bool)

(declare-fun res!73068 () Bool)

(declare-fun e!101136 () Bool)

(assert (=> b!154816 (=> (not res!73068) (not e!101136))))

(assert (=> b!154816 (= res!73068 (and (= (size!2694 (_values!3051 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7477 thiss!1248))) (= (size!2693 (_keys!4843 thiss!1248)) (size!2694 (_values!3051 thiss!1248))) (bvsge (mask!7477 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2809 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2809 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2809 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5189 () Bool)

(declare-fun mapRes!5189 () Bool)

(assert (=> mapIsEmpty!5189 mapRes!5189))

(declare-fun res!73067 () Bool)

(assert (=> start!15562 (=> (not res!73067) (not e!101136))))

(declare-fun valid!620 (LongMapFixedSize!1252) Bool)

(assert (=> start!15562 (= res!73067 (valid!620 thiss!1248))))

(assert (=> start!15562 e!101136))

(assert (=> start!15562 e!101138))

(assert (=> start!15562 true))

(declare-fun b!154817 () Bool)

(assert (=> b!154817 (= e!101136 false)))

(declare-fun lt!81295 () Bool)

(declare-datatypes ((List!1809 0))(
  ( (Nil!1806) (Cons!1805 (h!2414 (_ BitVec 64)) (t!6611 List!1809)) )
))
(declare-fun arrayNoDuplicates!0 (array!5115 (_ BitVec 32) List!1809) Bool)

(assert (=> b!154817 (= lt!81295 (arrayNoDuplicates!0 (_keys!4843 thiss!1248) #b00000000000000000000000000000000 Nil!1806))))

(declare-fun b!154818 () Bool)

(declare-fun e!101137 () Bool)

(assert (=> b!154818 (= e!101135 (and e!101137 mapRes!5189))))

(declare-fun condMapEmpty!5189 () Bool)

(declare-fun mapDefault!5189 () ValueCell!1172)

