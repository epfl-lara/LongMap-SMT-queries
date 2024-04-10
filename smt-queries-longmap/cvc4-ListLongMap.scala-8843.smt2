; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107286 () Bool)

(assert start!107286)

(declare-fun b!1271597 () Bool)

(declare-fun res!845993 () Bool)

(declare-fun e!725148 () Bool)

(assert (=> b!1271597 (=> (not res!845993) (not e!725148))))

(declare-datatypes ((V!49159 0))(
  ( (V!49160 (val!16562 Int)) )
))
(declare-datatypes ((ValueCell!15634 0))(
  ( (ValueCellFull!15634 (v!19199 V!49159)) (EmptyCell!15634) )
))
(declare-datatypes ((array!83198 0))(
  ( (array!83199 (arr!40136 (Array (_ BitVec 32) ValueCell!15634)) (size!40672 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83198)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83200 0))(
  ( (array!83201 (arr!40137 (Array (_ BitVec 32) (_ BitVec 64))) (size!40673 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83200)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271597 (= res!845993 (and (= (size!40672 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40673 _keys!1364) (size!40672 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271598 () Bool)

(declare-fun e!725147 () Bool)

(declare-fun tp_is_empty!32975 () Bool)

(assert (=> b!1271598 (= e!725147 tp_is_empty!32975)))

(declare-fun mapIsEmpty!51043 () Bool)

(declare-fun mapRes!51043 () Bool)

(assert (=> mapIsEmpty!51043 mapRes!51043))

(declare-fun b!1271599 () Bool)

(declare-fun e!725146 () Bool)

(assert (=> b!1271599 (= e!725146 tp_is_empty!32975)))

(declare-fun res!845991 () Bool)

(assert (=> start!107286 (=> (not res!845991) (not e!725148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107286 (= res!845991 (validMask!0 mask!1730))))

(assert (=> start!107286 e!725148))

(declare-fun e!725144 () Bool)

(declare-fun array_inv!30527 (array!83198) Bool)

(assert (=> start!107286 (and (array_inv!30527 _values!1134) e!725144)))

(assert (=> start!107286 true))

(declare-fun array_inv!30528 (array!83200) Bool)

(assert (=> start!107286 (array_inv!30528 _keys!1364)))

(declare-fun b!1271600 () Bool)

(assert (=> b!1271600 (= e!725148 false)))

(declare-fun lt!574899 () Bool)

(declare-datatypes ((List!28532 0))(
  ( (Nil!28529) (Cons!28528 (h!29737 (_ BitVec 64)) (t!42061 List!28532)) )
))
(declare-fun arrayNoDuplicates!0 (array!83200 (_ BitVec 32) List!28532) Bool)

(assert (=> b!1271600 (= lt!574899 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28529))))

(declare-fun b!1271601 () Bool)

(assert (=> b!1271601 (= e!725144 (and e!725146 mapRes!51043))))

(declare-fun condMapEmpty!51043 () Bool)

(declare-fun mapDefault!51043 () ValueCell!15634)

