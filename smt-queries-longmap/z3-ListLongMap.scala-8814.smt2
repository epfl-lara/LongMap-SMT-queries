; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107332 () Bool)

(assert start!107332)

(declare-fun b_free!27613 () Bool)

(declare-fun b_next!27613 () Bool)

(assert (=> start!107332 (= b_free!27613 (not b_next!27613))))

(declare-fun tp!97066 () Bool)

(declare-fun b_and!45647 () Bool)

(assert (=> start!107332 (= tp!97066 b_and!45647)))

(declare-fun b!1271196 () Bool)

(declare-fun e!724658 () Bool)

(declare-fun tp_is_empty!32797 () Bool)

(assert (=> b!1271196 (= e!724658 tp_is_empty!32797)))

(declare-fun b!1271197 () Bool)

(declare-fun res!845606 () Bool)

(declare-fun e!724657 () Bool)

(assert (=> b!1271197 (=> (not res!845606) (not e!724657))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82891 0))(
  ( (array!82892 (arr!39978 (Array (_ BitVec 32) (_ BitVec 64))) (size!40515 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82891)

(assert (=> b!1271197 (= res!845606 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40515 _keys!1364)) (bvslt from!1698 (size!40515 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271198 () Bool)

(declare-fun res!845610 () Bool)

(assert (=> b!1271198 (=> (not res!845610) (not e!724657))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82891 (_ BitVec 32)) Bool)

(assert (=> b!1271198 (= res!845610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271199 () Bool)

(assert (=> b!1271199 (= e!724657 (not true))))

(declare-datatypes ((V!48923 0))(
  ( (V!48924 (val!16473 Int)) )
))
(declare-datatypes ((ValueCell!15545 0))(
  ( (ValueCellFull!15545 (v!19105 V!48923)) (EmptyCell!15545) )
))
(declare-datatypes ((array!82893 0))(
  ( (array!82894 (arr!39979 (Array (_ BitVec 32) ValueCell!15545)) (size!40516 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82893)

(declare-fun minValueAfter!52 () V!48923)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48923)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48923)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun zeroValueBefore!52 () V!48923)

(declare-datatypes ((tuple2!21344 0))(
  ( (tuple2!21345 (_1!10683 (_ BitVec 64)) (_2!10683 V!48923)) )
))
(declare-datatypes ((List!28489 0))(
  ( (Nil!28486) (Cons!28485 (h!29703 tuple2!21344) (t!42010 List!28489)) )
))
(declare-datatypes ((ListLongMap!19081 0))(
  ( (ListLongMap!19082 (toList!9556 List!28489)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5928 (array!82891 array!82893 (_ BitVec 32) (_ BitVec 32) V!48923 V!48923 (_ BitVec 32) Int) ListLongMap!19081)

(assert (=> b!1271199 (= (getCurrentListMapNoExtraKeys!5928 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5928 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42253 0))(
  ( (Unit!42254) )
))
(declare-fun lt!575116 () Unit!42253)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1218 (array!82891 array!82893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48923 V!48923 V!48923 V!48923 (_ BitVec 32) Int) Unit!42253)

(assert (=> b!1271199 (= lt!575116 (lemmaNoChangeToArrayThenSameMapNoExtras!1218 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1271200 () Bool)

(declare-fun res!845607 () Bool)

(assert (=> b!1271200 (=> (not res!845607) (not e!724657))))

(assert (=> b!1271200 (= res!845607 (and (= (size!40516 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40515 _keys!1364) (size!40516 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50776 () Bool)

(declare-fun mapRes!50776 () Bool)

(declare-fun tp!97065 () Bool)

(assert (=> mapNonEmpty!50776 (= mapRes!50776 (and tp!97065 e!724658))))

(declare-fun mapRest!50776 () (Array (_ BitVec 32) ValueCell!15545))

(declare-fun mapKey!50776 () (_ BitVec 32))

(declare-fun mapValue!50776 () ValueCell!15545)

(assert (=> mapNonEmpty!50776 (= (arr!39979 _values!1134) (store mapRest!50776 mapKey!50776 mapValue!50776))))

(declare-fun b!1271201 () Bool)

(declare-fun e!724660 () Bool)

(declare-fun e!724656 () Bool)

(assert (=> b!1271201 (= e!724660 (and e!724656 mapRes!50776))))

(declare-fun condMapEmpty!50776 () Bool)

(declare-fun mapDefault!50776 () ValueCell!15545)

(assert (=> b!1271201 (= condMapEmpty!50776 (= (arr!39979 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15545)) mapDefault!50776)))))

(declare-fun b!1271203 () Bool)

(declare-fun res!845609 () Bool)

(assert (=> b!1271203 (=> (not res!845609) (not e!724657))))

(declare-datatypes ((List!28490 0))(
  ( (Nil!28487) (Cons!28486 (h!29704 (_ BitVec 64)) (t!42011 List!28490)) )
))
(declare-fun arrayNoDuplicates!0 (array!82891 (_ BitVec 32) List!28490) Bool)

(assert (=> b!1271203 (= res!845609 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28487))))

(declare-fun mapIsEmpty!50776 () Bool)

(assert (=> mapIsEmpty!50776 mapRes!50776))

(declare-fun b!1271202 () Bool)

(assert (=> b!1271202 (= e!724656 tp_is_empty!32797)))

(declare-fun res!845608 () Bool)

(assert (=> start!107332 (=> (not res!845608) (not e!724657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107332 (= res!845608 (validMask!0 mask!1730))))

(assert (=> start!107332 e!724657))

(declare-fun array_inv!30585 (array!82893) Bool)

(assert (=> start!107332 (and (array_inv!30585 _values!1134) e!724660)))

(assert (=> start!107332 true))

(declare-fun array_inv!30586 (array!82891) Bool)

(assert (=> start!107332 (array_inv!30586 _keys!1364)))

(assert (=> start!107332 tp_is_empty!32797))

(assert (=> start!107332 tp!97066))

(assert (= (and start!107332 res!845608) b!1271200))

(assert (= (and b!1271200 res!845607) b!1271198))

(assert (= (and b!1271198 res!845610) b!1271203))

(assert (= (and b!1271203 res!845609) b!1271197))

(assert (= (and b!1271197 res!845606) b!1271199))

(assert (= (and b!1271201 condMapEmpty!50776) mapIsEmpty!50776))

(assert (= (and b!1271201 (not condMapEmpty!50776)) mapNonEmpty!50776))

(get-info :version)

(assert (= (and mapNonEmpty!50776 ((_ is ValueCellFull!15545) mapValue!50776)) b!1271196))

(assert (= (and b!1271201 ((_ is ValueCellFull!15545) mapDefault!50776)) b!1271202))

(assert (= start!107332 b!1271201))

(declare-fun m!1169931 () Bool)

(assert (=> mapNonEmpty!50776 m!1169931))

(declare-fun m!1169933 () Bool)

(assert (=> b!1271199 m!1169933))

(declare-fun m!1169935 () Bool)

(assert (=> b!1271199 m!1169935))

(declare-fun m!1169937 () Bool)

(assert (=> b!1271199 m!1169937))

(declare-fun m!1169939 () Bool)

(assert (=> b!1271203 m!1169939))

(declare-fun m!1169941 () Bool)

(assert (=> b!1271198 m!1169941))

(declare-fun m!1169943 () Bool)

(assert (=> start!107332 m!1169943))

(declare-fun m!1169945 () Bool)

(assert (=> start!107332 m!1169945))

(declare-fun m!1169947 () Bool)

(assert (=> start!107332 m!1169947))

(check-sat b_and!45647 (not b!1271199) (not mapNonEmpty!50776) (not b!1271198) (not start!107332) tp_is_empty!32797 (not b_next!27613) (not b!1271203))
(check-sat b_and!45647 (not b_next!27613))
