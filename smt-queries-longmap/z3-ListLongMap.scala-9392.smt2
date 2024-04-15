; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111788 () Bool)

(assert start!111788)

(declare-fun b_free!30445 () Bool)

(declare-fun b_next!30445 () Bool)

(assert (=> start!111788 (= b_free!30445 (not b_next!30445))))

(declare-fun tp!106811 () Bool)

(declare-fun b_and!48965 () Bool)

(assert (=> start!111788 (= tp!106811 b_and!48965)))

(declare-fun b!1324599 () Bool)

(declare-fun e!755144 () Bool)

(declare-fun e!755145 () Bool)

(declare-fun mapRes!56045 () Bool)

(assert (=> b!1324599 (= e!755144 (and e!755145 mapRes!56045))))

(declare-fun condMapEmpty!56045 () Bool)

(declare-datatypes ((V!53457 0))(
  ( (V!53458 (val!18207 Int)) )
))
(declare-datatypes ((ValueCell!17234 0))(
  ( (ValueCellFull!17234 (v!20836 V!53457)) (EmptyCell!17234) )
))
(declare-datatypes ((array!89373 0))(
  ( (array!89374 (arr!43161 (Array (_ BitVec 32) ValueCell!17234)) (size!43713 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89373)

(declare-fun mapDefault!56045 () ValueCell!17234)

(assert (=> b!1324599 (= condMapEmpty!56045 (= (arr!43161 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17234)) mapDefault!56045)))))

(declare-fun res!879221 () Bool)

(declare-fun e!755142 () Bool)

(assert (=> start!111788 (=> (not res!879221) (not e!755142))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111788 (= res!879221 (validMask!0 mask!2019))))

(assert (=> start!111788 e!755142))

(declare-datatypes ((array!89375 0))(
  ( (array!89376 (arr!43162 (Array (_ BitVec 32) (_ BitVec 64))) (size!43714 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89375)

(declare-fun array_inv!32767 (array!89375) Bool)

(assert (=> start!111788 (array_inv!32767 _keys!1609)))

(assert (=> start!111788 true))

(declare-fun tp_is_empty!36265 () Bool)

(assert (=> start!111788 tp_is_empty!36265))

(declare-fun array_inv!32768 (array!89373) Bool)

(assert (=> start!111788 (and (array_inv!32768 _values!1337) e!755144)))

(assert (=> start!111788 tp!106811))

(declare-fun b!1324600 () Bool)

(declare-fun e!755146 () Bool)

(assert (=> b!1324600 (= e!755146 tp_is_empty!36265)))

(declare-fun b!1324601 () Bool)

(declare-fun res!879225 () Bool)

(assert (=> b!1324601 (=> (not res!879225) (not e!755142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89375 (_ BitVec 32)) Bool)

(assert (=> b!1324601 (= res!879225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324602 () Bool)

(declare-fun res!879218 () Bool)

(assert (=> b!1324602 (=> (not res!879218) (not e!755142))))

(declare-datatypes ((List!30677 0))(
  ( (Nil!30674) (Cons!30673 (h!31882 (_ BitVec 64)) (t!44595 List!30677)) )
))
(declare-fun arrayNoDuplicates!0 (array!89375 (_ BitVec 32) List!30677) Bool)

(assert (=> b!1324602 (= res!879218 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30674))))

(declare-fun b!1324603 () Bool)

(declare-fun res!879219 () Bool)

(assert (=> b!1324603 (=> (not res!879219) (not e!755142))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324603 (= res!879219 (validKeyInArray!0 (select (arr!43162 _keys!1609) from!2000)))))

(declare-fun b!1324604 () Bool)

(declare-fun res!879222 () Bool)

(assert (=> b!1324604 (=> (not res!879222) (not e!755142))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324604 (= res!879222 (not (= (select (arr!43162 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324605 () Bool)

(assert (=> b!1324605 (= e!755142 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53457)

(declare-fun minValue!1279 () V!53457)

(declare-datatypes ((tuple2!23546 0))(
  ( (tuple2!23547 (_1!11784 (_ BitVec 64)) (_2!11784 V!53457)) )
))
(declare-datatypes ((List!30678 0))(
  ( (Nil!30675) (Cons!30674 (h!31883 tuple2!23546) (t!44596 List!30678)) )
))
(declare-datatypes ((ListLongMap!21203 0))(
  ( (ListLongMap!21204 (toList!10617 List!30678)) )
))
(declare-fun lt!589305 () ListLongMap!21203)

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6263 (array!89375 array!89373 (_ BitVec 32) (_ BitVec 32) V!53457 V!53457 (_ BitVec 32) Int) ListLongMap!21203)

(assert (=> b!1324605 (= lt!589305 (getCurrentListMapNoExtraKeys!6263 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324606 () Bool)

(declare-fun res!879224 () Bool)

(assert (=> b!1324606 (=> (not res!879224) (not e!755142))))

(declare-fun contains!8700 (ListLongMap!21203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5496 (array!89375 array!89373 (_ BitVec 32) (_ BitVec 32) V!53457 V!53457 (_ BitVec 32) Int) ListLongMap!21203)

(assert (=> b!1324606 (= res!879224 (contains!8700 (getCurrentListMap!5496 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324607 () Bool)

(declare-fun res!879223 () Bool)

(assert (=> b!1324607 (=> (not res!879223) (not e!755142))))

(assert (=> b!1324607 (= res!879223 (and (= (size!43713 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43714 _keys!1609) (size!43713 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56045 () Bool)

(assert (=> mapIsEmpty!56045 mapRes!56045))

(declare-fun b!1324608 () Bool)

(assert (=> b!1324608 (= e!755145 tp_is_empty!36265)))

(declare-fun mapNonEmpty!56045 () Bool)

(declare-fun tp!106812 () Bool)

(assert (=> mapNonEmpty!56045 (= mapRes!56045 (and tp!106812 e!755146))))

(declare-fun mapValue!56045 () ValueCell!17234)

(declare-fun mapRest!56045 () (Array (_ BitVec 32) ValueCell!17234))

(declare-fun mapKey!56045 () (_ BitVec 32))

(assert (=> mapNonEmpty!56045 (= (arr!43161 _values!1337) (store mapRest!56045 mapKey!56045 mapValue!56045))))

(declare-fun b!1324609 () Bool)

(declare-fun res!879220 () Bool)

(assert (=> b!1324609 (=> (not res!879220) (not e!755142))))

(assert (=> b!1324609 (= res!879220 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43714 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111788 res!879221) b!1324607))

(assert (= (and b!1324607 res!879223) b!1324601))

(assert (= (and b!1324601 res!879225) b!1324602))

(assert (= (and b!1324602 res!879218) b!1324609))

(assert (= (and b!1324609 res!879220) b!1324606))

(assert (= (and b!1324606 res!879224) b!1324604))

(assert (= (and b!1324604 res!879222) b!1324603))

(assert (= (and b!1324603 res!879219) b!1324605))

(assert (= (and b!1324599 condMapEmpty!56045) mapIsEmpty!56045))

(assert (= (and b!1324599 (not condMapEmpty!56045)) mapNonEmpty!56045))

(get-info :version)

(assert (= (and mapNonEmpty!56045 ((_ is ValueCellFull!17234) mapValue!56045)) b!1324600))

(assert (= (and b!1324599 ((_ is ValueCellFull!17234) mapDefault!56045)) b!1324608))

(assert (= start!111788 b!1324599))

(declare-fun m!1212927 () Bool)

(assert (=> b!1324605 m!1212927))

(declare-fun m!1212929 () Bool)

(assert (=> b!1324603 m!1212929))

(assert (=> b!1324603 m!1212929))

(declare-fun m!1212931 () Bool)

(assert (=> b!1324603 m!1212931))

(declare-fun m!1212933 () Bool)

(assert (=> b!1324602 m!1212933))

(declare-fun m!1212935 () Bool)

(assert (=> start!111788 m!1212935))

(declare-fun m!1212937 () Bool)

(assert (=> start!111788 m!1212937))

(declare-fun m!1212939 () Bool)

(assert (=> start!111788 m!1212939))

(declare-fun m!1212941 () Bool)

(assert (=> b!1324601 m!1212941))

(declare-fun m!1212943 () Bool)

(assert (=> mapNonEmpty!56045 m!1212943))

(declare-fun m!1212945 () Bool)

(assert (=> b!1324606 m!1212945))

(assert (=> b!1324606 m!1212945))

(declare-fun m!1212947 () Bool)

(assert (=> b!1324606 m!1212947))

(assert (=> b!1324604 m!1212929))

(check-sat (not b_next!30445) (not b!1324603) (not mapNonEmpty!56045) (not b!1324606) tp_is_empty!36265 (not b!1324605) (not start!111788) b_and!48965 (not b!1324601) (not b!1324602))
(check-sat b_and!48965 (not b_next!30445))
