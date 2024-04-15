; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82196 () Bool)

(assert start!82196)

(declare-fun b_free!18487 () Bool)

(declare-fun b_next!18487 () Bool)

(assert (=> start!82196 (= b_free!18487 (not b_next!18487))))

(declare-fun tp!64422 () Bool)

(declare-fun b_and!29949 () Bool)

(assert (=> start!82196 (= tp!64422 b_and!29949)))

(declare-fun b!958014 () Bool)

(declare-fun e!540075 () Bool)

(assert (=> b!958014 (= e!540075 false)))

(declare-datatypes ((V!33241 0))(
  ( (V!33242 (val!10647 Int)) )
))
(declare-fun minValue!1328 () V!33241)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58424 0))(
  ( (array!58425 (arr!28086 (Array (_ BitVec 32) (_ BitVec 64))) (size!28567 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58424)

(declare-datatypes ((ValueCell!10115 0))(
  ( (ValueCellFull!10115 (v!13203 V!33241)) (EmptyCell!10115) )
))
(declare-datatypes ((array!58426 0))(
  ( (array!58427 (arr!28087 (Array (_ BitVec 32) ValueCell!10115)) (size!28568 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58426)

(declare-fun lt!430186 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33241)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((tuple2!13776 0))(
  ( (tuple2!13777 (_1!6899 (_ BitVec 64)) (_2!6899 V!33241)) )
))
(declare-datatypes ((List!19562 0))(
  ( (Nil!19559) (Cons!19558 (h!20720 tuple2!13776) (t!27916 List!19562)) )
))
(declare-datatypes ((ListLongMap!12463 0))(
  ( (ListLongMap!12464 (toList!6247 List!19562)) )
))
(declare-fun contains!5293 (ListLongMap!12463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3409 (array!58424 array!58426 (_ BitVec 32) (_ BitVec 32) V!33241 V!33241 (_ BitVec 32) Int) ListLongMap!12463)

(assert (=> b!958014 (= lt!430186 (contains!5293 (getCurrentListMap!3409 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28086 _keys!1668) i!793)))))

(declare-fun b!958015 () Bool)

(declare-fun res!641311 () Bool)

(assert (=> b!958015 (=> (not res!641311) (not e!540075))))

(declare-datatypes ((List!19563 0))(
  ( (Nil!19560) (Cons!19559 (h!20721 (_ BitVec 64)) (t!27917 List!19563)) )
))
(declare-fun arrayNoDuplicates!0 (array!58424 (_ BitVec 32) List!19563) Bool)

(assert (=> b!958015 (= res!641311 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19560))))

(declare-fun b!958016 () Bool)

(declare-fun res!641316 () Bool)

(assert (=> b!958016 (=> (not res!641316) (not e!540075))))

(assert (=> b!958016 (= res!641316 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28567 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28567 _keys!1668))))))

(declare-fun b!958017 () Bool)

(declare-fun res!641314 () Bool)

(assert (=> b!958017 (=> (not res!641314) (not e!540075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958017 (= res!641314 (validKeyInArray!0 (select (arr!28086 _keys!1668) i!793)))))

(declare-fun b!958018 () Bool)

(declare-fun res!641313 () Bool)

(assert (=> b!958018 (=> (not res!641313) (not e!540075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58424 (_ BitVec 32)) Bool)

(assert (=> b!958018 (= res!641313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641315 () Bool)

(assert (=> start!82196 (=> (not res!641315) (not e!540075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82196 (= res!641315 (validMask!0 mask!2088))))

(assert (=> start!82196 e!540075))

(assert (=> start!82196 true))

(declare-fun tp_is_empty!21193 () Bool)

(assert (=> start!82196 tp_is_empty!21193))

(declare-fun array_inv!21843 (array!58424) Bool)

(assert (=> start!82196 (array_inv!21843 _keys!1668)))

(declare-fun e!540074 () Bool)

(declare-fun array_inv!21844 (array!58426) Bool)

(assert (=> start!82196 (and (array_inv!21844 _values!1386) e!540074)))

(assert (=> start!82196 tp!64422))

(declare-fun b!958019 () Bool)

(declare-fun e!540076 () Bool)

(declare-fun mapRes!33769 () Bool)

(assert (=> b!958019 (= e!540074 (and e!540076 mapRes!33769))))

(declare-fun condMapEmpty!33769 () Bool)

(declare-fun mapDefault!33769 () ValueCell!10115)

(assert (=> b!958019 (= condMapEmpty!33769 (= (arr!28087 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10115)) mapDefault!33769)))))

(declare-fun b!958020 () Bool)

(declare-fun res!641312 () Bool)

(assert (=> b!958020 (=> (not res!641312) (not e!540075))))

(assert (=> b!958020 (= res!641312 (and (= (size!28568 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28567 _keys!1668) (size!28568 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33769 () Bool)

(assert (=> mapIsEmpty!33769 mapRes!33769))

(declare-fun b!958021 () Bool)

(assert (=> b!958021 (= e!540076 tp_is_empty!21193)))

(declare-fun mapNonEmpty!33769 () Bool)

(declare-fun tp!64423 () Bool)

(declare-fun e!540073 () Bool)

(assert (=> mapNonEmpty!33769 (= mapRes!33769 (and tp!64423 e!540073))))

(declare-fun mapKey!33769 () (_ BitVec 32))

(declare-fun mapValue!33769 () ValueCell!10115)

(declare-fun mapRest!33769 () (Array (_ BitVec 32) ValueCell!10115))

(assert (=> mapNonEmpty!33769 (= (arr!28087 _values!1386) (store mapRest!33769 mapKey!33769 mapValue!33769))))

(declare-fun b!958022 () Bool)

(assert (=> b!958022 (= e!540073 tp_is_empty!21193)))

(assert (= (and start!82196 res!641315) b!958020))

(assert (= (and b!958020 res!641312) b!958018))

(assert (= (and b!958018 res!641313) b!958015))

(assert (= (and b!958015 res!641311) b!958016))

(assert (= (and b!958016 res!641316) b!958017))

(assert (= (and b!958017 res!641314) b!958014))

(assert (= (and b!958019 condMapEmpty!33769) mapIsEmpty!33769))

(assert (= (and b!958019 (not condMapEmpty!33769)) mapNonEmpty!33769))

(get-info :version)

(assert (= (and mapNonEmpty!33769 ((_ is ValueCellFull!10115) mapValue!33769)) b!958022))

(assert (= (and b!958019 ((_ is ValueCellFull!10115) mapDefault!33769)) b!958021))

(assert (= start!82196 b!958019))

(declare-fun m!888219 () Bool)

(assert (=> b!958018 m!888219))

(declare-fun m!888221 () Bool)

(assert (=> start!82196 m!888221))

(declare-fun m!888223 () Bool)

(assert (=> start!82196 m!888223))

(declare-fun m!888225 () Bool)

(assert (=> start!82196 m!888225))

(declare-fun m!888227 () Bool)

(assert (=> b!958015 m!888227))

(declare-fun m!888229 () Bool)

(assert (=> b!958014 m!888229))

(declare-fun m!888231 () Bool)

(assert (=> b!958014 m!888231))

(assert (=> b!958014 m!888229))

(assert (=> b!958014 m!888231))

(declare-fun m!888233 () Bool)

(assert (=> b!958014 m!888233))

(declare-fun m!888235 () Bool)

(assert (=> mapNonEmpty!33769 m!888235))

(assert (=> b!958017 m!888231))

(assert (=> b!958017 m!888231))

(declare-fun m!888237 () Bool)

(assert (=> b!958017 m!888237))

(check-sat (not b!958015) (not b!958014) (not b_next!18487) (not b!958018) tp_is_empty!21193 (not b!958017) b_and!29949 (not start!82196) (not mapNonEmpty!33769))
(check-sat b_and!29949 (not b_next!18487))
