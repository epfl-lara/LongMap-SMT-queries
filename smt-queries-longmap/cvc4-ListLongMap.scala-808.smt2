; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19586 () Bool)

(assert start!19586)

(declare-fun b!192170 () Bool)

(declare-fun b_free!4691 () Bool)

(declare-fun b_next!4691 () Bool)

(assert (=> b!192170 (= b_free!4691 (not b_next!4691))))

(declare-fun tp!16926 () Bool)

(declare-fun b_and!11377 () Bool)

(assert (=> b!192170 (= tp!16926 b_and!11377)))

(declare-fun mapIsEmpty!7711 () Bool)

(declare-fun mapRes!7711 () Bool)

(assert (=> mapIsEmpty!7711 mapRes!7711))

(declare-fun b!192163 () Bool)

(declare-datatypes ((Unit!5814 0))(
  ( (Unit!5815) )
))
(declare-fun e!126460 () Unit!5814)

(declare-fun Unit!5816 () Unit!5814)

(assert (=> b!192163 (= e!126460 Unit!5816)))

(declare-fun lt!95494 () Unit!5814)

(declare-datatypes ((V!5597 0))(
  ( (V!5598 (val!2276 Int)) )
))
(declare-datatypes ((ValueCell!1888 0))(
  ( (ValueCellFull!1888 (v!4221 V!5597)) (EmptyCell!1888) )
))
(declare-datatypes ((array!8167 0))(
  ( (array!8168 (arr!3847 (Array (_ BitVec 32) (_ BitVec 64))) (size!4170 (_ BitVec 32))) )
))
(declare-datatypes ((array!8169 0))(
  ( (array!8170 (arr!3848 (Array (_ BitVec 32) ValueCell!1888)) (size!4171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2684 0))(
  ( (LongMapFixedSize!2685 (defaultEntry!3922 Int) (mask!9152 (_ BitVec 32)) (extraKeys!3659 (_ BitVec 32)) (zeroValue!3763 V!5597) (minValue!3763 V!5597) (_size!1391 (_ BitVec 32)) (_keys!5904 array!8167) (_values!3905 array!8169) (_vacant!1391 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2684)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!184 (array!8167 array!8169 (_ BitVec 32) (_ BitVec 32) V!5597 V!5597 (_ BitVec 64) Int) Unit!5814)

(assert (=> b!192163 (= lt!95494 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!184 (_keys!5904 thiss!1248) (_values!3905 thiss!1248) (mask!9152 thiss!1248) (extraKeys!3659 thiss!1248) (zeroValue!3763 thiss!1248) (minValue!3763 thiss!1248) key!828 (defaultEntry!3922 thiss!1248)))))

(assert (=> b!192163 false))

(declare-fun b!192164 () Bool)

(declare-fun e!126462 () Bool)

(declare-fun tp_is_empty!4463 () Bool)

(assert (=> b!192164 (= e!126462 tp_is_empty!4463)))

(declare-fun res!90807 () Bool)

(declare-fun e!126463 () Bool)

(assert (=> start!19586 (=> (not res!90807) (not e!126463))))

(declare-fun valid!1102 (LongMapFixedSize!2684) Bool)

(assert (=> start!19586 (= res!90807 (valid!1102 thiss!1248))))

(assert (=> start!19586 e!126463))

(declare-fun e!126466 () Bool)

(assert (=> start!19586 e!126466))

(assert (=> start!19586 true))

(assert (=> start!19586 tp_is_empty!4463))

(declare-fun b!192165 () Bool)

(declare-fun res!90806 () Bool)

(assert (=> b!192165 (=> (not res!90806) (not e!126463))))

(assert (=> b!192165 (= res!90806 (not (= key!828 (bvneg key!828))))))

(declare-fun b!192166 () Bool)

(declare-fun e!126464 () Bool)

(assert (=> b!192166 (= e!126464 (and e!126462 mapRes!7711))))

(declare-fun condMapEmpty!7711 () Bool)

(declare-fun mapDefault!7711 () ValueCell!1888)

