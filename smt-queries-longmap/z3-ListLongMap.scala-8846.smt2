; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107302 () Bool)

(assert start!107302)

(declare-fun b!1271741 () Bool)

(declare-fun e!725267 () Bool)

(declare-fun tp_is_empty!32991 () Bool)

(assert (=> b!1271741 (= e!725267 tp_is_empty!32991)))

(declare-fun b!1271742 () Bool)

(declare-fun e!725265 () Bool)

(declare-fun e!725266 () Bool)

(declare-fun mapRes!51067 () Bool)

(assert (=> b!1271742 (= e!725265 (and e!725266 mapRes!51067))))

(declare-fun condMapEmpty!51067 () Bool)

(declare-datatypes ((V!49181 0))(
  ( (V!49182 (val!16570 Int)) )
))
(declare-datatypes ((ValueCell!15642 0))(
  ( (ValueCellFull!15642 (v!19207 V!49181)) (EmptyCell!15642) )
))
(declare-datatypes ((array!83230 0))(
  ( (array!83231 (arr!40152 (Array (_ BitVec 32) ValueCell!15642)) (size!40688 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83230)

(declare-fun mapDefault!51067 () ValueCell!15642)

(assert (=> b!1271742 (= condMapEmpty!51067 (= (arr!40152 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15642)) mapDefault!51067)))))

(declare-fun mapNonEmpty!51067 () Bool)

(declare-fun tp!97408 () Bool)

(assert (=> mapNonEmpty!51067 (= mapRes!51067 (and tp!97408 e!725267))))

(declare-fun mapKey!51067 () (_ BitVec 32))

(declare-fun mapValue!51067 () ValueCell!15642)

(declare-fun mapRest!51067 () (Array (_ BitVec 32) ValueCell!15642))

(assert (=> mapNonEmpty!51067 (= (arr!40152 _values!1134) (store mapRest!51067 mapKey!51067 mapValue!51067))))

(declare-fun b!1271743 () Bool)

(declare-fun res!846065 () Bool)

(declare-fun e!725268 () Bool)

(assert (=> b!1271743 (=> (not res!846065) (not e!725268))))

(declare-datatypes ((array!83232 0))(
  ( (array!83233 (arr!40153 (Array (_ BitVec 32) (_ BitVec 64))) (size!40689 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83232)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83232 (_ BitVec 32)) Bool)

(assert (=> b!1271743 (= res!846065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271744 () Bool)

(assert (=> b!1271744 (= e!725268 false)))

(declare-fun lt!574923 () Bool)

(declare-datatypes ((List!28536 0))(
  ( (Nil!28533) (Cons!28532 (h!29741 (_ BitVec 64)) (t!42065 List!28536)) )
))
(declare-fun arrayNoDuplicates!0 (array!83232 (_ BitVec 32) List!28536) Bool)

(assert (=> b!1271744 (= lt!574923 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28533))))

(declare-fun res!846064 () Bool)

(assert (=> start!107302 (=> (not res!846064) (not e!725268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107302 (= res!846064 (validMask!0 mask!1730))))

(assert (=> start!107302 e!725268))

(declare-fun array_inv!30541 (array!83230) Bool)

(assert (=> start!107302 (and (array_inv!30541 _values!1134) e!725265)))

(assert (=> start!107302 true))

(declare-fun array_inv!30542 (array!83232) Bool)

(assert (=> start!107302 (array_inv!30542 _keys!1364)))

(declare-fun mapIsEmpty!51067 () Bool)

(assert (=> mapIsEmpty!51067 mapRes!51067))

(declare-fun b!1271745 () Bool)

(declare-fun res!846063 () Bool)

(assert (=> b!1271745 (=> (not res!846063) (not e!725268))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271745 (= res!846063 (and (= (size!40688 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40689 _keys!1364) (size!40688 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271746 () Bool)

(assert (=> b!1271746 (= e!725266 tp_is_empty!32991)))

(assert (= (and start!107302 res!846064) b!1271745))

(assert (= (and b!1271745 res!846063) b!1271743))

(assert (= (and b!1271743 res!846065) b!1271744))

(assert (= (and b!1271742 condMapEmpty!51067) mapIsEmpty!51067))

(assert (= (and b!1271742 (not condMapEmpty!51067)) mapNonEmpty!51067))

(get-info :version)

(assert (= (and mapNonEmpty!51067 ((_ is ValueCellFull!15642) mapValue!51067)) b!1271741))

(assert (= (and b!1271742 ((_ is ValueCellFull!15642) mapDefault!51067)) b!1271746))

(assert (= start!107302 b!1271742))

(declare-fun m!1169591 () Bool)

(assert (=> mapNonEmpty!51067 m!1169591))

(declare-fun m!1169593 () Bool)

(assert (=> b!1271743 m!1169593))

(declare-fun m!1169595 () Bool)

(assert (=> b!1271744 m!1169595))

(declare-fun m!1169597 () Bool)

(assert (=> start!107302 m!1169597))

(declare-fun m!1169599 () Bool)

(assert (=> start!107302 m!1169599))

(declare-fun m!1169601 () Bool)

(assert (=> start!107302 m!1169601))

(check-sat (not start!107302) (not mapNonEmpty!51067) (not b!1271744) (not b!1271743) tp_is_empty!32991)
(check-sat)
