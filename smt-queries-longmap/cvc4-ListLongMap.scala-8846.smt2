; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107304 () Bool)

(assert start!107304)

(declare-fun b!1271759 () Bool)

(declare-fun e!725279 () Bool)

(declare-fun tp_is_empty!32993 () Bool)

(assert (=> b!1271759 (= e!725279 tp_is_empty!32993)))

(declare-fun res!846073 () Bool)

(declare-fun e!725280 () Bool)

(assert (=> start!107304 (=> (not res!846073) (not e!725280))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107304 (= res!846073 (validMask!0 mask!1730))))

(assert (=> start!107304 e!725280))

(declare-datatypes ((V!49183 0))(
  ( (V!49184 (val!16571 Int)) )
))
(declare-datatypes ((ValueCell!15643 0))(
  ( (ValueCellFull!15643 (v!19208 V!49183)) (EmptyCell!15643) )
))
(declare-datatypes ((array!83234 0))(
  ( (array!83235 (arr!40154 (Array (_ BitVec 32) ValueCell!15643)) (size!40690 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83234)

(declare-fun e!725282 () Bool)

(declare-fun array_inv!30543 (array!83234) Bool)

(assert (=> start!107304 (and (array_inv!30543 _values!1134) e!725282)))

(assert (=> start!107304 true))

(declare-datatypes ((array!83236 0))(
  ( (array!83237 (arr!40155 (Array (_ BitVec 32) (_ BitVec 64))) (size!40691 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83236)

(declare-fun array_inv!30544 (array!83236) Bool)

(assert (=> start!107304 (array_inv!30544 _keys!1364)))

(declare-fun b!1271760 () Bool)

(declare-fun res!846072 () Bool)

(assert (=> b!1271760 (=> (not res!846072) (not e!725280))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271760 (= res!846072 (and (= (size!40690 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40691 _keys!1364) (size!40690 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271761 () Bool)

(assert (=> b!1271761 (= e!725280 false)))

(declare-fun lt!574926 () Bool)

(declare-datatypes ((List!28537 0))(
  ( (Nil!28534) (Cons!28533 (h!29742 (_ BitVec 64)) (t!42066 List!28537)) )
))
(declare-fun arrayNoDuplicates!0 (array!83236 (_ BitVec 32) List!28537) Bool)

(assert (=> b!1271761 (= lt!574926 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28534))))

(declare-fun b!1271762 () Bool)

(declare-fun res!846074 () Bool)

(assert (=> b!1271762 (=> (not res!846074) (not e!725280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83236 (_ BitVec 32)) Bool)

(assert (=> b!1271762 (= res!846074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271763 () Bool)

(declare-fun mapRes!51070 () Bool)

(assert (=> b!1271763 (= e!725282 (and e!725279 mapRes!51070))))

(declare-fun condMapEmpty!51070 () Bool)

(declare-fun mapDefault!51070 () ValueCell!15643)

