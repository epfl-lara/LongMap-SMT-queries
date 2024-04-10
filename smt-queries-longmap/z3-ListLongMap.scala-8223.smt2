; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100248 () Bool)

(assert start!100248)

(declare-fun mapIsEmpty!47309 () Bool)

(declare-fun mapRes!47309 () Bool)

(assert (=> mapIsEmpty!47309 mapRes!47309))

(declare-fun mapNonEmpty!47309 () Bool)

(declare-fun tp!89919 () Bool)

(declare-fun e!679430 () Bool)

(assert (=> mapNonEmpty!47309 (= mapRes!47309 (and tp!89919 e!679430))))

(declare-fun mapKey!47309 () (_ BitVec 32))

(declare-datatypes ((V!45547 0))(
  ( (V!45548 (val!15214 Int)) )
))
(declare-datatypes ((ValueCell!14448 0))(
  ( (ValueCellFull!14448 (v!17852 V!45547)) (EmptyCell!14448) )
))
(declare-fun mapRest!47309 () (Array (_ BitVec 32) ValueCell!14448))

(declare-fun mapValue!47309 () ValueCell!14448)

(declare-datatypes ((array!77411 0))(
  ( (array!77412 (arr!37352 (Array (_ BitVec 32) ValueCell!14448)) (size!37888 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77411)

(assert (=> mapNonEmpty!47309 (= (arr!37352 _values!996) (store mapRest!47309 mapKey!47309 mapValue!47309))))

(declare-fun b!1195710 () Bool)

(declare-fun res!795670 () Bool)

(declare-fun e!679433 () Bool)

(assert (=> b!1195710 (=> (not res!795670) (not e!679433))))

(declare-datatypes ((array!77413 0))(
  ( (array!77414 (arr!37353 (Array (_ BitVec 32) (_ BitVec 64))) (size!37889 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77413)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195710 (= res!795670 (= (select (arr!37353 _keys!1208) i!673) k0!934))))

(declare-fun b!1195711 () Bool)

(declare-fun e!679431 () Bool)

(declare-fun e!679434 () Bool)

(assert (=> b!1195711 (= e!679431 (and e!679434 mapRes!47309))))

(declare-fun condMapEmpty!47309 () Bool)

(declare-fun mapDefault!47309 () ValueCell!14448)

(assert (=> b!1195711 (= condMapEmpty!47309 (= (arr!37352 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14448)) mapDefault!47309)))))

(declare-fun b!1195713 () Bool)

(declare-fun res!795671 () Bool)

(assert (=> b!1195713 (=> (not res!795671) (not e!679433))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77413 (_ BitVec 32)) Bool)

(assert (=> b!1195713 (= res!795671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195714 () Bool)

(declare-fun res!795676 () Bool)

(assert (=> b!1195714 (=> (not res!795676) (not e!679433))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195714 (= res!795676 (and (= (size!37888 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37889 _keys!1208) (size!37888 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195715 () Bool)

(declare-fun res!795672 () Bool)

(assert (=> b!1195715 (=> (not res!795672) (not e!679433))))

(assert (=> b!1195715 (= res!795672 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37889 _keys!1208))))))

(declare-fun b!1195716 () Bool)

(declare-fun res!795667 () Bool)

(assert (=> b!1195716 (=> (not res!795667) (not e!679433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195716 (= res!795667 (validMask!0 mask!1564))))

(declare-fun b!1195717 () Bool)

(declare-fun e!679435 () Bool)

(assert (=> b!1195717 (= e!679433 e!679435)))

(declare-fun res!795675 () Bool)

(assert (=> b!1195717 (=> (not res!795675) (not e!679435))))

(declare-fun lt!542969 () array!77413)

(assert (=> b!1195717 (= res!795675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542969 mask!1564))))

(assert (=> b!1195717 (= lt!542969 (array!77414 (store (arr!37353 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37889 _keys!1208)))))

(declare-fun b!1195718 () Bool)

(assert (=> b!1195718 (= e!679435 (not true))))

(declare-fun arrayContainsKey!0 (array!77413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195718 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39644 0))(
  ( (Unit!39645) )
))
(declare-fun lt!542970 () Unit!39644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77413 (_ BitVec 64) (_ BitVec 32)) Unit!39644)

(assert (=> b!1195718 (= lt!542970 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195719 () Bool)

(declare-fun tp_is_empty!30315 () Bool)

(assert (=> b!1195719 (= e!679434 tp_is_empty!30315)))

(declare-fun b!1195720 () Bool)

(declare-fun res!795668 () Bool)

(assert (=> b!1195720 (=> (not res!795668) (not e!679433))))

(declare-datatypes ((List!26286 0))(
  ( (Nil!26283) (Cons!26282 (h!27491 (_ BitVec 64)) (t!38957 List!26286)) )
))
(declare-fun arrayNoDuplicates!0 (array!77413 (_ BitVec 32) List!26286) Bool)

(assert (=> b!1195720 (= res!795668 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26283))))

(declare-fun b!1195721 () Bool)

(assert (=> b!1195721 (= e!679430 tp_is_empty!30315)))

(declare-fun b!1195722 () Bool)

(declare-fun res!795674 () Bool)

(assert (=> b!1195722 (=> (not res!795674) (not e!679433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195722 (= res!795674 (validKeyInArray!0 k0!934))))

(declare-fun b!1195712 () Bool)

(declare-fun res!795669 () Bool)

(assert (=> b!1195712 (=> (not res!795669) (not e!679435))))

(assert (=> b!1195712 (= res!795669 (arrayNoDuplicates!0 lt!542969 #b00000000000000000000000000000000 Nil!26283))))

(declare-fun res!795673 () Bool)

(assert (=> start!100248 (=> (not res!795673) (not e!679433))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100248 (= res!795673 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37889 _keys!1208))))))

(assert (=> start!100248 e!679433))

(declare-fun array_inv!28472 (array!77413) Bool)

(assert (=> start!100248 (array_inv!28472 _keys!1208)))

(assert (=> start!100248 true))

(declare-fun array_inv!28473 (array!77411) Bool)

(assert (=> start!100248 (and (array_inv!28473 _values!996) e!679431)))

(assert (= (and start!100248 res!795673) b!1195716))

(assert (= (and b!1195716 res!795667) b!1195714))

(assert (= (and b!1195714 res!795676) b!1195713))

(assert (= (and b!1195713 res!795671) b!1195720))

(assert (= (and b!1195720 res!795668) b!1195715))

(assert (= (and b!1195715 res!795672) b!1195722))

(assert (= (and b!1195722 res!795674) b!1195710))

(assert (= (and b!1195710 res!795670) b!1195717))

(assert (= (and b!1195717 res!795675) b!1195712))

(assert (= (and b!1195712 res!795669) b!1195718))

(assert (= (and b!1195711 condMapEmpty!47309) mapIsEmpty!47309))

(assert (= (and b!1195711 (not condMapEmpty!47309)) mapNonEmpty!47309))

(get-info :version)

(assert (= (and mapNonEmpty!47309 ((_ is ValueCellFull!14448) mapValue!47309)) b!1195721))

(assert (= (and b!1195711 ((_ is ValueCellFull!14448) mapDefault!47309)) b!1195719))

(assert (= start!100248 b!1195711))

(declare-fun m!1103189 () Bool)

(assert (=> b!1195716 m!1103189))

(declare-fun m!1103191 () Bool)

(assert (=> mapNonEmpty!47309 m!1103191))

(declare-fun m!1103193 () Bool)

(assert (=> b!1195718 m!1103193))

(declare-fun m!1103195 () Bool)

(assert (=> b!1195718 m!1103195))

(declare-fun m!1103197 () Bool)

(assert (=> b!1195717 m!1103197))

(declare-fun m!1103199 () Bool)

(assert (=> b!1195717 m!1103199))

(declare-fun m!1103201 () Bool)

(assert (=> b!1195722 m!1103201))

(declare-fun m!1103203 () Bool)

(assert (=> b!1195710 m!1103203))

(declare-fun m!1103205 () Bool)

(assert (=> b!1195712 m!1103205))

(declare-fun m!1103207 () Bool)

(assert (=> start!100248 m!1103207))

(declare-fun m!1103209 () Bool)

(assert (=> start!100248 m!1103209))

(declare-fun m!1103211 () Bool)

(assert (=> b!1195713 m!1103211))

(declare-fun m!1103213 () Bool)

(assert (=> b!1195720 m!1103213))

(check-sat (not b!1195717) (not b!1195720) (not b!1195716) (not b!1195712) tp_is_empty!30315 (not mapNonEmpty!47309) (not b!1195713) (not b!1195722) (not b!1195718) (not start!100248))
(check-sat)
