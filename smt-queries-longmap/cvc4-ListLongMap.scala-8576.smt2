; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104678 () Bool)

(assert start!104678)

(declare-fun b_free!26495 () Bool)

(declare-fun b_next!26495 () Bool)

(assert (=> start!104678 (= b_free!26495 (not b_next!26495))))

(declare-fun tp!92971 () Bool)

(declare-fun b_and!44259 () Bool)

(assert (=> start!104678 (= tp!92971 b_and!44259)))

(declare-fun b!1248014 () Bool)

(declare-fun e!708121 () Bool)

(declare-fun e!708122 () Bool)

(declare-fun mapRes!48853 () Bool)

(assert (=> b!1248014 (= e!708121 (and e!708122 mapRes!48853))))

(declare-fun condMapEmpty!48853 () Bool)

(declare-datatypes ((V!47227 0))(
  ( (V!47228 (val!15761 Int)) )
))
(declare-datatypes ((ValueCell!14935 0))(
  ( (ValueCellFull!14935 (v!18457 V!47227)) (EmptyCell!14935) )
))
(declare-datatypes ((array!80488 0))(
  ( (array!80489 (arr!38812 (Array (_ BitVec 32) ValueCell!14935)) (size!39348 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80488)

(declare-fun mapDefault!48853 () ValueCell!14935)

