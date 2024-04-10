; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20212 () Bool)

(assert start!20212)

(declare-fun b_free!4871 () Bool)

(declare-fun b_next!4871 () Bool)

(assert (=> start!20212 (= b_free!4871 (not b_next!4871))))

(declare-fun tp!17645 () Bool)

(declare-fun b_and!11617 () Bool)

(assert (=> start!20212 (= tp!17645 b_and!11617)))

(declare-fun mapNonEmpty!8159 () Bool)

(declare-fun mapRes!8159 () Bool)

(declare-fun tp!17644 () Bool)

(declare-fun e!130511 () Bool)

(assert (=> mapNonEmpty!8159 (= mapRes!8159 (and tp!17644 e!130511))))

(declare-datatypes ((V!5949 0))(
  ( (V!5950 (val!2408 Int)) )
))
(declare-datatypes ((ValueCell!2020 0))(
  ( (ValueCellFull!2020 (v!4378 V!5949)) (EmptyCell!2020) )
))
(declare-fun mapValue!8159 () ValueCell!2020)

(declare-datatypes ((array!8701 0))(
  ( (array!8702 (arr!4101 (Array (_ BitVec 32) ValueCell!2020)) (size!4426 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8701)

(declare-fun mapKey!8159 () (_ BitVec 32))

(declare-fun mapRest!8159 () (Array (_ BitVec 32) ValueCell!2020))

(assert (=> mapNonEmpty!8159 (= (arr!4101 _values!649) (store mapRest!8159 mapKey!8159 mapValue!8159))))

(declare-fun b!198614 () Bool)

(declare-fun tp_is_empty!4727 () Bool)

(assert (=> b!198614 (= e!130511 tp_is_empty!4727)))

(declare-fun b!198615 () Bool)

(declare-fun e!130510 () Bool)

(assert (=> b!198615 (= e!130510 tp_is_empty!4727)))

(declare-fun b!198616 () Bool)

(declare-fun res!94211 () Bool)

(declare-fun e!130512 () Bool)

(assert (=> b!198616 (=> (not res!94211) (not e!130512))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8703 0))(
  ( (array!8704 (arr!4102 (Array (_ BitVec 32) (_ BitVec 64))) (size!4427 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8703)

(assert (=> b!198616 (= res!94211 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4427 _keys!825))))))

(declare-fun res!94210 () Bool)

(assert (=> start!20212 (=> (not res!94210) (not e!130512))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20212 (= res!94210 (validMask!0 mask!1149))))

(assert (=> start!20212 e!130512))

(declare-fun e!130513 () Bool)

(declare-fun array_inv!2687 (array!8701) Bool)

(assert (=> start!20212 (and (array_inv!2687 _values!649) e!130513)))

(assert (=> start!20212 true))

(assert (=> start!20212 tp_is_empty!4727))

(declare-fun array_inv!2688 (array!8703) Bool)

(assert (=> start!20212 (array_inv!2688 _keys!825)))

(assert (=> start!20212 tp!17645))

(declare-fun b!198617 () Bool)

(assert (=> b!198617 (= e!130512 (not true))))

(declare-datatypes ((tuple2!3652 0))(
  ( (tuple2!3653 (_1!1837 (_ BitVec 64)) (_2!1837 V!5949)) )
))
(declare-datatypes ((List!2566 0))(
  ( (Nil!2563) (Cons!2562 (h!3204 tuple2!3652) (t!7497 List!2566)) )
))
(declare-datatypes ((ListLongMap!2565 0))(
  ( (ListLongMap!2566 (toList!1298 List!2566)) )
))
(declare-fun lt!97968 () ListLongMap!2565)

(declare-fun lt!97971 () ListLongMap!2565)

(assert (=> b!198617 (and (= lt!97968 lt!97971) (= lt!97971 lt!97968))))

(declare-fun lt!97970 () ListLongMap!2565)

(declare-fun v!520 () V!5949)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!325 (ListLongMap!2565 tuple2!3652) ListLongMap!2565)

(assert (=> b!198617 (= lt!97971 (+!325 lt!97970 (tuple2!3653 k!843 v!520)))))

(declare-datatypes ((Unit!5952 0))(
  ( (Unit!5953) )
))
(declare-fun lt!97969 () Unit!5952)

(declare-fun zeroValue!615 () V!5949)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5949)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!2 (array!8703 array!8701 (_ BitVec 32) (_ BitVec 32) V!5949 V!5949 (_ BitVec 32) (_ BitVec 64) V!5949 (_ BitVec 32) Int) Unit!5952)

(assert (=> b!198617 (= lt!97969 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!2 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!263 (array!8703 array!8701 (_ BitVec 32) (_ BitVec 32) V!5949 V!5949 (_ BitVec 32) Int) ListLongMap!2565)

(assert (=> b!198617 (= lt!97968 (getCurrentListMapNoExtraKeys!263 _keys!825 (array!8702 (store (arr!4101 _values!649) i!601 (ValueCellFull!2020 v!520)) (size!4426 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198617 (= lt!97970 (getCurrentListMapNoExtraKeys!263 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198618 () Bool)

(declare-fun res!94216 () Bool)

(assert (=> b!198618 (=> (not res!94216) (not e!130512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198618 (= res!94216 (validKeyInArray!0 k!843))))

(declare-fun b!198619 () Bool)

(declare-fun res!94215 () Bool)

(assert (=> b!198619 (=> (not res!94215) (not e!130512))))

(declare-datatypes ((List!2567 0))(
  ( (Nil!2564) (Cons!2563 (h!3205 (_ BitVec 64)) (t!7498 List!2567)) )
))
(declare-fun arrayNoDuplicates!0 (array!8703 (_ BitVec 32) List!2567) Bool)

(assert (=> b!198619 (= res!94215 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2564))))

(declare-fun b!198620 () Bool)

(declare-fun res!94214 () Bool)

(assert (=> b!198620 (=> (not res!94214) (not e!130512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8703 (_ BitVec 32)) Bool)

(assert (=> b!198620 (= res!94214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8159 () Bool)

(assert (=> mapIsEmpty!8159 mapRes!8159))

(declare-fun b!198621 () Bool)

(declare-fun res!94212 () Bool)

(assert (=> b!198621 (=> (not res!94212) (not e!130512))))

(assert (=> b!198621 (= res!94212 (= (select (arr!4102 _keys!825) i!601) k!843))))

(declare-fun b!198622 () Bool)

(assert (=> b!198622 (= e!130513 (and e!130510 mapRes!8159))))

(declare-fun condMapEmpty!8159 () Bool)

(declare-fun mapDefault!8159 () ValueCell!2020)

