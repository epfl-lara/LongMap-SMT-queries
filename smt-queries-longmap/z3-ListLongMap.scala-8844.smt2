; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107288 () Bool)

(assert start!107288)

(declare-fun b!1271551 () Bool)

(declare-fun e!725134 () Bool)

(declare-fun tp_is_empty!32977 () Bool)

(assert (=> b!1271551 (= e!725134 tp_is_empty!32977)))

(declare-fun b!1271552 () Bool)

(declare-fun e!725131 () Bool)

(declare-fun e!725133 () Bool)

(declare-fun mapRes!51046 () Bool)

(assert (=> b!1271552 (= e!725131 (and e!725133 mapRes!51046))))

(declare-fun condMapEmpty!51046 () Bool)

(declare-datatypes ((V!49163 0))(
  ( (V!49164 (val!16563 Int)) )
))
(declare-datatypes ((ValueCell!15635 0))(
  ( (ValueCellFull!15635 (v!19199 V!49163)) (EmptyCell!15635) )
))
(declare-datatypes ((array!83111 0))(
  ( (array!83112 (arr!40093 (Array (_ BitVec 32) ValueCell!15635)) (size!40631 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83111)

(declare-fun mapDefault!51046 () ValueCell!15635)

(assert (=> b!1271552 (= condMapEmpty!51046 (= (arr!40093 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15635)) mapDefault!51046)))))

(declare-fun b!1271553 () Bool)

(declare-fun res!845973 () Bool)

(declare-fun e!725132 () Bool)

(assert (=> b!1271553 (=> (not res!845973) (not e!725132))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83113 0))(
  ( (array!83114 (arr!40094 (Array (_ BitVec 32) (_ BitVec 64))) (size!40632 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83113)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271553 (= res!845973 (and (= (size!40631 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40632 _keys!1364) (size!40631 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51046 () Bool)

(assert (=> mapIsEmpty!51046 mapRes!51046))

(declare-fun mapNonEmpty!51046 () Bool)

(declare-fun tp!97388 () Bool)

(assert (=> mapNonEmpty!51046 (= mapRes!51046 (and tp!97388 e!725134))))

(declare-fun mapKey!51046 () (_ BitVec 32))

(declare-fun mapRest!51046 () (Array (_ BitVec 32) ValueCell!15635))

(declare-fun mapValue!51046 () ValueCell!15635)

(assert (=> mapNonEmpty!51046 (= (arr!40093 _values!1134) (store mapRest!51046 mapKey!51046 mapValue!51046))))

(declare-fun b!1271554 () Bool)

(assert (=> b!1271554 (= e!725132 false)))

(declare-fun lt!574724 () Bool)

(declare-datatypes ((List!28609 0))(
  ( (Nil!28606) (Cons!28605 (h!29814 (_ BitVec 64)) (t!42130 List!28609)) )
))
(declare-fun arrayNoDuplicates!0 (array!83113 (_ BitVec 32) List!28609) Bool)

(assert (=> b!1271554 (= lt!574724 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28606))))

(declare-fun res!845975 () Bool)

(assert (=> start!107288 (=> (not res!845975) (not e!725132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107288 (= res!845975 (validMask!0 mask!1730))))

(assert (=> start!107288 e!725132))

(declare-fun array_inv!30651 (array!83111) Bool)

(assert (=> start!107288 (and (array_inv!30651 _values!1134) e!725131)))

(assert (=> start!107288 true))

(declare-fun array_inv!30652 (array!83113) Bool)

(assert (=> start!107288 (array_inv!30652 _keys!1364)))

(declare-fun b!1271555 () Bool)

(assert (=> b!1271555 (= e!725133 tp_is_empty!32977)))

(declare-fun b!1271556 () Bool)

(declare-fun res!845974 () Bool)

(assert (=> b!1271556 (=> (not res!845974) (not e!725132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83113 (_ BitVec 32)) Bool)

(assert (=> b!1271556 (= res!845974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107288 res!845975) b!1271553))

(assert (= (and b!1271553 res!845973) b!1271556))

(assert (= (and b!1271556 res!845974) b!1271554))

(assert (= (and b!1271552 condMapEmpty!51046) mapIsEmpty!51046))

(assert (= (and b!1271552 (not condMapEmpty!51046)) mapNonEmpty!51046))

(get-info :version)

(assert (= (and mapNonEmpty!51046 ((_ is ValueCellFull!15635) mapValue!51046)) b!1271551))

(assert (= (and b!1271552 ((_ is ValueCellFull!15635) mapDefault!51046)) b!1271555))

(assert (= start!107288 b!1271552))

(declare-fun m!1169007 () Bool)

(assert (=> mapNonEmpty!51046 m!1169007))

(declare-fun m!1169009 () Bool)

(assert (=> b!1271554 m!1169009))

(declare-fun m!1169011 () Bool)

(assert (=> start!107288 m!1169011))

(declare-fun m!1169013 () Bool)

(assert (=> start!107288 m!1169013))

(declare-fun m!1169015 () Bool)

(assert (=> start!107288 m!1169015))

(declare-fun m!1169017 () Bool)

(assert (=> b!1271556 m!1169017))

(check-sat tp_is_empty!32977 (not mapNonEmpty!51046) (not start!107288) (not b!1271554) (not b!1271556))
(check-sat)
