; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108032 () Bool)

(assert start!108032)

(declare-fun mapIsEmpty!51485 () Bool)

(declare-fun mapRes!51485 () Bool)

(assert (=> mapIsEmpty!51485 mapRes!51485))

(declare-fun res!848036 () Bool)

(declare-fun e!728541 () Bool)

(assert (=> start!108032 (=> (not res!848036) (not e!728541))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108032 (= res!848036 (validMask!0 mask!1805))))

(assert (=> start!108032 e!728541))

(assert (=> start!108032 true))

(declare-datatypes ((V!49509 0))(
  ( (V!49510 (val!16727 Int)) )
))
(declare-datatypes ((ValueCell!15754 0))(
  ( (ValueCellFull!15754 (v!19324 V!49509)) (EmptyCell!15754) )
))
(declare-datatypes ((array!83704 0))(
  ( (array!83705 (arr!40364 (Array (_ BitVec 32) ValueCell!15754)) (size!40914 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83704)

(declare-fun e!728542 () Bool)

(declare-fun array_inv!30677 (array!83704) Bool)

(assert (=> start!108032 (and (array_inv!30677 _values!1187) e!728542)))

(declare-datatypes ((array!83706 0))(
  ( (array!83707 (arr!40365 (Array (_ BitVec 32) (_ BitVec 64))) (size!40915 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83706)

(declare-fun array_inv!30678 (array!83706) Bool)

(assert (=> start!108032 (array_inv!30678 _keys!1427)))

(declare-fun b!1275982 () Bool)

(declare-fun res!848037 () Bool)

(assert (=> b!1275982 (=> (not res!848037) (not e!728541))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275982 (= res!848037 (and (= (size!40914 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40915 _keys!1427) (size!40914 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275983 () Bool)

(declare-fun res!848035 () Bool)

(assert (=> b!1275983 (=> (not res!848035) (not e!728541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83706 (_ BitVec 32)) Bool)

(assert (=> b!1275983 (= res!848035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275984 () Bool)

(declare-fun e!728540 () Bool)

(assert (=> b!1275984 (= e!728542 (and e!728540 mapRes!51485))))

(declare-fun condMapEmpty!51485 () Bool)

(declare-fun mapDefault!51485 () ValueCell!15754)

