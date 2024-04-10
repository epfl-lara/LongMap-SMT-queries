; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111788 () Bool)

(assert start!111788)

(declare-fun b_free!30445 () Bool)

(declare-fun b_next!30445 () Bool)

(assert (=> start!111788 (= b_free!30445 (not b_next!30445))))

(declare-fun tp!106810 () Bool)

(declare-fun b_and!48983 () Bool)

(assert (=> start!111788 (= tp!106810 b_and!48983)))

(declare-fun b!1324669 () Bool)

(declare-fun e!755179 () Bool)

(declare-fun e!755176 () Bool)

(declare-fun mapRes!56045 () Bool)

(assert (=> b!1324669 (= e!755179 (and e!755176 mapRes!56045))))

(declare-fun condMapEmpty!56045 () Bool)

(declare-datatypes ((V!53457 0))(
  ( (V!53458 (val!18207 Int)) )
))
(declare-datatypes ((ValueCell!17234 0))(
  ( (ValueCellFull!17234 (v!20837 V!53457)) (EmptyCell!17234) )
))
(declare-datatypes ((array!89442 0))(
  ( (array!89443 (arr!43195 (Array (_ BitVec 32) ValueCell!17234)) (size!43745 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89442)

(declare-fun mapDefault!56045 () ValueCell!17234)

