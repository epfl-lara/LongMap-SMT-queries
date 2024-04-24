; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83298 () Bool)

(assert start!83298)

(declare-fun b_free!19123 () Bool)

(declare-fun b_next!19123 () Bool)

(assert (=> start!83298 (= b_free!19123 (not b_next!19123))))

(declare-fun tp!66648 () Bool)

(declare-fun b_and!30621 () Bool)

(assert (=> start!83298 (= tp!66648 b_and!30621)))

(declare-fun b!970658 () Bool)

(declare-fun res!649416 () Bool)

(declare-fun e!547302 () Bool)

(assert (=> b!970658 (=> (not res!649416) (not e!547302))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34345 0))(
  ( (V!34346 (val!11061 Int)) )
))
(declare-datatypes ((ValueCell!10529 0))(
  ( (ValueCellFull!10529 (v!13617 V!34345)) (EmptyCell!10529) )
))
(declare-datatypes ((array!60122 0))(
  ( (array!60123 (arr!28920 (Array (_ BitVec 32) ValueCell!10529)) (size!29400 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60122)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60124 0))(
  ( (array!60125 (arr!28921 (Array (_ BitVec 32) (_ BitVec 64))) (size!29401 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60124)

(assert (=> b!970658 (= res!649416 (and (= (size!29400 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29401 _keys!1717) (size!29400 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970659 () Bool)

(assert (=> b!970659 (= e!547302 false)))

(declare-fun lt!432033 () Bool)

(declare-fun zeroValue!1367 () V!34345)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34345)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14166 0))(
  ( (tuple2!14167 (_1!7094 (_ BitVec 64)) (_2!7094 V!34345)) )
))
(declare-datatypes ((List!20027 0))(
  ( (Nil!20024) (Cons!20023 (h!21191 tuple2!14166) (t!28382 List!20027)) )
))
(declare-datatypes ((ListLongMap!12865 0))(
  ( (ListLongMap!12866 (toList!6448 List!20027)) )
))
(declare-fun contains!5563 (ListLongMap!12865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3681 (array!60124 array!60122 (_ BitVec 32) (_ BitVec 32) V!34345 V!34345 (_ BitVec 32) Int) ListLongMap!12865)

(assert (=> b!970659 (= lt!432033 (contains!5563 (getCurrentListMap!3681 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28921 _keys!1717) i!822)))))

(declare-fun res!649413 () Bool)

(assert (=> start!83298 (=> (not res!649413) (not e!547302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83298 (= res!649413 (validMask!0 mask!2147))))

(assert (=> start!83298 e!547302))

(assert (=> start!83298 true))

(declare-fun e!547305 () Bool)

(declare-fun array_inv!22437 (array!60122) Bool)

(assert (=> start!83298 (and (array_inv!22437 _values!1425) e!547305)))

(declare-fun tp_is_empty!22021 () Bool)

(assert (=> start!83298 tp_is_empty!22021))

(assert (=> start!83298 tp!66648))

(declare-fun array_inv!22438 (array!60124) Bool)

(assert (=> start!83298 (array_inv!22438 _keys!1717)))

(declare-fun mapIsEmpty!35041 () Bool)

(declare-fun mapRes!35041 () Bool)

(assert (=> mapIsEmpty!35041 mapRes!35041))

(declare-fun b!970660 () Bool)

(declare-fun e!547306 () Bool)

(assert (=> b!970660 (= e!547305 (and e!547306 mapRes!35041))))

(declare-fun condMapEmpty!35041 () Bool)

(declare-fun mapDefault!35041 () ValueCell!10529)

(assert (=> b!970660 (= condMapEmpty!35041 (= (arr!28920 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10529)) mapDefault!35041)))))

(declare-fun mapNonEmpty!35041 () Bool)

(declare-fun tp!66649 () Bool)

(declare-fun e!547304 () Bool)

(assert (=> mapNonEmpty!35041 (= mapRes!35041 (and tp!66649 e!547304))))

(declare-fun mapValue!35041 () ValueCell!10529)

(declare-fun mapRest!35041 () (Array (_ BitVec 32) ValueCell!10529))

(declare-fun mapKey!35041 () (_ BitVec 32))

(assert (=> mapNonEmpty!35041 (= (arr!28920 _values!1425) (store mapRest!35041 mapKey!35041 mapValue!35041))))

(declare-fun b!970661 () Bool)

(assert (=> b!970661 (= e!547304 tp_is_empty!22021)))

(declare-fun b!970662 () Bool)

(declare-fun res!649414 () Bool)

(assert (=> b!970662 (=> (not res!649414) (not e!547302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970662 (= res!649414 (validKeyInArray!0 (select (arr!28921 _keys!1717) i!822)))))

(declare-fun b!970663 () Bool)

(assert (=> b!970663 (= e!547306 tp_is_empty!22021)))

(declare-fun b!970664 () Bool)

(declare-fun res!649415 () Bool)

(assert (=> b!970664 (=> (not res!649415) (not e!547302))))

(assert (=> b!970664 (= res!649415 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29401 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29401 _keys!1717))))))

(declare-fun b!970665 () Bool)

(declare-fun res!649417 () Bool)

(assert (=> b!970665 (=> (not res!649417) (not e!547302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60124 (_ BitVec 32)) Bool)

(assert (=> b!970665 (= res!649417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970666 () Bool)

(declare-fun res!649418 () Bool)

(assert (=> b!970666 (=> (not res!649418) (not e!547302))))

(declare-datatypes ((List!20028 0))(
  ( (Nil!20025) (Cons!20024 (h!21192 (_ BitVec 64)) (t!28383 List!20028)) )
))
(declare-fun arrayNoDuplicates!0 (array!60124 (_ BitVec 32) List!20028) Bool)

(assert (=> b!970666 (= res!649418 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20025))))

(assert (= (and start!83298 res!649413) b!970658))

(assert (= (and b!970658 res!649416) b!970665))

(assert (= (and b!970665 res!649417) b!970666))

(assert (= (and b!970666 res!649418) b!970664))

(assert (= (and b!970664 res!649415) b!970662))

(assert (= (and b!970662 res!649414) b!970659))

(assert (= (and b!970660 condMapEmpty!35041) mapIsEmpty!35041))

(assert (= (and b!970660 (not condMapEmpty!35041)) mapNonEmpty!35041))

(get-info :version)

(assert (= (and mapNonEmpty!35041 ((_ is ValueCellFull!10529) mapValue!35041)) b!970661))

(assert (= (and b!970660 ((_ is ValueCellFull!10529) mapDefault!35041)) b!970663))

(assert (= start!83298 b!970660))

(declare-fun m!898961 () Bool)

(assert (=> mapNonEmpty!35041 m!898961))

(declare-fun m!898963 () Bool)

(assert (=> b!970666 m!898963))

(declare-fun m!898965 () Bool)

(assert (=> start!83298 m!898965))

(declare-fun m!898967 () Bool)

(assert (=> start!83298 m!898967))

(declare-fun m!898969 () Bool)

(assert (=> start!83298 m!898969))

(declare-fun m!898971 () Bool)

(assert (=> b!970662 m!898971))

(assert (=> b!970662 m!898971))

(declare-fun m!898973 () Bool)

(assert (=> b!970662 m!898973))

(declare-fun m!898975 () Bool)

(assert (=> b!970659 m!898975))

(assert (=> b!970659 m!898971))

(assert (=> b!970659 m!898975))

(assert (=> b!970659 m!898971))

(declare-fun m!898977 () Bool)

(assert (=> b!970659 m!898977))

(declare-fun m!898979 () Bool)

(assert (=> b!970665 m!898979))

(check-sat (not b!970666) (not b!970662) (not mapNonEmpty!35041) (not b!970665) tp_is_empty!22021 b_and!30621 (not b_next!19123) (not b!970659) (not start!83298))
(check-sat b_and!30621 (not b_next!19123))
