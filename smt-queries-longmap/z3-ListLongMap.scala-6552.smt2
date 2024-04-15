; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83178 () Bool)

(assert start!83178)

(declare-fun b_free!19189 () Bool)

(declare-fun b_next!19189 () Bool)

(assert (=> start!83178 (= b_free!19189 (not b_next!19189))))

(declare-fun tp!66847 () Bool)

(declare-fun b_and!30651 () Bool)

(assert (=> start!83178 (= tp!66847 b_and!30651)))

(declare-fun b!970416 () Bool)

(declare-fun res!649565 () Bool)

(declare-fun e!547069 () Bool)

(assert (=> b!970416 (=> (not res!649565) (not e!547069))))

(declare-datatypes ((array!60164 0))(
  ( (array!60165 (arr!28946 (Array (_ BitVec 32) (_ BitVec 64))) (size!29427 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60164)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60164 (_ BitVec 32)) Bool)

(assert (=> b!970416 (= res!649565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970417 () Bool)

(declare-fun res!649567 () Bool)

(assert (=> b!970417 (=> (not res!649567) (not e!547069))))

(declare-datatypes ((List!20118 0))(
  ( (Nil!20115) (Cons!20114 (h!21276 (_ BitVec 64)) (t!28472 List!20118)) )
))
(declare-fun arrayNoDuplicates!0 (array!60164 (_ BitVec 32) List!20118) Bool)

(assert (=> b!970417 (= res!649567 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20115))))

(declare-fun b!970418 () Bool)

(assert (=> b!970418 (= e!547069 false)))

(declare-datatypes ((V!34433 0))(
  ( (V!34434 (val!11094 Int)) )
))
(declare-datatypes ((ValueCell!10562 0))(
  ( (ValueCellFull!10562 (v!13652 V!34433)) (EmptyCell!10562) )
))
(declare-datatypes ((array!60166 0))(
  ( (array!60167 (arr!28947 (Array (_ BitVec 32) ValueCell!10562)) (size!29428 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60166)

(declare-fun lt!431526 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34433)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34433)

(declare-datatypes ((tuple2!14296 0))(
  ( (tuple2!14297 (_1!7159 (_ BitVec 64)) (_2!7159 V!34433)) )
))
(declare-datatypes ((List!20119 0))(
  ( (Nil!20116) (Cons!20115 (h!21277 tuple2!14296) (t!28473 List!20119)) )
))
(declare-datatypes ((ListLongMap!12983 0))(
  ( (ListLongMap!12984 (toList!6507 List!20119)) )
))
(declare-fun contains!5555 (ListLongMap!12983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3669 (array!60164 array!60166 (_ BitVec 32) (_ BitVec 32) V!34433 V!34433 (_ BitVec 32) Int) ListLongMap!12983)

(assert (=> b!970418 (= lt!431526 (contains!5555 (getCurrentListMap!3669 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28946 _keys!1717) i!822)))))

(declare-fun b!970419 () Bool)

(declare-fun res!649566 () Bool)

(assert (=> b!970419 (=> (not res!649566) (not e!547069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970419 (= res!649566 (validKeyInArray!0 (select (arr!28946 _keys!1717) i!822)))))

(declare-fun b!970420 () Bool)

(declare-fun e!547067 () Bool)

(declare-fun tp_is_empty!22087 () Bool)

(assert (=> b!970420 (= e!547067 tp_is_empty!22087)))

(declare-fun b!970421 () Bool)

(declare-fun res!649563 () Bool)

(assert (=> b!970421 (=> (not res!649563) (not e!547069))))

(assert (=> b!970421 (= res!649563 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29427 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29427 _keys!1717))))))

(declare-fun res!649564 () Bool)

(assert (=> start!83178 (=> (not res!649564) (not e!547069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83178 (= res!649564 (validMask!0 mask!2147))))

(assert (=> start!83178 e!547069))

(assert (=> start!83178 true))

(declare-fun e!547068 () Bool)

(declare-fun array_inv!22469 (array!60166) Bool)

(assert (=> start!83178 (and (array_inv!22469 _values!1425) e!547068)))

(assert (=> start!83178 tp_is_empty!22087))

(assert (=> start!83178 tp!66847))

(declare-fun array_inv!22470 (array!60164) Bool)

(assert (=> start!83178 (array_inv!22470 _keys!1717)))

(declare-fun b!970422 () Bool)

(declare-fun e!547070 () Bool)

(declare-fun mapRes!35140 () Bool)

(assert (=> b!970422 (= e!547068 (and e!547070 mapRes!35140))))

(declare-fun condMapEmpty!35140 () Bool)

(declare-fun mapDefault!35140 () ValueCell!10562)

(assert (=> b!970422 (= condMapEmpty!35140 (= (arr!28947 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10562)) mapDefault!35140)))))

(declare-fun b!970423 () Bool)

(declare-fun res!649562 () Bool)

(assert (=> b!970423 (=> (not res!649562) (not e!547069))))

(assert (=> b!970423 (= res!649562 (and (= (size!29428 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29427 _keys!1717) (size!29428 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35140 () Bool)

(declare-fun tp!66846 () Bool)

(assert (=> mapNonEmpty!35140 (= mapRes!35140 (and tp!66846 e!547067))))

(declare-fun mapKey!35140 () (_ BitVec 32))

(declare-fun mapValue!35140 () ValueCell!10562)

(declare-fun mapRest!35140 () (Array (_ BitVec 32) ValueCell!10562))

(assert (=> mapNonEmpty!35140 (= (arr!28947 _values!1425) (store mapRest!35140 mapKey!35140 mapValue!35140))))

(declare-fun mapIsEmpty!35140 () Bool)

(assert (=> mapIsEmpty!35140 mapRes!35140))

(declare-fun b!970424 () Bool)

(assert (=> b!970424 (= e!547070 tp_is_empty!22087)))

(assert (= (and start!83178 res!649564) b!970423))

(assert (= (and b!970423 res!649562) b!970416))

(assert (= (and b!970416 res!649565) b!970417))

(assert (= (and b!970417 res!649567) b!970421))

(assert (= (and b!970421 res!649563) b!970419))

(assert (= (and b!970419 res!649566) b!970418))

(assert (= (and b!970422 condMapEmpty!35140) mapIsEmpty!35140))

(assert (= (and b!970422 (not condMapEmpty!35140)) mapNonEmpty!35140))

(get-info :version)

(assert (= (and mapNonEmpty!35140 ((_ is ValueCellFull!10562) mapValue!35140)) b!970420))

(assert (= (and b!970422 ((_ is ValueCellFull!10562) mapDefault!35140)) b!970424))

(assert (= start!83178 b!970422))

(declare-fun m!897569 () Bool)

(assert (=> start!83178 m!897569))

(declare-fun m!897571 () Bool)

(assert (=> start!83178 m!897571))

(declare-fun m!897573 () Bool)

(assert (=> start!83178 m!897573))

(declare-fun m!897575 () Bool)

(assert (=> b!970417 m!897575))

(declare-fun m!897577 () Bool)

(assert (=> b!970416 m!897577))

(declare-fun m!897579 () Bool)

(assert (=> b!970418 m!897579))

(declare-fun m!897581 () Bool)

(assert (=> b!970418 m!897581))

(assert (=> b!970418 m!897579))

(assert (=> b!970418 m!897581))

(declare-fun m!897583 () Bool)

(assert (=> b!970418 m!897583))

(assert (=> b!970419 m!897581))

(assert (=> b!970419 m!897581))

(declare-fun m!897585 () Bool)

(assert (=> b!970419 m!897585))

(declare-fun m!897587 () Bool)

(assert (=> mapNonEmpty!35140 m!897587))

(check-sat (not b!970416) (not b!970417) b_and!30651 (not b_next!19189) tp_is_empty!22087 (not start!83178) (not b!970419) (not mapNonEmpty!35140) (not b!970418))
(check-sat b_and!30651 (not b_next!19189))
