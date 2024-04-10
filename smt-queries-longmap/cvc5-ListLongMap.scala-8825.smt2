; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107174 () Bool)

(assert start!107174)

(declare-fun b!1270589 () Bool)

(declare-fun e!724306 () Bool)

(assert (=> b!1270589 (= e!724306 false)))

(declare-fun lt!574731 () Bool)

(declare-datatypes ((array!82986 0))(
  ( (array!82987 (arr!40030 (Array (_ BitVec 32) (_ BitVec 64))) (size!40566 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82986)

(declare-datatypes ((List!28494 0))(
  ( (Nil!28491) (Cons!28490 (h!29699 (_ BitVec 64)) (t!42023 List!28494)) )
))
(declare-fun arrayNoDuplicates!0 (array!82986 (_ BitVec 32) List!28494) Bool)

(assert (=> b!1270589 (= lt!574731 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28491))))

(declare-fun mapIsEmpty!50875 () Bool)

(declare-fun mapRes!50875 () Bool)

(assert (=> mapIsEmpty!50875 mapRes!50875))

(declare-fun b!1270590 () Bool)

(declare-fun e!724304 () Bool)

(declare-fun tp_is_empty!32863 () Bool)

(assert (=> b!1270590 (= e!724304 tp_is_empty!32863)))

(declare-fun res!845489 () Bool)

(assert (=> start!107174 (=> (not res!845489) (not e!724306))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107174 (= res!845489 (validMask!0 mask!1730))))

(assert (=> start!107174 e!724306))

(declare-datatypes ((V!49011 0))(
  ( (V!49012 (val!16506 Int)) )
))
(declare-datatypes ((ValueCell!15578 0))(
  ( (ValueCellFull!15578 (v!19143 V!49011)) (EmptyCell!15578) )
))
(declare-datatypes ((array!82988 0))(
  ( (array!82989 (arr!40031 (Array (_ BitVec 32) ValueCell!15578)) (size!40567 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82988)

(declare-fun e!724307 () Bool)

(declare-fun array_inv!30449 (array!82988) Bool)

(assert (=> start!107174 (and (array_inv!30449 _values!1134) e!724307)))

(assert (=> start!107174 true))

(declare-fun array_inv!30450 (array!82986) Bool)

(assert (=> start!107174 (array_inv!30450 _keys!1364)))

(declare-fun b!1270591 () Bool)

(declare-fun res!845488 () Bool)

(assert (=> b!1270591 (=> (not res!845488) (not e!724306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82986 (_ BitVec 32)) Bool)

(assert (=> b!1270591 (= res!845488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270592 () Bool)

(declare-fun res!845487 () Bool)

(assert (=> b!1270592 (=> (not res!845487) (not e!724306))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270592 (= res!845487 (and (= (size!40567 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40566 _keys!1364) (size!40567 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50875 () Bool)

(declare-fun tp!97216 () Bool)

(declare-fun e!724305 () Bool)

(assert (=> mapNonEmpty!50875 (= mapRes!50875 (and tp!97216 e!724305))))

(declare-fun mapKey!50875 () (_ BitVec 32))

(declare-fun mapRest!50875 () (Array (_ BitVec 32) ValueCell!15578))

(declare-fun mapValue!50875 () ValueCell!15578)

(assert (=> mapNonEmpty!50875 (= (arr!40031 _values!1134) (store mapRest!50875 mapKey!50875 mapValue!50875))))

(declare-fun b!1270593 () Bool)

(assert (=> b!1270593 (= e!724305 tp_is_empty!32863)))

(declare-fun b!1270594 () Bool)

(assert (=> b!1270594 (= e!724307 (and e!724304 mapRes!50875))))

(declare-fun condMapEmpty!50875 () Bool)

(declare-fun mapDefault!50875 () ValueCell!15578)

