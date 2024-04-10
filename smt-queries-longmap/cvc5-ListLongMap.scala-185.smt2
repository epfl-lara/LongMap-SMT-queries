; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3692 () Bool)

(assert start!3692)

(declare-fun res!15377 () Bool)

(declare-fun e!16737 () Bool)

(assert (=> start!3692 (=> (not res!15377) (not e!16737))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3692 (= res!15377 (validMask!0 mask!2294))))

(assert (=> start!3692 e!16737))

(assert (=> start!3692 true))

(declare-datatypes ((V!1227 0))(
  ( (V!1228 (val!552 Int)) )
))
(declare-datatypes ((ValueCell!326 0))(
  ( (ValueCellFull!326 (v!1637 V!1227)) (EmptyCell!326) )
))
(declare-datatypes ((array!1343 0))(
  ( (array!1344 (arr!633 (Array (_ BitVec 32) ValueCell!326)) (size!734 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1343)

(declare-fun e!16738 () Bool)

(declare-fun array_inv!425 (array!1343) Bool)

(assert (=> start!3692 (and (array_inv!425 _values!1501) e!16738)))

(declare-datatypes ((array!1345 0))(
  ( (array!1346 (arr!634 (Array (_ BitVec 32) (_ BitVec 64))) (size!735 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1345)

(declare-fun array_inv!426 (array!1345) Bool)

(assert (=> start!3692 (array_inv!426 _keys!1833)))

(declare-fun mapNonEmpty!1081 () Bool)

(declare-fun mapRes!1081 () Bool)

(declare-fun tp!3601 () Bool)

(declare-fun e!16740 () Bool)

(assert (=> mapNonEmpty!1081 (= mapRes!1081 (and tp!3601 e!16740))))

(declare-fun mapValue!1081 () ValueCell!326)

(declare-fun mapRest!1081 () (Array (_ BitVec 32) ValueCell!326))

(declare-fun mapKey!1081 () (_ BitVec 32))

(assert (=> mapNonEmpty!1081 (= (arr!633 _values!1501) (store mapRest!1081 mapKey!1081 mapValue!1081))))

(declare-fun b!25828 () Bool)

(declare-fun res!15378 () Bool)

(assert (=> b!25828 (=> (not res!15378) (not e!16737))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25828 (= res!15378 (and (= (size!734 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!735 _keys!1833) (size!734 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25829 () Bool)

(declare-fun e!16736 () Bool)

(assert (=> b!25829 (= e!16738 (and e!16736 mapRes!1081))))

(declare-fun condMapEmpty!1081 () Bool)

(declare-fun mapDefault!1081 () ValueCell!326)

