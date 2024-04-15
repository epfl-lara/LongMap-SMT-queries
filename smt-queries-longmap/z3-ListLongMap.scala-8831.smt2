; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107210 () Bool)

(assert start!107210)

(declare-fun mapIsEmpty!50929 () Bool)

(declare-fun mapRes!50929 () Bool)

(assert (=> mapIsEmpty!50929 mapRes!50929))

(declare-fun res!845622 () Bool)

(declare-fun e!724545 () Bool)

(assert (=> start!107210 (=> (not res!845622) (not e!724545))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107210 (= res!845622 (validMask!0 mask!1730))))

(assert (=> start!107210 e!724545))

(declare-datatypes ((V!49059 0))(
  ( (V!49060 (val!16524 Int)) )
))
(declare-datatypes ((ValueCell!15596 0))(
  ( (ValueCellFull!15596 (v!19160 V!49059)) (EmptyCell!15596) )
))
(declare-datatypes ((array!82967 0))(
  ( (array!82968 (arr!40021 (Array (_ BitVec 32) ValueCell!15596)) (size!40559 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82967)

(declare-fun e!724547 () Bool)

(declare-fun array_inv!30603 (array!82967) Bool)

(assert (=> start!107210 (and (array_inv!30603 _values!1134) e!724547)))

(assert (=> start!107210 true))

(declare-datatypes ((array!82969 0))(
  ( (array!82970 (arr!40022 (Array (_ BitVec 32) (_ BitVec 64))) (size!40560 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82969)

(declare-fun array_inv!30604 (array!82969) Bool)

(assert (=> start!107210 (array_inv!30604 _keys!1364)))

(declare-fun b!1270849 () Bool)

(declare-fun res!845623 () Bool)

(assert (=> b!1270849 (=> (not res!845623) (not e!724545))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270849 (= res!845623 (and (= (size!40559 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40560 _keys!1364) (size!40559 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270850 () Bool)

(assert (=> b!1270850 (= e!724545 false)))

(declare-fun lt!574607 () Bool)

(declare-datatypes ((List!28584 0))(
  ( (Nil!28581) (Cons!28580 (h!29789 (_ BitVec 64)) (t!42105 List!28584)) )
))
(declare-fun arrayNoDuplicates!0 (array!82969 (_ BitVec 32) List!28584) Bool)

(assert (=> b!1270850 (= lt!574607 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28581))))

(declare-fun mapNonEmpty!50929 () Bool)

(declare-fun tp!97271 () Bool)

(declare-fun e!724548 () Bool)

(assert (=> mapNonEmpty!50929 (= mapRes!50929 (and tp!97271 e!724548))))

(declare-fun mapKey!50929 () (_ BitVec 32))

(declare-fun mapValue!50929 () ValueCell!15596)

(declare-fun mapRest!50929 () (Array (_ BitVec 32) ValueCell!15596))

(assert (=> mapNonEmpty!50929 (= (arr!40021 _values!1134) (store mapRest!50929 mapKey!50929 mapValue!50929))))

(declare-fun b!1270851 () Bool)

(declare-fun e!724546 () Bool)

(declare-fun tp_is_empty!32899 () Bool)

(assert (=> b!1270851 (= e!724546 tp_is_empty!32899)))

(declare-fun b!1270852 () Bool)

(declare-fun res!845624 () Bool)

(assert (=> b!1270852 (=> (not res!845624) (not e!724545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82969 (_ BitVec 32)) Bool)

(assert (=> b!1270852 (= res!845624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270853 () Bool)

(assert (=> b!1270853 (= e!724547 (and e!724546 mapRes!50929))))

(declare-fun condMapEmpty!50929 () Bool)

(declare-fun mapDefault!50929 () ValueCell!15596)

(assert (=> b!1270853 (= condMapEmpty!50929 (= (arr!40021 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15596)) mapDefault!50929)))))

(declare-fun b!1270854 () Bool)

(assert (=> b!1270854 (= e!724548 tp_is_empty!32899)))

(assert (= (and start!107210 res!845622) b!1270849))

(assert (= (and b!1270849 res!845623) b!1270852))

(assert (= (and b!1270852 res!845624) b!1270850))

(assert (= (and b!1270853 condMapEmpty!50929) mapIsEmpty!50929))

(assert (= (and b!1270853 (not condMapEmpty!50929)) mapNonEmpty!50929))

(get-info :version)

(assert (= (and mapNonEmpty!50929 ((_ is ValueCellFull!15596) mapValue!50929)) b!1270854))

(assert (= (and b!1270853 ((_ is ValueCellFull!15596) mapDefault!50929)) b!1270851))

(assert (= start!107210 b!1270853))

(declare-fun m!1168539 () Bool)

(assert (=> start!107210 m!1168539))

(declare-fun m!1168541 () Bool)

(assert (=> start!107210 m!1168541))

(declare-fun m!1168543 () Bool)

(assert (=> start!107210 m!1168543))

(declare-fun m!1168545 () Bool)

(assert (=> b!1270850 m!1168545))

(declare-fun m!1168547 () Bool)

(assert (=> mapNonEmpty!50929 m!1168547))

(declare-fun m!1168549 () Bool)

(assert (=> b!1270852 m!1168549))

(check-sat (not start!107210) (not mapNonEmpty!50929) tp_is_empty!32899 (not b!1270850) (not b!1270852))
(check-sat)
