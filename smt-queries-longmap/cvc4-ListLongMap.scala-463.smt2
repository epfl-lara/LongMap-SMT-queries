; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8424 () Bool)

(assert start!8424)

(declare-fun b!57220 () Bool)

(declare-fun b_free!1953 () Bool)

(declare-fun b_next!1953 () Bool)

(assert (=> b!57220 (= b_free!1953 (not b_next!1953))))

(declare-fun tp!7964 () Bool)

(declare-fun b_and!3451 () Bool)

(assert (=> b!57220 (= tp!7964 b_and!3451)))

(declare-fun b!57218 () Bool)

(declare-fun b_free!1955 () Bool)

(declare-fun b_next!1955 () Bool)

(assert (=> b!57218 (= b_free!1955 (not b_next!1955))))

(declare-fun tp!7966 () Bool)

(declare-fun b_and!3453 () Bool)

(assert (=> b!57218 (= tp!7966 b_and!3453)))

(declare-fun b!57202 () Bool)

(declare-fun res!32039 () Bool)

(declare-fun e!37725 () Bool)

(assert (=> b!57202 (=> (not res!32039) (not e!37725))))

(declare-datatypes ((V!2837 0))(
  ( (V!2838 (val!1241 Int)) )
))
(declare-datatypes ((array!3711 0))(
  ( (array!3712 (arr!1777 (Array (_ BitVec 32) (_ BitVec 64))) (size!2006 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!853 0))(
  ( (ValueCellFull!853 (v!2369 V!2837)) (EmptyCell!853) )
))
(declare-datatypes ((array!3713 0))(
  ( (array!3714 (arr!1778 (Array (_ BitVec 32) ValueCell!853)) (size!2007 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!614 0))(
  ( (LongMapFixedSize!615 (defaultEntry!2023 Int) (mask!5897 (_ BitVec 32)) (extraKeys!1914 (_ BitVec 32)) (zeroValue!1941 V!2837) (minValue!1941 V!2837) (_size!356 (_ BitVec 32)) (_keys!3643 array!3711) (_values!2006 array!3713) (_vacant!356 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!614)

(declare-fun valid!253 (LongMapFixedSize!614) Bool)

(assert (=> b!57202 (= res!32039 (valid!253 newMap!16))))

(declare-fun b!57203 () Bool)

(declare-fun e!37714 () Bool)

(declare-fun e!37715 () Bool)

(declare-fun mapRes!2854 () Bool)

(assert (=> b!57203 (= e!37714 (and e!37715 mapRes!2854))))

(declare-fun condMapEmpty!2853 () Bool)

(declare-datatypes ((Cell!428 0))(
  ( (Cell!429 (v!2370 LongMapFixedSize!614)) )
))
(declare-datatypes ((LongMap!428 0))(
  ( (LongMap!429 (underlying!225 Cell!428)) )
))
(declare-fun thiss!992 () LongMap!428)

(declare-fun mapDefault!2854 () ValueCell!853)

