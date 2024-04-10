; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10676 () Bool)

(assert start!10676)

(declare-fun b!85270 () Bool)

(declare-fun b_free!2233 () Bool)

(declare-fun b_next!2233 () Bool)

(assert (=> b!85270 (= b_free!2233 (not b_next!2233))))

(declare-fun tp!8923 () Bool)

(declare-fun b_and!5163 () Bool)

(assert (=> b!85270 (= tp!8923 b_and!5163)))

(declare-fun b!85274 () Bool)

(declare-fun b_free!2235 () Bool)

(declare-fun b_next!2235 () Bool)

(assert (=> b!85274 (= b_free!2235 (not b_next!2235))))

(declare-fun tp!8925 () Bool)

(declare-fun b_and!5165 () Bool)

(assert (=> b!85274 (= tp!8925 b_and!5165)))

(declare-fun b!85255 () Bool)

(declare-fun e!55595 () Bool)

(declare-fun e!55599 () Bool)

(assert (=> b!85255 (= e!55595 e!55599)))

(declare-fun b!85256 () Bool)

(declare-fun e!55605 () Bool)

(declare-fun e!55601 () Bool)

(declare-fun mapRes!3393 () Bool)

(assert (=> b!85256 (= e!55605 (and e!55601 mapRes!3393))))

(declare-fun condMapEmpty!3393 () Bool)

(declare-datatypes ((V!3025 0))(
  ( (V!3026 (val!1311 Int)) )
))
(declare-datatypes ((array!4025 0))(
  ( (array!4026 (arr!1917 (Array (_ BitVec 32) (_ BitVec 64))) (size!2161 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!923 0))(
  ( (ValueCellFull!923 (v!2643 V!3025)) (EmptyCell!923) )
))
(declare-datatypes ((array!4027 0))(
  ( (array!4028 (arr!1918 (Array (_ BitVec 32) ValueCell!923)) (size!2162 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!754 0))(
  ( (LongMapFixedSize!755 (defaultEntry!2337 Int) (mask!6365 (_ BitVec 32)) (extraKeys!2176 (_ BitVec 32)) (zeroValue!2229 V!3025) (minValue!2229 V!3025) (_size!426 (_ BitVec 32)) (_keys!4009 array!4025) (_values!2320 array!4027) (_vacant!426 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!754)

(declare-fun mapDefault!3393 () ValueCell!923)

