; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107180 () Bool)

(assert start!107180)

(declare-fun res!845516 () Bool)

(declare-fun e!724351 () Bool)

(assert (=> start!107180 (=> (not res!845516) (not e!724351))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107180 (= res!845516 (validMask!0 mask!1730))))

(assert (=> start!107180 e!724351))

(declare-datatypes ((V!49019 0))(
  ( (V!49020 (val!16509 Int)) )
))
(declare-datatypes ((ValueCell!15581 0))(
  ( (ValueCellFull!15581 (v!19146 V!49019)) (EmptyCell!15581) )
))
(declare-datatypes ((array!82996 0))(
  ( (array!82997 (arr!40035 (Array (_ BitVec 32) ValueCell!15581)) (size!40571 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82996)

(declare-fun e!724352 () Bool)

(declare-fun array_inv!30453 (array!82996) Bool)

(assert (=> start!107180 (and (array_inv!30453 _values!1134) e!724352)))

(assert (=> start!107180 true))

(declare-datatypes ((array!82998 0))(
  ( (array!82999 (arr!40036 (Array (_ BitVec 32) (_ BitVec 64))) (size!40572 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82998)

(declare-fun array_inv!30454 (array!82998) Bool)

(assert (=> start!107180 (array_inv!30454 _keys!1364)))

(declare-fun b!1270643 () Bool)

(declare-fun res!845515 () Bool)

(assert (=> b!1270643 (=> (not res!845515) (not e!724351))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270643 (= res!845515 (and (= (size!40571 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40572 _keys!1364) (size!40571 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50884 () Bool)

(declare-fun mapRes!50884 () Bool)

(declare-fun tp!97225 () Bool)

(declare-fun e!724349 () Bool)

(assert (=> mapNonEmpty!50884 (= mapRes!50884 (and tp!97225 e!724349))))

(declare-fun mapValue!50884 () ValueCell!15581)

(declare-fun mapRest!50884 () (Array (_ BitVec 32) ValueCell!15581))

(declare-fun mapKey!50884 () (_ BitVec 32))

(assert (=> mapNonEmpty!50884 (= (arr!40035 _values!1134) (store mapRest!50884 mapKey!50884 mapValue!50884))))

(declare-fun mapIsEmpty!50884 () Bool)

(assert (=> mapIsEmpty!50884 mapRes!50884))

(declare-fun b!1270644 () Bool)

(declare-fun e!724350 () Bool)

(declare-fun tp_is_empty!32869 () Bool)

(assert (=> b!1270644 (= e!724350 tp_is_empty!32869)))

(declare-fun b!1270645 () Bool)

(assert (=> b!1270645 (= e!724351 false)))

(declare-fun lt!574740 () Bool)

(declare-datatypes ((List!28496 0))(
  ( (Nil!28493) (Cons!28492 (h!29701 (_ BitVec 64)) (t!42025 List!28496)) )
))
(declare-fun arrayNoDuplicates!0 (array!82998 (_ BitVec 32) List!28496) Bool)

(assert (=> b!1270645 (= lt!574740 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28493))))

(declare-fun b!1270646 () Bool)

(assert (=> b!1270646 (= e!724349 tp_is_empty!32869)))

(declare-fun b!1270647 () Bool)

(assert (=> b!1270647 (= e!724352 (and e!724350 mapRes!50884))))

(declare-fun condMapEmpty!50884 () Bool)

(declare-fun mapDefault!50884 () ValueCell!15581)

