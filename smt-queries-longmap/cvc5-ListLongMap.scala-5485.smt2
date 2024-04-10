; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72694 () Bool)

(assert start!72694)

(declare-fun b!843752 () Bool)

(declare-fun e!470824 () Bool)

(declare-fun tp_is_empty!15745 () Bool)

(assert (=> b!843752 (= e!470824 tp_is_empty!15745)))

(declare-fun b!843753 () Bool)

(declare-fun e!470825 () Bool)

(assert (=> b!843753 (= e!470825 false)))

(declare-fun lt!381184 () Bool)

(declare-datatypes ((array!47734 0))(
  ( (array!47735 (arr!22898 (Array (_ BitVec 32) (_ BitVec 64))) (size!23338 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47734)

(declare-datatypes ((List!16247 0))(
  ( (Nil!16244) (Cons!16243 (h!17374 (_ BitVec 64)) (t!22618 List!16247)) )
))
(declare-fun arrayNoDuplicates!0 (array!47734 (_ BitVec 32) List!16247) Bool)

(assert (=> b!843753 (= lt!381184 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16244))))

(declare-fun b!843754 () Bool)

(declare-fun res!573338 () Bool)

(assert (=> b!843754 (=> (not res!573338) (not e!470825))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26041 0))(
  ( (V!26042 (val!7920 Int)) )
))
(declare-datatypes ((ValueCell!7433 0))(
  ( (ValueCellFull!7433 (v!10345 V!26041)) (EmptyCell!7433) )
))
(declare-datatypes ((array!47736 0))(
  ( (array!47737 (arr!22899 (Array (_ BitVec 32) ValueCell!7433)) (size!23339 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47736)

(assert (=> b!843754 (= res!573338 (and (= (size!23339 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23338 _keys!868) (size!23339 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843755 () Bool)

(declare-fun res!573341 () Bool)

(assert (=> b!843755 (=> (not res!573341) (not e!470825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843755 (= res!573341 (validMask!0 mask!1196))))

(declare-fun b!843756 () Bool)

(declare-fun res!573340 () Bool)

(assert (=> b!843756 (=> (not res!573340) (not e!470825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47734 (_ BitVec 32)) Bool)

(assert (=> b!843756 (= res!573340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573339 () Bool)

(assert (=> start!72694 (=> (not res!573339) (not e!470825))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72694 (= res!573339 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23338 _keys!868))))))

(assert (=> start!72694 e!470825))

(assert (=> start!72694 true))

(declare-fun array_inv!18210 (array!47734) Bool)

(assert (=> start!72694 (array_inv!18210 _keys!868)))

(declare-fun e!470827 () Bool)

(declare-fun array_inv!18211 (array!47736) Bool)

(assert (=> start!72694 (and (array_inv!18211 _values!688) e!470827)))

(declare-fun b!843757 () Bool)

(declare-fun mapRes!25217 () Bool)

(assert (=> b!843757 (= e!470827 (and e!470824 mapRes!25217))))

(declare-fun condMapEmpty!25217 () Bool)

(declare-fun mapDefault!25217 () ValueCell!7433)

