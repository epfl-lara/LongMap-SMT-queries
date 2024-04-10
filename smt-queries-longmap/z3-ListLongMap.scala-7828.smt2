; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97714 () Bool)

(assert start!97714)

(declare-fun b!1117161 () Bool)

(declare-fun res!745997 () Bool)

(declare-fun e!636425 () Bool)

(assert (=> b!1117161 (=> (not res!745997) (not e!636425))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117161 (= res!745997 (validKeyInArray!0 k0!934))))

(declare-fun b!1117162 () Bool)

(declare-fun e!636429 () Bool)

(declare-fun e!636424 () Bool)

(declare-fun mapRes!43735 () Bool)

(assert (=> b!1117162 (= e!636429 (and e!636424 mapRes!43735))))

(declare-fun condMapEmpty!43735 () Bool)

(declare-datatypes ((V!42387 0))(
  ( (V!42388 (val!14029 Int)) )
))
(declare-datatypes ((ValueCell!13263 0))(
  ( (ValueCellFull!13263 (v!16662 V!42387)) (EmptyCell!13263) )
))
(declare-datatypes ((array!72787 0))(
  ( (array!72788 (arr!35046 (Array (_ BitVec 32) ValueCell!13263)) (size!35582 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72787)

(declare-fun mapDefault!43735 () ValueCell!13263)

(assert (=> b!1117162 (= condMapEmpty!43735 (= (arr!35046 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13263)) mapDefault!43735)))))

(declare-fun b!1117163 () Bool)

(declare-fun res!745993 () Bool)

(assert (=> b!1117163 (=> (not res!745993) (not e!636425))))

(declare-datatypes ((array!72789 0))(
  ( (array!72790 (arr!35047 (Array (_ BitVec 32) (_ BitVec 64))) (size!35583 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72789)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72789 (_ BitVec 32)) Bool)

(assert (=> b!1117163 (= res!745993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!746000 () Bool)

(assert (=> start!97714 (=> (not res!746000) (not e!636425))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97714 (= res!746000 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35583 _keys!1208))))))

(assert (=> start!97714 e!636425))

(declare-fun array_inv!26932 (array!72789) Bool)

(assert (=> start!97714 (array_inv!26932 _keys!1208)))

(assert (=> start!97714 true))

(declare-fun array_inv!26933 (array!72787) Bool)

(assert (=> start!97714 (and (array_inv!26933 _values!996) e!636429)))

(declare-fun b!1117164 () Bool)

(declare-fun e!636427 () Bool)

(assert (=> b!1117164 (= e!636427 (not true))))

(declare-fun arrayContainsKey!0 (array!72789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117164 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36662 0))(
  ( (Unit!36663) )
))
(declare-fun lt!497245 () Unit!36662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72789 (_ BitVec 64) (_ BitVec 32)) Unit!36662)

(assert (=> b!1117164 (= lt!497245 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117165 () Bool)

(declare-fun res!745999 () Bool)

(assert (=> b!1117165 (=> (not res!745999) (not e!636425))))

(assert (=> b!1117165 (= res!745999 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35583 _keys!1208))))))

(declare-fun b!1117166 () Bool)

(declare-fun res!746001 () Bool)

(assert (=> b!1117166 (=> (not res!746001) (not e!636425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117166 (= res!746001 (validMask!0 mask!1564))))

(declare-fun b!1117167 () Bool)

(declare-fun res!746002 () Bool)

(assert (=> b!1117167 (=> (not res!746002) (not e!636427))))

(declare-fun lt!497246 () array!72789)

(declare-datatypes ((List!24382 0))(
  ( (Nil!24379) (Cons!24378 (h!25587 (_ BitVec 64)) (t!34863 List!24382)) )
))
(declare-fun arrayNoDuplicates!0 (array!72789 (_ BitVec 32) List!24382) Bool)

(assert (=> b!1117167 (= res!746002 (arrayNoDuplicates!0 lt!497246 #b00000000000000000000000000000000 Nil!24379))))

(declare-fun b!1117168 () Bool)

(declare-fun res!745995 () Bool)

(assert (=> b!1117168 (=> (not res!745995) (not e!636425))))

(assert (=> b!1117168 (= res!745995 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24379))))

(declare-fun mapIsEmpty!43735 () Bool)

(assert (=> mapIsEmpty!43735 mapRes!43735))

(declare-fun mapNonEmpty!43735 () Bool)

(declare-fun tp!82979 () Bool)

(declare-fun e!636426 () Bool)

(assert (=> mapNonEmpty!43735 (= mapRes!43735 (and tp!82979 e!636426))))

(declare-fun mapKey!43735 () (_ BitVec 32))

(declare-fun mapRest!43735 () (Array (_ BitVec 32) ValueCell!13263))

(declare-fun mapValue!43735 () ValueCell!13263)

(assert (=> mapNonEmpty!43735 (= (arr!35046 _values!996) (store mapRest!43735 mapKey!43735 mapValue!43735))))

(declare-fun b!1117169 () Bool)

(declare-fun tp_is_empty!27945 () Bool)

(assert (=> b!1117169 (= e!636424 tp_is_empty!27945)))

(declare-fun b!1117170 () Bool)

(declare-fun res!745994 () Bool)

(assert (=> b!1117170 (=> (not res!745994) (not e!636425))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117170 (= res!745994 (and (= (size!35582 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35583 _keys!1208) (size!35582 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117171 () Bool)

(declare-fun res!745998 () Bool)

(assert (=> b!1117171 (=> (not res!745998) (not e!636425))))

(assert (=> b!1117171 (= res!745998 (= (select (arr!35047 _keys!1208) i!673) k0!934))))

(declare-fun b!1117172 () Bool)

(assert (=> b!1117172 (= e!636426 tp_is_empty!27945)))

(declare-fun b!1117173 () Bool)

(assert (=> b!1117173 (= e!636425 e!636427)))

(declare-fun res!745996 () Bool)

(assert (=> b!1117173 (=> (not res!745996) (not e!636427))))

(assert (=> b!1117173 (= res!745996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497246 mask!1564))))

(assert (=> b!1117173 (= lt!497246 (array!72790 (store (arr!35047 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35583 _keys!1208)))))

(assert (= (and start!97714 res!746000) b!1117166))

(assert (= (and b!1117166 res!746001) b!1117170))

(assert (= (and b!1117170 res!745994) b!1117163))

(assert (= (and b!1117163 res!745993) b!1117168))

(assert (= (and b!1117168 res!745995) b!1117165))

(assert (= (and b!1117165 res!745999) b!1117161))

(assert (= (and b!1117161 res!745997) b!1117171))

(assert (= (and b!1117171 res!745998) b!1117173))

(assert (= (and b!1117173 res!745996) b!1117167))

(assert (= (and b!1117167 res!746002) b!1117164))

(assert (= (and b!1117162 condMapEmpty!43735) mapIsEmpty!43735))

(assert (= (and b!1117162 (not condMapEmpty!43735)) mapNonEmpty!43735))

(get-info :version)

(assert (= (and mapNonEmpty!43735 ((_ is ValueCellFull!13263) mapValue!43735)) b!1117172))

(assert (= (and b!1117162 ((_ is ValueCellFull!13263) mapDefault!43735)) b!1117169))

(assert (= start!97714 b!1117162))

(declare-fun m!1033129 () Bool)

(assert (=> b!1117168 m!1033129))

(declare-fun m!1033131 () Bool)

(assert (=> mapNonEmpty!43735 m!1033131))

(declare-fun m!1033133 () Bool)

(assert (=> b!1117166 m!1033133))

(declare-fun m!1033135 () Bool)

(assert (=> b!1117163 m!1033135))

(declare-fun m!1033137 () Bool)

(assert (=> start!97714 m!1033137))

(declare-fun m!1033139 () Bool)

(assert (=> start!97714 m!1033139))

(declare-fun m!1033141 () Bool)

(assert (=> b!1117171 m!1033141))

(declare-fun m!1033143 () Bool)

(assert (=> b!1117161 m!1033143))

(declare-fun m!1033145 () Bool)

(assert (=> b!1117173 m!1033145))

(declare-fun m!1033147 () Bool)

(assert (=> b!1117173 m!1033147))

(declare-fun m!1033149 () Bool)

(assert (=> b!1117167 m!1033149))

(declare-fun m!1033151 () Bool)

(assert (=> b!1117164 m!1033151))

(declare-fun m!1033153 () Bool)

(assert (=> b!1117164 m!1033153))

(check-sat (not b!1117173) (not mapNonEmpty!43735) (not b!1117167) tp_is_empty!27945 (not b!1117168) (not b!1117163) (not b!1117164) (not start!97714) (not b!1117161) (not b!1117166))
(check-sat)
