; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107160 () Bool)

(assert start!107160)

(declare-fun mapNonEmpty!50854 () Bool)

(declare-fun mapRes!50854 () Bool)

(declare-fun tp!97195 () Bool)

(declare-fun e!724200 () Bool)

(assert (=> mapNonEmpty!50854 (= mapRes!50854 (and tp!97195 e!724200))))

(declare-datatypes ((V!48991 0))(
  ( (V!48992 (val!16499 Int)) )
))
(declare-datatypes ((ValueCell!15571 0))(
  ( (ValueCellFull!15571 (v!19136 V!48991)) (EmptyCell!15571) )
))
(declare-datatypes ((array!82960 0))(
  ( (array!82961 (arr!40017 (Array (_ BitVec 32) ValueCell!15571)) (size!40553 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82960)

(declare-fun mapRest!50854 () (Array (_ BitVec 32) ValueCell!15571))

(declare-fun mapKey!50854 () (_ BitVec 32))

(declare-fun mapValue!50854 () ValueCell!15571)

(assert (=> mapNonEmpty!50854 (= (arr!40017 _values!1134) (store mapRest!50854 mapKey!50854 mapValue!50854))))

(declare-fun res!845426 () Bool)

(declare-fun e!724201 () Bool)

(assert (=> start!107160 (=> (not res!845426) (not e!724201))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107160 (= res!845426 (validMask!0 mask!1730))))

(assert (=> start!107160 e!724201))

(declare-fun e!724199 () Bool)

(declare-fun array_inv!30439 (array!82960) Bool)

(assert (=> start!107160 (and (array_inv!30439 _values!1134) e!724199)))

(assert (=> start!107160 true))

(declare-datatypes ((array!82962 0))(
  ( (array!82963 (arr!40018 (Array (_ BitVec 32) (_ BitVec 64))) (size!40554 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82962)

(declare-fun array_inv!30440 (array!82962) Bool)

(assert (=> start!107160 (array_inv!30440 _keys!1364)))

(declare-fun b!1270463 () Bool)

(declare-fun res!845424 () Bool)

(assert (=> b!1270463 (=> (not res!845424) (not e!724201))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270463 (= res!845424 (and (= (size!40553 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40554 _keys!1364) (size!40553 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270464 () Bool)

(declare-fun e!724202 () Bool)

(declare-fun tp_is_empty!32849 () Bool)

(assert (=> b!1270464 (= e!724202 tp_is_empty!32849)))

(declare-fun b!1270465 () Bool)

(assert (=> b!1270465 (= e!724199 (and e!724202 mapRes!50854))))

(declare-fun condMapEmpty!50854 () Bool)

(declare-fun mapDefault!50854 () ValueCell!15571)

