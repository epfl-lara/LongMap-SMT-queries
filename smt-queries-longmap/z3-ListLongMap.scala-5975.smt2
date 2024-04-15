; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77658 () Bool)

(assert start!77658)

(declare-fun b_free!16261 () Bool)

(declare-fun b_next!16261 () Bool)

(assert (=> start!77658 (= b_free!16261 (not b_next!16261))))

(declare-fun tp!57045 () Bool)

(declare-fun b_and!26649 () Bool)

(assert (=> start!77658 (= tp!57045 b_and!26649)))

(declare-fun b!905622 () Bool)

(declare-fun e!507485 () Bool)

(declare-fun e!507483 () Bool)

(declare-fun mapRes!29731 () Bool)

(assert (=> b!905622 (= e!507485 (and e!507483 mapRes!29731))))

(declare-fun condMapEmpty!29731 () Bool)

(declare-datatypes ((V!29871 0))(
  ( (V!29872 (val!9390 Int)) )
))
(declare-datatypes ((ValueCell!8858 0))(
  ( (ValueCellFull!8858 (v!11894 V!29871)) (EmptyCell!8858) )
))
(declare-datatypes ((array!53379 0))(
  ( (array!53380 (arr!25649 (Array (_ BitVec 32) ValueCell!8858)) (size!26110 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53379)

(declare-fun mapDefault!29731 () ValueCell!8858)

(assert (=> b!905622 (= condMapEmpty!29731 (= (arr!25649 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8858)) mapDefault!29731)))))

(declare-fun b!905623 () Bool)

(declare-fun e!507484 () Bool)

(declare-fun e!507481 () Bool)

(assert (=> b!905623 (= e!507484 e!507481)))

(declare-fun res!611196 () Bool)

(assert (=> b!905623 (=> (not res!611196) (not e!507481))))

(declare-datatypes ((tuple2!12236 0))(
  ( (tuple2!12237 (_1!6129 (_ BitVec 64)) (_2!6129 V!29871)) )
))
(declare-datatypes ((List!18030 0))(
  ( (Nil!18027) (Cons!18026 (h!19172 tuple2!12236) (t!25454 List!18030)) )
))
(declare-datatypes ((ListLongMap!10923 0))(
  ( (ListLongMap!10924 (toList!5477 List!18030)) )
))
(declare-fun lt!408471 () ListLongMap!10923)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4485 (ListLongMap!10923 (_ BitVec 64)) Bool)

(assert (=> b!905623 (= res!611196 (contains!4485 lt!408471 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29871)

(declare-datatypes ((array!53381 0))(
  ( (array!53382 (arr!25650 (Array (_ BitVec 32) (_ BitVec 64))) (size!26111 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53381)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29871)

(declare-fun getCurrentListMap!2689 (array!53381 array!53379 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 32) Int) ListLongMap!10923)

(assert (=> b!905623 (= lt!408471 (getCurrentListMap!2689 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!29731 () Bool)

(declare-fun tp!57046 () Bool)

(declare-fun e!507480 () Bool)

(assert (=> mapNonEmpty!29731 (= mapRes!29731 (and tp!57046 e!507480))))

(declare-fun mapValue!29731 () ValueCell!8858)

(declare-fun mapRest!29731 () (Array (_ BitVec 32) ValueCell!8858))

(declare-fun mapKey!29731 () (_ BitVec 32))

(assert (=> mapNonEmpty!29731 (= (arr!25649 _values!1152) (store mapRest!29731 mapKey!29731 mapValue!29731))))

(declare-fun b!905624 () Bool)

(declare-fun res!611198 () Bool)

(assert (=> b!905624 (=> (not res!611198) (not e!507484))))

(declare-datatypes ((List!18031 0))(
  ( (Nil!18028) (Cons!18027 (h!19173 (_ BitVec 64)) (t!25455 List!18031)) )
))
(declare-fun arrayNoDuplicates!0 (array!53381 (_ BitVec 32) List!18031) Bool)

(assert (=> b!905624 (= res!611198 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18028))))

(declare-fun b!905625 () Bool)

(declare-fun e!507479 () Bool)

(assert (=> b!905625 (= e!507479 true)))

(declare-fun lt!408473 () V!29871)

(declare-fun apply!455 (ListLongMap!10923 (_ BitVec 64)) V!29871)

(assert (=> b!905625 (= (apply!455 lt!408471 k0!1033) lt!408473)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30658 0))(
  ( (Unit!30659) )
))
(declare-fun lt!408475 () Unit!30658)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!18 (array!53381 array!53379 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 64) V!29871 (_ BitVec 32) Int) Unit!30658)

(assert (=> b!905625 (= lt!408475 (lemmaListMapApplyFromThenApplyFromZero!18 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408473 i!717 defaultEntry!1160))))

(declare-fun b!905626 () Bool)

(declare-fun tp_is_empty!18679 () Bool)

(assert (=> b!905626 (= e!507480 tp_is_empty!18679)))

(declare-fun b!905627 () Bool)

(declare-fun res!611197 () Bool)

(assert (=> b!905627 (=> res!611197 e!507479)))

(declare-fun lt!408474 () ListLongMap!10923)

(assert (=> b!905627 (= res!611197 (not (= (apply!455 lt!408474 k0!1033) lt!408473)))))

(declare-fun b!905628 () Bool)

(declare-fun res!611199 () Bool)

(assert (=> b!905628 (=> (not res!611199) (not e!507481))))

(assert (=> b!905628 (= res!611199 (and (= (select (arr!25650 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905629 () Bool)

(declare-fun res!611194 () Bool)

(assert (=> b!905629 (=> (not res!611194) (not e!507484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53381 (_ BitVec 32)) Bool)

(assert (=> b!905629 (= res!611194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905630 () Bool)

(declare-fun res!611191 () Bool)

(assert (=> b!905630 (=> (not res!611191) (not e!507484))))

(assert (=> b!905630 (= res!611191 (and (= (size!26110 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26111 _keys!1386) (size!26110 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905631 () Bool)

(declare-fun e!507478 () Bool)

(assert (=> b!905631 (= e!507478 e!507479)))

(declare-fun res!611190 () Bool)

(assert (=> b!905631 (=> res!611190 e!507479)))

(assert (=> b!905631 (= res!611190 (not (contains!4485 lt!408474 k0!1033)))))

(assert (=> b!905631 (= lt!408474 (getCurrentListMap!2689 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905633 () Bool)

(declare-fun res!611193 () Bool)

(assert (=> b!905633 (=> (not res!611193) (not e!507481))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905633 (= res!611193 (inRange!0 i!717 mask!1756))))

(declare-fun b!905634 () Bool)

(assert (=> b!905634 (= e!507481 (not e!507478))))

(declare-fun res!611195 () Bool)

(assert (=> b!905634 (=> res!611195 e!507478)))

(assert (=> b!905634 (= res!611195 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26111 _keys!1386))))))

(declare-fun get!13485 (ValueCell!8858 V!29871) V!29871)

(declare-fun dynLambda!1332 (Int (_ BitVec 64)) V!29871)

(assert (=> b!905634 (= lt!408473 (get!13485 (select (arr!25649 _values!1152) i!717) (dynLambda!1332 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905634 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408472 () Unit!30658)

(declare-fun lemmaKeyInListMapIsInArray!208 (array!53381 array!53379 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 64) Int) Unit!30658)

(assert (=> b!905634 (= lt!408472 (lemmaKeyInListMapIsInArray!208 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29731 () Bool)

(assert (=> mapIsEmpty!29731 mapRes!29731))

(declare-fun b!905632 () Bool)

(assert (=> b!905632 (= e!507483 tp_is_empty!18679)))

(declare-fun res!611192 () Bool)

(assert (=> start!77658 (=> (not res!611192) (not e!507484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77658 (= res!611192 (validMask!0 mask!1756))))

(assert (=> start!77658 e!507484))

(declare-fun array_inv!20138 (array!53379) Bool)

(assert (=> start!77658 (and (array_inv!20138 _values!1152) e!507485)))

(assert (=> start!77658 tp!57045))

(assert (=> start!77658 true))

(assert (=> start!77658 tp_is_empty!18679))

(declare-fun array_inv!20139 (array!53381) Bool)

(assert (=> start!77658 (array_inv!20139 _keys!1386)))

(assert (= (and start!77658 res!611192) b!905630))

(assert (= (and b!905630 res!611191) b!905629))

(assert (= (and b!905629 res!611194) b!905624))

(assert (= (and b!905624 res!611198) b!905623))

(assert (= (and b!905623 res!611196) b!905633))

(assert (= (and b!905633 res!611193) b!905628))

(assert (= (and b!905628 res!611199) b!905634))

(assert (= (and b!905634 (not res!611195)) b!905631))

(assert (= (and b!905631 (not res!611190)) b!905627))

(assert (= (and b!905627 (not res!611197)) b!905625))

(assert (= (and b!905622 condMapEmpty!29731) mapIsEmpty!29731))

(assert (= (and b!905622 (not condMapEmpty!29731)) mapNonEmpty!29731))

(get-info :version)

(assert (= (and mapNonEmpty!29731 ((_ is ValueCellFull!8858) mapValue!29731)) b!905626))

(assert (= (and b!905622 ((_ is ValueCellFull!8858) mapDefault!29731)) b!905632))

(assert (= start!77658 b!905622))

(declare-fun b_lambda!13117 () Bool)

(assert (=> (not b_lambda!13117) (not b!905634)))

(declare-fun t!25453 () Bool)

(declare-fun tb!5275 () Bool)

(assert (=> (and start!77658 (= defaultEntry!1160 defaultEntry!1160) t!25453) tb!5275))

(declare-fun result!10353 () Bool)

(assert (=> tb!5275 (= result!10353 tp_is_empty!18679)))

(assert (=> b!905634 t!25453))

(declare-fun b_and!26651 () Bool)

(assert (= b_and!26649 (and (=> t!25453 result!10353) b_and!26651)))

(declare-fun m!840497 () Bool)

(assert (=> b!905624 m!840497))

(declare-fun m!840499 () Bool)

(assert (=> b!905628 m!840499))

(declare-fun m!840501 () Bool)

(assert (=> b!905633 m!840501))

(declare-fun m!840503 () Bool)

(assert (=> b!905634 m!840503))

(declare-fun m!840505 () Bool)

(assert (=> b!905634 m!840505))

(declare-fun m!840507 () Bool)

(assert (=> b!905634 m!840507))

(declare-fun m!840509 () Bool)

(assert (=> b!905634 m!840509))

(assert (=> b!905634 m!840503))

(assert (=> b!905634 m!840507))

(declare-fun m!840511 () Bool)

(assert (=> b!905634 m!840511))

(declare-fun m!840513 () Bool)

(assert (=> mapNonEmpty!29731 m!840513))

(declare-fun m!840515 () Bool)

(assert (=> b!905625 m!840515))

(declare-fun m!840517 () Bool)

(assert (=> b!905625 m!840517))

(declare-fun m!840519 () Bool)

(assert (=> b!905629 m!840519))

(declare-fun m!840521 () Bool)

(assert (=> start!77658 m!840521))

(declare-fun m!840523 () Bool)

(assert (=> start!77658 m!840523))

(declare-fun m!840525 () Bool)

(assert (=> start!77658 m!840525))

(declare-fun m!840527 () Bool)

(assert (=> b!905623 m!840527))

(declare-fun m!840529 () Bool)

(assert (=> b!905623 m!840529))

(declare-fun m!840531 () Bool)

(assert (=> b!905631 m!840531))

(declare-fun m!840533 () Bool)

(assert (=> b!905631 m!840533))

(declare-fun m!840535 () Bool)

(assert (=> b!905627 m!840535))

(check-sat (not start!77658) (not b_lambda!13117) (not b!905624) (not b_next!16261) b_and!26651 (not b!905634) (not b!905627) (not b!905633) (not b!905623) (not b!905625) (not b!905631) tp_is_empty!18679 (not mapNonEmpty!29731) (not b!905629))
(check-sat b_and!26651 (not b_next!16261))
