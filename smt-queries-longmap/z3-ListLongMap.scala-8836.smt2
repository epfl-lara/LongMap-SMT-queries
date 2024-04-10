; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107242 () Bool)

(assert start!107242)

(declare-fun b!1271201 () Bool)

(declare-fun res!845795 () Bool)

(declare-fun e!724816 () Bool)

(assert (=> b!1271201 (=> (not res!845795) (not e!724816))))

(declare-datatypes ((array!83116 0))(
  ( (array!83117 (arr!40095 (Array (_ BitVec 32) (_ BitVec 64))) (size!40631 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83116)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83116 (_ BitVec 32)) Bool)

(assert (=> b!1271201 (= res!845795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271202 () Bool)

(declare-fun res!845793 () Bool)

(assert (=> b!1271202 (=> (not res!845793) (not e!724816))))

(declare-datatypes ((V!49101 0))(
  ( (V!49102 (val!16540 Int)) )
))
(declare-datatypes ((ValueCell!15612 0))(
  ( (ValueCellFull!15612 (v!19177 V!49101)) (EmptyCell!15612) )
))
(declare-datatypes ((array!83118 0))(
  ( (array!83119 (arr!40096 (Array (_ BitVec 32) ValueCell!15612)) (size!40632 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83118)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271202 (= res!845793 (and (= (size!40632 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40631 _keys!1364) (size!40632 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271203 () Bool)

(declare-fun e!724814 () Bool)

(declare-fun e!724818 () Bool)

(declare-fun mapRes!50977 () Bool)

(assert (=> b!1271203 (= e!724814 (and e!724818 mapRes!50977))))

(declare-fun condMapEmpty!50977 () Bool)

(declare-fun mapDefault!50977 () ValueCell!15612)

(assert (=> b!1271203 (= condMapEmpty!50977 (= (arr!40096 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15612)) mapDefault!50977)))))

(declare-fun b!1271204 () Bool)

(declare-fun tp_is_empty!32931 () Bool)

(assert (=> b!1271204 (= e!724818 tp_is_empty!32931)))

(declare-fun mapIsEmpty!50977 () Bool)

(assert (=> mapIsEmpty!50977 mapRes!50977))

(declare-fun b!1271205 () Bool)

(declare-fun e!724815 () Bool)

(assert (=> b!1271205 (= e!724815 tp_is_empty!32931)))

(declare-fun res!845794 () Bool)

(assert (=> start!107242 (=> (not res!845794) (not e!724816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107242 (= res!845794 (validMask!0 mask!1730))))

(assert (=> start!107242 e!724816))

(declare-fun array_inv!30495 (array!83118) Bool)

(assert (=> start!107242 (and (array_inv!30495 _values!1134) e!724814)))

(assert (=> start!107242 true))

(declare-fun array_inv!30496 (array!83116) Bool)

(assert (=> start!107242 (array_inv!30496 _keys!1364)))

(declare-fun b!1271206 () Bool)

(assert (=> b!1271206 (= e!724816 false)))

(declare-fun lt!574833 () Bool)

(declare-datatypes ((List!28515 0))(
  ( (Nil!28512) (Cons!28511 (h!29720 (_ BitVec 64)) (t!42044 List!28515)) )
))
(declare-fun arrayNoDuplicates!0 (array!83116 (_ BitVec 32) List!28515) Bool)

(assert (=> b!1271206 (= lt!574833 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28512))))

(declare-fun mapNonEmpty!50977 () Bool)

(declare-fun tp!97318 () Bool)

(assert (=> mapNonEmpty!50977 (= mapRes!50977 (and tp!97318 e!724815))))

(declare-fun mapValue!50977 () ValueCell!15612)

(declare-fun mapRest!50977 () (Array (_ BitVec 32) ValueCell!15612))

(declare-fun mapKey!50977 () (_ BitVec 32))

(assert (=> mapNonEmpty!50977 (= (arr!40096 _values!1134) (store mapRest!50977 mapKey!50977 mapValue!50977))))

(assert (= (and start!107242 res!845794) b!1271202))

(assert (= (and b!1271202 res!845793) b!1271201))

(assert (= (and b!1271201 res!845795) b!1271206))

(assert (= (and b!1271203 condMapEmpty!50977) mapIsEmpty!50977))

(assert (= (and b!1271203 (not condMapEmpty!50977)) mapNonEmpty!50977))

(get-info :version)

(assert (= (and mapNonEmpty!50977 ((_ is ValueCellFull!15612) mapValue!50977)) b!1271205))

(assert (= (and b!1271203 ((_ is ValueCellFull!15612) mapDefault!50977)) b!1271204))

(assert (= start!107242 b!1271203))

(declare-fun m!1169231 () Bool)

(assert (=> b!1271201 m!1169231))

(declare-fun m!1169233 () Bool)

(assert (=> start!107242 m!1169233))

(declare-fun m!1169235 () Bool)

(assert (=> start!107242 m!1169235))

(declare-fun m!1169237 () Bool)

(assert (=> start!107242 m!1169237))

(declare-fun m!1169239 () Bool)

(assert (=> b!1271206 m!1169239))

(declare-fun m!1169241 () Bool)

(assert (=> mapNonEmpty!50977 m!1169241))

(check-sat (not mapNonEmpty!50977) (not b!1271206) tp_is_empty!32931 (not b!1271201) (not start!107242))
(check-sat)
