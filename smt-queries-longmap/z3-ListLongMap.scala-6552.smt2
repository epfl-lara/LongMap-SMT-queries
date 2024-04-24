; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83364 () Bool)

(assert start!83364)

(declare-fun b_free!19189 () Bool)

(declare-fun b_next!19189 () Bool)

(assert (=> start!83364 (= b_free!19189 (not b_next!19189))))

(declare-fun tp!66847 () Bool)

(declare-fun b_and!30687 () Bool)

(assert (=> start!83364 (= tp!66847 b_and!30687)))

(declare-fun b!971558 () Bool)

(declare-fun res!650021 () Bool)

(declare-fun e!547801 () Bool)

(assert (=> b!971558 (=> (not res!650021) (not e!547801))))

(declare-datatypes ((array!60252 0))(
  ( (array!60253 (arr!28985 (Array (_ BitVec 32) (_ BitVec 64))) (size!29465 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60252)

(declare-datatypes ((List!20073 0))(
  ( (Nil!20070) (Cons!20069 (h!21237 (_ BitVec 64)) (t!28428 List!20073)) )
))
(declare-fun arrayNoDuplicates!0 (array!60252 (_ BitVec 32) List!20073) Bool)

(assert (=> b!971558 (= res!650021 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20070))))

(declare-fun b!971559 () Bool)

(declare-fun res!650016 () Bool)

(assert (=> b!971559 (=> (not res!650016) (not e!547801))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60252 (_ BitVec 32)) Bool)

(assert (=> b!971559 (= res!650016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971560 () Bool)

(declare-fun res!650018 () Bool)

(assert (=> b!971560 (=> (not res!650018) (not e!547801))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971560 (= res!650018 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29465 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29465 _keys!1717))))))

(declare-fun b!971561 () Bool)

(assert (=> b!971561 (= e!547801 false)))

(declare-datatypes ((V!34433 0))(
  ( (V!34434 (val!11094 Int)) )
))
(declare-datatypes ((ValueCell!10562 0))(
  ( (ValueCellFull!10562 (v!13650 V!34433)) (EmptyCell!10562) )
))
(declare-datatypes ((array!60254 0))(
  ( (array!60255 (arr!28986 (Array (_ BitVec 32) ValueCell!10562)) (size!29466 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60254)

(declare-fun zeroValue!1367 () V!34433)

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!432123 () Bool)

(declare-fun minValue!1367 () V!34433)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14218 0))(
  ( (tuple2!14219 (_1!7120 (_ BitVec 64)) (_2!7120 V!34433)) )
))
(declare-datatypes ((List!20074 0))(
  ( (Nil!20071) (Cons!20070 (h!21238 tuple2!14218) (t!28429 List!20074)) )
))
(declare-datatypes ((ListLongMap!12917 0))(
  ( (ListLongMap!12918 (toList!6474 List!20074)) )
))
(declare-fun contains!5589 (ListLongMap!12917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3707 (array!60252 array!60254 (_ BitVec 32) (_ BitVec 32) V!34433 V!34433 (_ BitVec 32) Int) ListLongMap!12917)

(assert (=> b!971561 (= lt!432123 (contains!5589 (getCurrentListMap!3707 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28985 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35140 () Bool)

(declare-fun mapRes!35140 () Bool)

(declare-fun tp!66846 () Bool)

(declare-fun e!547799 () Bool)

(assert (=> mapNonEmpty!35140 (= mapRes!35140 (and tp!66846 e!547799))))

(declare-fun mapKey!35140 () (_ BitVec 32))

(declare-fun mapValue!35140 () ValueCell!10562)

(declare-fun mapRest!35140 () (Array (_ BitVec 32) ValueCell!10562))

(assert (=> mapNonEmpty!35140 (= (arr!28986 _values!1425) (store mapRest!35140 mapKey!35140 mapValue!35140))))

(declare-fun mapIsEmpty!35140 () Bool)

(assert (=> mapIsEmpty!35140 mapRes!35140))

(declare-fun b!971562 () Bool)

(declare-fun e!547798 () Bool)

(declare-fun e!547800 () Bool)

(assert (=> b!971562 (= e!547798 (and e!547800 mapRes!35140))))

(declare-fun condMapEmpty!35140 () Bool)

(declare-fun mapDefault!35140 () ValueCell!10562)

(assert (=> b!971562 (= condMapEmpty!35140 (= (arr!28986 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10562)) mapDefault!35140)))))

(declare-fun b!971564 () Bool)

(declare-fun res!650017 () Bool)

(assert (=> b!971564 (=> (not res!650017) (not e!547801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971564 (= res!650017 (validKeyInArray!0 (select (arr!28985 _keys!1717) i!822)))))

(declare-fun b!971565 () Bool)

(declare-fun tp_is_empty!22087 () Bool)

(assert (=> b!971565 (= e!547800 tp_is_empty!22087)))

(declare-fun b!971566 () Bool)

(assert (=> b!971566 (= e!547799 tp_is_empty!22087)))

(declare-fun res!650020 () Bool)

(assert (=> start!83364 (=> (not res!650020) (not e!547801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83364 (= res!650020 (validMask!0 mask!2147))))

(assert (=> start!83364 e!547801))

(assert (=> start!83364 true))

(declare-fun array_inv!22485 (array!60254) Bool)

(assert (=> start!83364 (and (array_inv!22485 _values!1425) e!547798)))

(assert (=> start!83364 tp_is_empty!22087))

(assert (=> start!83364 tp!66847))

(declare-fun array_inv!22486 (array!60252) Bool)

(assert (=> start!83364 (array_inv!22486 _keys!1717)))

(declare-fun b!971563 () Bool)

(declare-fun res!650019 () Bool)

(assert (=> b!971563 (=> (not res!650019) (not e!547801))))

(assert (=> b!971563 (= res!650019 (and (= (size!29466 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29465 _keys!1717) (size!29466 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83364 res!650020) b!971563))

(assert (= (and b!971563 res!650019) b!971559))

(assert (= (and b!971559 res!650016) b!971558))

(assert (= (and b!971558 res!650021) b!971560))

(assert (= (and b!971560 res!650018) b!971564))

(assert (= (and b!971564 res!650017) b!971561))

(assert (= (and b!971562 condMapEmpty!35140) mapIsEmpty!35140))

(assert (= (and b!971562 (not condMapEmpty!35140)) mapNonEmpty!35140))

(get-info :version)

(assert (= (and mapNonEmpty!35140 ((_ is ValueCellFull!10562) mapValue!35140)) b!971566))

(assert (= (and b!971562 ((_ is ValueCellFull!10562) mapDefault!35140)) b!971565))

(assert (= start!83364 b!971562))

(declare-fun m!899621 () Bool)

(assert (=> mapNonEmpty!35140 m!899621))

(declare-fun m!899623 () Bool)

(assert (=> b!971561 m!899623))

(declare-fun m!899625 () Bool)

(assert (=> b!971561 m!899625))

(assert (=> b!971561 m!899623))

(assert (=> b!971561 m!899625))

(declare-fun m!899627 () Bool)

(assert (=> b!971561 m!899627))

(declare-fun m!899629 () Bool)

(assert (=> b!971559 m!899629))

(declare-fun m!899631 () Bool)

(assert (=> start!83364 m!899631))

(declare-fun m!899633 () Bool)

(assert (=> start!83364 m!899633))

(declare-fun m!899635 () Bool)

(assert (=> start!83364 m!899635))

(assert (=> b!971564 m!899625))

(assert (=> b!971564 m!899625))

(declare-fun m!899637 () Bool)

(assert (=> b!971564 m!899637))

(declare-fun m!899639 () Bool)

(assert (=> b!971558 m!899639))

(check-sat (not mapNonEmpty!35140) tp_is_empty!22087 (not b!971564) b_and!30687 (not b!971558) (not start!83364) (not b!971559) (not b!971561) (not b_next!19189))
(check-sat b_and!30687 (not b_next!19189))
