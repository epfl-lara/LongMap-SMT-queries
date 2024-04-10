; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72796 () Bool)

(assert start!72796)

(declare-fun b!844823 () Bool)

(declare-fun e!471592 () Bool)

(declare-fun tp_is_empty!15847 () Bool)

(assert (=> b!844823 (= e!471592 tp_is_empty!15847)))

(declare-fun b!844825 () Bool)

(declare-fun res!573953 () Bool)

(declare-fun e!471591 () Bool)

(assert (=> b!844825 (=> (not res!573953) (not e!471591))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47920 0))(
  ( (array!47921 (arr!22991 (Array (_ BitVec 32) (_ BitVec 64))) (size!23431 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47920)

(declare-datatypes ((V!26177 0))(
  ( (V!26178 (val!7971 Int)) )
))
(declare-datatypes ((ValueCell!7484 0))(
  ( (ValueCellFull!7484 (v!10396 V!26177)) (EmptyCell!7484) )
))
(declare-datatypes ((array!47922 0))(
  ( (array!47923 (arr!22992 (Array (_ BitVec 32) ValueCell!7484)) (size!23432 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47922)

(assert (=> b!844825 (= res!573953 (and (= (size!23432 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23431 _keys!868) (size!23432 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844826 () Bool)

(declare-fun res!573951 () Bool)

(assert (=> b!844826 (=> (not res!573951) (not e!471591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844826 (= res!573951 (validMask!0 mask!1196))))

(declare-fun b!844827 () Bool)

(assert (=> b!844827 (= e!471591 false)))

(declare-fun lt!381337 () Bool)

(declare-datatypes ((List!16285 0))(
  ( (Nil!16282) (Cons!16281 (h!17412 (_ BitVec 64)) (t!22656 List!16285)) )
))
(declare-fun arrayNoDuplicates!0 (array!47920 (_ BitVec 32) List!16285) Bool)

(assert (=> b!844827 (= lt!381337 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16282))))

(declare-fun mapIsEmpty!25370 () Bool)

(declare-fun mapRes!25370 () Bool)

(assert (=> mapIsEmpty!25370 mapRes!25370))

(declare-fun b!844828 () Bool)

(declare-fun e!471590 () Bool)

(assert (=> b!844828 (= e!471590 tp_is_empty!15847)))

(declare-fun mapNonEmpty!25370 () Bool)

(declare-fun tp!48688 () Bool)

(assert (=> mapNonEmpty!25370 (= mapRes!25370 (and tp!48688 e!471592))))

(declare-fun mapValue!25370 () ValueCell!7484)

(declare-fun mapKey!25370 () (_ BitVec 32))

(declare-fun mapRest!25370 () (Array (_ BitVec 32) ValueCell!7484))

(assert (=> mapNonEmpty!25370 (= (arr!22992 _values!688) (store mapRest!25370 mapKey!25370 mapValue!25370))))

(declare-fun b!844829 () Bool)

(declare-fun res!573952 () Bool)

(assert (=> b!844829 (=> (not res!573952) (not e!471591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47920 (_ BitVec 32)) Bool)

(assert (=> b!844829 (= res!573952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573950 () Bool)

(assert (=> start!72796 (=> (not res!573950) (not e!471591))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72796 (= res!573950 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23431 _keys!868))))))

(assert (=> start!72796 e!471591))

(assert (=> start!72796 true))

(declare-fun array_inv!18278 (array!47920) Bool)

(assert (=> start!72796 (array_inv!18278 _keys!868)))

(declare-fun e!471588 () Bool)

(declare-fun array_inv!18279 (array!47922) Bool)

(assert (=> start!72796 (and (array_inv!18279 _values!688) e!471588)))

(declare-fun b!844824 () Bool)

(assert (=> b!844824 (= e!471588 (and e!471590 mapRes!25370))))

(declare-fun condMapEmpty!25370 () Bool)

(declare-fun mapDefault!25370 () ValueCell!7484)

