; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107194 () Bool)

(assert start!107194)

(declare-fun b!1270769 () Bool)

(declare-fun res!845577 () Bool)

(declare-fun e!724454 () Bool)

(assert (=> b!1270769 (=> (not res!845577) (not e!724454))))

(declare-datatypes ((array!83024 0))(
  ( (array!83025 (arr!40049 (Array (_ BitVec 32) (_ BitVec 64))) (size!40585 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83024)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83024 (_ BitVec 32)) Bool)

(assert (=> b!1270769 (= res!845577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270770 () Bool)

(declare-fun res!845578 () Bool)

(assert (=> b!1270770 (=> (not res!845578) (not e!724454))))

(declare-datatypes ((V!49037 0))(
  ( (V!49038 (val!16516 Int)) )
))
(declare-datatypes ((ValueCell!15588 0))(
  ( (ValueCellFull!15588 (v!19153 V!49037)) (EmptyCell!15588) )
))
(declare-datatypes ((array!83026 0))(
  ( (array!83027 (arr!40050 (Array (_ BitVec 32) ValueCell!15588)) (size!40586 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83026)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270770 (= res!845578 (and (= (size!40586 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40585 _keys!1364) (size!40586 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270771 () Bool)

(assert (=> b!1270771 (= e!724454 false)))

(declare-fun lt!574761 () Bool)

(declare-datatypes ((List!28500 0))(
  ( (Nil!28497) (Cons!28496 (h!29705 (_ BitVec 64)) (t!42029 List!28500)) )
))
(declare-fun arrayNoDuplicates!0 (array!83024 (_ BitVec 32) List!28500) Bool)

(assert (=> b!1270771 (= lt!574761 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28497))))

(declare-fun mapIsEmpty!50905 () Bool)

(declare-fun mapRes!50905 () Bool)

(assert (=> mapIsEmpty!50905 mapRes!50905))

(declare-fun b!1270773 () Bool)

(declare-fun e!724458 () Bool)

(declare-fun e!724455 () Bool)

(assert (=> b!1270773 (= e!724458 (and e!724455 mapRes!50905))))

(declare-fun condMapEmpty!50905 () Bool)

(declare-fun mapDefault!50905 () ValueCell!15588)

(assert (=> b!1270773 (= condMapEmpty!50905 (= (arr!40050 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15588)) mapDefault!50905)))))

(declare-fun b!1270774 () Bool)

(declare-fun e!724457 () Bool)

(declare-fun tp_is_empty!32883 () Bool)

(assert (=> b!1270774 (= e!724457 tp_is_empty!32883)))

(declare-fun mapNonEmpty!50905 () Bool)

(declare-fun tp!97246 () Bool)

(assert (=> mapNonEmpty!50905 (= mapRes!50905 (and tp!97246 e!724457))))

(declare-fun mapKey!50905 () (_ BitVec 32))

(declare-fun mapValue!50905 () ValueCell!15588)

(declare-fun mapRest!50905 () (Array (_ BitVec 32) ValueCell!15588))

(assert (=> mapNonEmpty!50905 (= (arr!40050 _values!1134) (store mapRest!50905 mapKey!50905 mapValue!50905))))

(declare-fun b!1270772 () Bool)

(assert (=> b!1270772 (= e!724455 tp_is_empty!32883)))

(declare-fun res!845579 () Bool)

(assert (=> start!107194 (=> (not res!845579) (not e!724454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107194 (= res!845579 (validMask!0 mask!1730))))

(assert (=> start!107194 e!724454))

(declare-fun array_inv!30461 (array!83026) Bool)

(assert (=> start!107194 (and (array_inv!30461 _values!1134) e!724458)))

(assert (=> start!107194 true))

(declare-fun array_inv!30462 (array!83024) Bool)

(assert (=> start!107194 (array_inv!30462 _keys!1364)))

(assert (= (and start!107194 res!845579) b!1270770))

(assert (= (and b!1270770 res!845578) b!1270769))

(assert (= (and b!1270769 res!845577) b!1270771))

(assert (= (and b!1270773 condMapEmpty!50905) mapIsEmpty!50905))

(assert (= (and b!1270773 (not condMapEmpty!50905)) mapNonEmpty!50905))

(get-info :version)

(assert (= (and mapNonEmpty!50905 ((_ is ValueCellFull!15588) mapValue!50905)) b!1270774))

(assert (= (and b!1270773 ((_ is ValueCellFull!15588) mapDefault!50905)) b!1270772))

(assert (= start!107194 b!1270773))

(declare-fun m!1168943 () Bool)

(assert (=> b!1270769 m!1168943))

(declare-fun m!1168945 () Bool)

(assert (=> b!1270771 m!1168945))

(declare-fun m!1168947 () Bool)

(assert (=> mapNonEmpty!50905 m!1168947))

(declare-fun m!1168949 () Bool)

(assert (=> start!107194 m!1168949))

(declare-fun m!1168951 () Bool)

(assert (=> start!107194 m!1168951))

(declare-fun m!1168953 () Bool)

(assert (=> start!107194 m!1168953))

(check-sat (not start!107194) tp_is_empty!32883 (not b!1270769) (not b!1270771) (not mapNonEmpty!50905))
(check-sat)
