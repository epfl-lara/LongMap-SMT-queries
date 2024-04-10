; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107314 () Bool)

(assert start!107314)

(declare-fun b!1271849 () Bool)

(declare-fun res!846119 () Bool)

(declare-fun e!725357 () Bool)

(assert (=> b!1271849 (=> (not res!846119) (not e!725357))))

(declare-datatypes ((V!49197 0))(
  ( (V!49198 (val!16576 Int)) )
))
(declare-datatypes ((ValueCell!15648 0))(
  ( (ValueCellFull!15648 (v!19213 V!49197)) (EmptyCell!15648) )
))
(declare-datatypes ((array!83254 0))(
  ( (array!83255 (arr!40164 (Array (_ BitVec 32) ValueCell!15648)) (size!40700 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83254)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((array!83256 0))(
  ( (array!83257 (arr!40165 (Array (_ BitVec 32) (_ BitVec 64))) (size!40701 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83256)

(assert (=> b!1271849 (= res!846119 (and (= (size!40700 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40701 _keys!1364) (size!40700 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271850 () Bool)

(assert (=> b!1271850 (= e!725357 false)))

(declare-fun lt!574941 () Bool)

(declare-datatypes ((List!28541 0))(
  ( (Nil!28538) (Cons!28537 (h!29746 (_ BitVec 64)) (t!42070 List!28541)) )
))
(declare-fun arrayNoDuplicates!0 (array!83256 (_ BitVec 32) List!28541) Bool)

(assert (=> b!1271850 (= lt!574941 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28538))))

(declare-fun b!1271851 () Bool)

(declare-fun e!725354 () Bool)

(declare-fun e!725355 () Bool)

(declare-fun mapRes!51085 () Bool)

(assert (=> b!1271851 (= e!725354 (and e!725355 mapRes!51085))))

(declare-fun condMapEmpty!51085 () Bool)

(declare-fun mapDefault!51085 () ValueCell!15648)

(assert (=> b!1271851 (= condMapEmpty!51085 (= (arr!40164 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15648)) mapDefault!51085)))))

(declare-fun b!1271852 () Bool)

(declare-fun tp_is_empty!33003 () Bool)

(assert (=> b!1271852 (= e!725355 tp_is_empty!33003)))

(declare-fun res!846118 () Bool)

(assert (=> start!107314 (=> (not res!846118) (not e!725357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107314 (= res!846118 (validMask!0 mask!1730))))

(assert (=> start!107314 e!725357))

(declare-fun array_inv!30551 (array!83254) Bool)

(assert (=> start!107314 (and (array_inv!30551 _values!1134) e!725354)))

(assert (=> start!107314 true))

(declare-fun array_inv!30552 (array!83256) Bool)

(assert (=> start!107314 (array_inv!30552 _keys!1364)))

(declare-fun mapIsEmpty!51085 () Bool)

(assert (=> mapIsEmpty!51085 mapRes!51085))

(declare-fun mapNonEmpty!51085 () Bool)

(declare-fun tp!97426 () Bool)

(declare-fun e!725358 () Bool)

(assert (=> mapNonEmpty!51085 (= mapRes!51085 (and tp!97426 e!725358))))

(declare-fun mapRest!51085 () (Array (_ BitVec 32) ValueCell!15648))

(declare-fun mapValue!51085 () ValueCell!15648)

(declare-fun mapKey!51085 () (_ BitVec 32))

(assert (=> mapNonEmpty!51085 (= (arr!40164 _values!1134) (store mapRest!51085 mapKey!51085 mapValue!51085))))

(declare-fun b!1271853 () Bool)

(assert (=> b!1271853 (= e!725358 tp_is_empty!33003)))

(declare-fun b!1271854 () Bool)

(declare-fun res!846117 () Bool)

(assert (=> b!1271854 (=> (not res!846117) (not e!725357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83256 (_ BitVec 32)) Bool)

(assert (=> b!1271854 (= res!846117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107314 res!846118) b!1271849))

(assert (= (and b!1271849 res!846119) b!1271854))

(assert (= (and b!1271854 res!846117) b!1271850))

(assert (= (and b!1271851 condMapEmpty!51085) mapIsEmpty!51085))

(assert (= (and b!1271851 (not condMapEmpty!51085)) mapNonEmpty!51085))

(get-info :version)

(assert (= (and mapNonEmpty!51085 ((_ is ValueCellFull!15648) mapValue!51085)) b!1271853))

(assert (= (and b!1271851 ((_ is ValueCellFull!15648) mapDefault!51085)) b!1271852))

(assert (= start!107314 b!1271851))

(declare-fun m!1169663 () Bool)

(assert (=> b!1271850 m!1169663))

(declare-fun m!1169665 () Bool)

(assert (=> start!107314 m!1169665))

(declare-fun m!1169667 () Bool)

(assert (=> start!107314 m!1169667))

(declare-fun m!1169669 () Bool)

(assert (=> start!107314 m!1169669))

(declare-fun m!1169671 () Bool)

(assert (=> mapNonEmpty!51085 m!1169671))

(declare-fun m!1169673 () Bool)

(assert (=> b!1271854 m!1169673))

(check-sat (not mapNonEmpty!51085) (not b!1271850) (not start!107314) (not b!1271854) tp_is_empty!33003)
(check-sat)
