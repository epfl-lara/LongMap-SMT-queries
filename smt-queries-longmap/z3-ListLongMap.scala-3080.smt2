; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43374 () Bool)

(assert start!43374)

(declare-fun b_free!12201 () Bool)

(declare-fun b_next!12201 () Bool)

(assert (=> start!43374 (= b_free!12201 (not b_next!12201))))

(declare-fun tp!42879 () Bool)

(declare-fun b_and!20957 () Bool)

(assert (=> start!43374 (= tp!42879 b_and!20957)))

(declare-fun b!480528 () Bool)

(declare-fun res!286567 () Bool)

(declare-fun e!282744 () Bool)

(assert (=> b!480528 (=> (not res!286567) (not e!282744))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480528 (= res!286567 (validKeyInArray!0 k0!1332))))

(declare-fun b!480529 () Bool)

(declare-fun res!286565 () Bool)

(assert (=> b!480529 (=> (not res!286565) (not e!282744))))

(declare-datatypes ((array!31091 0))(
  ( (array!31092 (arr!14950 (Array (_ BitVec 32) (_ BitVec 64))) (size!15308 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31091)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31091 (_ BitVec 32)) Bool)

(assert (=> b!480529 (= res!286565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480530 () Bool)

(declare-fun res!286566 () Bool)

(assert (=> b!480530 (=> (not res!286566) (not e!282744))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19355 0))(
  ( (V!19356 (val!6904 Int)) )
))
(declare-datatypes ((ValueCell!6495 0))(
  ( (ValueCellFull!6495 (v!9195 V!19355)) (EmptyCell!6495) )
))
(declare-datatypes ((array!31093 0))(
  ( (array!31094 (arr!14951 (Array (_ BitVec 32) ValueCell!6495)) (size!15309 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31093)

(assert (=> b!480530 (= res!286566 (and (= (size!15309 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15308 _keys!1874) (size!15309 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22273 () Bool)

(declare-fun mapRes!22273 () Bool)

(assert (=> mapIsEmpty!22273 mapRes!22273))

(declare-fun b!480531 () Bool)

(declare-fun res!286569 () Bool)

(assert (=> b!480531 (=> (not res!286569) (not e!282744))))

(declare-datatypes ((List!9137 0))(
  ( (Nil!9134) (Cons!9133 (h!9989 (_ BitVec 64)) (t!15347 List!9137)) )
))
(declare-fun arrayNoDuplicates!0 (array!31091 (_ BitVec 32) List!9137) Bool)

(assert (=> b!480531 (= res!286569 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9134))))

(declare-fun res!286568 () Bool)

(assert (=> start!43374 (=> (not res!286568) (not e!282744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43374 (= res!286568 (validMask!0 mask!2352))))

(assert (=> start!43374 e!282744))

(assert (=> start!43374 true))

(declare-fun tp_is_empty!13713 () Bool)

(assert (=> start!43374 tp_is_empty!13713))

(declare-fun e!282745 () Bool)

(declare-fun array_inv!10782 (array!31093) Bool)

(assert (=> start!43374 (and (array_inv!10782 _values!1516) e!282745)))

(assert (=> start!43374 tp!42879))

(declare-fun array_inv!10783 (array!31091) Bool)

(assert (=> start!43374 (array_inv!10783 _keys!1874)))

(declare-fun b!480532 () Bool)

(assert (=> b!480532 (= e!282744 (not true))))

(declare-fun lt!218166 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31091 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480532 (= lt!218166 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!282743 () Bool)

(assert (=> b!480532 e!282743))

(declare-fun c!57787 () Bool)

(assert (=> b!480532 (= c!57787 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14088 0))(
  ( (Unit!14089) )
))
(declare-fun lt!218167 () Unit!14088)

(declare-fun minValue!1458 () V!19355)

(declare-fun zeroValue!1458 () V!19355)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!117 (array!31091 array!31093 (_ BitVec 32) (_ BitVec 32) V!19355 V!19355 (_ BitVec 64) Int) Unit!14088)

(assert (=> b!480532 (= lt!218167 (lemmaKeyInListMapIsInArray!117 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22273 () Bool)

(declare-fun tp!42880 () Bool)

(declare-fun e!282747 () Bool)

(assert (=> mapNonEmpty!22273 (= mapRes!22273 (and tp!42880 e!282747))))

(declare-fun mapValue!22273 () ValueCell!6495)

(declare-fun mapKey!22273 () (_ BitVec 32))

(declare-fun mapRest!22273 () (Array (_ BitVec 32) ValueCell!6495))

(assert (=> mapNonEmpty!22273 (= (arr!14951 _values!1516) (store mapRest!22273 mapKey!22273 mapValue!22273))))

(declare-fun b!480533 () Bool)

(assert (=> b!480533 (= e!282743 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480534 () Bool)

(assert (=> b!480534 (= e!282747 tp_is_empty!13713)))

(declare-fun b!480535 () Bool)

(declare-fun arrayContainsKey!0 (array!31091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480535 (= e!282743 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480536 () Bool)

(declare-fun res!286564 () Bool)

(assert (=> b!480536 (=> (not res!286564) (not e!282744))))

(declare-datatypes ((tuple2!9060 0))(
  ( (tuple2!9061 (_1!4541 (_ BitVec 64)) (_2!4541 V!19355)) )
))
(declare-datatypes ((List!9138 0))(
  ( (Nil!9135) (Cons!9134 (h!9990 tuple2!9060) (t!15348 List!9138)) )
))
(declare-datatypes ((ListLongMap!7973 0))(
  ( (ListLongMap!7974 (toList!4002 List!9138)) )
))
(declare-fun contains!2614 (ListLongMap!7973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2321 (array!31091 array!31093 (_ BitVec 32) (_ BitVec 32) V!19355 V!19355 (_ BitVec 32) Int) ListLongMap!7973)

(assert (=> b!480536 (= res!286564 (contains!2614 (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480537 () Bool)

(declare-fun e!282742 () Bool)

(assert (=> b!480537 (= e!282745 (and e!282742 mapRes!22273))))

(declare-fun condMapEmpty!22273 () Bool)

(declare-fun mapDefault!22273 () ValueCell!6495)

(assert (=> b!480537 (= condMapEmpty!22273 (= (arr!14951 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6495)) mapDefault!22273)))))

(declare-fun b!480538 () Bool)

(assert (=> b!480538 (= e!282742 tp_is_empty!13713)))

(assert (= (and start!43374 res!286568) b!480530))

(assert (= (and b!480530 res!286566) b!480529))

(assert (= (and b!480529 res!286565) b!480531))

(assert (= (and b!480531 res!286569) b!480536))

(assert (= (and b!480536 res!286564) b!480528))

(assert (= (and b!480528 res!286567) b!480532))

(assert (= (and b!480532 c!57787) b!480535))

(assert (= (and b!480532 (not c!57787)) b!480533))

(assert (= (and b!480537 condMapEmpty!22273) mapIsEmpty!22273))

(assert (= (and b!480537 (not condMapEmpty!22273)) mapNonEmpty!22273))

(get-info :version)

(assert (= (and mapNonEmpty!22273 ((_ is ValueCellFull!6495) mapValue!22273)) b!480534))

(assert (= (and b!480537 ((_ is ValueCellFull!6495) mapDefault!22273)) b!480538))

(assert (= start!43374 b!480537))

(declare-fun m!462155 () Bool)

(assert (=> b!480532 m!462155))

(declare-fun m!462157 () Bool)

(assert (=> b!480532 m!462157))

(declare-fun m!462159 () Bool)

(assert (=> start!43374 m!462159))

(declare-fun m!462161 () Bool)

(assert (=> start!43374 m!462161))

(declare-fun m!462163 () Bool)

(assert (=> start!43374 m!462163))

(declare-fun m!462165 () Bool)

(assert (=> b!480528 m!462165))

(declare-fun m!462167 () Bool)

(assert (=> mapNonEmpty!22273 m!462167))

(declare-fun m!462169 () Bool)

(assert (=> b!480535 m!462169))

(declare-fun m!462171 () Bool)

(assert (=> b!480529 m!462171))

(declare-fun m!462173 () Bool)

(assert (=> b!480536 m!462173))

(assert (=> b!480536 m!462173))

(declare-fun m!462175 () Bool)

(assert (=> b!480536 m!462175))

(declare-fun m!462177 () Bool)

(assert (=> b!480531 m!462177))

(check-sat b_and!20957 (not start!43374) (not b!480528) (not b!480531) tp_is_empty!13713 (not b!480536) (not b!480535) (not b!480532) (not b!480529) (not b_next!12201) (not mapNonEmpty!22273))
(check-sat b_and!20957 (not b_next!12201))
