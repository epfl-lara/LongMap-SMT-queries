; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15484 () Bool)

(assert start!15484)

(declare-fun b!154087 () Bool)

(declare-fun b_free!3225 () Bool)

(declare-fun b_next!3225 () Bool)

(assert (=> b!154087 (= b_free!3225 (not b_next!3225))))

(declare-fun tp!12197 () Bool)

(declare-fun b_and!9595 () Bool)

(assert (=> b!154087 (= tp!12197 b_and!9595)))

(declare-fun b!154092 () Bool)

(declare-fun b_free!3227 () Bool)

(declare-fun b_next!3227 () Bool)

(assert (=> b!154092 (= b_free!3227 (not b_next!3227))))

(declare-fun tp!12198 () Bool)

(declare-fun b_and!9597 () Bool)

(assert (=> b!154092 (= tp!12198 b_and!9597)))

(declare-fun b!154079 () Bool)

(declare-fun e!100685 () Bool)

(declare-fun tp_is_empty!3029 () Bool)

(assert (=> b!154079 (= e!100685 tp_is_empty!3029)))

(declare-fun mapNonEmpty!5177 () Bool)

(declare-fun mapRes!5177 () Bool)

(declare-fun tp!12196 () Bool)

(declare-fun e!100696 () Bool)

(assert (=> mapNonEmpty!5177 (= mapRes!5177 (and tp!12196 e!100696))))

(declare-datatypes ((V!3685 0))(
  ( (V!3686 (val!1559 Int)) )
))
(declare-datatypes ((ValueCell!1171 0))(
  ( (ValueCellFull!1171 (v!3420 V!3685)) (EmptyCell!1171) )
))
(declare-fun mapValue!5178 () ValueCell!1171)

(declare-datatypes ((array!5109 0))(
  ( (array!5110 (arr!2413 (Array (_ BitVec 32) (_ BitVec 64))) (size!2690 (_ BitVec 32))) )
))
(declare-datatypes ((array!5111 0))(
  ( (array!5112 (arr!2414 (Array (_ BitVec 32) ValueCell!1171)) (size!2691 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1250 0))(
  ( (LongMapFixedSize!1251 (defaultEntry!3065 Int) (mask!7469 (_ BitVec 32)) (extraKeys!2806 (_ BitVec 32)) (zeroValue!2908 V!3685) (minValue!2908 V!3685) (_size!674 (_ BitVec 32)) (_keys!4838 array!5109) (_values!3048 array!5111) (_vacant!674 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1250)

(declare-fun mapKey!5178 () (_ BitVec 32))

(declare-fun mapRest!5177 () (Array (_ BitVec 32) ValueCell!1171))

(assert (=> mapNonEmpty!5177 (= (arr!2414 (_values!3048 newMap!16)) (store mapRest!5177 mapKey!5178 mapValue!5178))))

(declare-fun b!154080 () Bool)

(declare-fun e!100695 () Bool)

(declare-fun e!100688 () Bool)

(assert (=> b!154080 (= e!100695 e!100688)))

(declare-fun b!154081 () Bool)

(declare-fun e!100693 () Bool)

(assert (=> b!154081 (= e!100693 tp_is_empty!3029)))

(declare-fun res!72767 () Bool)

(declare-fun e!100692 () Bool)

(assert (=> start!15484 (=> (not res!72767) (not e!100692))))

(declare-datatypes ((Cell!1032 0))(
  ( (Cell!1033 (v!3421 LongMapFixedSize!1250)) )
))
(declare-datatypes ((LongMap!1032 0))(
  ( (LongMap!1033 (underlying!527 Cell!1032)) )
))
(declare-fun thiss!992 () LongMap!1032)

(declare-fun valid!618 (LongMap!1032) Bool)

(assert (=> start!15484 (= res!72767 (valid!618 thiss!992))))

(assert (=> start!15484 e!100692))

(declare-fun e!100694 () Bool)

(assert (=> start!15484 e!100694))

(assert (=> start!15484 true))

(declare-fun e!100690 () Bool)

(assert (=> start!15484 e!100690))

(declare-fun b!154082 () Bool)

(declare-fun e!100686 () Bool)

(assert (=> b!154082 (= e!100686 tp_is_empty!3029)))

(declare-fun b!154083 () Bool)

(assert (=> b!154083 (= e!100696 tp_is_empty!3029)))

(declare-fun mapIsEmpty!5177 () Bool)

(declare-fun mapRes!5178 () Bool)

(assert (=> mapIsEmpty!5177 mapRes!5178))

(declare-fun b!154084 () Bool)

(declare-fun res!72765 () Bool)

(assert (=> b!154084 (=> (not res!72765) (not e!100692))))

(declare-fun valid!619 (LongMapFixedSize!1250) Bool)

(assert (=> b!154084 (= res!72765 (valid!619 newMap!16))))

(declare-fun b!154085 () Bool)

(declare-fun res!72768 () Bool)

(assert (=> b!154085 (=> (not res!72768) (not e!100692))))

(assert (=> b!154085 (= res!72768 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7469 newMap!16)) (_size!674 (v!3421 (underlying!527 thiss!992)))))))

(declare-fun b!154086 () Bool)

(declare-fun res!72764 () Bool)

(assert (=> b!154086 (=> (not res!72764) (not e!100692))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!154086 (= res!72764 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2690 (_keys!4838 (v!3421 (underlying!527 thiss!992)))))))))

(declare-fun e!100697 () Bool)

(declare-fun array_inv!1523 (array!5109) Bool)

(declare-fun array_inv!1524 (array!5111) Bool)

(assert (=> b!154087 (= e!100688 (and tp!12197 tp_is_empty!3029 (array_inv!1523 (_keys!4838 (v!3421 (underlying!527 thiss!992)))) (array_inv!1524 (_values!3048 (v!3421 (underlying!527 thiss!992)))) e!100697))))

(declare-fun mapIsEmpty!5178 () Bool)

(assert (=> mapIsEmpty!5178 mapRes!5177))

(declare-fun b!154088 () Bool)

(assert (=> b!154088 (= e!100697 (and e!100693 mapRes!5178))))

(declare-fun condMapEmpty!5178 () Bool)

(declare-fun mapDefault!5178 () ValueCell!1171)

