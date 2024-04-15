; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37026 () Bool)

(assert start!37026)

(declare-fun b_free!8167 () Bool)

(declare-fun b_next!8167 () Bool)

(assert (=> start!37026 (= b_free!8167 (not b_next!8167))))

(declare-fun tp!29216 () Bool)

(declare-fun b_and!15383 () Bool)

(assert (=> start!37026 (= tp!29216 b_and!15383)))

(declare-fun b!372025 () Bool)

(declare-fun res!209324 () Bool)

(declare-fun e!226943 () Bool)

(assert (=> b!372025 (=> (not res!209324) (not e!226943))))

(declare-datatypes ((array!21555 0))(
  ( (array!21556 (arr!10246 (Array (_ BitVec 32) (_ BitVec 64))) (size!10599 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21555)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372025 (= res!209324 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372026 () Bool)

(declare-fun res!209329 () Bool)

(assert (=> b!372026 (=> (not res!209329) (not e!226943))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12859 0))(
  ( (V!12860 (val!4452 Int)) )
))
(declare-datatypes ((ValueCell!4064 0))(
  ( (ValueCellFull!4064 (v!6643 V!12859)) (EmptyCell!4064) )
))
(declare-datatypes ((array!21557 0))(
  ( (array!21558 (arr!10247 (Array (_ BitVec 32) ValueCell!4064)) (size!10600 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21557)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!372026 (= res!209329 (and (= (size!10600 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10599 _keys!658) (size!10600 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372027 () Bool)

(declare-fun res!209325 () Bool)

(assert (=> b!372027 (=> (not res!209325) (not e!226943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21555 (_ BitVec 32)) Bool)

(assert (=> b!372027 (= res!209325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372028 () Bool)

(declare-fun e!226939 () Bool)

(declare-fun tp_is_empty!8815 () Bool)

(assert (=> b!372028 (= e!226939 tp_is_empty!8815)))

(declare-fun b!372029 () Bool)

(declare-fun res!209326 () Bool)

(assert (=> b!372029 (=> (not res!209326) (not e!226943))))

(declare-datatypes ((List!5715 0))(
  ( (Nil!5712) (Cons!5711 (h!6567 (_ BitVec 64)) (t!10856 List!5715)) )
))
(declare-fun arrayNoDuplicates!0 (array!21555 (_ BitVec 32) List!5715) Bool)

(assert (=> b!372029 (= res!209326 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5712))))

(declare-fun res!209327 () Bool)

(assert (=> start!37026 (=> (not res!209327) (not e!226943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37026 (= res!209327 (validMask!0 mask!970))))

(assert (=> start!37026 e!226943))

(declare-fun e!226940 () Bool)

(declare-fun array_inv!7568 (array!21557) Bool)

(assert (=> start!37026 (and (array_inv!7568 _values!506) e!226940)))

(assert (=> start!37026 tp!29216))

(assert (=> start!37026 true))

(assert (=> start!37026 tp_is_empty!8815))

(declare-fun array_inv!7569 (array!21555) Bool)

(assert (=> start!37026 (array_inv!7569 _keys!658)))

(declare-fun mapIsEmpty!14787 () Bool)

(declare-fun mapRes!14787 () Bool)

(assert (=> mapIsEmpty!14787 mapRes!14787))

(declare-fun b!372030 () Bool)

(declare-fun e!226938 () Bool)

(assert (=> b!372030 (= e!226938 (not true))))

(declare-datatypes ((tuple2!5878 0))(
  ( (tuple2!5879 (_1!2950 (_ BitVec 64)) (_2!2950 V!12859)) )
))
(declare-datatypes ((List!5716 0))(
  ( (Nil!5713) (Cons!5712 (h!6568 tuple2!5878) (t!10857 List!5716)) )
))
(declare-datatypes ((ListLongMap!4781 0))(
  ( (ListLongMap!4782 (toList!2406 List!5716)) )
))
(declare-fun lt!170443 () ListLongMap!4781)

(declare-fun lt!170441 () array!21557)

(declare-fun lt!170445 () array!21555)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12859)

(declare-fun minValue!472 () V!12859)

(declare-fun getCurrentListMap!1832 (array!21555 array!21557 (_ BitVec 32) (_ BitVec 32) V!12859 V!12859 (_ BitVec 32) Int) ListLongMap!4781)

(assert (=> b!372030 (= lt!170443 (getCurrentListMap!1832 lt!170445 lt!170441 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170442 () ListLongMap!4781)

(declare-fun lt!170439 () ListLongMap!4781)

(assert (=> b!372030 (and (= lt!170442 lt!170439) (= lt!170439 lt!170442))))

(declare-fun v!373 () V!12859)

(declare-fun lt!170440 () ListLongMap!4781)

(declare-fun +!774 (ListLongMap!4781 tuple2!5878) ListLongMap!4781)

(assert (=> b!372030 (= lt!170439 (+!774 lt!170440 (tuple2!5879 k0!778 v!373)))))

(declare-datatypes ((Unit!11424 0))(
  ( (Unit!11425) )
))
(declare-fun lt!170444 () Unit!11424)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!25 (array!21555 array!21557 (_ BitVec 32) (_ BitVec 32) V!12859 V!12859 (_ BitVec 32) (_ BitVec 64) V!12859 (_ BitVec 32) Int) Unit!11424)

(assert (=> b!372030 (= lt!170444 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!25 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!697 (array!21555 array!21557 (_ BitVec 32) (_ BitVec 32) V!12859 V!12859 (_ BitVec 32) Int) ListLongMap!4781)

(assert (=> b!372030 (= lt!170442 (getCurrentListMapNoExtraKeys!697 lt!170445 lt!170441 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372030 (= lt!170441 (array!21558 (store (arr!10247 _values!506) i!548 (ValueCellFull!4064 v!373)) (size!10600 _values!506)))))

(assert (=> b!372030 (= lt!170440 (getCurrentListMapNoExtraKeys!697 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372031 () Bool)

(assert (=> b!372031 (= e!226943 e!226938)))

(declare-fun res!209330 () Bool)

(assert (=> b!372031 (=> (not res!209330) (not e!226938))))

(assert (=> b!372031 (= res!209330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170445 mask!970))))

(assert (=> b!372031 (= lt!170445 (array!21556 (store (arr!10246 _keys!658) i!548 k0!778) (size!10599 _keys!658)))))

(declare-fun b!372032 () Bool)

(declare-fun res!209322 () Bool)

(assert (=> b!372032 (=> (not res!209322) (not e!226943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372032 (= res!209322 (validKeyInArray!0 k0!778))))

(declare-fun b!372033 () Bool)

(declare-fun res!209321 () Bool)

(assert (=> b!372033 (=> (not res!209321) (not e!226943))))

(assert (=> b!372033 (= res!209321 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10599 _keys!658))))))

(declare-fun b!372034 () Bool)

(declare-fun e!226941 () Bool)

(assert (=> b!372034 (= e!226940 (and e!226941 mapRes!14787))))

(declare-fun condMapEmpty!14787 () Bool)

(declare-fun mapDefault!14787 () ValueCell!4064)

(assert (=> b!372034 (= condMapEmpty!14787 (= (arr!10247 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4064)) mapDefault!14787)))))

(declare-fun b!372035 () Bool)

(assert (=> b!372035 (= e!226941 tp_is_empty!8815)))

(declare-fun b!372036 () Bool)

(declare-fun res!209323 () Bool)

(assert (=> b!372036 (=> (not res!209323) (not e!226943))))

(assert (=> b!372036 (= res!209323 (or (= (select (arr!10246 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10246 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372037 () Bool)

(declare-fun res!209328 () Bool)

(assert (=> b!372037 (=> (not res!209328) (not e!226938))))

(assert (=> b!372037 (= res!209328 (arrayNoDuplicates!0 lt!170445 #b00000000000000000000000000000000 Nil!5712))))

(declare-fun mapNonEmpty!14787 () Bool)

(declare-fun tp!29217 () Bool)

(assert (=> mapNonEmpty!14787 (= mapRes!14787 (and tp!29217 e!226939))))

(declare-fun mapValue!14787 () ValueCell!4064)

(declare-fun mapRest!14787 () (Array (_ BitVec 32) ValueCell!4064))

(declare-fun mapKey!14787 () (_ BitVec 32))

(assert (=> mapNonEmpty!14787 (= (arr!10247 _values!506) (store mapRest!14787 mapKey!14787 mapValue!14787))))

(assert (= (and start!37026 res!209327) b!372026))

(assert (= (and b!372026 res!209329) b!372027))

(assert (= (and b!372027 res!209325) b!372029))

(assert (= (and b!372029 res!209326) b!372033))

(assert (= (and b!372033 res!209321) b!372032))

(assert (= (and b!372032 res!209322) b!372036))

(assert (= (and b!372036 res!209323) b!372025))

(assert (= (and b!372025 res!209324) b!372031))

(assert (= (and b!372031 res!209330) b!372037))

(assert (= (and b!372037 res!209328) b!372030))

(assert (= (and b!372034 condMapEmpty!14787) mapIsEmpty!14787))

(assert (= (and b!372034 (not condMapEmpty!14787)) mapNonEmpty!14787))

(get-info :version)

(assert (= (and mapNonEmpty!14787 ((_ is ValueCellFull!4064) mapValue!14787)) b!372028))

(assert (= (and b!372034 ((_ is ValueCellFull!4064) mapDefault!14787)) b!372035))

(assert (= start!37026 b!372034))

(declare-fun m!367451 () Bool)

(assert (=> b!372027 m!367451))

(declare-fun m!367453 () Bool)

(assert (=> b!372025 m!367453))

(declare-fun m!367455 () Bool)

(assert (=> b!372029 m!367455))

(declare-fun m!367457 () Bool)

(assert (=> b!372032 m!367457))

(declare-fun m!367459 () Bool)

(assert (=> b!372036 m!367459))

(declare-fun m!367461 () Bool)

(assert (=> start!37026 m!367461))

(declare-fun m!367463 () Bool)

(assert (=> start!37026 m!367463))

(declare-fun m!367465 () Bool)

(assert (=> start!37026 m!367465))

(declare-fun m!367467 () Bool)

(assert (=> mapNonEmpty!14787 m!367467))

(declare-fun m!367469 () Bool)

(assert (=> b!372031 m!367469))

(declare-fun m!367471 () Bool)

(assert (=> b!372031 m!367471))

(declare-fun m!367473 () Bool)

(assert (=> b!372037 m!367473))

(declare-fun m!367475 () Bool)

(assert (=> b!372030 m!367475))

(declare-fun m!367477 () Bool)

(assert (=> b!372030 m!367477))

(declare-fun m!367479 () Bool)

(assert (=> b!372030 m!367479))

(declare-fun m!367481 () Bool)

(assert (=> b!372030 m!367481))

(declare-fun m!367483 () Bool)

(assert (=> b!372030 m!367483))

(declare-fun m!367485 () Bool)

(assert (=> b!372030 m!367485))

(check-sat (not b!372029) (not mapNonEmpty!14787) (not b!372032) (not b!372027) (not b_next!8167) (not b!372030) (not b!372031) tp_is_empty!8815 (not start!37026) b_and!15383 (not b!372025) (not b!372037))
(check-sat b_and!15383 (not b_next!8167))
