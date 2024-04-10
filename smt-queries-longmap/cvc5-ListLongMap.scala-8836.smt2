; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107240 () Bool)

(assert start!107240)

(declare-fun b!1271183 () Bool)

(declare-fun res!845784 () Bool)

(declare-fun e!724801 () Bool)

(assert (=> b!1271183 (=> (not res!845784) (not e!724801))))

(declare-datatypes ((V!49099 0))(
  ( (V!49100 (val!16539 Int)) )
))
(declare-datatypes ((ValueCell!15611 0))(
  ( (ValueCellFull!15611 (v!19176 V!49099)) (EmptyCell!15611) )
))
(declare-datatypes ((array!83112 0))(
  ( (array!83113 (arr!40093 (Array (_ BitVec 32) ValueCell!15611)) (size!40629 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83112)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83114 0))(
  ( (array!83115 (arr!40094 (Array (_ BitVec 32) (_ BitVec 64))) (size!40630 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83114)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271183 (= res!845784 (and (= (size!40629 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40630 _keys!1364) (size!40629 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271184 () Bool)

(assert (=> b!1271184 (= e!724801 false)))

(declare-fun lt!574830 () Bool)

(declare-datatypes ((List!28514 0))(
  ( (Nil!28511) (Cons!28510 (h!29719 (_ BitVec 64)) (t!42043 List!28514)) )
))
(declare-fun arrayNoDuplicates!0 (array!83114 (_ BitVec 32) List!28514) Bool)

(assert (=> b!1271184 (= lt!574830 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28511))))

(declare-fun b!1271185 () Bool)

(declare-fun e!724799 () Bool)

(declare-fun e!724800 () Bool)

(declare-fun mapRes!50974 () Bool)

(assert (=> b!1271185 (= e!724799 (and e!724800 mapRes!50974))))

(declare-fun condMapEmpty!50974 () Bool)

(declare-fun mapDefault!50974 () ValueCell!15611)

