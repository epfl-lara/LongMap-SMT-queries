; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83172 () Bool)

(assert start!83172)

(declare-fun b_free!19183 () Bool)

(declare-fun b_next!19183 () Bool)

(assert (=> start!83172 (= b_free!19183 (not b_next!19183))))

(declare-fun tp!66828 () Bool)

(declare-fun b_and!30645 () Bool)

(assert (=> start!83172 (= tp!66828 b_and!30645)))

(declare-fun mapNonEmpty!35131 () Bool)

(declare-fun mapRes!35131 () Bool)

(declare-fun tp!66829 () Bool)

(declare-fun e!547022 () Bool)

(assert (=> mapNonEmpty!35131 (= mapRes!35131 (and tp!66829 e!547022))))

(declare-datatypes ((V!34425 0))(
  ( (V!34426 (val!11091 Int)) )
))
(declare-datatypes ((ValueCell!10559 0))(
  ( (ValueCellFull!10559 (v!13649 V!34425)) (EmptyCell!10559) )
))
(declare-datatypes ((array!60152 0))(
  ( (array!60153 (arr!28940 (Array (_ BitVec 32) ValueCell!10559)) (size!29421 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60152)

(declare-fun mapKey!35131 () (_ BitVec 32))

(declare-fun mapRest!35131 () (Array (_ BitVec 32) ValueCell!10559))

(declare-fun mapValue!35131 () ValueCell!10559)

(assert (=> mapNonEmpty!35131 (= (arr!28940 _values!1425) (store mapRest!35131 mapKey!35131 mapValue!35131))))

(declare-fun b!970335 () Bool)

(declare-fun e!547026 () Bool)

(declare-fun e!547025 () Bool)

(assert (=> b!970335 (= e!547026 (and e!547025 mapRes!35131))))

(declare-fun condMapEmpty!35131 () Bool)

(declare-fun mapDefault!35131 () ValueCell!10559)

(assert (=> b!970335 (= condMapEmpty!35131 (= (arr!28940 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10559)) mapDefault!35131)))))

(declare-fun b!970337 () Bool)

(declare-fun res!649510 () Bool)

(declare-fun e!547023 () Bool)

(assert (=> b!970337 (=> (not res!649510) (not e!547023))))

(declare-datatypes ((array!60154 0))(
  ( (array!60155 (arr!28941 (Array (_ BitVec 32) (_ BitVec 64))) (size!29422 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60154)

(declare-datatypes ((List!20113 0))(
  ( (Nil!20110) (Cons!20109 (h!21271 (_ BitVec 64)) (t!28467 List!20113)) )
))
(declare-fun arrayNoDuplicates!0 (array!60154 (_ BitVec 32) List!20113) Bool)

(assert (=> b!970337 (= res!649510 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20110))))

(declare-fun b!970338 () Bool)

(declare-fun res!649513 () Bool)

(assert (=> b!970338 (=> (not res!649513) (not e!547023))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970338 (= res!649513 (and (= (size!29421 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29422 _keys!1717) (size!29421 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970339 () Bool)

(assert (=> b!970339 (= e!547023 false)))

(declare-fun zeroValue!1367 () V!34425)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34425)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun lt!431517 () Bool)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14290 0))(
  ( (tuple2!14291 (_1!7156 (_ BitVec 64)) (_2!7156 V!34425)) )
))
(declare-datatypes ((List!20114 0))(
  ( (Nil!20111) (Cons!20110 (h!21272 tuple2!14290) (t!28468 List!20114)) )
))
(declare-datatypes ((ListLongMap!12977 0))(
  ( (ListLongMap!12978 (toList!6504 List!20114)) )
))
(declare-fun contains!5552 (ListLongMap!12977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3666 (array!60154 array!60152 (_ BitVec 32) (_ BitVec 32) V!34425 V!34425 (_ BitVec 32) Int) ListLongMap!12977)

(assert (=> b!970339 (= lt!431517 (contains!5552 (getCurrentListMap!3666 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28941 _keys!1717) i!822)))))

(declare-fun b!970340 () Bool)

(declare-fun res!649511 () Bool)

(assert (=> b!970340 (=> (not res!649511) (not e!547023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60154 (_ BitVec 32)) Bool)

(assert (=> b!970340 (= res!649511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649509 () Bool)

(assert (=> start!83172 (=> (not res!649509) (not e!547023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83172 (= res!649509 (validMask!0 mask!2147))))

(assert (=> start!83172 e!547023))

(assert (=> start!83172 true))

(declare-fun array_inv!22463 (array!60152) Bool)

(assert (=> start!83172 (and (array_inv!22463 _values!1425) e!547026)))

(declare-fun tp_is_empty!22081 () Bool)

(assert (=> start!83172 tp_is_empty!22081))

(assert (=> start!83172 tp!66828))

(declare-fun array_inv!22464 (array!60154) Bool)

(assert (=> start!83172 (array_inv!22464 _keys!1717)))

(declare-fun b!970336 () Bool)

(declare-fun res!649508 () Bool)

(assert (=> b!970336 (=> (not res!649508) (not e!547023))))

(assert (=> b!970336 (= res!649508 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29422 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29422 _keys!1717))))))

(declare-fun b!970341 () Bool)

(assert (=> b!970341 (= e!547025 tp_is_empty!22081)))

(declare-fun mapIsEmpty!35131 () Bool)

(assert (=> mapIsEmpty!35131 mapRes!35131))

(declare-fun b!970342 () Bool)

(assert (=> b!970342 (= e!547022 tp_is_empty!22081)))

(declare-fun b!970343 () Bool)

(declare-fun res!649512 () Bool)

(assert (=> b!970343 (=> (not res!649512) (not e!547023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970343 (= res!649512 (validKeyInArray!0 (select (arr!28941 _keys!1717) i!822)))))

(assert (= (and start!83172 res!649509) b!970338))

(assert (= (and b!970338 res!649513) b!970340))

(assert (= (and b!970340 res!649511) b!970337))

(assert (= (and b!970337 res!649510) b!970336))

(assert (= (and b!970336 res!649508) b!970343))

(assert (= (and b!970343 res!649512) b!970339))

(assert (= (and b!970335 condMapEmpty!35131) mapIsEmpty!35131))

(assert (= (and b!970335 (not condMapEmpty!35131)) mapNonEmpty!35131))

(get-info :version)

(assert (= (and mapNonEmpty!35131 ((_ is ValueCellFull!10559) mapValue!35131)) b!970342))

(assert (= (and b!970335 ((_ is ValueCellFull!10559) mapDefault!35131)) b!970341))

(assert (= start!83172 b!970335))

(declare-fun m!897509 () Bool)

(assert (=> b!970340 m!897509))

(declare-fun m!897511 () Bool)

(assert (=> mapNonEmpty!35131 m!897511))

(declare-fun m!897513 () Bool)

(assert (=> b!970343 m!897513))

(assert (=> b!970343 m!897513))

(declare-fun m!897515 () Bool)

(assert (=> b!970343 m!897515))

(declare-fun m!897517 () Bool)

(assert (=> start!83172 m!897517))

(declare-fun m!897519 () Bool)

(assert (=> start!83172 m!897519))

(declare-fun m!897521 () Bool)

(assert (=> start!83172 m!897521))

(declare-fun m!897523 () Bool)

(assert (=> b!970339 m!897523))

(assert (=> b!970339 m!897513))

(assert (=> b!970339 m!897523))

(assert (=> b!970339 m!897513))

(declare-fun m!897525 () Bool)

(assert (=> b!970339 m!897525))

(declare-fun m!897527 () Bool)

(assert (=> b!970337 m!897527))

(check-sat (not b!970337) tp_is_empty!22081 (not b!970340) (not b!970343) b_and!30645 (not start!83172) (not mapNonEmpty!35131) (not b_next!19183) (not b!970339))
(check-sat b_and!30645 (not b_next!19183))
