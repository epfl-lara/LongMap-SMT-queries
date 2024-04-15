; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43448 () Bool)

(assert start!43448)

(declare-fun b_free!12241 () Bool)

(declare-fun b_next!12241 () Bool)

(assert (=> start!43448 (= b_free!12241 (not b_next!12241))))

(declare-fun tp!43005 () Bool)

(declare-fun b_and!20975 () Bool)

(assert (=> start!43448 (= tp!43005 b_and!20975)))

(declare-fun b!481179 () Bool)

(declare-fun res!286903 () Bool)

(declare-fun e!283107 () Bool)

(assert (=> b!481179 (=> (not res!286903) (not e!283107))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481179 (= res!286903 (validKeyInArray!0 k0!1332))))

(declare-fun mapIsEmpty!22339 () Bool)

(declare-fun mapRes!22339 () Bool)

(assert (=> mapIsEmpty!22339 mapRes!22339))

(declare-fun b!481180 () Bool)

(declare-fun res!286905 () Bool)

(assert (=> b!481180 (=> (not res!286905) (not e!283107))))

(declare-datatypes ((array!31169 0))(
  ( (array!31170 (arr!14987 (Array (_ BitVec 32) (_ BitVec 64))) (size!15346 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31169)

(declare-datatypes ((List!9200 0))(
  ( (Nil!9197) (Cons!9196 (h!10052 (_ BitVec 64)) (t!15405 List!9200)) )
))
(declare-fun arrayNoDuplicates!0 (array!31169 (_ BitVec 32) List!9200) Bool)

(assert (=> b!481180 (= res!286905 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9197))))

(declare-fun b!481181 () Bool)

(assert (=> b!481181 (= e!283107 (not true))))

(declare-fun lt!218299 () (_ BitVec 32))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31169 (_ BitVec 32)) Bool)

(assert (=> b!481181 (arrayForallSeekEntryOrOpenFound!0 lt!218299 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14104 0))(
  ( (Unit!14105) )
))
(declare-fun lt!218298 () Unit!14104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14104)

(assert (=> b!481181 (= lt!218298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218299))))

(declare-fun arrayScanForKey!0 (array!31169 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481181 (= lt!218299 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283106 () Bool)

(assert (=> b!481181 e!283106))

(declare-fun c!57844 () Bool)

(assert (=> b!481181 (= c!57844 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218297 () Unit!14104)

(declare-datatypes ((V!19409 0))(
  ( (V!19410 (val!6924 Int)) )
))
(declare-fun minValue!1458 () V!19409)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19409)

(declare-datatypes ((ValueCell!6515 0))(
  ( (ValueCellFull!6515 (v!9211 V!19409)) (EmptyCell!6515) )
))
(declare-datatypes ((array!31171 0))(
  ( (array!31172 (arr!14988 (Array (_ BitVec 32) ValueCell!6515)) (size!15347 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31171)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!139 (array!31169 array!31171 (_ BitVec 32) (_ BitVec 32) V!19409 V!19409 (_ BitVec 64) Int) Unit!14104)

(assert (=> b!481181 (= lt!218297 (lemmaKeyInListMapIsInArray!139 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481182 () Bool)

(declare-fun res!286906 () Bool)

(assert (=> b!481182 (=> (not res!286906) (not e!283107))))

(assert (=> b!481182 (= res!286906 (and (= (size!15347 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15346 _keys!1874) (size!15347 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22339 () Bool)

(declare-fun tp!43006 () Bool)

(declare-fun e!283105 () Bool)

(assert (=> mapNonEmpty!22339 (= mapRes!22339 (and tp!43006 e!283105))))

(declare-fun mapKey!22339 () (_ BitVec 32))

(declare-fun mapValue!22339 () ValueCell!6515)

(declare-fun mapRest!22339 () (Array (_ BitVec 32) ValueCell!6515))

(assert (=> mapNonEmpty!22339 (= (arr!14988 _values!1516) (store mapRest!22339 mapKey!22339 mapValue!22339))))

(declare-fun b!481183 () Bool)

(declare-fun e!283102 () Bool)

(declare-fun tp_is_empty!13753 () Bool)

(assert (=> b!481183 (= e!283102 tp_is_empty!13753)))

(declare-fun b!481184 () Bool)

(assert (=> b!481184 (= e!283106 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481185 () Bool)

(declare-fun res!286902 () Bool)

(assert (=> b!481185 (=> (not res!286902) (not e!283107))))

(assert (=> b!481185 (= res!286902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481186 () Bool)

(declare-fun res!286904 () Bool)

(assert (=> b!481186 (=> (not res!286904) (not e!283107))))

(declare-datatypes ((tuple2!9136 0))(
  ( (tuple2!9137 (_1!4579 (_ BitVec 64)) (_2!4579 V!19409)) )
))
(declare-datatypes ((List!9201 0))(
  ( (Nil!9198) (Cons!9197 (h!10053 tuple2!9136) (t!15406 List!9201)) )
))
(declare-datatypes ((ListLongMap!8039 0))(
  ( (ListLongMap!8040 (toList!4035 List!9201)) )
))
(declare-fun contains!2614 (ListLongMap!8039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2288 (array!31169 array!31171 (_ BitVec 32) (_ BitVec 32) V!19409 V!19409 (_ BitVec 32) Int) ListLongMap!8039)

(assert (=> b!481186 (= res!286904 (contains!2614 (getCurrentListMap!2288 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481187 () Bool)

(declare-fun e!283103 () Bool)

(assert (=> b!481187 (= e!283103 (and e!283102 mapRes!22339))))

(declare-fun condMapEmpty!22339 () Bool)

(declare-fun mapDefault!22339 () ValueCell!6515)

(assert (=> b!481187 (= condMapEmpty!22339 (= (arr!14988 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6515)) mapDefault!22339)))))

(declare-fun res!286901 () Bool)

(assert (=> start!43448 (=> (not res!286901) (not e!283107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43448 (= res!286901 (validMask!0 mask!2352))))

(assert (=> start!43448 e!283107))

(assert (=> start!43448 true))

(assert (=> start!43448 tp_is_empty!13753))

(declare-fun array_inv!10900 (array!31171) Bool)

(assert (=> start!43448 (and (array_inv!10900 _values!1516) e!283103)))

(assert (=> start!43448 tp!43005))

(declare-fun array_inv!10901 (array!31169) Bool)

(assert (=> start!43448 (array_inv!10901 _keys!1874)))

(declare-fun b!481188 () Bool)

(assert (=> b!481188 (= e!283105 tp_is_empty!13753)))

(declare-fun b!481189 () Bool)

(declare-fun arrayContainsKey!0 (array!31169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481189 (= e!283106 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (= (and start!43448 res!286901) b!481182))

(assert (= (and b!481182 res!286906) b!481185))

(assert (= (and b!481185 res!286902) b!481180))

(assert (= (and b!481180 res!286905) b!481186))

(assert (= (and b!481186 res!286904) b!481179))

(assert (= (and b!481179 res!286903) b!481181))

(assert (= (and b!481181 c!57844) b!481189))

(assert (= (and b!481181 (not c!57844)) b!481184))

(assert (= (and b!481187 condMapEmpty!22339) mapIsEmpty!22339))

(assert (= (and b!481187 (not condMapEmpty!22339)) mapNonEmpty!22339))

(get-info :version)

(assert (= (and mapNonEmpty!22339 ((_ is ValueCellFull!6515) mapValue!22339)) b!481188))

(assert (= (and b!481187 ((_ is ValueCellFull!6515) mapDefault!22339)) b!481183))

(assert (= start!43448 b!481187))

(declare-fun m!462165 () Bool)

(assert (=> b!481180 m!462165))

(declare-fun m!462167 () Bool)

(assert (=> mapNonEmpty!22339 m!462167))

(declare-fun m!462169 () Bool)

(assert (=> start!43448 m!462169))

(declare-fun m!462171 () Bool)

(assert (=> start!43448 m!462171))

(declare-fun m!462173 () Bool)

(assert (=> start!43448 m!462173))

(declare-fun m!462175 () Bool)

(assert (=> b!481186 m!462175))

(assert (=> b!481186 m!462175))

(declare-fun m!462177 () Bool)

(assert (=> b!481186 m!462177))

(declare-fun m!462179 () Bool)

(assert (=> b!481181 m!462179))

(declare-fun m!462181 () Bool)

(assert (=> b!481181 m!462181))

(declare-fun m!462183 () Bool)

(assert (=> b!481181 m!462183))

(declare-fun m!462185 () Bool)

(assert (=> b!481181 m!462185))

(declare-fun m!462187 () Bool)

(assert (=> b!481185 m!462187))

(declare-fun m!462189 () Bool)

(assert (=> b!481179 m!462189))

(declare-fun m!462191 () Bool)

(assert (=> b!481189 m!462191))

(check-sat (not b!481180) (not start!43448) (not b!481189) (not b!481179) b_and!20975 (not b!481181) (not b_next!12241) (not b!481186) (not mapNonEmpty!22339) tp_is_empty!13753 (not b!481185))
(check-sat b_and!20975 (not b_next!12241))
