; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89058 () Bool)

(assert start!89058)

(declare-fun b!1021113 () Bool)

(declare-fun b_free!20119 () Bool)

(declare-fun b_next!20119 () Bool)

(assert (=> b!1021113 (= b_free!20119 (not b_next!20119))))

(declare-fun tp!71386 () Bool)

(declare-fun b_and!32307 () Bool)

(assert (=> b!1021113 (= tp!71386 b_and!32307)))

(declare-fun b!1021108 () Bool)

(declare-fun e!574981 () Bool)

(declare-fun tp_is_empty!23839 () Bool)

(assert (=> b!1021108 (= e!574981 tp_is_empty!23839)))

(declare-fun mapIsEmpty!37170 () Bool)

(declare-fun mapRes!37170 () Bool)

(assert (=> mapIsEmpty!37170 mapRes!37170))

(declare-fun b!1021109 () Bool)

(declare-fun e!574978 () Bool)

(assert (=> b!1021109 (= e!574978 false)))

(declare-fun lt!449982 () Bool)

(declare-datatypes ((V!36659 0))(
  ( (V!36660 (val!11970 Int)) )
))
(declare-datatypes ((array!63718 0))(
  ( (array!63719 (arr!30673 (Array (_ BitVec 32) (_ BitVec 64))) (size!31184 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11216 0))(
  ( (ValueCellFull!11216 (v!14527 V!36659)) (EmptyCell!11216) )
))
(declare-datatypes ((array!63720 0))(
  ( (array!63721 (arr!30674 (Array (_ BitVec 32) ValueCell!11216)) (size!31185 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5026 0))(
  ( (LongMapFixedSize!5027 (defaultEntry!5865 Int) (mask!29428 (_ BitVec 32)) (extraKeys!5597 (_ BitVec 32)) (zeroValue!5701 V!36659) (minValue!5701 V!36659) (_size!2568 (_ BitVec 32)) (_keys!11010 array!63718) (_values!5888 array!63720) (_vacant!2568 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1100 0))(
  ( (Cell!1101 (v!14528 LongMapFixedSize!5026)) )
))
(declare-datatypes ((LongMap!1100 0))(
  ( (LongMap!1101 (underlying!561 Cell!1100)) )
))
(declare-fun thiss!908 () LongMap!1100)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1914 (LongMap!1100) Bool)

(declare-datatypes ((tuple2!15476 0))(
  ( (tuple2!15477 (_1!7749 Bool) (_2!7749 LongMapFixedSize!5026)) )
))
(declare-fun remove!6 (LongMapFixedSize!5026 (_ BitVec 64)) tuple2!15476)

(assert (=> b!1021109 (= lt!449982 (valid!1914 (LongMap!1101 (Cell!1101 (_2!7749 (remove!6 (v!14528 (underlying!561 thiss!908)) key!697))))))))

(declare-fun b!1021110 () Bool)

(declare-fun e!574980 () Bool)

(declare-fun e!574982 () Bool)

(assert (=> b!1021110 (= e!574980 e!574982)))

(declare-fun b!1021111 () Bool)

(declare-fun e!574976 () Bool)

(assert (=> b!1021111 (= e!574982 e!574976)))

(declare-fun b!1021112 () Bool)

(declare-fun e!574983 () Bool)

(declare-fun e!574979 () Bool)

(assert (=> b!1021112 (= e!574983 (and e!574979 mapRes!37170))))

(declare-fun condMapEmpty!37170 () Bool)

(declare-fun mapDefault!37170 () ValueCell!11216)

