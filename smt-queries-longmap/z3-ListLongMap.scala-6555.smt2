; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83382 () Bool)

(assert start!83382)

(declare-fun b_free!19207 () Bool)

(declare-fun b_next!19207 () Bool)

(assert (=> start!83382 (= b_free!19207 (not b_next!19207))))

(declare-fun tp!66900 () Bool)

(declare-fun b_and!30705 () Bool)

(assert (=> start!83382 (= tp!66900 b_and!30705)))

(declare-fun mapNonEmpty!35167 () Bool)

(declare-fun mapRes!35167 () Bool)

(declare-fun tp!66901 () Bool)

(declare-fun e!547936 () Bool)

(assert (=> mapNonEmpty!35167 (= mapRes!35167 (and tp!66901 e!547936))))

(declare-datatypes ((V!34457 0))(
  ( (V!34458 (val!11103 Int)) )
))
(declare-datatypes ((ValueCell!10571 0))(
  ( (ValueCellFull!10571 (v!13659 V!34457)) (EmptyCell!10571) )
))
(declare-datatypes ((array!60284 0))(
  ( (array!60285 (arr!29001 (Array (_ BitVec 32) ValueCell!10571)) (size!29481 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60284)

(declare-fun mapKey!35167 () (_ BitVec 32))

(declare-fun mapValue!35167 () ValueCell!10571)

(declare-fun mapRest!35167 () (Array (_ BitVec 32) ValueCell!10571))

(assert (=> mapNonEmpty!35167 (= (arr!29001 _values!1425) (store mapRest!35167 mapKey!35167 mapValue!35167))))

(declare-fun b!971812 () Bool)

(declare-fun res!650189 () Bool)

(declare-fun e!547933 () Bool)

(assert (=> b!971812 (=> (not res!650189) (not e!547933))))

(declare-datatypes ((array!60286 0))(
  ( (array!60287 (arr!29002 (Array (_ BitVec 32) (_ BitVec 64))) (size!29482 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60286)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971812 (= res!650189 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29482 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29482 _keys!1717))))))

(declare-fun b!971813 () Bool)

(declare-fun res!650195 () Bool)

(assert (=> b!971813 (=> (not res!650195) (not e!547933))))

(declare-datatypes ((List!20083 0))(
  ( (Nil!20080) (Cons!20079 (h!21247 (_ BitVec 64)) (t!28438 List!20083)) )
))
(declare-fun arrayNoDuplicates!0 (array!60286 (_ BitVec 32) List!20083) Bool)

(assert (=> b!971813 (= res!650195 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20080))))

(declare-fun res!650193 () Bool)

(assert (=> start!83382 (=> (not res!650193) (not e!547933))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83382 (= res!650193 (validMask!0 mask!2147))))

(assert (=> start!83382 e!547933))

(assert (=> start!83382 true))

(declare-fun e!547932 () Bool)

(declare-fun array_inv!22491 (array!60284) Bool)

(assert (=> start!83382 (and (array_inv!22491 _values!1425) e!547932)))

(declare-fun tp_is_empty!22105 () Bool)

(assert (=> start!83382 tp_is_empty!22105))

(assert (=> start!83382 tp!66900))

(declare-fun array_inv!22492 (array!60286) Bool)

(assert (=> start!83382 (array_inv!22492 _keys!1717)))

(declare-fun mapIsEmpty!35167 () Bool)

(assert (=> mapIsEmpty!35167 mapRes!35167))

(declare-fun b!971814 () Bool)

(declare-fun res!650191 () Bool)

(assert (=> b!971814 (=> (not res!650191) (not e!547933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60286 (_ BitVec 32)) Bool)

(assert (=> b!971814 (= res!650191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971815 () Bool)

(assert (=> b!971815 (= e!547933 false)))

(declare-datatypes ((tuple2!14228 0))(
  ( (tuple2!14229 (_1!7125 (_ BitVec 64)) (_2!7125 V!34457)) )
))
(declare-datatypes ((List!20084 0))(
  ( (Nil!20081) (Cons!20080 (h!21248 tuple2!14228) (t!28439 List!20084)) )
))
(declare-datatypes ((ListLongMap!12927 0))(
  ( (ListLongMap!12928 (toList!6479 List!20084)) )
))
(declare-fun lt!432141 () ListLongMap!12927)

(declare-fun zeroValue!1367 () V!34457)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34457)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3712 (array!60286 array!60284 (_ BitVec 32) (_ BitVec 32) V!34457 V!34457 (_ BitVec 32) Int) ListLongMap!12927)

(assert (=> b!971815 (= lt!432141 (getCurrentListMap!3712 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971816 () Bool)

(declare-fun res!650192 () Bool)

(assert (=> b!971816 (=> (not res!650192) (not e!547933))))

(declare-fun contains!5594 (ListLongMap!12927 (_ BitVec 64)) Bool)

(assert (=> b!971816 (= res!650192 (contains!5594 (getCurrentListMap!3712 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29002 _keys!1717) i!822)))))

(declare-fun b!971817 () Bool)

(assert (=> b!971817 (= e!547936 tp_is_empty!22105)))

(declare-fun b!971818 () Bool)

(declare-fun e!547935 () Bool)

(assert (=> b!971818 (= e!547932 (and e!547935 mapRes!35167))))

(declare-fun condMapEmpty!35167 () Bool)

(declare-fun mapDefault!35167 () ValueCell!10571)

(assert (=> b!971818 (= condMapEmpty!35167 (= (arr!29001 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10571)) mapDefault!35167)))))

(declare-fun b!971819 () Bool)

(declare-fun res!650194 () Bool)

(assert (=> b!971819 (=> (not res!650194) (not e!547933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971819 (= res!650194 (validKeyInArray!0 (select (arr!29002 _keys!1717) i!822)))))

(declare-fun b!971820 () Bool)

(assert (=> b!971820 (= e!547935 tp_is_empty!22105)))

(declare-fun b!971821 () Bool)

(declare-fun res!650190 () Bool)

(assert (=> b!971821 (=> (not res!650190) (not e!547933))))

(assert (=> b!971821 (= res!650190 (and (= (size!29481 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29482 _keys!1717) (size!29481 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83382 res!650193) b!971821))

(assert (= (and b!971821 res!650190) b!971814))

(assert (= (and b!971814 res!650191) b!971813))

(assert (= (and b!971813 res!650195) b!971812))

(assert (= (and b!971812 res!650189) b!971819))

(assert (= (and b!971819 res!650194) b!971816))

(assert (= (and b!971816 res!650192) b!971815))

(assert (= (and b!971818 condMapEmpty!35167) mapIsEmpty!35167))

(assert (= (and b!971818 (not condMapEmpty!35167)) mapNonEmpty!35167))

(get-info :version)

(assert (= (and mapNonEmpty!35167 ((_ is ValueCellFull!10571) mapValue!35167)) b!971817))

(assert (= (and b!971818 ((_ is ValueCellFull!10571) mapDefault!35167)) b!971820))

(assert (= start!83382 b!971818))

(declare-fun m!899801 () Bool)

(assert (=> start!83382 m!899801))

(declare-fun m!899803 () Bool)

(assert (=> start!83382 m!899803))

(declare-fun m!899805 () Bool)

(assert (=> start!83382 m!899805))

(declare-fun m!899807 () Bool)

(assert (=> b!971815 m!899807))

(declare-fun m!899809 () Bool)

(assert (=> b!971816 m!899809))

(declare-fun m!899811 () Bool)

(assert (=> b!971816 m!899811))

(assert (=> b!971816 m!899809))

(assert (=> b!971816 m!899811))

(declare-fun m!899813 () Bool)

(assert (=> b!971816 m!899813))

(declare-fun m!899815 () Bool)

(assert (=> mapNonEmpty!35167 m!899815))

(declare-fun m!899817 () Bool)

(assert (=> b!971814 m!899817))

(assert (=> b!971819 m!899811))

(assert (=> b!971819 m!899811))

(declare-fun m!899819 () Bool)

(assert (=> b!971819 m!899819))

(declare-fun m!899821 () Bool)

(assert (=> b!971813 m!899821))

(check-sat (not b!971815) (not mapNonEmpty!35167) (not b!971819) tp_is_empty!22105 (not start!83382) (not b_next!19207) (not b!971816) b_and!30705 (not b!971813) (not b!971814))
(check-sat b_and!30705 (not b_next!19207))
