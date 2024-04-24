; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83376 () Bool)

(assert start!83376)

(declare-fun b_free!19201 () Bool)

(declare-fun b_next!19201 () Bool)

(assert (=> start!83376 (= b_free!19201 (not b_next!19201))))

(declare-fun tp!66883 () Bool)

(declare-fun b_and!30699 () Bool)

(assert (=> start!83376 (= tp!66883 b_and!30699)))

(declare-fun b!971722 () Bool)

(declare-fun e!547888 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((array!60272 0))(
  ( (array!60273 (arr!28995 (Array (_ BitVec 32) (_ BitVec 64))) (size!29475 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60272)

(assert (=> b!971722 (= e!547888 (bvsgt (bvsub from!2118 #b00000000000000000000000000000001) (size!29475 _keys!1717)))))

(declare-fun b!971723 () Bool)

(declare-fun e!547891 () Bool)

(declare-fun tp_is_empty!22099 () Bool)

(assert (=> b!971723 (= e!547891 tp_is_empty!22099)))

(declare-fun b!971724 () Bool)

(declare-fun res!650126 () Bool)

(assert (=> b!971724 (=> (not res!650126) (not e!547888))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971724 (= res!650126 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29475 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29475 _keys!1717))))))

(declare-fun b!971725 () Bool)

(declare-fun e!547887 () Bool)

(declare-fun mapRes!35158 () Bool)

(assert (=> b!971725 (= e!547887 (and e!547891 mapRes!35158))))

(declare-fun condMapEmpty!35158 () Bool)

(declare-datatypes ((V!34449 0))(
  ( (V!34450 (val!11100 Int)) )
))
(declare-datatypes ((ValueCell!10568 0))(
  ( (ValueCellFull!10568 (v!13656 V!34449)) (EmptyCell!10568) )
))
(declare-datatypes ((array!60274 0))(
  ( (array!60275 (arr!28996 (Array (_ BitVec 32) ValueCell!10568)) (size!29476 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60274)

(declare-fun mapDefault!35158 () ValueCell!10568)

(assert (=> b!971725 (= condMapEmpty!35158 (= (arr!28996 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10568)) mapDefault!35158)))))

(declare-fun mapIsEmpty!35158 () Bool)

(assert (=> mapIsEmpty!35158 mapRes!35158))

(declare-fun b!971726 () Bool)

(declare-fun e!547890 () Bool)

(assert (=> b!971726 (= e!547890 tp_is_empty!22099)))

(declare-fun b!971727 () Bool)

(declare-fun res!650131 () Bool)

(assert (=> b!971727 (=> (not res!650131) (not e!547888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971727 (= res!650131 (validKeyInArray!0 (select (arr!28995 _keys!1717) i!822)))))

(declare-fun b!971728 () Bool)

(declare-fun res!650132 () Bool)

(assert (=> b!971728 (=> (not res!650132) (not e!547888))))

(declare-datatypes ((List!20081 0))(
  ( (Nil!20078) (Cons!20077 (h!21245 (_ BitVec 64)) (t!28436 List!20081)) )
))
(declare-fun arrayNoDuplicates!0 (array!60272 (_ BitVec 32) List!20081) Bool)

(assert (=> b!971728 (= res!650132 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20078))))

(declare-fun b!971729 () Bool)

(declare-fun res!650127 () Bool)

(assert (=> b!971729 (=> (not res!650127) (not e!547888))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60272 (_ BitVec 32)) Bool)

(assert (=> b!971729 (= res!650127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650130 () Bool)

(assert (=> start!83376 (=> (not res!650130) (not e!547888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83376 (= res!650130 (validMask!0 mask!2147))))

(assert (=> start!83376 e!547888))

(assert (=> start!83376 true))

(declare-fun array_inv!22489 (array!60274) Bool)

(assert (=> start!83376 (and (array_inv!22489 _values!1425) e!547887)))

(assert (=> start!83376 tp_is_empty!22099))

(assert (=> start!83376 tp!66883))

(declare-fun array_inv!22490 (array!60272) Bool)

(assert (=> start!83376 (array_inv!22490 _keys!1717)))

(declare-fun mapNonEmpty!35158 () Bool)

(declare-fun tp!66882 () Bool)

(assert (=> mapNonEmpty!35158 (= mapRes!35158 (and tp!66882 e!547890))))

(declare-fun mapValue!35158 () ValueCell!10568)

(declare-fun mapKey!35158 () (_ BitVec 32))

(declare-fun mapRest!35158 () (Array (_ BitVec 32) ValueCell!10568))

(assert (=> mapNonEmpty!35158 (= (arr!28996 _values!1425) (store mapRest!35158 mapKey!35158 mapValue!35158))))

(declare-fun b!971730 () Bool)

(declare-fun res!650128 () Bool)

(assert (=> b!971730 (=> (not res!650128) (not e!547888))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971730 (= res!650128 (and (= (size!29476 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29475 _keys!1717) (size!29476 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971731 () Bool)

(declare-fun res!650129 () Bool)

(assert (=> b!971731 (=> (not res!650129) (not e!547888))))

(declare-fun zeroValue!1367 () V!34449)

(declare-fun minValue!1367 () V!34449)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14226 0))(
  ( (tuple2!14227 (_1!7124 (_ BitVec 64)) (_2!7124 V!34449)) )
))
(declare-datatypes ((List!20082 0))(
  ( (Nil!20079) (Cons!20078 (h!21246 tuple2!14226) (t!28437 List!20082)) )
))
(declare-datatypes ((ListLongMap!12925 0))(
  ( (ListLongMap!12926 (toList!6478 List!20082)) )
))
(declare-fun contains!5593 (ListLongMap!12925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3711 (array!60272 array!60274 (_ BitVec 32) (_ BitVec 32) V!34449 V!34449 (_ BitVec 32) Int) ListLongMap!12925)

(assert (=> b!971731 (= res!650129 (contains!5593 (getCurrentListMap!3711 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28995 _keys!1717) i!822)))))

(assert (= (and start!83376 res!650130) b!971730))

(assert (= (and b!971730 res!650128) b!971729))

(assert (= (and b!971729 res!650127) b!971728))

(assert (= (and b!971728 res!650132) b!971724))

(assert (= (and b!971724 res!650126) b!971727))

(assert (= (and b!971727 res!650131) b!971731))

(assert (= (and b!971731 res!650129) b!971722))

(assert (= (and b!971725 condMapEmpty!35158) mapIsEmpty!35158))

(assert (= (and b!971725 (not condMapEmpty!35158)) mapNonEmpty!35158))

(get-info :version)

(assert (= (and mapNonEmpty!35158 ((_ is ValueCellFull!10568) mapValue!35158)) b!971726))

(assert (= (and b!971725 ((_ is ValueCellFull!10568) mapDefault!35158)) b!971723))

(assert (= start!83376 b!971725))

(declare-fun m!899741 () Bool)

(assert (=> b!971727 m!899741))

(assert (=> b!971727 m!899741))

(declare-fun m!899743 () Bool)

(assert (=> b!971727 m!899743))

(declare-fun m!899745 () Bool)

(assert (=> b!971731 m!899745))

(assert (=> b!971731 m!899741))

(assert (=> b!971731 m!899745))

(assert (=> b!971731 m!899741))

(declare-fun m!899747 () Bool)

(assert (=> b!971731 m!899747))

(declare-fun m!899749 () Bool)

(assert (=> b!971728 m!899749))

(declare-fun m!899751 () Bool)

(assert (=> start!83376 m!899751))

(declare-fun m!899753 () Bool)

(assert (=> start!83376 m!899753))

(declare-fun m!899755 () Bool)

(assert (=> start!83376 m!899755))

(declare-fun m!899757 () Bool)

(assert (=> b!971729 m!899757))

(declare-fun m!899759 () Bool)

(assert (=> mapNonEmpty!35158 m!899759))

(check-sat b_and!30699 tp_is_empty!22099 (not start!83376) (not b!971728) (not b!971729) (not b_next!19201) (not b!971731) (not mapNonEmpty!35158) (not b!971727))
(check-sat b_and!30699 (not b_next!19201))
