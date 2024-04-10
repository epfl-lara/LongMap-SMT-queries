; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83252 () Bool)

(assert start!83252)

(declare-fun b_free!19245 () Bool)

(declare-fun b_next!19245 () Bool)

(assert (=> start!83252 (= b_free!19245 (not b_next!19245))))

(declare-fun tp!67014 () Bool)

(declare-fun b_and!30733 () Bool)

(assert (=> start!83252 (= tp!67014 b_and!30733)))

(declare-fun b!971479 () Bool)

(declare-fun e!547637 () Bool)

(declare-fun tp_is_empty!22143 () Bool)

(assert (=> b!971479 (= e!547637 tp_is_empty!22143)))

(declare-fun b!971480 () Bool)

(declare-fun res!650246 () Bool)

(declare-fun e!547635 () Bool)

(assert (=> b!971480 (=> (not res!650246) (not e!547635))))

(declare-datatypes ((array!60333 0))(
  ( (array!60334 (arr!29030 (Array (_ BitVec 32) (_ BitVec 64))) (size!29509 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60333)

(declare-datatypes ((List!20121 0))(
  ( (Nil!20118) (Cons!20117 (h!21279 (_ BitVec 64)) (t!28484 List!20121)) )
))
(declare-fun arrayNoDuplicates!0 (array!60333 (_ BitVec 32) List!20121) Bool)

(assert (=> b!971480 (= res!650246 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20118))))

(declare-fun mapNonEmpty!35224 () Bool)

(declare-fun mapRes!35224 () Bool)

(declare-fun tp!67013 () Bool)

(assert (=> mapNonEmpty!35224 (= mapRes!35224 (and tp!67013 e!547637))))

(declare-fun mapKey!35224 () (_ BitVec 32))

(declare-datatypes ((V!34507 0))(
  ( (V!34508 (val!11122 Int)) )
))
(declare-datatypes ((ValueCell!10590 0))(
  ( (ValueCellFull!10590 (v!13681 V!34507)) (EmptyCell!10590) )
))
(declare-datatypes ((array!60335 0))(
  ( (array!60336 (arr!29031 (Array (_ BitVec 32) ValueCell!10590)) (size!29510 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60335)

(declare-fun mapValue!35224 () ValueCell!10590)

(declare-fun mapRest!35224 () (Array (_ BitVec 32) ValueCell!10590))

(assert (=> mapNonEmpty!35224 (= (arr!29031 _values!1425) (store mapRest!35224 mapKey!35224 mapValue!35224))))

(declare-fun b!971482 () Bool)

(declare-fun res!650250 () Bool)

(assert (=> b!971482 (=> (not res!650250) (not e!547635))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34507)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34507)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14254 0))(
  ( (tuple2!14255 (_1!7138 (_ BitVec 64)) (_2!7138 V!34507)) )
))
(declare-datatypes ((List!20122 0))(
  ( (Nil!20119) (Cons!20118 (h!21280 tuple2!14254) (t!28485 List!20122)) )
))
(declare-datatypes ((ListLongMap!12951 0))(
  ( (ListLongMap!12952 (toList!6491 List!20122)) )
))
(declare-fun contains!5591 (ListLongMap!12951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3724 (array!60333 array!60335 (_ BitVec 32) (_ BitVec 32) V!34507 V!34507 (_ BitVec 32) Int) ListLongMap!12951)

(assert (=> b!971482 (= res!650250 (contains!5591 (getCurrentListMap!3724 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29030 _keys!1717) i!822)))))

(declare-fun b!971483 () Bool)

(declare-fun e!547636 () Bool)

(declare-fun e!547639 () Bool)

(assert (=> b!971483 (= e!547636 (and e!547639 mapRes!35224))))

(declare-fun condMapEmpty!35224 () Bool)

(declare-fun mapDefault!35224 () ValueCell!10590)

(assert (=> b!971483 (= condMapEmpty!35224 (= (arr!29031 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10590)) mapDefault!35224)))))

(declare-fun mapIsEmpty!35224 () Bool)

(assert (=> mapIsEmpty!35224 mapRes!35224))

(declare-fun b!971484 () Bool)

(declare-fun res!650247 () Bool)

(assert (=> b!971484 (=> (not res!650247) (not e!547635))))

(assert (=> b!971484 (= res!650247 (and (= (size!29510 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29509 _keys!1717) (size!29510 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971485 () Bool)

(assert (=> b!971485 (= e!547635 false)))

(declare-fun lt!431837 () ListLongMap!12951)

(assert (=> b!971485 (= lt!431837 (getCurrentListMap!3724 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971486 () Bool)

(declare-fun res!650245 () Bool)

(assert (=> b!971486 (=> (not res!650245) (not e!547635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971486 (= res!650245 (validKeyInArray!0 (select (arr!29030 _keys!1717) i!822)))))

(declare-fun b!971487 () Bool)

(declare-fun res!650244 () Bool)

(assert (=> b!971487 (=> (not res!650244) (not e!547635))))

(assert (=> b!971487 (= res!650244 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29509 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29509 _keys!1717))))))

(declare-fun b!971488 () Bool)

(declare-fun res!650248 () Bool)

(assert (=> b!971488 (=> (not res!650248) (not e!547635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60333 (_ BitVec 32)) Bool)

(assert (=> b!971488 (= res!650248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650249 () Bool)

(assert (=> start!83252 (=> (not res!650249) (not e!547635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83252 (= res!650249 (validMask!0 mask!2147))))

(assert (=> start!83252 e!547635))

(assert (=> start!83252 true))

(declare-fun array_inv!22465 (array!60335) Bool)

(assert (=> start!83252 (and (array_inv!22465 _values!1425) e!547636)))

(assert (=> start!83252 tp_is_empty!22143))

(assert (=> start!83252 tp!67014))

(declare-fun array_inv!22466 (array!60333) Bool)

(assert (=> start!83252 (array_inv!22466 _keys!1717)))

(declare-fun b!971481 () Bool)

(assert (=> b!971481 (= e!547639 tp_is_empty!22143)))

(assert (= (and start!83252 res!650249) b!971484))

(assert (= (and b!971484 res!650247) b!971488))

(assert (= (and b!971488 res!650248) b!971480))

(assert (= (and b!971480 res!650246) b!971487))

(assert (= (and b!971487 res!650244) b!971486))

(assert (= (and b!971486 res!650245) b!971482))

(assert (= (and b!971482 res!650250) b!971485))

(assert (= (and b!971483 condMapEmpty!35224) mapIsEmpty!35224))

(assert (= (and b!971483 (not condMapEmpty!35224)) mapNonEmpty!35224))

(get-info :version)

(assert (= (and mapNonEmpty!35224 ((_ is ValueCellFull!10590) mapValue!35224)) b!971479))

(assert (= (and b!971483 ((_ is ValueCellFull!10590) mapDefault!35224)) b!971481))

(assert (= start!83252 b!971483))

(declare-fun m!898925 () Bool)

(assert (=> b!971480 m!898925))

(declare-fun m!898927 () Bool)

(assert (=> b!971488 m!898927))

(declare-fun m!898929 () Bool)

(assert (=> b!971482 m!898929))

(declare-fun m!898931 () Bool)

(assert (=> b!971482 m!898931))

(assert (=> b!971482 m!898929))

(assert (=> b!971482 m!898931))

(declare-fun m!898933 () Bool)

(assert (=> b!971482 m!898933))

(declare-fun m!898935 () Bool)

(assert (=> start!83252 m!898935))

(declare-fun m!898937 () Bool)

(assert (=> start!83252 m!898937))

(declare-fun m!898939 () Bool)

(assert (=> start!83252 m!898939))

(assert (=> b!971486 m!898931))

(assert (=> b!971486 m!898931))

(declare-fun m!898941 () Bool)

(assert (=> b!971486 m!898941))

(declare-fun m!898943 () Bool)

(assert (=> b!971485 m!898943))

(declare-fun m!898945 () Bool)

(assert (=> mapNonEmpty!35224 m!898945))

(check-sat (not start!83252) (not b_next!19245) (not b!971488) tp_is_empty!22143 (not b!971480) b_and!30733 (not mapNonEmpty!35224) (not b!971482) (not b!971485) (not b!971486))
(check-sat b_and!30733 (not b_next!19245))
