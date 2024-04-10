; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100238 () Bool)

(assert start!100238)

(declare-fun b!1195515 () Bool)

(declare-fun res!795524 () Bool)

(declare-fun e!679345 () Bool)

(assert (=> b!1195515 (=> (not res!795524) (not e!679345))))

(declare-datatypes ((array!77391 0))(
  ( (array!77392 (arr!37342 (Array (_ BitVec 32) (_ BitVec 64))) (size!37878 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77391)

(declare-datatypes ((List!26281 0))(
  ( (Nil!26278) (Cons!26277 (h!27486 (_ BitVec 64)) (t!38952 List!26281)) )
))
(declare-fun arrayNoDuplicates!0 (array!77391 (_ BitVec 32) List!26281) Bool)

(assert (=> b!1195515 (= res!795524 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26278))))

(declare-fun b!1195516 () Bool)

(declare-fun res!795526 () Bool)

(assert (=> b!1195516 (=> (not res!795526) (not e!679345))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195516 (= res!795526 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37878 _keys!1208))))))

(declare-fun b!1195517 () Bool)

(declare-fun res!795520 () Bool)

(assert (=> b!1195517 (=> (not res!795520) (not e!679345))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195517 (= res!795520 (validKeyInArray!0 k!934))))

(declare-fun b!1195518 () Bool)

(declare-fun res!795521 () Bool)

(assert (=> b!1195518 (=> (not res!795521) (not e!679345))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77391 (_ BitVec 32)) Bool)

(assert (=> b!1195518 (= res!795521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195519 () Bool)

(declare-fun res!795523 () Bool)

(assert (=> b!1195519 (=> (not res!795523) (not e!679345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195519 (= res!795523 (validMask!0 mask!1564))))

(declare-fun b!1195520 () Bool)

(declare-fun e!679343 () Bool)

(declare-fun tp_is_empty!30305 () Bool)

(assert (=> b!1195520 (= e!679343 tp_is_empty!30305)))

(declare-fun res!795525 () Bool)

(assert (=> start!100238 (=> (not res!795525) (not e!679345))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100238 (= res!795525 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37878 _keys!1208))))))

(assert (=> start!100238 e!679345))

(declare-fun array_inv!28462 (array!77391) Bool)

(assert (=> start!100238 (array_inv!28462 _keys!1208)))

(assert (=> start!100238 true))

(declare-datatypes ((V!45533 0))(
  ( (V!45534 (val!15209 Int)) )
))
(declare-datatypes ((ValueCell!14443 0))(
  ( (ValueCellFull!14443 (v!17847 V!45533)) (EmptyCell!14443) )
))
(declare-datatypes ((array!77393 0))(
  ( (array!77394 (arr!37343 (Array (_ BitVec 32) ValueCell!14443)) (size!37879 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77393)

(declare-fun e!679341 () Bool)

(declare-fun array_inv!28463 (array!77393) Bool)

(assert (=> start!100238 (and (array_inv!28463 _values!996) e!679341)))

(declare-fun mapIsEmpty!47294 () Bool)

(declare-fun mapRes!47294 () Bool)

(assert (=> mapIsEmpty!47294 mapRes!47294))

(declare-fun b!1195521 () Bool)

(declare-fun e!679344 () Bool)

(assert (=> b!1195521 (= e!679345 e!679344)))

(declare-fun res!795522 () Bool)

(assert (=> b!1195521 (=> (not res!795522) (not e!679344))))

(declare-fun lt!542940 () array!77391)

(assert (=> b!1195521 (= res!795522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542940 mask!1564))))

(assert (=> b!1195521 (= lt!542940 (array!77392 (store (arr!37342 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37878 _keys!1208)))))

(declare-fun b!1195522 () Bool)

(declare-fun e!679342 () Bool)

(assert (=> b!1195522 (= e!679342 tp_is_empty!30305)))

(declare-fun b!1195523 () Bool)

(declare-fun res!795518 () Bool)

(assert (=> b!1195523 (=> (not res!795518) (not e!679344))))

(assert (=> b!1195523 (= res!795518 (arrayNoDuplicates!0 lt!542940 #b00000000000000000000000000000000 Nil!26278))))

(declare-fun b!1195524 () Bool)

(declare-fun res!795517 () Bool)

(assert (=> b!1195524 (=> (not res!795517) (not e!679345))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195524 (= res!795517 (and (= (size!37879 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37878 _keys!1208) (size!37879 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47294 () Bool)

(declare-fun tp!89904 () Bool)

(assert (=> mapNonEmpty!47294 (= mapRes!47294 (and tp!89904 e!679343))))

(declare-fun mapValue!47294 () ValueCell!14443)

(declare-fun mapRest!47294 () (Array (_ BitVec 32) ValueCell!14443))

(declare-fun mapKey!47294 () (_ BitVec 32))

(assert (=> mapNonEmpty!47294 (= (arr!37343 _values!996) (store mapRest!47294 mapKey!47294 mapValue!47294))))

(declare-fun b!1195525 () Bool)

(declare-fun res!795519 () Bool)

(assert (=> b!1195525 (=> (not res!795519) (not e!679345))))

(assert (=> b!1195525 (= res!795519 (= (select (arr!37342 _keys!1208) i!673) k!934))))

(declare-fun b!1195526 () Bool)

(assert (=> b!1195526 (= e!679341 (and e!679342 mapRes!47294))))

(declare-fun condMapEmpty!47294 () Bool)

(declare-fun mapDefault!47294 () ValueCell!14443)

