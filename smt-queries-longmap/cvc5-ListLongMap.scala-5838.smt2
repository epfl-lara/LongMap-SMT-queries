; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75402 () Bool)

(assert start!75402)

(declare-fun b!887769 () Bool)

(declare-fun b_free!15529 () Bool)

(declare-fun b_next!15529 () Bool)

(assert (=> b!887769 (= b_free!15529 (not b_next!15529))))

(declare-fun tp!54531 () Bool)

(declare-fun b_and!25765 () Bool)

(assert (=> b!887769 (= tp!54531 b_and!25765)))

(declare-datatypes ((V!28775 0))(
  ( (V!28776 (val!8979 Int)) )
))
(declare-datatypes ((array!51680 0))(
  ( (array!51681 (arr!24853 (Array (_ BitVec 32) (_ BitVec 64))) (size!25293 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8447 0))(
  ( (ValueCellFull!8447 (v!11444 V!28775)) (EmptyCell!8447) )
))
(declare-datatypes ((array!51682 0))(
  ( (array!51683 (arr!24854 (Array (_ BitVec 32) ValueCell!8447)) (size!25294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3910 0))(
  ( (LongMapFixedSize!3911 (defaultEntry!5146 Int) (mask!25550 (_ BitVec 32)) (extraKeys!4840 (_ BitVec 32)) (zeroValue!4944 V!28775) (minValue!4944 V!28775) (_size!2010 (_ BitVec 32)) (_keys!9823 array!51680) (_values!5131 array!51682) (_vacant!2010 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1070 0))(
  ( (Cell!1071 (v!11445 LongMapFixedSize!3910)) )
))
(declare-datatypes ((LongMap!1070 0))(
  ( (LongMap!1071 (underlying!546 Cell!1070)) )
))
(declare-fun thiss!821 () LongMap!1070)

(declare-fun tp_is_empty!17857 () Bool)

(declare-fun e!494480 () Bool)

(declare-fun e!494476 () Bool)

(declare-fun array_inv!19560 (array!51680) Bool)

(declare-fun array_inv!19561 (array!51682) Bool)

(assert (=> b!887769 (= e!494476 (and tp!54531 tp_is_empty!17857 (array_inv!19560 (_keys!9823 (v!11445 (underlying!546 thiss!821)))) (array_inv!19561 (_values!5131 (v!11445 (underlying!546 thiss!821)))) e!494480))))

(declare-fun b!887770 () Bool)

(declare-fun e!494478 () Bool)

(assert (=> b!887770 (= e!494478 e!494476)))

(declare-fun b!887771 () Bool)

(declare-fun e!494477 () Bool)

(assert (=> b!887771 (= e!494477 tp_is_empty!17857)))

(declare-fun b!887772 () Bool)

(declare-fun e!494483 () Bool)

(declare-fun mapRes!28315 () Bool)

(assert (=> b!887772 (= e!494480 (and e!494483 mapRes!28315))))

(declare-fun condMapEmpty!28315 () Bool)

(declare-fun mapDefault!28315 () ValueCell!8447)

