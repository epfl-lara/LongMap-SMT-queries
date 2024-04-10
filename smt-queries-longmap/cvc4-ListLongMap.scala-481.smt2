; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10140 () Bool)

(assert start!10140)

(declare-fun b!77260 () Bool)

(declare-fun b_free!2169 () Bool)

(declare-fun b_next!2169 () Bool)

(assert (=> b!77260 (= b_free!2169 (not b_next!2169))))

(declare-fun tp!8704 () Bool)

(declare-fun b_and!4739 () Bool)

(assert (=> b!77260 (= tp!8704 b_and!4739)))

(declare-fun b!77254 () Bool)

(declare-fun b_free!2171 () Bool)

(declare-fun b_next!2171 () Bool)

(assert (=> b!77254 (= b_free!2171 (not b_next!2171))))

(declare-fun tp!8705 () Bool)

(declare-fun b_and!4741 () Bool)

(assert (=> b!77254 (= tp!8705 b_and!4741)))

(declare-fun b!77252 () Bool)

(declare-fun e!50495 () Bool)

(declare-fun tp_is_empty!2501 () Bool)

(assert (=> b!77252 (= e!50495 tp_is_empty!2501)))

(declare-fun mapIsEmpty!3269 () Bool)

(declare-fun mapRes!3270 () Bool)

(assert (=> mapIsEmpty!3269 mapRes!3270))

(declare-fun b!77253 () Bool)

(declare-fun e!50491 () Bool)

(declare-fun e!50488 () Bool)

(declare-fun mapRes!3269 () Bool)

(assert (=> b!77253 (= e!50491 (and e!50488 mapRes!3269))))

(declare-fun condMapEmpty!3269 () Bool)

(declare-datatypes ((V!2981 0))(
  ( (V!2982 (val!1295 Int)) )
))
(declare-datatypes ((array!3953 0))(
  ( (array!3954 (arr!1885 (Array (_ BitVec 32) (_ BitVec 64))) (size!2126 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!907 0))(
  ( (ValueCellFull!907 (v!2579 V!2981)) (EmptyCell!907) )
))
(declare-datatypes ((array!3955 0))(
  ( (array!3956 (arr!1886 (Array (_ BitVec 32) ValueCell!907)) (size!2127 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!722 0))(
  ( (LongMapFixedSize!723 (defaultEntry!2264 Int) (mask!6255 (_ BitVec 32)) (extraKeys!2115 (_ BitVec 32)) (zeroValue!2162 V!2981) (minValue!2162 V!2981) (_size!410 (_ BitVec 32)) (_keys!3924 array!3953) (_values!2247 array!3955) (_vacant!410 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!524 0))(
  ( (Cell!525 (v!2580 LongMapFixedSize!722)) )
))
(declare-datatypes ((LongMap!524 0))(
  ( (LongMap!525 (underlying!273 Cell!524)) )
))
(declare-fun thiss!992 () LongMap!524)

(declare-fun mapDefault!3270 () ValueCell!907)

