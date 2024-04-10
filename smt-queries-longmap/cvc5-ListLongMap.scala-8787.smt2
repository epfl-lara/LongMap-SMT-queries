; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106908 () Bool)

(assert start!106908)

(declare-fun res!844059 () Bool)

(declare-fun e!722506 () Bool)

(assert (=> start!106908 (=> (not res!844059) (not e!722506))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106908 (= res!844059 (validMask!0 mask!1730))))

(assert (=> start!106908 e!722506))

(declare-datatypes ((V!48707 0))(
  ( (V!48708 (val!16392 Int)) )
))
(declare-datatypes ((ValueCell!15464 0))(
  ( (ValueCellFull!15464 (v!19028 V!48707)) (EmptyCell!15464) )
))
(declare-datatypes ((array!82536 0))(
  ( (array!82537 (arr!39809 (Array (_ BitVec 32) ValueCell!15464)) (size!40345 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82536)

(declare-fun e!722509 () Bool)

(declare-fun array_inv!30297 (array!82536) Bool)

(assert (=> start!106908 (and (array_inv!30297 _values!1134) e!722509)))

(assert (=> start!106908 true))

(declare-datatypes ((array!82538 0))(
  ( (array!82539 (arr!39810 (Array (_ BitVec 32) (_ BitVec 64))) (size!40346 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82538)

(declare-fun array_inv!30298 (array!82538) Bool)

(assert (=> start!106908 (array_inv!30298 _keys!1364)))

(declare-fun mapIsEmpty!50521 () Bool)

(declare-fun mapRes!50521 () Bool)

(assert (=> mapIsEmpty!50521 mapRes!50521))

(declare-fun b!1268077 () Bool)

(declare-fun res!844058 () Bool)

(assert (=> b!1268077 (=> (not res!844058) (not e!722506))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268077 (= res!844058 (and (= (size!40345 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40346 _keys!1364) (size!40345 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268078 () Bool)

(declare-fun e!722505 () Bool)

(declare-fun tp_is_empty!32635 () Bool)

(assert (=> b!1268078 (= e!722505 tp_is_empty!32635)))

(declare-fun b!1268079 () Bool)

(assert (=> b!1268079 (= e!722506 (bvsgt #b00000000000000000000000000000000 (size!40346 _keys!1364)))))

(declare-fun b!1268080 () Bool)

(declare-fun res!844057 () Bool)

(assert (=> b!1268080 (=> (not res!844057) (not e!722506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82538 (_ BitVec 32)) Bool)

(assert (=> b!1268080 (= res!844057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268081 () Bool)

(declare-fun e!722508 () Bool)

(assert (=> b!1268081 (= e!722508 tp_is_empty!32635)))

(declare-fun mapNonEmpty!50521 () Bool)

(declare-fun tp!96700 () Bool)

(assert (=> mapNonEmpty!50521 (= mapRes!50521 (and tp!96700 e!722505))))

(declare-fun mapValue!50521 () ValueCell!15464)

(declare-fun mapRest!50521 () (Array (_ BitVec 32) ValueCell!15464))

(declare-fun mapKey!50521 () (_ BitVec 32))

(assert (=> mapNonEmpty!50521 (= (arr!39809 _values!1134) (store mapRest!50521 mapKey!50521 mapValue!50521))))

(declare-fun b!1268082 () Bool)

(assert (=> b!1268082 (= e!722509 (and e!722508 mapRes!50521))))

(declare-fun condMapEmpty!50521 () Bool)

(declare-fun mapDefault!50521 () ValueCell!15464)

