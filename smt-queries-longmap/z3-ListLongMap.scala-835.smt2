; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20108 () Bool)

(assert start!20108)

(declare-fun b_free!4767 () Bool)

(declare-fun b_next!4767 () Bool)

(assert (=> start!20108 (= b_free!4767 (not b_next!4767))))

(declare-fun tp!17333 () Bool)

(declare-fun b_and!11513 () Bool)

(assert (=> start!20108 (= tp!17333 b_and!11513)))

(declare-fun b!197054 () Bool)

(declare-fun e!129733 () Bool)

(declare-fun e!129732 () Bool)

(declare-fun mapRes!8003 () Bool)

(assert (=> b!197054 (= e!129733 (and e!129732 mapRes!8003))))

(declare-fun condMapEmpty!8003 () Bool)

(declare-datatypes ((V!5811 0))(
  ( (V!5812 (val!2356 Int)) )
))
(declare-datatypes ((ValueCell!1968 0))(
  ( (ValueCellFull!1968 (v!4326 V!5811)) (EmptyCell!1968) )
))
(declare-datatypes ((array!8501 0))(
  ( (array!8502 (arr!4001 (Array (_ BitVec 32) ValueCell!1968)) (size!4326 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8501)

(declare-fun mapDefault!8003 () ValueCell!1968)

(assert (=> b!197054 (= condMapEmpty!8003 (= (arr!4001 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1968)) mapDefault!8003)))))

(declare-fun b!197055 () Bool)

(declare-fun e!129730 () Bool)

(assert (=> b!197055 (= e!129730 false)))

(declare-datatypes ((tuple2!3586 0))(
  ( (tuple2!3587 (_1!1804 (_ BitVec 64)) (_2!1804 V!5811)) )
))
(declare-datatypes ((List!2498 0))(
  ( (Nil!2495) (Cons!2494 (h!3136 tuple2!3586) (t!7429 List!2498)) )
))
(declare-datatypes ((ListLongMap!2499 0))(
  ( (ListLongMap!2500 (toList!1265 List!2498)) )
))
(declare-fun lt!97680 () ListLongMap!2499)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5811)

(declare-datatypes ((array!8503 0))(
  ( (array!8504 (arr!4002 (Array (_ BitVec 32) (_ BitVec 64))) (size!4327 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8503)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5811)

(declare-fun getCurrentListMapNoExtraKeys!230 (array!8503 array!8501 (_ BitVec 32) (_ BitVec 32) V!5811 V!5811 (_ BitVec 32) Int) ListLongMap!2499)

(assert (=> b!197055 (= lt!97680 (getCurrentListMapNoExtraKeys!230 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!93120 () Bool)

(assert (=> start!20108 (=> (not res!93120) (not e!129730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20108 (= res!93120 (validMask!0 mask!1149))))

(assert (=> start!20108 e!129730))

(declare-fun array_inv!2611 (array!8501) Bool)

(assert (=> start!20108 (and (array_inv!2611 _values!649) e!129733)))

(assert (=> start!20108 true))

(declare-fun tp_is_empty!4623 () Bool)

(assert (=> start!20108 tp_is_empty!4623))

(declare-fun array_inv!2612 (array!8503) Bool)

(assert (=> start!20108 (array_inv!2612 _keys!825)))

(assert (=> start!20108 tp!17333))

(declare-fun b!197056 () Bool)

(declare-fun e!129734 () Bool)

(assert (=> b!197056 (= e!129734 tp_is_empty!4623)))

(declare-fun b!197057 () Bool)

(assert (=> b!197057 (= e!129732 tp_is_empty!4623)))

(declare-fun b!197058 () Bool)

(declare-fun res!93122 () Bool)

(assert (=> b!197058 (=> (not res!93122) (not e!129730))))

(assert (=> b!197058 (= res!93122 (and (= (size!4326 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4327 _keys!825) (size!4326 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197059 () Bool)

(declare-fun res!93123 () Bool)

(assert (=> b!197059 (=> (not res!93123) (not e!129730))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197059 (= res!93123 (= (select (arr!4002 _keys!825) i!601) k0!843))))

(declare-fun b!197060 () Bool)

(declare-fun res!93124 () Bool)

(assert (=> b!197060 (=> (not res!93124) (not e!129730))))

(assert (=> b!197060 (= res!93124 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4327 _keys!825))))))

(declare-fun b!197061 () Bool)

(declare-fun res!93118 () Bool)

(assert (=> b!197061 (=> (not res!93118) (not e!129730))))

(declare-datatypes ((List!2499 0))(
  ( (Nil!2496) (Cons!2495 (h!3137 (_ BitVec 64)) (t!7430 List!2499)) )
))
(declare-fun arrayNoDuplicates!0 (array!8503 (_ BitVec 32) List!2499) Bool)

(assert (=> b!197061 (= res!93118 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2496))))

(declare-fun b!197062 () Bool)

(declare-fun res!93119 () Bool)

(assert (=> b!197062 (=> (not res!93119) (not e!129730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8503 (_ BitVec 32)) Bool)

(assert (=> b!197062 (= res!93119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197063 () Bool)

(declare-fun res!93121 () Bool)

(assert (=> b!197063 (=> (not res!93121) (not e!129730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197063 (= res!93121 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8003 () Bool)

(declare-fun tp!17332 () Bool)

(assert (=> mapNonEmpty!8003 (= mapRes!8003 (and tp!17332 e!129734))))

(declare-fun mapKey!8003 () (_ BitVec 32))

(declare-fun mapValue!8003 () ValueCell!1968)

(declare-fun mapRest!8003 () (Array (_ BitVec 32) ValueCell!1968))

(assert (=> mapNonEmpty!8003 (= (arr!4001 _values!649) (store mapRest!8003 mapKey!8003 mapValue!8003))))

(declare-fun mapIsEmpty!8003 () Bool)

(assert (=> mapIsEmpty!8003 mapRes!8003))

(assert (= (and start!20108 res!93120) b!197058))

(assert (= (and b!197058 res!93122) b!197062))

(assert (= (and b!197062 res!93119) b!197061))

(assert (= (and b!197061 res!93118) b!197060))

(assert (= (and b!197060 res!93124) b!197063))

(assert (= (and b!197063 res!93121) b!197059))

(assert (= (and b!197059 res!93123) b!197055))

(assert (= (and b!197054 condMapEmpty!8003) mapIsEmpty!8003))

(assert (= (and b!197054 (not condMapEmpty!8003)) mapNonEmpty!8003))

(get-info :version)

(assert (= (and mapNonEmpty!8003 ((_ is ValueCellFull!1968) mapValue!8003)) b!197056))

(assert (= (and b!197054 ((_ is ValueCellFull!1968) mapDefault!8003)) b!197057))

(assert (= start!20108 b!197054))

(declare-fun m!224089 () Bool)

(assert (=> b!197062 m!224089))

(declare-fun m!224091 () Bool)

(assert (=> b!197055 m!224091))

(declare-fun m!224093 () Bool)

(assert (=> b!197063 m!224093))

(declare-fun m!224095 () Bool)

(assert (=> b!197059 m!224095))

(declare-fun m!224097 () Bool)

(assert (=> mapNonEmpty!8003 m!224097))

(declare-fun m!224099 () Bool)

(assert (=> b!197061 m!224099))

(declare-fun m!224101 () Bool)

(assert (=> start!20108 m!224101))

(declare-fun m!224103 () Bool)

(assert (=> start!20108 m!224103))

(declare-fun m!224105 () Bool)

(assert (=> start!20108 m!224105))

(check-sat (not b!197061) (not start!20108) (not mapNonEmpty!8003) (not b!197063) (not b!197062) b_and!11513 tp_is_empty!4623 (not b_next!4767) (not b!197055))
(check-sat b_and!11513 (not b_next!4767))
