; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107254 () Bool)

(assert start!107254)

(declare-fun mapIsEmpty!50659 () Bool)

(declare-fun mapRes!50659 () Bool)

(assert (=> mapIsEmpty!50659 mapRes!50659))

(declare-fun b!1270275 () Bool)

(declare-fun e!724074 () Bool)

(declare-fun tp_is_empty!32719 () Bool)

(assert (=> b!1270275 (= e!724074 tp_is_empty!32719)))

(declare-fun mapNonEmpty!50659 () Bool)

(declare-fun tp!96838 () Bool)

(assert (=> mapNonEmpty!50659 (= mapRes!50659 (and tp!96838 e!724074))))

(declare-datatypes ((V!48819 0))(
  ( (V!48820 (val!16434 Int)) )
))
(declare-datatypes ((ValueCell!15506 0))(
  ( (ValueCellFull!15506 (v!19066 V!48819)) (EmptyCell!15506) )
))
(declare-datatypes ((array!82743 0))(
  ( (array!82744 (arr!39904 (Array (_ BitVec 32) ValueCell!15506)) (size!40441 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82743)

(declare-fun mapKey!50659 () (_ BitVec 32))

(declare-fun mapValue!50659 () ValueCell!15506)

(declare-fun mapRest!50659 () (Array (_ BitVec 32) ValueCell!15506))

(assert (=> mapNonEmpty!50659 (= (arr!39904 _values!1134) (store mapRest!50659 mapKey!50659 mapValue!50659))))

(declare-fun b!1270276 () Bool)

(declare-fun e!724071 () Bool)

(assert (=> b!1270276 (= e!724071 tp_is_empty!32719)))

(declare-fun b!1270277 () Bool)

(declare-fun res!845036 () Bool)

(declare-fun e!724075 () Bool)

(assert (=> b!1270277 (=> (not res!845036) (not e!724075))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82745 0))(
  ( (array!82746 (arr!39905 (Array (_ BitVec 32) (_ BitVec 64))) (size!40442 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82745)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270277 (= res!845036 (and (= (size!40441 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40442 _keys!1364) (size!40441 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270278 () Bool)

(declare-fun res!845037 () Bool)

(assert (=> b!1270278 (=> (not res!845037) (not e!724075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82745 (_ BitVec 32)) Bool)

(assert (=> b!1270278 (= res!845037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270279 () Bool)

(declare-fun e!724072 () Bool)

(assert (=> b!1270279 (= e!724072 (and e!724071 mapRes!50659))))

(declare-fun condMapEmpty!50659 () Bool)

(declare-fun mapDefault!50659 () ValueCell!15506)

(assert (=> b!1270279 (= condMapEmpty!50659 (= (arr!39904 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15506)) mapDefault!50659)))))

(declare-fun b!1270274 () Bool)

(assert (=> b!1270274 (= e!724075 false)))

(declare-fun lt!574999 () Bool)

(declare-datatypes ((List!28437 0))(
  ( (Nil!28434) (Cons!28433 (h!29651 (_ BitVec 64)) (t!41958 List!28437)) )
))
(declare-fun arrayNoDuplicates!0 (array!82745 (_ BitVec 32) List!28437) Bool)

(assert (=> b!1270274 (= lt!574999 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28434))))

(declare-fun res!845035 () Bool)

(assert (=> start!107254 (=> (not res!845035) (not e!724075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107254 (= res!845035 (validMask!0 mask!1730))))

(assert (=> start!107254 e!724075))

(declare-fun array_inv!30529 (array!82743) Bool)

(assert (=> start!107254 (and (array_inv!30529 _values!1134) e!724072)))

(assert (=> start!107254 true))

(declare-fun array_inv!30530 (array!82745) Bool)

(assert (=> start!107254 (array_inv!30530 _keys!1364)))

(assert (= (and start!107254 res!845035) b!1270277))

(assert (= (and b!1270277 res!845036) b!1270278))

(assert (= (and b!1270278 res!845037) b!1270274))

(assert (= (and b!1270279 condMapEmpty!50659) mapIsEmpty!50659))

(assert (= (and b!1270279 (not condMapEmpty!50659)) mapNonEmpty!50659))

(get-info :version)

(assert (= (and mapNonEmpty!50659 ((_ is ValueCellFull!15506) mapValue!50659)) b!1270275))

(assert (= (and b!1270279 ((_ is ValueCellFull!15506) mapDefault!50659)) b!1270276))

(assert (= start!107254 b!1270279))

(declare-fun m!1169247 () Bool)

(assert (=> mapNonEmpty!50659 m!1169247))

(declare-fun m!1169249 () Bool)

(assert (=> b!1270278 m!1169249))

(declare-fun m!1169251 () Bool)

(assert (=> b!1270274 m!1169251))

(declare-fun m!1169253 () Bool)

(assert (=> start!107254 m!1169253))

(declare-fun m!1169255 () Bool)

(assert (=> start!107254 m!1169255))

(declare-fun m!1169257 () Bool)

(assert (=> start!107254 m!1169257))

(check-sat (not mapNonEmpty!50659) (not start!107254) (not b!1270274) (not b!1270278) tp_is_empty!32719)
(check-sat)
