; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106940 () Bool)

(assert start!106940)

(declare-fun b!1268269 () Bool)

(declare-fun e!722659 () Bool)

(declare-datatypes ((List!28379 0))(
  ( (Nil!28376) (Cons!28375 (h!29584 (_ BitVec 64)) (t!41908 List!28379)) )
))
(declare-fun noDuplicate!2043 (List!28379) Bool)

(assert (=> b!1268269 (= e!722659 (not (noDuplicate!2043 Nil!28376)))))

(declare-fun b!1268270 () Bool)

(declare-fun res!844151 () Bool)

(assert (=> b!1268270 (=> (not res!844151) (not e!722659))))

(declare-datatypes ((array!82572 0))(
  ( (array!82573 (arr!39825 (Array (_ BitVec 32) (_ BitVec 64))) (size!40361 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82572)

(assert (=> b!1268270 (= res!844151 (and (bvsle #b00000000000000000000000000000000 (size!40361 _keys!1364)) (bvslt (size!40361 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun b!1268271 () Bool)

(declare-fun e!722657 () Bool)

(declare-fun tp_is_empty!32651 () Bool)

(assert (=> b!1268271 (= e!722657 tp_is_empty!32651)))

(declare-fun res!844150 () Bool)

(assert (=> start!106940 (=> (not res!844150) (not e!722659))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106940 (= res!844150 (validMask!0 mask!1730))))

(assert (=> start!106940 e!722659))

(declare-datatypes ((V!48727 0))(
  ( (V!48728 (val!16400 Int)) )
))
(declare-datatypes ((ValueCell!15472 0))(
  ( (ValueCellFull!15472 (v!19036 V!48727)) (EmptyCell!15472) )
))
(declare-datatypes ((array!82574 0))(
  ( (array!82575 (arr!39826 (Array (_ BitVec 32) ValueCell!15472)) (size!40362 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82574)

(declare-fun e!722656 () Bool)

(declare-fun array_inv!30305 (array!82574) Bool)

(assert (=> start!106940 (and (array_inv!30305 _values!1134) e!722656)))

(assert (=> start!106940 true))

(declare-fun array_inv!30306 (array!82572) Bool)

(assert (=> start!106940 (array_inv!30306 _keys!1364)))

(declare-fun b!1268272 () Bool)

(declare-fun res!844149 () Bool)

(assert (=> b!1268272 (=> (not res!844149) (not e!722659))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268272 (= res!844149 (and (= (size!40362 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40361 _keys!1364) (size!40362 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50551 () Bool)

(declare-fun mapRes!50551 () Bool)

(declare-fun tp!96730 () Bool)

(declare-fun e!722655 () Bool)

(assert (=> mapNonEmpty!50551 (= mapRes!50551 (and tp!96730 e!722655))))

(declare-fun mapValue!50551 () ValueCell!15472)

(declare-fun mapRest!50551 () (Array (_ BitVec 32) ValueCell!15472))

(declare-fun mapKey!50551 () (_ BitVec 32))

(assert (=> mapNonEmpty!50551 (= (arr!39826 _values!1134) (store mapRest!50551 mapKey!50551 mapValue!50551))))

(declare-fun b!1268273 () Bool)

(assert (=> b!1268273 (= e!722656 (and e!722657 mapRes!50551))))

(declare-fun condMapEmpty!50551 () Bool)

(declare-fun mapDefault!50551 () ValueCell!15472)

