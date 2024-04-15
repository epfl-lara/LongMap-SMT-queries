; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!788 () Bool)

(assert start!788)

(declare-fun b_free!181 () Bool)

(declare-fun b_next!181 () Bool)

(assert (=> start!788 (= b_free!181 (not b_next!181))))

(declare-fun tp!772 () Bool)

(declare-fun b_and!327 () Bool)

(assert (=> start!788 (= tp!772 b_and!327)))

(declare-fun res!6396 () Bool)

(declare-fun e!3116 () Bool)

(assert (=> start!788 (=> (not res!6396) (not e!3116))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!788 (= res!6396 (validMask!0 mask!2250))))

(assert (=> start!788 e!3116))

(assert (=> start!788 tp!772))

(assert (=> start!788 true))

(declare-datatypes ((V!523 0))(
  ( (V!524 (val!135 Int)) )
))
(declare-datatypes ((ValueCell!113 0))(
  ( (ValueCellFull!113 (v!1226 V!523)) (EmptyCell!113) )
))
(declare-datatypes ((array!445 0))(
  ( (array!446 (arr!211 (Array (_ BitVec 32) ValueCell!113)) (size!273 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!445)

(declare-fun e!3114 () Bool)

(declare-fun array_inv!147 (array!445) Bool)

(assert (=> start!788 (and (array_inv!147 _values!1492) e!3114)))

(declare-fun tp_is_empty!259 () Bool)

(assert (=> start!788 tp_is_empty!259))

(declare-datatypes ((array!447 0))(
  ( (array!448 (arr!212 (Array (_ BitVec 32) (_ BitVec 64))) (size!274 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!447)

(declare-fun array_inv!148 (array!447) Bool)

(assert (=> start!788 (array_inv!148 _keys!1806)))

(declare-fun b!5724 () Bool)

(declare-fun res!6397 () Bool)

(assert (=> b!5724 (=> (not res!6397) (not e!3116))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!523)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!523)

(declare-datatypes ((tuple2!128 0))(
  ( (tuple2!129 (_1!64 (_ BitVec 64)) (_2!64 V!523)) )
))
(declare-datatypes ((List!137 0))(
  ( (Nil!134) (Cons!133 (h!699 tuple2!128) (t!2272 List!137)) )
))
(declare-datatypes ((ListLongMap!133 0))(
  ( (ListLongMap!134 (toList!82 List!137)) )
))
(declare-fun contains!56 (ListLongMap!133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!41 (array!447 array!445 (_ BitVec 32) (_ BitVec 32) V!523 V!523 (_ BitVec 32) Int) ListLongMap!133)

(assert (=> b!5724 (= res!6397 (contains!56 (getCurrentListMap!41 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5725 () Bool)

(declare-fun res!6391 () Bool)

(assert (=> b!5725 (=> (not res!6391) (not e!3116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!447 (_ BitVec 32)) Bool)

(assert (=> b!5725 (= res!6391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5726 () Bool)

(declare-fun res!6392 () Bool)

(assert (=> b!5726 (=> (not res!6392) (not e!3116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5726 (= res!6392 (validKeyInArray!0 k0!1278))))

(declare-fun b!5727 () Bool)

(declare-fun e!3112 () Bool)

(declare-fun arrayContainsKey!0 (array!447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5727 (= e!3112 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5728 () Bool)

(declare-fun e!3113 () Bool)

(assert (=> b!5728 (= e!3113 tp_is_empty!259)))

(declare-fun b!5729 () Bool)

(declare-fun res!6393 () Bool)

(assert (=> b!5729 (=> (not res!6393) (not e!3116))))

(assert (=> b!5729 (= res!6393 (and (= (size!273 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!274 _keys!1806) (size!273 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5730 () Bool)

(declare-fun e!3115 () Bool)

(assert (=> b!5730 (= e!3115 true)))

(declare-fun lt!1043 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!447 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5730 (= lt!1043 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5731 () Bool)

(declare-fun res!6394 () Bool)

(assert (=> b!5731 (=> (not res!6394) (not e!3116))))

(declare-datatypes ((List!138 0))(
  ( (Nil!135) (Cons!134 (h!700 (_ BitVec 64)) (t!2273 List!138)) )
))
(declare-fun arrayNoDuplicates!0 (array!447 (_ BitVec 32) List!138) Bool)

(assert (=> b!5731 (= res!6394 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!135))))

(declare-fun mapIsEmpty!359 () Bool)

(declare-fun mapRes!359 () Bool)

(assert (=> mapIsEmpty!359 mapRes!359))

(declare-fun b!5732 () Bool)

(assert (=> b!5732 (= e!3112 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5733 () Bool)

(declare-fun e!3111 () Bool)

(assert (=> b!5733 (= e!3114 (and e!3111 mapRes!359))))

(declare-fun condMapEmpty!359 () Bool)

(declare-fun mapDefault!359 () ValueCell!113)

(assert (=> b!5733 (= condMapEmpty!359 (= (arr!211 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!113)) mapDefault!359)))))

(declare-fun mapNonEmpty!359 () Bool)

(declare-fun tp!773 () Bool)

(assert (=> mapNonEmpty!359 (= mapRes!359 (and tp!773 e!3113))))

(declare-fun mapRest!359 () (Array (_ BitVec 32) ValueCell!113))

(declare-fun mapKey!359 () (_ BitVec 32))

(declare-fun mapValue!359 () ValueCell!113)

(assert (=> mapNonEmpty!359 (= (arr!211 _values!1492) (store mapRest!359 mapKey!359 mapValue!359))))

(declare-fun b!5734 () Bool)

(assert (=> b!5734 (= e!3111 tp_is_empty!259)))

(declare-fun b!5735 () Bool)

(assert (=> b!5735 (= e!3116 (not e!3115))))

(declare-fun res!6395 () Bool)

(assert (=> b!5735 (=> res!6395 e!3115)))

(assert (=> b!5735 (= res!6395 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5735 e!3112))

(declare-fun c!404 () Bool)

(assert (=> b!5735 (= c!404 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!79 0))(
  ( (Unit!80) )
))
(declare-fun lt!1044 () Unit!79)

(declare-fun lemmaKeyInListMapIsInArray!25 (array!447 array!445 (_ BitVec 32) (_ BitVec 32) V!523 V!523 (_ BitVec 64) Int) Unit!79)

(assert (=> b!5735 (= lt!1044 (lemmaKeyInListMapIsInArray!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (= (and start!788 res!6396) b!5729))

(assert (= (and b!5729 res!6393) b!5725))

(assert (= (and b!5725 res!6391) b!5731))

(assert (= (and b!5731 res!6394) b!5724))

(assert (= (and b!5724 res!6397) b!5726))

(assert (= (and b!5726 res!6392) b!5735))

(assert (= (and b!5735 c!404) b!5727))

(assert (= (and b!5735 (not c!404)) b!5732))

(assert (= (and b!5735 (not res!6395)) b!5730))

(assert (= (and b!5733 condMapEmpty!359) mapIsEmpty!359))

(assert (= (and b!5733 (not condMapEmpty!359)) mapNonEmpty!359))

(get-info :version)

(assert (= (and mapNonEmpty!359 ((_ is ValueCellFull!113) mapValue!359)) b!5728))

(assert (= (and b!5733 ((_ is ValueCellFull!113) mapDefault!359)) b!5734))

(assert (= start!788 b!5733))

(declare-fun m!3209 () Bool)

(assert (=> start!788 m!3209))

(declare-fun m!3211 () Bool)

(assert (=> start!788 m!3211))

(declare-fun m!3213 () Bool)

(assert (=> start!788 m!3213))

(declare-fun m!3215 () Bool)

(assert (=> b!5724 m!3215))

(assert (=> b!5724 m!3215))

(declare-fun m!3217 () Bool)

(assert (=> b!5724 m!3217))

(declare-fun m!3219 () Bool)

(assert (=> b!5730 m!3219))

(declare-fun m!3221 () Bool)

(assert (=> mapNonEmpty!359 m!3221))

(declare-fun m!3223 () Bool)

(assert (=> b!5731 m!3223))

(declare-fun m!3225 () Bool)

(assert (=> b!5726 m!3225))

(declare-fun m!3227 () Bool)

(assert (=> b!5725 m!3227))

(declare-fun m!3229 () Bool)

(assert (=> b!5735 m!3229))

(declare-fun m!3231 () Bool)

(assert (=> b!5735 m!3231))

(assert (=> b!5727 m!3229))

(check-sat (not b!5726) (not start!788) (not mapNonEmpty!359) tp_is_empty!259 (not b!5730) (not b!5725) (not b_next!181) (not b!5724) b_and!327 (not b!5735) (not b!5727) (not b!5731))
(check-sat b_and!327 (not b_next!181))
