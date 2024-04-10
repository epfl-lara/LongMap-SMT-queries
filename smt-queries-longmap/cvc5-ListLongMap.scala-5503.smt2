; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72802 () Bool)

(assert start!72802)

(declare-fun b!844886 () Bool)

(declare-fun e!471634 () Bool)

(declare-fun tp_is_empty!15853 () Bool)

(assert (=> b!844886 (= e!471634 tp_is_empty!15853)))

(declare-fun mapNonEmpty!25379 () Bool)

(declare-fun mapRes!25379 () Bool)

(declare-fun tp!48697 () Bool)

(declare-fun e!471633 () Bool)

(assert (=> mapNonEmpty!25379 (= mapRes!25379 (and tp!48697 e!471633))))

(declare-datatypes ((V!26185 0))(
  ( (V!26186 (val!7974 Int)) )
))
(declare-datatypes ((ValueCell!7487 0))(
  ( (ValueCellFull!7487 (v!10399 V!26185)) (EmptyCell!7487) )
))
(declare-fun mapValue!25379 () ValueCell!7487)

(declare-fun mapKey!25379 () (_ BitVec 32))

(declare-fun mapRest!25379 () (Array (_ BitVec 32) ValueCell!7487))

(declare-datatypes ((array!47932 0))(
  ( (array!47933 (arr!22997 (Array (_ BitVec 32) ValueCell!7487)) (size!23437 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47932)

(assert (=> mapNonEmpty!25379 (= (arr!22997 _values!688) (store mapRest!25379 mapKey!25379 mapValue!25379))))

(declare-fun b!844887 () Bool)

(declare-fun res!573986 () Bool)

(declare-fun e!471637 () Bool)

(assert (=> b!844887 (=> (not res!573986) (not e!471637))))

(declare-datatypes ((array!47934 0))(
  ( (array!47935 (arr!22998 (Array (_ BitVec 32) (_ BitVec 64))) (size!23438 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47934)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47934 (_ BitVec 32)) Bool)

(assert (=> b!844887 (= res!573986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844888 () Bool)

(assert (=> b!844888 (= e!471633 tp_is_empty!15853)))

(declare-fun mapIsEmpty!25379 () Bool)

(assert (=> mapIsEmpty!25379 mapRes!25379))

(declare-fun b!844890 () Bool)

(declare-fun res!573987 () Bool)

(assert (=> b!844890 (=> (not res!573987) (not e!471637))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844890 (= res!573987 (and (= (size!23437 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23438 _keys!868) (size!23437 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844891 () Bool)

(assert (=> b!844891 (= e!471637 false)))

(declare-fun lt!381346 () Bool)

(declare-datatypes ((List!16287 0))(
  ( (Nil!16284) (Cons!16283 (h!17414 (_ BitVec 64)) (t!22658 List!16287)) )
))
(declare-fun arrayNoDuplicates!0 (array!47934 (_ BitVec 32) List!16287) Bool)

(assert (=> b!844891 (= lt!381346 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16284))))

(declare-fun b!844892 () Bool)

(declare-fun res!573989 () Bool)

(assert (=> b!844892 (=> (not res!573989) (not e!471637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844892 (= res!573989 (validMask!0 mask!1196))))

(declare-fun res!573988 () Bool)

(assert (=> start!72802 (=> (not res!573988) (not e!471637))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72802 (= res!573988 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23438 _keys!868))))))

(assert (=> start!72802 e!471637))

(assert (=> start!72802 true))

(declare-fun array_inv!18282 (array!47934) Bool)

(assert (=> start!72802 (array_inv!18282 _keys!868)))

(declare-fun e!471635 () Bool)

(declare-fun array_inv!18283 (array!47932) Bool)

(assert (=> start!72802 (and (array_inv!18283 _values!688) e!471635)))

(declare-fun b!844889 () Bool)

(assert (=> b!844889 (= e!471635 (and e!471634 mapRes!25379))))

(declare-fun condMapEmpty!25379 () Bool)

(declare-fun mapDefault!25379 () ValueCell!7487)

