; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111778 () Bool)

(assert start!111778)

(declare-fun b_free!30435 () Bool)

(declare-fun b_next!30435 () Bool)

(assert (=> start!111778 (= b_free!30435 (not b_next!30435))))

(declare-fun tp!106781 () Bool)

(declare-fun b_and!48973 () Bool)

(assert (=> start!111778 (= tp!106781 b_and!48973)))

(declare-fun b!1324543 () Bool)

(declare-fun e!755104 () Bool)

(declare-fun tp_is_empty!36255 () Bool)

(assert (=> b!1324543 (= e!755104 tp_is_empty!36255)))

(declare-fun res!879167 () Bool)

(declare-fun e!755102 () Bool)

(assert (=> start!111778 (=> (not res!879167) (not e!755102))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111778 (= res!879167 (validMask!0 mask!2019))))

(assert (=> start!111778 e!755102))

(declare-datatypes ((array!89424 0))(
  ( (array!89425 (arr!43186 (Array (_ BitVec 32) (_ BitVec 64))) (size!43736 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89424)

(declare-fun array_inv!32599 (array!89424) Bool)

(assert (=> start!111778 (array_inv!32599 _keys!1609)))

(assert (=> start!111778 true))

(assert (=> start!111778 tp_is_empty!36255))

(declare-datatypes ((V!53443 0))(
  ( (V!53444 (val!18202 Int)) )
))
(declare-datatypes ((ValueCell!17229 0))(
  ( (ValueCellFull!17229 (v!20832 V!53443)) (EmptyCell!17229) )
))
(declare-datatypes ((array!89426 0))(
  ( (array!89427 (arr!43187 (Array (_ BitVec 32) ValueCell!17229)) (size!43737 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89426)

(declare-fun e!755101 () Bool)

(declare-fun array_inv!32600 (array!89426) Bool)

(assert (=> start!111778 (and (array_inv!32600 _values!1337) e!755101)))

(assert (=> start!111778 tp!106781))

(declare-fun b!1324544 () Bool)

(declare-fun res!879169 () Bool)

(assert (=> b!1324544 (=> (not res!879169) (not e!755102))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324544 (= res!879169 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43736 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56030 () Bool)

(declare-fun mapRes!56030 () Bool)

(assert (=> mapIsEmpty!56030 mapRes!56030))

(declare-fun b!1324545 () Bool)

(declare-fun res!879166 () Bool)

(assert (=> b!1324545 (=> (not res!879166) (not e!755102))))

(assert (=> b!1324545 (= res!879166 (and (= (size!43737 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43736 _keys!1609) (size!43737 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56030 () Bool)

(declare-fun tp!106780 () Bool)

(declare-fun e!755100 () Bool)

(assert (=> mapNonEmpty!56030 (= mapRes!56030 (and tp!106780 e!755100))))

(declare-fun mapRest!56030 () (Array (_ BitVec 32) ValueCell!17229))

(declare-fun mapValue!56030 () ValueCell!17229)

(declare-fun mapKey!56030 () (_ BitVec 32))

(assert (=> mapNonEmpty!56030 (= (arr!43187 _values!1337) (store mapRest!56030 mapKey!56030 mapValue!56030))))

(declare-fun b!1324546 () Bool)

(assert (=> b!1324546 (= e!755100 tp_is_empty!36255)))

(declare-fun b!1324547 () Bool)

(declare-fun res!879170 () Bool)

(assert (=> b!1324547 (=> (not res!879170) (not e!755102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89424 (_ BitVec 32)) Bool)

(assert (=> b!1324547 (= res!879170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324548 () Bool)

(assert (=> b!1324548 (= e!755101 (and e!755104 mapRes!56030))))

(declare-fun condMapEmpty!56030 () Bool)

(declare-fun mapDefault!56030 () ValueCell!17229)

(assert (=> b!1324548 (= condMapEmpty!56030 (= (arr!43187 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17229)) mapDefault!56030)))))

(declare-fun b!1324549 () Bool)

(declare-fun res!879168 () Bool)

(assert (=> b!1324549 (=> (not res!879168) (not e!755102))))

(declare-datatypes ((List!30613 0))(
  ( (Nil!30610) (Cons!30609 (h!31818 (_ BitVec 64)) (t!44539 List!30613)) )
))
(declare-fun arrayNoDuplicates!0 (array!89424 (_ BitVec 32) List!30613) Bool)

(assert (=> b!1324549 (= res!879168 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30610))))

(declare-fun b!1324550 () Bool)

(assert (=> b!1324550 (= e!755102 false)))

(declare-fun lt!589476 () Bool)

(declare-fun zeroValue!1279 () V!53443)

(declare-fun minValue!1279 () V!53443)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23472 0))(
  ( (tuple2!23473 (_1!11747 (_ BitVec 64)) (_2!11747 V!53443)) )
))
(declare-datatypes ((List!30614 0))(
  ( (Nil!30611) (Cons!30610 (h!31819 tuple2!23472) (t!44540 List!30614)) )
))
(declare-datatypes ((ListLongMap!21129 0))(
  ( (ListLongMap!21130 (toList!10580 List!30614)) )
))
(declare-fun contains!8735 (ListLongMap!21129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5576 (array!89424 array!89426 (_ BitVec 32) (_ BitVec 32) V!53443 V!53443 (_ BitVec 32) Int) ListLongMap!21129)

(assert (=> b!1324550 (= lt!589476 (contains!8735 (getCurrentListMap!5576 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111778 res!879167) b!1324545))

(assert (= (and b!1324545 res!879166) b!1324547))

(assert (= (and b!1324547 res!879170) b!1324549))

(assert (= (and b!1324549 res!879168) b!1324544))

(assert (= (and b!1324544 res!879169) b!1324550))

(assert (= (and b!1324548 condMapEmpty!56030) mapIsEmpty!56030))

(assert (= (and b!1324548 (not condMapEmpty!56030)) mapNonEmpty!56030))

(get-info :version)

(assert (= (and mapNonEmpty!56030 ((_ is ValueCellFull!17229) mapValue!56030)) b!1324546))

(assert (= (and b!1324548 ((_ is ValueCellFull!17229) mapDefault!56030)) b!1324543))

(assert (= start!111778 b!1324548))

(declare-fun m!1213363 () Bool)

(assert (=> b!1324547 m!1213363))

(declare-fun m!1213365 () Bool)

(assert (=> b!1324550 m!1213365))

(assert (=> b!1324550 m!1213365))

(declare-fun m!1213367 () Bool)

(assert (=> b!1324550 m!1213367))

(declare-fun m!1213369 () Bool)

(assert (=> start!111778 m!1213369))

(declare-fun m!1213371 () Bool)

(assert (=> start!111778 m!1213371))

(declare-fun m!1213373 () Bool)

(assert (=> start!111778 m!1213373))

(declare-fun m!1213375 () Bool)

(assert (=> b!1324549 m!1213375))

(declare-fun m!1213377 () Bool)

(assert (=> mapNonEmpty!56030 m!1213377))

(check-sat (not start!111778) b_and!48973 (not mapNonEmpty!56030) tp_is_empty!36255 (not b!1324550) (not b!1324547) (not b_next!30435) (not b!1324549))
(check-sat b_and!48973 (not b_next!30435))
