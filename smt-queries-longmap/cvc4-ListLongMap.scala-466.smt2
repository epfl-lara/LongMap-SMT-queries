; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8726 () Bool)

(assert start!8726)

(declare-fun b!60653 () Bool)

(declare-fun b_free!1989 () Bool)

(declare-fun b_next!1989 () Bool)

(assert (=> b!60653 (= b_free!1989 (not b_next!1989))))

(declare-fun tp!8087 () Bool)

(declare-fun b_and!3699 () Bool)

(assert (=> b!60653 (= tp!8087 b_and!3699)))

(declare-fun b!60656 () Bool)

(declare-fun b_free!1991 () Bool)

(declare-fun b_next!1991 () Bool)

(assert (=> b!60656 (= b_free!1991 (not b_next!1991))))

(declare-fun tp!8090 () Bool)

(declare-fun b_and!3701 () Bool)

(assert (=> b!60656 (= tp!8090 b_and!3701)))

(declare-fun b!60649 () Bool)

(declare-fun e!39892 () Bool)

(declare-fun e!39901 () Bool)

(declare-fun mapRes!2923 () Bool)

(assert (=> b!60649 (= e!39892 (and e!39901 mapRes!2923))))

(declare-fun condMapEmpty!2923 () Bool)

(declare-datatypes ((V!2861 0))(
  ( (V!2862 (val!1250 Int)) )
))
(declare-datatypes ((array!3751 0))(
  ( (array!3752 (arr!1795 (Array (_ BitVec 32) (_ BitVec 64))) (size!2026 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!862 0))(
  ( (ValueCellFull!862 (v!2405 V!2861)) (EmptyCell!862) )
))
(declare-datatypes ((array!3753 0))(
  ( (array!3754 (arr!1796 (Array (_ BitVec 32) ValueCell!862)) (size!2027 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!632 0))(
  ( (LongMapFixedSize!633 (defaultEntry!2068 Int) (mask!5964 (_ BitVec 32)) (extraKeys!1951 (_ BitVec 32)) (zeroValue!1982 V!2861) (minValue!1982 V!2861) (_size!365 (_ BitVec 32)) (_keys!3696 array!3751) (_values!2051 array!3753) (_vacant!365 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!632)

(declare-fun mapDefault!2924 () ValueCell!862)

