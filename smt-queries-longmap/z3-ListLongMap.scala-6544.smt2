; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83130 () Bool)

(assert start!83130)

(declare-fun b_free!19141 () Bool)

(declare-fun b_next!19141 () Bool)

(assert (=> start!83130 (= b_free!19141 (not b_next!19141))))

(declare-fun tp!66702 () Bool)

(declare-fun b_and!30603 () Bool)

(assert (=> start!83130 (= tp!66702 b_and!30603)))

(declare-fun mapIsEmpty!35068 () Bool)

(declare-fun mapRes!35068 () Bool)

(assert (=> mapIsEmpty!35068 mapRes!35068))

(declare-fun b!969760 () Bool)

(declare-fun e!546708 () Bool)

(declare-fun tp_is_empty!22039 () Bool)

(assert (=> b!969760 (= e!546708 tp_is_empty!22039)))

(declare-fun b!969761 () Bool)

(declare-fun e!546709 () Bool)

(assert (=> b!969761 (= e!546709 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34369 0))(
  ( (V!34370 (val!11070 Int)) )
))
(declare-datatypes ((ValueCell!10538 0))(
  ( (ValueCellFull!10538 (v!13628 V!34369)) (EmptyCell!10538) )
))
(declare-datatypes ((array!60070 0))(
  ( (array!60071 (arr!28899 (Array (_ BitVec 32) ValueCell!10538)) (size!29380 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60070)

(declare-fun zeroValue!1367 () V!34369)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34369)

(declare-fun lt!431463 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60072 0))(
  ( (array!60073 (arr!28900 (Array (_ BitVec 32) (_ BitVec 64))) (size!29381 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60072)

(declare-datatypes ((tuple2!14266 0))(
  ( (tuple2!14267 (_1!7144 (_ BitVec 64)) (_2!7144 V!34369)) )
))
(declare-datatypes ((List!20087 0))(
  ( (Nil!20084) (Cons!20083 (h!21245 tuple2!14266) (t!28441 List!20087)) )
))
(declare-datatypes ((ListLongMap!12953 0))(
  ( (ListLongMap!12954 (toList!6492 List!20087)) )
))
(declare-fun contains!5540 (ListLongMap!12953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3654 (array!60072 array!60070 (_ BitVec 32) (_ BitVec 32) V!34369 V!34369 (_ BitVec 32) Int) ListLongMap!12953)

(assert (=> b!969761 (= lt!431463 (contains!5540 (getCurrentListMap!3654 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28900 _keys!1717) i!822)))))

(declare-fun b!969762 () Bool)

(declare-fun res!649125 () Bool)

(assert (=> b!969762 (=> (not res!649125) (not e!546709))))

(declare-datatypes ((List!20088 0))(
  ( (Nil!20085) (Cons!20084 (h!21246 (_ BitVec 64)) (t!28442 List!20088)) )
))
(declare-fun arrayNoDuplicates!0 (array!60072 (_ BitVec 32) List!20088) Bool)

(assert (=> b!969762 (= res!649125 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20085))))

(declare-fun b!969763 () Bool)

(declare-fun e!546710 () Bool)

(assert (=> b!969763 (= e!546710 tp_is_empty!22039)))

(declare-fun b!969764 () Bool)

(declare-fun res!649122 () Bool)

(assert (=> b!969764 (=> (not res!649122) (not e!546709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60072 (_ BitVec 32)) Bool)

(assert (=> b!969764 (= res!649122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969759 () Bool)

(declare-fun e!546711 () Bool)

(assert (=> b!969759 (= e!546711 (and e!546708 mapRes!35068))))

(declare-fun condMapEmpty!35068 () Bool)

(declare-fun mapDefault!35068 () ValueCell!10538)

(assert (=> b!969759 (= condMapEmpty!35068 (= (arr!28899 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10538)) mapDefault!35068)))))

(declare-fun res!649124 () Bool)

(assert (=> start!83130 (=> (not res!649124) (not e!546709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83130 (= res!649124 (validMask!0 mask!2147))))

(assert (=> start!83130 e!546709))

(assert (=> start!83130 true))

(declare-fun array_inv!22431 (array!60070) Bool)

(assert (=> start!83130 (and (array_inv!22431 _values!1425) e!546711)))

(assert (=> start!83130 tp_is_empty!22039))

(assert (=> start!83130 tp!66702))

(declare-fun array_inv!22432 (array!60072) Bool)

(assert (=> start!83130 (array_inv!22432 _keys!1717)))

(declare-fun b!969765 () Bool)

(declare-fun res!649121 () Bool)

(assert (=> b!969765 (=> (not res!649121) (not e!546709))))

(assert (=> b!969765 (= res!649121 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29381 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29381 _keys!1717))))))

(declare-fun b!969766 () Bool)

(declare-fun res!649123 () Bool)

(assert (=> b!969766 (=> (not res!649123) (not e!546709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969766 (= res!649123 (validKeyInArray!0 (select (arr!28900 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35068 () Bool)

(declare-fun tp!66703 () Bool)

(assert (=> mapNonEmpty!35068 (= mapRes!35068 (and tp!66703 e!546710))))

(declare-fun mapValue!35068 () ValueCell!10538)

(declare-fun mapRest!35068 () (Array (_ BitVec 32) ValueCell!10538))

(declare-fun mapKey!35068 () (_ BitVec 32))

(assert (=> mapNonEmpty!35068 (= (arr!28899 _values!1425) (store mapRest!35068 mapKey!35068 mapValue!35068))))

(declare-fun b!969767 () Bool)

(declare-fun res!649126 () Bool)

(assert (=> b!969767 (=> (not res!649126) (not e!546709))))

(assert (=> b!969767 (= res!649126 (and (= (size!29380 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29381 _keys!1717) (size!29380 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83130 res!649124) b!969767))

(assert (= (and b!969767 res!649126) b!969764))

(assert (= (and b!969764 res!649122) b!969762))

(assert (= (and b!969762 res!649125) b!969765))

(assert (= (and b!969765 res!649121) b!969766))

(assert (= (and b!969766 res!649123) b!969761))

(assert (= (and b!969759 condMapEmpty!35068) mapIsEmpty!35068))

(assert (= (and b!969759 (not condMapEmpty!35068)) mapNonEmpty!35068))

(get-info :version)

(assert (= (and mapNonEmpty!35068 ((_ is ValueCellFull!10538) mapValue!35068)) b!969763))

(assert (= (and b!969759 ((_ is ValueCellFull!10538) mapDefault!35068)) b!969760))

(assert (= start!83130 b!969759))

(declare-fun m!897089 () Bool)

(assert (=> b!969762 m!897089))

(declare-fun m!897091 () Bool)

(assert (=> b!969764 m!897091))

(declare-fun m!897093 () Bool)

(assert (=> start!83130 m!897093))

(declare-fun m!897095 () Bool)

(assert (=> start!83130 m!897095))

(declare-fun m!897097 () Bool)

(assert (=> start!83130 m!897097))

(declare-fun m!897099 () Bool)

(assert (=> b!969766 m!897099))

(assert (=> b!969766 m!897099))

(declare-fun m!897101 () Bool)

(assert (=> b!969766 m!897101))

(declare-fun m!897103 () Bool)

(assert (=> mapNonEmpty!35068 m!897103))

(declare-fun m!897105 () Bool)

(assert (=> b!969761 m!897105))

(assert (=> b!969761 m!897099))

(assert (=> b!969761 m!897105))

(assert (=> b!969761 m!897099))

(declare-fun m!897107 () Bool)

(assert (=> b!969761 m!897107))

(check-sat (not start!83130) (not b!969766) (not mapNonEmpty!35068) (not b!969761) (not b!969762) (not b_next!19141) (not b!969764) b_and!30603 tp_is_empty!22039)
(check-sat b_and!30603 (not b_next!19141))
