; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83226 () Bool)

(assert start!83226)

(declare-fun b_free!19237 () Bool)

(declare-fun b_next!19237 () Bool)

(assert (=> start!83226 (= b_free!19237 (not b_next!19237))))

(declare-fun tp!66990 () Bool)

(declare-fun b_and!30699 () Bool)

(assert (=> start!83226 (= tp!66990 b_and!30699)))

(declare-fun b!971120 () Bool)

(declare-fun e!547431 () Bool)

(declare-fun tp_is_empty!22135 () Bool)

(assert (=> b!971120 (= e!547431 tp_is_empty!22135)))

(declare-fun mapIsEmpty!35212 () Bool)

(declare-fun mapRes!35212 () Bool)

(assert (=> mapIsEmpty!35212 mapRes!35212))

(declare-fun res!650056 () Bool)

(declare-fun e!547429 () Bool)

(assert (=> start!83226 (=> (not res!650056) (not e!547429))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83226 (= res!650056 (validMask!0 mask!2147))))

(assert (=> start!83226 e!547429))

(assert (=> start!83226 true))

(declare-datatypes ((V!34497 0))(
  ( (V!34498 (val!11118 Int)) )
))
(declare-datatypes ((ValueCell!10586 0))(
  ( (ValueCellFull!10586 (v!13676 V!34497)) (EmptyCell!10586) )
))
(declare-datatypes ((array!60254 0))(
  ( (array!60255 (arr!28991 (Array (_ BitVec 32) ValueCell!10586)) (size!29472 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60254)

(declare-fun e!547430 () Bool)

(declare-fun array_inv!22501 (array!60254) Bool)

(assert (=> start!83226 (and (array_inv!22501 _values!1425) e!547430)))

(assert (=> start!83226 tp_is_empty!22135))

(assert (=> start!83226 tp!66990))

(declare-datatypes ((array!60256 0))(
  ( (array!60257 (arr!28992 (Array (_ BitVec 32) (_ BitVec 64))) (size!29473 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60256)

(declare-fun array_inv!22502 (array!60256) Bool)

(assert (=> start!83226 (array_inv!22502 _keys!1717)))

(declare-fun b!971121 () Bool)

(assert (=> b!971121 (= e!547430 (and e!547431 mapRes!35212))))

(declare-fun condMapEmpty!35212 () Bool)

(declare-fun mapDefault!35212 () ValueCell!10586)

(assert (=> b!971121 (= condMapEmpty!35212 (= (arr!28991 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10586)) mapDefault!35212)))))

(declare-fun b!971122 () Bool)

(declare-fun res!650054 () Bool)

(assert (=> b!971122 (=> (not res!650054) (not e!547429))))

(declare-fun zeroValue!1367 () V!34497)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34497)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((tuple2!14336 0))(
  ( (tuple2!14337 (_1!7179 (_ BitVec 64)) (_2!7179 V!34497)) )
))
(declare-datatypes ((List!20154 0))(
  ( (Nil!20151) (Cons!20150 (h!21312 tuple2!14336) (t!28508 List!20154)) )
))
(declare-datatypes ((ListLongMap!13023 0))(
  ( (ListLongMap!13024 (toList!6527 List!20154)) )
))
(declare-fun contains!5573 (ListLongMap!13023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3689 (array!60256 array!60254 (_ BitVec 32) (_ BitVec 32) V!34497 V!34497 (_ BitVec 32) Int) ListLongMap!13023)

(assert (=> b!971122 (= res!650054 (contains!5573 (getCurrentListMap!3689 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28992 _keys!1717) i!822)))))

(declare-fun b!971123 () Bool)

(assert (=> b!971123 (= e!547429 false)))

(declare-fun lt!431589 () ListLongMap!13023)

(assert (=> b!971123 (= lt!431589 (getCurrentListMap!3689 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971124 () Bool)

(declare-fun res!650055 () Bool)

(assert (=> b!971124 (=> (not res!650055) (not e!547429))))

(assert (=> b!971124 (= res!650055 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29473 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29473 _keys!1717))))))

(declare-fun mapNonEmpty!35212 () Bool)

(declare-fun tp!66991 () Bool)

(declare-fun e!547428 () Bool)

(assert (=> mapNonEmpty!35212 (= mapRes!35212 (and tp!66991 e!547428))))

(declare-fun mapKey!35212 () (_ BitVec 32))

(declare-fun mapValue!35212 () ValueCell!10586)

(declare-fun mapRest!35212 () (Array (_ BitVec 32) ValueCell!10586))

(assert (=> mapNonEmpty!35212 (= (arr!28991 _values!1425) (store mapRest!35212 mapKey!35212 mapValue!35212))))

(declare-fun b!971125 () Bool)

(declare-fun res!650052 () Bool)

(assert (=> b!971125 (=> (not res!650052) (not e!547429))))

(declare-datatypes ((List!20155 0))(
  ( (Nil!20152) (Cons!20151 (h!21313 (_ BitVec 64)) (t!28509 List!20155)) )
))
(declare-fun arrayNoDuplicates!0 (array!60256 (_ BitVec 32) List!20155) Bool)

(assert (=> b!971125 (= res!650052 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20152))))

(declare-fun b!971126 () Bool)

(declare-fun res!650051 () Bool)

(assert (=> b!971126 (=> (not res!650051) (not e!547429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60256 (_ BitVec 32)) Bool)

(assert (=> b!971126 (= res!650051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971127 () Bool)

(declare-fun res!650050 () Bool)

(assert (=> b!971127 (=> (not res!650050) (not e!547429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971127 (= res!650050 (validKeyInArray!0 (select (arr!28992 _keys!1717) i!822)))))

(declare-fun b!971128 () Bool)

(declare-fun res!650053 () Bool)

(assert (=> b!971128 (=> (not res!650053) (not e!547429))))

(assert (=> b!971128 (= res!650053 (and (= (size!29472 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29473 _keys!1717) (size!29472 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971129 () Bool)

(assert (=> b!971129 (= e!547428 tp_is_empty!22135)))

(assert (= (and start!83226 res!650056) b!971128))

(assert (= (and b!971128 res!650053) b!971126))

(assert (= (and b!971126 res!650051) b!971125))

(assert (= (and b!971125 res!650052) b!971124))

(assert (= (and b!971124 res!650055) b!971127))

(assert (= (and b!971127 res!650050) b!971122))

(assert (= (and b!971122 res!650054) b!971123))

(assert (= (and b!971121 condMapEmpty!35212) mapIsEmpty!35212))

(assert (= (and b!971121 (not condMapEmpty!35212)) mapNonEmpty!35212))

(get-info :version)

(assert (= (and mapNonEmpty!35212 ((_ is ValueCellFull!10586) mapValue!35212)) b!971129))

(assert (= (and b!971121 ((_ is ValueCellFull!10586) mapDefault!35212)) b!971120))

(assert (= start!83226 b!971121))

(declare-fun m!898079 () Bool)

(assert (=> b!971126 m!898079))

(declare-fun m!898081 () Bool)

(assert (=> start!83226 m!898081))

(declare-fun m!898083 () Bool)

(assert (=> start!83226 m!898083))

(declare-fun m!898085 () Bool)

(assert (=> start!83226 m!898085))

(declare-fun m!898087 () Bool)

(assert (=> b!971125 m!898087))

(declare-fun m!898089 () Bool)

(assert (=> b!971123 m!898089))

(declare-fun m!898091 () Bool)

(assert (=> b!971122 m!898091))

(declare-fun m!898093 () Bool)

(assert (=> b!971122 m!898093))

(assert (=> b!971122 m!898091))

(assert (=> b!971122 m!898093))

(declare-fun m!898095 () Bool)

(assert (=> b!971122 m!898095))

(declare-fun m!898097 () Bool)

(assert (=> mapNonEmpty!35212 m!898097))

(assert (=> b!971127 m!898093))

(assert (=> b!971127 m!898093))

(declare-fun m!898099 () Bool)

(assert (=> b!971127 m!898099))

(check-sat b_and!30699 (not start!83226) (not b_next!19237) (not b!971127) (not mapNonEmpty!35212) tp_is_empty!22135 (not b!971125) (not b!971126) (not b!971122) (not b!971123))
(check-sat b_and!30699 (not b_next!19237))
