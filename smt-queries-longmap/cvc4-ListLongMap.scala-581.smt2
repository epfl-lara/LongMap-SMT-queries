; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15632 () Bool)

(assert start!15632)

(declare-fun b!155768 () Bool)

(declare-fun b_free!3299 () Bool)

(declare-fun b_next!3299 () Bool)

(assert (=> b!155768 (= b_free!3299 (not b_next!3299))))

(declare-fun tp!12421 () Bool)

(declare-fun b_and!9713 () Bool)

(assert (=> b!155768 (= tp!12421 b_and!9713)))

(declare-fun b!155760 () Bool)

(declare-fun res!73594 () Bool)

(declare-fun e!101766 () Bool)

(assert (=> b!155760 (=> (not res!73594) (not e!101766))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155760 (= res!73594 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155761 () Bool)

(declare-fun res!73591 () Bool)

(assert (=> b!155761 (=> (not res!73591) (not e!101766))))

(declare-datatypes ((V!3781 0))(
  ( (V!3782 (val!1595 Int)) )
))
(declare-datatypes ((ValueCell!1207 0))(
  ( (ValueCellFull!1207 (v!3460 V!3781)) (EmptyCell!1207) )
))
(declare-datatypes ((array!5255 0))(
  ( (array!5256 (arr!2485 (Array (_ BitVec 32) (_ BitVec 64))) (size!2763 (_ BitVec 32))) )
))
(declare-datatypes ((array!5257 0))(
  ( (array!5258 (arr!2486 (Array (_ BitVec 32) ValueCell!1207)) (size!2764 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1322 0))(
  ( (LongMapFixedSize!1323 (defaultEntry!3103 Int) (mask!7534 (_ BitVec 32)) (extraKeys!2844 (_ BitVec 32)) (zeroValue!2946 V!3781) (minValue!2946 V!3781) (_size!710 (_ BitVec 32)) (_keys!4878 array!5255) (_values!3086 array!5257) (_vacant!710 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1322)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5255 (_ BitVec 32)) Bool)

(assert (=> b!155761 (= res!73591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4878 thiss!1248) (mask!7534 thiss!1248)))))

(declare-fun b!155762 () Bool)

(assert (=> b!155762 (= e!101766 false)))

(declare-fun lt!81400 () Bool)

(declare-datatypes ((List!1833 0))(
  ( (Nil!1830) (Cons!1829 (h!2438 (_ BitVec 64)) (t!6635 List!1833)) )
))
(declare-fun arrayNoDuplicates!0 (array!5255 (_ BitVec 32) List!1833) Bool)

(assert (=> b!155762 (= lt!81400 (arrayNoDuplicates!0 (_keys!4878 thiss!1248) #b00000000000000000000000000000000 Nil!1830))))

(declare-fun b!155763 () Bool)

(declare-fun e!101765 () Bool)

(declare-fun tp_is_empty!3101 () Bool)

(assert (=> b!155763 (= e!101765 tp_is_empty!3101)))

(declare-fun b!155764 () Bool)

(declare-fun e!101768 () Bool)

(assert (=> b!155764 (= e!101768 tp_is_empty!3101)))

(declare-fun res!73590 () Bool)

(assert (=> start!15632 (=> (not res!73590) (not e!101766))))

(declare-fun valid!646 (LongMapFixedSize!1322) Bool)

(assert (=> start!15632 (= res!73590 (valid!646 thiss!1248))))

(assert (=> start!15632 e!101766))

(declare-fun e!101769 () Bool)

(assert (=> start!15632 e!101769))

(assert (=> start!15632 true))

(declare-fun b!155765 () Bool)

(declare-fun e!101767 () Bool)

(declare-fun mapRes!5294 () Bool)

(assert (=> b!155765 (= e!101767 (and e!101765 mapRes!5294))))

(declare-fun condMapEmpty!5294 () Bool)

(declare-fun mapDefault!5294 () ValueCell!1207)

