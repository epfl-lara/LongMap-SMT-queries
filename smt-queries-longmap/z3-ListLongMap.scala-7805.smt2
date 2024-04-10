; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97576 () Bool)

(assert start!97576)

(declare-fun b!1114470 () Bool)

(declare-fun e!635183 () Bool)

(declare-fun tp_is_empty!27807 () Bool)

(assert (=> b!1114470 (= e!635183 tp_is_empty!27807)))

(declare-fun mapIsEmpty!43528 () Bool)

(declare-fun mapRes!43528 () Bool)

(assert (=> mapIsEmpty!43528 mapRes!43528))

(declare-fun b!1114471 () Bool)

(declare-fun res!743930 () Bool)

(declare-fun e!635186 () Bool)

(assert (=> b!1114471 (=> (not res!743930) (not e!635186))))

(declare-datatypes ((array!72521 0))(
  ( (array!72522 (arr!34913 (Array (_ BitVec 32) (_ BitVec 64))) (size!35449 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72521)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114471 (= res!743930 (= (select (arr!34913 _keys!1208) i!673) k0!934))))

(declare-fun b!1114472 () Bool)

(declare-fun res!743931 () Bool)

(assert (=> b!1114472 (=> (not res!743931) (not e!635186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114472 (= res!743931 (validKeyInArray!0 k0!934))))

(declare-fun b!1114473 () Bool)

(declare-fun res!743928 () Bool)

(assert (=> b!1114473 (=> (not res!743928) (not e!635186))))

(assert (=> b!1114473 (= res!743928 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35449 _keys!1208))))))

(declare-fun b!1114474 () Bool)

(declare-fun e!635187 () Bool)

(assert (=> b!1114474 (= e!635186 e!635187)))

(declare-fun res!743924 () Bool)

(assert (=> b!1114474 (=> (not res!743924) (not e!635187))))

(declare-fun lt!496831 () array!72521)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72521 (_ BitVec 32)) Bool)

(assert (=> b!1114474 (= res!743924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496831 mask!1564))))

(assert (=> b!1114474 (= lt!496831 (array!72522 (store (arr!34913 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35449 _keys!1208)))))

(declare-fun b!1114475 () Bool)

(declare-fun res!743926 () Bool)

(assert (=> b!1114475 (=> (not res!743926) (not e!635187))))

(declare-datatypes ((List!24330 0))(
  ( (Nil!24327) (Cons!24326 (h!25535 (_ BitVec 64)) (t!34811 List!24330)) )
))
(declare-fun arrayNoDuplicates!0 (array!72521 (_ BitVec 32) List!24330) Bool)

(assert (=> b!1114475 (= res!743926 (arrayNoDuplicates!0 lt!496831 #b00000000000000000000000000000000 Nil!24327))))

(declare-fun b!1114476 () Bool)

(declare-fun res!743925 () Bool)

(assert (=> b!1114476 (=> (not res!743925) (not e!635186))))

(assert (=> b!1114476 (= res!743925 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24327))))

(declare-fun b!1114477 () Bool)

(declare-fun e!635184 () Bool)

(assert (=> b!1114477 (= e!635184 tp_is_empty!27807)))

(declare-fun b!1114478 () Bool)

(declare-fun res!743927 () Bool)

(assert (=> b!1114478 (=> (not res!743927) (not e!635186))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42203 0))(
  ( (V!42204 (val!13960 Int)) )
))
(declare-datatypes ((ValueCell!13194 0))(
  ( (ValueCellFull!13194 (v!16593 V!42203)) (EmptyCell!13194) )
))
(declare-datatypes ((array!72523 0))(
  ( (array!72524 (arr!34914 (Array (_ BitVec 32) ValueCell!13194)) (size!35450 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72523)

(assert (=> b!1114478 (= res!743927 (and (= (size!35450 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35449 _keys!1208) (size!35450 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!743932 () Bool)

(assert (=> start!97576 (=> (not res!743932) (not e!635186))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97576 (= res!743932 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35449 _keys!1208))))))

(assert (=> start!97576 e!635186))

(declare-fun array_inv!26838 (array!72521) Bool)

(assert (=> start!97576 (array_inv!26838 _keys!1208)))

(assert (=> start!97576 true))

(declare-fun e!635185 () Bool)

(declare-fun array_inv!26839 (array!72523) Bool)

(assert (=> start!97576 (and (array_inv!26839 _values!996) e!635185)))

(declare-fun mapNonEmpty!43528 () Bool)

(declare-fun tp!82772 () Bool)

(assert (=> mapNonEmpty!43528 (= mapRes!43528 (and tp!82772 e!635184))))

(declare-fun mapValue!43528 () ValueCell!13194)

(declare-fun mapRest!43528 () (Array (_ BitVec 32) ValueCell!13194))

(declare-fun mapKey!43528 () (_ BitVec 32))

(assert (=> mapNonEmpty!43528 (= (arr!34914 _values!996) (store mapRest!43528 mapKey!43528 mapValue!43528))))

(declare-fun b!1114479 () Bool)

(assert (=> b!1114479 (= e!635185 (and e!635183 mapRes!43528))))

(declare-fun condMapEmpty!43528 () Bool)

(declare-fun mapDefault!43528 () ValueCell!13194)

(assert (=> b!1114479 (= condMapEmpty!43528 (= (arr!34914 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13194)) mapDefault!43528)))))

(declare-fun b!1114480 () Bool)

(declare-fun res!743929 () Bool)

(assert (=> b!1114480 (=> (not res!743929) (not e!635186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114480 (= res!743929 (validMask!0 mask!1564))))

(declare-fun b!1114481 () Bool)

(assert (=> b!1114481 (= e!635187 (not true))))

(declare-fun arrayContainsKey!0 (array!72521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114481 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36578 0))(
  ( (Unit!36579) )
))
(declare-fun lt!496832 () Unit!36578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72521 (_ BitVec 64) (_ BitVec 32)) Unit!36578)

(assert (=> b!1114481 (= lt!496832 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114482 () Bool)

(declare-fun res!743923 () Bool)

(assert (=> b!1114482 (=> (not res!743923) (not e!635186))))

(assert (=> b!1114482 (= res!743923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97576 res!743932) b!1114480))

(assert (= (and b!1114480 res!743929) b!1114478))

(assert (= (and b!1114478 res!743927) b!1114482))

(assert (= (and b!1114482 res!743923) b!1114476))

(assert (= (and b!1114476 res!743925) b!1114473))

(assert (= (and b!1114473 res!743928) b!1114472))

(assert (= (and b!1114472 res!743931) b!1114471))

(assert (= (and b!1114471 res!743930) b!1114474))

(assert (= (and b!1114474 res!743924) b!1114475))

(assert (= (and b!1114475 res!743926) b!1114481))

(assert (= (and b!1114479 condMapEmpty!43528) mapIsEmpty!43528))

(assert (= (and b!1114479 (not condMapEmpty!43528)) mapNonEmpty!43528))

(get-info :version)

(assert (= (and mapNonEmpty!43528 ((_ is ValueCellFull!13194) mapValue!43528)) b!1114477))

(assert (= (and b!1114479 ((_ is ValueCellFull!13194) mapDefault!43528)) b!1114470))

(assert (= start!97576 b!1114479))

(declare-fun m!1031335 () Bool)

(assert (=> b!1114476 m!1031335))

(declare-fun m!1031337 () Bool)

(assert (=> b!1114480 m!1031337))

(declare-fun m!1031339 () Bool)

(assert (=> b!1114471 m!1031339))

(declare-fun m!1031341 () Bool)

(assert (=> mapNonEmpty!43528 m!1031341))

(declare-fun m!1031343 () Bool)

(assert (=> b!1114475 m!1031343))

(declare-fun m!1031345 () Bool)

(assert (=> b!1114474 m!1031345))

(declare-fun m!1031347 () Bool)

(assert (=> b!1114474 m!1031347))

(declare-fun m!1031349 () Bool)

(assert (=> start!97576 m!1031349))

(declare-fun m!1031351 () Bool)

(assert (=> start!97576 m!1031351))

(declare-fun m!1031353 () Bool)

(assert (=> b!1114482 m!1031353))

(declare-fun m!1031355 () Bool)

(assert (=> b!1114472 m!1031355))

(declare-fun m!1031357 () Bool)

(assert (=> b!1114481 m!1031357))

(declare-fun m!1031359 () Bool)

(assert (=> b!1114481 m!1031359))

(check-sat (not b!1114475) (not b!1114474) (not b!1114472) (not b!1114481) (not b!1114482) (not b!1114480) tp_is_empty!27807 (not start!97576) (not mapNonEmpty!43528) (not b!1114476))
(check-sat)
