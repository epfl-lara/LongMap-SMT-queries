; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104620 () Bool)

(assert start!104620)

(declare-fun mapNonEmpty!48778 () Bool)

(declare-fun mapRes!48778 () Bool)

(declare-fun tp!92879 () Bool)

(declare-fun e!707735 () Bool)

(assert (=> mapNonEmpty!48778 (= mapRes!48778 (and tp!92879 e!707735))))

(declare-fun mapKey!48778 () (_ BitVec 32))

(declare-datatypes ((V!47163 0))(
  ( (V!47164 (val!15737 Int)) )
))
(declare-datatypes ((ValueCell!14911 0))(
  ( (ValueCellFull!14911 (v!18433 V!47163)) (EmptyCell!14911) )
))
(declare-fun mapValue!48778 () ValueCell!14911)

(declare-fun mapRest!48778 () (Array (_ BitVec 32) ValueCell!14911))

(declare-datatypes ((array!80394 0))(
  ( (array!80395 (arr!38766 (Array (_ BitVec 32) ValueCell!14911)) (size!39302 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80394)

(assert (=> mapNonEmpty!48778 (= (arr!38766 _values!914) (store mapRest!48778 mapKey!48778 mapValue!48778))))

(declare-fun b!1247521 () Bool)

(declare-fun e!707737 () Bool)

(assert (=> b!1247521 (= e!707737 false)))

(declare-fun lt!563275 () Bool)

(declare-datatypes ((array!80396 0))(
  ( (array!80397 (arr!38767 (Array (_ BitVec 32) (_ BitVec 64))) (size!39303 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80396)

(declare-datatypes ((List!27530 0))(
  ( (Nil!27527) (Cons!27526 (h!28735 (_ BitVec 64)) (t!40999 List!27530)) )
))
(declare-fun arrayNoDuplicates!0 (array!80396 (_ BitVec 32) List!27530) Bool)

(assert (=> b!1247521 (= lt!563275 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27527))))

(declare-fun res!832408 () Bool)

(assert (=> start!104620 (=> (not res!832408) (not e!707737))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104620 (= res!832408 (validMask!0 mask!1466))))

(assert (=> start!104620 e!707737))

(assert (=> start!104620 true))

(declare-fun array_inv!29601 (array!80396) Bool)

(assert (=> start!104620 (array_inv!29601 _keys!1118)))

(declare-fun e!707736 () Bool)

(declare-fun array_inv!29602 (array!80394) Bool)

(assert (=> start!104620 (and (array_inv!29602 _values!914) e!707736)))

(declare-fun b!1247522 () Bool)

(declare-fun e!707734 () Bool)

(declare-fun tp_is_empty!31349 () Bool)

(assert (=> b!1247522 (= e!707734 tp_is_empty!31349)))

(declare-fun b!1247523 () Bool)

(assert (=> b!1247523 (= e!707736 (and e!707734 mapRes!48778))))

(declare-fun condMapEmpty!48778 () Bool)

(declare-fun mapDefault!48778 () ValueCell!14911)

