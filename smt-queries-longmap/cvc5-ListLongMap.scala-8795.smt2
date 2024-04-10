; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106994 () Bool)

(assert start!106994)

(declare-fun b!1268645 () Bool)

(declare-fun res!844355 () Bool)

(declare-fun e!722955 () Bool)

(assert (=> b!1268645 (=> (not res!844355) (not e!722955))))

(declare-datatypes ((V!48771 0))(
  ( (V!48772 (val!16416 Int)) )
))
(declare-datatypes ((ValueCell!15488 0))(
  ( (ValueCellFull!15488 (v!19053 V!48771)) (EmptyCell!15488) )
))
(declare-datatypes ((array!82636 0))(
  ( (array!82637 (arr!39855 (Array (_ BitVec 32) ValueCell!15488)) (size!40391 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82636)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82638 0))(
  ( (array!82639 (arr!39856 (Array (_ BitVec 32) (_ BitVec 64))) (size!40392 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82638)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268645 (= res!844355 (and (= (size!40391 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40392 _keys!1364) (size!40391 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268646 () Bool)

(declare-fun res!844354 () Bool)

(assert (=> b!1268646 (=> (not res!844354) (not e!722955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82638 (_ BitVec 32)) Bool)

(assert (=> b!1268646 (= res!844354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268647 () Bool)

(assert (=> b!1268647 (= e!722955 false)))

(declare-fun lt!574461 () Bool)

(declare-datatypes ((List!28388 0))(
  ( (Nil!28385) (Cons!28384 (h!29593 (_ BitVec 64)) (t!41917 List!28388)) )
))
(declare-fun arrayNoDuplicates!0 (array!82638 (_ BitVec 32) List!28388) Bool)

(assert (=> b!1268647 (= lt!574461 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28385))))

(declare-fun b!1268649 () Bool)

(declare-fun e!722956 () Bool)

(declare-fun tp_is_empty!32683 () Bool)

(assert (=> b!1268649 (= e!722956 tp_is_empty!32683)))

(declare-fun mapNonEmpty!50605 () Bool)

(declare-fun mapRes!50605 () Bool)

(declare-fun tp!96784 () Bool)

(declare-fun e!722954 () Bool)

(assert (=> mapNonEmpty!50605 (= mapRes!50605 (and tp!96784 e!722954))))

(declare-fun mapKey!50605 () (_ BitVec 32))

(declare-fun mapRest!50605 () (Array (_ BitVec 32) ValueCell!15488))

(declare-fun mapValue!50605 () ValueCell!15488)

(assert (=> mapNonEmpty!50605 (= (arr!39855 _values!1134) (store mapRest!50605 mapKey!50605 mapValue!50605))))

(declare-fun b!1268648 () Bool)

(assert (=> b!1268648 (= e!722954 tp_is_empty!32683)))

(declare-fun res!844353 () Bool)

(assert (=> start!106994 (=> (not res!844353) (not e!722955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106994 (= res!844353 (validMask!0 mask!1730))))

(assert (=> start!106994 e!722955))

(declare-fun e!722958 () Bool)

(declare-fun array_inv!30325 (array!82636) Bool)

(assert (=> start!106994 (and (array_inv!30325 _values!1134) e!722958)))

(assert (=> start!106994 true))

(declare-fun array_inv!30326 (array!82638) Bool)

(assert (=> start!106994 (array_inv!30326 _keys!1364)))

(declare-fun b!1268650 () Bool)

(assert (=> b!1268650 (= e!722958 (and e!722956 mapRes!50605))))

(declare-fun condMapEmpty!50605 () Bool)

(declare-fun mapDefault!50605 () ValueCell!15488)

