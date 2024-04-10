; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131588 () Bool)

(assert start!131588)

(declare-datatypes ((array!102476 0))(
  ( (array!102477 (arr!49445 (Array (_ BitVec 32) (_ BitVec 64))) (size!49995 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102476)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun e!857373 () Bool)

(declare-fun b!1541531 () Bool)

(declare-datatypes ((V!58605 0))(
  ( (V!58606 (val!18888 Int)) )
))
(declare-datatypes ((ValueCell!17900 0))(
  ( (ValueCellFull!17900 (v!21688 V!58605)) (EmptyCell!17900) )
))
(declare-datatypes ((array!102478 0))(
  ( (array!102479 (arr!49446 (Array (_ BitVec 32) ValueCell!17900)) (size!49996 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102478)

(assert (=> b!1541531 (= e!857373 (and (= (size!49996 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49995 _keys!618) (size!49996 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (not (= (size!49995 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)))))))

(declare-fun b!1541532 () Bool)

(declare-fun e!857371 () Bool)

(declare-fun e!857370 () Bool)

(declare-fun mapRes!58120 () Bool)

(assert (=> b!1541532 (= e!857371 (and e!857370 mapRes!58120))))

(declare-fun condMapEmpty!58120 () Bool)

(declare-fun mapDefault!58120 () ValueCell!17900)

