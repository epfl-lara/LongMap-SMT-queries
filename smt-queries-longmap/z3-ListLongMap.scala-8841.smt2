; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107272 () Bool)

(assert start!107272)

(declare-fun b!1271471 () Bool)

(declare-fun e!725039 () Bool)

(declare-fun tp_is_empty!32961 () Bool)

(assert (=> b!1271471 (= e!725039 tp_is_empty!32961)))

(declare-fun mapIsEmpty!51022 () Bool)

(declare-fun mapRes!51022 () Bool)

(assert (=> mapIsEmpty!51022 mapRes!51022))

(declare-fun b!1271472 () Bool)

(declare-fun e!725040 () Bool)

(assert (=> b!1271472 (= e!725040 false)))

(declare-fun lt!574878 () Bool)

(declare-datatypes ((array!83172 0))(
  ( (array!83173 (arr!40123 (Array (_ BitVec 32) (_ BitVec 64))) (size!40659 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83172)

(declare-datatypes ((List!28527 0))(
  ( (Nil!28524) (Cons!28523 (h!29732 (_ BitVec 64)) (t!42056 List!28527)) )
))
(declare-fun arrayNoDuplicates!0 (array!83172 (_ BitVec 32) List!28527) Bool)

(assert (=> b!1271472 (= lt!574878 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28524))))

(declare-fun b!1271473 () Bool)

(declare-fun res!845930 () Bool)

(assert (=> b!1271473 (=> (not res!845930) (not e!725040))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83172 (_ BitVec 32)) Bool)

(assert (=> b!1271473 (= res!845930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271474 () Bool)

(declare-fun e!725042 () Bool)

(assert (=> b!1271474 (= e!725042 (and e!725039 mapRes!51022))))

(declare-fun condMapEmpty!51022 () Bool)

(declare-datatypes ((V!49141 0))(
  ( (V!49142 (val!16555 Int)) )
))
(declare-datatypes ((ValueCell!15627 0))(
  ( (ValueCellFull!15627 (v!19192 V!49141)) (EmptyCell!15627) )
))
(declare-datatypes ((array!83174 0))(
  ( (array!83175 (arr!40124 (Array (_ BitVec 32) ValueCell!15627)) (size!40660 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83174)

(declare-fun mapDefault!51022 () ValueCell!15627)

(assert (=> b!1271474 (= condMapEmpty!51022 (= (arr!40124 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15627)) mapDefault!51022)))))

(declare-fun b!1271475 () Bool)

(declare-fun e!725043 () Bool)

(assert (=> b!1271475 (= e!725043 tp_is_empty!32961)))

(declare-fun mapNonEmpty!51022 () Bool)

(declare-fun tp!97363 () Bool)

(assert (=> mapNonEmpty!51022 (= mapRes!51022 (and tp!97363 e!725043))))

(declare-fun mapValue!51022 () ValueCell!15627)

(declare-fun mapRest!51022 () (Array (_ BitVec 32) ValueCell!15627))

(declare-fun mapKey!51022 () (_ BitVec 32))

(assert (=> mapNonEmpty!51022 (= (arr!40124 _values!1134) (store mapRest!51022 mapKey!51022 mapValue!51022))))

(declare-fun res!845928 () Bool)

(assert (=> start!107272 (=> (not res!845928) (not e!725040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107272 (= res!845928 (validMask!0 mask!1730))))

(assert (=> start!107272 e!725040))

(declare-fun array_inv!30517 (array!83174) Bool)

(assert (=> start!107272 (and (array_inv!30517 _values!1134) e!725042)))

(assert (=> start!107272 true))

(declare-fun array_inv!30518 (array!83172) Bool)

(assert (=> start!107272 (array_inv!30518 _keys!1364)))

(declare-fun b!1271476 () Bool)

(declare-fun res!845929 () Bool)

(assert (=> b!1271476 (=> (not res!845929) (not e!725040))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271476 (= res!845929 (and (= (size!40660 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40659 _keys!1364) (size!40660 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107272 res!845928) b!1271476))

(assert (= (and b!1271476 res!845929) b!1271473))

(assert (= (and b!1271473 res!845930) b!1271472))

(assert (= (and b!1271474 condMapEmpty!51022) mapIsEmpty!51022))

(assert (= (and b!1271474 (not condMapEmpty!51022)) mapNonEmpty!51022))

(get-info :version)

(assert (= (and mapNonEmpty!51022 ((_ is ValueCellFull!15627) mapValue!51022)) b!1271475))

(assert (= (and b!1271474 ((_ is ValueCellFull!15627) mapDefault!51022)) b!1271471))

(assert (= start!107272 b!1271474))

(declare-fun m!1169411 () Bool)

(assert (=> b!1271472 m!1169411))

(declare-fun m!1169413 () Bool)

(assert (=> b!1271473 m!1169413))

(declare-fun m!1169415 () Bool)

(assert (=> mapNonEmpty!51022 m!1169415))

(declare-fun m!1169417 () Bool)

(assert (=> start!107272 m!1169417))

(declare-fun m!1169419 () Bool)

(assert (=> start!107272 m!1169419))

(declare-fun m!1169421 () Bool)

(assert (=> start!107272 m!1169421))

(check-sat (not mapNonEmpty!51022) tp_is_empty!32961 (not b!1271472) (not start!107272) (not b!1271473))
(check-sat)
