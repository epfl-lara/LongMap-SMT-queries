; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131726 () Bool)

(assert start!131726)

(declare-fun mapIsEmpty!58276 () Bool)

(declare-fun mapRes!58276 () Bool)

(assert (=> mapIsEmpty!58276 mapRes!58276))

(declare-fun b!1542489 () Bool)

(declare-fun res!1058520 () Bool)

(declare-fun e!858173 () Bool)

(assert (=> b!1542489 (=> (not res!1058520) (not e!858173))))

(declare-datatypes ((array!102660 0))(
  ( (array!102661 (arr!49532 (Array (_ BitVec 32) (_ BitVec 64))) (size!50082 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102660)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58729 0))(
  ( (V!58730 (val!18935 Int)) )
))
(declare-datatypes ((ValueCell!17947 0))(
  ( (ValueCellFull!17947 (v!21736 V!58729)) (EmptyCell!17947) )
))
(declare-datatypes ((array!102662 0))(
  ( (array!102663 (arr!49533 (Array (_ BitVec 32) ValueCell!17947)) (size!50083 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102662)

(assert (=> b!1542489 (= res!1058520 (and (= (size!50083 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50082 _keys!618) (size!50083 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58276 () Bool)

(declare-fun tp!110803 () Bool)

(declare-fun e!858171 () Bool)

(assert (=> mapNonEmpty!58276 (= mapRes!58276 (and tp!110803 e!858171))))

(declare-fun mapKey!58276 () (_ BitVec 32))

(declare-fun mapRest!58276 () (Array (_ BitVec 32) ValueCell!17947))

(declare-fun mapValue!58276 () ValueCell!17947)

(assert (=> mapNonEmpty!58276 (= (arr!49533 _values!470) (store mapRest!58276 mapKey!58276 mapValue!58276))))

(declare-fun res!1058519 () Bool)

(assert (=> start!131726 (=> (not res!1058519) (not e!858173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131726 (= res!1058519 (validMask!0 mask!926))))

(assert (=> start!131726 e!858173))

(assert (=> start!131726 true))

(declare-fun e!858172 () Bool)

(declare-fun array_inv!38541 (array!102662) Bool)

(assert (=> start!131726 (and (array_inv!38541 _values!470) e!858172)))

(declare-fun array_inv!38542 (array!102660) Bool)

(assert (=> start!131726 (array_inv!38542 _keys!618)))

(declare-fun b!1542490 () Bool)

(assert (=> b!1542490 (= e!858173 false)))

(declare-fun lt!665825 () Bool)

(declare-datatypes ((List!35878 0))(
  ( (Nil!35875) (Cons!35874 (h!37319 (_ BitVec 64)) (t!50572 List!35878)) )
))
(declare-fun arrayNoDuplicates!0 (array!102660 (_ BitVec 32) List!35878) Bool)

(assert (=> b!1542490 (= lt!665825 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35875))))

(declare-fun b!1542491 () Bool)

(declare-fun e!858174 () Bool)

(assert (=> b!1542491 (= e!858172 (and e!858174 mapRes!58276))))

(declare-fun condMapEmpty!58276 () Bool)

(declare-fun mapDefault!58276 () ValueCell!17947)

