; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107162 () Bool)

(assert start!107162)

(declare-fun mapNonEmpty!50857 () Bool)

(declare-fun mapRes!50857 () Bool)

(declare-fun tp!97198 () Bool)

(declare-fun e!724214 () Bool)

(assert (=> mapNonEmpty!50857 (= mapRes!50857 (and tp!97198 e!724214))))

(declare-fun mapKey!50857 () (_ BitVec 32))

(declare-datatypes ((V!48995 0))(
  ( (V!48996 (val!16500 Int)) )
))
(declare-datatypes ((ValueCell!15572 0))(
  ( (ValueCellFull!15572 (v!19137 V!48995)) (EmptyCell!15572) )
))
(declare-fun mapRest!50857 () (Array (_ BitVec 32) ValueCell!15572))

(declare-fun mapValue!50857 () ValueCell!15572)

(declare-datatypes ((array!82964 0))(
  ( (array!82965 (arr!40019 (Array (_ BitVec 32) ValueCell!15572)) (size!40555 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82964)

(assert (=> mapNonEmpty!50857 (= (arr!40019 _values!1134) (store mapRest!50857 mapKey!50857 mapValue!50857))))

(declare-fun mapIsEmpty!50857 () Bool)

(assert (=> mapIsEmpty!50857 mapRes!50857))

(declare-fun res!845435 () Bool)

(declare-fun e!724215 () Bool)

(assert (=> start!107162 (=> (not res!845435) (not e!724215))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107162 (= res!845435 (validMask!0 mask!1730))))

(assert (=> start!107162 e!724215))

(declare-fun e!724216 () Bool)

(declare-fun array_inv!30441 (array!82964) Bool)

(assert (=> start!107162 (and (array_inv!30441 _values!1134) e!724216)))

(assert (=> start!107162 true))

(declare-datatypes ((array!82966 0))(
  ( (array!82967 (arr!40020 (Array (_ BitVec 32) (_ BitVec 64))) (size!40556 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82966)

(declare-fun array_inv!30442 (array!82966) Bool)

(assert (=> start!107162 (array_inv!30442 _keys!1364)))

(declare-fun b!1270481 () Bool)

(declare-fun tp_is_empty!32851 () Bool)

(assert (=> b!1270481 (= e!724214 tp_is_empty!32851)))

(declare-fun b!1270482 () Bool)

(declare-fun res!845434 () Bool)

(assert (=> b!1270482 (=> (not res!845434) (not e!724215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82966 (_ BitVec 32)) Bool)

(assert (=> b!1270482 (= res!845434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270483 () Bool)

(declare-fun res!845433 () Bool)

(assert (=> b!1270483 (=> (not res!845433) (not e!724215))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270483 (= res!845433 (and (= (size!40555 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40556 _keys!1364) (size!40555 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270484 () Bool)

(declare-fun e!724218 () Bool)

(assert (=> b!1270484 (= e!724216 (and e!724218 mapRes!50857))))

(declare-fun condMapEmpty!50857 () Bool)

(declare-fun mapDefault!50857 () ValueCell!15572)

