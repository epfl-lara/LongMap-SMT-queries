; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20110 () Bool)

(assert start!20110)

(declare-fun b_free!4765 () Bool)

(declare-fun b_next!4765 () Bool)

(assert (=> start!20110 (= b_free!4765 (not b_next!4765))))

(declare-fun tp!17327 () Bool)

(declare-fun b_and!11525 () Bool)

(assert (=> start!20110 (= tp!17327 b_and!11525)))

(declare-fun mapNonEmpty!8000 () Bool)

(declare-fun mapRes!8000 () Bool)

(declare-fun tp!17326 () Bool)

(declare-fun e!129742 () Bool)

(assert (=> mapNonEmpty!8000 (= mapRes!8000 (and tp!17326 e!129742))))

(declare-datatypes ((V!5809 0))(
  ( (V!5810 (val!2355 Int)) )
))
(declare-datatypes ((ValueCell!1967 0))(
  ( (ValueCellFull!1967 (v!4326 V!5809)) (EmptyCell!1967) )
))
(declare-fun mapValue!8000 () ValueCell!1967)

(declare-datatypes ((array!8487 0))(
  ( (array!8488 (arr!3994 (Array (_ BitVec 32) ValueCell!1967)) (size!4319 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8487)

(declare-fun mapKey!8000 () (_ BitVec 32))

(declare-fun mapRest!8000 () (Array (_ BitVec 32) ValueCell!1967))

(assert (=> mapNonEmpty!8000 (= (arr!3994 _values!649) (store mapRest!8000 mapKey!8000 mapValue!8000))))

(declare-fun b!197071 () Bool)

(declare-fun res!93121 () Bool)

(declare-fun e!129741 () Bool)

(assert (=> b!197071 (=> (not res!93121) (not e!129741))))

(declare-datatypes ((array!8489 0))(
  ( (array!8490 (arr!3995 (Array (_ BitVec 32) (_ BitVec 64))) (size!4320 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8489)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8489 (_ BitVec 32)) Bool)

(assert (=> b!197071 (= res!93121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197072 () Bool)

(declare-fun res!93119 () Bool)

(assert (=> b!197072 (=> (not res!93119) (not e!129741))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197072 (= res!93119 (and (= (size!4319 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4320 _keys!825) (size!4319 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8000 () Bool)

(assert (=> mapIsEmpty!8000 mapRes!8000))

(declare-fun b!197073 () Bool)

(declare-fun e!129739 () Bool)

(declare-fun tp_is_empty!4621 () Bool)

(assert (=> b!197073 (= e!129739 tp_is_empty!4621)))

(declare-fun b!197074 () Bool)

(assert (=> b!197074 (= e!129741 false)))

(declare-fun zeroValue!615 () V!5809)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5809)

(declare-datatypes ((tuple2!3530 0))(
  ( (tuple2!3531 (_1!1776 (_ BitVec 64)) (_2!1776 V!5809)) )
))
(declare-datatypes ((List!2450 0))(
  ( (Nil!2447) (Cons!2446 (h!3088 tuple2!3530) (t!7373 List!2450)) )
))
(declare-datatypes ((ListLongMap!2445 0))(
  ( (ListLongMap!2446 (toList!1238 List!2450)) )
))
(declare-fun lt!97736 () ListLongMap!2445)

(declare-fun getCurrentListMapNoExtraKeys!228 (array!8489 array!8487 (_ BitVec 32) (_ BitVec 32) V!5809 V!5809 (_ BitVec 32) Int) ListLongMap!2445)

(assert (=> b!197074 (= lt!97736 (getCurrentListMapNoExtraKeys!228 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197075 () Bool)

(declare-fun res!93118 () Bool)

(assert (=> b!197075 (=> (not res!93118) (not e!129741))))

(declare-datatypes ((List!2451 0))(
  ( (Nil!2448) (Cons!2447 (h!3089 (_ BitVec 64)) (t!7374 List!2451)) )
))
(declare-fun arrayNoDuplicates!0 (array!8489 (_ BitVec 32) List!2451) Bool)

(assert (=> b!197075 (= res!93118 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2448))))

(declare-fun b!197076 () Bool)

(declare-fun res!93123 () Bool)

(assert (=> b!197076 (=> (not res!93123) (not e!129741))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197076 (= res!93123 (validKeyInArray!0 k0!843))))

(declare-fun b!197077 () Bool)

(declare-fun res!93122 () Bool)

(assert (=> b!197077 (=> (not res!93122) (not e!129741))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197077 (= res!93122 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4320 _keys!825))))))

(declare-fun b!197078 () Bool)

(declare-fun res!93120 () Bool)

(assert (=> b!197078 (=> (not res!93120) (not e!129741))))

(assert (=> b!197078 (= res!93120 (= (select (arr!3995 _keys!825) i!601) k0!843))))

(declare-fun res!93124 () Bool)

(assert (=> start!20110 (=> (not res!93124) (not e!129741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20110 (= res!93124 (validMask!0 mask!1149))))

(assert (=> start!20110 e!129741))

(declare-fun e!129743 () Bool)

(declare-fun array_inv!2599 (array!8487) Bool)

(assert (=> start!20110 (and (array_inv!2599 _values!649) e!129743)))

(assert (=> start!20110 true))

(assert (=> start!20110 tp_is_empty!4621))

(declare-fun array_inv!2600 (array!8489) Bool)

(assert (=> start!20110 (array_inv!2600 _keys!825)))

(assert (=> start!20110 tp!17327))

(declare-fun b!197079 () Bool)

(assert (=> b!197079 (= e!129743 (and e!129739 mapRes!8000))))

(declare-fun condMapEmpty!8000 () Bool)

(declare-fun mapDefault!8000 () ValueCell!1967)

(assert (=> b!197079 (= condMapEmpty!8000 (= (arr!3994 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1967)) mapDefault!8000)))))

(declare-fun b!197080 () Bool)

(assert (=> b!197080 (= e!129742 tp_is_empty!4621)))

(assert (= (and start!20110 res!93124) b!197072))

(assert (= (and b!197072 res!93119) b!197071))

(assert (= (and b!197071 res!93121) b!197075))

(assert (= (and b!197075 res!93118) b!197077))

(assert (= (and b!197077 res!93122) b!197076))

(assert (= (and b!197076 res!93123) b!197078))

(assert (= (and b!197078 res!93120) b!197074))

(assert (= (and b!197079 condMapEmpty!8000) mapIsEmpty!8000))

(assert (= (and b!197079 (not condMapEmpty!8000)) mapNonEmpty!8000))

(get-info :version)

(assert (= (and mapNonEmpty!8000 ((_ is ValueCellFull!1967) mapValue!8000)) b!197080))

(assert (= (and b!197079 ((_ is ValueCellFull!1967) mapDefault!8000)) b!197073))

(assert (= start!20110 b!197079))

(declare-fun m!224253 () Bool)

(assert (=> start!20110 m!224253))

(declare-fun m!224255 () Bool)

(assert (=> start!20110 m!224255))

(declare-fun m!224257 () Bool)

(assert (=> start!20110 m!224257))

(declare-fun m!224259 () Bool)

(assert (=> b!197076 m!224259))

(declare-fun m!224261 () Bool)

(assert (=> b!197078 m!224261))

(declare-fun m!224263 () Bool)

(assert (=> mapNonEmpty!8000 m!224263))

(declare-fun m!224265 () Bool)

(assert (=> b!197074 m!224265))

(declare-fun m!224267 () Bool)

(assert (=> b!197075 m!224267))

(declare-fun m!224269 () Bool)

(assert (=> b!197071 m!224269))

(check-sat (not start!20110) (not b!197076) (not b!197075) (not b!197074) (not b!197071) (not mapNonEmpty!8000) tp_is_empty!4621 b_and!11525 (not b_next!4765))
(check-sat b_and!11525 (not b_next!4765))
