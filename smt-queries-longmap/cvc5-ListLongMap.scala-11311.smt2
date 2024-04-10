; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131770 () Bool)

(assert start!131770)

(declare-fun mapNonEmpty!58342 () Bool)

(declare-fun mapRes!58342 () Bool)

(declare-fun tp!110869 () Bool)

(declare-fun e!858504 () Bool)

(assert (=> mapNonEmpty!58342 (= mapRes!58342 (and tp!110869 e!858504))))

(declare-datatypes ((V!58789 0))(
  ( (V!58790 (val!18957 Int)) )
))
(declare-datatypes ((ValueCell!17969 0))(
  ( (ValueCellFull!17969 (v!21758 V!58789)) (EmptyCell!17969) )
))
(declare-fun mapValue!58342 () ValueCell!17969)

(declare-fun mapKey!58342 () (_ BitVec 32))

(declare-fun mapRest!58342 () (Array (_ BitVec 32) ValueCell!17969))

(declare-datatypes ((array!102746 0))(
  ( (array!102747 (arr!49575 (Array (_ BitVec 32) ValueCell!17969)) (size!50125 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102746)

(assert (=> mapNonEmpty!58342 (= (arr!49575 _values!470) (store mapRest!58342 mapKey!58342 mapValue!58342))))

(declare-fun b!1542885 () Bool)

(declare-fun res!1058718 () Bool)

(declare-fun e!858500 () Bool)

(assert (=> b!1542885 (=> (not res!1058718) (not e!858500))))

(declare-datatypes ((array!102748 0))(
  ( (array!102749 (arr!49576 (Array (_ BitVec 32) (_ BitVec 64))) (size!50126 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102748)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1542885 (= res!1058718 (and (= (size!50125 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50126 _keys!618) (size!50125 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542886 () Bool)

(declare-fun e!858503 () Bool)

(declare-fun e!858502 () Bool)

(assert (=> b!1542886 (= e!858503 (and e!858502 mapRes!58342))))

(declare-fun condMapEmpty!58342 () Bool)

(declare-fun mapDefault!58342 () ValueCell!17969)

