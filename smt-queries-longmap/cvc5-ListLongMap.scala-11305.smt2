; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131734 () Bool)

(assert start!131734)

(declare-fun mapNonEmpty!58288 () Bool)

(declare-fun mapRes!58288 () Bool)

(declare-fun tp!110815 () Bool)

(declare-fun e!858232 () Bool)

(assert (=> mapNonEmpty!58288 (= mapRes!58288 (and tp!110815 e!858232))))

(declare-fun mapKey!58288 () (_ BitVec 32))

(declare-datatypes ((V!58741 0))(
  ( (V!58742 (val!18939 Int)) )
))
(declare-datatypes ((ValueCell!17951 0))(
  ( (ValueCellFull!17951 (v!21740 V!58741)) (EmptyCell!17951) )
))
(declare-fun mapRest!58288 () (Array (_ BitVec 32) ValueCell!17951))

(declare-datatypes ((array!102676 0))(
  ( (array!102677 (arr!49540 (Array (_ BitVec 32) ValueCell!17951)) (size!50090 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102676)

(declare-fun mapValue!58288 () ValueCell!17951)

(assert (=> mapNonEmpty!58288 (= (arr!49540 _values!470) (store mapRest!58288 mapKey!58288 mapValue!58288))))

(declare-fun b!1542561 () Bool)

(declare-fun res!1058556 () Bool)

(declare-fun e!858230 () Bool)

(assert (=> b!1542561 (=> (not res!1058556) (not e!858230))))

(declare-datatypes ((array!102678 0))(
  ( (array!102679 (arr!49541 (Array (_ BitVec 32) (_ BitVec 64))) (size!50091 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102678)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1542561 (= res!1058556 (and (= (size!50090 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50091 _keys!618) (size!50090 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58288 () Bool)

(assert (=> mapIsEmpty!58288 mapRes!58288))

(declare-fun b!1542563 () Bool)

(declare-fun tp_is_empty!37723 () Bool)

(assert (=> b!1542563 (= e!858232 tp_is_empty!37723)))

(declare-fun b!1542564 () Bool)

(declare-fun res!1058554 () Bool)

(assert (=> b!1542564 (=> (not res!1058554) (not e!858230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102678 (_ BitVec 32)) Bool)

(assert (=> b!1542564 (= res!1058554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058555 () Bool)

(assert (=> start!131734 (=> (not res!1058555) (not e!858230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131734 (= res!1058555 (validMask!0 mask!926))))

(assert (=> start!131734 e!858230))

(assert (=> start!131734 true))

(declare-fun e!858234 () Bool)

(declare-fun array_inv!38547 (array!102676) Bool)

(assert (=> start!131734 (and (array_inv!38547 _values!470) e!858234)))

(declare-fun array_inv!38548 (array!102678) Bool)

(assert (=> start!131734 (array_inv!38548 _keys!618)))

(declare-fun b!1542562 () Bool)

(assert (=> b!1542562 (= e!858230 false)))

(declare-fun lt!665837 () Bool)

(declare-datatypes ((List!35882 0))(
  ( (Nil!35879) (Cons!35878 (h!37323 (_ BitVec 64)) (t!50576 List!35882)) )
))
(declare-fun arrayNoDuplicates!0 (array!102678 (_ BitVec 32) List!35882) Bool)

(assert (=> b!1542562 (= lt!665837 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35879))))

(declare-fun b!1542565 () Bool)

(declare-fun e!858233 () Bool)

(assert (=> b!1542565 (= e!858233 tp_is_empty!37723)))

(declare-fun b!1542566 () Bool)

(assert (=> b!1542566 (= e!858234 (and e!858233 mapRes!58288))))

(declare-fun condMapEmpty!58288 () Bool)

(declare-fun mapDefault!58288 () ValueCell!17951)

