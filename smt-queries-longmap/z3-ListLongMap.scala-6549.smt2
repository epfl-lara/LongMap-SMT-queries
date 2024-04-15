; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83160 () Bool)

(assert start!83160)

(declare-fun b_free!19171 () Bool)

(declare-fun b_next!19171 () Bool)

(assert (=> start!83160 (= b_free!19171 (not b_next!19171))))

(declare-fun tp!66793 () Bool)

(declare-fun b_and!30633 () Bool)

(assert (=> start!83160 (= tp!66793 b_and!30633)))

(declare-fun b!970173 () Bool)

(declare-fun res!649403 () Bool)

(declare-fun e!546936 () Bool)

(assert (=> b!970173 (=> (not res!649403) (not e!546936))))

(declare-datatypes ((array!60128 0))(
  ( (array!60129 (arr!28928 (Array (_ BitVec 32) (_ BitVec 64))) (size!29409 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60128)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970173 (= res!649403 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29409 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29409 _keys!1717))))))

(declare-fun b!970174 () Bool)

(declare-fun e!546933 () Bool)

(declare-fun tp_is_empty!22069 () Bool)

(assert (=> b!970174 (= e!546933 tp_is_empty!22069)))

(declare-fun mapNonEmpty!35113 () Bool)

(declare-fun mapRes!35113 () Bool)

(declare-fun tp!66792 () Bool)

(assert (=> mapNonEmpty!35113 (= mapRes!35113 (and tp!66792 e!546933))))

(declare-datatypes ((V!34409 0))(
  ( (V!34410 (val!11085 Int)) )
))
(declare-datatypes ((ValueCell!10553 0))(
  ( (ValueCellFull!10553 (v!13643 V!34409)) (EmptyCell!10553) )
))
(declare-fun mapRest!35113 () (Array (_ BitVec 32) ValueCell!10553))

(declare-fun mapValue!35113 () ValueCell!10553)

(declare-datatypes ((array!60130 0))(
  ( (array!60131 (arr!28929 (Array (_ BitVec 32) ValueCell!10553)) (size!29410 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60130)

(declare-fun mapKey!35113 () (_ BitVec 32))

(assert (=> mapNonEmpty!35113 (= (arr!28929 _values!1425) (store mapRest!35113 mapKey!35113 mapValue!35113))))

(declare-fun b!970175 () Bool)

(declare-fun res!649400 () Bool)

(assert (=> b!970175 (=> (not res!649400) (not e!546936))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970175 (= res!649400 (and (= (size!29410 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29409 _keys!1717) (size!29410 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970176 () Bool)

(declare-fun e!546935 () Bool)

(declare-fun e!546932 () Bool)

(assert (=> b!970176 (= e!546935 (and e!546932 mapRes!35113))))

(declare-fun condMapEmpty!35113 () Bool)

(declare-fun mapDefault!35113 () ValueCell!10553)

(assert (=> b!970176 (= condMapEmpty!35113 (= (arr!28929 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10553)) mapDefault!35113)))))

(declare-fun b!970177 () Bool)

(declare-fun res!649404 () Bool)

(assert (=> b!970177 (=> (not res!649404) (not e!546936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970177 (= res!649404 (validKeyInArray!0 (select (arr!28928 _keys!1717) i!822)))))

(declare-fun res!649402 () Bool)

(assert (=> start!83160 (=> (not res!649402) (not e!546936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83160 (= res!649402 (validMask!0 mask!2147))))

(assert (=> start!83160 e!546936))

(assert (=> start!83160 true))

(declare-fun array_inv!22453 (array!60130) Bool)

(assert (=> start!83160 (and (array_inv!22453 _values!1425) e!546935)))

(assert (=> start!83160 tp_is_empty!22069))

(assert (=> start!83160 tp!66793))

(declare-fun array_inv!22454 (array!60128) Bool)

(assert (=> start!83160 (array_inv!22454 _keys!1717)))

(declare-fun b!970178 () Bool)

(assert (=> b!970178 (= e!546932 tp_is_empty!22069)))

(declare-fun b!970179 () Bool)

(declare-fun res!649405 () Bool)

(assert (=> b!970179 (=> (not res!649405) (not e!546936))))

(declare-datatypes ((List!20105 0))(
  ( (Nil!20102) (Cons!20101 (h!21263 (_ BitVec 64)) (t!28459 List!20105)) )
))
(declare-fun arrayNoDuplicates!0 (array!60128 (_ BitVec 32) List!20105) Bool)

(assert (=> b!970179 (= res!649405 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20102))))

(declare-fun b!970180 () Bool)

(assert (=> b!970180 (= e!546936 false)))

(declare-fun lt!431499 () Bool)

(declare-fun zeroValue!1367 () V!34409)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34409)

(declare-datatypes ((tuple2!14282 0))(
  ( (tuple2!14283 (_1!7152 (_ BitVec 64)) (_2!7152 V!34409)) )
))
(declare-datatypes ((List!20106 0))(
  ( (Nil!20103) (Cons!20102 (h!21264 tuple2!14282) (t!28460 List!20106)) )
))
(declare-datatypes ((ListLongMap!12969 0))(
  ( (ListLongMap!12970 (toList!6500 List!20106)) )
))
(declare-fun contains!5548 (ListLongMap!12969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3662 (array!60128 array!60130 (_ BitVec 32) (_ BitVec 32) V!34409 V!34409 (_ BitVec 32) Int) ListLongMap!12969)

(assert (=> b!970180 (= lt!431499 (contains!5548 (getCurrentListMap!3662 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28928 _keys!1717) i!822)))))

(declare-fun b!970181 () Bool)

(declare-fun res!649401 () Bool)

(assert (=> b!970181 (=> (not res!649401) (not e!546936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60128 (_ BitVec 32)) Bool)

(assert (=> b!970181 (= res!649401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35113 () Bool)

(assert (=> mapIsEmpty!35113 mapRes!35113))

(assert (= (and start!83160 res!649402) b!970175))

(assert (= (and b!970175 res!649400) b!970181))

(assert (= (and b!970181 res!649401) b!970179))

(assert (= (and b!970179 res!649405) b!970173))

(assert (= (and b!970173 res!649403) b!970177))

(assert (= (and b!970177 res!649404) b!970180))

(assert (= (and b!970176 condMapEmpty!35113) mapIsEmpty!35113))

(assert (= (and b!970176 (not condMapEmpty!35113)) mapNonEmpty!35113))

(get-info :version)

(assert (= (and mapNonEmpty!35113 ((_ is ValueCellFull!10553) mapValue!35113)) b!970174))

(assert (= (and b!970176 ((_ is ValueCellFull!10553) mapDefault!35113)) b!970178))

(assert (= start!83160 b!970176))

(declare-fun m!897389 () Bool)

(assert (=> b!970177 m!897389))

(assert (=> b!970177 m!897389))

(declare-fun m!897391 () Bool)

(assert (=> b!970177 m!897391))

(declare-fun m!897393 () Bool)

(assert (=> start!83160 m!897393))

(declare-fun m!897395 () Bool)

(assert (=> start!83160 m!897395))

(declare-fun m!897397 () Bool)

(assert (=> start!83160 m!897397))

(declare-fun m!897399 () Bool)

(assert (=> b!970181 m!897399))

(declare-fun m!897401 () Bool)

(assert (=> b!970179 m!897401))

(declare-fun m!897403 () Bool)

(assert (=> mapNonEmpty!35113 m!897403))

(declare-fun m!897405 () Bool)

(assert (=> b!970180 m!897405))

(assert (=> b!970180 m!897389))

(assert (=> b!970180 m!897405))

(assert (=> b!970180 m!897389))

(declare-fun m!897407 () Bool)

(assert (=> b!970180 m!897407))

(check-sat (not b!970177) tp_is_empty!22069 (not b_next!19171) (not b!970180) b_and!30633 (not start!83160) (not b!970179) (not b!970181) (not mapNonEmpty!35113))
(check-sat b_and!30633 (not b_next!19171))
