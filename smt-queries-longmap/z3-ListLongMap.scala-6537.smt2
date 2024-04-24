; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83274 () Bool)

(assert start!83274)

(declare-fun b_free!19099 () Bool)

(declare-fun b_next!19099 () Bool)

(assert (=> start!83274 (= b_free!19099 (not b_next!19099))))

(declare-fun tp!66576 () Bool)

(declare-fun b_and!30597 () Bool)

(assert (=> start!83274 (= tp!66576 b_and!30597)))

(declare-fun b!970334 () Bool)

(declare-fun res!649200 () Bool)

(declare-fun e!547125 () Bool)

(assert (=> b!970334 (=> (not res!649200) (not e!547125))))

(declare-datatypes ((array!60074 0))(
  ( (array!60075 (arr!28896 (Array (_ BitVec 32) (_ BitVec 64))) (size!29376 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60074)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970334 (= res!649200 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29376 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29376 _keys!1717))))))

(declare-fun res!649202 () Bool)

(assert (=> start!83274 (=> (not res!649202) (not e!547125))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83274 (= res!649202 (validMask!0 mask!2147))))

(assert (=> start!83274 e!547125))

(assert (=> start!83274 true))

(declare-datatypes ((V!34313 0))(
  ( (V!34314 (val!11049 Int)) )
))
(declare-datatypes ((ValueCell!10517 0))(
  ( (ValueCellFull!10517 (v!13605 V!34313)) (EmptyCell!10517) )
))
(declare-datatypes ((array!60076 0))(
  ( (array!60077 (arr!28897 (Array (_ BitVec 32) ValueCell!10517)) (size!29377 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60076)

(declare-fun e!547122 () Bool)

(declare-fun array_inv!22423 (array!60076) Bool)

(assert (=> start!83274 (and (array_inv!22423 _values!1425) e!547122)))

(declare-fun tp_is_empty!21997 () Bool)

(assert (=> start!83274 tp_is_empty!21997))

(assert (=> start!83274 tp!66576))

(declare-fun array_inv!22424 (array!60074) Bool)

(assert (=> start!83274 (array_inv!22424 _keys!1717)))

(declare-fun b!970335 () Bool)

(assert (=> b!970335 (= e!547125 false)))

(declare-fun lt!431997 () Bool)

(declare-fun zeroValue!1367 () V!34313)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34313)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14154 0))(
  ( (tuple2!14155 (_1!7088 (_ BitVec 64)) (_2!7088 V!34313)) )
))
(declare-datatypes ((List!20017 0))(
  ( (Nil!20014) (Cons!20013 (h!21181 tuple2!14154) (t!28372 List!20017)) )
))
(declare-datatypes ((ListLongMap!12853 0))(
  ( (ListLongMap!12854 (toList!6442 List!20017)) )
))
(declare-fun contains!5557 (ListLongMap!12853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3675 (array!60074 array!60076 (_ BitVec 32) (_ BitVec 32) V!34313 V!34313 (_ BitVec 32) Int) ListLongMap!12853)

(assert (=> b!970335 (= lt!431997 (contains!5557 (getCurrentListMap!3675 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28896 _keys!1717) i!822)))))

(declare-fun b!970336 () Bool)

(declare-fun res!649199 () Bool)

(assert (=> b!970336 (=> (not res!649199) (not e!547125))))

(declare-datatypes ((List!20018 0))(
  ( (Nil!20015) (Cons!20014 (h!21182 (_ BitVec 64)) (t!28373 List!20018)) )
))
(declare-fun arrayNoDuplicates!0 (array!60074 (_ BitVec 32) List!20018) Bool)

(assert (=> b!970336 (= res!649199 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20015))))

(declare-fun mapIsEmpty!35005 () Bool)

(declare-fun mapRes!35005 () Bool)

(assert (=> mapIsEmpty!35005 mapRes!35005))

(declare-fun b!970337 () Bool)

(declare-fun e!547123 () Bool)

(assert (=> b!970337 (= e!547123 tp_is_empty!21997)))

(declare-fun b!970338 () Bool)

(assert (=> b!970338 (= e!547122 (and e!547123 mapRes!35005))))

(declare-fun condMapEmpty!35005 () Bool)

(declare-fun mapDefault!35005 () ValueCell!10517)

(assert (=> b!970338 (= condMapEmpty!35005 (= (arr!28897 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10517)) mapDefault!35005)))))

(declare-fun b!970339 () Bool)

(declare-fun res!649201 () Bool)

(assert (=> b!970339 (=> (not res!649201) (not e!547125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60074 (_ BitVec 32)) Bool)

(assert (=> b!970339 (= res!649201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970340 () Bool)

(declare-fun res!649197 () Bool)

(assert (=> b!970340 (=> (not res!649197) (not e!547125))))

(assert (=> b!970340 (= res!649197 (and (= (size!29377 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29376 _keys!1717) (size!29377 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970341 () Bool)

(declare-fun res!649198 () Bool)

(assert (=> b!970341 (=> (not res!649198) (not e!547125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970341 (= res!649198 (validKeyInArray!0 (select (arr!28896 _keys!1717) i!822)))))

(declare-fun b!970342 () Bool)

(declare-fun e!547126 () Bool)

(assert (=> b!970342 (= e!547126 tp_is_empty!21997)))

(declare-fun mapNonEmpty!35005 () Bool)

(declare-fun tp!66577 () Bool)

(assert (=> mapNonEmpty!35005 (= mapRes!35005 (and tp!66577 e!547126))))

(declare-fun mapRest!35005 () (Array (_ BitVec 32) ValueCell!10517))

(declare-fun mapValue!35005 () ValueCell!10517)

(declare-fun mapKey!35005 () (_ BitVec 32))

(assert (=> mapNonEmpty!35005 (= (arr!28897 _values!1425) (store mapRest!35005 mapKey!35005 mapValue!35005))))

(assert (= (and start!83274 res!649202) b!970340))

(assert (= (and b!970340 res!649197) b!970339))

(assert (= (and b!970339 res!649201) b!970336))

(assert (= (and b!970336 res!649199) b!970334))

(assert (= (and b!970334 res!649200) b!970341))

(assert (= (and b!970341 res!649198) b!970335))

(assert (= (and b!970338 condMapEmpty!35005) mapIsEmpty!35005))

(assert (= (and b!970338 (not condMapEmpty!35005)) mapNonEmpty!35005))

(get-info :version)

(assert (= (and mapNonEmpty!35005 ((_ is ValueCellFull!10517) mapValue!35005)) b!970342))

(assert (= (and b!970338 ((_ is ValueCellFull!10517) mapDefault!35005)) b!970337))

(assert (= start!83274 b!970338))

(declare-fun m!898721 () Bool)

(assert (=> b!970341 m!898721))

(assert (=> b!970341 m!898721))

(declare-fun m!898723 () Bool)

(assert (=> b!970341 m!898723))

(declare-fun m!898725 () Bool)

(assert (=> mapNonEmpty!35005 m!898725))

(declare-fun m!898727 () Bool)

(assert (=> b!970339 m!898727))

(declare-fun m!898729 () Bool)

(assert (=> b!970336 m!898729))

(declare-fun m!898731 () Bool)

(assert (=> b!970335 m!898731))

(assert (=> b!970335 m!898721))

(assert (=> b!970335 m!898731))

(assert (=> b!970335 m!898721))

(declare-fun m!898733 () Bool)

(assert (=> b!970335 m!898733))

(declare-fun m!898735 () Bool)

(assert (=> start!83274 m!898735))

(declare-fun m!898737 () Bool)

(assert (=> start!83274 m!898737))

(declare-fun m!898739 () Bool)

(assert (=> start!83274 m!898739))

(check-sat tp_is_empty!21997 (not b_next!19099) b_and!30597 (not b!970335) (not b!970336) (not start!83274) (not b!970341) (not b!970339) (not mapNonEmpty!35005))
(check-sat b_and!30597 (not b_next!19099))
