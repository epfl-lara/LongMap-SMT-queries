; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83192 () Bool)

(assert start!83192)

(declare-fun b_free!19185 () Bool)

(declare-fun b_next!19185 () Bool)

(assert (=> start!83192 (= b_free!19185 (not b_next!19185))))

(declare-fun tp!66833 () Bool)

(declare-fun b_and!30673 () Bool)

(assert (=> start!83192 (= tp!66833 b_and!30673)))

(declare-fun b!970601 () Bool)

(declare-fun res!649640 () Bool)

(declare-fun e!547187 () Bool)

(assert (=> b!970601 (=> (not res!649640) (not e!547187))))

(declare-datatypes ((array!60221 0))(
  ( (array!60222 (arr!28974 (Array (_ BitVec 32) (_ BitVec 64))) (size!29453 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60221)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60221 (_ BitVec 32)) Bool)

(assert (=> b!970601 (= res!649640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35134 () Bool)

(declare-fun mapRes!35134 () Bool)

(declare-fun tp!66834 () Bool)

(declare-fun e!547189 () Bool)

(assert (=> mapNonEmpty!35134 (= mapRes!35134 (and tp!66834 e!547189))))

(declare-fun mapKey!35134 () (_ BitVec 32))

(declare-datatypes ((V!34427 0))(
  ( (V!34428 (val!11092 Int)) )
))
(declare-datatypes ((ValueCell!10560 0))(
  ( (ValueCellFull!10560 (v!13651 V!34427)) (EmptyCell!10560) )
))
(declare-datatypes ((array!60223 0))(
  ( (array!60224 (arr!28975 (Array (_ BitVec 32) ValueCell!10560)) (size!29454 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60223)

(declare-fun mapRest!35134 () (Array (_ BitVec 32) ValueCell!10560))

(declare-fun mapValue!35134 () ValueCell!10560)

(assert (=> mapNonEmpty!35134 (= (arr!28975 _values!1425) (store mapRest!35134 mapKey!35134 mapValue!35134))))

(declare-fun mapIsEmpty!35134 () Bool)

(assert (=> mapIsEmpty!35134 mapRes!35134))

(declare-fun b!970603 () Bool)

(declare-fun res!649636 () Bool)

(assert (=> b!970603 (=> (not res!649636) (not e!547187))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970603 (= res!649636 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29453 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29453 _keys!1717))))))

(declare-fun b!970604 () Bool)

(declare-fun res!649641 () Bool)

(assert (=> b!970604 (=> (not res!649641) (not e!547187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970604 (= res!649641 (validKeyInArray!0 (select (arr!28974 _keys!1717) i!822)))))

(declare-fun b!970605 () Bool)

(declare-fun tp_is_empty!22083 () Bool)

(assert (=> b!970605 (= e!547189 tp_is_empty!22083)))

(declare-fun b!970602 () Bool)

(declare-fun e!547188 () Bool)

(assert (=> b!970602 (= e!547188 tp_is_empty!22083)))

(declare-fun res!649637 () Bool)

(assert (=> start!83192 (=> (not res!649637) (not e!547187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83192 (= res!649637 (validMask!0 mask!2147))))

(assert (=> start!83192 e!547187))

(assert (=> start!83192 true))

(declare-fun e!547185 () Bool)

(declare-fun array_inv!22427 (array!60223) Bool)

(assert (=> start!83192 (and (array_inv!22427 _values!1425) e!547185)))

(assert (=> start!83192 tp_is_empty!22083))

(assert (=> start!83192 tp!66833))

(declare-fun array_inv!22428 (array!60221) Bool)

(assert (=> start!83192 (array_inv!22428 _keys!1717)))

(declare-fun b!970606 () Bool)

(declare-fun res!649639 () Bool)

(assert (=> b!970606 (=> (not res!649639) (not e!547187))))

(declare-datatypes ((List!20083 0))(
  ( (Nil!20080) (Cons!20079 (h!21241 (_ BitVec 64)) (t!28446 List!20083)) )
))
(declare-fun arrayNoDuplicates!0 (array!60221 (_ BitVec 32) List!20083) Bool)

(assert (=> b!970606 (= res!649639 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20080))))

(declare-fun b!970607 () Bool)

(assert (=> b!970607 (= e!547187 false)))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34427)

(declare-fun lt!431756 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34427)

(declare-datatypes ((tuple2!14214 0))(
  ( (tuple2!14215 (_1!7118 (_ BitVec 64)) (_2!7118 V!34427)) )
))
(declare-datatypes ((List!20084 0))(
  ( (Nil!20081) (Cons!20080 (h!21242 tuple2!14214) (t!28447 List!20084)) )
))
(declare-datatypes ((ListLongMap!12911 0))(
  ( (ListLongMap!12912 (toList!6471 List!20084)) )
))
(declare-fun contains!5575 (ListLongMap!12911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3704 (array!60221 array!60223 (_ BitVec 32) (_ BitVec 32) V!34427 V!34427 (_ BitVec 32) Int) ListLongMap!12911)

(assert (=> b!970607 (= lt!431756 (contains!5575 (getCurrentListMap!3704 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28974 _keys!1717) i!822)))))

(declare-fun b!970608 () Bool)

(declare-fun res!649638 () Bool)

(assert (=> b!970608 (=> (not res!649638) (not e!547187))))

(assert (=> b!970608 (= res!649638 (and (= (size!29454 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29453 _keys!1717) (size!29454 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970609 () Bool)

(assert (=> b!970609 (= e!547185 (and e!547188 mapRes!35134))))

(declare-fun condMapEmpty!35134 () Bool)

(declare-fun mapDefault!35134 () ValueCell!10560)

(assert (=> b!970609 (= condMapEmpty!35134 (= (arr!28975 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10560)) mapDefault!35134)))))

(assert (= (and start!83192 res!649637) b!970608))

(assert (= (and b!970608 res!649638) b!970601))

(assert (= (and b!970601 res!649640) b!970606))

(assert (= (and b!970606 res!649639) b!970603))

(assert (= (and b!970603 res!649636) b!970604))

(assert (= (and b!970604 res!649641) b!970607))

(assert (= (and b!970609 condMapEmpty!35134) mapIsEmpty!35134))

(assert (= (and b!970609 (not condMapEmpty!35134)) mapNonEmpty!35134))

(get-info :version)

(assert (= (and mapNonEmpty!35134 ((_ is ValueCellFull!10560) mapValue!35134)) b!970605))

(assert (= (and b!970609 ((_ is ValueCellFull!10560) mapDefault!35134)) b!970602))

(assert (= start!83192 b!970609))

(declare-fun m!898287 () Bool)

(assert (=> b!970607 m!898287))

(declare-fun m!898289 () Bool)

(assert (=> b!970607 m!898289))

(assert (=> b!970607 m!898287))

(assert (=> b!970607 m!898289))

(declare-fun m!898291 () Bool)

(assert (=> b!970607 m!898291))

(declare-fun m!898293 () Bool)

(assert (=> start!83192 m!898293))

(declare-fun m!898295 () Bool)

(assert (=> start!83192 m!898295))

(declare-fun m!898297 () Bool)

(assert (=> start!83192 m!898297))

(declare-fun m!898299 () Bool)

(assert (=> b!970606 m!898299))

(assert (=> b!970604 m!898289))

(assert (=> b!970604 m!898289))

(declare-fun m!898301 () Bool)

(assert (=> b!970604 m!898301))

(declare-fun m!898303 () Bool)

(assert (=> b!970601 m!898303))

(declare-fun m!898305 () Bool)

(assert (=> mapNonEmpty!35134 m!898305))

(check-sat (not start!83192) (not b!970601) (not b!970604) tp_is_empty!22083 b_and!30673 (not b!970607) (not b!970606) (not mapNonEmpty!35134) (not b_next!19185))
(check-sat b_and!30673 (not b_next!19185))
