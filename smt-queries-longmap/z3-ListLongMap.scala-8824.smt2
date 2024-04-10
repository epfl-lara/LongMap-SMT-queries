; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107170 () Bool)

(assert start!107170)

(declare-fun mapIsEmpty!50869 () Bool)

(declare-fun mapRes!50869 () Bool)

(assert (=> mapIsEmpty!50869 mapRes!50869))

(declare-fun b!1270553 () Bool)

(declare-fun e!724275 () Bool)

(assert (=> b!1270553 (= e!724275 false)))

(declare-fun lt!574725 () Bool)

(declare-datatypes ((array!82978 0))(
  ( (array!82979 (arr!40026 (Array (_ BitVec 32) (_ BitVec 64))) (size!40562 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82978)

(declare-datatypes ((List!28492 0))(
  ( (Nil!28489) (Cons!28488 (h!29697 (_ BitVec 64)) (t!42021 List!28492)) )
))
(declare-fun arrayNoDuplicates!0 (array!82978 (_ BitVec 32) List!28492) Bool)

(assert (=> b!1270553 (= lt!574725 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28489))))

(declare-fun b!1270554 () Bool)

(declare-fun e!724278 () Bool)

(declare-fun e!724276 () Bool)

(assert (=> b!1270554 (= e!724278 (and e!724276 mapRes!50869))))

(declare-fun condMapEmpty!50869 () Bool)

(declare-datatypes ((V!49005 0))(
  ( (V!49006 (val!16504 Int)) )
))
(declare-datatypes ((ValueCell!15576 0))(
  ( (ValueCellFull!15576 (v!19141 V!49005)) (EmptyCell!15576) )
))
(declare-datatypes ((array!82980 0))(
  ( (array!82981 (arr!40027 (Array (_ BitVec 32) ValueCell!15576)) (size!40563 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82980)

(declare-fun mapDefault!50869 () ValueCell!15576)

(assert (=> b!1270554 (= condMapEmpty!50869 (= (arr!40027 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15576)) mapDefault!50869)))))

(declare-fun b!1270555 () Bool)

(declare-fun tp_is_empty!32859 () Bool)

(assert (=> b!1270555 (= e!724276 tp_is_empty!32859)))

(declare-fun mapNonEmpty!50869 () Bool)

(declare-fun tp!97210 () Bool)

(declare-fun e!724277 () Bool)

(assert (=> mapNonEmpty!50869 (= mapRes!50869 (and tp!97210 e!724277))))

(declare-fun mapRest!50869 () (Array (_ BitVec 32) ValueCell!15576))

(declare-fun mapKey!50869 () (_ BitVec 32))

(declare-fun mapValue!50869 () ValueCell!15576)

(assert (=> mapNonEmpty!50869 (= (arr!40027 _values!1134) (store mapRest!50869 mapKey!50869 mapValue!50869))))

(declare-fun b!1270557 () Bool)

(assert (=> b!1270557 (= e!724277 tp_is_empty!32859)))

(declare-fun b!1270558 () Bool)

(declare-fun res!845471 () Bool)

(assert (=> b!1270558 (=> (not res!845471) (not e!724275))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270558 (= res!845471 (and (= (size!40563 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40562 _keys!1364) (size!40563 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845470 () Bool)

(assert (=> start!107170 (=> (not res!845470) (not e!724275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107170 (= res!845470 (validMask!0 mask!1730))))

(assert (=> start!107170 e!724275))

(declare-fun array_inv!30445 (array!82980) Bool)

(assert (=> start!107170 (and (array_inv!30445 _values!1134) e!724278)))

(assert (=> start!107170 true))

(declare-fun array_inv!30446 (array!82978) Bool)

(assert (=> start!107170 (array_inv!30446 _keys!1364)))

(declare-fun b!1270556 () Bool)

(declare-fun res!845469 () Bool)

(assert (=> b!1270556 (=> (not res!845469) (not e!724275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82978 (_ BitVec 32)) Bool)

(assert (=> b!1270556 (= res!845469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107170 res!845470) b!1270558))

(assert (= (and b!1270558 res!845471) b!1270556))

(assert (= (and b!1270556 res!845469) b!1270553))

(assert (= (and b!1270554 condMapEmpty!50869) mapIsEmpty!50869))

(assert (= (and b!1270554 (not condMapEmpty!50869)) mapNonEmpty!50869))

(get-info :version)

(assert (= (and mapNonEmpty!50869 ((_ is ValueCellFull!15576) mapValue!50869)) b!1270557))

(assert (= (and b!1270554 ((_ is ValueCellFull!15576) mapDefault!50869)) b!1270555))

(assert (= start!107170 b!1270554))

(declare-fun m!1168799 () Bool)

(assert (=> b!1270553 m!1168799))

(declare-fun m!1168801 () Bool)

(assert (=> mapNonEmpty!50869 m!1168801))

(declare-fun m!1168803 () Bool)

(assert (=> start!107170 m!1168803))

(declare-fun m!1168805 () Bool)

(assert (=> start!107170 m!1168805))

(declare-fun m!1168807 () Bool)

(assert (=> start!107170 m!1168807))

(declare-fun m!1168809 () Bool)

(assert (=> b!1270556 m!1168809))

(check-sat (not b!1270553) (not mapNonEmpty!50869) (not start!107170) (not b!1270556) tp_is_empty!32859)
(check-sat)
