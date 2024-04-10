; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8716 () Bool)

(assert start!8716)

(declare-fun b!60355 () Bool)

(declare-fun b_free!1969 () Bool)

(declare-fun b_next!1969 () Bool)

(assert (=> b!60355 (= b_free!1969 (not b_next!1969))))

(declare-fun tp!8027 () Bool)

(declare-fun b_and!3659 () Bool)

(assert (=> b!60355 (= tp!8027 b_and!3659)))

(declare-fun b!60365 () Bool)

(declare-fun b_free!1971 () Bool)

(declare-fun b_next!1971 () Bool)

(assert (=> b!60365 (= b_free!1971 (not b_next!1971))))

(declare-fun tp!8028 () Bool)

(declare-fun b_and!3661 () Bool)

(assert (=> b!60365 (= tp!8028 b_and!3661)))

(declare-fun b!60354 () Bool)

(declare-fun e!39652 () Bool)

(declare-fun tp_is_empty!2401 () Bool)

(assert (=> b!60354 (= e!39652 tp_is_empty!2401)))

(declare-datatypes ((V!2849 0))(
  ( (V!2850 (val!1245 Int)) )
))
(declare-datatypes ((array!3731 0))(
  ( (array!3732 (arr!1785 (Array (_ BitVec 32) (_ BitVec 64))) (size!2016 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!857 0))(
  ( (ValueCellFull!857 (v!2395 V!2849)) (EmptyCell!857) )
))
(declare-datatypes ((array!3733 0))(
  ( (array!3734 (arr!1786 (Array (_ BitVec 32) ValueCell!857)) (size!2017 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!622 0))(
  ( (LongMapFixedSize!623 (defaultEntry!2063 Int) (mask!5957 (_ BitVec 32)) (extraKeys!1946 (_ BitVec 32)) (zeroValue!1977 V!2849) (minValue!1977 V!2849) (_size!360 (_ BitVec 32)) (_keys!3691 array!3731) (_values!2046 array!3733) (_vacant!360 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!432 0))(
  ( (Cell!433 (v!2396 LongMapFixedSize!622)) )
))
(declare-datatypes ((LongMap!432 0))(
  ( (LongMap!433 (underlying!227 Cell!432)) )
))
(declare-fun thiss!992 () LongMap!432)

(declare-fun e!39656 () Bool)

(declare-fun e!39662 () Bool)

(declare-fun array_inv!1103 (array!3731) Bool)

(declare-fun array_inv!1104 (array!3733) Bool)

(assert (=> b!60355 (= e!39662 (and tp!8027 tp_is_empty!2401 (array_inv!1103 (_keys!3691 (v!2396 (underlying!227 thiss!992)))) (array_inv!1104 (_values!2046 (v!2396 (underlying!227 thiss!992)))) e!39656))))

(declare-fun b!60356 () Bool)

(declare-fun e!39655 () Bool)

(assert (=> b!60356 (= e!39655 tp_is_empty!2401)))

(declare-fun b!60357 () Bool)

(declare-fun e!39651 () Bool)

(assert (=> b!60357 (= e!39651 e!39662)))

(declare-fun b!60358 () Bool)

(declare-fun e!39666 () Bool)

(assert (=> b!60358 (= e!39666 tp_is_empty!2401)))

(declare-fun b!60359 () Bool)

(declare-fun res!33397 () Bool)

(declare-fun e!39664 () Bool)

(assert (=> b!60359 (=> (not res!33397) (not e!39664))))

(declare-fun newMap!16 () LongMapFixedSize!622)

(declare-fun valid!256 (LongMapFixedSize!622) Bool)

(assert (=> b!60359 (= res!33397 (valid!256 newMap!16))))

(declare-fun mapIsEmpty!2893 () Bool)

(declare-fun mapRes!2894 () Bool)

(assert (=> mapIsEmpty!2893 mapRes!2894))

(declare-fun mapNonEmpty!2893 () Bool)

(declare-fun mapRes!2893 () Bool)

(declare-fun tp!8029 () Bool)

(assert (=> mapNonEmpty!2893 (= mapRes!2893 (and tp!8029 e!39666))))

(declare-fun mapKey!2894 () (_ BitVec 32))

(declare-fun mapRest!2894 () (Array (_ BitVec 32) ValueCell!857))

(declare-fun mapValue!2894 () ValueCell!857)

(assert (=> mapNonEmpty!2893 (= (arr!1786 (_values!2046 newMap!16)) (store mapRest!2894 mapKey!2894 mapValue!2894))))

(declare-fun b!60360 () Bool)

(declare-datatypes ((Unit!1614 0))(
  ( (Unit!1615) )
))
(declare-fun e!39659 () Unit!1614)

(declare-fun Unit!1616 () Unit!1614)

(assert (=> b!60360 (= e!39659 Unit!1616)))

(declare-fun b!60361 () Bool)

(declare-fun e!39663 () Bool)

(assert (=> b!60361 (= e!39663 tp_is_empty!2401)))

(declare-fun b!60362 () Bool)

(declare-fun res!33399 () Bool)

(assert (=> b!60362 (=> (not res!33399) (not e!39664))))

(assert (=> b!60362 (= res!33399 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5957 newMap!16)) (_size!360 (v!2396 (underlying!227 thiss!992)))))))

(declare-fun b!60363 () Bool)

(assert (=> b!60363 (= e!39656 (and e!39663 mapRes!2894))))

(declare-fun condMapEmpty!2893 () Bool)

(declare-fun mapDefault!2893 () ValueCell!857)

