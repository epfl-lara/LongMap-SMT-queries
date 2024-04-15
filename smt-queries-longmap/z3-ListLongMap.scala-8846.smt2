; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107300 () Bool)

(assert start!107300)

(declare-fun b!1271659 () Bool)

(declare-fun res!846029 () Bool)

(declare-fun e!725220 () Bool)

(assert (=> b!1271659 (=> (not res!846029) (not e!725220))))

(declare-datatypes ((array!83133 0))(
  ( (array!83134 (arr!40104 (Array (_ BitVec 32) (_ BitVec 64))) (size!40642 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83133)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83133 (_ BitVec 32)) Bool)

(assert (=> b!1271659 (= res!846029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271660 () Bool)

(declare-fun res!846028 () Bool)

(assert (=> b!1271660 (=> (not res!846028) (not e!725220))))

(declare-datatypes ((V!49179 0))(
  ( (V!49180 (val!16569 Int)) )
))
(declare-datatypes ((ValueCell!15641 0))(
  ( (ValueCellFull!15641 (v!19205 V!49179)) (EmptyCell!15641) )
))
(declare-datatypes ((array!83135 0))(
  ( (array!83136 (arr!40105 (Array (_ BitVec 32) ValueCell!15641)) (size!40643 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83135)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271660 (= res!846028 (and (= (size!40643 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40642 _keys!1364) (size!40643 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51064 () Bool)

(declare-fun mapRes!51064 () Bool)

(declare-fun tp!97406 () Bool)

(declare-fun e!725224 () Bool)

(assert (=> mapNonEmpty!51064 (= mapRes!51064 (and tp!97406 e!725224))))

(declare-fun mapRest!51064 () (Array (_ BitVec 32) ValueCell!15641))

(declare-fun mapValue!51064 () ValueCell!15641)

(declare-fun mapKey!51064 () (_ BitVec 32))

(assert (=> mapNonEmpty!51064 (= (arr!40105 _values!1134) (store mapRest!51064 mapKey!51064 mapValue!51064))))

(declare-fun b!1271661 () Bool)

(declare-fun e!725221 () Bool)

(declare-fun e!725222 () Bool)

(assert (=> b!1271661 (= e!725221 (and e!725222 mapRes!51064))))

(declare-fun condMapEmpty!51064 () Bool)

(declare-fun mapDefault!51064 () ValueCell!15641)

(assert (=> b!1271661 (= condMapEmpty!51064 (= (arr!40105 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15641)) mapDefault!51064)))))

(declare-fun b!1271662 () Bool)

(declare-fun tp_is_empty!32989 () Bool)

(assert (=> b!1271662 (= e!725222 tp_is_empty!32989)))

(declare-fun b!1271663 () Bool)

(assert (=> b!1271663 (= e!725220 false)))

(declare-fun lt!574742 () Bool)

(declare-datatypes ((List!28612 0))(
  ( (Nil!28609) (Cons!28608 (h!29817 (_ BitVec 64)) (t!42133 List!28612)) )
))
(declare-fun arrayNoDuplicates!0 (array!83133 (_ BitVec 32) List!28612) Bool)

(assert (=> b!1271663 (= lt!574742 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28609))))

(declare-fun res!846027 () Bool)

(assert (=> start!107300 (=> (not res!846027) (not e!725220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107300 (= res!846027 (validMask!0 mask!1730))))

(assert (=> start!107300 e!725220))

(declare-fun array_inv!30659 (array!83135) Bool)

(assert (=> start!107300 (and (array_inv!30659 _values!1134) e!725221)))

(assert (=> start!107300 true))

(declare-fun array_inv!30660 (array!83133) Bool)

(assert (=> start!107300 (array_inv!30660 _keys!1364)))

(declare-fun mapIsEmpty!51064 () Bool)

(assert (=> mapIsEmpty!51064 mapRes!51064))

(declare-fun b!1271664 () Bool)

(assert (=> b!1271664 (= e!725224 tp_is_empty!32989)))

(assert (= (and start!107300 res!846027) b!1271660))

(assert (= (and b!1271660 res!846028) b!1271659))

(assert (= (and b!1271659 res!846029) b!1271663))

(assert (= (and b!1271661 condMapEmpty!51064) mapIsEmpty!51064))

(assert (= (and b!1271661 (not condMapEmpty!51064)) mapNonEmpty!51064))

(get-info :version)

(assert (= (and mapNonEmpty!51064 ((_ is ValueCellFull!15641) mapValue!51064)) b!1271664))

(assert (= (and b!1271661 ((_ is ValueCellFull!15641) mapDefault!51064)) b!1271662))

(assert (= start!107300 b!1271661))

(declare-fun m!1169079 () Bool)

(assert (=> b!1271659 m!1169079))

(declare-fun m!1169081 () Bool)

(assert (=> mapNonEmpty!51064 m!1169081))

(declare-fun m!1169083 () Bool)

(assert (=> b!1271663 m!1169083))

(declare-fun m!1169085 () Bool)

(assert (=> start!107300 m!1169085))

(declare-fun m!1169087 () Bool)

(assert (=> start!107300 m!1169087))

(declare-fun m!1169089 () Bool)

(assert (=> start!107300 m!1169089))

(check-sat (not start!107300) (not b!1271663) tp_is_empty!32989 (not b!1271659) (not mapNonEmpty!51064))
(check-sat)
