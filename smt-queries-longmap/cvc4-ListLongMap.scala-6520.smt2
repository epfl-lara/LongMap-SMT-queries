; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82964 () Bool)

(assert start!82964)

(declare-fun b_free!19091 () Bool)

(declare-fun b_next!19091 () Bool)

(assert (=> start!82964 (= b_free!19091 (not b_next!19091))))

(declare-fun tp!66401 () Bool)

(declare-fun b_and!30579 () Bool)

(assert (=> start!82964 (= tp!66401 b_and!30579)))

(declare-fun mapNonEmpty!34843 () Bool)

(declare-fun mapRes!34843 () Bool)

(declare-fun tp!66402 () Bool)

(declare-fun e!545710 () Bool)

(assert (=> mapNonEmpty!34843 (= mapRes!34843 (and tp!66402 e!545710))))

(declare-datatypes ((V!34181 0))(
  ( (V!34182 (val!11000 Int)) )
))
(declare-datatypes ((ValueCell!10468 0))(
  ( (ValueCellFull!10468 (v!13558 V!34181)) (EmptyCell!10468) )
))
(declare-fun mapValue!34843 () ValueCell!10468)

(declare-datatypes ((array!59869 0))(
  ( (array!59870 (arr!28803 (Array (_ BitVec 32) ValueCell!10468)) (size!29282 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59869)

(declare-fun mapRest!34843 () (Array (_ BitVec 32) ValueCell!10468))

(declare-fun mapKey!34843 () (_ BitVec 32))

(assert (=> mapNonEmpty!34843 (= (arr!28803 _values!1400) (store mapRest!34843 mapKey!34843 mapValue!34843))))

(declare-fun b!968358 () Bool)

(declare-fun e!545713 () Bool)

(declare-fun e!545714 () Bool)

(assert (=> b!968358 (= e!545713 (and e!545714 mapRes!34843))))

(declare-fun condMapEmpty!34843 () Bool)

(declare-fun mapDefault!34843 () ValueCell!10468)

