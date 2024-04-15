; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100352 () Bool)

(assert start!100352)

(declare-fun b!1197598 () Bool)

(declare-fun res!797019 () Bool)

(declare-fun e!680324 () Bool)

(assert (=> b!1197598 (=> (not res!797019) (not e!680324))))

(declare-datatypes ((array!77514 0))(
  ( (array!77515 (arr!37403 (Array (_ BitVec 32) (_ BitVec 64))) (size!37941 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77514)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1197598 (= res!797019 (= (select (arr!37403 _keys!1208) i!673) k0!934))))

(declare-fun b!1197599 () Bool)

(declare-fun res!797023 () Bool)

(assert (=> b!1197599 (=> (not res!797023) (not e!680324))))

(declare-datatypes ((List!26406 0))(
  ( (Nil!26403) (Cons!26402 (h!27611 (_ BitVec 64)) (t!39098 List!26406)) )
))
(declare-fun arrayNoDuplicates!0 (array!77514 (_ BitVec 32) List!26406) Bool)

(assert (=> b!1197599 (= res!797023 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26403))))

(declare-fun b!1197600 () Bool)

(declare-fun e!680325 () Bool)

(assert (=> b!1197600 (= e!680324 e!680325)))

(declare-fun res!797022 () Bool)

(assert (=> b!1197600 (=> (not res!797022) (not e!680325))))

(declare-fun lt!543150 () array!77514)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77514 (_ BitVec 32)) Bool)

(assert (=> b!1197600 (= res!797022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543150 mask!1564))))

(assert (=> b!1197600 (= lt!543150 (array!77515 (store (arr!37403 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37941 _keys!1208)))))

(declare-fun res!797020 () Bool)

(assert (=> start!100352 (=> (not res!797020) (not e!680324))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100352 (= res!797020 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37941 _keys!1208))))))

(assert (=> start!100352 e!680324))

(declare-fun array_inv!28628 (array!77514) Bool)

(assert (=> start!100352 (array_inv!28628 _keys!1208)))

(assert (=> start!100352 true))

(declare-datatypes ((V!45665 0))(
  ( (V!45666 (val!15258 Int)) )
))
(declare-datatypes ((ValueCell!14492 0))(
  ( (ValueCellFull!14492 (v!17895 V!45665)) (EmptyCell!14492) )
))
(declare-datatypes ((array!77516 0))(
  ( (array!77517 (arr!37404 (Array (_ BitVec 32) ValueCell!14492)) (size!37942 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77516)

(declare-fun e!680327 () Bool)

(declare-fun array_inv!28629 (array!77516) Bool)

(assert (=> start!100352 (and (array_inv!28629 _values!996) e!680327)))

(declare-fun b!1197601 () Bool)

(declare-fun res!797028 () Bool)

(assert (=> b!1197601 (=> (not res!797028) (not e!680324))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197601 (= res!797028 (and (= (size!37942 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37941 _keys!1208) (size!37942 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197602 () Bool)

(declare-fun e!680326 () Bool)

(declare-fun tp_is_empty!30403 () Bool)

(assert (=> b!1197602 (= e!680326 tp_is_empty!30403)))

(declare-fun b!1197603 () Bool)

(declare-fun res!797024 () Bool)

(assert (=> b!1197603 (=> (not res!797024) (not e!680324))))

(assert (=> b!1197603 (= res!797024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197604 () Bool)

(declare-fun res!797026 () Bool)

(assert (=> b!1197604 (=> (not res!797026) (not e!680324))))

(assert (=> b!1197604 (= res!797026 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37941 _keys!1208))))))

(declare-fun mapIsEmpty!47444 () Bool)

(declare-fun mapRes!47444 () Bool)

(assert (=> mapIsEmpty!47444 mapRes!47444))

(declare-fun b!1197605 () Bool)

(declare-fun res!797027 () Bool)

(assert (=> b!1197605 (=> (not res!797027) (not e!680324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197605 (= res!797027 (validMask!0 mask!1564))))

(declare-fun b!1197606 () Bool)

(declare-fun e!680322 () Bool)

(assert (=> b!1197606 (= e!680327 (and e!680322 mapRes!47444))))

(declare-fun condMapEmpty!47444 () Bool)

(declare-fun mapDefault!47444 () ValueCell!14492)

(assert (=> b!1197606 (= condMapEmpty!47444 (= (arr!37404 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14492)) mapDefault!47444)))))

(declare-fun b!1197607 () Bool)

(declare-fun res!797025 () Bool)

(assert (=> b!1197607 (=> (not res!797025) (not e!680324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197607 (= res!797025 (validKeyInArray!0 k0!934))))

(declare-fun b!1197608 () Bool)

(declare-fun res!797021 () Bool)

(assert (=> b!1197608 (=> (not res!797021) (not e!680325))))

(assert (=> b!1197608 (= res!797021 (arrayNoDuplicates!0 lt!543150 #b00000000000000000000000000000000 Nil!26403))))

(declare-fun b!1197609 () Bool)

(assert (=> b!1197609 (= e!680325 (not true))))

(declare-fun arrayContainsKey!0 (array!77514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197609 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39573 0))(
  ( (Unit!39574) )
))
(declare-fun lt!543149 () Unit!39573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77514 (_ BitVec 64) (_ BitVec 32)) Unit!39573)

(assert (=> b!1197609 (= lt!543149 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197610 () Bool)

(assert (=> b!1197610 (= e!680322 tp_is_empty!30403)))

(declare-fun mapNonEmpty!47444 () Bool)

(declare-fun tp!90099 () Bool)

(assert (=> mapNonEmpty!47444 (= mapRes!47444 (and tp!90099 e!680326))))

(declare-fun mapRest!47444 () (Array (_ BitVec 32) ValueCell!14492))

(declare-fun mapKey!47444 () (_ BitVec 32))

(declare-fun mapValue!47444 () ValueCell!14492)

(assert (=> mapNonEmpty!47444 (= (arr!37404 _values!996) (store mapRest!47444 mapKey!47444 mapValue!47444))))

(assert (= (and start!100352 res!797020) b!1197605))

(assert (= (and b!1197605 res!797027) b!1197601))

(assert (= (and b!1197601 res!797028) b!1197603))

(assert (= (and b!1197603 res!797024) b!1197599))

(assert (= (and b!1197599 res!797023) b!1197604))

(assert (= (and b!1197604 res!797026) b!1197607))

(assert (= (and b!1197607 res!797025) b!1197598))

(assert (= (and b!1197598 res!797019) b!1197600))

(assert (= (and b!1197600 res!797022) b!1197608))

(assert (= (and b!1197608 res!797021) b!1197609))

(assert (= (and b!1197606 condMapEmpty!47444) mapIsEmpty!47444))

(assert (= (and b!1197606 (not condMapEmpty!47444)) mapNonEmpty!47444))

(get-info :version)

(assert (= (and mapNonEmpty!47444 ((_ is ValueCellFull!14492) mapValue!47444)) b!1197602))

(assert (= (and b!1197606 ((_ is ValueCellFull!14492) mapDefault!47444)) b!1197610))

(assert (= start!100352 b!1197606))

(declare-fun m!1104075 () Bool)

(assert (=> b!1197608 m!1104075))

(declare-fun m!1104077 () Bool)

(assert (=> b!1197599 m!1104077))

(declare-fun m!1104079 () Bool)

(assert (=> b!1197598 m!1104079))

(declare-fun m!1104081 () Bool)

(assert (=> b!1197605 m!1104081))

(declare-fun m!1104083 () Bool)

(assert (=> b!1197603 m!1104083))

(declare-fun m!1104085 () Bool)

(assert (=> start!100352 m!1104085))

(declare-fun m!1104087 () Bool)

(assert (=> start!100352 m!1104087))

(declare-fun m!1104089 () Bool)

(assert (=> mapNonEmpty!47444 m!1104089))

(declare-fun m!1104091 () Bool)

(assert (=> b!1197609 m!1104091))

(declare-fun m!1104093 () Bool)

(assert (=> b!1197609 m!1104093))

(declare-fun m!1104095 () Bool)

(assert (=> b!1197607 m!1104095))

(declare-fun m!1104097 () Bool)

(assert (=> b!1197600 m!1104097))

(declare-fun m!1104099 () Bool)

(assert (=> b!1197600 m!1104099))

(check-sat (not mapNonEmpty!47444) (not b!1197603) (not start!100352) tp_is_empty!30403 (not b!1197607) (not b!1197608) (not b!1197605) (not b!1197599) (not b!1197609) (not b!1197600))
(check-sat)
