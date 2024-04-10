; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107254 () Bool)

(assert start!107254)

(declare-fun mapIsEmpty!50995 () Bool)

(declare-fun mapRes!50995 () Bool)

(assert (=> mapIsEmpty!50995 mapRes!50995))

(declare-fun mapNonEmpty!50995 () Bool)

(declare-fun tp!97336 () Bool)

(declare-fun e!724904 () Bool)

(assert (=> mapNonEmpty!50995 (= mapRes!50995 (and tp!97336 e!724904))))

(declare-datatypes ((V!49117 0))(
  ( (V!49118 (val!16546 Int)) )
))
(declare-datatypes ((ValueCell!15618 0))(
  ( (ValueCellFull!15618 (v!19183 V!49117)) (EmptyCell!15618) )
))
(declare-datatypes ((array!83136 0))(
  ( (array!83137 (arr!40105 (Array (_ BitVec 32) ValueCell!15618)) (size!40641 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83136)

(declare-fun mapValue!50995 () ValueCell!15618)

(declare-fun mapKey!50995 () (_ BitVec 32))

(declare-fun mapRest!50995 () (Array (_ BitVec 32) ValueCell!15618))

(assert (=> mapNonEmpty!50995 (= (arr!40105 _values!1134) (store mapRest!50995 mapKey!50995 mapValue!50995))))

(declare-fun b!1271309 () Bool)

(declare-fun e!724905 () Bool)

(declare-fun e!724906 () Bool)

(assert (=> b!1271309 (= e!724905 (and e!724906 mapRes!50995))))

(declare-fun condMapEmpty!50995 () Bool)

(declare-fun mapDefault!50995 () ValueCell!15618)

(assert (=> b!1271309 (= condMapEmpty!50995 (= (arr!40105 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15618)) mapDefault!50995)))))

(declare-fun b!1271310 () Bool)

(declare-fun res!845848 () Bool)

(declare-fun e!724907 () Bool)

(assert (=> b!1271310 (=> (not res!845848) (not e!724907))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83138 0))(
  ( (array!83139 (arr!40106 (Array (_ BitVec 32) (_ BitVec 64))) (size!40642 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83138)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271310 (= res!845848 (and (= (size!40641 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40642 _keys!1364) (size!40641 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271311 () Bool)

(declare-fun tp_is_empty!32943 () Bool)

(assert (=> b!1271311 (= e!724906 tp_is_empty!32943)))

(declare-fun b!1271313 () Bool)

(assert (=> b!1271313 (= e!724907 false)))

(declare-fun lt!574851 () Bool)

(declare-datatypes ((List!28518 0))(
  ( (Nil!28515) (Cons!28514 (h!29723 (_ BitVec 64)) (t!42047 List!28518)) )
))
(declare-fun arrayNoDuplicates!0 (array!83138 (_ BitVec 32) List!28518) Bool)

(assert (=> b!1271313 (= lt!574851 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28515))))

(declare-fun b!1271314 () Bool)

(declare-fun res!845849 () Bool)

(assert (=> b!1271314 (=> (not res!845849) (not e!724907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83138 (_ BitVec 32)) Bool)

(assert (=> b!1271314 (= res!845849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271312 () Bool)

(assert (=> b!1271312 (= e!724904 tp_is_empty!32943)))

(declare-fun res!845847 () Bool)

(assert (=> start!107254 (=> (not res!845847) (not e!724907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107254 (= res!845847 (validMask!0 mask!1730))))

(assert (=> start!107254 e!724907))

(declare-fun array_inv!30503 (array!83136) Bool)

(assert (=> start!107254 (and (array_inv!30503 _values!1134) e!724905)))

(assert (=> start!107254 true))

(declare-fun array_inv!30504 (array!83138) Bool)

(assert (=> start!107254 (array_inv!30504 _keys!1364)))

(assert (= (and start!107254 res!845847) b!1271310))

(assert (= (and b!1271310 res!845848) b!1271314))

(assert (= (and b!1271314 res!845849) b!1271313))

(assert (= (and b!1271309 condMapEmpty!50995) mapIsEmpty!50995))

(assert (= (and b!1271309 (not condMapEmpty!50995)) mapNonEmpty!50995))

(get-info :version)

(assert (= (and mapNonEmpty!50995 ((_ is ValueCellFull!15618) mapValue!50995)) b!1271312))

(assert (= (and b!1271309 ((_ is ValueCellFull!15618) mapDefault!50995)) b!1271311))

(assert (= start!107254 b!1271309))

(declare-fun m!1169303 () Bool)

(assert (=> mapNonEmpty!50995 m!1169303))

(declare-fun m!1169305 () Bool)

(assert (=> b!1271313 m!1169305))

(declare-fun m!1169307 () Bool)

(assert (=> b!1271314 m!1169307))

(declare-fun m!1169309 () Bool)

(assert (=> start!107254 m!1169309))

(declare-fun m!1169311 () Bool)

(assert (=> start!107254 m!1169311))

(declare-fun m!1169313 () Bool)

(assert (=> start!107254 m!1169313))

(check-sat (not start!107254) (not mapNonEmpty!50995) (not b!1271313) (not b!1271314) tp_is_empty!32943)
(check-sat)
