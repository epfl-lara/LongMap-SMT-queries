; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43386 () Bool)

(assert start!43386)

(declare-fun b_free!12213 () Bool)

(declare-fun b_next!12213 () Bool)

(assert (=> start!43386 (= b_free!12213 (not b_next!12213))))

(declare-fun tp!42916 () Bool)

(declare-fun b_and!20969 () Bool)

(assert (=> start!43386 (= tp!42916 b_and!20969)))

(declare-fun b!480726 () Bool)

(declare-fun e!282850 () Bool)

(declare-datatypes ((array!31115 0))(
  ( (array!31116 (arr!14962 (Array (_ BitVec 32) (_ BitVec 64))) (size!15320 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31115)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480726 (= e!282850 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480727 () Bool)

(declare-fun res!286677 () Bool)

(declare-fun e!282852 () Bool)

(assert (=> b!480727 (=> (not res!286677) (not e!282852))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19371 0))(
  ( (V!19372 (val!6910 Int)) )
))
(declare-fun minValue!1458 () V!19371)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19371)

(declare-datatypes ((ValueCell!6501 0))(
  ( (ValueCellFull!6501 (v!9201 V!19371)) (EmptyCell!6501) )
))
(declare-datatypes ((array!31117 0))(
  ( (array!31118 (arr!14963 (Array (_ BitVec 32) ValueCell!6501)) (size!15321 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31117)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9068 0))(
  ( (tuple2!9069 (_1!4545 (_ BitVec 64)) (_2!4545 V!19371)) )
))
(declare-datatypes ((List!9145 0))(
  ( (Nil!9142) (Cons!9141 (h!9997 tuple2!9068) (t!15355 List!9145)) )
))
(declare-datatypes ((ListLongMap!7981 0))(
  ( (ListLongMap!7982 (toList!4006 List!9145)) )
))
(declare-fun contains!2618 (ListLongMap!7981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2325 (array!31115 array!31117 (_ BitVec 32) (_ BitVec 32) V!19371 V!19371 (_ BitVec 32) Int) ListLongMap!7981)

(assert (=> b!480727 (= res!286677 (contains!2618 (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22291 () Bool)

(declare-fun mapRes!22291 () Bool)

(assert (=> mapIsEmpty!22291 mapRes!22291))

(declare-fun mapNonEmpty!22291 () Bool)

(declare-fun tp!42915 () Bool)

(declare-fun e!282853 () Bool)

(assert (=> mapNonEmpty!22291 (= mapRes!22291 (and tp!42915 e!282853))))

(declare-fun mapKey!22291 () (_ BitVec 32))

(declare-fun mapRest!22291 () (Array (_ BitVec 32) ValueCell!6501))

(declare-fun mapValue!22291 () ValueCell!6501)

(assert (=> mapNonEmpty!22291 (= (arr!14963 _values!1516) (store mapRest!22291 mapKey!22291 mapValue!22291))))

(declare-fun b!480728 () Bool)

(assert (=> b!480728 (= e!282852 (not true))))

(declare-fun lt!218209 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31115 (_ BitVec 32)) Bool)

(assert (=> b!480728 (arrayForallSeekEntryOrOpenFound!0 lt!218209 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14096 0))(
  ( (Unit!14097) )
))
(declare-fun lt!218208 () Unit!14096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14096)

(assert (=> b!480728 (= lt!218208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218209))))

(declare-fun arrayScanForKey!0 (array!31115 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480728 (= lt!218209 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480728 e!282850))

(declare-fun c!57805 () Bool)

(assert (=> b!480728 (= c!57805 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218207 () Unit!14096)

(declare-fun lemmaKeyInListMapIsInArray!121 (array!31115 array!31117 (_ BitVec 32) (_ BitVec 32) V!19371 V!19371 (_ BitVec 64) Int) Unit!14096)

(assert (=> b!480728 (= lt!218207 (lemmaKeyInListMapIsInArray!121 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480729 () Bool)

(declare-fun tp_is_empty!13725 () Bool)

(assert (=> b!480729 (= e!282853 tp_is_empty!13725)))

(declare-fun b!480730 () Bool)

(declare-fun res!286672 () Bool)

(assert (=> b!480730 (=> (not res!286672) (not e!282852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480730 (= res!286672 (validKeyInArray!0 k0!1332))))

(declare-fun b!480731 () Bool)

(declare-fun res!286675 () Bool)

(assert (=> b!480731 (=> (not res!286675) (not e!282852))))

(assert (=> b!480731 (= res!286675 (and (= (size!15321 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15320 _keys!1874) (size!15321 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480732 () Bool)

(declare-fun res!286674 () Bool)

(assert (=> b!480732 (=> (not res!286674) (not e!282852))))

(assert (=> b!480732 (= res!286674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480733 () Bool)

(declare-fun res!286676 () Bool)

(assert (=> b!480733 (=> (not res!286676) (not e!282852))))

(declare-datatypes ((List!9146 0))(
  ( (Nil!9143) (Cons!9142 (h!9998 (_ BitVec 64)) (t!15356 List!9146)) )
))
(declare-fun arrayNoDuplicates!0 (array!31115 (_ BitVec 32) List!9146) Bool)

(assert (=> b!480733 (= res!286676 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9143))))

(declare-fun res!286673 () Bool)

(assert (=> start!43386 (=> (not res!286673) (not e!282852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43386 (= res!286673 (validMask!0 mask!2352))))

(assert (=> start!43386 e!282852))

(assert (=> start!43386 true))

(assert (=> start!43386 tp_is_empty!13725))

(declare-fun e!282855 () Bool)

(declare-fun array_inv!10790 (array!31117) Bool)

(assert (=> start!43386 (and (array_inv!10790 _values!1516) e!282855)))

(assert (=> start!43386 tp!42916))

(declare-fun array_inv!10791 (array!31115) Bool)

(assert (=> start!43386 (array_inv!10791 _keys!1874)))

(declare-fun b!480734 () Bool)

(assert (=> b!480734 (= e!282850 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480735 () Bool)

(declare-fun e!282854 () Bool)

(assert (=> b!480735 (= e!282854 tp_is_empty!13725)))

(declare-fun b!480736 () Bool)

(assert (=> b!480736 (= e!282855 (and e!282854 mapRes!22291))))

(declare-fun condMapEmpty!22291 () Bool)

(declare-fun mapDefault!22291 () ValueCell!6501)

(assert (=> b!480736 (= condMapEmpty!22291 (= (arr!14963 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6501)) mapDefault!22291)))))

(assert (= (and start!43386 res!286673) b!480731))

(assert (= (and b!480731 res!286675) b!480732))

(assert (= (and b!480732 res!286674) b!480733))

(assert (= (and b!480733 res!286676) b!480727))

(assert (= (and b!480727 res!286677) b!480730))

(assert (= (and b!480730 res!286672) b!480728))

(assert (= (and b!480728 c!57805) b!480726))

(assert (= (and b!480728 (not c!57805)) b!480734))

(assert (= (and b!480736 condMapEmpty!22291) mapIsEmpty!22291))

(assert (= (and b!480736 (not condMapEmpty!22291)) mapNonEmpty!22291))

(get-info :version)

(assert (= (and mapNonEmpty!22291 ((_ is ValueCellFull!6501) mapValue!22291)) b!480729))

(assert (= (and b!480736 ((_ is ValueCellFull!6501) mapDefault!22291)) b!480735))

(assert (= start!43386 b!480736))

(declare-fun m!462303 () Bool)

(assert (=> b!480727 m!462303))

(assert (=> b!480727 m!462303))

(declare-fun m!462305 () Bool)

(assert (=> b!480727 m!462305))

(declare-fun m!462307 () Bool)

(assert (=> b!480728 m!462307))

(declare-fun m!462309 () Bool)

(assert (=> b!480728 m!462309))

(declare-fun m!462311 () Bool)

(assert (=> b!480728 m!462311))

(declare-fun m!462313 () Bool)

(assert (=> b!480728 m!462313))

(declare-fun m!462315 () Bool)

(assert (=> start!43386 m!462315))

(declare-fun m!462317 () Bool)

(assert (=> start!43386 m!462317))

(declare-fun m!462319 () Bool)

(assert (=> start!43386 m!462319))

(declare-fun m!462321 () Bool)

(assert (=> b!480726 m!462321))

(declare-fun m!462323 () Bool)

(assert (=> b!480730 m!462323))

(declare-fun m!462325 () Bool)

(assert (=> b!480732 m!462325))

(declare-fun m!462327 () Bool)

(assert (=> b!480733 m!462327))

(declare-fun m!462329 () Bool)

(assert (=> mapNonEmpty!22291 m!462329))

(check-sat (not b!480730) (not b!480733) tp_is_empty!13725 (not b!480728) (not b!480727) (not start!43386) (not b!480732) (not b!480726) b_and!20969 (not mapNonEmpty!22291) (not b_next!12213))
(check-sat b_and!20969 (not b_next!12213))
