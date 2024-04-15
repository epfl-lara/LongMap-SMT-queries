; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20158 () Bool)

(assert start!20158)

(declare-fun b_free!4813 () Bool)

(declare-fun b_next!4813 () Bool)

(assert (=> start!20158 (= b_free!4813 (not b_next!4813))))

(declare-fun tp!17470 () Bool)

(declare-fun b_and!11533 () Bool)

(assert (=> start!20158 (= tp!17470 b_and!11533)))

(declare-fun b!197597 () Bool)

(declare-fun res!93506 () Bool)

(declare-fun e!129974 () Bool)

(assert (=> b!197597 (=> (not res!93506) (not e!129974))))

(declare-datatypes ((array!8567 0))(
  ( (array!8568 (arr!4033 (Array (_ BitVec 32) (_ BitVec 64))) (size!4359 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8567)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5873 0))(
  ( (V!5874 (val!2379 Int)) )
))
(declare-datatypes ((ValueCell!1991 0))(
  ( (ValueCellFull!1991 (v!4343 V!5873)) (EmptyCell!1991) )
))
(declare-datatypes ((array!8569 0))(
  ( (array!8570 (arr!4034 (Array (_ BitVec 32) ValueCell!1991)) (size!4360 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8569)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197597 (= res!93506 (and (= (size!4360 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4359 _keys!825) (size!4360 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197598 () Bool)

(declare-fun res!93511 () Bool)

(assert (=> b!197598 (=> (not res!93511) (not e!129974))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197598 (= res!93511 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4359 _keys!825))))))

(declare-fun mapNonEmpty!8072 () Bool)

(declare-fun mapRes!8072 () Bool)

(declare-fun tp!17471 () Bool)

(declare-fun e!129977 () Bool)

(assert (=> mapNonEmpty!8072 (= mapRes!8072 (and tp!17471 e!129977))))

(declare-fun mapValue!8072 () ValueCell!1991)

(declare-fun mapRest!8072 () (Array (_ BitVec 32) ValueCell!1991))

(declare-fun mapKey!8072 () (_ BitVec 32))

(assert (=> mapNonEmpty!8072 (= (arr!4034 _values!649) (store mapRest!8072 mapKey!8072 mapValue!8072))))

(declare-fun b!197599 () Bool)

(declare-fun res!93508 () Bool)

(assert (=> b!197599 (=> (not res!93508) (not e!129974))))

(declare-datatypes ((List!2510 0))(
  ( (Nil!2507) (Cons!2506 (h!3148 (_ BitVec 64)) (t!7432 List!2510)) )
))
(declare-fun arrayNoDuplicates!0 (array!8567 (_ BitVec 32) List!2510) Bool)

(assert (=> b!197599 (= res!93508 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2507))))

(declare-fun mapIsEmpty!8072 () Bool)

(assert (=> mapIsEmpty!8072 mapRes!8072))

(declare-fun b!197601 () Bool)

(declare-fun res!93509 () Bool)

(assert (=> b!197601 (=> (not res!93509) (not e!129974))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197601 (= res!93509 (validKeyInArray!0 k0!843))))

(declare-fun b!197602 () Bool)

(assert (=> b!197602 (= e!129974 false)))

(declare-fun v!520 () V!5873)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5873)

(declare-fun zeroValue!615 () V!5873)

(declare-datatypes ((tuple2!3578 0))(
  ( (tuple2!3579 (_1!1800 (_ BitVec 64)) (_2!1800 V!5873)) )
))
(declare-datatypes ((List!2511 0))(
  ( (Nil!2508) (Cons!2507 (h!3149 tuple2!3578) (t!7433 List!2511)) )
))
(declare-datatypes ((ListLongMap!2481 0))(
  ( (ListLongMap!2482 (toList!1256 List!2511)) )
))
(declare-fun lt!97597 () ListLongMap!2481)

(declare-fun getCurrentListMapNoExtraKeys!236 (array!8567 array!8569 (_ BitVec 32) (_ BitVec 32) V!5873 V!5873 (_ BitVec 32) Int) ListLongMap!2481)

(assert (=> b!197602 (= lt!97597 (getCurrentListMapNoExtraKeys!236 _keys!825 (array!8570 (store (arr!4034 _values!649) i!601 (ValueCellFull!1991 v!520)) (size!4360 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97598 () ListLongMap!2481)

(assert (=> b!197602 (= lt!97598 (getCurrentListMapNoExtraKeys!236 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197603 () Bool)

(declare-fun e!129976 () Bool)

(declare-fun tp_is_empty!4669 () Bool)

(assert (=> b!197603 (= e!129976 tp_is_empty!4669)))

(declare-fun b!197604 () Bool)

(declare-fun e!129978 () Bool)

(assert (=> b!197604 (= e!129978 (and e!129976 mapRes!8072))))

(declare-fun condMapEmpty!8072 () Bool)

(declare-fun mapDefault!8072 () ValueCell!1991)

(assert (=> b!197604 (= condMapEmpty!8072 (= (arr!4034 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1991)) mapDefault!8072)))))

(declare-fun b!197605 () Bool)

(declare-fun res!93512 () Bool)

(assert (=> b!197605 (=> (not res!93512) (not e!129974))))

(assert (=> b!197605 (= res!93512 (= (select (arr!4033 _keys!825) i!601) k0!843))))

(declare-fun b!197606 () Bool)

(declare-fun res!93507 () Bool)

(assert (=> b!197606 (=> (not res!93507) (not e!129974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8567 (_ BitVec 32)) Bool)

(assert (=> b!197606 (= res!93507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!93510 () Bool)

(assert (=> start!20158 (=> (not res!93510) (not e!129974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20158 (= res!93510 (validMask!0 mask!1149))))

(assert (=> start!20158 e!129974))

(declare-fun array_inv!2627 (array!8569) Bool)

(assert (=> start!20158 (and (array_inv!2627 _values!649) e!129978)))

(assert (=> start!20158 true))

(assert (=> start!20158 tp_is_empty!4669))

(declare-fun array_inv!2628 (array!8567) Bool)

(assert (=> start!20158 (array_inv!2628 _keys!825)))

(assert (=> start!20158 tp!17470))

(declare-fun b!197600 () Bool)

(assert (=> b!197600 (= e!129977 tp_is_empty!4669)))

(assert (= (and start!20158 res!93510) b!197597))

(assert (= (and b!197597 res!93506) b!197606))

(assert (= (and b!197606 res!93507) b!197599))

(assert (= (and b!197599 res!93508) b!197598))

(assert (= (and b!197598 res!93511) b!197601))

(assert (= (and b!197601 res!93509) b!197605))

(assert (= (and b!197605 res!93512) b!197602))

(assert (= (and b!197604 condMapEmpty!8072) mapIsEmpty!8072))

(assert (= (and b!197604 (not condMapEmpty!8072)) mapNonEmpty!8072))

(get-info :version)

(assert (= (and mapNonEmpty!8072 ((_ is ValueCellFull!1991) mapValue!8072)) b!197600))

(assert (= (and b!197604 ((_ is ValueCellFull!1991) mapDefault!8072)) b!197603))

(assert (= start!20158 b!197604))

(declare-fun m!223923 () Bool)

(assert (=> b!197606 m!223923))

(declare-fun m!223925 () Bool)

(assert (=> mapNonEmpty!8072 m!223925))

(declare-fun m!223927 () Bool)

(assert (=> start!20158 m!223927))

(declare-fun m!223929 () Bool)

(assert (=> start!20158 m!223929))

(declare-fun m!223931 () Bool)

(assert (=> start!20158 m!223931))

(declare-fun m!223933 () Bool)

(assert (=> b!197605 m!223933))

(declare-fun m!223935 () Bool)

(assert (=> b!197599 m!223935))

(declare-fun m!223937 () Bool)

(assert (=> b!197602 m!223937))

(declare-fun m!223939 () Bool)

(assert (=> b!197602 m!223939))

(declare-fun m!223941 () Bool)

(assert (=> b!197602 m!223941))

(declare-fun m!223943 () Bool)

(assert (=> b!197601 m!223943))

(check-sat (not b_next!4813) b_and!11533 tp_is_empty!4669 (not mapNonEmpty!8072) (not b!197602) (not b!197606) (not start!20158) (not b!197601) (not b!197599))
(check-sat b_and!11533 (not b_next!4813))
