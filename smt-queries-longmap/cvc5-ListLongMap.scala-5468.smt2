; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72592 () Bool)

(assert start!72592)

(declare-fun b!842681 () Bool)

(declare-fun e!470059 () Bool)

(declare-fun tp_is_empty!15643 () Bool)

(assert (=> b!842681 (= e!470059 tp_is_empty!15643)))

(declare-fun b!842682 () Bool)

(declare-fun e!470058 () Bool)

(assert (=> b!842682 (= e!470058 false)))

(declare-fun lt!381031 () Bool)

(declare-datatypes ((array!47554 0))(
  ( (array!47555 (arr!22808 (Array (_ BitVec 32) (_ BitVec 64))) (size!23248 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47554)

(declare-datatypes ((List!16218 0))(
  ( (Nil!16215) (Cons!16214 (h!17345 (_ BitVec 64)) (t!22589 List!16218)) )
))
(declare-fun arrayNoDuplicates!0 (array!47554 (_ BitVec 32) List!16218) Bool)

(assert (=> b!842682 (= lt!381031 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16215))))

(declare-fun mapNonEmpty!25064 () Bool)

(declare-fun mapRes!25064 () Bool)

(declare-fun tp!48382 () Bool)

(assert (=> mapNonEmpty!25064 (= mapRes!25064 (and tp!48382 e!470059))))

(declare-datatypes ((V!25905 0))(
  ( (V!25906 (val!7869 Int)) )
))
(declare-datatypes ((ValueCell!7382 0))(
  ( (ValueCellFull!7382 (v!10294 V!25905)) (EmptyCell!7382) )
))
(declare-fun mapRest!25064 () (Array (_ BitVec 32) ValueCell!7382))

(declare-fun mapKey!25064 () (_ BitVec 32))

(declare-datatypes ((array!47556 0))(
  ( (array!47557 (arr!22809 (Array (_ BitVec 32) ValueCell!7382)) (size!23249 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47556)

(declare-fun mapValue!25064 () ValueCell!7382)

(assert (=> mapNonEmpty!25064 (= (arr!22809 _values!688) (store mapRest!25064 mapKey!25064 mapValue!25064))))

(declare-fun b!842683 () Bool)

(declare-fun res!572726 () Bool)

(assert (=> b!842683 (=> (not res!572726) (not e!470058))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47554 (_ BitVec 32)) Bool)

(assert (=> b!842683 (= res!572726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842684 () Bool)

(declare-fun res!572727 () Bool)

(assert (=> b!842684 (=> (not res!572727) (not e!470058))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842684 (= res!572727 (and (= (size!23249 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23248 _keys!868) (size!23249 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842685 () Bool)

(declare-fun e!470062 () Bool)

(declare-fun e!470060 () Bool)

(assert (=> b!842685 (= e!470062 (and e!470060 mapRes!25064))))

(declare-fun condMapEmpty!25064 () Bool)

(declare-fun mapDefault!25064 () ValueCell!7382)

