; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107922 () Bool)

(assert start!107922)

(declare-fun b!1275264 () Bool)

(declare-fun e!727953 () Bool)

(declare-fun tp_is_empty!33239 () Bool)

(assert (=> b!1275264 (= e!727953 tp_is_empty!33239)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83586 0))(
  ( (array!83587 (arr!40310 (Array (_ BitVec 32) (_ BitVec 64))) (size!40860 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83586)

(declare-fun e!727951 () Bool)

(declare-fun b!1275265 () Bool)

(declare-datatypes ((V!49421 0))(
  ( (V!49422 (val!16694 Int)) )
))
(declare-datatypes ((ValueCell!15721 0))(
  ( (ValueCellFull!15721 (v!19290 V!49421)) (EmptyCell!15721) )
))
(declare-datatypes ((array!83588 0))(
  ( (array!83589 (arr!40311 (Array (_ BitVec 32) ValueCell!15721)) (size!40861 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83588)

(assert (=> b!1275265 (= e!727951 (and (= (size!40861 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40860 _keys!1427) (size!40861 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (not (= (size!40860 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)))))))

(declare-fun mapNonEmpty!51371 () Bool)

(declare-fun mapRes!51371 () Bool)

(declare-fun tp!98129 () Bool)

(assert (=> mapNonEmpty!51371 (= mapRes!51371 (and tp!98129 e!727953))))

(declare-fun mapKey!51371 () (_ BitVec 32))

(declare-fun mapValue!51371 () ValueCell!15721)

(declare-fun mapRest!51371 () (Array (_ BitVec 32) ValueCell!15721))

(assert (=> mapNonEmpty!51371 (= (arr!40311 _values!1187) (store mapRest!51371 mapKey!51371 mapValue!51371))))

(declare-fun res!847678 () Bool)

(assert (=> start!107922 (=> (not res!847678) (not e!727951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107922 (= res!847678 (validMask!0 mask!1805))))

(assert (=> start!107922 e!727951))

(assert (=> start!107922 true))

(declare-fun e!727952 () Bool)

(declare-fun array_inv!30643 (array!83588) Bool)

(assert (=> start!107922 (and (array_inv!30643 _values!1187) e!727952)))

(declare-fun array_inv!30644 (array!83586) Bool)

(assert (=> start!107922 (array_inv!30644 _keys!1427)))

(declare-fun mapIsEmpty!51371 () Bool)

(assert (=> mapIsEmpty!51371 mapRes!51371))

(declare-fun b!1275266 () Bool)

(declare-fun e!727954 () Bool)

(assert (=> b!1275266 (= e!727954 tp_is_empty!33239)))

(declare-fun b!1275267 () Bool)

(assert (=> b!1275267 (= e!727952 (and e!727954 mapRes!51371))))

(declare-fun condMapEmpty!51371 () Bool)

(declare-fun mapDefault!51371 () ValueCell!15721)

