; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77652 () Bool)

(assert start!77652)

(declare-fun b_free!16255 () Bool)

(declare-fun b_next!16255 () Bool)

(assert (=> start!77652 (= b_free!16255 (not b_next!16255))))

(declare-fun tp!57028 () Bool)

(declare-fun b_and!26637 () Bool)

(assert (=> start!77652 (= tp!57028 b_and!26637)))

(declare-fun b!905499 () Bool)

(declare-fun res!611104 () Bool)

(declare-fun e!507406 () Bool)

(assert (=> b!905499 (=> (not res!611104) (not e!507406))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905499 (= res!611104 (inRange!0 i!717 mask!1756))))

(declare-fun b!905500 () Bool)

(declare-fun e!507412 () Bool)

(declare-fun e!507409 () Bool)

(assert (=> b!905500 (= e!507412 e!507409)))

(declare-fun res!611103 () Bool)

(assert (=> b!905500 (=> res!611103 e!507409)))

(declare-datatypes ((V!29863 0))(
  ( (V!29864 (val!9387 Int)) )
))
(declare-datatypes ((tuple2!12230 0))(
  ( (tuple2!12231 (_1!6126 (_ BitVec 64)) (_2!6126 V!29863)) )
))
(declare-datatypes ((List!18025 0))(
  ( (Nil!18022) (Cons!18021 (h!19167 tuple2!12230) (t!25443 List!18025)) )
))
(declare-datatypes ((ListLongMap!10917 0))(
  ( (ListLongMap!10918 (toList!5474 List!18025)) )
))
(declare-fun lt!408427 () ListLongMap!10917)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4482 (ListLongMap!10917 (_ BitVec 64)) Bool)

(assert (=> b!905500 (= res!611103 (not (contains!4482 lt!408427 k0!1033)))))

(declare-datatypes ((ValueCell!8855 0))(
  ( (ValueCellFull!8855 (v!11891 V!29863)) (EmptyCell!8855) )
))
(declare-datatypes ((array!53367 0))(
  ( (array!53368 (arr!25643 (Array (_ BitVec 32) ValueCell!8855)) (size!26104 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53367)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29863)

(declare-datatypes ((array!53369 0))(
  ( (array!53370 (arr!25644 (Array (_ BitVec 32) (_ BitVec 64))) (size!26105 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53369)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29863)

(declare-fun getCurrentListMap!2686 (array!53369 array!53367 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 32) Int) ListLongMap!10917)

(assert (=> b!905500 (= lt!408427 (getCurrentListMap!2686 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29722 () Bool)

(declare-fun mapRes!29722 () Bool)

(declare-fun tp!57027 () Bool)

(declare-fun e!507411 () Bool)

(assert (=> mapNonEmpty!29722 (= mapRes!29722 (and tp!57027 e!507411))))

(declare-fun mapRest!29722 () (Array (_ BitVec 32) ValueCell!8855))

(declare-fun mapKey!29722 () (_ BitVec 32))

(declare-fun mapValue!29722 () ValueCell!8855)

(assert (=> mapNonEmpty!29722 (= (arr!25643 _values!1152) (store mapRest!29722 mapKey!29722 mapValue!29722))))

(declare-fun res!611108 () Bool)

(declare-fun e!507413 () Bool)

(assert (=> start!77652 (=> (not res!611108) (not e!507413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77652 (= res!611108 (validMask!0 mask!1756))))

(assert (=> start!77652 e!507413))

(declare-fun e!507408 () Bool)

(declare-fun array_inv!20136 (array!53367) Bool)

(assert (=> start!77652 (and (array_inv!20136 _values!1152) e!507408)))

(assert (=> start!77652 tp!57028))

(assert (=> start!77652 true))

(declare-fun tp_is_empty!18673 () Bool)

(assert (=> start!77652 tp_is_empty!18673))

(declare-fun array_inv!20137 (array!53369) Bool)

(assert (=> start!77652 (array_inv!20137 _keys!1386)))

(declare-fun mapIsEmpty!29722 () Bool)

(assert (=> mapIsEmpty!29722 mapRes!29722))

(declare-fun b!905501 () Bool)

(assert (=> b!905501 (= e!507413 e!507406)))

(declare-fun res!611109 () Bool)

(assert (=> b!905501 (=> (not res!611109) (not e!507406))))

(declare-fun lt!408430 () ListLongMap!10917)

(assert (=> b!905501 (= res!611109 (contains!4482 lt!408430 k0!1033))))

(assert (=> b!905501 (= lt!408430 (getCurrentListMap!2686 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905502 () Bool)

(declare-fun res!611101 () Bool)

(assert (=> b!905502 (=> res!611101 e!507409)))

(declare-fun lt!408429 () V!29863)

(declare-fun apply!454 (ListLongMap!10917 (_ BitVec 64)) V!29863)

(assert (=> b!905502 (= res!611101 (not (= (apply!454 lt!408427 k0!1033) lt!408429)))))

(declare-fun b!905503 () Bool)

(assert (=> b!905503 (= e!507409 true)))

(assert (=> b!905503 (= (apply!454 lt!408430 k0!1033) lt!408429)))

(declare-datatypes ((Unit!30656 0))(
  ( (Unit!30657) )
))
(declare-fun lt!408426 () Unit!30656)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!17 (array!53369 array!53367 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 64) V!29863 (_ BitVec 32) Int) Unit!30656)

(assert (=> b!905503 (= lt!408426 (lemmaListMapApplyFromThenApplyFromZero!17 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408429 i!717 defaultEntry!1160))))

(declare-fun b!905504 () Bool)

(declare-fun res!611102 () Bool)

(assert (=> b!905504 (=> (not res!611102) (not e!507413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53369 (_ BitVec 32)) Bool)

(assert (=> b!905504 (= res!611102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905505 () Bool)

(declare-fun res!611100 () Bool)

(assert (=> b!905505 (=> (not res!611100) (not e!507413))))

(assert (=> b!905505 (= res!611100 (and (= (size!26104 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26105 _keys!1386) (size!26104 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905506 () Bool)

(declare-fun res!611105 () Bool)

(assert (=> b!905506 (=> (not res!611105) (not e!507413))))

(declare-datatypes ((List!18026 0))(
  ( (Nil!18023) (Cons!18022 (h!19168 (_ BitVec 64)) (t!25444 List!18026)) )
))
(declare-fun arrayNoDuplicates!0 (array!53369 (_ BitVec 32) List!18026) Bool)

(assert (=> b!905506 (= res!611105 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18023))))

(declare-fun b!905507 () Bool)

(declare-fun e!507410 () Bool)

(assert (=> b!905507 (= e!507410 tp_is_empty!18673)))

(declare-fun b!905508 () Bool)

(assert (=> b!905508 (= e!507411 tp_is_empty!18673)))

(declare-fun b!905509 () Bool)

(declare-fun res!611106 () Bool)

(assert (=> b!905509 (=> (not res!611106) (not e!507406))))

(assert (=> b!905509 (= res!611106 (and (= (select (arr!25644 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905510 () Bool)

(assert (=> b!905510 (= e!507408 (and e!507410 mapRes!29722))))

(declare-fun condMapEmpty!29722 () Bool)

(declare-fun mapDefault!29722 () ValueCell!8855)

(assert (=> b!905510 (= condMapEmpty!29722 (= (arr!25643 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8855)) mapDefault!29722)))))

(declare-fun b!905511 () Bool)

(assert (=> b!905511 (= e!507406 (not e!507412))))

(declare-fun res!611107 () Bool)

(assert (=> b!905511 (=> res!611107 e!507412)))

(assert (=> b!905511 (= res!611107 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26105 _keys!1386))))))

(declare-fun get!13482 (ValueCell!8855 V!29863) V!29863)

(declare-fun dynLambda!1331 (Int (_ BitVec 64)) V!29863)

(assert (=> b!905511 (= lt!408429 (get!13482 (select (arr!25643 _values!1152) i!717) (dynLambda!1331 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905511 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408428 () Unit!30656)

(declare-fun lemmaKeyInListMapIsInArray!207 (array!53369 array!53367 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 64) Int) Unit!30656)

(assert (=> b!905511 (= lt!408428 (lemmaKeyInListMapIsInArray!207 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77652 res!611108) b!905505))

(assert (= (and b!905505 res!611100) b!905504))

(assert (= (and b!905504 res!611102) b!905506))

(assert (= (and b!905506 res!611105) b!905501))

(assert (= (and b!905501 res!611109) b!905499))

(assert (= (and b!905499 res!611104) b!905509))

(assert (= (and b!905509 res!611106) b!905511))

(assert (= (and b!905511 (not res!611107)) b!905500))

(assert (= (and b!905500 (not res!611103)) b!905502))

(assert (= (and b!905502 (not res!611101)) b!905503))

(assert (= (and b!905510 condMapEmpty!29722) mapIsEmpty!29722))

(assert (= (and b!905510 (not condMapEmpty!29722)) mapNonEmpty!29722))

(get-info :version)

(assert (= (and mapNonEmpty!29722 ((_ is ValueCellFull!8855) mapValue!29722)) b!905508))

(assert (= (and b!905510 ((_ is ValueCellFull!8855) mapDefault!29722)) b!905507))

(assert (= start!77652 b!905510))

(declare-fun b_lambda!13111 () Bool)

(assert (=> (not b_lambda!13111) (not b!905511)))

(declare-fun t!25442 () Bool)

(declare-fun tb!5269 () Bool)

(assert (=> (and start!77652 (= defaultEntry!1160 defaultEntry!1160) t!25442) tb!5269))

(declare-fun result!10341 () Bool)

(assert (=> tb!5269 (= result!10341 tp_is_empty!18673)))

(assert (=> b!905511 t!25442))

(declare-fun b_and!26639 () Bool)

(assert (= b_and!26637 (and (=> t!25442 result!10341) b_and!26639)))

(declare-fun m!840377 () Bool)

(assert (=> b!905503 m!840377))

(declare-fun m!840379 () Bool)

(assert (=> b!905503 m!840379))

(declare-fun m!840381 () Bool)

(assert (=> mapNonEmpty!29722 m!840381))

(declare-fun m!840383 () Bool)

(assert (=> b!905506 m!840383))

(declare-fun m!840385 () Bool)

(assert (=> b!905504 m!840385))

(declare-fun m!840387 () Bool)

(assert (=> start!77652 m!840387))

(declare-fun m!840389 () Bool)

(assert (=> start!77652 m!840389))

(declare-fun m!840391 () Bool)

(assert (=> start!77652 m!840391))

(declare-fun m!840393 () Bool)

(assert (=> b!905500 m!840393))

(declare-fun m!840395 () Bool)

(assert (=> b!905500 m!840395))

(declare-fun m!840397 () Bool)

(assert (=> b!905509 m!840397))

(declare-fun m!840399 () Bool)

(assert (=> b!905499 m!840399))

(declare-fun m!840401 () Bool)

(assert (=> b!905501 m!840401))

(declare-fun m!840403 () Bool)

(assert (=> b!905501 m!840403))

(declare-fun m!840405 () Bool)

(assert (=> b!905502 m!840405))

(declare-fun m!840407 () Bool)

(assert (=> b!905511 m!840407))

(declare-fun m!840409 () Bool)

(assert (=> b!905511 m!840409))

(declare-fun m!840411 () Bool)

(assert (=> b!905511 m!840411))

(declare-fun m!840413 () Bool)

(assert (=> b!905511 m!840413))

(assert (=> b!905511 m!840407))

(assert (=> b!905511 m!840411))

(declare-fun m!840415 () Bool)

(assert (=> b!905511 m!840415))

(check-sat (not mapNonEmpty!29722) (not b!905504) (not b!905503) (not b_lambda!13111) (not b!905502) (not b_next!16255) (not b!905506) tp_is_empty!18673 (not b!905499) (not b!905501) (not b!905500) (not start!77652) (not b!905511) b_and!26639)
(check-sat b_and!26639 (not b_next!16255))
