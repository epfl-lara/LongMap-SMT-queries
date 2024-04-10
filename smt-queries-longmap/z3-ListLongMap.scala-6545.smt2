; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83156 () Bool)

(assert start!83156)

(declare-fun b_free!19149 () Bool)

(declare-fun b_next!19149 () Bool)

(assert (=> start!83156 (= b_free!19149 (not b_next!19149))))

(declare-fun tp!66725 () Bool)

(declare-fun b_and!30637 () Bool)

(assert (=> start!83156 (= tp!66725 b_and!30637)))

(declare-fun b!970111 () Bool)

(declare-fun res!649308 () Bool)

(declare-fun e!546918 () Bool)

(assert (=> b!970111 (=> (not res!649308) (not e!546918))))

(declare-datatypes ((array!60153 0))(
  ( (array!60154 (arr!28940 (Array (_ BitVec 32) (_ BitVec 64))) (size!29419 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60153)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60153 (_ BitVec 32)) Bool)

(assert (=> b!970111 (= res!649308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970112 () Bool)

(declare-fun res!649313 () Bool)

(assert (=> b!970112 (=> (not res!649313) (not e!546918))))

(declare-datatypes ((V!34379 0))(
  ( (V!34380 (val!11074 Int)) )
))
(declare-datatypes ((ValueCell!10542 0))(
  ( (ValueCellFull!10542 (v!13633 V!34379)) (EmptyCell!10542) )
))
(declare-datatypes ((array!60155 0))(
  ( (array!60156 (arr!28941 (Array (_ BitVec 32) ValueCell!10542)) (size!29420 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60155)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34379)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34379)

(declare-datatypes ((tuple2!14186 0))(
  ( (tuple2!14187 (_1!7104 (_ BitVec 64)) (_2!7104 V!34379)) )
))
(declare-datatypes ((List!20057 0))(
  ( (Nil!20054) (Cons!20053 (h!21215 tuple2!14186) (t!28420 List!20057)) )
))
(declare-datatypes ((ListLongMap!12883 0))(
  ( (ListLongMap!12884 (toList!6457 List!20057)) )
))
(declare-fun contains!5561 (ListLongMap!12883 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3690 (array!60153 array!60155 (_ BitVec 32) (_ BitVec 32) V!34379 V!34379 (_ BitVec 32) Int) ListLongMap!12883)

(assert (=> b!970112 (= res!649313 (contains!5561 (getCurrentListMap!3690 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28940 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35080 () Bool)

(declare-fun mapRes!35080 () Bool)

(declare-fun tp!66726 () Bool)

(declare-fun e!546916 () Bool)

(assert (=> mapNonEmpty!35080 (= mapRes!35080 (and tp!66726 e!546916))))

(declare-fun mapKey!35080 () (_ BitVec 32))

(declare-fun mapRest!35080 () (Array (_ BitVec 32) ValueCell!10542))

(declare-fun mapValue!35080 () ValueCell!10542)

(assert (=> mapNonEmpty!35080 (= (arr!28941 _values!1425) (store mapRest!35080 mapKey!35080 mapValue!35080))))

(declare-fun b!970113 () Bool)

(declare-fun res!649311 () Bool)

(assert (=> b!970113 (=> (not res!649311) (not e!546918))))

(declare-datatypes ((List!20058 0))(
  ( (Nil!20055) (Cons!20054 (h!21216 (_ BitVec 64)) (t!28421 List!20058)) )
))
(declare-fun arrayNoDuplicates!0 (array!60153 (_ BitVec 32) List!20058) Bool)

(assert (=> b!970113 (= res!649311 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20055))))

(declare-fun b!970114 () Bool)

(declare-fun res!649314 () Bool)

(assert (=> b!970114 (=> (not res!649314) (not e!546918))))

(assert (=> b!970114 (= res!649314 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29419 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29419 _keys!1717))))))

(declare-fun b!970115 () Bool)

(declare-fun e!546917 () Bool)

(declare-fun tp_is_empty!22047 () Bool)

(assert (=> b!970115 (= e!546917 tp_is_empty!22047)))

(declare-fun res!649310 () Bool)

(assert (=> start!83156 (=> (not res!649310) (not e!546918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83156 (= res!649310 (validMask!0 mask!2147))))

(assert (=> start!83156 e!546918))

(assert (=> start!83156 true))

(declare-fun e!546915 () Bool)

(declare-fun array_inv!22401 (array!60155) Bool)

(assert (=> start!83156 (and (array_inv!22401 _values!1425) e!546915)))

(assert (=> start!83156 tp_is_empty!22047))

(assert (=> start!83156 tp!66725))

(declare-fun array_inv!22402 (array!60153) Bool)

(assert (=> start!83156 (array_inv!22402 _keys!1717)))

(declare-fun b!970116 () Bool)

(declare-fun res!649309 () Bool)

(assert (=> b!970116 (=> (not res!649309) (not e!546918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970116 (= res!649309 (validKeyInArray!0 (select (arr!28940 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35080 () Bool)

(assert (=> mapIsEmpty!35080 mapRes!35080))

(declare-fun b!970117 () Bool)

(assert (=> b!970117 (= e!546916 tp_is_empty!22047)))

(declare-fun b!970118 () Bool)

(assert (=> b!970118 (= e!546918 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29419 _keys!1717))))))

(declare-fun b!970119 () Bool)

(assert (=> b!970119 (= e!546915 (and e!546917 mapRes!35080))))

(declare-fun condMapEmpty!35080 () Bool)

(declare-fun mapDefault!35080 () ValueCell!10542)

(assert (=> b!970119 (= condMapEmpty!35080 (= (arr!28941 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10542)) mapDefault!35080)))))

(declare-fun b!970120 () Bool)

(declare-fun res!649312 () Bool)

(assert (=> b!970120 (=> (not res!649312) (not e!546918))))

(assert (=> b!970120 (= res!649312 (and (= (size!29420 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29419 _keys!1717) (size!29420 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83156 res!649310) b!970120))

(assert (= (and b!970120 res!649312) b!970111))

(assert (= (and b!970111 res!649308) b!970113))

(assert (= (and b!970113 res!649311) b!970114))

(assert (= (and b!970114 res!649314) b!970116))

(assert (= (and b!970116 res!649309) b!970112))

(assert (= (and b!970112 res!649313) b!970118))

(assert (= (and b!970119 condMapEmpty!35080) mapIsEmpty!35080))

(assert (= (and b!970119 (not condMapEmpty!35080)) mapNonEmpty!35080))

(get-info :version)

(assert (= (and mapNonEmpty!35080 ((_ is ValueCellFull!10542) mapValue!35080)) b!970117))

(assert (= (and b!970119 ((_ is ValueCellFull!10542) mapDefault!35080)) b!970115))

(assert (= start!83156 b!970119))

(declare-fun m!897927 () Bool)

(assert (=> b!970116 m!897927))

(assert (=> b!970116 m!897927))

(declare-fun m!897929 () Bool)

(assert (=> b!970116 m!897929))

(declare-fun m!897931 () Bool)

(assert (=> mapNonEmpty!35080 m!897931))

(declare-fun m!897933 () Bool)

(assert (=> b!970112 m!897933))

(assert (=> b!970112 m!897927))

(assert (=> b!970112 m!897933))

(assert (=> b!970112 m!897927))

(declare-fun m!897935 () Bool)

(assert (=> b!970112 m!897935))

(declare-fun m!897937 () Bool)

(assert (=> b!970111 m!897937))

(declare-fun m!897939 () Bool)

(assert (=> b!970113 m!897939))

(declare-fun m!897941 () Bool)

(assert (=> start!83156 m!897941))

(declare-fun m!897943 () Bool)

(assert (=> start!83156 m!897943))

(declare-fun m!897945 () Bool)

(assert (=> start!83156 m!897945))

(check-sat (not b_next!19149) tp_is_empty!22047 (not b!970116) (not b!970112) (not b!970113) (not start!83156) (not mapNonEmpty!35080) (not b!970111) b_and!30637)
(check-sat b_and!30637 (not b_next!19149))
