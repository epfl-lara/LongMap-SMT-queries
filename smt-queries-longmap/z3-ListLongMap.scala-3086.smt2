; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43458 () Bool)

(assert start!43458)

(declare-fun b_free!12237 () Bool)

(declare-fun b_next!12237 () Bool)

(assert (=> start!43458 (= b_free!12237 (not b_next!12237))))

(declare-fun tp!42993 () Bool)

(declare-fun b_and!20997 () Bool)

(assert (=> start!43458 (= tp!42993 b_and!20997)))

(declare-fun b!481385 () Bool)

(declare-fun res!286997 () Bool)

(declare-fun e!283243 () Bool)

(assert (=> b!481385 (=> (not res!286997) (not e!283243))))

(declare-datatypes ((array!31161 0))(
  ( (array!31162 (arr!14983 (Array (_ BitVec 32) (_ BitVec 64))) (size!15341 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31161)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31161 (_ BitVec 32)) Bool)

(assert (=> b!481385 (= res!286997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481386 () Bool)

(declare-fun res!286998 () Bool)

(assert (=> b!481386 (=> (not res!286998) (not e!283243))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481386 (= res!286998 (validKeyInArray!0 k0!1332))))

(declare-fun b!481387 () Bool)

(declare-fun res!286995 () Bool)

(assert (=> b!481387 (=> (not res!286995) (not e!283243))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19403 0))(
  ( (V!19404 (val!6922 Int)) )
))
(declare-datatypes ((ValueCell!6513 0))(
  ( (ValueCellFull!6513 (v!9215 V!19403)) (EmptyCell!6513) )
))
(declare-datatypes ((array!31163 0))(
  ( (array!31164 (arr!14984 (Array (_ BitVec 32) ValueCell!6513)) (size!15342 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31163)

(assert (=> b!481387 (= res!286995 (and (= (size!15342 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15341 _keys!1874) (size!15342 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22333 () Bool)

(declare-fun mapRes!22333 () Bool)

(assert (=> mapIsEmpty!22333 mapRes!22333))

(declare-fun b!481388 () Bool)

(declare-fun e!283242 () Bool)

(declare-fun tp_is_empty!13749 () Bool)

(assert (=> b!481388 (= e!283242 tp_is_empty!13749)))

(declare-fun mapNonEmpty!22333 () Bool)

(declare-fun tp!42994 () Bool)

(declare-fun e!283241 () Bool)

(assert (=> mapNonEmpty!22333 (= mapRes!22333 (and tp!42994 e!283241))))

(declare-fun mapKey!22333 () (_ BitVec 32))

(declare-fun mapRest!22333 () (Array (_ BitVec 32) ValueCell!6513))

(declare-fun mapValue!22333 () ValueCell!6513)

(assert (=> mapNonEmpty!22333 (= (arr!14984 _values!1516) (store mapRest!22333 mapKey!22333 mapValue!22333))))

(declare-fun b!481389 () Bool)

(assert (=> b!481389 (= e!283241 tp_is_empty!13749)))

(declare-fun b!481390 () Bool)

(declare-fun e!283245 () Bool)

(declare-fun arrayContainsKey!0 (array!31161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481390 (= e!283245 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun res!286994 () Bool)

(assert (=> start!43458 (=> (not res!286994) (not e!283243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43458 (= res!286994 (validMask!0 mask!2352))))

(assert (=> start!43458 e!283243))

(assert (=> start!43458 true))

(assert (=> start!43458 tp_is_empty!13749))

(declare-fun e!283244 () Bool)

(declare-fun array_inv!10806 (array!31163) Bool)

(assert (=> start!43458 (and (array_inv!10806 _values!1516) e!283244)))

(assert (=> start!43458 tp!42993))

(declare-fun array_inv!10807 (array!31161) Bool)

(assert (=> start!43458 (array_inv!10807 _keys!1874)))

(declare-fun b!481384 () Bool)

(declare-fun res!286999 () Bool)

(assert (=> b!481384 (=> (not res!286999) (not e!283243))))

(declare-fun minValue!1458 () V!19403)

(declare-fun zeroValue!1458 () V!19403)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9082 0))(
  ( (tuple2!9083 (_1!4552 (_ BitVec 64)) (_2!4552 V!19403)) )
))
(declare-datatypes ((List!9160 0))(
  ( (Nil!9157) (Cons!9156 (h!10012 tuple2!9082) (t!15374 List!9160)) )
))
(declare-datatypes ((ListLongMap!7995 0))(
  ( (ListLongMap!7996 (toList!4013 List!9160)) )
))
(declare-fun contains!2627 (ListLongMap!7995 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2332 (array!31161 array!31163 (_ BitVec 32) (_ BitVec 32) V!19403 V!19403 (_ BitVec 32) Int) ListLongMap!7995)

(assert (=> b!481384 (= res!286999 (contains!2627 (getCurrentListMap!2332 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481391 () Bool)

(declare-fun res!286996 () Bool)

(assert (=> b!481391 (=> (not res!286996) (not e!283243))))

(declare-datatypes ((List!9161 0))(
  ( (Nil!9158) (Cons!9157 (h!10013 (_ BitVec 64)) (t!15375 List!9161)) )
))
(declare-fun arrayNoDuplicates!0 (array!31161 (_ BitVec 32) List!9161) Bool)

(assert (=> b!481391 (= res!286996 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9158))))

(declare-fun b!481392 () Bool)

(assert (=> b!481392 (= e!283244 (and e!283242 mapRes!22333))))

(declare-fun condMapEmpty!22333 () Bool)

(declare-fun mapDefault!22333 () ValueCell!6513)

(assert (=> b!481392 (= condMapEmpty!22333 (= (arr!14984 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6513)) mapDefault!22333)))))

(declare-fun b!481393 () Bool)

(assert (=> b!481393 (= e!283245 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481394 () Bool)

(assert (=> b!481394 (= e!283243 (not true))))

(declare-fun lt!218514 () (_ BitVec 32))

(assert (=> b!481394 (arrayForallSeekEntryOrOpenFound!0 lt!218514 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14118 0))(
  ( (Unit!14119) )
))
(declare-fun lt!218513 () Unit!14118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14118)

(assert (=> b!481394 (= lt!218513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218514))))

(declare-fun arrayScanForKey!0 (array!31161 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481394 (= lt!218514 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481394 e!283245))

(declare-fun c!57909 () Bool)

(assert (=> b!481394 (= c!57909 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218515 () Unit!14118)

(declare-fun lemmaKeyInListMapIsInArray!130 (array!31161 array!31163 (_ BitVec 32) (_ BitVec 32) V!19403 V!19403 (_ BitVec 64) Int) Unit!14118)

(assert (=> b!481394 (= lt!218515 (lemmaKeyInListMapIsInArray!130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (= (and start!43458 res!286994) b!481387))

(assert (= (and b!481387 res!286995) b!481385))

(assert (= (and b!481385 res!286997) b!481391))

(assert (= (and b!481391 res!286996) b!481384))

(assert (= (and b!481384 res!286999) b!481386))

(assert (= (and b!481386 res!286998) b!481394))

(assert (= (and b!481394 c!57909) b!481390))

(assert (= (and b!481394 (not c!57909)) b!481393))

(assert (= (and b!481392 condMapEmpty!22333) mapIsEmpty!22333))

(assert (= (and b!481392 (not condMapEmpty!22333)) mapNonEmpty!22333))

(get-info :version)

(assert (= (and mapNonEmpty!22333 ((_ is ValueCellFull!6513) mapValue!22333)) b!481389))

(assert (= (and b!481392 ((_ is ValueCellFull!6513) mapDefault!22333)) b!481388))

(assert (= start!43458 b!481392))

(declare-fun m!462843 () Bool)

(assert (=> mapNonEmpty!22333 m!462843))

(declare-fun m!462845 () Bool)

(assert (=> b!481391 m!462845))

(declare-fun m!462847 () Bool)

(assert (=> b!481385 m!462847))

(declare-fun m!462849 () Bool)

(assert (=> b!481390 m!462849))

(declare-fun m!462851 () Bool)

(assert (=> b!481394 m!462851))

(declare-fun m!462853 () Bool)

(assert (=> b!481394 m!462853))

(declare-fun m!462855 () Bool)

(assert (=> b!481394 m!462855))

(declare-fun m!462857 () Bool)

(assert (=> b!481394 m!462857))

(declare-fun m!462859 () Bool)

(assert (=> start!43458 m!462859))

(declare-fun m!462861 () Bool)

(assert (=> start!43458 m!462861))

(declare-fun m!462863 () Bool)

(assert (=> start!43458 m!462863))

(declare-fun m!462865 () Bool)

(assert (=> b!481386 m!462865))

(declare-fun m!462867 () Bool)

(assert (=> b!481384 m!462867))

(assert (=> b!481384 m!462867))

(declare-fun m!462869 () Bool)

(assert (=> b!481384 m!462869))

(check-sat (not b!481384) (not b!481391) (not b_next!12237) (not mapNonEmpty!22333) (not b!481390) (not b!481385) (not start!43458) b_and!20997 tp_is_empty!13749 (not b!481386) (not b!481394))
(check-sat b_and!20997 (not b_next!12237))
