; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107278 () Bool)

(assert start!107278)

(declare-fun b!1271525 () Bool)

(declare-fun e!725086 () Bool)

(declare-fun e!725088 () Bool)

(declare-fun mapRes!51031 () Bool)

(assert (=> b!1271525 (= e!725086 (and e!725088 mapRes!51031))))

(declare-fun condMapEmpty!51031 () Bool)

(declare-datatypes ((V!49149 0))(
  ( (V!49150 (val!16558 Int)) )
))
(declare-datatypes ((ValueCell!15630 0))(
  ( (ValueCellFull!15630 (v!19195 V!49149)) (EmptyCell!15630) )
))
(declare-datatypes ((array!83182 0))(
  ( (array!83183 (arr!40128 (Array (_ BitVec 32) ValueCell!15630)) (size!40664 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83182)

(declare-fun mapDefault!51031 () ValueCell!15630)

(assert (=> b!1271525 (= condMapEmpty!51031 (= (arr!40128 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15630)) mapDefault!51031)))))

(declare-fun res!845956 () Bool)

(declare-fun e!725085 () Bool)

(assert (=> start!107278 (=> (not res!845956) (not e!725085))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107278 (= res!845956 (validMask!0 mask!1730))))

(assert (=> start!107278 e!725085))

(declare-fun array_inv!30521 (array!83182) Bool)

(assert (=> start!107278 (and (array_inv!30521 _values!1134) e!725086)))

(assert (=> start!107278 true))

(declare-datatypes ((array!83184 0))(
  ( (array!83185 (arr!40129 (Array (_ BitVec 32) (_ BitVec 64))) (size!40665 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83184)

(declare-fun array_inv!30522 (array!83184) Bool)

(assert (=> start!107278 (array_inv!30522 _keys!1364)))

(declare-fun b!1271526 () Bool)

(assert (=> b!1271526 (= e!725085 false)))

(declare-fun lt!574887 () Bool)

(declare-datatypes ((List!28529 0))(
  ( (Nil!28526) (Cons!28525 (h!29734 (_ BitVec 64)) (t!42058 List!28529)) )
))
(declare-fun arrayNoDuplicates!0 (array!83184 (_ BitVec 32) List!28529) Bool)

(assert (=> b!1271526 (= lt!574887 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28526))))

(declare-fun b!1271527 () Bool)

(declare-fun tp_is_empty!32967 () Bool)

(assert (=> b!1271527 (= e!725088 tp_is_empty!32967)))

(declare-fun mapNonEmpty!51031 () Bool)

(declare-fun tp!97372 () Bool)

(declare-fun e!725087 () Bool)

(assert (=> mapNonEmpty!51031 (= mapRes!51031 (and tp!97372 e!725087))))

(declare-fun mapValue!51031 () ValueCell!15630)

(declare-fun mapKey!51031 () (_ BitVec 32))

(declare-fun mapRest!51031 () (Array (_ BitVec 32) ValueCell!15630))

(assert (=> mapNonEmpty!51031 (= (arr!40128 _values!1134) (store mapRest!51031 mapKey!51031 mapValue!51031))))

(declare-fun mapIsEmpty!51031 () Bool)

(assert (=> mapIsEmpty!51031 mapRes!51031))

(declare-fun b!1271528 () Bool)

(declare-fun res!845955 () Bool)

(assert (=> b!1271528 (=> (not res!845955) (not e!725085))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271528 (= res!845955 (and (= (size!40664 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40665 _keys!1364) (size!40664 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271529 () Bool)

(assert (=> b!1271529 (= e!725087 tp_is_empty!32967)))

(declare-fun b!1271530 () Bool)

(declare-fun res!845957 () Bool)

(assert (=> b!1271530 (=> (not res!845957) (not e!725085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83184 (_ BitVec 32)) Bool)

(assert (=> b!1271530 (= res!845957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107278 res!845956) b!1271528))

(assert (= (and b!1271528 res!845955) b!1271530))

(assert (= (and b!1271530 res!845957) b!1271526))

(assert (= (and b!1271525 condMapEmpty!51031) mapIsEmpty!51031))

(assert (= (and b!1271525 (not condMapEmpty!51031)) mapNonEmpty!51031))

(get-info :version)

(assert (= (and mapNonEmpty!51031 ((_ is ValueCellFull!15630) mapValue!51031)) b!1271529))

(assert (= (and b!1271525 ((_ is ValueCellFull!15630) mapDefault!51031)) b!1271527))

(assert (= start!107278 b!1271525))

(declare-fun m!1169447 () Bool)

(assert (=> start!107278 m!1169447))

(declare-fun m!1169449 () Bool)

(assert (=> start!107278 m!1169449))

(declare-fun m!1169451 () Bool)

(assert (=> start!107278 m!1169451))

(declare-fun m!1169453 () Bool)

(assert (=> b!1271526 m!1169453))

(declare-fun m!1169455 () Bool)

(assert (=> mapNonEmpty!51031 m!1169455))

(declare-fun m!1169457 () Bool)

(assert (=> b!1271530 m!1169457))

(check-sat (not b!1271526) tp_is_empty!32967 (not mapNonEmpty!51031) (not b!1271530) (not start!107278))
(check-sat)
