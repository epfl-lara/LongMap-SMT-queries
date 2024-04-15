; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105858 () Bool)

(assert start!105858)

(declare-fun b_free!27403 () Bool)

(declare-fun b_next!27403 () Bool)

(assert (=> start!105858 (= b_free!27403 (not b_next!27403))))

(declare-fun tp!95741 () Bool)

(declare-fun b_and!45293 () Bool)

(assert (=> start!105858 (= tp!95741 b_and!45293)))

(declare-fun b!1260897 () Bool)

(declare-fun e!717574 () Bool)

(assert (=> b!1260897 (= e!717574 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((V!48439 0))(
  ( (V!48440 (val!16215 Int)) )
))
(declare-fun minValueAfter!43 () V!48439)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48439)

(declare-datatypes ((array!82153 0))(
  ( (array!82154 (arr!39630 (Array (_ BitVec 32) (_ BitVec 64))) (size!40168 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82153)

(declare-datatypes ((ValueCell!15389 0))(
  ( (ValueCellFull!15389 (v!18918 V!48439)) (EmptyCell!15389) )
))
(declare-datatypes ((array!82155 0))(
  ( (array!82156 (arr!39631 (Array (_ BitVec 32) ValueCell!15389)) (size!40169 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82155)

(declare-datatypes ((tuple2!21056 0))(
  ( (tuple2!21057 (_1!10539 (_ BitVec 64)) (_2!10539 V!48439)) )
))
(declare-datatypes ((List!28256 0))(
  ( (Nil!28253) (Cons!28252 (h!29461 tuple2!21056) (t!41746 List!28256)) )
))
(declare-datatypes ((ListLongMap!18929 0))(
  ( (ListLongMap!18930 (toList!9480 List!28256)) )
))
(declare-fun lt!571317 () ListLongMap!18929)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5849 (array!82153 array!82155 (_ BitVec 32) (_ BitVec 32) V!48439 V!48439 (_ BitVec 32) Int) ListLongMap!18929)

(assert (=> b!1260897 (= lt!571317 (getCurrentListMapNoExtraKeys!5849 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571318 () ListLongMap!18929)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48439)

(assert (=> b!1260897 (= lt!571318 (getCurrentListMapNoExtraKeys!5849 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50260 () Bool)

(declare-fun mapRes!50260 () Bool)

(declare-fun tp!95740 () Bool)

(declare-fun e!717572 () Bool)

(assert (=> mapNonEmpty!50260 (= mapRes!50260 (and tp!95740 e!717572))))

(declare-fun mapRest!50260 () (Array (_ BitVec 32) ValueCell!15389))

(declare-fun mapValue!50260 () ValueCell!15389)

(declare-fun mapKey!50260 () (_ BitVec 32))

(assert (=> mapNonEmpty!50260 (= (arr!39631 _values!914) (store mapRest!50260 mapKey!50260 mapValue!50260))))

(declare-fun b!1260898 () Bool)

(declare-fun e!717575 () Bool)

(declare-fun e!717571 () Bool)

(assert (=> b!1260898 (= e!717575 (and e!717571 mapRes!50260))))

(declare-fun condMapEmpty!50260 () Bool)

(declare-fun mapDefault!50260 () ValueCell!15389)

(assert (=> b!1260898 (= condMapEmpty!50260 (= (arr!39631 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15389)) mapDefault!50260)))))

(declare-fun b!1260899 () Bool)

(declare-fun tp_is_empty!32305 () Bool)

(assert (=> b!1260899 (= e!717572 tp_is_empty!32305)))

(declare-fun b!1260900 () Bool)

(declare-fun res!840273 () Bool)

(assert (=> b!1260900 (=> (not res!840273) (not e!717574))))

(declare-datatypes ((List!28257 0))(
  ( (Nil!28254) (Cons!28253 (h!29462 (_ BitVec 64)) (t!41747 List!28257)) )
))
(declare-fun arrayNoDuplicates!0 (array!82153 (_ BitVec 32) List!28257) Bool)

(assert (=> b!1260900 (= res!840273 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28254))))

(declare-fun b!1260901 () Bool)

(declare-fun res!840270 () Bool)

(assert (=> b!1260901 (=> (not res!840270) (not e!717574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82153 (_ BitVec 32)) Bool)

(assert (=> b!1260901 (= res!840270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260902 () Bool)

(assert (=> b!1260902 (= e!717571 tp_is_empty!32305)))

(declare-fun b!1260903 () Bool)

(declare-fun res!840272 () Bool)

(assert (=> b!1260903 (=> (not res!840272) (not e!717574))))

(assert (=> b!1260903 (= res!840272 (and (= (size!40169 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40168 _keys!1118) (size!40169 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!840271 () Bool)

(assert (=> start!105858 (=> (not res!840271) (not e!717574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105858 (= res!840271 (validMask!0 mask!1466))))

(assert (=> start!105858 e!717574))

(assert (=> start!105858 true))

(assert (=> start!105858 tp!95741))

(assert (=> start!105858 tp_is_empty!32305))

(declare-fun array_inv!30319 (array!82153) Bool)

(assert (=> start!105858 (array_inv!30319 _keys!1118)))

(declare-fun array_inv!30320 (array!82155) Bool)

(assert (=> start!105858 (and (array_inv!30320 _values!914) e!717575)))

(declare-fun mapIsEmpty!50260 () Bool)

(assert (=> mapIsEmpty!50260 mapRes!50260))

(assert (= (and start!105858 res!840271) b!1260903))

(assert (= (and b!1260903 res!840272) b!1260901))

(assert (= (and b!1260901 res!840270) b!1260900))

(assert (= (and b!1260900 res!840273) b!1260897))

(assert (= (and b!1260898 condMapEmpty!50260) mapIsEmpty!50260))

(assert (= (and b!1260898 (not condMapEmpty!50260)) mapNonEmpty!50260))

(get-info :version)

(assert (= (and mapNonEmpty!50260 ((_ is ValueCellFull!15389) mapValue!50260)) b!1260899))

(assert (= (and b!1260898 ((_ is ValueCellFull!15389) mapDefault!50260)) b!1260902))

(assert (= start!105858 b!1260898))

(declare-fun m!1161193 () Bool)

(assert (=> b!1260900 m!1161193))

(declare-fun m!1161195 () Bool)

(assert (=> b!1260901 m!1161195))

(declare-fun m!1161197 () Bool)

(assert (=> b!1260897 m!1161197))

(declare-fun m!1161199 () Bool)

(assert (=> b!1260897 m!1161199))

(declare-fun m!1161201 () Bool)

(assert (=> start!105858 m!1161201))

(declare-fun m!1161203 () Bool)

(assert (=> start!105858 m!1161203))

(declare-fun m!1161205 () Bool)

(assert (=> start!105858 m!1161205))

(declare-fun m!1161207 () Bool)

(assert (=> mapNonEmpty!50260 m!1161207))

(check-sat (not mapNonEmpty!50260) tp_is_empty!32305 (not b_next!27403) (not b!1260901) b_and!45293 (not b!1260897) (not b!1260900) (not start!105858))
(check-sat b_and!45293 (not b_next!27403))
