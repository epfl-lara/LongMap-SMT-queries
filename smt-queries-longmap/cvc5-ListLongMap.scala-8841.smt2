; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107270 () Bool)

(assert start!107270)

(declare-fun b!1271453 () Bool)

(declare-fun e!725024 () Bool)

(declare-fun tp_is_empty!32959 () Bool)

(assert (=> b!1271453 (= e!725024 tp_is_empty!32959)))

(declare-fun b!1271454 () Bool)

(declare-fun res!845919 () Bool)

(declare-fun e!725025 () Bool)

(assert (=> b!1271454 (=> (not res!845919) (not e!725025))))

(declare-datatypes ((V!49139 0))(
  ( (V!49140 (val!16554 Int)) )
))
(declare-datatypes ((ValueCell!15626 0))(
  ( (ValueCellFull!15626 (v!19191 V!49139)) (EmptyCell!15626) )
))
(declare-datatypes ((array!83168 0))(
  ( (array!83169 (arr!40121 (Array (_ BitVec 32) ValueCell!15626)) (size!40657 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83168)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83170 0))(
  ( (array!83171 (arr!40122 (Array (_ BitVec 32) (_ BitVec 64))) (size!40658 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83170)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271454 (= res!845919 (and (= (size!40657 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40658 _keys!1364) (size!40657 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845920 () Bool)

(assert (=> start!107270 (=> (not res!845920) (not e!725025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107270 (= res!845920 (validMask!0 mask!1730))))

(assert (=> start!107270 e!725025))

(declare-fun e!725026 () Bool)

(declare-fun array_inv!30515 (array!83168) Bool)

(assert (=> start!107270 (and (array_inv!30515 _values!1134) e!725026)))

(assert (=> start!107270 true))

(declare-fun array_inv!30516 (array!83170) Bool)

(assert (=> start!107270 (array_inv!30516 _keys!1364)))

(declare-fun b!1271455 () Bool)

(assert (=> b!1271455 (= e!725025 false)))

(declare-fun lt!574875 () Bool)

(declare-datatypes ((List!28526 0))(
  ( (Nil!28523) (Cons!28522 (h!29731 (_ BitVec 64)) (t!42055 List!28526)) )
))
(declare-fun arrayNoDuplicates!0 (array!83170 (_ BitVec 32) List!28526) Bool)

(assert (=> b!1271455 (= lt!574875 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28523))))

(declare-fun b!1271456 () Bool)

(declare-fun e!725028 () Bool)

(declare-fun mapRes!51019 () Bool)

(assert (=> b!1271456 (= e!725026 (and e!725028 mapRes!51019))))

(declare-fun condMapEmpty!51019 () Bool)

(declare-fun mapDefault!51019 () ValueCell!15626)

