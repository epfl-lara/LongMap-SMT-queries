; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104632 () Bool)

(assert start!104632)

(declare-fun b!1247629 () Bool)

(declare-fun e!707823 () Bool)

(declare-fun e!707826 () Bool)

(declare-fun mapRes!48796 () Bool)

(assert (=> b!1247629 (= e!707823 (and e!707826 mapRes!48796))))

(declare-fun condMapEmpty!48796 () Bool)

(declare-datatypes ((V!47179 0))(
  ( (V!47180 (val!15743 Int)) )
))
(declare-datatypes ((ValueCell!14917 0))(
  ( (ValueCellFull!14917 (v!18439 V!47179)) (EmptyCell!14917) )
))
(declare-datatypes ((array!80418 0))(
  ( (array!80419 (arr!38778 (Array (_ BitVec 32) ValueCell!14917)) (size!39314 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80418)

(declare-fun mapDefault!48796 () ValueCell!14917)

