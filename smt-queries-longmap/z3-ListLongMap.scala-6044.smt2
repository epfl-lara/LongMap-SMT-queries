; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78186 () Bool)

(assert start!78186)

(declare-fun b_free!16677 () Bool)

(declare-fun b_next!16677 () Bool)

(assert (=> start!78186 (= b_free!16677 (not b_next!16677))))

(declare-fun tp!58308 () Bool)

(declare-fun b_and!27253 () Bool)

(assert (=> start!78186 (= tp!58308 b_and!27253)))

(declare-fun b!912413 () Bool)

(declare-fun e!511816 () Bool)

(declare-fun tp_is_empty!19095 () Bool)

(assert (=> b!912413 (= e!511816 tp_is_empty!19095)))

(declare-fun res!615482 () Bool)

(declare-fun e!511815 () Bool)

(assert (=> start!78186 (=> (not res!615482) (not e!511815))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78186 (= res!615482 (validMask!0 mask!1756))))

(assert (=> start!78186 e!511815))

(declare-datatypes ((V!30425 0))(
  ( (V!30426 (val!9598 Int)) )
))
(declare-datatypes ((ValueCell!9066 0))(
  ( (ValueCellFull!9066 (v!12109 V!30425)) (EmptyCell!9066) )
))
(declare-datatypes ((array!54184 0))(
  ( (array!54185 (arr!26046 (Array (_ BitVec 32) ValueCell!9066)) (size!26505 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54184)

(declare-fun e!511818 () Bool)

(declare-fun array_inv!20350 (array!54184) Bool)

(assert (=> start!78186 (and (array_inv!20350 _values!1152) e!511818)))

(assert (=> start!78186 tp!58308))

(assert (=> start!78186 true))

(assert (=> start!78186 tp_is_empty!19095))

(declare-datatypes ((array!54186 0))(
  ( (array!54187 (arr!26047 (Array (_ BitVec 32) (_ BitVec 64))) (size!26506 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54186)

(declare-fun array_inv!20351 (array!54186) Bool)

(assert (=> start!78186 (array_inv!20351 _keys!1386)))

(declare-fun b!912414 () Bool)

(declare-fun res!615484 () Bool)

(assert (=> b!912414 (=> (not res!615484) (not e!511815))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!912414 (= res!615484 (and (= (size!26505 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26506 _keys!1386) (size!26505 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912415 () Bool)

(declare-fun res!615480 () Bool)

(assert (=> b!912415 (=> (not res!615480) (not e!511815))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30425)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30425)

(declare-datatypes ((tuple2!12504 0))(
  ( (tuple2!12505 (_1!6263 (_ BitVec 64)) (_2!6263 V!30425)) )
))
(declare-datatypes ((List!18294 0))(
  ( (Nil!18291) (Cons!18290 (h!19436 tuple2!12504) (t!25883 List!18294)) )
))
(declare-datatypes ((ListLongMap!11201 0))(
  ( (ListLongMap!11202 (toList!5616 List!18294)) )
))
(declare-fun contains!4662 (ListLongMap!11201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2878 (array!54186 array!54184 (_ BitVec 32) (_ BitVec 32) V!30425 V!30425 (_ BitVec 32) Int) ListLongMap!11201)

(assert (=> b!912415 (= res!615480 (contains!4662 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912416 () Bool)

(declare-fun res!615485 () Bool)

(assert (=> b!912416 (=> (not res!615485) (not e!511815))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912416 (= res!615485 (and (= (select (arr!26047 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!30370 () Bool)

(declare-fun mapRes!30370 () Bool)

(declare-fun tp!58307 () Bool)

(assert (=> mapNonEmpty!30370 (= mapRes!30370 (and tp!58307 e!511816))))

(declare-fun mapKey!30370 () (_ BitVec 32))

(declare-fun mapRest!30370 () (Array (_ BitVec 32) ValueCell!9066))

(declare-fun mapValue!30370 () ValueCell!9066)

(assert (=> mapNonEmpty!30370 (= (arr!26046 _values!1152) (store mapRest!30370 mapKey!30370 mapValue!30370))))

(declare-fun b!912417 () Bool)

(declare-fun e!511814 () Bool)

(assert (=> b!912417 (= e!511814 tp_is_empty!19095)))

(declare-fun b!912418 () Bool)

(assert (=> b!912418 (= e!511818 (and e!511814 mapRes!30370))))

(declare-fun condMapEmpty!30370 () Bool)

(declare-fun mapDefault!30370 () ValueCell!9066)

(assert (=> b!912418 (= condMapEmpty!30370 (= (arr!26046 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9066)) mapDefault!30370)))))

(declare-fun b!912419 () Bool)

(assert (=> b!912419 (= e!511815 (not true))))

(declare-fun arrayContainsKey!0 (array!54186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912419 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30872 0))(
  ( (Unit!30873) )
))
(declare-fun lt!410666 () Unit!30872)

(declare-fun lemmaKeyInListMapIsInArray!261 (array!54186 array!54184 (_ BitVec 32) (_ BitVec 32) V!30425 V!30425 (_ BitVec 64) Int) Unit!30872)

(assert (=> b!912419 (= lt!410666 (lemmaKeyInListMapIsInArray!261 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912420 () Bool)

(declare-fun res!615483 () Bool)

(assert (=> b!912420 (=> (not res!615483) (not e!511815))))

(declare-datatypes ((List!18295 0))(
  ( (Nil!18292) (Cons!18291 (h!19437 (_ BitVec 64)) (t!25884 List!18295)) )
))
(declare-fun arrayNoDuplicates!0 (array!54186 (_ BitVec 32) List!18295) Bool)

(assert (=> b!912420 (= res!615483 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18292))))

(declare-fun b!912421 () Bool)

(declare-fun res!615486 () Bool)

(assert (=> b!912421 (=> (not res!615486) (not e!511815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54186 (_ BitVec 32)) Bool)

(assert (=> b!912421 (= res!615486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912422 () Bool)

(declare-fun res!615481 () Bool)

(assert (=> b!912422 (=> (not res!615481) (not e!511815))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912422 (= res!615481 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30370 () Bool)

(assert (=> mapIsEmpty!30370 mapRes!30370))

(assert (= (and start!78186 res!615482) b!912414))

(assert (= (and b!912414 res!615484) b!912421))

(assert (= (and b!912421 res!615486) b!912420))

(assert (= (and b!912420 res!615483) b!912415))

(assert (= (and b!912415 res!615480) b!912422))

(assert (= (and b!912422 res!615481) b!912416))

(assert (= (and b!912416 res!615485) b!912419))

(assert (= (and b!912418 condMapEmpty!30370) mapIsEmpty!30370))

(assert (= (and b!912418 (not condMapEmpty!30370)) mapNonEmpty!30370))

(get-info :version)

(assert (= (and mapNonEmpty!30370 ((_ is ValueCellFull!9066) mapValue!30370)) b!912413))

(assert (= (and b!912418 ((_ is ValueCellFull!9066) mapDefault!30370)) b!912417))

(assert (= start!78186 b!912418))

(declare-fun m!846923 () Bool)

(assert (=> b!912421 m!846923))

(declare-fun m!846925 () Bool)

(assert (=> start!78186 m!846925))

(declare-fun m!846927 () Bool)

(assert (=> start!78186 m!846927))

(declare-fun m!846929 () Bool)

(assert (=> start!78186 m!846929))

(declare-fun m!846931 () Bool)

(assert (=> b!912416 m!846931))

(declare-fun m!846933 () Bool)

(assert (=> b!912422 m!846933))

(declare-fun m!846935 () Bool)

(assert (=> mapNonEmpty!30370 m!846935))

(declare-fun m!846937 () Bool)

(assert (=> b!912419 m!846937))

(declare-fun m!846939 () Bool)

(assert (=> b!912419 m!846939))

(declare-fun m!846941 () Bool)

(assert (=> b!912415 m!846941))

(assert (=> b!912415 m!846941))

(declare-fun m!846943 () Bool)

(assert (=> b!912415 m!846943))

(declare-fun m!846945 () Bool)

(assert (=> b!912420 m!846945))

(check-sat (not b!912420) b_and!27253 tp_is_empty!19095 (not b!912421) (not start!78186) (not b!912419) (not b!912422) (not b!912415) (not b_next!16677) (not mapNonEmpty!30370))
(check-sat b_and!27253 (not b_next!16677))
