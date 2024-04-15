; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78190 () Bool)

(assert start!78190)

(declare-fun b_free!16699 () Bool)

(declare-fun b_next!16699 () Bool)

(assert (=> start!78190 (= b_free!16699 (not b_next!16699))))

(declare-fun tp!58375 () Bool)

(declare-fun b_and!27249 () Bool)

(assert (=> start!78190 (= tp!58375 b_and!27249)))

(declare-fun b!912504 () Bool)

(declare-fun res!615606 () Bool)

(declare-fun e!511832 () Bool)

(assert (=> b!912504 (=> (not res!615606) (not e!511832))))

(declare-datatypes ((array!54229 0))(
  ( (array!54230 (arr!26069 (Array (_ BitVec 32) (_ BitVec 64))) (size!26530 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54229)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54229 (_ BitVec 32)) Bool)

(assert (=> b!912504 (= res!615606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912505 () Bool)

(declare-fun e!511834 () Bool)

(declare-fun tp_is_empty!19117 () Bool)

(assert (=> b!912505 (= e!511834 tp_is_empty!19117)))

(declare-fun b!912506 () Bool)

(assert (=> b!912506 (= e!511832 (not true))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912506 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30455 0))(
  ( (V!30456 (val!9609 Int)) )
))
(declare-datatypes ((ValueCell!9077 0))(
  ( (ValueCellFull!9077 (v!12119 V!30455)) (EmptyCell!9077) )
))
(declare-datatypes ((array!54231 0))(
  ( (array!54232 (arr!26070 (Array (_ BitVec 32) ValueCell!9077)) (size!26531 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54231)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30455)

(declare-datatypes ((Unit!30814 0))(
  ( (Unit!30815) )
))
(declare-fun lt!410463 () Unit!30814)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30455)

(declare-fun lemmaKeyInListMapIsInArray!264 (array!54229 array!54231 (_ BitVec 32) (_ BitVec 32) V!30455 V!30455 (_ BitVec 64) Int) Unit!30814)

(assert (=> b!912506 (= lt!410463 (lemmaKeyInListMapIsInArray!264 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912507 () Bool)

(declare-fun res!615604 () Bool)

(assert (=> b!912507 (=> (not res!615604) (not e!511832))))

(declare-datatypes ((List!18343 0))(
  ( (Nil!18340) (Cons!18339 (h!19485 (_ BitVec 64)) (t!25923 List!18343)) )
))
(declare-fun arrayNoDuplicates!0 (array!54229 (_ BitVec 32) List!18343) Bool)

(assert (=> b!912507 (= res!615604 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18340))))

(declare-fun b!912508 () Bool)

(declare-fun e!511833 () Bool)

(assert (=> b!912508 (= e!511833 tp_is_empty!19117)))

(declare-fun b!912509 () Bool)

(declare-fun res!615603 () Bool)

(assert (=> b!912509 (=> (not res!615603) (not e!511832))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912509 (= res!615603 (inRange!0 i!717 mask!1756))))

(declare-fun b!912510 () Bool)

(declare-fun res!615601 () Bool)

(assert (=> b!912510 (=> (not res!615601) (not e!511832))))

(declare-datatypes ((tuple2!12564 0))(
  ( (tuple2!12565 (_1!6293 (_ BitVec 64)) (_2!6293 V!30455)) )
))
(declare-datatypes ((List!18344 0))(
  ( (Nil!18341) (Cons!18340 (h!19486 tuple2!12564) (t!25924 List!18344)) )
))
(declare-datatypes ((ListLongMap!11251 0))(
  ( (ListLongMap!11252 (toList!5641 List!18344)) )
))
(declare-fun contains!4644 (ListLongMap!11251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2843 (array!54229 array!54231 (_ BitVec 32) (_ BitVec 32) V!30455 V!30455 (_ BitVec 32) Int) ListLongMap!11251)

(assert (=> b!912510 (= res!615601 (contains!4644 (getCurrentListMap!2843 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912511 () Bool)

(declare-fun res!615607 () Bool)

(assert (=> b!912511 (=> (not res!615607) (not e!511832))))

(assert (=> b!912511 (= res!615607 (and (= (size!26531 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26530 _keys!1386) (size!26531 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30403 () Bool)

(declare-fun mapRes!30403 () Bool)

(assert (=> mapIsEmpty!30403 mapRes!30403))

(declare-fun mapNonEmpty!30403 () Bool)

(declare-fun tp!58374 () Bool)

(assert (=> mapNonEmpty!30403 (= mapRes!30403 (and tp!58374 e!511834))))

(declare-fun mapValue!30403 () ValueCell!9077)

(declare-fun mapRest!30403 () (Array (_ BitVec 32) ValueCell!9077))

(declare-fun mapKey!30403 () (_ BitVec 32))

(assert (=> mapNonEmpty!30403 (= (arr!26070 _values!1152) (store mapRest!30403 mapKey!30403 mapValue!30403))))

(declare-fun b!912512 () Bool)

(declare-fun res!615605 () Bool)

(assert (=> b!912512 (=> (not res!615605) (not e!511832))))

(assert (=> b!912512 (= res!615605 (and (= (select (arr!26069 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!615602 () Bool)

(assert (=> start!78190 (=> (not res!615602) (not e!511832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78190 (= res!615602 (validMask!0 mask!1756))))

(assert (=> start!78190 e!511832))

(declare-fun e!511831 () Bool)

(declare-fun array_inv!20440 (array!54231) Bool)

(assert (=> start!78190 (and (array_inv!20440 _values!1152) e!511831)))

(assert (=> start!78190 tp!58375))

(assert (=> start!78190 true))

(assert (=> start!78190 tp_is_empty!19117))

(declare-fun array_inv!20441 (array!54229) Bool)

(assert (=> start!78190 (array_inv!20441 _keys!1386)))

(declare-fun b!912513 () Bool)

(assert (=> b!912513 (= e!511831 (and e!511833 mapRes!30403))))

(declare-fun condMapEmpty!30403 () Bool)

(declare-fun mapDefault!30403 () ValueCell!9077)

(assert (=> b!912513 (= condMapEmpty!30403 (= (arr!26070 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9077)) mapDefault!30403)))))

(assert (= (and start!78190 res!615602) b!912511))

(assert (= (and b!912511 res!615607) b!912504))

(assert (= (and b!912504 res!615606) b!912507))

(assert (= (and b!912507 res!615604) b!912510))

(assert (= (and b!912510 res!615601) b!912509))

(assert (= (and b!912509 res!615603) b!912512))

(assert (= (and b!912512 res!615605) b!912506))

(assert (= (and b!912513 condMapEmpty!30403) mapIsEmpty!30403))

(assert (= (and b!912513 (not condMapEmpty!30403)) mapNonEmpty!30403))

(get-info :version)

(assert (= (and mapNonEmpty!30403 ((_ is ValueCellFull!9077) mapValue!30403)) b!912505))

(assert (= (and b!912513 ((_ is ValueCellFull!9077) mapDefault!30403)) b!912508))

(assert (= start!78190 b!912513))

(declare-fun m!846429 () Bool)

(assert (=> start!78190 m!846429))

(declare-fun m!846431 () Bool)

(assert (=> start!78190 m!846431))

(declare-fun m!846433 () Bool)

(assert (=> start!78190 m!846433))

(declare-fun m!846435 () Bool)

(assert (=> b!912510 m!846435))

(assert (=> b!912510 m!846435))

(declare-fun m!846437 () Bool)

(assert (=> b!912510 m!846437))

(declare-fun m!846439 () Bool)

(assert (=> b!912506 m!846439))

(declare-fun m!846441 () Bool)

(assert (=> b!912506 m!846441))

(declare-fun m!846443 () Bool)

(assert (=> b!912509 m!846443))

(declare-fun m!846445 () Bool)

(assert (=> b!912507 m!846445))

(declare-fun m!846447 () Bool)

(assert (=> b!912512 m!846447))

(declare-fun m!846449 () Bool)

(assert (=> mapNonEmpty!30403 m!846449))

(declare-fun m!846451 () Bool)

(assert (=> b!912504 m!846451))

(check-sat (not b!912504) (not b!912509) (not start!78190) (not b_next!16699) (not mapNonEmpty!30403) (not b!912510) (not b!912507) tp_is_empty!19117 (not b!912506) b_and!27249)
(check-sat b_and!27249 (not b_next!16699))
