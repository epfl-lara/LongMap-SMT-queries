; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43358 () Bool)

(assert start!43358)

(declare-fun b_free!12199 () Bool)

(declare-fun b_next!12199 () Bool)

(assert (=> start!43358 (= b_free!12199 (not b_next!12199))))

(declare-fun tp!42874 () Bool)

(declare-fun b_and!20965 () Bool)

(assert (=> start!43358 (= tp!42874 b_and!20965)))

(declare-fun b!480434 () Bool)

(declare-fun res!286541 () Bool)

(declare-fun e!282688 () Bool)

(assert (=> b!480434 (=> (not res!286541) (not e!282688))))

(declare-datatypes ((array!31078 0))(
  ( (array!31079 (arr!14943 (Array (_ BitVec 32) (_ BitVec 64))) (size!15301 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31078)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19353 0))(
  ( (V!19354 (val!6903 Int)) )
))
(declare-datatypes ((ValueCell!6494 0))(
  ( (ValueCellFull!6494 (v!9195 V!19353)) (EmptyCell!6494) )
))
(declare-datatypes ((array!31080 0))(
  ( (array!31081 (arr!14944 (Array (_ BitVec 32) ValueCell!6494)) (size!15302 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31080)

(declare-fun mask!2352 () (_ BitVec 32))

(assert (=> b!480434 (= res!286541 (and (= (size!15302 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15301 _keys!1874) (size!15302 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!286540 () Bool)

(assert (=> start!43358 (=> (not res!286540) (not e!282688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43358 (= res!286540 (validMask!0 mask!2352))))

(assert (=> start!43358 e!282688))

(assert (=> start!43358 true))

(declare-fun tp_is_empty!13711 () Bool)

(assert (=> start!43358 tp_is_empty!13711))

(declare-fun e!282690 () Bool)

(declare-fun array_inv!10852 (array!31080) Bool)

(assert (=> start!43358 (and (array_inv!10852 _values!1516) e!282690)))

(assert (=> start!43358 tp!42874))

(declare-fun array_inv!10853 (array!31078) Bool)

(assert (=> start!43358 (array_inv!10853 _keys!1874)))

(declare-fun b!480435 () Bool)

(declare-fun e!282685 () Bool)

(declare-fun mapRes!22270 () Bool)

(assert (=> b!480435 (= e!282690 (and e!282685 mapRes!22270))))

(declare-fun condMapEmpty!22270 () Bool)

(declare-fun mapDefault!22270 () ValueCell!6494)

(assert (=> b!480435 (= condMapEmpty!22270 (= (arr!14944 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6494)) mapDefault!22270)))))

(declare-fun mapNonEmpty!22270 () Bool)

(declare-fun tp!42873 () Bool)

(declare-fun e!282687 () Bool)

(assert (=> mapNonEmpty!22270 (= mapRes!22270 (and tp!42873 e!282687))))

(declare-fun mapRest!22270 () (Array (_ BitVec 32) ValueCell!6494))

(declare-fun mapValue!22270 () ValueCell!6494)

(declare-fun mapKey!22270 () (_ BitVec 32))

(assert (=> mapNonEmpty!22270 (= (arr!14944 _values!1516) (store mapRest!22270 mapKey!22270 mapValue!22270))))

(declare-fun b!480436 () Bool)

(declare-fun res!286544 () Bool)

(assert (=> b!480436 (=> (not res!286544) (not e!282688))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19353)

(declare-fun zeroValue!1458 () V!19353)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8976 0))(
  ( (tuple2!8977 (_1!4499 (_ BitVec 64)) (_2!4499 V!19353)) )
))
(declare-datatypes ((List!9047 0))(
  ( (Nil!9044) (Cons!9043 (h!9899 tuple2!8976) (t!15249 List!9047)) )
))
(declare-datatypes ((ListLongMap!7891 0))(
  ( (ListLongMap!7892 (toList!3961 List!9047)) )
))
(declare-fun contains!2591 (ListLongMap!7891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2275 (array!31078 array!31080 (_ BitVec 32) (_ BitVec 32) V!19353 V!19353 (_ BitVec 32) Int) ListLongMap!7891)

(assert (=> b!480436 (= res!286544 (contains!2591 (getCurrentListMap!2275 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480437 () Bool)

(declare-fun res!286539 () Bool)

(assert (=> b!480437 (=> (not res!286539) (not e!282688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480437 (= res!286539 (validKeyInArray!0 k0!1332))))

(declare-fun b!480438 () Bool)

(declare-fun e!282686 () Bool)

(assert (=> b!480438 (= e!282686 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480439 () Bool)

(declare-fun arrayContainsKey!0 (array!31078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480439 (= e!282686 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480440 () Bool)

(assert (=> b!480440 (= e!282687 tp_is_empty!13711)))

(declare-fun b!480441 () Bool)

(declare-fun res!286542 () Bool)

(assert (=> b!480441 (=> (not res!286542) (not e!282688))))

(declare-datatypes ((List!9048 0))(
  ( (Nil!9045) (Cons!9044 (h!9900 (_ BitVec 64)) (t!15250 List!9048)) )
))
(declare-fun arrayNoDuplicates!0 (array!31078 (_ BitVec 32) List!9048) Bool)

(assert (=> b!480441 (= res!286542 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9045))))

(declare-fun mapIsEmpty!22270 () Bool)

(assert (=> mapIsEmpty!22270 mapRes!22270))

(declare-fun b!480442 () Bool)

(declare-fun res!286543 () Bool)

(assert (=> b!480442 (=> (not res!286543) (not e!282688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31078 (_ BitVec 32)) Bool)

(assert (=> b!480442 (= res!286543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480443 () Bool)

(assert (=> b!480443 (= e!282685 tp_is_empty!13711)))

(declare-fun b!480444 () Bool)

(assert (=> b!480444 (= e!282688 (not true))))

(declare-fun lt!218173 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31078 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480444 (= lt!218173 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480444 e!282686))

(declare-fun c!57757 () Bool)

(assert (=> b!480444 (= c!57757 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14059 0))(
  ( (Unit!14060) )
))
(declare-fun lt!218172 () Unit!14059)

(declare-fun lemmaKeyInListMapIsInArray!123 (array!31078 array!31080 (_ BitVec 32) (_ BitVec 32) V!19353 V!19353 (_ BitVec 64) Int) Unit!14059)

(assert (=> b!480444 (= lt!218172 (lemmaKeyInListMapIsInArray!123 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (= (and start!43358 res!286540) b!480434))

(assert (= (and b!480434 res!286541) b!480442))

(assert (= (and b!480442 res!286543) b!480441))

(assert (= (and b!480441 res!286542) b!480436))

(assert (= (and b!480436 res!286544) b!480437))

(assert (= (and b!480437 res!286539) b!480444))

(assert (= (and b!480444 c!57757) b!480439))

(assert (= (and b!480444 (not c!57757)) b!480438))

(assert (= (and b!480435 condMapEmpty!22270) mapIsEmpty!22270))

(assert (= (and b!480435 (not condMapEmpty!22270)) mapNonEmpty!22270))

(get-info :version)

(assert (= (and mapNonEmpty!22270 ((_ is ValueCellFull!6494) mapValue!22270)) b!480440))

(assert (= (and b!480435 ((_ is ValueCellFull!6494) mapDefault!22270)) b!480443))

(assert (= start!43358 b!480435))

(declare-fun m!462313 () Bool)

(assert (=> b!480444 m!462313))

(declare-fun m!462315 () Bool)

(assert (=> b!480444 m!462315))

(declare-fun m!462317 () Bool)

(assert (=> b!480436 m!462317))

(assert (=> b!480436 m!462317))

(declare-fun m!462319 () Bool)

(assert (=> b!480436 m!462319))

(declare-fun m!462321 () Bool)

(assert (=> b!480441 m!462321))

(declare-fun m!462323 () Bool)

(assert (=> b!480439 m!462323))

(declare-fun m!462325 () Bool)

(assert (=> start!43358 m!462325))

(declare-fun m!462327 () Bool)

(assert (=> start!43358 m!462327))

(declare-fun m!462329 () Bool)

(assert (=> start!43358 m!462329))

(declare-fun m!462331 () Bool)

(assert (=> mapNonEmpty!22270 m!462331))

(declare-fun m!462333 () Bool)

(assert (=> b!480442 m!462333))

(declare-fun m!462335 () Bool)

(assert (=> b!480437 m!462335))

(check-sat (not b!480437) tp_is_empty!13711 (not b!480442) b_and!20965 (not b!480436) (not b!480439) (not b!480441) (not b_next!12199) (not mapNonEmpty!22270) (not b!480444) (not start!43358))
(check-sat b_and!20965 (not b_next!12199))
