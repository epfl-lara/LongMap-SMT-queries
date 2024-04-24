; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107500 () Bool)

(assert start!107500)

(declare-fun b!1272812 () Bool)

(declare-fun e!725920 () Bool)

(declare-fun tp_is_empty!32965 () Bool)

(assert (=> b!1272812 (= e!725920 tp_is_empty!32965)))

(declare-fun b!1272813 () Bool)

(declare-fun res!846466 () Bool)

(declare-fun e!725916 () Bool)

(assert (=> b!1272813 (=> (not res!846466) (not e!725916))))

(declare-datatypes ((array!83203 0))(
  ( (array!83204 (arr!40134 (Array (_ BitVec 32) (_ BitVec 64))) (size!40671 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83203)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83203 (_ BitVec 32)) Bool)

(assert (=> b!1272813 (= res!846466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272814 () Bool)

(declare-fun e!725917 () Bool)

(assert (=> b!1272814 (= e!725917 tp_is_empty!32965)))

(declare-fun b!1272815 () Bool)

(assert (=> b!1272815 (= e!725916 false)))

(declare-fun lt!575368 () Bool)

(declare-datatypes ((List!28557 0))(
  ( (Nil!28554) (Cons!28553 (h!29771 (_ BitVec 64)) (t!42078 List!28557)) )
))
(declare-fun arrayNoDuplicates!0 (array!83203 (_ BitVec 32) List!28557) Bool)

(assert (=> b!1272815 (= lt!575368 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28554))))

(declare-fun b!1272816 () Bool)

(declare-fun e!725919 () Bool)

(declare-fun mapRes!51028 () Bool)

(assert (=> b!1272816 (= e!725919 (and e!725920 mapRes!51028))))

(declare-fun condMapEmpty!51028 () Bool)

(declare-datatypes ((V!49147 0))(
  ( (V!49148 (val!16557 Int)) )
))
(declare-datatypes ((ValueCell!15629 0))(
  ( (ValueCellFull!15629 (v!19189 V!49147)) (EmptyCell!15629) )
))
(declare-datatypes ((array!83205 0))(
  ( (array!83206 (arr!40135 (Array (_ BitVec 32) ValueCell!15629)) (size!40672 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83205)

(declare-fun mapDefault!51028 () ValueCell!15629)

(assert (=> b!1272816 (= condMapEmpty!51028 (= (arr!40135 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15629)) mapDefault!51028)))))

(declare-fun b!1272817 () Bool)

(declare-fun res!846467 () Bool)

(assert (=> b!1272817 (=> (not res!846467) (not e!725916))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272817 (= res!846467 (and (= (size!40672 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40671 _keys!1364) (size!40672 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51028 () Bool)

(assert (=> mapIsEmpty!51028 mapRes!51028))

(declare-fun res!846468 () Bool)

(assert (=> start!107500 (=> (not res!846468) (not e!725916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107500 (= res!846468 (validMask!0 mask!1730))))

(assert (=> start!107500 e!725916))

(declare-fun array_inv!30689 (array!83205) Bool)

(assert (=> start!107500 (and (array_inv!30689 _values!1134) e!725919)))

(assert (=> start!107500 true))

(declare-fun array_inv!30690 (array!83203) Bool)

(assert (=> start!107500 (array_inv!30690 _keys!1364)))

(declare-fun mapNonEmpty!51028 () Bool)

(declare-fun tp!97369 () Bool)

(assert (=> mapNonEmpty!51028 (= mapRes!51028 (and tp!97369 e!725917))))

(declare-fun mapKey!51028 () (_ BitVec 32))

(declare-fun mapRest!51028 () (Array (_ BitVec 32) ValueCell!15629))

(declare-fun mapValue!51028 () ValueCell!15629)

(assert (=> mapNonEmpty!51028 (= (arr!40135 _values!1134) (store mapRest!51028 mapKey!51028 mapValue!51028))))

(assert (= (and start!107500 res!846468) b!1272817))

(assert (= (and b!1272817 res!846467) b!1272813))

(assert (= (and b!1272813 res!846466) b!1272815))

(assert (= (and b!1272816 condMapEmpty!51028) mapIsEmpty!51028))

(assert (= (and b!1272816 (not condMapEmpty!51028)) mapNonEmpty!51028))

(get-info :version)

(assert (= (and mapNonEmpty!51028 ((_ is ValueCellFull!15629) mapValue!51028)) b!1272814))

(assert (= (and b!1272816 ((_ is ValueCellFull!15629) mapDefault!51028)) b!1272812))

(assert (= start!107500 b!1272816))

(declare-fun m!1171047 () Bool)

(assert (=> b!1272813 m!1171047))

(declare-fun m!1171049 () Bool)

(assert (=> b!1272815 m!1171049))

(declare-fun m!1171051 () Bool)

(assert (=> start!107500 m!1171051))

(declare-fun m!1171053 () Bool)

(assert (=> start!107500 m!1171053))

(declare-fun m!1171055 () Bool)

(assert (=> start!107500 m!1171055))

(declare-fun m!1171057 () Bool)

(assert (=> mapNonEmpty!51028 m!1171057))

(check-sat (not start!107500) (not mapNonEmpty!51028) tp_is_empty!32965 (not b!1272813) (not b!1272815))
(check-sat)
