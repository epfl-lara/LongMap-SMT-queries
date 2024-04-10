; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107198 () Bool)

(assert start!107198)

(declare-fun b!1270805 () Bool)

(declare-fun res!845597 () Bool)

(declare-fun e!724485 () Bool)

(assert (=> b!1270805 (=> (not res!845597) (not e!724485))))

(declare-datatypes ((V!49043 0))(
  ( (V!49044 (val!16518 Int)) )
))
(declare-datatypes ((ValueCell!15590 0))(
  ( (ValueCellFull!15590 (v!19155 V!49043)) (EmptyCell!15590) )
))
(declare-datatypes ((array!83032 0))(
  ( (array!83033 (arr!40053 (Array (_ BitVec 32) ValueCell!15590)) (size!40589 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83032)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83034 0))(
  ( (array!83035 (arr!40054 (Array (_ BitVec 32) (_ BitVec 64))) (size!40590 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83034)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(assert (=> b!1270805 (= res!845597 (and (= (size!40589 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40590 _keys!1364) (size!40589 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845596 () Bool)

(assert (=> start!107198 (=> (not res!845596) (not e!724485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107198 (= res!845596 (validMask!0 mask!1730))))

(assert (=> start!107198 e!724485))

(declare-fun e!724486 () Bool)

(declare-fun array_inv!30465 (array!83032) Bool)

(assert (=> start!107198 (and (array_inv!30465 _values!1134) e!724486)))

(assert (=> start!107198 true))

(declare-fun array_inv!30466 (array!83034) Bool)

(assert (=> start!107198 (array_inv!30466 _keys!1364)))

(declare-fun b!1270806 () Bool)

(declare-fun e!724488 () Bool)

(declare-fun tp_is_empty!32887 () Bool)

(assert (=> b!1270806 (= e!724488 tp_is_empty!32887)))

(declare-fun b!1270807 () Bool)

(assert (=> b!1270807 (= e!724485 false)))

(declare-fun lt!574767 () Bool)

(declare-datatypes ((List!28502 0))(
  ( (Nil!28499) (Cons!28498 (h!29707 (_ BitVec 64)) (t!42031 List!28502)) )
))
(declare-fun arrayNoDuplicates!0 (array!83034 (_ BitVec 32) List!28502) Bool)

(assert (=> b!1270807 (= lt!574767 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28499))))

(declare-fun b!1270808 () Bool)

(declare-fun e!724487 () Bool)

(assert (=> b!1270808 (= e!724487 tp_is_empty!32887)))

(declare-fun b!1270809 () Bool)

(declare-fun res!845595 () Bool)

(assert (=> b!1270809 (=> (not res!845595) (not e!724485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83034 (_ BitVec 32)) Bool)

(assert (=> b!1270809 (= res!845595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50911 () Bool)

(declare-fun mapRes!50911 () Bool)

(declare-fun tp!97252 () Bool)

(assert (=> mapNonEmpty!50911 (= mapRes!50911 (and tp!97252 e!724487))))

(declare-fun mapRest!50911 () (Array (_ BitVec 32) ValueCell!15590))

(declare-fun mapValue!50911 () ValueCell!15590)

(declare-fun mapKey!50911 () (_ BitVec 32))

(assert (=> mapNonEmpty!50911 (= (arr!40053 _values!1134) (store mapRest!50911 mapKey!50911 mapValue!50911))))

(declare-fun b!1270810 () Bool)

(assert (=> b!1270810 (= e!724486 (and e!724488 mapRes!50911))))

(declare-fun condMapEmpty!50911 () Bool)

(declare-fun mapDefault!50911 () ValueCell!15590)

