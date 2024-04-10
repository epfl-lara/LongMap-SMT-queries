; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107128 () Bool)

(assert start!107128)

(declare-fun b_free!27633 () Bool)

(declare-fun b_next!27633 () Bool)

(assert (=> start!107128 (= b_free!27633 (not b_next!27633))))

(declare-fun tp!97125 () Bool)

(declare-fun b_and!45665 () Bool)

(assert (=> start!107128 (= tp!97125 b_and!45665)))

(declare-fun b!1270131 () Bool)

(declare-fun res!845237 () Bool)

(declare-fun e!723960 () Bool)

(assert (=> b!1270131 (=> (not res!845237) (not e!723960))))

(declare-datatypes ((array!82896 0))(
  ( (array!82897 (arr!39985 (Array (_ BitVec 32) (_ BitVec 64))) (size!40521 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82896)

(declare-datatypes ((List!28470 0))(
  ( (Nil!28467) (Cons!28466 (h!29675 (_ BitVec 64)) (t!41999 List!28470)) )
))
(declare-fun arrayNoDuplicates!0 (array!82896 (_ BitVec 32) List!28470) Bool)

(assert (=> b!1270131 (= res!845237 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28467))))

(declare-fun mapIsEmpty!50806 () Bool)

(declare-fun mapRes!50806 () Bool)

(assert (=> mapIsEmpty!50806 mapRes!50806))

(declare-fun b!1270132 () Bool)

(declare-fun e!723961 () Bool)

(declare-fun tp_is_empty!32817 () Bool)

(assert (=> b!1270132 (= e!723961 tp_is_empty!32817)))

(declare-fun b!1270133 () Bool)

(assert (=> b!1270133 (= e!723960 (not true))))

(declare-datatypes ((V!48949 0))(
  ( (V!48950 (val!16483 Int)) )
))
(declare-datatypes ((ValueCell!15555 0))(
  ( (ValueCellFull!15555 (v!19120 V!48949)) (EmptyCell!15555) )
))
(declare-datatypes ((array!82898 0))(
  ( (array!82899 (arr!39986 (Array (_ BitVec 32) ValueCell!15555)) (size!40522 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82898)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48949)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48949)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48949)

(declare-fun zeroValueBefore!52 () V!48949)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21354 0))(
  ( (tuple2!21355 (_1!10688 (_ BitVec 64)) (_2!10688 V!48949)) )
))
(declare-datatypes ((List!28471 0))(
  ( (Nil!28468) (Cons!28467 (h!29676 tuple2!21354) (t!42000 List!28471)) )
))
(declare-datatypes ((ListLongMap!19083 0))(
  ( (ListLongMap!19084 (toList!9557 List!28471)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5889 (array!82896 array!82898 (_ BitVec 32) (_ BitVec 32) V!48949 V!48949 (_ BitVec 32) Int) ListLongMap!19083)

(assert (=> b!1270133 (= (getCurrentListMapNoExtraKeys!5889 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5889 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42300 0))(
  ( (Unit!42301) )
))
(declare-fun lt!574662 () Unit!42300)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1231 (array!82896 array!82898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48949 V!48949 V!48949 V!48949 (_ BitVec 32) Int) Unit!42300)

(assert (=> b!1270133 (= lt!574662 (lemmaNoChangeToArrayThenSameMapNoExtras!1231 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270134 () Bool)

(declare-fun res!845238 () Bool)

(assert (=> b!1270134 (=> (not res!845238) (not e!723960))))

(assert (=> b!1270134 (= res!845238 (and (= (size!40522 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40521 _keys!1364) (size!40522 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270135 () Bool)

(declare-fun e!723962 () Bool)

(declare-fun e!723963 () Bool)

(assert (=> b!1270135 (= e!723962 (and e!723963 mapRes!50806))))

(declare-fun condMapEmpty!50806 () Bool)

(declare-fun mapDefault!50806 () ValueCell!15555)

(assert (=> b!1270135 (= condMapEmpty!50806 (= (arr!39986 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15555)) mapDefault!50806)))))

(declare-fun b!1270136 () Bool)

(declare-fun res!845239 () Bool)

(assert (=> b!1270136 (=> (not res!845239) (not e!723960))))

(assert (=> b!1270136 (= res!845239 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40521 _keys!1364)) (bvslt from!1698 (size!40521 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270137 () Bool)

(declare-fun res!845236 () Bool)

(assert (=> b!1270137 (=> (not res!845236) (not e!723960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82896 (_ BitVec 32)) Bool)

(assert (=> b!1270137 (= res!845236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50806 () Bool)

(declare-fun tp!97126 () Bool)

(assert (=> mapNonEmpty!50806 (= mapRes!50806 (and tp!97126 e!723961))))

(declare-fun mapRest!50806 () (Array (_ BitVec 32) ValueCell!15555))

(declare-fun mapValue!50806 () ValueCell!15555)

(declare-fun mapKey!50806 () (_ BitVec 32))

(assert (=> mapNonEmpty!50806 (= (arr!39986 _values!1134) (store mapRest!50806 mapKey!50806 mapValue!50806))))

(declare-fun res!845240 () Bool)

(assert (=> start!107128 (=> (not res!845240) (not e!723960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107128 (= res!845240 (validMask!0 mask!1730))))

(assert (=> start!107128 e!723960))

(declare-fun array_inv!30415 (array!82898) Bool)

(assert (=> start!107128 (and (array_inv!30415 _values!1134) e!723962)))

(assert (=> start!107128 true))

(declare-fun array_inv!30416 (array!82896) Bool)

(assert (=> start!107128 (array_inv!30416 _keys!1364)))

(assert (=> start!107128 tp_is_empty!32817))

(assert (=> start!107128 tp!97125))

(declare-fun b!1270138 () Bool)

(assert (=> b!1270138 (= e!723963 tp_is_empty!32817)))

(assert (= (and start!107128 res!845240) b!1270134))

(assert (= (and b!1270134 res!845238) b!1270137))

(assert (= (and b!1270137 res!845236) b!1270131))

(assert (= (and b!1270131 res!845237) b!1270136))

(assert (= (and b!1270136 res!845239) b!1270133))

(assert (= (and b!1270135 condMapEmpty!50806) mapIsEmpty!50806))

(assert (= (and b!1270135 (not condMapEmpty!50806)) mapNonEmpty!50806))

(get-info :version)

(assert (= (and mapNonEmpty!50806 ((_ is ValueCellFull!15555) mapValue!50806)) b!1270132))

(assert (= (and b!1270135 ((_ is ValueCellFull!15555) mapDefault!50806)) b!1270138))

(assert (= start!107128 b!1270135))

(declare-fun m!1168499 () Bool)

(assert (=> mapNonEmpty!50806 m!1168499))

(declare-fun m!1168501 () Bool)

(assert (=> b!1270131 m!1168501))

(declare-fun m!1168503 () Bool)

(assert (=> start!107128 m!1168503))

(declare-fun m!1168505 () Bool)

(assert (=> start!107128 m!1168505))

(declare-fun m!1168507 () Bool)

(assert (=> start!107128 m!1168507))

(declare-fun m!1168509 () Bool)

(assert (=> b!1270133 m!1168509))

(declare-fun m!1168511 () Bool)

(assert (=> b!1270133 m!1168511))

(declare-fun m!1168513 () Bool)

(assert (=> b!1270133 m!1168513))

(declare-fun m!1168515 () Bool)

(assert (=> b!1270137 m!1168515))

(check-sat (not b!1270133) (not b!1270131) (not b!1270137) (not b_next!27633) (not start!107128) b_and!45665 (not mapNonEmpty!50806) tp_is_empty!32817)
(check-sat b_and!45665 (not b_next!27633))
