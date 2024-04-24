; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113290 () Bool)

(assert start!113290)

(declare-fun b_free!31117 () Bool)

(declare-fun b_next!31117 () Bool)

(assert (=> start!113290 (= b_free!31117 (not b_next!31117))))

(declare-fun tp!109156 () Bool)

(declare-fun b_and!50149 () Bool)

(assert (=> start!113290 (= tp!109156 b_and!50149)))

(declare-fun mapNonEmpty!57382 () Bool)

(declare-fun mapRes!57382 () Bool)

(declare-fun tp!109155 () Bool)

(declare-fun e!764201 () Bool)

(assert (=> mapNonEmpty!57382 (= mapRes!57382 (and tp!109155 e!764201))))

(declare-datatypes ((V!54593 0))(
  ( (V!54594 (val!18633 Int)) )
))
(declare-datatypes ((ValueCell!17660 0))(
  ( (ValueCellFull!17660 (v!21276 V!54593)) (EmptyCell!17660) )
))
(declare-fun mapRest!57382 () (Array (_ BitVec 32) ValueCell!17660))

(declare-fun mapValue!57382 () ValueCell!17660)

(declare-datatypes ((array!91209 0))(
  ( (array!91210 (arr!44056 (Array (_ BitVec 32) ValueCell!17660)) (size!44607 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91209)

(declare-fun mapKey!57382 () (_ BitVec 32))

(assert (=> mapNonEmpty!57382 (= (arr!44056 _values!1303) (store mapRest!57382 mapKey!57382 mapValue!57382))))

(declare-fun b!1341429 () Bool)

(declare-fun res!889506 () Bool)

(declare-fun e!764197 () Bool)

(assert (=> b!1341429 (=> (not res!889506) (not e!764197))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91211 0))(
  ( (array!91212 (arr!44057 (Array (_ BitVec 32) (_ BitVec 64))) (size!44608 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91211)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341429 (= res!889506 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44608 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57382 () Bool)

(assert (=> mapIsEmpty!57382 mapRes!57382))

(declare-fun b!1341430 () Bool)

(declare-fun e!764200 () Bool)

(declare-fun tp_is_empty!37117 () Bool)

(assert (=> b!1341430 (= e!764200 tp_is_empty!37117)))

(declare-fun b!1341431 () Bool)

(assert (=> b!1341431 (= e!764201 tp_is_empty!37117)))

(declare-fun b!1341433 () Bool)

(declare-fun res!889508 () Bool)

(assert (=> b!1341433 (=> (not res!889508) (not e!764197))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91211 (_ BitVec 32)) Bool)

(assert (=> b!1341433 (= res!889508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341434 () Bool)

(declare-fun res!889507 () Bool)

(assert (=> b!1341434 (=> (not res!889507) (not e!764197))))

(assert (=> b!1341434 (= res!889507 (not (= (select (arr!44057 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341435 () Bool)

(assert (=> b!1341435 (= e!764197 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun b!1341436 () Bool)

(declare-fun res!889502 () Bool)

(assert (=> b!1341436 (=> (not res!889502) (not e!764197))))

(declare-datatypes ((List!31196 0))(
  ( (Nil!31193) (Cons!31192 (h!32410 (_ BitVec 64)) (t!45520 List!31196)) )
))
(declare-fun arrayNoDuplicates!0 (array!91211 (_ BitVec 32) List!31196) Bool)

(assert (=> b!1341436 (= res!889502 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31193))))

(declare-fun b!1341437 () Bool)

(declare-fun res!889503 () Bool)

(assert (=> b!1341437 (=> (not res!889503) (not e!764197))))

(declare-fun minValue!1245 () V!54593)

(declare-fun zeroValue!1245 () V!54593)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24038 0))(
  ( (tuple2!24039 (_1!12030 (_ BitVec 64)) (_2!12030 V!54593)) )
))
(declare-datatypes ((List!31197 0))(
  ( (Nil!31194) (Cons!31193 (h!32411 tuple2!24038) (t!45521 List!31197)) )
))
(declare-datatypes ((ListLongMap!21703 0))(
  ( (ListLongMap!21704 (toList!10867 List!31197)) )
))
(declare-fun contains!9055 (ListLongMap!21703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5820 (array!91211 array!91209 (_ BitVec 32) (_ BitVec 32) V!54593 V!54593 (_ BitVec 32) Int) ListLongMap!21703)

(assert (=> b!1341437 (= res!889503 (contains!9055 (getCurrentListMap!5820 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341432 () Bool)

(declare-fun e!764198 () Bool)

(assert (=> b!1341432 (= e!764198 (and e!764200 mapRes!57382))))

(declare-fun condMapEmpty!57382 () Bool)

(declare-fun mapDefault!57382 () ValueCell!17660)

(assert (=> b!1341432 (= condMapEmpty!57382 (= (arr!44056 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17660)) mapDefault!57382)))))

(declare-fun res!889505 () Bool)

(assert (=> start!113290 (=> (not res!889505) (not e!764197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113290 (= res!889505 (validMask!0 mask!1977))))

(assert (=> start!113290 e!764197))

(assert (=> start!113290 tp_is_empty!37117))

(assert (=> start!113290 true))

(declare-fun array_inv!33481 (array!91211) Bool)

(assert (=> start!113290 (array_inv!33481 _keys!1571)))

(declare-fun array_inv!33482 (array!91209) Bool)

(assert (=> start!113290 (and (array_inv!33482 _values!1303) e!764198)))

(assert (=> start!113290 tp!109156))

(declare-fun b!1341438 () Bool)

(declare-fun res!889501 () Bool)

(assert (=> b!1341438 (=> (not res!889501) (not e!764197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341438 (= res!889501 (validKeyInArray!0 (select (arr!44057 _keys!1571) from!1960)))))

(declare-fun b!1341439 () Bool)

(declare-fun res!889504 () Bool)

(assert (=> b!1341439 (=> (not res!889504) (not e!764197))))

(assert (=> b!1341439 (= res!889504 (and (= (size!44607 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44608 _keys!1571) (size!44607 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113290 res!889505) b!1341439))

(assert (= (and b!1341439 res!889504) b!1341433))

(assert (= (and b!1341433 res!889508) b!1341436))

(assert (= (and b!1341436 res!889502) b!1341429))

(assert (= (and b!1341429 res!889506) b!1341437))

(assert (= (and b!1341437 res!889503) b!1341434))

(assert (= (and b!1341434 res!889507) b!1341438))

(assert (= (and b!1341438 res!889501) b!1341435))

(assert (= (and b!1341432 condMapEmpty!57382) mapIsEmpty!57382))

(assert (= (and b!1341432 (not condMapEmpty!57382)) mapNonEmpty!57382))

(get-info :version)

(assert (= (and mapNonEmpty!57382 ((_ is ValueCellFull!17660) mapValue!57382)) b!1341431))

(assert (= (and b!1341432 ((_ is ValueCellFull!17660) mapDefault!57382)) b!1341430))

(assert (= start!113290 b!1341432))

(declare-fun m!1229547 () Bool)

(assert (=> start!113290 m!1229547))

(declare-fun m!1229549 () Bool)

(assert (=> start!113290 m!1229549))

(declare-fun m!1229551 () Bool)

(assert (=> start!113290 m!1229551))

(declare-fun m!1229553 () Bool)

(assert (=> b!1341437 m!1229553))

(assert (=> b!1341437 m!1229553))

(declare-fun m!1229555 () Bool)

(assert (=> b!1341437 m!1229555))

(declare-fun m!1229557 () Bool)

(assert (=> b!1341433 m!1229557))

(declare-fun m!1229559 () Bool)

(assert (=> b!1341436 m!1229559))

(declare-fun m!1229561 () Bool)

(assert (=> b!1341434 m!1229561))

(assert (=> b!1341438 m!1229561))

(assert (=> b!1341438 m!1229561))

(declare-fun m!1229563 () Bool)

(assert (=> b!1341438 m!1229563))

(declare-fun m!1229565 () Bool)

(assert (=> mapNonEmpty!57382 m!1229565))

(check-sat (not start!113290) (not b!1341433) (not b_next!31117) (not mapNonEmpty!57382) (not b!1341438) b_and!50149 tp_is_empty!37117 (not b!1341437) (not b!1341436))
(check-sat b_and!50149 (not b_next!31117))
