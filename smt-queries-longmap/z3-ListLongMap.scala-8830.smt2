; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107206 () Bool)

(assert start!107206)

(declare-fun b!1270877 () Bool)

(declare-fun e!724544 () Bool)

(declare-fun e!724547 () Bool)

(declare-fun mapRes!50923 () Bool)

(assert (=> b!1270877 (= e!724544 (and e!724547 mapRes!50923))))

(declare-fun condMapEmpty!50923 () Bool)

(declare-datatypes ((V!49053 0))(
  ( (V!49054 (val!16522 Int)) )
))
(declare-datatypes ((ValueCell!15594 0))(
  ( (ValueCellFull!15594 (v!19159 V!49053)) (EmptyCell!15594) )
))
(declare-datatypes ((array!83046 0))(
  ( (array!83047 (arr!40060 (Array (_ BitVec 32) ValueCell!15594)) (size!40596 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83046)

(declare-fun mapDefault!50923 () ValueCell!15594)

(assert (=> b!1270877 (= condMapEmpty!50923 (= (arr!40060 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15594)) mapDefault!50923)))))

(declare-fun mapIsEmpty!50923 () Bool)

(assert (=> mapIsEmpty!50923 mapRes!50923))

(declare-fun b!1270878 () Bool)

(declare-fun res!845631 () Bool)

(declare-fun e!724546 () Bool)

(assert (=> b!1270878 (=> (not res!845631) (not e!724546))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83048 0))(
  ( (array!83049 (arr!40061 (Array (_ BitVec 32) (_ BitVec 64))) (size!40597 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83048)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270878 (= res!845631 (and (= (size!40596 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40597 _keys!1364) (size!40596 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270879 () Bool)

(declare-fun e!724548 () Bool)

(declare-fun tp_is_empty!32895 () Bool)

(assert (=> b!1270879 (= e!724548 tp_is_empty!32895)))

(declare-fun b!1270880 () Bool)

(assert (=> b!1270880 (= e!724547 tp_is_empty!32895)))

(declare-fun res!845632 () Bool)

(assert (=> start!107206 (=> (not res!845632) (not e!724546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107206 (= res!845632 (validMask!0 mask!1730))))

(assert (=> start!107206 e!724546))

(declare-fun array_inv!30469 (array!83046) Bool)

(assert (=> start!107206 (and (array_inv!30469 _values!1134) e!724544)))

(assert (=> start!107206 true))

(declare-fun array_inv!30470 (array!83048) Bool)

(assert (=> start!107206 (array_inv!30470 _keys!1364)))

(declare-fun b!1270881 () Bool)

(assert (=> b!1270881 (= e!724546 false)))

(declare-fun lt!574779 () Bool)

(declare-datatypes ((List!28504 0))(
  ( (Nil!28501) (Cons!28500 (h!29709 (_ BitVec 64)) (t!42033 List!28504)) )
))
(declare-fun arrayNoDuplicates!0 (array!83048 (_ BitVec 32) List!28504) Bool)

(assert (=> b!1270881 (= lt!574779 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28501))))

(declare-fun mapNonEmpty!50923 () Bool)

(declare-fun tp!97264 () Bool)

(assert (=> mapNonEmpty!50923 (= mapRes!50923 (and tp!97264 e!724548))))

(declare-fun mapKey!50923 () (_ BitVec 32))

(declare-fun mapValue!50923 () ValueCell!15594)

(declare-fun mapRest!50923 () (Array (_ BitVec 32) ValueCell!15594))

(assert (=> mapNonEmpty!50923 (= (arr!40060 _values!1134) (store mapRest!50923 mapKey!50923 mapValue!50923))))

(declare-fun b!1270882 () Bool)

(declare-fun res!845633 () Bool)

(assert (=> b!1270882 (=> (not res!845633) (not e!724546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83048 (_ BitVec 32)) Bool)

(assert (=> b!1270882 (= res!845633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107206 res!845632) b!1270878))

(assert (= (and b!1270878 res!845631) b!1270882))

(assert (= (and b!1270882 res!845633) b!1270881))

(assert (= (and b!1270877 condMapEmpty!50923) mapIsEmpty!50923))

(assert (= (and b!1270877 (not condMapEmpty!50923)) mapNonEmpty!50923))

(get-info :version)

(assert (= (and mapNonEmpty!50923 ((_ is ValueCellFull!15594) mapValue!50923)) b!1270879))

(assert (= (and b!1270877 ((_ is ValueCellFull!15594) mapDefault!50923)) b!1270880))

(assert (= start!107206 b!1270877))

(declare-fun m!1169015 () Bool)

(assert (=> start!107206 m!1169015))

(declare-fun m!1169017 () Bool)

(assert (=> start!107206 m!1169017))

(declare-fun m!1169019 () Bool)

(assert (=> start!107206 m!1169019))

(declare-fun m!1169021 () Bool)

(assert (=> b!1270881 m!1169021))

(declare-fun m!1169023 () Bool)

(assert (=> mapNonEmpty!50923 m!1169023))

(declare-fun m!1169025 () Bool)

(assert (=> b!1270882 m!1169025))

(check-sat (not b!1270881) (not start!107206) tp_is_empty!32895 (not mapNonEmpty!50923) (not b!1270882))
(check-sat)
