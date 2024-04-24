; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97750 () Bool)

(assert start!97750)

(declare-fun b!1114588 () Bool)

(declare-fun res!743517 () Bool)

(declare-fun e!635479 () Bool)

(assert (=> b!1114588 (=> (not res!743517) (not e!635479))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72437 0))(
  ( (array!72438 (arr!34865 (Array (_ BitVec 32) (_ BitVec 64))) (size!35402 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72437)

(assert (=> b!1114588 (= res!743517 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35402 _keys!1208))))))

(declare-fun b!1114589 () Bool)

(declare-fun res!743518 () Bool)

(assert (=> b!1114589 (=> (not res!743518) (not e!635479))))

(declare-datatypes ((List!24326 0))(
  ( (Nil!24323) (Cons!24322 (h!25540 (_ BitVec 64)) (t!34799 List!24326)) )
))
(declare-fun arrayNoDuplicates!0 (array!72437 (_ BitVec 32) List!24326) Bool)

(assert (=> b!1114589 (= res!743518 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24323))))

(declare-fun b!1114590 () Bool)

(declare-fun e!635482 () Bool)

(declare-fun e!635480 () Bool)

(declare-fun mapRes!43435 () Bool)

(assert (=> b!1114590 (= e!635482 (and e!635480 mapRes!43435))))

(declare-fun condMapEmpty!43435 () Bool)

(declare-datatypes ((V!42121 0))(
  ( (V!42122 (val!13929 Int)) )
))
(declare-datatypes ((ValueCell!13163 0))(
  ( (ValueCellFull!13163 (v!16558 V!42121)) (EmptyCell!13163) )
))
(declare-datatypes ((array!72439 0))(
  ( (array!72440 (arr!34866 (Array (_ BitVec 32) ValueCell!13163)) (size!35403 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72439)

(declare-fun mapDefault!43435 () ValueCell!13163)

(assert (=> b!1114590 (= condMapEmpty!43435 (= (arr!34866 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13163)) mapDefault!43435)))))

(declare-fun b!1114591 () Bool)

(declare-fun tp_is_empty!27745 () Bool)

(assert (=> b!1114591 (= e!635480 tp_is_empty!27745)))

(declare-fun b!1114592 () Bool)

(declare-fun e!635481 () Bool)

(assert (=> b!1114592 (= e!635479 e!635481)))

(declare-fun res!743521 () Bool)

(assert (=> b!1114592 (=> (not res!743521) (not e!635481))))

(declare-fun lt!497160 () array!72437)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72437 (_ BitVec 32)) Bool)

(assert (=> b!1114592 (= res!743521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497160 mask!1564))))

(assert (=> b!1114592 (= lt!497160 (array!72438 (store (arr!34865 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35402 _keys!1208)))))

(declare-fun b!1114593 () Bool)

(declare-fun res!743515 () Bool)

(assert (=> b!1114593 (=> (not res!743515) (not e!635479))))

(assert (=> b!1114593 (= res!743515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43435 () Bool)

(declare-fun tp!82679 () Bool)

(declare-fun e!635484 () Bool)

(assert (=> mapNonEmpty!43435 (= mapRes!43435 (and tp!82679 e!635484))))

(declare-fun mapValue!43435 () ValueCell!13163)

(declare-fun mapKey!43435 () (_ BitVec 32))

(declare-fun mapRest!43435 () (Array (_ BitVec 32) ValueCell!13163))

(assert (=> mapNonEmpty!43435 (= (arr!34866 _values!996) (store mapRest!43435 mapKey!43435 mapValue!43435))))

(declare-fun b!1114594 () Bool)

(declare-fun res!743516 () Bool)

(assert (=> b!1114594 (=> (not res!743516) (not e!635479))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114594 (= res!743516 (= (select (arr!34865 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43435 () Bool)

(assert (=> mapIsEmpty!43435 mapRes!43435))

(declare-fun b!1114596 () Bool)

(declare-fun res!743519 () Bool)

(assert (=> b!1114596 (=> (not res!743519) (not e!635479))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114596 (= res!743519 (and (= (size!35403 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35402 _keys!1208) (size!35403 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114597 () Bool)

(assert (=> b!1114597 (= e!635484 tp_is_empty!27745)))

(declare-fun b!1114598 () Bool)

(assert (=> b!1114598 (= e!635481 (not true))))

(declare-fun arrayContainsKey!0 (array!72437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114598 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36511 0))(
  ( (Unit!36512) )
))
(declare-fun lt!497161 () Unit!36511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72437 (_ BitVec 64) (_ BitVec 32)) Unit!36511)

(assert (=> b!1114598 (= lt!497161 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!743520 () Bool)

(assert (=> start!97750 (=> (not res!743520) (not e!635479))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97750 (= res!743520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35402 _keys!1208))))))

(assert (=> start!97750 e!635479))

(declare-fun array_inv!26864 (array!72437) Bool)

(assert (=> start!97750 (array_inv!26864 _keys!1208)))

(assert (=> start!97750 true))

(declare-fun array_inv!26865 (array!72439) Bool)

(assert (=> start!97750 (and (array_inv!26865 _values!996) e!635482)))

(declare-fun b!1114595 () Bool)

(declare-fun res!743523 () Bool)

(assert (=> b!1114595 (=> (not res!743523) (not e!635479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114595 (= res!743523 (validKeyInArray!0 k0!934))))

(declare-fun b!1114599 () Bool)

(declare-fun res!743524 () Bool)

(assert (=> b!1114599 (=> (not res!743524) (not e!635481))))

(assert (=> b!1114599 (= res!743524 (arrayNoDuplicates!0 lt!497160 #b00000000000000000000000000000000 Nil!24323))))

(declare-fun b!1114600 () Bool)

(declare-fun res!743522 () Bool)

(assert (=> b!1114600 (=> (not res!743522) (not e!635479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114600 (= res!743522 (validMask!0 mask!1564))))

(assert (= (and start!97750 res!743520) b!1114600))

(assert (= (and b!1114600 res!743522) b!1114596))

(assert (= (and b!1114596 res!743519) b!1114593))

(assert (= (and b!1114593 res!743515) b!1114589))

(assert (= (and b!1114589 res!743518) b!1114588))

(assert (= (and b!1114588 res!743517) b!1114595))

(assert (= (and b!1114595 res!743523) b!1114594))

(assert (= (and b!1114594 res!743516) b!1114592))

(assert (= (and b!1114592 res!743521) b!1114599))

(assert (= (and b!1114599 res!743524) b!1114598))

(assert (= (and b!1114590 condMapEmpty!43435) mapIsEmpty!43435))

(assert (= (and b!1114590 (not condMapEmpty!43435)) mapNonEmpty!43435))

(get-info :version)

(assert (= (and mapNonEmpty!43435 ((_ is ValueCellFull!13163) mapValue!43435)) b!1114597))

(assert (= (and b!1114590 ((_ is ValueCellFull!13163) mapDefault!43435)) b!1114591))

(assert (= start!97750 b!1114590))

(declare-fun m!1032201 () Bool)

(assert (=> b!1114594 m!1032201))

(declare-fun m!1032203 () Bool)

(assert (=> start!97750 m!1032203))

(declare-fun m!1032205 () Bool)

(assert (=> start!97750 m!1032205))

(declare-fun m!1032207 () Bool)

(assert (=> b!1114599 m!1032207))

(declare-fun m!1032209 () Bool)

(assert (=> b!1114598 m!1032209))

(declare-fun m!1032211 () Bool)

(assert (=> b!1114598 m!1032211))

(declare-fun m!1032213 () Bool)

(assert (=> b!1114592 m!1032213))

(declare-fun m!1032215 () Bool)

(assert (=> b!1114592 m!1032215))

(declare-fun m!1032217 () Bool)

(assert (=> b!1114589 m!1032217))

(declare-fun m!1032219 () Bool)

(assert (=> b!1114593 m!1032219))

(declare-fun m!1032221 () Bool)

(assert (=> b!1114595 m!1032221))

(declare-fun m!1032223 () Bool)

(assert (=> b!1114600 m!1032223))

(declare-fun m!1032225 () Bool)

(assert (=> mapNonEmpty!43435 m!1032225))

(check-sat (not b!1114598) (not b!1114600) (not b!1114589) tp_is_empty!27745 (not b!1114599) (not start!97750) (not b!1114593) (not b!1114595) (not mapNonEmpty!43435) (not b!1114592))
(check-sat)
