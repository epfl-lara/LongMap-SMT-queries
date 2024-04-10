; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20248 () Bool)

(assert start!20248)

(declare-fun b_free!4907 () Bool)

(declare-fun b_next!4907 () Bool)

(assert (=> start!20248 (= b_free!4907 (not b_next!4907))))

(declare-fun tp!17753 () Bool)

(declare-fun b_and!11653 () Bool)

(assert (=> start!20248 (= tp!17753 b_and!11653)))

(declare-fun res!94593 () Bool)

(declare-fun e!130783 () Bool)

(assert (=> start!20248 (=> (not res!94593) (not e!130783))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20248 (= res!94593 (validMask!0 mask!1149))))

(assert (=> start!20248 e!130783))

(declare-datatypes ((V!5997 0))(
  ( (V!5998 (val!2426 Int)) )
))
(declare-datatypes ((ValueCell!2038 0))(
  ( (ValueCellFull!2038 (v!4396 V!5997)) (EmptyCell!2038) )
))
(declare-datatypes ((array!8767 0))(
  ( (array!8768 (arr!4134 (Array (_ BitVec 32) ValueCell!2038)) (size!4459 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8767)

(declare-fun e!130781 () Bool)

(declare-fun array_inv!2711 (array!8767) Bool)

(assert (=> start!20248 (and (array_inv!2711 _values!649) e!130781)))

(assert (=> start!20248 true))

(declare-fun tp_is_empty!4763 () Bool)

(assert (=> start!20248 tp_is_empty!4763))

(declare-datatypes ((array!8769 0))(
  ( (array!8770 (arr!4135 (Array (_ BitVec 32) (_ BitVec 64))) (size!4460 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8769)

(declare-fun array_inv!2712 (array!8769) Bool)

(assert (=> start!20248 (array_inv!2712 _keys!825)))

(assert (=> start!20248 tp!17753))

(declare-fun b!199154 () Bool)

(assert (=> b!199154 (= e!130783 (not true))))

(declare-datatypes ((tuple2!3674 0))(
  ( (tuple2!3675 (_1!1848 (_ BitVec 64)) (_2!1848 V!5997)) )
))
(declare-datatypes ((List!2590 0))(
  ( (Nil!2587) (Cons!2586 (h!3228 tuple2!3674) (t!7521 List!2590)) )
))
(declare-datatypes ((ListLongMap!2587 0))(
  ( (ListLongMap!2588 (toList!1309 List!2590)) )
))
(declare-fun lt!98187 () ListLongMap!2587)

(declare-fun lt!98184 () ListLongMap!2587)

(assert (=> b!199154 (and (= lt!98187 lt!98184) (= lt!98184 lt!98187))))

(declare-fun lt!98185 () ListLongMap!2587)

(declare-fun v!520 () V!5997)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!336 (ListLongMap!2587 tuple2!3674) ListLongMap!2587)

(assert (=> b!199154 (= lt!98184 (+!336 lt!98185 (tuple2!3675 k!843 v!520)))))

(declare-datatypes ((Unit!5974 0))(
  ( (Unit!5975) )
))
(declare-fun lt!98186 () Unit!5974)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5997)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5997)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!13 (array!8769 array!8767 (_ BitVec 32) (_ BitVec 32) V!5997 V!5997 (_ BitVec 32) (_ BitVec 64) V!5997 (_ BitVec 32) Int) Unit!5974)

(assert (=> b!199154 (= lt!98186 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!13 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!274 (array!8769 array!8767 (_ BitVec 32) (_ BitVec 32) V!5997 V!5997 (_ BitVec 32) Int) ListLongMap!2587)

(assert (=> b!199154 (= lt!98187 (getCurrentListMapNoExtraKeys!274 _keys!825 (array!8768 (store (arr!4134 _values!649) i!601 (ValueCellFull!2038 v!520)) (size!4459 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199154 (= lt!98185 (getCurrentListMapNoExtraKeys!274 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199155 () Bool)

(declare-fun res!94588 () Bool)

(assert (=> b!199155 (=> (not res!94588) (not e!130783))))

(declare-datatypes ((List!2591 0))(
  ( (Nil!2588) (Cons!2587 (h!3229 (_ BitVec 64)) (t!7522 List!2591)) )
))
(declare-fun arrayNoDuplicates!0 (array!8769 (_ BitVec 32) List!2591) Bool)

(assert (=> b!199155 (= res!94588 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2588))))

(declare-fun b!199156 () Bool)

(declare-fun res!94592 () Bool)

(assert (=> b!199156 (=> (not res!94592) (not e!130783))))

(assert (=> b!199156 (= res!94592 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4460 _keys!825))))))

(declare-fun b!199157 () Bool)

(declare-fun res!94589 () Bool)

(assert (=> b!199157 (=> (not res!94589) (not e!130783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199157 (= res!94589 (validKeyInArray!0 k!843))))

(declare-fun b!199158 () Bool)

(declare-fun res!94590 () Bool)

(assert (=> b!199158 (=> (not res!94590) (not e!130783))))

(assert (=> b!199158 (= res!94590 (= (select (arr!4135 _keys!825) i!601) k!843))))

(declare-fun b!199159 () Bool)

(declare-fun res!94594 () Bool)

(assert (=> b!199159 (=> (not res!94594) (not e!130783))))

(assert (=> b!199159 (= res!94594 (and (= (size!4459 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4460 _keys!825) (size!4459 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199160 () Bool)

(declare-fun e!130784 () Bool)

(assert (=> b!199160 (= e!130784 tp_is_empty!4763)))

(declare-fun b!199161 () Bool)

(declare-fun res!94591 () Bool)

(assert (=> b!199161 (=> (not res!94591) (not e!130783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8769 (_ BitVec 32)) Bool)

(assert (=> b!199161 (= res!94591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199162 () Bool)

(declare-fun e!130780 () Bool)

(assert (=> b!199162 (= e!130780 tp_is_empty!4763)))

(declare-fun mapNonEmpty!8213 () Bool)

(declare-fun mapRes!8213 () Bool)

(declare-fun tp!17752 () Bool)

(assert (=> mapNonEmpty!8213 (= mapRes!8213 (and tp!17752 e!130784))))

(declare-fun mapValue!8213 () ValueCell!2038)

(declare-fun mapRest!8213 () (Array (_ BitVec 32) ValueCell!2038))

(declare-fun mapKey!8213 () (_ BitVec 32))

(assert (=> mapNonEmpty!8213 (= (arr!4134 _values!649) (store mapRest!8213 mapKey!8213 mapValue!8213))))

(declare-fun mapIsEmpty!8213 () Bool)

(assert (=> mapIsEmpty!8213 mapRes!8213))

(declare-fun b!199163 () Bool)

(assert (=> b!199163 (= e!130781 (and e!130780 mapRes!8213))))

(declare-fun condMapEmpty!8213 () Bool)

(declare-fun mapDefault!8213 () ValueCell!2038)

