; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131794 () Bool)

(assert start!131794)

(declare-fun b!1543101 () Bool)

(declare-fun res!1058824 () Bool)

(declare-fun e!858683 () Bool)

(assert (=> b!1543101 (=> (not res!1058824) (not e!858683))))

(declare-datatypes ((array!102792 0))(
  ( (array!102793 (arr!49598 (Array (_ BitVec 32) (_ BitVec 64))) (size!50148 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102792)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102792 (_ BitVec 32)) Bool)

(assert (=> b!1543101 (= res!1058824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543102 () Bool)

(declare-fun res!1058826 () Bool)

(assert (=> b!1543102 (=> (not res!1058826) (not e!858683))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58821 0))(
  ( (V!58822 (val!18969 Int)) )
))
(declare-datatypes ((ValueCell!17981 0))(
  ( (ValueCellFull!17981 (v!21770 V!58821)) (EmptyCell!17981) )
))
(declare-datatypes ((array!102794 0))(
  ( (array!102795 (arr!49599 (Array (_ BitVec 32) ValueCell!17981)) (size!50149 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102794)

(assert (=> b!1543102 (= res!1058826 (and (= (size!50149 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50148 _keys!618) (size!50149 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58378 () Bool)

(declare-fun mapRes!58378 () Bool)

(declare-fun tp!110905 () Bool)

(declare-fun e!858681 () Bool)

(assert (=> mapNonEmpty!58378 (= mapRes!58378 (and tp!110905 e!858681))))

(declare-fun mapValue!58378 () ValueCell!17981)

(declare-fun mapKey!58378 () (_ BitVec 32))

(declare-fun mapRest!58378 () (Array (_ BitVec 32) ValueCell!17981))

(assert (=> mapNonEmpty!58378 (= (arr!49599 _values!470) (store mapRest!58378 mapKey!58378 mapValue!58378))))

(declare-fun mapIsEmpty!58378 () Bool)

(assert (=> mapIsEmpty!58378 mapRes!58378))

(declare-fun b!1543103 () Bool)

(declare-fun e!858682 () Bool)

(declare-fun e!858684 () Bool)

(assert (=> b!1543103 (= e!858682 (and e!858684 mapRes!58378))))

(declare-fun condMapEmpty!58378 () Bool)

(declare-fun mapDefault!58378 () ValueCell!17981)

