; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106952 () Bool)

(assert start!106952)

(declare-fun b!1268320 () Bool)

(declare-fun e!722697 () Bool)

(declare-fun e!722698 () Bool)

(assert (=> b!1268320 (= e!722697 e!722698)))

(declare-fun res!844182 () Bool)

(assert (=> b!1268320 (=> res!844182 e!722698)))

(declare-datatypes ((List!28380 0))(
  ( (Nil!28377) (Cons!28376 (h!29585 (_ BitVec 64)) (t!41909 List!28380)) )
))
(declare-fun contains!7662 (List!28380 (_ BitVec 64)) Bool)

(assert (=> b!1268320 (= res!844182 (contains!7662 Nil!28377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!50557 () Bool)

(declare-fun mapRes!50557 () Bool)

(declare-fun tp!96736 () Bool)

(declare-fun e!722694 () Bool)

(assert (=> mapNonEmpty!50557 (= mapRes!50557 (and tp!96736 e!722694))))

(declare-datatypes ((V!48731 0))(
  ( (V!48732 (val!16401 Int)) )
))
(declare-datatypes ((ValueCell!15473 0))(
  ( (ValueCellFull!15473 (v!19037 V!48731)) (EmptyCell!15473) )
))
(declare-datatypes ((array!82578 0))(
  ( (array!82579 (arr!39827 (Array (_ BitVec 32) ValueCell!15473)) (size!40363 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82578)

(declare-fun mapKey!50557 () (_ BitVec 32))

(declare-fun mapValue!50557 () ValueCell!15473)

(declare-fun mapRest!50557 () (Array (_ BitVec 32) ValueCell!15473))

(assert (=> mapNonEmpty!50557 (= (arr!39827 _values!1134) (store mapRest!50557 mapKey!50557 mapValue!50557))))

(declare-fun b!1268321 () Bool)

(declare-fun e!722693 () Bool)

(declare-fun tp_is_empty!32653 () Bool)

(assert (=> b!1268321 (= e!722693 tp_is_empty!32653)))

(declare-fun mapIsEmpty!50557 () Bool)

(assert (=> mapIsEmpty!50557 mapRes!50557))

(declare-fun b!1268322 () Bool)

(declare-fun res!844181 () Bool)

(assert (=> b!1268322 (=> (not res!844181) (not e!722697))))

(declare-fun noDuplicate!2044 (List!28380) Bool)

(assert (=> b!1268322 (= res!844181 (noDuplicate!2044 Nil!28377))))

(declare-fun res!844177 () Bool)

(assert (=> start!106952 (=> (not res!844177) (not e!722697))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106952 (= res!844177 (validMask!0 mask!1730))))

(assert (=> start!106952 e!722697))

(declare-fun e!722696 () Bool)

(declare-fun array_inv!30307 (array!82578) Bool)

(assert (=> start!106952 (and (array_inv!30307 _values!1134) e!722696)))

(assert (=> start!106952 true))

(declare-datatypes ((array!82580 0))(
  ( (array!82581 (arr!39828 (Array (_ BitVec 32) (_ BitVec 64))) (size!40364 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82580)

(declare-fun array_inv!30308 (array!82580) Bool)

(assert (=> start!106952 (array_inv!30308 _keys!1364)))

(declare-fun b!1268323 () Bool)

(declare-fun res!844179 () Bool)

(assert (=> b!1268323 (=> (not res!844179) (not e!722697))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268323 (= res!844179 (and (= (size!40363 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40364 _keys!1364) (size!40363 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268324 () Bool)

(assert (=> b!1268324 (= e!722696 (and e!722693 mapRes!50557))))

(declare-fun condMapEmpty!50557 () Bool)

(declare-fun mapDefault!50557 () ValueCell!15473)

