; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100506 () Bool)

(assert start!100506)

(declare-fun b!1197428 () Bool)

(declare-fun res!796508 () Bool)

(declare-fun e!680464 () Bool)

(assert (=> b!1197428 (=> (not res!796508) (not e!680464))))

(declare-datatypes ((array!77493 0))(
  ( (array!77494 (arr!37387 (Array (_ BitVec 32) (_ BitVec 64))) (size!37924 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77493)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1197428 (= res!796508 (= (select (arr!37387 _keys!1208) i!673) k0!934))))

(declare-fun b!1197429 () Bool)

(declare-fun res!796510 () Bool)

(assert (=> b!1197429 (=> (not res!796510) (not e!680464))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77493 (_ BitVec 32)) Bool)

(assert (=> b!1197429 (= res!796510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!796509 () Bool)

(assert (=> start!100506 (=> (not res!796509) (not e!680464))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100506 (= res!796509 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37924 _keys!1208))))))

(assert (=> start!100506 e!680464))

(declare-fun array_inv!28568 (array!77493) Bool)

(assert (=> start!100506 (array_inv!28568 _keys!1208)))

(assert (=> start!100506 true))

(declare-datatypes ((V!45577 0))(
  ( (V!45578 (val!15225 Int)) )
))
(declare-datatypes ((ValueCell!14459 0))(
  ( (ValueCellFull!14459 (v!17859 V!45577)) (EmptyCell!14459) )
))
(declare-datatypes ((array!77495 0))(
  ( (array!77496 (arr!37388 (Array (_ BitVec 32) ValueCell!14459)) (size!37925 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77495)

(declare-fun e!680462 () Bool)

(declare-fun array_inv!28569 (array!77495) Bool)

(assert (=> start!100506 (and (array_inv!28569 _values!996) e!680462)))

(declare-fun b!1197430 () Bool)

(declare-fun res!796513 () Bool)

(assert (=> b!1197430 (=> (not res!796513) (not e!680464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197430 (= res!796513 (validMask!0 mask!1564))))

(declare-fun b!1197431 () Bool)

(declare-fun res!796506 () Bool)

(assert (=> b!1197431 (=> (not res!796506) (not e!680464))))

(declare-datatypes ((List!26326 0))(
  ( (Nil!26323) (Cons!26322 (h!27540 (_ BitVec 64)) (t!38989 List!26326)) )
))
(declare-fun arrayNoDuplicates!0 (array!77493 (_ BitVec 32) List!26326) Bool)

(assert (=> b!1197431 (= res!796506 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26323))))

(declare-fun b!1197432 () Bool)

(declare-fun e!680461 () Bool)

(assert (=> b!1197432 (= e!680464 e!680461)))

(declare-fun res!796511 () Bool)

(assert (=> b!1197432 (=> (not res!796511) (not e!680461))))

(declare-fun lt!543520 () array!77493)

(assert (=> b!1197432 (= res!796511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543520 mask!1564))))

(assert (=> b!1197432 (= lt!543520 (array!77494 (store (arr!37387 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37924 _keys!1208)))))

(declare-fun mapNonEmpty!47342 () Bool)

(declare-fun mapRes!47342 () Bool)

(declare-fun tp!89952 () Bool)

(declare-fun e!680460 () Bool)

(assert (=> mapNonEmpty!47342 (= mapRes!47342 (and tp!89952 e!680460))))

(declare-fun mapValue!47342 () ValueCell!14459)

(declare-fun mapKey!47342 () (_ BitVec 32))

(declare-fun mapRest!47342 () (Array (_ BitVec 32) ValueCell!14459))

(assert (=> mapNonEmpty!47342 (= (arr!37388 _values!996) (store mapRest!47342 mapKey!47342 mapValue!47342))))

(declare-fun b!1197433 () Bool)

(declare-fun res!796514 () Bool)

(assert (=> b!1197433 (=> (not res!796514) (not e!680464))))

(assert (=> b!1197433 (= res!796514 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37924 _keys!1208))))))

(declare-fun b!1197434 () Bool)

(declare-fun tp_is_empty!30337 () Bool)

(assert (=> b!1197434 (= e!680460 tp_is_empty!30337)))

(declare-fun b!1197435 () Bool)

(declare-fun res!796505 () Bool)

(assert (=> b!1197435 (=> (not res!796505) (not e!680461))))

(assert (=> b!1197435 (= res!796505 (arrayNoDuplicates!0 lt!543520 #b00000000000000000000000000000000 Nil!26323))))

(declare-fun b!1197436 () Bool)

(declare-fun e!680463 () Bool)

(assert (=> b!1197436 (= e!680462 (and e!680463 mapRes!47342))))

(declare-fun condMapEmpty!47342 () Bool)

(declare-fun mapDefault!47342 () ValueCell!14459)

(assert (=> b!1197436 (= condMapEmpty!47342 (= (arr!37388 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14459)) mapDefault!47342)))))

(declare-fun b!1197437 () Bool)

(assert (=> b!1197437 (= e!680461 (not true))))

(declare-fun arrayContainsKey!0 (array!77493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197437 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39631 0))(
  ( (Unit!39632) )
))
(declare-fun lt!543519 () Unit!39631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77493 (_ BitVec 64) (_ BitVec 32)) Unit!39631)

(assert (=> b!1197437 (= lt!543519 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197438 () Bool)

(assert (=> b!1197438 (= e!680463 tp_is_empty!30337)))

(declare-fun mapIsEmpty!47342 () Bool)

(assert (=> mapIsEmpty!47342 mapRes!47342))

(declare-fun b!1197439 () Bool)

(declare-fun res!796507 () Bool)

(assert (=> b!1197439 (=> (not res!796507) (not e!680464))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197439 (= res!796507 (and (= (size!37925 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37924 _keys!1208) (size!37925 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197440 () Bool)

(declare-fun res!796512 () Bool)

(assert (=> b!1197440 (=> (not res!796512) (not e!680464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197440 (= res!796512 (validKeyInArray!0 k0!934))))

(assert (= (and start!100506 res!796509) b!1197430))

(assert (= (and b!1197430 res!796513) b!1197439))

(assert (= (and b!1197439 res!796507) b!1197429))

(assert (= (and b!1197429 res!796510) b!1197431))

(assert (= (and b!1197431 res!796506) b!1197433))

(assert (= (and b!1197433 res!796514) b!1197440))

(assert (= (and b!1197440 res!796512) b!1197428))

(assert (= (and b!1197428 res!796508) b!1197432))

(assert (= (and b!1197432 res!796511) b!1197435))

(assert (= (and b!1197435 res!796505) b!1197437))

(assert (= (and b!1197436 condMapEmpty!47342) mapIsEmpty!47342))

(assert (= (and b!1197436 (not condMapEmpty!47342)) mapNonEmpty!47342))

(get-info :version)

(assert (= (and mapNonEmpty!47342 ((_ is ValueCellFull!14459) mapValue!47342)) b!1197434))

(assert (= (and b!1197436 ((_ is ValueCellFull!14459) mapDefault!47342)) b!1197438))

(assert (= start!100506 b!1197436))

(declare-fun m!1105047 () Bool)

(assert (=> b!1197437 m!1105047))

(declare-fun m!1105049 () Bool)

(assert (=> b!1197437 m!1105049))

(declare-fun m!1105051 () Bool)

(assert (=> start!100506 m!1105051))

(declare-fun m!1105053 () Bool)

(assert (=> start!100506 m!1105053))

(declare-fun m!1105055 () Bool)

(assert (=> b!1197430 m!1105055))

(declare-fun m!1105057 () Bool)

(assert (=> b!1197429 m!1105057))

(declare-fun m!1105059 () Bool)

(assert (=> b!1197432 m!1105059))

(declare-fun m!1105061 () Bool)

(assert (=> b!1197432 m!1105061))

(declare-fun m!1105063 () Bool)

(assert (=> b!1197440 m!1105063))

(declare-fun m!1105065 () Bool)

(assert (=> b!1197435 m!1105065))

(declare-fun m!1105067 () Bool)

(assert (=> mapNonEmpty!47342 m!1105067))

(declare-fun m!1105069 () Bool)

(assert (=> b!1197431 m!1105069))

(declare-fun m!1105071 () Bool)

(assert (=> b!1197428 m!1105071))

(check-sat (not start!100506) (not b!1197440) (not b!1197437) (not b!1197432) tp_is_empty!30337 (not b!1197435) (not b!1197429) (not mapNonEmpty!47342) (not b!1197431) (not b!1197430))
(check-sat)
