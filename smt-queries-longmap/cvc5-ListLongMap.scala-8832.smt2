; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107216 () Bool)

(assert start!107216)

(declare-fun b!1270967 () Bool)

(declare-fun e!724619 () Bool)

(assert (=> b!1270967 (= e!724619 false)))

(declare-fun lt!574794 () Bool)

(declare-datatypes ((array!83066 0))(
  ( (array!83067 (arr!40070 (Array (_ BitVec 32) (_ BitVec 64))) (size!40606 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83066)

(declare-datatypes ((List!28507 0))(
  ( (Nil!28504) (Cons!28503 (h!29712 (_ BitVec 64)) (t!42036 List!28507)) )
))
(declare-fun arrayNoDuplicates!0 (array!83066 (_ BitVec 32) List!28507) Bool)

(assert (=> b!1270967 (= lt!574794 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28504))))

(declare-fun res!845676 () Bool)

(assert (=> start!107216 (=> (not res!845676) (not e!724619))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107216 (= res!845676 (validMask!0 mask!1730))))

(assert (=> start!107216 e!724619))

(declare-datatypes ((V!49067 0))(
  ( (V!49068 (val!16527 Int)) )
))
(declare-datatypes ((ValueCell!15599 0))(
  ( (ValueCellFull!15599 (v!19164 V!49067)) (EmptyCell!15599) )
))
(declare-datatypes ((array!83068 0))(
  ( (array!83069 (arr!40071 (Array (_ BitVec 32) ValueCell!15599)) (size!40607 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83068)

(declare-fun e!724620 () Bool)

(declare-fun array_inv!30477 (array!83068) Bool)

(assert (=> start!107216 (and (array_inv!30477 _values!1134) e!724620)))

(assert (=> start!107216 true))

(declare-fun array_inv!30478 (array!83066) Bool)

(assert (=> start!107216 (array_inv!30478 _keys!1364)))

(declare-fun mapIsEmpty!50938 () Bool)

(declare-fun mapRes!50938 () Bool)

(assert (=> mapIsEmpty!50938 mapRes!50938))

(declare-fun mapNonEmpty!50938 () Bool)

(declare-fun tp!97279 () Bool)

(declare-fun e!724622 () Bool)

(assert (=> mapNonEmpty!50938 (= mapRes!50938 (and tp!97279 e!724622))))

(declare-fun mapKey!50938 () (_ BitVec 32))

(declare-fun mapRest!50938 () (Array (_ BitVec 32) ValueCell!15599))

(declare-fun mapValue!50938 () ValueCell!15599)

(assert (=> mapNonEmpty!50938 (= (arr!40071 _values!1134) (store mapRest!50938 mapKey!50938 mapValue!50938))))

(declare-fun b!1270968 () Bool)

(declare-fun e!724621 () Bool)

(declare-fun tp_is_empty!32905 () Bool)

(assert (=> b!1270968 (= e!724621 tp_is_empty!32905)))

(declare-fun b!1270969 () Bool)

(declare-fun res!845678 () Bool)

(assert (=> b!1270969 (=> (not res!845678) (not e!724619))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270969 (= res!845678 (and (= (size!40607 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40606 _keys!1364) (size!40607 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270970 () Bool)

(declare-fun res!845677 () Bool)

(assert (=> b!1270970 (=> (not res!845677) (not e!724619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83066 (_ BitVec 32)) Bool)

(assert (=> b!1270970 (= res!845677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270971 () Bool)

(assert (=> b!1270971 (= e!724622 tp_is_empty!32905)))

(declare-fun b!1270972 () Bool)

(assert (=> b!1270972 (= e!724620 (and e!724621 mapRes!50938))))

(declare-fun condMapEmpty!50938 () Bool)

(declare-fun mapDefault!50938 () ValueCell!15599)

