; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14176 () Bool)

(assert start!14176)

(declare-fun b!131465 () Bool)

(declare-fun b_free!2905 () Bool)

(declare-fun b_next!2905 () Bool)

(assert (=> b!131465 (= b_free!2905 (not b_next!2905))))

(declare-fun tp!11151 () Bool)

(declare-fun b_and!8139 () Bool)

(assert (=> b!131465 (= tp!11151 b_and!8139)))

(declare-fun b!131468 () Bool)

(declare-fun b_free!2907 () Bool)

(declare-fun b_next!2907 () Bool)

(assert (=> b!131468 (= b_free!2907 (not b_next!2907))))

(declare-fun tp!11153 () Bool)

(declare-fun b_and!8141 () Bool)

(assert (=> b!131468 (= tp!11153 b_and!8141)))

(declare-fun b!131462 () Bool)

(declare-fun e!85749 () Bool)

(declare-fun e!85737 () Bool)

(declare-fun mapRes!4613 () Bool)

(assert (=> b!131462 (= e!85749 (and e!85737 mapRes!4613))))

(declare-fun condMapEmpty!4613 () Bool)

(declare-datatypes ((V!3473 0))(
  ( (V!3474 (val!1479 Int)) )
))
(declare-datatypes ((array!4763 0))(
  ( (array!4764 (arr!2253 (Array (_ BitVec 32) (_ BitVec 64))) (size!2521 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1091 0))(
  ( (ValueCellFull!1091 (v!3185 V!3473)) (EmptyCell!1091) )
))
(declare-datatypes ((array!4765 0))(
  ( (array!4766 (arr!2254 (Array (_ BitVec 32) ValueCell!1091)) (size!2522 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1090 0))(
  ( (LongMapFixedSize!1091 (defaultEntry!2853 Int) (mask!7147 (_ BitVec 32)) (extraKeys!2620 (_ BitVec 32)) (zeroValue!2709 V!3473) (minValue!2709 V!3473) (_size!594 (_ BitVec 32)) (_keys!4600 array!4763) (_values!2836 array!4765) (_vacant!594 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1090)

(declare-fun mapDefault!4614 () ValueCell!1091)

