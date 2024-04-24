; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100482 () Bool)

(assert start!100482)

(declare-fun b!1196960 () Bool)

(declare-fun res!796148 () Bool)

(declare-fun e!680245 () Bool)

(assert (=> b!1196960 (=> (not res!796148) (not e!680245))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196960 (= res!796148 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47306 () Bool)

(declare-fun mapRes!47306 () Bool)

(declare-fun tp!89916 () Bool)

(declare-fun e!680248 () Bool)

(assert (=> mapNonEmpty!47306 (= mapRes!47306 (and tp!89916 e!680248))))

(declare-fun mapKey!47306 () (_ BitVec 32))

(declare-datatypes ((V!45545 0))(
  ( (V!45546 (val!15213 Int)) )
))
(declare-datatypes ((ValueCell!14447 0))(
  ( (ValueCellFull!14447 (v!17847 V!45545)) (EmptyCell!14447) )
))
(declare-fun mapValue!47306 () ValueCell!14447)

(declare-fun mapRest!47306 () (Array (_ BitVec 32) ValueCell!14447))

(declare-datatypes ((array!77447 0))(
  ( (array!77448 (arr!37364 (Array (_ BitVec 32) ValueCell!14447)) (size!37901 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77447)

(assert (=> mapNonEmpty!47306 (= (arr!37364 _values!996) (store mapRest!47306 mapKey!47306 mapValue!47306))))

(declare-fun b!1196961 () Bool)

(declare-fun e!680247 () Bool)

(assert (=> b!1196961 (= e!680247 (not true))))

(declare-datatypes ((array!77449 0))(
  ( (array!77450 (arr!37365 (Array (_ BitVec 32) (_ BitVec 64))) (size!37902 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77449)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196961 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39619 0))(
  ( (Unit!39620) )
))
(declare-fun lt!543447 () Unit!39619)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77449 (_ BitVec 64) (_ BitVec 32)) Unit!39619)

(assert (=> b!1196961 (= lt!543447 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196962 () Bool)

(assert (=> b!1196962 (= e!680245 e!680247)))

(declare-fun res!796149 () Bool)

(assert (=> b!1196962 (=> (not res!796149) (not e!680247))))

(declare-fun lt!543448 () array!77449)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77449 (_ BitVec 32)) Bool)

(assert (=> b!1196962 (= res!796149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543448 mask!1564))))

(assert (=> b!1196962 (= lt!543448 (array!77450 (store (arr!37365 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37902 _keys!1208)))))

(declare-fun res!796145 () Bool)

(assert (=> start!100482 (=> (not res!796145) (not e!680245))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100482 (= res!796145 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37902 _keys!1208))))))

(assert (=> start!100482 e!680245))

(declare-fun array_inv!28554 (array!77449) Bool)

(assert (=> start!100482 (array_inv!28554 _keys!1208)))

(assert (=> start!100482 true))

(declare-fun e!680244 () Bool)

(declare-fun array_inv!28555 (array!77447) Bool)

(assert (=> start!100482 (and (array_inv!28555 _values!996) e!680244)))

(declare-fun b!1196963 () Bool)

(declare-fun res!796154 () Bool)

(assert (=> b!1196963 (=> (not res!796154) (not e!680245))))

(assert (=> b!1196963 (= res!796154 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37902 _keys!1208))))))

(declare-fun b!1196964 () Bool)

(declare-fun res!796146 () Bool)

(assert (=> b!1196964 (=> (not res!796146) (not e!680245))))

(declare-datatypes ((List!26317 0))(
  ( (Nil!26314) (Cons!26313 (h!27531 (_ BitVec 64)) (t!38980 List!26317)) )
))
(declare-fun arrayNoDuplicates!0 (array!77449 (_ BitVec 32) List!26317) Bool)

(assert (=> b!1196964 (= res!796146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26314))))

(declare-fun b!1196965 () Bool)

(declare-fun res!796151 () Bool)

(assert (=> b!1196965 (=> (not res!796151) (not e!680247))))

(assert (=> b!1196965 (= res!796151 (arrayNoDuplicates!0 lt!543448 #b00000000000000000000000000000000 Nil!26314))))

(declare-fun b!1196966 () Bool)

(declare-fun res!796147 () Bool)

(assert (=> b!1196966 (=> (not res!796147) (not e!680245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196966 (= res!796147 (validKeyInArray!0 k0!934))))

(declare-fun b!1196967 () Bool)

(declare-fun e!680246 () Bool)

(declare-fun tp_is_empty!30313 () Bool)

(assert (=> b!1196967 (= e!680246 tp_is_empty!30313)))

(declare-fun b!1196968 () Bool)

(declare-fun res!796152 () Bool)

(assert (=> b!1196968 (=> (not res!796152) (not e!680245))))

(assert (=> b!1196968 (= res!796152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196969 () Bool)

(declare-fun res!796150 () Bool)

(assert (=> b!1196969 (=> (not res!796150) (not e!680245))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196969 (= res!796150 (and (= (size!37901 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37902 _keys!1208) (size!37901 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196970 () Bool)

(declare-fun res!796153 () Bool)

(assert (=> b!1196970 (=> (not res!796153) (not e!680245))))

(assert (=> b!1196970 (= res!796153 (= (select (arr!37365 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47306 () Bool)

(assert (=> mapIsEmpty!47306 mapRes!47306))

(declare-fun b!1196971 () Bool)

(assert (=> b!1196971 (= e!680248 tp_is_empty!30313)))

(declare-fun b!1196972 () Bool)

(assert (=> b!1196972 (= e!680244 (and e!680246 mapRes!47306))))

(declare-fun condMapEmpty!47306 () Bool)

(declare-fun mapDefault!47306 () ValueCell!14447)

(assert (=> b!1196972 (= condMapEmpty!47306 (= (arr!37364 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14447)) mapDefault!47306)))))

(assert (= (and start!100482 res!796145) b!1196960))

(assert (= (and b!1196960 res!796148) b!1196969))

(assert (= (and b!1196969 res!796150) b!1196968))

(assert (= (and b!1196968 res!796152) b!1196964))

(assert (= (and b!1196964 res!796146) b!1196963))

(assert (= (and b!1196963 res!796154) b!1196966))

(assert (= (and b!1196966 res!796147) b!1196970))

(assert (= (and b!1196970 res!796153) b!1196962))

(assert (= (and b!1196962 res!796149) b!1196965))

(assert (= (and b!1196965 res!796151) b!1196961))

(assert (= (and b!1196972 condMapEmpty!47306) mapIsEmpty!47306))

(assert (= (and b!1196972 (not condMapEmpty!47306)) mapNonEmpty!47306))

(get-info :version)

(assert (= (and mapNonEmpty!47306 ((_ is ValueCellFull!14447) mapValue!47306)) b!1196971))

(assert (= (and b!1196972 ((_ is ValueCellFull!14447) mapDefault!47306)) b!1196967))

(assert (= start!100482 b!1196972))

(declare-fun m!1104735 () Bool)

(assert (=> b!1196964 m!1104735))

(declare-fun m!1104737 () Bool)

(assert (=> b!1196966 m!1104737))

(declare-fun m!1104739 () Bool)

(assert (=> b!1196962 m!1104739))

(declare-fun m!1104741 () Bool)

(assert (=> b!1196962 m!1104741))

(declare-fun m!1104743 () Bool)

(assert (=> b!1196970 m!1104743))

(declare-fun m!1104745 () Bool)

(assert (=> b!1196965 m!1104745))

(declare-fun m!1104747 () Bool)

(assert (=> b!1196960 m!1104747))

(declare-fun m!1104749 () Bool)

(assert (=> start!100482 m!1104749))

(declare-fun m!1104751 () Bool)

(assert (=> start!100482 m!1104751))

(declare-fun m!1104753 () Bool)

(assert (=> mapNonEmpty!47306 m!1104753))

(declare-fun m!1104755 () Bool)

(assert (=> b!1196961 m!1104755))

(declare-fun m!1104757 () Bool)

(assert (=> b!1196961 m!1104757))

(declare-fun m!1104759 () Bool)

(assert (=> b!1196968 m!1104759))

(check-sat (not b!1196961) (not b!1196968) (not b!1196965) (not b!1196962) (not b!1196964) tp_is_empty!30313 (not b!1196960) (not b!1196966) (not start!100482) (not mapNonEmpty!47306))
(check-sat)
