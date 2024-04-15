; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82202 () Bool)

(assert start!82202)

(declare-fun b_free!18493 () Bool)

(declare-fun b_next!18493 () Bool)

(assert (=> start!82202 (= b_free!18493 (not b_next!18493))))

(declare-fun tp!64441 () Bool)

(declare-fun b_and!29955 () Bool)

(assert (=> start!82202 (= tp!64441 b_and!29955)))

(declare-fun b!958095 () Bool)

(declare-fun res!641365 () Bool)

(declare-fun e!540118 () Bool)

(assert (=> b!958095 (=> (not res!641365) (not e!540118))))

(declare-datatypes ((array!58436 0))(
  ( (array!58437 (arr!28092 (Array (_ BitVec 32) (_ BitVec 64))) (size!28573 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58436)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958095 (= res!641365 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28573 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28573 _keys!1668))))))

(declare-fun b!958096 () Bool)

(declare-fun res!641367 () Bool)

(assert (=> b!958096 (=> (not res!641367) (not e!540118))))

(declare-datatypes ((List!19566 0))(
  ( (Nil!19563) (Cons!19562 (h!20724 (_ BitVec 64)) (t!27920 List!19566)) )
))
(declare-fun arrayNoDuplicates!0 (array!58436 (_ BitVec 32) List!19566) Bool)

(assert (=> b!958096 (= res!641367 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19563))))

(declare-fun b!958097 () Bool)

(declare-fun e!540121 () Bool)

(declare-fun tp_is_empty!21199 () Bool)

(assert (=> b!958097 (= e!540121 tp_is_empty!21199)))

(declare-fun b!958098 () Bool)

(declare-fun e!540120 () Bool)

(assert (=> b!958098 (= e!540120 tp_is_empty!21199)))

(declare-fun mapIsEmpty!33778 () Bool)

(declare-fun mapRes!33778 () Bool)

(assert (=> mapIsEmpty!33778 mapRes!33778))

(declare-fun res!641366 () Bool)

(assert (=> start!82202 (=> (not res!641366) (not e!540118))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82202 (= res!641366 (validMask!0 mask!2088))))

(assert (=> start!82202 e!540118))

(assert (=> start!82202 true))

(assert (=> start!82202 tp_is_empty!21199))

(declare-fun array_inv!21847 (array!58436) Bool)

(assert (=> start!82202 (array_inv!21847 _keys!1668)))

(declare-datatypes ((V!33249 0))(
  ( (V!33250 (val!10650 Int)) )
))
(declare-datatypes ((ValueCell!10118 0))(
  ( (ValueCellFull!10118 (v!13206 V!33249)) (EmptyCell!10118) )
))
(declare-datatypes ((array!58438 0))(
  ( (array!58439 (arr!28093 (Array (_ BitVec 32) ValueCell!10118)) (size!28574 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58438)

(declare-fun e!540122 () Bool)

(declare-fun array_inv!21848 (array!58438) Bool)

(assert (=> start!82202 (and (array_inv!21848 _values!1386) e!540122)))

(assert (=> start!82202 tp!64441))

(declare-fun b!958099 () Bool)

(assert (=> b!958099 (= e!540122 (and e!540121 mapRes!33778))))

(declare-fun condMapEmpty!33778 () Bool)

(declare-fun mapDefault!33778 () ValueCell!10118)

(assert (=> b!958099 (= condMapEmpty!33778 (= (arr!28093 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10118)) mapDefault!33778)))))

(declare-fun b!958100 () Bool)

(assert (=> b!958100 (= e!540118 false)))

(declare-fun minValue!1328 () V!33249)

(declare-fun lt!430195 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33249)

(declare-datatypes ((tuple2!13780 0))(
  ( (tuple2!13781 (_1!6901 (_ BitVec 64)) (_2!6901 V!33249)) )
))
(declare-datatypes ((List!19567 0))(
  ( (Nil!19564) (Cons!19563 (h!20725 tuple2!13780) (t!27921 List!19567)) )
))
(declare-datatypes ((ListLongMap!12467 0))(
  ( (ListLongMap!12468 (toList!6249 List!19567)) )
))
(declare-fun contains!5295 (ListLongMap!12467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3411 (array!58436 array!58438 (_ BitVec 32) (_ BitVec 32) V!33249 V!33249 (_ BitVec 32) Int) ListLongMap!12467)

(assert (=> b!958100 (= lt!430195 (contains!5295 (getCurrentListMap!3411 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28092 _keys!1668) i!793)))))

(declare-fun b!958101 () Bool)

(declare-fun res!641368 () Bool)

(assert (=> b!958101 (=> (not res!641368) (not e!540118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958101 (= res!641368 (validKeyInArray!0 (select (arr!28092 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33778 () Bool)

(declare-fun tp!64440 () Bool)

(assert (=> mapNonEmpty!33778 (= mapRes!33778 (and tp!64440 e!540120))))

(declare-fun mapRest!33778 () (Array (_ BitVec 32) ValueCell!10118))

(declare-fun mapValue!33778 () ValueCell!10118)

(declare-fun mapKey!33778 () (_ BitVec 32))

(assert (=> mapNonEmpty!33778 (= (arr!28093 _values!1386) (store mapRest!33778 mapKey!33778 mapValue!33778))))

(declare-fun b!958102 () Bool)

(declare-fun res!641370 () Bool)

(assert (=> b!958102 (=> (not res!641370) (not e!540118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58436 (_ BitVec 32)) Bool)

(assert (=> b!958102 (= res!641370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958103 () Bool)

(declare-fun res!641369 () Bool)

(assert (=> b!958103 (=> (not res!641369) (not e!540118))))

(assert (=> b!958103 (= res!641369 (and (= (size!28574 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28573 _keys!1668) (size!28574 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82202 res!641366) b!958103))

(assert (= (and b!958103 res!641369) b!958102))

(assert (= (and b!958102 res!641370) b!958096))

(assert (= (and b!958096 res!641367) b!958095))

(assert (= (and b!958095 res!641365) b!958101))

(assert (= (and b!958101 res!641368) b!958100))

(assert (= (and b!958099 condMapEmpty!33778) mapIsEmpty!33778))

(assert (= (and b!958099 (not condMapEmpty!33778)) mapNonEmpty!33778))

(get-info :version)

(assert (= (and mapNonEmpty!33778 ((_ is ValueCellFull!10118) mapValue!33778)) b!958098))

(assert (= (and b!958099 ((_ is ValueCellFull!10118) mapDefault!33778)) b!958097))

(assert (= start!82202 b!958099))

(declare-fun m!888279 () Bool)

(assert (=> b!958102 m!888279))

(declare-fun m!888281 () Bool)

(assert (=> b!958096 m!888281))

(declare-fun m!888283 () Bool)

(assert (=> b!958101 m!888283))

(assert (=> b!958101 m!888283))

(declare-fun m!888285 () Bool)

(assert (=> b!958101 m!888285))

(declare-fun m!888287 () Bool)

(assert (=> mapNonEmpty!33778 m!888287))

(declare-fun m!888289 () Bool)

(assert (=> b!958100 m!888289))

(assert (=> b!958100 m!888283))

(assert (=> b!958100 m!888289))

(assert (=> b!958100 m!888283))

(declare-fun m!888291 () Bool)

(assert (=> b!958100 m!888291))

(declare-fun m!888293 () Bool)

(assert (=> start!82202 m!888293))

(declare-fun m!888295 () Bool)

(assert (=> start!82202 m!888295))

(declare-fun m!888297 () Bool)

(assert (=> start!82202 m!888297))

(check-sat (not start!82202) (not b_next!18493) (not b!958096) b_and!29955 (not b!958100) (not b!958101) (not b!958102) tp_is_empty!21199 (not mapNonEmpty!33778))
(check-sat b_and!29955 (not b_next!18493))
