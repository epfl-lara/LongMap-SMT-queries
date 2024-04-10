; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70886 () Bool)

(assert start!70886)

(declare-fun b_free!13123 () Bool)

(declare-fun b_next!13123 () Bool)

(assert (=> start!70886 (= b_free!13123 (not b_next!13123))))

(declare-fun tp!46116 () Bool)

(declare-fun b_and!22007 () Bool)

(assert (=> start!70886 (= tp!46116 b_and!22007)))

(declare-fun mapIsEmpty!23863 () Bool)

(declare-fun mapRes!23863 () Bool)

(assert (=> mapIsEmpty!23863 mapRes!23863))

(declare-fun b!823331 () Bool)

(declare-fun e!457905 () Bool)

(declare-fun e!457908 () Bool)

(assert (=> b!823331 (= e!457905 (and e!457908 mapRes!23863))))

(declare-fun condMapEmpty!23863 () Bool)

(declare-datatypes ((V!24779 0))(
  ( (V!24780 (val!7464 Int)) )
))
(declare-datatypes ((ValueCell!7001 0))(
  ( (ValueCellFull!7001 (v!9896 V!24779)) (EmptyCell!7001) )
))
(declare-datatypes ((array!45858 0))(
  ( (array!45859 (arr!21978 (Array (_ BitVec 32) ValueCell!7001)) (size!22399 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45858)

(declare-fun mapDefault!23863 () ValueCell!7001)

