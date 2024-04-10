; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3022 () Bool)

(assert start!3022)

(declare-fun b!17872 () Bool)

(declare-fun b_free!629 () Bool)

(declare-fun b_next!629 () Bool)

(assert (=> b!17872 (= b_free!629 (not b_next!629))))

(declare-fun tp!3077 () Bool)

(declare-fun b_and!1277 () Bool)

(assert (=> b!17872 (= tp!3077 b_and!1277)))

(declare-fun b!17868 () Bool)

(declare-fun e!11352 () Bool)

(declare-fun tp_is_empty!893 () Bool)

(assert (=> b!17868 (= e!11352 tp_is_empty!893)))

(declare-fun b!17869 () Bool)

(declare-fun e!11354 () Bool)

(declare-fun e!11350 () Bool)

(declare-fun mapRes!774 () Bool)

(assert (=> b!17869 (= e!11354 (and e!11350 mapRes!774))))

(declare-fun condMapEmpty!774 () Bool)

(declare-datatypes ((V!1015 0))(
  ( (V!1016 (val!473 Int)) )
))
(declare-datatypes ((ValueCell!247 0))(
  ( (ValueCellFull!247 (v!1450 V!1015)) (EmptyCell!247) )
))
(declare-datatypes ((array!991 0))(
  ( (array!992 (arr!477 (Array (_ BitVec 32) ValueCell!247)) (size!567 (_ BitVec 32))) )
))
(declare-datatypes ((array!993 0))(
  ( (array!994 (arr!478 (Array (_ BitVec 32) (_ BitVec 64))) (size!568 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!80 0))(
  ( (LongMapFixedSize!81 (defaultEntry!1651 Int) (mask!4576 (_ BitVec 32)) (extraKeys!1564 (_ BitVec 32)) (zeroValue!1587 V!1015) (minValue!1587 V!1015) (_size!72 (_ BitVec 32)) (_keys!3076 array!993) (_values!1648 array!991) (_vacant!72 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!80 0))(
  ( (Cell!81 (v!1451 LongMapFixedSize!80)) )
))
(declare-datatypes ((LongMap!80 0))(
  ( (LongMap!81 (underlying!51 Cell!80)) )
))
(declare-fun thiss!848 () LongMap!80)

(declare-fun mapDefault!774 () ValueCell!247)

