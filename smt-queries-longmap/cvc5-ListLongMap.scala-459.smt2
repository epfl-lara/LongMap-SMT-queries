; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8366 () Bool)

(assert start!8366)

(declare-fun b!56090 () Bool)

(declare-fun b_free!1897 () Bool)

(declare-fun b_next!1897 () Bool)

(assert (=> b!56090 (= b_free!1897 (not b_next!1897))))

(declare-fun tp!7791 () Bool)

(declare-fun b_and!3335 () Bool)

(assert (=> b!56090 (= tp!7791 b_and!3335)))

(declare-fun b!56102 () Bool)

(declare-fun b_free!1899 () Bool)

(declare-fun b_next!1899 () Bool)

(assert (=> b!56102 (= b_free!1899 (not b_next!1899))))

(declare-fun tp!7793 () Bool)

(declare-fun b_and!3337 () Bool)

(assert (=> b!56102 (= tp!7793 b_and!3337)))

(declare-fun mapIsEmpty!2765 () Bool)

(declare-fun mapRes!2765 () Bool)

(assert (=> mapIsEmpty!2765 mapRes!2765))

(declare-fun mapNonEmpty!2765 () Bool)

(declare-fun mapRes!2766 () Bool)

(declare-fun tp!7792 () Bool)

(declare-fun e!36909 () Bool)

(assert (=> mapNonEmpty!2765 (= mapRes!2766 (and tp!7792 e!36909))))

(declare-datatypes ((V!2801 0))(
  ( (V!2802 (val!1227 Int)) )
))
(declare-datatypes ((ValueCell!839 0))(
  ( (ValueCellFull!839 (v!2340 V!2801)) (EmptyCell!839) )
))
(declare-fun mapValue!2766 () ValueCell!839)

(declare-fun mapRest!2765 () (Array (_ BitVec 32) ValueCell!839))

(declare-datatypes ((array!3653 0))(
  ( (array!3654 (arr!1749 (Array (_ BitVec 32) (_ BitVec 64))) (size!1978 (_ BitVec 32))) )
))
(declare-datatypes ((array!3655 0))(
  ( (array!3656 (arr!1750 (Array (_ BitVec 32) ValueCell!839)) (size!1979 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!586 0))(
  ( (LongMapFixedSize!587 (defaultEntry!2007 Int) (mask!5872 (_ BitVec 32)) (extraKeys!1898 (_ BitVec 32)) (zeroValue!1925 V!2801) (minValue!1925 V!2801) (_size!342 (_ BitVec 32)) (_keys!3627 array!3653) (_values!1990 array!3655) (_vacant!342 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!586)

(declare-fun mapKey!2766 () (_ BitVec 32))

(assert (=> mapNonEmpty!2765 (= (arr!1750 (_values!1990 newMap!16)) (store mapRest!2765 mapKey!2766 mapValue!2766))))

(declare-fun b!56085 () Bool)

(declare-fun e!36898 () Bool)

(declare-fun e!36902 () Bool)

(assert (=> b!56085 (= e!36898 (and e!36902 mapRes!2765))))

(declare-fun condMapEmpty!2766 () Bool)

(declare-datatypes ((Cell!402 0))(
  ( (Cell!403 (v!2341 LongMapFixedSize!586)) )
))
(declare-datatypes ((LongMap!402 0))(
  ( (LongMap!403 (underlying!212 Cell!402)) )
))
(declare-fun thiss!992 () LongMap!402)

(declare-fun mapDefault!2765 () ValueCell!839)

