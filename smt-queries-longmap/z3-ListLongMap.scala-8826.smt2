; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107180 () Bool)

(assert start!107180)

(declare-fun b!1270579 () Bool)

(declare-fun e!724322 () Bool)

(declare-fun tp_is_empty!32869 () Bool)

(assert (=> b!1270579 (= e!724322 tp_is_empty!32869)))

(declare-fun b!1270580 () Bool)

(declare-fun e!724320 () Bool)

(assert (=> b!1270580 (= e!724320 false)))

(declare-fun lt!574562 () Bool)

(declare-datatypes ((array!82909 0))(
  ( (array!82910 (arr!39992 (Array (_ BitVec 32) (_ BitVec 64))) (size!40530 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82909)

(declare-datatypes ((List!28572 0))(
  ( (Nil!28569) (Cons!28568 (h!29777 (_ BitVec 64)) (t!42093 List!28572)) )
))
(declare-fun arrayNoDuplicates!0 (array!82909 (_ BitVec 32) List!28572) Bool)

(assert (=> b!1270580 (= lt!574562 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28569))))

(declare-fun b!1270581 () Bool)

(declare-fun res!845488 () Bool)

(assert (=> b!1270581 (=> (not res!845488) (not e!724320))))

(declare-datatypes ((V!49019 0))(
  ( (V!49020 (val!16509 Int)) )
))
(declare-datatypes ((ValueCell!15581 0))(
  ( (ValueCellFull!15581 (v!19145 V!49019)) (EmptyCell!15581) )
))
(declare-datatypes ((array!82911 0))(
  ( (array!82912 (arr!39993 (Array (_ BitVec 32) ValueCell!15581)) (size!40531 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82911)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270581 (= res!845488 (and (= (size!40531 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40530 _keys!1364) (size!40531 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270582 () Bool)

(declare-fun e!724324 () Bool)

(assert (=> b!1270582 (= e!724324 tp_is_empty!32869)))

(declare-fun mapIsEmpty!50884 () Bool)

(declare-fun mapRes!50884 () Bool)

(assert (=> mapIsEmpty!50884 mapRes!50884))

(declare-fun b!1270583 () Bool)

(declare-fun res!845487 () Bool)

(assert (=> b!1270583 (=> (not res!845487) (not e!724320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82909 (_ BitVec 32)) Bool)

(assert (=> b!1270583 (= res!845487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270584 () Bool)

(declare-fun e!724323 () Bool)

(assert (=> b!1270584 (= e!724323 (and e!724322 mapRes!50884))))

(declare-fun condMapEmpty!50884 () Bool)

(declare-fun mapDefault!50884 () ValueCell!15581)

(assert (=> b!1270584 (= condMapEmpty!50884 (= (arr!39993 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15581)) mapDefault!50884)))))

(declare-fun mapNonEmpty!50884 () Bool)

(declare-fun tp!97226 () Bool)

(assert (=> mapNonEmpty!50884 (= mapRes!50884 (and tp!97226 e!724324))))

(declare-fun mapRest!50884 () (Array (_ BitVec 32) ValueCell!15581))

(declare-fun mapValue!50884 () ValueCell!15581)

(declare-fun mapKey!50884 () (_ BitVec 32))

(assert (=> mapNonEmpty!50884 (= (arr!39993 _values!1134) (store mapRest!50884 mapKey!50884 mapValue!50884))))

(declare-fun res!845489 () Bool)

(assert (=> start!107180 (=> (not res!845489) (not e!724320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107180 (= res!845489 (validMask!0 mask!1730))))

(assert (=> start!107180 e!724320))

(declare-fun array_inv!30583 (array!82911) Bool)

(assert (=> start!107180 (and (array_inv!30583 _values!1134) e!724323)))

(assert (=> start!107180 true))

(declare-fun array_inv!30584 (array!82909) Bool)

(assert (=> start!107180 (array_inv!30584 _keys!1364)))

(assert (= (and start!107180 res!845489) b!1270581))

(assert (= (and b!1270581 res!845488) b!1270583))

(assert (= (and b!1270583 res!845487) b!1270580))

(assert (= (and b!1270584 condMapEmpty!50884) mapIsEmpty!50884))

(assert (= (and b!1270584 (not condMapEmpty!50884)) mapNonEmpty!50884))

(get-info :version)

(assert (= (and mapNonEmpty!50884 ((_ is ValueCellFull!15581) mapValue!50884)) b!1270582))

(assert (= (and b!1270584 ((_ is ValueCellFull!15581) mapDefault!50884)) b!1270579))

(assert (= start!107180 b!1270584))

(declare-fun m!1168359 () Bool)

(assert (=> b!1270580 m!1168359))

(declare-fun m!1168361 () Bool)

(assert (=> b!1270583 m!1168361))

(declare-fun m!1168363 () Bool)

(assert (=> mapNonEmpty!50884 m!1168363))

(declare-fun m!1168365 () Bool)

(assert (=> start!107180 m!1168365))

(declare-fun m!1168367 () Bool)

(assert (=> start!107180 m!1168367))

(declare-fun m!1168369 () Bool)

(assert (=> start!107180 m!1168369))

(check-sat (not b!1270583) tp_is_empty!32869 (not mapNonEmpty!50884) (not start!107180) (not b!1270580))
(check-sat)
