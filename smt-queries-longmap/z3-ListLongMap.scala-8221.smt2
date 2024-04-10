; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100236 () Bool)

(assert start!100236)

(declare-fun b!1195476 () Bool)

(declare-fun res!795495 () Bool)

(declare-fun e!679323 () Bool)

(assert (=> b!1195476 (=> (not res!795495) (not e!679323))))

(declare-datatypes ((array!77387 0))(
  ( (array!77388 (arr!37340 (Array (_ BitVec 32) (_ BitVec 64))) (size!37876 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77387)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195476 (= res!795495 (= (select (arr!37340 _keys!1208) i!673) k0!934))))

(declare-fun b!1195477 () Bool)

(declare-fun res!795488 () Bool)

(assert (=> b!1195477 (=> (not res!795488) (not e!679323))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195477 (= res!795488 (validMask!0 mask!1564))))

(declare-fun b!1195478 () Bool)

(declare-fun res!795494 () Bool)

(assert (=> b!1195478 (=> (not res!795494) (not e!679323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195478 (= res!795494 (validKeyInArray!0 k0!934))))

(declare-fun b!1195479 () Bool)

(declare-fun e!679325 () Bool)

(assert (=> b!1195479 (= e!679325 (not true))))

(declare-fun arrayContainsKey!0 (array!77387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195479 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39634 0))(
  ( (Unit!39635) )
))
(declare-fun lt!542933 () Unit!39634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77387 (_ BitVec 64) (_ BitVec 32)) Unit!39634)

(assert (=> b!1195479 (= lt!542933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195480 () Bool)

(declare-fun e!679322 () Bool)

(declare-fun e!679324 () Bool)

(declare-fun mapRes!47291 () Bool)

(assert (=> b!1195480 (= e!679322 (and e!679324 mapRes!47291))))

(declare-fun condMapEmpty!47291 () Bool)

(declare-datatypes ((V!45531 0))(
  ( (V!45532 (val!15208 Int)) )
))
(declare-datatypes ((ValueCell!14442 0))(
  ( (ValueCellFull!14442 (v!17846 V!45531)) (EmptyCell!14442) )
))
(declare-datatypes ((array!77389 0))(
  ( (array!77390 (arr!37341 (Array (_ BitVec 32) ValueCell!14442)) (size!37877 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77389)

(declare-fun mapDefault!47291 () ValueCell!14442)

(assert (=> b!1195480 (= condMapEmpty!47291 (= (arr!37341 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14442)) mapDefault!47291)))))

(declare-fun b!1195481 () Bool)

(declare-fun res!795490 () Bool)

(assert (=> b!1195481 (=> (not res!795490) (not e!679323))))

(assert (=> b!1195481 (= res!795490 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37876 _keys!1208))))))

(declare-fun b!1195482 () Bool)

(declare-fun tp_is_empty!30303 () Bool)

(assert (=> b!1195482 (= e!679324 tp_is_empty!30303)))

(declare-fun mapNonEmpty!47291 () Bool)

(declare-fun tp!89901 () Bool)

(declare-fun e!679327 () Bool)

(assert (=> mapNonEmpty!47291 (= mapRes!47291 (and tp!89901 e!679327))))

(declare-fun mapKey!47291 () (_ BitVec 32))

(declare-fun mapValue!47291 () ValueCell!14442)

(declare-fun mapRest!47291 () (Array (_ BitVec 32) ValueCell!14442))

(assert (=> mapNonEmpty!47291 (= (arr!37341 _values!996) (store mapRest!47291 mapKey!47291 mapValue!47291))))

(declare-fun b!1195483 () Bool)

(assert (=> b!1195483 (= e!679323 e!679325)))

(declare-fun res!795493 () Bool)

(assert (=> b!1195483 (=> (not res!795493) (not e!679325))))

(declare-fun lt!542934 () array!77387)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77387 (_ BitVec 32)) Bool)

(assert (=> b!1195483 (= res!795493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542934 mask!1564))))

(assert (=> b!1195483 (= lt!542934 (array!77388 (store (arr!37340 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37876 _keys!1208)))))

(declare-fun mapIsEmpty!47291 () Bool)

(assert (=> mapIsEmpty!47291 mapRes!47291))

(declare-fun res!795496 () Bool)

(assert (=> start!100236 (=> (not res!795496) (not e!679323))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100236 (= res!795496 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37876 _keys!1208))))))

(assert (=> start!100236 e!679323))

(declare-fun array_inv!28460 (array!77387) Bool)

(assert (=> start!100236 (array_inv!28460 _keys!1208)))

(assert (=> start!100236 true))

(declare-fun array_inv!28461 (array!77389) Bool)

(assert (=> start!100236 (and (array_inv!28461 _values!996) e!679322)))

(declare-fun b!1195484 () Bool)

(assert (=> b!1195484 (= e!679327 tp_is_empty!30303)))

(declare-fun b!1195485 () Bool)

(declare-fun res!795489 () Bool)

(assert (=> b!1195485 (=> (not res!795489) (not e!679325))))

(declare-datatypes ((List!26280 0))(
  ( (Nil!26277) (Cons!26276 (h!27485 (_ BitVec 64)) (t!38951 List!26280)) )
))
(declare-fun arrayNoDuplicates!0 (array!77387 (_ BitVec 32) List!26280) Bool)

(assert (=> b!1195485 (= res!795489 (arrayNoDuplicates!0 lt!542934 #b00000000000000000000000000000000 Nil!26277))))

(declare-fun b!1195486 () Bool)

(declare-fun res!795492 () Bool)

(assert (=> b!1195486 (=> (not res!795492) (not e!679323))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195486 (= res!795492 (and (= (size!37877 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37876 _keys!1208) (size!37877 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195487 () Bool)

(declare-fun res!795491 () Bool)

(assert (=> b!1195487 (=> (not res!795491) (not e!679323))))

(assert (=> b!1195487 (= res!795491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195488 () Bool)

(declare-fun res!795487 () Bool)

(assert (=> b!1195488 (=> (not res!795487) (not e!679323))))

(assert (=> b!1195488 (= res!795487 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26277))))

(assert (= (and start!100236 res!795496) b!1195477))

(assert (= (and b!1195477 res!795488) b!1195486))

(assert (= (and b!1195486 res!795492) b!1195487))

(assert (= (and b!1195487 res!795491) b!1195488))

(assert (= (and b!1195488 res!795487) b!1195481))

(assert (= (and b!1195481 res!795490) b!1195478))

(assert (= (and b!1195478 res!795494) b!1195476))

(assert (= (and b!1195476 res!795495) b!1195483))

(assert (= (and b!1195483 res!795493) b!1195485))

(assert (= (and b!1195485 res!795489) b!1195479))

(assert (= (and b!1195480 condMapEmpty!47291) mapIsEmpty!47291))

(assert (= (and b!1195480 (not condMapEmpty!47291)) mapNonEmpty!47291))

(get-info :version)

(assert (= (and mapNonEmpty!47291 ((_ is ValueCellFull!14442) mapValue!47291)) b!1195484))

(assert (= (and b!1195480 ((_ is ValueCellFull!14442) mapDefault!47291)) b!1195482))

(assert (= start!100236 b!1195480))

(declare-fun m!1103033 () Bool)

(assert (=> b!1195476 m!1103033))

(declare-fun m!1103035 () Bool)

(assert (=> b!1195483 m!1103035))

(declare-fun m!1103037 () Bool)

(assert (=> b!1195483 m!1103037))

(declare-fun m!1103039 () Bool)

(assert (=> start!100236 m!1103039))

(declare-fun m!1103041 () Bool)

(assert (=> start!100236 m!1103041))

(declare-fun m!1103043 () Bool)

(assert (=> b!1195485 m!1103043))

(declare-fun m!1103045 () Bool)

(assert (=> b!1195479 m!1103045))

(declare-fun m!1103047 () Bool)

(assert (=> b!1195479 m!1103047))

(declare-fun m!1103049 () Bool)

(assert (=> b!1195487 m!1103049))

(declare-fun m!1103051 () Bool)

(assert (=> mapNonEmpty!47291 m!1103051))

(declare-fun m!1103053 () Bool)

(assert (=> b!1195478 m!1103053))

(declare-fun m!1103055 () Bool)

(assert (=> b!1195477 m!1103055))

(declare-fun m!1103057 () Bool)

(assert (=> b!1195488 m!1103057))

(check-sat (not mapNonEmpty!47291) (not b!1195487) (not b!1195479) (not b!1195478) (not b!1195483) tp_is_empty!30303 (not b!1195488) (not start!100236) (not b!1195485) (not b!1195477))
(check-sat)
