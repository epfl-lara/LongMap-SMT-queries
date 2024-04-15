; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78196 () Bool)

(assert start!78196)

(declare-fun b_free!16705 () Bool)

(declare-fun b_next!16705 () Bool)

(assert (=> start!78196 (= b_free!16705 (not b_next!16705))))

(declare-fun tp!58392 () Bool)

(declare-fun b_and!27255 () Bool)

(assert (=> start!78196 (= tp!58392 b_and!27255)))

(declare-fun b!912594 () Bool)

(declare-fun res!615670 () Bool)

(declare-fun e!511876 () Bool)

(assert (=> b!912594 (=> (not res!615670) (not e!511876))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54239 0))(
  ( (array!54240 (arr!26074 (Array (_ BitVec 32) (_ BitVec 64))) (size!26535 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54239)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912594 (= res!615670 (and (= (select (arr!26074 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912595 () Bool)

(declare-fun e!511877 () Bool)

(declare-fun tp_is_empty!19123 () Bool)

(assert (=> b!912595 (= e!511877 tp_is_empty!19123)))

(declare-fun b!912596 () Bool)

(declare-fun e!511878 () Bool)

(assert (=> b!912596 (= e!511878 tp_is_empty!19123)))

(declare-fun b!912597 () Bool)

(declare-fun res!615668 () Bool)

(assert (=> b!912597 (=> (not res!615668) (not e!511876))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912597 (= res!615668 (inRange!0 i!717 mask!1756))))

(declare-fun b!912598 () Bool)

(declare-fun res!615666 () Bool)

(assert (=> b!912598 (=> (not res!615666) (not e!511876))))

(declare-datatypes ((V!30463 0))(
  ( (V!30464 (val!9612 Int)) )
))
(declare-datatypes ((ValueCell!9080 0))(
  ( (ValueCellFull!9080 (v!12122 V!30463)) (EmptyCell!9080) )
))
(declare-datatypes ((array!54241 0))(
  ( (array!54242 (arr!26075 (Array (_ BitVec 32) ValueCell!9080)) (size!26536 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54241)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30463)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30463)

(declare-datatypes ((tuple2!12568 0))(
  ( (tuple2!12569 (_1!6295 (_ BitVec 64)) (_2!6295 V!30463)) )
))
(declare-datatypes ((List!18347 0))(
  ( (Nil!18344) (Cons!18343 (h!19489 tuple2!12568) (t!25927 List!18347)) )
))
(declare-datatypes ((ListLongMap!11255 0))(
  ( (ListLongMap!11256 (toList!5643 List!18347)) )
))
(declare-fun contains!4646 (ListLongMap!11255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2845 (array!54239 array!54241 (_ BitVec 32) (_ BitVec 32) V!30463 V!30463 (_ BitVec 32) Int) ListLongMap!11255)

(assert (=> b!912598 (= res!615666 (contains!4646 (getCurrentListMap!2845 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!615665 () Bool)

(assert (=> start!78196 (=> (not res!615665) (not e!511876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78196 (= res!615665 (validMask!0 mask!1756))))

(assert (=> start!78196 e!511876))

(declare-fun e!511879 () Bool)

(declare-fun array_inv!20444 (array!54241) Bool)

(assert (=> start!78196 (and (array_inv!20444 _values!1152) e!511879)))

(assert (=> start!78196 tp!58392))

(assert (=> start!78196 true))

(assert (=> start!78196 tp_is_empty!19123))

(declare-fun array_inv!20445 (array!54239) Bool)

(assert (=> start!78196 (array_inv!20445 _keys!1386)))

(declare-fun b!912599 () Bool)

(declare-fun res!615669 () Bool)

(assert (=> b!912599 (=> (not res!615669) (not e!511876))))

(declare-datatypes ((List!18348 0))(
  ( (Nil!18345) (Cons!18344 (h!19490 (_ BitVec 64)) (t!25928 List!18348)) )
))
(declare-fun arrayNoDuplicates!0 (array!54239 (_ BitVec 32) List!18348) Bool)

(assert (=> b!912599 (= res!615669 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18345))))

(declare-fun b!912600 () Bool)

(declare-fun mapRes!30412 () Bool)

(assert (=> b!912600 (= e!511879 (and e!511878 mapRes!30412))))

(declare-fun condMapEmpty!30412 () Bool)

(declare-fun mapDefault!30412 () ValueCell!9080)

(assert (=> b!912600 (= condMapEmpty!30412 (= (arr!26075 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9080)) mapDefault!30412)))))

(declare-fun b!912601 () Bool)

(declare-fun res!615664 () Bool)

(assert (=> b!912601 (=> (not res!615664) (not e!511876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54239 (_ BitVec 32)) Bool)

(assert (=> b!912601 (= res!615664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30412 () Bool)

(declare-fun tp!58393 () Bool)

(assert (=> mapNonEmpty!30412 (= mapRes!30412 (and tp!58393 e!511877))))

(declare-fun mapValue!30412 () ValueCell!9080)

(declare-fun mapKey!30412 () (_ BitVec 32))

(declare-fun mapRest!30412 () (Array (_ BitVec 32) ValueCell!9080))

(assert (=> mapNonEmpty!30412 (= (arr!26075 _values!1152) (store mapRest!30412 mapKey!30412 mapValue!30412))))

(declare-fun b!912602 () Bool)

(assert (=> b!912602 (= e!511876 (not true))))

(declare-fun arrayContainsKey!0 (array!54239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912602 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30818 0))(
  ( (Unit!30819) )
))
(declare-fun lt!410472 () Unit!30818)

(declare-fun lemmaKeyInListMapIsInArray!266 (array!54239 array!54241 (_ BitVec 32) (_ BitVec 32) V!30463 V!30463 (_ BitVec 64) Int) Unit!30818)

(assert (=> b!912602 (= lt!410472 (lemmaKeyInListMapIsInArray!266 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912603 () Bool)

(declare-fun res!615667 () Bool)

(assert (=> b!912603 (=> (not res!615667) (not e!511876))))

(assert (=> b!912603 (= res!615667 (and (= (size!26536 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26535 _keys!1386) (size!26536 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30412 () Bool)

(assert (=> mapIsEmpty!30412 mapRes!30412))

(assert (= (and start!78196 res!615665) b!912603))

(assert (= (and b!912603 res!615667) b!912601))

(assert (= (and b!912601 res!615664) b!912599))

(assert (= (and b!912599 res!615669) b!912598))

(assert (= (and b!912598 res!615666) b!912597))

(assert (= (and b!912597 res!615668) b!912594))

(assert (= (and b!912594 res!615670) b!912602))

(assert (= (and b!912600 condMapEmpty!30412) mapIsEmpty!30412))

(assert (= (and b!912600 (not condMapEmpty!30412)) mapNonEmpty!30412))

(get-info :version)

(assert (= (and mapNonEmpty!30412 ((_ is ValueCellFull!9080) mapValue!30412)) b!912595))

(assert (= (and b!912600 ((_ is ValueCellFull!9080) mapDefault!30412)) b!912596))

(assert (= start!78196 b!912600))

(declare-fun m!846501 () Bool)

(assert (=> b!912598 m!846501))

(assert (=> b!912598 m!846501))

(declare-fun m!846503 () Bool)

(assert (=> b!912598 m!846503))

(declare-fun m!846505 () Bool)

(assert (=> start!78196 m!846505))

(declare-fun m!846507 () Bool)

(assert (=> start!78196 m!846507))

(declare-fun m!846509 () Bool)

(assert (=> start!78196 m!846509))

(declare-fun m!846511 () Bool)

(assert (=> b!912601 m!846511))

(declare-fun m!846513 () Bool)

(assert (=> b!912594 m!846513))

(declare-fun m!846515 () Bool)

(assert (=> b!912602 m!846515))

(declare-fun m!846517 () Bool)

(assert (=> b!912602 m!846517))

(declare-fun m!846519 () Bool)

(assert (=> b!912599 m!846519))

(declare-fun m!846521 () Bool)

(assert (=> b!912597 m!846521))

(declare-fun m!846523 () Bool)

(assert (=> mapNonEmpty!30412 m!846523))

(check-sat (not mapNonEmpty!30412) (not b!912601) (not b!912602) (not b_next!16705) (not b!912597) (not b!912598) b_and!27255 tp_is_empty!19123 (not b!912599) (not start!78196))
(check-sat b_and!27255 (not b_next!16705))
