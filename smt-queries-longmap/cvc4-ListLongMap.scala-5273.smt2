; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70792 () Bool)

(assert start!70792)

(declare-fun b_free!13049 () Bool)

(declare-fun b_next!13049 () Bool)

(assert (=> start!70792 (= b_free!13049 (not b_next!13049))))

(declare-fun tp!45892 () Bool)

(declare-fun b_and!21921 () Bool)

(assert (=> start!70792 (= tp!45892 b_and!21921)))

(declare-fun b!822262 () Bool)

(declare-fun e!457127 () Bool)

(declare-fun e!457131 () Bool)

(declare-fun mapRes!23749 () Bool)

(assert (=> b!822262 (= e!457127 (and e!457131 mapRes!23749))))

(declare-fun condMapEmpty!23749 () Bool)

(declare-datatypes ((V!24679 0))(
  ( (V!24680 (val!7427 Int)) )
))
(declare-datatypes ((ValueCell!6964 0))(
  ( (ValueCellFull!6964 (v!9858 V!24679)) (EmptyCell!6964) )
))
(declare-datatypes ((array!45712 0))(
  ( (array!45713 (arr!21906 (Array (_ BitVec 32) ValueCell!6964)) (size!22327 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45712)

(declare-fun mapDefault!23749 () ValueCell!6964)

