; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72764 () Bool)

(assert start!72764)

(declare-fun b!844487 () Bool)

(declare-fun e!471349 () Bool)

(declare-fun tp_is_empty!15815 () Bool)

(assert (=> b!844487 (= e!471349 tp_is_empty!15815)))

(declare-fun b!844489 () Bool)

(declare-fun e!471352 () Bool)

(assert (=> b!844489 (= e!471352 false)))

(declare-fun lt!381289 () Bool)

(declare-datatypes ((array!47862 0))(
  ( (array!47863 (arr!22962 (Array (_ BitVec 32) (_ BitVec 64))) (size!23402 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47862)

(declare-datatypes ((List!16274 0))(
  ( (Nil!16271) (Cons!16270 (h!17401 (_ BitVec 64)) (t!22645 List!16274)) )
))
(declare-fun arrayNoDuplicates!0 (array!47862 (_ BitVec 32) List!16274) Bool)

(assert (=> b!844489 (= lt!381289 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16271))))

(declare-fun b!844490 () Bool)

(declare-fun res!573758 () Bool)

(assert (=> b!844490 (=> (not res!573758) (not e!471352))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844490 (= res!573758 (validMask!0 mask!1196))))

(declare-fun b!844491 () Bool)

(declare-fun res!573760 () Bool)

(assert (=> b!844491 (=> (not res!573760) (not e!471352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47862 (_ BitVec 32)) Bool)

(assert (=> b!844491 (= res!573760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25322 () Bool)

(declare-fun mapRes!25322 () Bool)

(declare-fun tp!48640 () Bool)

(assert (=> mapNonEmpty!25322 (= mapRes!25322 (and tp!48640 e!471349))))

(declare-fun mapKey!25322 () (_ BitVec 32))

(declare-datatypes ((V!26133 0))(
  ( (V!26134 (val!7955 Int)) )
))
(declare-datatypes ((ValueCell!7468 0))(
  ( (ValueCellFull!7468 (v!10380 V!26133)) (EmptyCell!7468) )
))
(declare-fun mapRest!25322 () (Array (_ BitVec 32) ValueCell!7468))

(declare-datatypes ((array!47864 0))(
  ( (array!47865 (arr!22963 (Array (_ BitVec 32) ValueCell!7468)) (size!23403 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47864)

(declare-fun mapValue!25322 () ValueCell!7468)

(assert (=> mapNonEmpty!25322 (= (arr!22963 _values!688) (store mapRest!25322 mapKey!25322 mapValue!25322))))

(declare-fun b!844492 () Bool)

(declare-fun res!573761 () Bool)

(assert (=> b!844492 (=> (not res!573761) (not e!471352))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844492 (= res!573761 (and (= (size!23403 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23402 _keys!868) (size!23403 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573759 () Bool)

(assert (=> start!72764 (=> (not res!573759) (not e!471352))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72764 (= res!573759 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23402 _keys!868))))))

(assert (=> start!72764 e!471352))

(assert (=> start!72764 true))

(declare-fun array_inv!18260 (array!47862) Bool)

(assert (=> start!72764 (array_inv!18260 _keys!868)))

(declare-fun e!471351 () Bool)

(declare-fun array_inv!18261 (array!47864) Bool)

(assert (=> start!72764 (and (array_inv!18261 _values!688) e!471351)))

(declare-fun b!844488 () Bool)

(declare-fun e!471350 () Bool)

(assert (=> b!844488 (= e!471350 tp_is_empty!15815)))

(declare-fun mapIsEmpty!25322 () Bool)

(assert (=> mapIsEmpty!25322 mapRes!25322))

(declare-fun b!844493 () Bool)

(assert (=> b!844493 (= e!471351 (and e!471350 mapRes!25322))))

(declare-fun condMapEmpty!25322 () Bool)

(declare-fun mapDefault!25322 () ValueCell!7468)

