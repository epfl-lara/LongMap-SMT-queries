; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70454 () Bool)

(assert start!70454)

(declare-fun b_free!12797 () Bool)

(declare-fun b_next!12797 () Bool)

(assert (=> start!70454 (= b_free!12797 (not b_next!12797))))

(declare-fun tp!45121 () Bool)

(declare-fun b_and!21617 () Bool)

(assert (=> start!70454 (= tp!45121 b_and!21617)))

(declare-fun b!818379 () Bool)

(declare-fun e!454277 () Bool)

(declare-fun e!454282 () Bool)

(declare-fun mapRes!23356 () Bool)

(assert (=> b!818379 (= e!454277 (and e!454282 mapRes!23356))))

(declare-fun condMapEmpty!23356 () Bool)

(declare-datatypes ((V!24343 0))(
  ( (V!24344 (val!7301 Int)) )
))
(declare-datatypes ((ValueCell!6838 0))(
  ( (ValueCellFull!6838 (v!9730 V!24343)) (EmptyCell!6838) )
))
(declare-datatypes ((array!45214 0))(
  ( (array!45215 (arr!21662 (Array (_ BitVec 32) ValueCell!6838)) (size!22083 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45214)

(declare-fun mapDefault!23356 () ValueCell!6838)

