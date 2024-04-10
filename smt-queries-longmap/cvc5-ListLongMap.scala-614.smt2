; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15992 () Bool)

(assert start!15992)

(declare-fun b!158794 () Bool)

(declare-fun b_free!3493 () Bool)

(declare-fun b_next!3493 () Bool)

(assert (=> b!158794 (= b_free!3493 (not b_next!3493))))

(declare-fun tp!13040 () Bool)

(declare-fun b_and!9907 () Bool)

(assert (=> b!158794 (= tp!13040 b_and!9907)))

(declare-fun mapNonEmpty!5621 () Bool)

(declare-fun mapRes!5621 () Bool)

(declare-fun tp!13039 () Bool)

(declare-fun e!103981 () Bool)

(assert (=> mapNonEmpty!5621 (= mapRes!5621 (and tp!13039 e!103981))))

(declare-fun mapKey!5621 () (_ BitVec 32))

(declare-datatypes ((V!4041 0))(
  ( (V!4042 (val!1692 Int)) )
))
(declare-datatypes ((ValueCell!1304 0))(
  ( (ValueCellFull!1304 (v!3557 V!4041)) (EmptyCell!1304) )
))
(declare-fun mapValue!5621 () ValueCell!1304)

(declare-fun mapRest!5621 () (Array (_ BitVec 32) ValueCell!1304))

(declare-datatypes ((array!5663 0))(
  ( (array!5664 (arr!2679 (Array (_ BitVec 32) (_ BitVec 64))) (size!2963 (_ BitVec 32))) )
))
(declare-datatypes ((array!5665 0))(
  ( (array!5666 (arr!2680 (Array (_ BitVec 32) ValueCell!1304)) (size!2964 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1516 0))(
  ( (LongMapFixedSize!1517 (defaultEntry!3200 Int) (mask!7731 (_ BitVec 32)) (extraKeys!2941 (_ BitVec 32)) (zeroValue!3043 V!4041) (minValue!3043 V!4041) (_size!807 (_ BitVec 32)) (_keys!4995 array!5663) (_values!3183 array!5665) (_vacant!807 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1516)

(assert (=> mapNonEmpty!5621 (= (arr!2680 (_values!3183 thiss!1248)) (store mapRest!5621 mapKey!5621 mapValue!5621))))

(declare-fun b!158787 () Bool)

(declare-fun e!103983 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5663 (_ BitVec 32)) Bool)

(assert (=> b!158787 (= e!103983 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4995 thiss!1248) (mask!7731 thiss!1248))))))

(declare-fun b!158788 () Bool)

(declare-fun tp_is_empty!3295 () Bool)

(assert (=> b!158788 (= e!103981 tp_is_empty!3295)))

(declare-fun b!158789 () Bool)

(declare-fun res!74969 () Bool)

(assert (=> b!158789 (=> (not res!74969) (not e!103983))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158789 (= res!74969 (not (= key!828 (bvneg key!828))))))

(declare-fun res!74972 () Bool)

(assert (=> start!15992 (=> (not res!74972) (not e!103983))))

(declare-fun valid!714 (LongMapFixedSize!1516) Bool)

(assert (=> start!15992 (= res!74972 (valid!714 thiss!1248))))

(assert (=> start!15992 e!103983))

(declare-fun e!103982 () Bool)

(assert (=> start!15992 e!103982))

(assert (=> start!15992 true))

(declare-fun b!158786 () Bool)

(declare-fun res!74971 () Bool)

(assert (=> b!158786 (=> (not res!74971) (not e!103983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158786 (= res!74971 (validMask!0 (mask!7731 thiss!1248)))))

(declare-fun b!158790 () Bool)

(declare-fun e!103980 () Bool)

(declare-fun e!103978 () Bool)

(assert (=> b!158790 (= e!103980 (and e!103978 mapRes!5621))))

(declare-fun condMapEmpty!5621 () Bool)

(declare-fun mapDefault!5621 () ValueCell!1304)

