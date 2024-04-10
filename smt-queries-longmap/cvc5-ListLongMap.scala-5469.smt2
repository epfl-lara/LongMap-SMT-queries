; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72598 () Bool)

(assert start!72598)

(declare-fun b!842744 () Bool)

(declare-fun e!470107 () Bool)

(assert (=> b!842744 (= e!470107 false)))

(declare-fun lt!381040 () Bool)

(declare-datatypes ((array!47566 0))(
  ( (array!47567 (arr!22814 (Array (_ BitVec 32) (_ BitVec 64))) (size!23254 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47566)

(declare-datatypes ((List!16220 0))(
  ( (Nil!16217) (Cons!16216 (h!17347 (_ BitVec 64)) (t!22591 List!16220)) )
))
(declare-fun arrayNoDuplicates!0 (array!47566 (_ BitVec 32) List!16220) Bool)

(assert (=> b!842744 (= lt!381040 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16217))))

(declare-fun res!572763 () Bool)

(assert (=> start!72598 (=> (not res!572763) (not e!470107))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72598 (= res!572763 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23254 _keys!868))))))

(assert (=> start!72598 e!470107))

(assert (=> start!72598 true))

(declare-fun array_inv!18152 (array!47566) Bool)

(assert (=> start!72598 (array_inv!18152 _keys!868)))

(declare-datatypes ((V!25913 0))(
  ( (V!25914 (val!7872 Int)) )
))
(declare-datatypes ((ValueCell!7385 0))(
  ( (ValueCellFull!7385 (v!10297 V!25913)) (EmptyCell!7385) )
))
(declare-datatypes ((array!47568 0))(
  ( (array!47569 (arr!22815 (Array (_ BitVec 32) ValueCell!7385)) (size!23255 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47568)

(declare-fun e!470105 () Bool)

(declare-fun array_inv!18153 (array!47568) Bool)

(assert (=> start!72598 (and (array_inv!18153 _values!688) e!470105)))

(declare-fun b!842745 () Bool)

(declare-fun res!572765 () Bool)

(assert (=> b!842745 (=> (not res!572765) (not e!470107))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842745 (= res!572765 (validMask!0 mask!1196))))

(declare-fun b!842746 () Bool)

(declare-fun res!572762 () Bool)

(assert (=> b!842746 (=> (not res!572762) (not e!470107))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842746 (= res!572762 (and (= (size!23255 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23254 _keys!868) (size!23255 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842747 () Bool)

(declare-fun e!470103 () Bool)

(declare-fun mapRes!25073 () Bool)

(assert (=> b!842747 (= e!470105 (and e!470103 mapRes!25073))))

(declare-fun condMapEmpty!25073 () Bool)

(declare-fun mapDefault!25073 () ValueCell!7385)

