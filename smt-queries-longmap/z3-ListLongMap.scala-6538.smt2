; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83280 () Bool)

(assert start!83280)

(declare-fun b_free!19105 () Bool)

(declare-fun b_next!19105 () Bool)

(assert (=> start!83280 (= b_free!19105 (not b_next!19105))))

(declare-fun tp!66595 () Bool)

(declare-fun b_and!30603 () Bool)

(assert (=> start!83280 (= tp!66595 b_and!30603)))

(declare-fun res!649251 () Bool)

(declare-fun e!547168 () Bool)

(assert (=> start!83280 (=> (not res!649251) (not e!547168))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83280 (= res!649251 (validMask!0 mask!2147))))

(assert (=> start!83280 e!547168))

(assert (=> start!83280 true))

(declare-datatypes ((V!34321 0))(
  ( (V!34322 (val!11052 Int)) )
))
(declare-datatypes ((ValueCell!10520 0))(
  ( (ValueCellFull!10520 (v!13608 V!34321)) (EmptyCell!10520) )
))
(declare-datatypes ((array!60086 0))(
  ( (array!60087 (arr!28902 (Array (_ BitVec 32) ValueCell!10520)) (size!29382 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60086)

(declare-fun e!547170 () Bool)

(declare-fun array_inv!22425 (array!60086) Bool)

(assert (=> start!83280 (and (array_inv!22425 _values!1425) e!547170)))

(declare-fun tp_is_empty!22003 () Bool)

(assert (=> start!83280 tp_is_empty!22003))

(assert (=> start!83280 tp!66595))

(declare-datatypes ((array!60088 0))(
  ( (array!60089 (arr!28903 (Array (_ BitVec 32) (_ BitVec 64))) (size!29383 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60088)

(declare-fun array_inv!22426 (array!60088) Bool)

(assert (=> start!83280 (array_inv!22426 _keys!1717)))

(declare-fun b!970415 () Bool)

(declare-fun res!649252 () Bool)

(assert (=> b!970415 (=> (not res!649252) (not e!547168))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970415 (= res!649252 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29383 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29383 _keys!1717))))))

(declare-fun b!970416 () Bool)

(declare-fun e!547167 () Bool)

(assert (=> b!970416 (= e!547167 tp_is_empty!22003)))

(declare-fun b!970417 () Bool)

(assert (=> b!970417 (= e!547168 false)))

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!432006 () Bool)

(declare-fun minValue!1367 () V!34321)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34321)

(declare-datatypes ((tuple2!14158 0))(
  ( (tuple2!14159 (_1!7090 (_ BitVec 64)) (_2!7090 V!34321)) )
))
(declare-datatypes ((List!20020 0))(
  ( (Nil!20017) (Cons!20016 (h!21184 tuple2!14158) (t!28375 List!20020)) )
))
(declare-datatypes ((ListLongMap!12857 0))(
  ( (ListLongMap!12858 (toList!6444 List!20020)) )
))
(declare-fun contains!5559 (ListLongMap!12857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3677 (array!60088 array!60086 (_ BitVec 32) (_ BitVec 32) V!34321 V!34321 (_ BitVec 32) Int) ListLongMap!12857)

(assert (=> b!970417 (= lt!432006 (contains!5559 (getCurrentListMap!3677 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28903 _keys!1717) i!822)))))

(declare-fun b!970418 () Bool)

(declare-fun res!649254 () Bool)

(assert (=> b!970418 (=> (not res!649254) (not e!547168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970418 (= res!649254 (validKeyInArray!0 (select (arr!28903 _keys!1717) i!822)))))

(declare-fun b!970419 () Bool)

(declare-fun e!547169 () Bool)

(declare-fun mapRes!35014 () Bool)

(assert (=> b!970419 (= e!547170 (and e!547169 mapRes!35014))))

(declare-fun condMapEmpty!35014 () Bool)

(declare-fun mapDefault!35014 () ValueCell!10520)

(assert (=> b!970419 (= condMapEmpty!35014 (= (arr!28902 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10520)) mapDefault!35014)))))

(declare-fun b!970420 () Bool)

(declare-fun res!649253 () Bool)

(assert (=> b!970420 (=> (not res!649253) (not e!547168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60088 (_ BitVec 32)) Bool)

(assert (=> b!970420 (= res!649253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970421 () Bool)

(declare-fun res!649256 () Bool)

(assert (=> b!970421 (=> (not res!649256) (not e!547168))))

(declare-datatypes ((List!20021 0))(
  ( (Nil!20018) (Cons!20017 (h!21185 (_ BitVec 64)) (t!28376 List!20021)) )
))
(declare-fun arrayNoDuplicates!0 (array!60088 (_ BitVec 32) List!20021) Bool)

(assert (=> b!970421 (= res!649256 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20018))))

(declare-fun b!970422 () Bool)

(declare-fun res!649255 () Bool)

(assert (=> b!970422 (=> (not res!649255) (not e!547168))))

(assert (=> b!970422 (= res!649255 (and (= (size!29382 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29383 _keys!1717) (size!29382 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35014 () Bool)

(declare-fun tp!66594 () Bool)

(assert (=> mapNonEmpty!35014 (= mapRes!35014 (and tp!66594 e!547167))))

(declare-fun mapValue!35014 () ValueCell!10520)

(declare-fun mapKey!35014 () (_ BitVec 32))

(declare-fun mapRest!35014 () (Array (_ BitVec 32) ValueCell!10520))

(assert (=> mapNonEmpty!35014 (= (arr!28902 _values!1425) (store mapRest!35014 mapKey!35014 mapValue!35014))))

(declare-fun mapIsEmpty!35014 () Bool)

(assert (=> mapIsEmpty!35014 mapRes!35014))

(declare-fun b!970423 () Bool)

(assert (=> b!970423 (= e!547169 tp_is_empty!22003)))

(assert (= (and start!83280 res!649251) b!970422))

(assert (= (and b!970422 res!649255) b!970420))

(assert (= (and b!970420 res!649253) b!970421))

(assert (= (and b!970421 res!649256) b!970415))

(assert (= (and b!970415 res!649252) b!970418))

(assert (= (and b!970418 res!649254) b!970417))

(assert (= (and b!970419 condMapEmpty!35014) mapIsEmpty!35014))

(assert (= (and b!970419 (not condMapEmpty!35014)) mapNonEmpty!35014))

(get-info :version)

(assert (= (and mapNonEmpty!35014 ((_ is ValueCellFull!10520) mapValue!35014)) b!970416))

(assert (= (and b!970419 ((_ is ValueCellFull!10520) mapDefault!35014)) b!970423))

(assert (= start!83280 b!970419))

(declare-fun m!898781 () Bool)

(assert (=> b!970417 m!898781))

(declare-fun m!898783 () Bool)

(assert (=> b!970417 m!898783))

(assert (=> b!970417 m!898781))

(assert (=> b!970417 m!898783))

(declare-fun m!898785 () Bool)

(assert (=> b!970417 m!898785))

(declare-fun m!898787 () Bool)

(assert (=> mapNonEmpty!35014 m!898787))

(declare-fun m!898789 () Bool)

(assert (=> b!970420 m!898789))

(declare-fun m!898791 () Bool)

(assert (=> b!970421 m!898791))

(assert (=> b!970418 m!898783))

(assert (=> b!970418 m!898783))

(declare-fun m!898793 () Bool)

(assert (=> b!970418 m!898793))

(declare-fun m!898795 () Bool)

(assert (=> start!83280 m!898795))

(declare-fun m!898797 () Bool)

(assert (=> start!83280 m!898797))

(declare-fun m!898799 () Bool)

(assert (=> start!83280 m!898799))

(check-sat (not b_next!19105) tp_is_empty!22003 (not b!970420) (not start!83280) (not b!970417) (not b!970421) (not mapNonEmpty!35014) (not b!970418) b_and!30603)
(check-sat b_and!30603 (not b_next!19105))
