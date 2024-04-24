; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83388 () Bool)

(assert start!83388)

(declare-fun b_free!19213 () Bool)

(declare-fun b_next!19213 () Bool)

(assert (=> start!83388 (= b_free!19213 (not b_next!19213))))

(declare-fun tp!66918 () Bool)

(declare-fun b_and!30711 () Bool)

(assert (=> start!83388 (= tp!66918 b_and!30711)))

(declare-fun b!971902 () Bool)

(declare-fun e!547980 () Bool)

(declare-fun e!547978 () Bool)

(declare-fun mapRes!35176 () Bool)

(assert (=> b!971902 (= e!547980 (and e!547978 mapRes!35176))))

(declare-fun condMapEmpty!35176 () Bool)

(declare-datatypes ((V!34465 0))(
  ( (V!34466 (val!11106 Int)) )
))
(declare-datatypes ((ValueCell!10574 0))(
  ( (ValueCellFull!10574 (v!13662 V!34465)) (EmptyCell!10574) )
))
(declare-datatypes ((array!60296 0))(
  ( (array!60297 (arr!29007 (Array (_ BitVec 32) ValueCell!10574)) (size!29487 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60296)

(declare-fun mapDefault!35176 () ValueCell!10574)

(assert (=> b!971902 (= condMapEmpty!35176 (= (arr!29007 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10574)) mapDefault!35176)))))

(declare-fun b!971903 () Bool)

(declare-fun e!547981 () Bool)

(assert (=> b!971903 (= e!547981 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34465)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34465)

(declare-datatypes ((tuple2!14234 0))(
  ( (tuple2!14235 (_1!7128 (_ BitVec 64)) (_2!7128 V!34465)) )
))
(declare-datatypes ((List!20088 0))(
  ( (Nil!20085) (Cons!20084 (h!21252 tuple2!14234) (t!28443 List!20088)) )
))
(declare-datatypes ((ListLongMap!12933 0))(
  ( (ListLongMap!12934 (toList!6482 List!20088)) )
))
(declare-fun lt!432150 () ListLongMap!12933)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60298 0))(
  ( (array!60299 (arr!29008 (Array (_ BitVec 32) (_ BitVec 64))) (size!29488 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60298)

(declare-fun getCurrentListMap!3715 (array!60298 array!60296 (_ BitVec 32) (_ BitVec 32) V!34465 V!34465 (_ BitVec 32) Int) ListLongMap!12933)

(assert (=> b!971903 (= lt!432150 (getCurrentListMap!3715 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971904 () Bool)

(declare-fun res!650253 () Bool)

(assert (=> b!971904 (=> (not res!650253) (not e!547981))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971904 (= res!650253 (validKeyInArray!0 (select (arr!29008 _keys!1717) i!822)))))

(declare-fun b!971905 () Bool)

(declare-fun e!547979 () Bool)

(declare-fun tp_is_empty!22111 () Bool)

(assert (=> b!971905 (= e!547979 tp_is_empty!22111)))

(declare-fun b!971906 () Bool)

(declare-fun res!650255 () Bool)

(assert (=> b!971906 (=> (not res!650255) (not e!547981))))

(declare-fun contains!5597 (ListLongMap!12933 (_ BitVec 64)) Bool)

(assert (=> b!971906 (= res!650255 (contains!5597 (getCurrentListMap!3715 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29008 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35176 () Bool)

(declare-fun tp!66919 () Bool)

(assert (=> mapNonEmpty!35176 (= mapRes!35176 (and tp!66919 e!547979))))

(declare-fun mapRest!35176 () (Array (_ BitVec 32) ValueCell!10574))

(declare-fun mapValue!35176 () ValueCell!10574)

(declare-fun mapKey!35176 () (_ BitVec 32))

(assert (=> mapNonEmpty!35176 (= (arr!29007 _values!1425) (store mapRest!35176 mapKey!35176 mapValue!35176))))

(declare-fun b!971907 () Bool)

(declare-fun res!650254 () Bool)

(assert (=> b!971907 (=> (not res!650254) (not e!547981))))

(assert (=> b!971907 (= res!650254 (and (= (size!29487 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29488 _keys!1717) (size!29487 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!650256 () Bool)

(assert (=> start!83388 (=> (not res!650256) (not e!547981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83388 (= res!650256 (validMask!0 mask!2147))))

(assert (=> start!83388 e!547981))

(assert (=> start!83388 true))

(declare-fun array_inv!22497 (array!60296) Bool)

(assert (=> start!83388 (and (array_inv!22497 _values!1425) e!547980)))

(assert (=> start!83388 tp_is_empty!22111))

(assert (=> start!83388 tp!66918))

(declare-fun array_inv!22498 (array!60298) Bool)

(assert (=> start!83388 (array_inv!22498 _keys!1717)))

(declare-fun b!971908 () Bool)

(declare-fun res!650252 () Bool)

(assert (=> b!971908 (=> (not res!650252) (not e!547981))))

(assert (=> b!971908 (= res!650252 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29488 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29488 _keys!1717))))))

(declare-fun b!971909 () Bool)

(declare-fun res!650257 () Bool)

(assert (=> b!971909 (=> (not res!650257) (not e!547981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60298 (_ BitVec 32)) Bool)

(assert (=> b!971909 (= res!650257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971910 () Bool)

(declare-fun res!650258 () Bool)

(assert (=> b!971910 (=> (not res!650258) (not e!547981))))

(declare-datatypes ((List!20089 0))(
  ( (Nil!20086) (Cons!20085 (h!21253 (_ BitVec 64)) (t!28444 List!20089)) )
))
(declare-fun arrayNoDuplicates!0 (array!60298 (_ BitVec 32) List!20089) Bool)

(assert (=> b!971910 (= res!650258 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20086))))

(declare-fun mapIsEmpty!35176 () Bool)

(assert (=> mapIsEmpty!35176 mapRes!35176))

(declare-fun b!971911 () Bool)

(assert (=> b!971911 (= e!547978 tp_is_empty!22111)))

(assert (= (and start!83388 res!650256) b!971907))

(assert (= (and b!971907 res!650254) b!971909))

(assert (= (and b!971909 res!650257) b!971910))

(assert (= (and b!971910 res!650258) b!971908))

(assert (= (and b!971908 res!650252) b!971904))

(assert (= (and b!971904 res!650253) b!971906))

(assert (= (and b!971906 res!650255) b!971903))

(assert (= (and b!971902 condMapEmpty!35176) mapIsEmpty!35176))

(assert (= (and b!971902 (not condMapEmpty!35176)) mapNonEmpty!35176))

(get-info :version)

(assert (= (and mapNonEmpty!35176 ((_ is ValueCellFull!10574) mapValue!35176)) b!971905))

(assert (= (and b!971902 ((_ is ValueCellFull!10574) mapDefault!35176)) b!971911))

(assert (= start!83388 b!971902))

(declare-fun m!899867 () Bool)

(assert (=> b!971903 m!899867))

(declare-fun m!899869 () Bool)

(assert (=> b!971909 m!899869))

(declare-fun m!899871 () Bool)

(assert (=> b!971904 m!899871))

(assert (=> b!971904 m!899871))

(declare-fun m!899873 () Bool)

(assert (=> b!971904 m!899873))

(declare-fun m!899875 () Bool)

(assert (=> b!971906 m!899875))

(assert (=> b!971906 m!899871))

(assert (=> b!971906 m!899875))

(assert (=> b!971906 m!899871))

(declare-fun m!899877 () Bool)

(assert (=> b!971906 m!899877))

(declare-fun m!899879 () Bool)

(assert (=> b!971910 m!899879))

(declare-fun m!899881 () Bool)

(assert (=> mapNonEmpty!35176 m!899881))

(declare-fun m!899883 () Bool)

(assert (=> start!83388 m!899883))

(declare-fun m!899885 () Bool)

(assert (=> start!83388 m!899885))

(declare-fun m!899887 () Bool)

(assert (=> start!83388 m!899887))

(check-sat (not b_next!19213) (not mapNonEmpty!35176) tp_is_empty!22111 (not b!971903) (not b!971904) (not b!971906) (not b!971909) (not start!83388) (not b!971910) b_and!30711)
(check-sat b_and!30711 (not b_next!19213))
