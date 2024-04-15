; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43514 () Bool)

(assert start!43514)

(declare-fun b_free!12307 () Bool)

(declare-fun b_next!12307 () Bool)

(assert (=> start!43514 (= b_free!12307 (not b_next!12307))))

(declare-fun tp!43203 () Bool)

(declare-fun b_and!21041 () Bool)

(assert (=> start!43514 (= tp!43203 b_and!21041)))

(declare-fun b!482008 () Bool)

(declare-fun e!283631 () Bool)

(declare-fun e!283635 () Bool)

(declare-fun mapRes!22438 () Bool)

(assert (=> b!482008 (= e!283631 (and e!283635 mapRes!22438))))

(declare-fun condMapEmpty!22438 () Bool)

(declare-datatypes ((V!19497 0))(
  ( (V!19498 (val!6957 Int)) )
))
(declare-datatypes ((ValueCell!6548 0))(
  ( (ValueCellFull!6548 (v!9244 V!19497)) (EmptyCell!6548) )
))
(declare-datatypes ((array!31289 0))(
  ( (array!31290 (arr!15047 (Array (_ BitVec 32) ValueCell!6548)) (size!15406 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31289)

(declare-fun mapDefault!22438 () ValueCell!6548)

(assert (=> b!482008 (= condMapEmpty!22438 (= (arr!15047 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6548)) mapDefault!22438)))))

(declare-fun b!482010 () Bool)

(declare-fun res!287368 () Bool)

(declare-fun e!283633 () Bool)

(assert (=> b!482010 (=> (not res!287368) (not e!283633))))

(declare-datatypes ((array!31291 0))(
  ( (array!31292 (arr!15048 (Array (_ BitVec 32) (_ BitVec 64))) (size!15407 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31291)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31291 (_ BitVec 32)) Bool)

(assert (=> b!482010 (= res!287368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482011 () Bool)

(declare-fun tp_is_empty!13819 () Bool)

(assert (=> b!482011 (= e!283635 tp_is_empty!13819)))

(declare-fun mapNonEmpty!22438 () Bool)

(declare-fun tp!43204 () Bool)

(declare-fun e!283632 () Bool)

(assert (=> mapNonEmpty!22438 (= mapRes!22438 (and tp!43204 e!283632))))

(declare-fun mapKey!22438 () (_ BitVec 32))

(declare-fun mapRest!22438 () (Array (_ BitVec 32) ValueCell!6548))

(declare-fun mapValue!22438 () ValueCell!6548)

(assert (=> mapNonEmpty!22438 (= (arr!15047 _values!1516) (store mapRest!22438 mapKey!22438 mapValue!22438))))

(declare-fun b!482012 () Bool)

(declare-fun res!287365 () Bool)

(assert (=> b!482012 (=> (not res!287365) (not e!283633))))

(declare-datatypes ((List!9245 0))(
  ( (Nil!9242) (Cons!9241 (h!10097 (_ BitVec 64)) (t!15450 List!9245)) )
))
(declare-fun arrayNoDuplicates!0 (array!31291 (_ BitVec 32) List!9245) Bool)

(assert (=> b!482012 (= res!287365 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9242))))

(declare-fun b!482013 () Bool)

(declare-fun res!287366 () Bool)

(assert (=> b!482013 (=> (not res!287366) (not e!283633))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482013 (= res!287366 (and (= (size!15406 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15407 _keys!1874) (size!15406 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22438 () Bool)

(assert (=> mapIsEmpty!22438 mapRes!22438))

(declare-fun b!482014 () Bool)

(assert (=> b!482014 (= e!283633 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218464 () Bool)

(declare-fun zeroValue!1458 () V!19497)

(declare-fun minValue!1458 () V!19497)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9180 0))(
  ( (tuple2!9181 (_1!4601 (_ BitVec 64)) (_2!4601 V!19497)) )
))
(declare-datatypes ((List!9246 0))(
  ( (Nil!9243) (Cons!9242 (h!10098 tuple2!9180) (t!15451 List!9246)) )
))
(declare-datatypes ((ListLongMap!8083 0))(
  ( (ListLongMap!8084 (toList!4057 List!9246)) )
))
(declare-fun contains!2636 (ListLongMap!8083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2310 (array!31291 array!31289 (_ BitVec 32) (_ BitVec 32) V!19497 V!19497 (_ BitVec 32) Int) ListLongMap!8083)

(assert (=> b!482014 (= lt!218464 (contains!2636 (getCurrentListMap!2310 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482009 () Bool)

(assert (=> b!482009 (= e!283632 tp_is_empty!13819)))

(declare-fun res!287367 () Bool)

(assert (=> start!43514 (=> (not res!287367) (not e!283633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43514 (= res!287367 (validMask!0 mask!2352))))

(assert (=> start!43514 e!283633))

(assert (=> start!43514 true))

(assert (=> start!43514 tp_is_empty!13819))

(declare-fun array_inv!10942 (array!31289) Bool)

(assert (=> start!43514 (and (array_inv!10942 _values!1516) e!283631)))

(assert (=> start!43514 tp!43203))

(declare-fun array_inv!10943 (array!31291) Bool)

(assert (=> start!43514 (array_inv!10943 _keys!1874)))

(assert (= (and start!43514 res!287367) b!482013))

(assert (= (and b!482013 res!287366) b!482010))

(assert (= (and b!482010 res!287368) b!482012))

(assert (= (and b!482012 res!287365) b!482014))

(assert (= (and b!482008 condMapEmpty!22438) mapIsEmpty!22438))

(assert (= (and b!482008 (not condMapEmpty!22438)) mapNonEmpty!22438))

(get-info :version)

(assert (= (and mapNonEmpty!22438 ((_ is ValueCellFull!6548) mapValue!22438)) b!482009))

(assert (= (and b!482008 ((_ is ValueCellFull!6548) mapDefault!22438)) b!482011))

(assert (= start!43514 b!482008))

(declare-fun m!462837 () Bool)

(assert (=> b!482010 m!462837))

(declare-fun m!462839 () Bool)

(assert (=> b!482014 m!462839))

(assert (=> b!482014 m!462839))

(declare-fun m!462841 () Bool)

(assert (=> b!482014 m!462841))

(declare-fun m!462843 () Bool)

(assert (=> b!482012 m!462843))

(declare-fun m!462845 () Bool)

(assert (=> mapNonEmpty!22438 m!462845))

(declare-fun m!462847 () Bool)

(assert (=> start!43514 m!462847))

(declare-fun m!462849 () Bool)

(assert (=> start!43514 m!462849))

(declare-fun m!462851 () Bool)

(assert (=> start!43514 m!462851))

(check-sat (not mapNonEmpty!22438) tp_is_empty!13819 b_and!21041 (not b!482010) (not b_next!12307) (not b!482012) (not start!43514) (not b!482014))
(check-sat b_and!21041 (not b_next!12307))
