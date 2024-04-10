; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78188 () Bool)

(assert start!78188)

(declare-fun b_free!16679 () Bool)

(declare-fun b_next!16679 () Bool)

(assert (=> start!78188 (= b_free!16679 (not b_next!16679))))

(declare-fun tp!58314 () Bool)

(declare-fun b_and!27255 () Bool)

(assert (=> start!78188 (= tp!58314 b_and!27255)))

(declare-fun b!912443 () Bool)

(declare-fun res!615501 () Bool)

(declare-fun e!511829 () Bool)

(assert (=> b!912443 (=> (not res!615501) (not e!511829))))

(declare-datatypes ((V!30427 0))(
  ( (V!30428 (val!9599 Int)) )
))
(declare-datatypes ((ValueCell!9067 0))(
  ( (ValueCellFull!9067 (v!12110 V!30427)) (EmptyCell!9067) )
))
(declare-datatypes ((array!54188 0))(
  ( (array!54189 (arr!26048 (Array (_ BitVec 32) ValueCell!9067)) (size!26507 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54188)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54190 0))(
  ( (array!54191 (arr!26049 (Array (_ BitVec 32) (_ BitVec 64))) (size!26508 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54190)

(assert (=> b!912443 (= res!615501 (and (= (size!26507 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26508 _keys!1386) (size!26507 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30373 () Bool)

(declare-fun mapRes!30373 () Bool)

(assert (=> mapIsEmpty!30373 mapRes!30373))

(declare-fun b!912444 () Bool)

(declare-fun res!615502 () Bool)

(assert (=> b!912444 (=> (not res!615502) (not e!511829))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!912444 (= res!615502 (and (= (select (arr!26049 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!30373 () Bool)

(declare-fun tp!58313 () Bool)

(declare-fun e!511833 () Bool)

(assert (=> mapNonEmpty!30373 (= mapRes!30373 (and tp!58313 e!511833))))

(declare-fun mapRest!30373 () (Array (_ BitVec 32) ValueCell!9067))

(declare-fun mapKey!30373 () (_ BitVec 32))

(declare-fun mapValue!30373 () ValueCell!9067)

(assert (=> mapNonEmpty!30373 (= (arr!26048 _values!1152) (store mapRest!30373 mapKey!30373 mapValue!30373))))

(declare-fun res!615505 () Bool)

(assert (=> start!78188 (=> (not res!615505) (not e!511829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78188 (= res!615505 (validMask!0 mask!1756))))

(assert (=> start!78188 e!511829))

(declare-fun e!511830 () Bool)

(declare-fun array_inv!20352 (array!54188) Bool)

(assert (=> start!78188 (and (array_inv!20352 _values!1152) e!511830)))

(assert (=> start!78188 tp!58314))

(assert (=> start!78188 true))

(declare-fun tp_is_empty!19097 () Bool)

(assert (=> start!78188 tp_is_empty!19097))

(declare-fun array_inv!20353 (array!54190) Bool)

(assert (=> start!78188 (array_inv!20353 _keys!1386)))

(declare-fun b!912445 () Bool)

(assert (=> b!912445 (= e!511833 tp_is_empty!19097)))

(declare-fun b!912446 () Bool)

(assert (=> b!912446 (= e!511829 (not true))))

(declare-fun arrayContainsKey!0 (array!54190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912446 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30427)

(declare-datatypes ((Unit!30874 0))(
  ( (Unit!30875) )
))
(declare-fun lt!410669 () Unit!30874)

(declare-fun minValue!1094 () V!30427)

(declare-fun lemmaKeyInListMapIsInArray!262 (array!54190 array!54188 (_ BitVec 32) (_ BitVec 32) V!30427 V!30427 (_ BitVec 64) Int) Unit!30874)

(assert (=> b!912446 (= lt!410669 (lemmaKeyInListMapIsInArray!262 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912447 () Bool)

(declare-fun res!615507 () Bool)

(assert (=> b!912447 (=> (not res!615507) (not e!511829))))

(declare-datatypes ((List!18296 0))(
  ( (Nil!18293) (Cons!18292 (h!19438 (_ BitVec 64)) (t!25885 List!18296)) )
))
(declare-fun arrayNoDuplicates!0 (array!54190 (_ BitVec 32) List!18296) Bool)

(assert (=> b!912447 (= res!615507 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18293))))

(declare-fun b!912448 () Bool)

(declare-fun res!615503 () Bool)

(assert (=> b!912448 (=> (not res!615503) (not e!511829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54190 (_ BitVec 32)) Bool)

(assert (=> b!912448 (= res!615503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912449 () Bool)

(declare-fun res!615506 () Bool)

(assert (=> b!912449 (=> (not res!615506) (not e!511829))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912449 (= res!615506 (inRange!0 i!717 mask!1756))))

(declare-fun b!912450 () Bool)

(declare-fun res!615504 () Bool)

(assert (=> b!912450 (=> (not res!615504) (not e!511829))))

(declare-datatypes ((tuple2!12506 0))(
  ( (tuple2!12507 (_1!6264 (_ BitVec 64)) (_2!6264 V!30427)) )
))
(declare-datatypes ((List!18297 0))(
  ( (Nil!18294) (Cons!18293 (h!19439 tuple2!12506) (t!25886 List!18297)) )
))
(declare-datatypes ((ListLongMap!11203 0))(
  ( (ListLongMap!11204 (toList!5617 List!18297)) )
))
(declare-fun contains!4663 (ListLongMap!11203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2879 (array!54190 array!54188 (_ BitVec 32) (_ BitVec 32) V!30427 V!30427 (_ BitVec 32) Int) ListLongMap!11203)

(assert (=> b!912450 (= res!615504 (contains!4663 (getCurrentListMap!2879 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!912451 () Bool)

(declare-fun e!511831 () Bool)

(assert (=> b!912451 (= e!511831 tp_is_empty!19097)))

(declare-fun b!912452 () Bool)

(assert (=> b!912452 (= e!511830 (and e!511831 mapRes!30373))))

(declare-fun condMapEmpty!30373 () Bool)

(declare-fun mapDefault!30373 () ValueCell!9067)

