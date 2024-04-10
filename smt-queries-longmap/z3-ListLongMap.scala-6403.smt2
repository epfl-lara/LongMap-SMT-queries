; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82216 () Bool)

(assert start!82216)

(declare-fun b_free!18489 () Bool)

(declare-fun b_next!18489 () Bool)

(assert (=> start!82216 (= b_free!18489 (not b_next!18489))))

(declare-fun tp!64427 () Bool)

(declare-fun b_and!29977 () Bool)

(assert (=> start!82216 (= tp!64427 b_and!29977)))

(declare-fun b!958280 () Bool)

(declare-fun res!641440 () Bool)

(declare-fun e!540239 () Bool)

(assert (=> b!958280 (=> (not res!641440) (not e!540239))))

(declare-datatypes ((array!58491 0))(
  ( (array!58492 (arr!28119 (Array (_ BitVec 32) (_ BitVec 64))) (size!28598 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58491)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958280 (= res!641440 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28598 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28598 _keys!1668))))))

(declare-fun b!958281 () Bool)

(assert (=> b!958281 (= e!540239 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33243 0))(
  ( (V!33244 (val!10648 Int)) )
))
(declare-fun minValue!1328 () V!33243)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10116 0))(
  ( (ValueCellFull!10116 (v!13205 V!33243)) (EmptyCell!10116) )
))
(declare-datatypes ((array!58493 0))(
  ( (array!58494 (arr!28120 (Array (_ BitVec 32) ValueCell!10116)) (size!28599 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58493)

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430425 () Bool)

(declare-fun zeroValue!1328 () V!33243)

(declare-datatypes ((tuple2!13726 0))(
  ( (tuple2!13727 (_1!6874 (_ BitVec 64)) (_2!6874 V!33243)) )
))
(declare-datatypes ((List!19547 0))(
  ( (Nil!19544) (Cons!19543 (h!20705 tuple2!13726) (t!27910 List!19547)) )
))
(declare-datatypes ((ListLongMap!12423 0))(
  ( (ListLongMap!12424 (toList!6227 List!19547)) )
))
(declare-fun contains!5328 (ListLongMap!12423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3460 (array!58491 array!58493 (_ BitVec 32) (_ BitVec 32) V!33243 V!33243 (_ BitVec 32) Int) ListLongMap!12423)

(assert (=> b!958281 (= lt!430425 (contains!5328 (getCurrentListMap!3460 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28119 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33772 () Bool)

(declare-fun mapRes!33772 () Bool)

(declare-fun tp!64428 () Bool)

(declare-fun e!540237 () Bool)

(assert (=> mapNonEmpty!33772 (= mapRes!33772 (and tp!64428 e!540237))))

(declare-fun mapRest!33772 () (Array (_ BitVec 32) ValueCell!10116))

(declare-fun mapKey!33772 () (_ BitVec 32))

(declare-fun mapValue!33772 () ValueCell!10116)

(assert (=> mapNonEmpty!33772 (= (arr!28120 _values!1386) (store mapRest!33772 mapKey!33772 mapValue!33772))))

(declare-fun b!958282 () Bool)

(declare-fun res!641439 () Bool)

(assert (=> b!958282 (=> (not res!641439) (not e!540239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58491 (_ BitVec 32)) Bool)

(assert (=> b!958282 (= res!641439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958284 () Bool)

(declare-fun e!540238 () Bool)

(declare-fun e!540240 () Bool)

(assert (=> b!958284 (= e!540238 (and e!540240 mapRes!33772))))

(declare-fun condMapEmpty!33772 () Bool)

(declare-fun mapDefault!33772 () ValueCell!10116)

(assert (=> b!958284 (= condMapEmpty!33772 (= (arr!28120 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10116)) mapDefault!33772)))))

(declare-fun b!958285 () Bool)

(declare-fun res!641444 () Bool)

(assert (=> b!958285 (=> (not res!641444) (not e!540239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958285 (= res!641444 (validKeyInArray!0 (select (arr!28119 _keys!1668) i!793)))))

(declare-fun b!958286 () Bool)

(declare-fun tp_is_empty!21195 () Bool)

(assert (=> b!958286 (= e!540237 tp_is_empty!21195)))

(declare-fun b!958287 () Bool)

(declare-fun res!641441 () Bool)

(assert (=> b!958287 (=> (not res!641441) (not e!540239))))

(assert (=> b!958287 (= res!641441 (and (= (size!28599 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28598 _keys!1668) (size!28599 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958288 () Bool)

(assert (=> b!958288 (= e!540240 tp_is_empty!21195)))

(declare-fun mapIsEmpty!33772 () Bool)

(assert (=> mapIsEmpty!33772 mapRes!33772))

(declare-fun res!641442 () Bool)

(assert (=> start!82216 (=> (not res!641442) (not e!540239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82216 (= res!641442 (validMask!0 mask!2088))))

(assert (=> start!82216 e!540239))

(assert (=> start!82216 true))

(assert (=> start!82216 tp_is_empty!21195))

(declare-fun array_inv!21811 (array!58491) Bool)

(assert (=> start!82216 (array_inv!21811 _keys!1668)))

(declare-fun array_inv!21812 (array!58493) Bool)

(assert (=> start!82216 (and (array_inv!21812 _values!1386) e!540238)))

(assert (=> start!82216 tp!64427))

(declare-fun b!958283 () Bool)

(declare-fun res!641443 () Bool)

(assert (=> b!958283 (=> (not res!641443) (not e!540239))))

(declare-datatypes ((List!19548 0))(
  ( (Nil!19545) (Cons!19544 (h!20706 (_ BitVec 64)) (t!27911 List!19548)) )
))
(declare-fun arrayNoDuplicates!0 (array!58491 (_ BitVec 32) List!19548) Bool)

(assert (=> b!958283 (= res!641443 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19545))))

(assert (= (and start!82216 res!641442) b!958287))

(assert (= (and b!958287 res!641441) b!958282))

(assert (= (and b!958282 res!641439) b!958283))

(assert (= (and b!958283 res!641443) b!958280))

(assert (= (and b!958280 res!641440) b!958285))

(assert (= (and b!958285 res!641444) b!958281))

(assert (= (and b!958284 condMapEmpty!33772) mapIsEmpty!33772))

(assert (= (and b!958284 (not condMapEmpty!33772)) mapNonEmpty!33772))

(get-info :version)

(assert (= (and mapNonEmpty!33772 ((_ is ValueCellFull!10116) mapValue!33772)) b!958286))

(assert (= (and b!958284 ((_ is ValueCellFull!10116) mapDefault!33772)) b!958288))

(assert (= start!82216 b!958284))

(declare-fun m!888997 () Bool)

(assert (=> b!958285 m!888997))

(assert (=> b!958285 m!888997))

(declare-fun m!888999 () Bool)

(assert (=> b!958285 m!888999))

(declare-fun m!889001 () Bool)

(assert (=> b!958282 m!889001))

(declare-fun m!889003 () Bool)

(assert (=> mapNonEmpty!33772 m!889003))

(declare-fun m!889005 () Bool)

(assert (=> start!82216 m!889005))

(declare-fun m!889007 () Bool)

(assert (=> start!82216 m!889007))

(declare-fun m!889009 () Bool)

(assert (=> start!82216 m!889009))

(declare-fun m!889011 () Bool)

(assert (=> b!958281 m!889011))

(assert (=> b!958281 m!888997))

(assert (=> b!958281 m!889011))

(assert (=> b!958281 m!888997))

(declare-fun m!889013 () Bool)

(assert (=> b!958281 m!889013))

(declare-fun m!889015 () Bool)

(assert (=> b!958283 m!889015))

(check-sat (not b!958283) (not start!82216) (not b_next!18489) (not b!958281) (not mapNonEmpty!33772) (not b!958282) tp_is_empty!21195 b_and!29977 (not b!958285))
(check-sat b_and!29977 (not b_next!18489))
