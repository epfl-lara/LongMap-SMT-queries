; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70970 () Bool)

(assert start!70970)

(declare-fun b_free!13187 () Bool)

(declare-fun b_next!13187 () Bool)

(assert (=> start!70970 (= b_free!13187 (not b_next!13187))))

(declare-fun tp!46312 () Bool)

(declare-fun b_and!22083 () Bool)

(assert (=> start!70970 (= tp!46312 b_and!22083)))

(declare-fun b!824200 () Bool)

(declare-fun e!458517 () Bool)

(declare-fun tp_is_empty!14897 () Bool)

(assert (=> b!824200 (= e!458517 tp_is_empty!14897)))

(declare-fun b!824201 () Bool)

(declare-fun e!458515 () Bool)

(declare-fun mapRes!23962 () Bool)

(assert (=> b!824201 (= e!458515 (and e!458517 mapRes!23962))))

(declare-fun condMapEmpty!23962 () Bool)

(declare-datatypes ((V!24863 0))(
  ( (V!24864 (val!7496 Int)) )
))
(declare-datatypes ((ValueCell!7033 0))(
  ( (ValueCellFull!7033 (v!9929 V!24863)) (EmptyCell!7033) )
))
(declare-datatypes ((array!45982 0))(
  ( (array!45983 (arr!22039 (Array (_ BitVec 32) ValueCell!7033)) (size!22460 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45982)

(declare-fun mapDefault!23962 () ValueCell!7033)

