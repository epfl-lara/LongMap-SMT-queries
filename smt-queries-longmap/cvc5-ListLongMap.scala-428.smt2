; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7976 () Bool)

(assert start!7976)

(declare-fun b!49999 () Bool)

(declare-fun b_free!1525 () Bool)

(declare-fun b_next!1525 () Bool)

(assert (=> b!49999 (= b_free!1525 (not b_next!1525))))

(declare-fun tp!6624 () Bool)

(declare-fun b_and!2735 () Bool)

(assert (=> b!49999 (= tp!6624 b_and!2735)))

(declare-fun b!49987 () Bool)

(declare-fun b_free!1527 () Bool)

(declare-fun b_next!1527 () Bool)

(assert (=> b!49987 (= b_free!1527 (not b_next!1527))))

(declare-fun tp!6626 () Bool)

(declare-fun b_and!2737 () Bool)

(assert (=> b!49987 (= tp!6626 b_and!2737)))

(declare-fun e!32244 () Bool)

(declare-fun tp_is_empty!2179 () Bool)

(declare-datatypes ((V!2553 0))(
  ( (V!2554 (val!1134 Int)) )
))
(declare-datatypes ((array!3267 0))(
  ( (array!3268 (arr!1563 (Array (_ BitVec 32) (_ BitVec 64))) (size!1785 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!746 0))(
  ( (ValueCellFull!746 (v!2153 V!2553)) (EmptyCell!746) )
))
(declare-datatypes ((array!3269 0))(
  ( (array!3270 (arr!1564 (Array (_ BitVec 32) ValueCell!746)) (size!1786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!400 0))(
  ( (LongMapFixedSize!401 (defaultEntry!1914 Int) (mask!5696 (_ BitVec 32)) (extraKeys!1805 (_ BitVec 32)) (zeroValue!1832 V!2553) (minValue!1832 V!2553) (_size!249 (_ BitVec 32)) (_keys!3520 array!3267) (_values!1897 array!3269) (_vacant!249 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!400)

(declare-fun e!32250 () Bool)

(declare-fun array_inv!955 (array!3267) Bool)

(declare-fun array_inv!956 (array!3269) Bool)

(assert (=> b!49987 (= e!32250 (and tp!6626 tp_is_empty!2179 (array_inv!955 (_keys!3520 newMap!16)) (array_inv!956 (_values!1897 newMap!16)) e!32244))))

(declare-fun b!49989 () Bool)

(declare-fun e!32254 () Bool)

(declare-fun e!32247 () Bool)

(declare-fun mapRes!2155 () Bool)

(assert (=> b!49989 (= e!32254 (and e!32247 mapRes!2155))))

(declare-fun condMapEmpty!2156 () Bool)

(declare-datatypes ((Cell!226 0))(
  ( (Cell!227 (v!2154 LongMapFixedSize!400)) )
))
(declare-datatypes ((LongMap!226 0))(
  ( (LongMap!227 (underlying!124 Cell!226)) )
))
(declare-fun thiss!992 () LongMap!226)

(declare-fun mapDefault!2155 () ValueCell!746)

