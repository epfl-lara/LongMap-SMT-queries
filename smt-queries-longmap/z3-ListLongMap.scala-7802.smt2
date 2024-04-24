; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97792 () Bool)

(assert start!97792)

(declare-fun b!1115407 () Bool)

(declare-fun res!744152 () Bool)

(declare-fun e!635860 () Bool)

(assert (=> b!1115407 (=> (not res!744152) (not e!635860))))

(declare-datatypes ((array!72515 0))(
  ( (array!72516 (arr!34904 (Array (_ BitVec 32) (_ BitVec 64))) (size!35441 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72515)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42177 0))(
  ( (V!42178 (val!13950 Int)) )
))
(declare-datatypes ((ValueCell!13184 0))(
  ( (ValueCellFull!13184 (v!16579 V!42177)) (EmptyCell!13184) )
))
(declare-datatypes ((array!72517 0))(
  ( (array!72518 (arr!34905 (Array (_ BitVec 32) ValueCell!13184)) (size!35442 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72517)

(assert (=> b!1115407 (= res!744152 (and (= (size!35442 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35441 _keys!1208) (size!35442 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!744150 () Bool)

(assert (=> start!97792 (=> (not res!744150) (not e!635860))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97792 (= res!744150 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35441 _keys!1208))))))

(assert (=> start!97792 e!635860))

(declare-fun array_inv!26898 (array!72515) Bool)

(assert (=> start!97792 (array_inv!26898 _keys!1208)))

(assert (=> start!97792 true))

(declare-fun e!635858 () Bool)

(declare-fun array_inv!26899 (array!72517) Bool)

(assert (=> start!97792 (and (array_inv!26899 _values!996) e!635858)))

(declare-fun b!1115408 () Bool)

(declare-fun res!744146 () Bool)

(assert (=> b!1115408 (=> (not res!744146) (not e!635860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72515 (_ BitVec 32)) Bool)

(assert (=> b!1115408 (= res!744146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115409 () Bool)

(declare-fun res!744148 () Bool)

(declare-fun e!635861 () Bool)

(assert (=> b!1115409 (=> (not res!744148) (not e!635861))))

(declare-fun lt!497287 () array!72515)

(declare-datatypes ((List!24338 0))(
  ( (Nil!24335) (Cons!24334 (h!25552 (_ BitVec 64)) (t!34811 List!24338)) )
))
(declare-fun arrayNoDuplicates!0 (array!72515 (_ BitVec 32) List!24338) Bool)

(assert (=> b!1115409 (= res!744148 (arrayNoDuplicates!0 lt!497287 #b00000000000000000000000000000000 Nil!24335))))

(declare-fun b!1115410 () Bool)

(declare-fun e!635857 () Bool)

(declare-fun mapRes!43498 () Bool)

(assert (=> b!1115410 (= e!635858 (and e!635857 mapRes!43498))))

(declare-fun condMapEmpty!43498 () Bool)

(declare-fun mapDefault!43498 () ValueCell!13184)

(assert (=> b!1115410 (= condMapEmpty!43498 (= (arr!34905 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13184)) mapDefault!43498)))))

(declare-fun b!1115411 () Bool)

(declare-fun res!744153 () Bool)

(assert (=> b!1115411 (=> (not res!744153) (not e!635860))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115411 (= res!744153 (= (select (arr!34904 _keys!1208) i!673) k0!934))))

(declare-fun b!1115412 () Bool)

(declare-fun res!744151 () Bool)

(assert (=> b!1115412 (=> (not res!744151) (not e!635860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115412 (= res!744151 (validKeyInArray!0 k0!934))))

(declare-fun b!1115413 () Bool)

(assert (=> b!1115413 (= e!635861 (not true))))

(declare-fun arrayContainsKey!0 (array!72515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115413 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36535 0))(
  ( (Unit!36536) )
))
(declare-fun lt!497286 () Unit!36535)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72515 (_ BitVec 64) (_ BitVec 32)) Unit!36535)

(assert (=> b!1115413 (= lt!497286 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115414 () Bool)

(assert (=> b!1115414 (= e!635860 e!635861)))

(declare-fun res!744149 () Bool)

(assert (=> b!1115414 (=> (not res!744149) (not e!635861))))

(assert (=> b!1115414 (= res!744149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497287 mask!1564))))

(assert (=> b!1115414 (= lt!497287 (array!72516 (store (arr!34904 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35441 _keys!1208)))))

(declare-fun mapNonEmpty!43498 () Bool)

(declare-fun tp!82742 () Bool)

(declare-fun e!635859 () Bool)

(assert (=> mapNonEmpty!43498 (= mapRes!43498 (and tp!82742 e!635859))))

(declare-fun mapValue!43498 () ValueCell!13184)

(declare-fun mapKey!43498 () (_ BitVec 32))

(declare-fun mapRest!43498 () (Array (_ BitVec 32) ValueCell!13184))

(assert (=> mapNonEmpty!43498 (= (arr!34905 _values!996) (store mapRest!43498 mapKey!43498 mapValue!43498))))

(declare-fun b!1115415 () Bool)

(declare-fun res!744147 () Bool)

(assert (=> b!1115415 (=> (not res!744147) (not e!635860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115415 (= res!744147 (validMask!0 mask!1564))))

(declare-fun b!1115416 () Bool)

(declare-fun res!744145 () Bool)

(assert (=> b!1115416 (=> (not res!744145) (not e!635860))))

(assert (=> b!1115416 (= res!744145 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35441 _keys!1208))))))

(declare-fun b!1115417 () Bool)

(declare-fun res!744154 () Bool)

(assert (=> b!1115417 (=> (not res!744154) (not e!635860))))

(assert (=> b!1115417 (= res!744154 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24335))))

(declare-fun b!1115418 () Bool)

(declare-fun tp_is_empty!27787 () Bool)

(assert (=> b!1115418 (= e!635859 tp_is_empty!27787)))

(declare-fun mapIsEmpty!43498 () Bool)

(assert (=> mapIsEmpty!43498 mapRes!43498))

(declare-fun b!1115419 () Bool)

(assert (=> b!1115419 (= e!635857 tp_is_empty!27787)))

(assert (= (and start!97792 res!744150) b!1115415))

(assert (= (and b!1115415 res!744147) b!1115407))

(assert (= (and b!1115407 res!744152) b!1115408))

(assert (= (and b!1115408 res!744146) b!1115417))

(assert (= (and b!1115417 res!744154) b!1115416))

(assert (= (and b!1115416 res!744145) b!1115412))

(assert (= (and b!1115412 res!744151) b!1115411))

(assert (= (and b!1115411 res!744153) b!1115414))

(assert (= (and b!1115414 res!744149) b!1115409))

(assert (= (and b!1115409 res!744148) b!1115413))

(assert (= (and b!1115410 condMapEmpty!43498) mapIsEmpty!43498))

(assert (= (and b!1115410 (not condMapEmpty!43498)) mapNonEmpty!43498))

(get-info :version)

(assert (= (and mapNonEmpty!43498 ((_ is ValueCellFull!13184) mapValue!43498)) b!1115418))

(assert (= (and b!1115410 ((_ is ValueCellFull!13184) mapDefault!43498)) b!1115419))

(assert (= start!97792 b!1115410))

(declare-fun m!1032747 () Bool)

(assert (=> b!1115408 m!1032747))

(declare-fun m!1032749 () Bool)

(assert (=> b!1115409 m!1032749))

(declare-fun m!1032751 () Bool)

(assert (=> b!1115413 m!1032751))

(declare-fun m!1032753 () Bool)

(assert (=> b!1115413 m!1032753))

(declare-fun m!1032755 () Bool)

(assert (=> start!97792 m!1032755))

(declare-fun m!1032757 () Bool)

(assert (=> start!97792 m!1032757))

(declare-fun m!1032759 () Bool)

(assert (=> b!1115414 m!1032759))

(declare-fun m!1032761 () Bool)

(assert (=> b!1115414 m!1032761))

(declare-fun m!1032763 () Bool)

(assert (=> b!1115415 m!1032763))

(declare-fun m!1032765 () Bool)

(assert (=> b!1115412 m!1032765))

(declare-fun m!1032767 () Bool)

(assert (=> b!1115417 m!1032767))

(declare-fun m!1032769 () Bool)

(assert (=> mapNonEmpty!43498 m!1032769))

(declare-fun m!1032771 () Bool)

(assert (=> b!1115411 m!1032771))

(check-sat (not b!1115412) (not start!97792) (not b!1115413) (not mapNonEmpty!43498) (not b!1115409) tp_is_empty!27787 (not b!1115414) (not b!1115408) (not b!1115415) (not b!1115417))
(check-sat)
