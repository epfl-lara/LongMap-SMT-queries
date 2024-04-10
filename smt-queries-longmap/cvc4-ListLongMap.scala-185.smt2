; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3696 () Bool)

(assert start!3696)

(declare-fun b!25864 () Bool)

(declare-fun res!15396 () Bool)

(declare-fun e!16770 () Bool)

(assert (=> b!25864 (=> (not res!15396) (not e!16770))))

(declare-datatypes ((array!1351 0))(
  ( (array!1352 (arr!637 (Array (_ BitVec 32) (_ BitVec 64))) (size!738 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1351)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1351 (_ BitVec 32)) Bool)

(assert (=> b!25864 (= res!15396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!25865 () Bool)

(declare-fun res!15397 () Bool)

(assert (=> b!25865 (=> (not res!15397) (not e!16770))))

(declare-datatypes ((V!1231 0))(
  ( (V!1232 (val!554 Int)) )
))
(declare-datatypes ((ValueCell!328 0))(
  ( (ValueCellFull!328 (v!1639 V!1231)) (EmptyCell!328) )
))
(declare-datatypes ((array!1353 0))(
  ( (array!1354 (arr!638 (Array (_ BitVec 32) ValueCell!328)) (size!739 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1353)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25865 (= res!15397 (and (= (size!739 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!738 _keys!1833) (size!739 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25866 () Bool)

(declare-fun e!16768 () Bool)

(declare-fun tp_is_empty!1055 () Bool)

(assert (=> b!25866 (= e!16768 tp_is_empty!1055)))

(declare-fun mapIsEmpty!1087 () Bool)

(declare-fun mapRes!1087 () Bool)

(assert (=> mapIsEmpty!1087 mapRes!1087))

(declare-fun res!15395 () Bool)

(assert (=> start!3696 (=> (not res!15395) (not e!16770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3696 (= res!15395 (validMask!0 mask!2294))))

(assert (=> start!3696 e!16770))

(assert (=> start!3696 true))

(declare-fun e!16767 () Bool)

(declare-fun array_inv!429 (array!1353) Bool)

(assert (=> start!3696 (and (array_inv!429 _values!1501) e!16767)))

(declare-fun array_inv!430 (array!1351) Bool)

(assert (=> start!3696 (array_inv!430 _keys!1833)))

(declare-fun b!25867 () Bool)

(declare-fun e!16766 () Bool)

(assert (=> b!25867 (= e!16766 tp_is_empty!1055)))

(declare-fun b!25868 () Bool)

(assert (=> b!25868 (= e!16767 (and e!16766 mapRes!1087))))

(declare-fun condMapEmpty!1087 () Bool)

(declare-fun mapDefault!1087 () ValueCell!328)

