; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100458 () Bool)

(assert start!100458)

(declare-fun mapNonEmpty!47270 () Bool)

(declare-fun mapRes!47270 () Bool)

(declare-fun tp!89880 () Bool)

(declare-fun e!680028 () Bool)

(assert (=> mapNonEmpty!47270 (= mapRes!47270 (and tp!89880 e!680028))))

(declare-datatypes ((V!45513 0))(
  ( (V!45514 (val!15201 Int)) )
))
(declare-datatypes ((ValueCell!14435 0))(
  ( (ValueCellFull!14435 (v!17835 V!45513)) (EmptyCell!14435) )
))
(declare-fun mapRest!47270 () (Array (_ BitVec 32) ValueCell!14435))

(declare-fun mapValue!47270 () ValueCell!14435)

(declare-fun mapKey!47270 () (_ BitVec 32))

(declare-datatypes ((array!77399 0))(
  ( (array!77400 (arr!37340 (Array (_ BitVec 32) ValueCell!14435)) (size!37877 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77399)

(assert (=> mapNonEmpty!47270 (= (arr!37340 _values!996) (store mapRest!47270 mapKey!47270 mapValue!47270))))

(declare-fun b!1196492 () Bool)

(declare-fun e!680032 () Bool)

(declare-fun e!680033 () Bool)

(assert (=> b!1196492 (= e!680032 e!680033)))

(declare-fun res!795793 () Bool)

(assert (=> b!1196492 (=> (not res!795793) (not e!680033))))

(declare-datatypes ((array!77401 0))(
  ( (array!77402 (arr!37341 (Array (_ BitVec 32) (_ BitVec 64))) (size!37878 (_ BitVec 32))) )
))
(declare-fun lt!543376 () array!77401)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77401 (_ BitVec 32)) Bool)

(assert (=> b!1196492 (= res!795793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543376 mask!1564))))

(declare-fun _keys!1208 () array!77401)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196492 (= lt!543376 (array!77402 (store (arr!37341 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37878 _keys!1208)))))

(declare-fun res!795790 () Bool)

(assert (=> start!100458 (=> (not res!795790) (not e!680032))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100458 (= res!795790 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37878 _keys!1208))))))

(assert (=> start!100458 e!680032))

(declare-fun array_inv!28536 (array!77401) Bool)

(assert (=> start!100458 (array_inv!28536 _keys!1208)))

(assert (=> start!100458 true))

(declare-fun e!680029 () Bool)

(declare-fun array_inv!28537 (array!77399) Bool)

(assert (=> start!100458 (and (array_inv!28537 _values!996) e!680029)))

(declare-fun b!1196493 () Bool)

(declare-fun e!680031 () Bool)

(assert (=> b!1196493 (= e!680029 (and e!680031 mapRes!47270))))

(declare-fun condMapEmpty!47270 () Bool)

(declare-fun mapDefault!47270 () ValueCell!14435)

(assert (=> b!1196493 (= condMapEmpty!47270 (= (arr!37340 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14435)) mapDefault!47270)))))

(declare-fun b!1196494 () Bool)

(declare-fun res!795788 () Bool)

(assert (=> b!1196494 (=> (not res!795788) (not e!680032))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1196494 (= res!795788 (= (select (arr!37341 _keys!1208) i!673) k0!934))))

(declare-fun b!1196495 () Bool)

(declare-fun res!795792 () Bool)

(assert (=> b!1196495 (=> (not res!795792) (not e!680032))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196495 (= res!795792 (and (= (size!37877 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37878 _keys!1208) (size!37877 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196496 () Bool)

(declare-fun res!795785 () Bool)

(assert (=> b!1196496 (=> (not res!795785) (not e!680032))))

(assert (=> b!1196496 (= res!795785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47270 () Bool)

(assert (=> mapIsEmpty!47270 mapRes!47270))

(declare-fun b!1196497 () Bool)

(declare-fun tp_is_empty!30289 () Bool)

(assert (=> b!1196497 (= e!680028 tp_is_empty!30289)))

(declare-fun b!1196498 () Bool)

(declare-fun res!795794 () Bool)

(assert (=> b!1196498 (=> (not res!795794) (not e!680032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196498 (= res!795794 (validKeyInArray!0 k0!934))))

(declare-fun b!1196499 () Bool)

(assert (=> b!1196499 (= e!680033 (not true))))

(declare-fun arrayContainsKey!0 (array!77401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196499 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39599 0))(
  ( (Unit!39600) )
))
(declare-fun lt!543375 () Unit!39599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77401 (_ BitVec 64) (_ BitVec 32)) Unit!39599)

(assert (=> b!1196499 (= lt!543375 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196500 () Bool)

(declare-fun res!795791 () Bool)

(assert (=> b!1196500 (=> (not res!795791) (not e!680032))))

(declare-datatypes ((List!26306 0))(
  ( (Nil!26303) (Cons!26302 (h!27520 (_ BitVec 64)) (t!38969 List!26306)) )
))
(declare-fun arrayNoDuplicates!0 (array!77401 (_ BitVec 32) List!26306) Bool)

(assert (=> b!1196500 (= res!795791 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26303))))

(declare-fun b!1196501 () Bool)

(declare-fun res!795787 () Bool)

(assert (=> b!1196501 (=> (not res!795787) (not e!680032))))

(assert (=> b!1196501 (= res!795787 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37878 _keys!1208))))))

(declare-fun b!1196502 () Bool)

(assert (=> b!1196502 (= e!680031 tp_is_empty!30289)))

(declare-fun b!1196503 () Bool)

(declare-fun res!795789 () Bool)

(assert (=> b!1196503 (=> (not res!795789) (not e!680032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196503 (= res!795789 (validMask!0 mask!1564))))

(declare-fun b!1196504 () Bool)

(declare-fun res!795786 () Bool)

(assert (=> b!1196504 (=> (not res!795786) (not e!680033))))

(assert (=> b!1196504 (= res!795786 (arrayNoDuplicates!0 lt!543376 #b00000000000000000000000000000000 Nil!26303))))

(assert (= (and start!100458 res!795790) b!1196503))

(assert (= (and b!1196503 res!795789) b!1196495))

(assert (= (and b!1196495 res!795792) b!1196496))

(assert (= (and b!1196496 res!795785) b!1196500))

(assert (= (and b!1196500 res!795791) b!1196501))

(assert (= (and b!1196501 res!795787) b!1196498))

(assert (= (and b!1196498 res!795794) b!1196494))

(assert (= (and b!1196494 res!795788) b!1196492))

(assert (= (and b!1196492 res!795793) b!1196504))

(assert (= (and b!1196504 res!795786) b!1196499))

(assert (= (and b!1196493 condMapEmpty!47270) mapIsEmpty!47270))

(assert (= (and b!1196493 (not condMapEmpty!47270)) mapNonEmpty!47270))

(get-info :version)

(assert (= (and mapNonEmpty!47270 ((_ is ValueCellFull!14435) mapValue!47270)) b!1196497))

(assert (= (and b!1196493 ((_ is ValueCellFull!14435) mapDefault!47270)) b!1196502))

(assert (= start!100458 b!1196493))

(declare-fun m!1104423 () Bool)

(assert (=> b!1196494 m!1104423))

(declare-fun m!1104425 () Bool)

(assert (=> b!1196503 m!1104425))

(declare-fun m!1104427 () Bool)

(assert (=> b!1196498 m!1104427))

(declare-fun m!1104429 () Bool)

(assert (=> b!1196499 m!1104429))

(declare-fun m!1104431 () Bool)

(assert (=> b!1196499 m!1104431))

(declare-fun m!1104433 () Bool)

(assert (=> b!1196492 m!1104433))

(declare-fun m!1104435 () Bool)

(assert (=> b!1196492 m!1104435))

(declare-fun m!1104437 () Bool)

(assert (=> b!1196504 m!1104437))

(declare-fun m!1104439 () Bool)

(assert (=> mapNonEmpty!47270 m!1104439))

(declare-fun m!1104441 () Bool)

(assert (=> start!100458 m!1104441))

(declare-fun m!1104443 () Bool)

(assert (=> start!100458 m!1104443))

(declare-fun m!1104445 () Bool)

(assert (=> b!1196500 m!1104445))

(declare-fun m!1104447 () Bool)

(assert (=> b!1196496 m!1104447))

(check-sat (not b!1196496) (not b!1196503) (not b!1196498) (not start!100458) (not b!1196500) (not b!1196504) (not b!1196499) tp_is_empty!30289 (not b!1196492) (not mapNonEmpty!47270))
(check-sat)
