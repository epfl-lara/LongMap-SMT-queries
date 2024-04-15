; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97214 () Bool)

(assert start!97214)

(declare-fun b!1106151 () Bool)

(declare-fun res!738195 () Bool)

(declare-fun e!631224 () Bool)

(assert (=> b!1106151 (=> (not res!738195) (not e!631224))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106151 (= res!738195 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!42994 () Bool)

(declare-fun mapRes!42994 () Bool)

(declare-fun tp!81914 () Bool)

(declare-fun e!631221 () Bool)

(assert (=> mapNonEmpty!42994 (= mapRes!42994 (and tp!81914 e!631221))))

(declare-datatypes ((V!41729 0))(
  ( (V!41730 (val!13782 Int)) )
))
(declare-datatypes ((ValueCell!13016 0))(
  ( (ValueCellFull!13016 (v!16414 V!41729)) (EmptyCell!13016) )
))
(declare-fun mapRest!42994 () (Array (_ BitVec 32) ValueCell!13016))

(declare-fun mapKey!42994 () (_ BitVec 32))

(declare-fun mapValue!42994 () ValueCell!13016)

(declare-datatypes ((array!71730 0))(
  ( (array!71731 (arr!34518 (Array (_ BitVec 32) ValueCell!13016)) (size!35056 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71730)

(assert (=> mapNonEmpty!42994 (= (arr!34518 _values!996) (store mapRest!42994 mapKey!42994 mapValue!42994))))

(declare-fun b!1106152 () Bool)

(declare-fun res!738191 () Bool)

(assert (=> b!1106152 (=> (not res!738191) (not e!631224))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106152 (= res!738191 (validMask!0 mask!1564))))

(declare-fun b!1106154 () Bool)

(declare-fun res!738190 () Bool)

(declare-fun e!631222 () Bool)

(assert (=> b!1106154 (=> (not res!738190) (not e!631222))))

(declare-datatypes ((array!71732 0))(
  ( (array!71733 (arr!34519 (Array (_ BitVec 32) (_ BitVec 64))) (size!35057 (_ BitVec 32))) )
))
(declare-fun lt!495239 () array!71732)

(declare-datatypes ((List!24125 0))(
  ( (Nil!24122) (Cons!24121 (h!25330 (_ BitVec 64)) (t!34381 List!24125)) )
))
(declare-fun arrayNoDuplicates!0 (array!71732 (_ BitVec 32) List!24125) Bool)

(assert (=> b!1106154 (= res!738190 (arrayNoDuplicates!0 lt!495239 #b00000000000000000000000000000000 Nil!24122))))

(declare-fun b!1106155 () Bool)

(declare-fun res!738194 () Bool)

(assert (=> b!1106155 (=> (not res!738194) (not e!631224))))

(declare-fun _keys!1208 () array!71732)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106155 (= res!738194 (and (= (size!35056 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35057 _keys!1208) (size!35056 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106156 () Bool)

(assert (=> b!1106156 (= e!631224 e!631222)))

(declare-fun res!738192 () Bool)

(assert (=> b!1106156 (=> (not res!738192) (not e!631222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71732 (_ BitVec 32)) Bool)

(assert (=> b!1106156 (= res!738192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495239 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106156 (= lt!495239 (array!71733 (store (arr!34519 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35057 _keys!1208)))))

(declare-fun b!1106157 () Bool)

(declare-fun res!738193 () Bool)

(assert (=> b!1106157 (=> (not res!738193) (not e!631224))))

(assert (=> b!1106157 (= res!738193 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24122))))

(declare-fun b!1106158 () Bool)

(declare-fun res!738199 () Bool)

(assert (=> b!1106158 (=> (not res!738199) (not e!631224))))

(assert (=> b!1106158 (= res!738199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106159 () Bool)

(declare-fun e!631220 () Bool)

(declare-fun e!631223 () Bool)

(assert (=> b!1106159 (= e!631220 (and e!631223 mapRes!42994))))

(declare-fun condMapEmpty!42994 () Bool)

(declare-fun mapDefault!42994 () ValueCell!13016)

(assert (=> b!1106159 (= condMapEmpty!42994 (= (arr!34518 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13016)) mapDefault!42994)))))

(declare-fun b!1106160 () Bool)

(assert (=> b!1106160 (= e!631222 (not true))))

(declare-fun arrayContainsKey!0 (array!71732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106160 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36123 0))(
  ( (Unit!36124) )
))
(declare-fun lt!495240 () Unit!36123)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71732 (_ BitVec 64) (_ BitVec 32)) Unit!36123)

(assert (=> b!1106160 (= lt!495240 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!42994 () Bool)

(assert (=> mapIsEmpty!42994 mapRes!42994))

(declare-fun b!1106161 () Bool)

(declare-fun tp_is_empty!27451 () Bool)

(assert (=> b!1106161 (= e!631223 tp_is_empty!27451)))

(declare-fun b!1106162 () Bool)

(assert (=> b!1106162 (= e!631221 tp_is_empty!27451)))

(declare-fun b!1106163 () Bool)

(declare-fun res!738196 () Bool)

(assert (=> b!1106163 (=> (not res!738196) (not e!631224))))

(assert (=> b!1106163 (= res!738196 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35057 _keys!1208))))))

(declare-fun res!738197 () Bool)

(assert (=> start!97214 (=> (not res!738197) (not e!631224))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97214 (= res!738197 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35057 _keys!1208))))))

(assert (=> start!97214 e!631224))

(declare-fun array_inv!26620 (array!71732) Bool)

(assert (=> start!97214 (array_inv!26620 _keys!1208)))

(assert (=> start!97214 true))

(declare-fun array_inv!26621 (array!71730) Bool)

(assert (=> start!97214 (and (array_inv!26621 _values!996) e!631220)))

(declare-fun b!1106153 () Bool)

(declare-fun res!738198 () Bool)

(assert (=> b!1106153 (=> (not res!738198) (not e!631224))))

(assert (=> b!1106153 (= res!738198 (= (select (arr!34519 _keys!1208) i!673) k0!934))))

(assert (= (and start!97214 res!738197) b!1106152))

(assert (= (and b!1106152 res!738191) b!1106155))

(assert (= (and b!1106155 res!738194) b!1106158))

(assert (= (and b!1106158 res!738199) b!1106157))

(assert (= (and b!1106157 res!738193) b!1106163))

(assert (= (and b!1106163 res!738196) b!1106151))

(assert (= (and b!1106151 res!738195) b!1106153))

(assert (= (and b!1106153 res!738198) b!1106156))

(assert (= (and b!1106156 res!738192) b!1106154))

(assert (= (and b!1106154 res!738190) b!1106160))

(assert (= (and b!1106159 condMapEmpty!42994) mapIsEmpty!42994))

(assert (= (and b!1106159 (not condMapEmpty!42994)) mapNonEmpty!42994))

(get-info :version)

(assert (= (and mapNonEmpty!42994 ((_ is ValueCellFull!13016) mapValue!42994)) b!1106162))

(assert (= (and b!1106159 ((_ is ValueCellFull!13016) mapDefault!42994)) b!1106161))

(assert (= start!97214 b!1106159))

(declare-fun m!1024785 () Bool)

(assert (=> start!97214 m!1024785))

(declare-fun m!1024787 () Bool)

(assert (=> start!97214 m!1024787))

(declare-fun m!1024789 () Bool)

(assert (=> b!1106153 m!1024789))

(declare-fun m!1024791 () Bool)

(assert (=> b!1106151 m!1024791))

(declare-fun m!1024793 () Bool)

(assert (=> b!1106154 m!1024793))

(declare-fun m!1024795 () Bool)

(assert (=> b!1106157 m!1024795))

(declare-fun m!1024797 () Bool)

(assert (=> b!1106156 m!1024797))

(declare-fun m!1024799 () Bool)

(assert (=> b!1106156 m!1024799))

(declare-fun m!1024801 () Bool)

(assert (=> b!1106152 m!1024801))

(declare-fun m!1024803 () Bool)

(assert (=> b!1106158 m!1024803))

(declare-fun m!1024805 () Bool)

(assert (=> mapNonEmpty!42994 m!1024805))

(declare-fun m!1024807 () Bool)

(assert (=> b!1106160 m!1024807))

(declare-fun m!1024809 () Bool)

(assert (=> b!1106160 m!1024809))

(check-sat (not b!1106160) (not start!97214) (not b!1106152) (not mapNonEmpty!42994) (not b!1106158) (not b!1106154) tp_is_empty!27451 (not b!1106156) (not b!1106157) (not b!1106151))
(check-sat)
