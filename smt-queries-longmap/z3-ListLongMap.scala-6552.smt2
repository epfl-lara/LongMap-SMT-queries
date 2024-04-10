; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83198 () Bool)

(assert start!83198)

(declare-fun b_free!19191 () Bool)

(declare-fun b_next!19191 () Bool)

(assert (=> start!83198 (= b_free!19191 (not b_next!19191))))

(declare-fun tp!66851 () Bool)

(declare-fun b_and!30679 () Bool)

(assert (=> start!83198 (= tp!66851 b_and!30679)))

(declare-fun b!970682 () Bool)

(declare-fun res!649690 () Bool)

(declare-fun e!547234 () Bool)

(assert (=> b!970682 (=> (not res!649690) (not e!547234))))

(declare-datatypes ((array!60233 0))(
  ( (array!60234 (arr!28980 (Array (_ BitVec 32) (_ BitVec 64))) (size!29459 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60233)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970682 (= res!649690 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29459 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29459 _keys!1717))))))

(declare-fun b!970683 () Bool)

(declare-fun e!547233 () Bool)

(declare-fun e!547231 () Bool)

(declare-fun mapRes!35143 () Bool)

(assert (=> b!970683 (= e!547233 (and e!547231 mapRes!35143))))

(declare-fun condMapEmpty!35143 () Bool)

(declare-datatypes ((V!34435 0))(
  ( (V!34436 (val!11095 Int)) )
))
(declare-datatypes ((ValueCell!10563 0))(
  ( (ValueCellFull!10563 (v!13654 V!34435)) (EmptyCell!10563) )
))
(declare-datatypes ((array!60235 0))(
  ( (array!60236 (arr!28981 (Array (_ BitVec 32) ValueCell!10563)) (size!29460 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60235)

(declare-fun mapDefault!35143 () ValueCell!10563)

(assert (=> b!970683 (= condMapEmpty!35143 (= (arr!28981 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10563)) mapDefault!35143)))))

(declare-fun mapIsEmpty!35143 () Bool)

(assert (=> mapIsEmpty!35143 mapRes!35143))

(declare-fun b!970684 () Bool)

(declare-fun res!649694 () Bool)

(assert (=> b!970684 (=> (not res!649694) (not e!547234))))

(declare-datatypes ((List!20088 0))(
  ( (Nil!20085) (Cons!20084 (h!21246 (_ BitVec 64)) (t!28451 List!20088)) )
))
(declare-fun arrayNoDuplicates!0 (array!60233 (_ BitVec 32) List!20088) Bool)

(assert (=> b!970684 (= res!649694 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20085))))

(declare-fun res!649692 () Bool)

(assert (=> start!83198 (=> (not res!649692) (not e!547234))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83198 (= res!649692 (validMask!0 mask!2147))))

(assert (=> start!83198 e!547234))

(assert (=> start!83198 true))

(declare-fun array_inv!22431 (array!60235) Bool)

(assert (=> start!83198 (and (array_inv!22431 _values!1425) e!547233)))

(declare-fun tp_is_empty!22089 () Bool)

(assert (=> start!83198 tp_is_empty!22089))

(assert (=> start!83198 tp!66851))

(declare-fun array_inv!22432 (array!60233) Bool)

(assert (=> start!83198 (array_inv!22432 _keys!1717)))

(declare-fun b!970685 () Bool)

(assert (=> b!970685 (= e!547234 false)))

(declare-fun lt!431765 () Bool)

(declare-fun zeroValue!1367 () V!34435)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34435)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14220 0))(
  ( (tuple2!14221 (_1!7121 (_ BitVec 64)) (_2!7121 V!34435)) )
))
(declare-datatypes ((List!20089 0))(
  ( (Nil!20086) (Cons!20085 (h!21247 tuple2!14220) (t!28452 List!20089)) )
))
(declare-datatypes ((ListLongMap!12917 0))(
  ( (ListLongMap!12918 (toList!6474 List!20089)) )
))
(declare-fun contains!5578 (ListLongMap!12917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3707 (array!60233 array!60235 (_ BitVec 32) (_ BitVec 32) V!34435 V!34435 (_ BitVec 32) Int) ListLongMap!12917)

(assert (=> b!970685 (= lt!431765 (contains!5578 (getCurrentListMap!3707 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28980 _keys!1717) i!822)))))

(declare-fun b!970686 () Bool)

(declare-fun res!649693 () Bool)

(assert (=> b!970686 (=> (not res!649693) (not e!547234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60233 (_ BitVec 32)) Bool)

(assert (=> b!970686 (= res!649693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970687 () Bool)

(declare-fun e!547232 () Bool)

(assert (=> b!970687 (= e!547232 tp_is_empty!22089)))

(declare-fun b!970688 () Bool)

(declare-fun res!649695 () Bool)

(assert (=> b!970688 (=> (not res!649695) (not e!547234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970688 (= res!649695 (validKeyInArray!0 (select (arr!28980 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35143 () Bool)

(declare-fun tp!66852 () Bool)

(assert (=> mapNonEmpty!35143 (= mapRes!35143 (and tp!66852 e!547232))))

(declare-fun mapKey!35143 () (_ BitVec 32))

(declare-fun mapRest!35143 () (Array (_ BitVec 32) ValueCell!10563))

(declare-fun mapValue!35143 () ValueCell!10563)

(assert (=> mapNonEmpty!35143 (= (arr!28981 _values!1425) (store mapRest!35143 mapKey!35143 mapValue!35143))))

(declare-fun b!970689 () Bool)

(assert (=> b!970689 (= e!547231 tp_is_empty!22089)))

(declare-fun b!970690 () Bool)

(declare-fun res!649691 () Bool)

(assert (=> b!970690 (=> (not res!649691) (not e!547234))))

(assert (=> b!970690 (= res!649691 (and (= (size!29460 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29459 _keys!1717) (size!29460 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83198 res!649692) b!970690))

(assert (= (and b!970690 res!649691) b!970686))

(assert (= (and b!970686 res!649693) b!970684))

(assert (= (and b!970684 res!649694) b!970682))

(assert (= (and b!970682 res!649690) b!970688))

(assert (= (and b!970688 res!649695) b!970685))

(assert (= (and b!970683 condMapEmpty!35143) mapIsEmpty!35143))

(assert (= (and b!970683 (not condMapEmpty!35143)) mapNonEmpty!35143))

(get-info :version)

(assert (= (and mapNonEmpty!35143 ((_ is ValueCellFull!10563) mapValue!35143)) b!970687))

(assert (= (and b!970683 ((_ is ValueCellFull!10563) mapDefault!35143)) b!970689))

(assert (= start!83198 b!970683))

(declare-fun m!898347 () Bool)

(assert (=> b!970685 m!898347))

(declare-fun m!898349 () Bool)

(assert (=> b!970685 m!898349))

(assert (=> b!970685 m!898347))

(assert (=> b!970685 m!898349))

(declare-fun m!898351 () Bool)

(assert (=> b!970685 m!898351))

(declare-fun m!898353 () Bool)

(assert (=> b!970686 m!898353))

(assert (=> b!970688 m!898349))

(assert (=> b!970688 m!898349))

(declare-fun m!898355 () Bool)

(assert (=> b!970688 m!898355))

(declare-fun m!898357 () Bool)

(assert (=> start!83198 m!898357))

(declare-fun m!898359 () Bool)

(assert (=> start!83198 m!898359))

(declare-fun m!898361 () Bool)

(assert (=> start!83198 m!898361))

(declare-fun m!898363 () Bool)

(assert (=> mapNonEmpty!35143 m!898363))

(declare-fun m!898365 () Bool)

(assert (=> b!970684 m!898365))

(check-sat (not start!83198) (not b!970686) tp_is_empty!22089 (not b!970688) (not b!970684) (not b_next!19191) (not mapNonEmpty!35143) b_and!30679 (not b!970685))
(check-sat b_and!30679 (not b_next!19191))
