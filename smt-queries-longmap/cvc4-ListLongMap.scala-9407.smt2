; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111966 () Bool)

(assert start!111966)

(declare-fun b_free!30539 () Bool)

(declare-fun b_next!30539 () Bool)

(assert (=> start!111966 (= b_free!30539 (not b_next!30539))))

(declare-fun tp!107099 () Bool)

(declare-fun b_and!49177 () Bool)

(assert (=> start!111966 (= tp!107099 b_and!49177)))

(declare-datatypes ((array!89626 0))(
  ( (array!89627 (arr!43285 (Array (_ BitVec 32) (_ BitVec 64))) (size!43835 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89626)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53581 0))(
  ( (V!53582 (val!18254 Int)) )
))
(declare-fun zeroValue!1279 () V!53581)

(declare-datatypes ((ValueCell!17281 0))(
  ( (ValueCellFull!17281 (v!20888 V!53581)) (EmptyCell!17281) )
))
(declare-datatypes ((array!89628 0))(
  ( (array!89629 (arr!43286 (Array (_ BitVec 32) ValueCell!17281)) (size!43836 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89628)

(declare-fun e!756268 () Bool)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun b!1326910 () Bool)

(declare-fun minValue!1279 () V!53581)

(declare-datatypes ((tuple2!23554 0))(
  ( (tuple2!23555 (_1!11788 (_ BitVec 64)) (_2!11788 V!53581)) )
))
(declare-datatypes ((List!30690 0))(
  ( (Nil!30687) (Cons!30686 (h!31895 tuple2!23554) (t!44694 List!30690)) )
))
(declare-datatypes ((ListLongMap!21211 0))(
  ( (ListLongMap!21212 (toList!10621 List!30690)) )
))
(declare-fun contains!8780 (ListLongMap!21211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5612 (array!89626 array!89628 (_ BitVec 32) (_ BitVec 32) V!53581 V!53581 (_ BitVec 32) Int) ListLongMap!21211)

(assert (=> b!1326910 (= e!756268 (not (contains!8780 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k!1164)))))

(declare-fun b!1326911 () Bool)

(declare-fun res!880631 () Bool)

(assert (=> b!1326911 (=> (not res!880631) (not e!756268))))

(assert (=> b!1326911 (= res!880631 (and (= (size!43836 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43835 _keys!1609) (size!43836 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!880636 () Bool)

(assert (=> start!111966 (=> (not res!880636) (not e!756268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111966 (= res!880636 (validMask!0 mask!2019))))

(assert (=> start!111966 e!756268))

(declare-fun array_inv!32673 (array!89626) Bool)

(assert (=> start!111966 (array_inv!32673 _keys!1609)))

(assert (=> start!111966 true))

(declare-fun tp_is_empty!36359 () Bool)

(assert (=> start!111966 tp_is_empty!36359))

(declare-fun e!756265 () Bool)

(declare-fun array_inv!32674 (array!89628) Bool)

(assert (=> start!111966 (and (array_inv!32674 _values!1337) e!756265)))

(assert (=> start!111966 tp!107099))

(declare-fun b!1326912 () Bool)

(declare-fun res!880630 () Bool)

(assert (=> b!1326912 (=> (not res!880630) (not e!756268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326912 (= res!880630 (not (validKeyInArray!0 (select (arr!43285 _keys!1609) from!2000))))))

(declare-fun b!1326913 () Bool)

(declare-fun e!756267 () Bool)

(assert (=> b!1326913 (= e!756267 tp_is_empty!36359)))

(declare-fun b!1326914 () Bool)

(declare-fun e!756266 () Bool)

(assert (=> b!1326914 (= e!756266 tp_is_empty!36359)))

(declare-fun b!1326915 () Bool)

(declare-fun res!880633 () Bool)

(assert (=> b!1326915 (=> (not res!880633) (not e!756268))))

(assert (=> b!1326915 (= res!880633 (not (= (select (arr!43285 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1326916 () Bool)

(declare-fun res!880635 () Bool)

(assert (=> b!1326916 (=> (not res!880635) (not e!756268))))

(assert (=> b!1326916 (= res!880635 (contains!8780 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1326917 () Bool)

(declare-fun res!880632 () Bool)

(assert (=> b!1326917 (=> (not res!880632) (not e!756268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89626 (_ BitVec 32)) Bool)

(assert (=> b!1326917 (= res!880632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!56193 () Bool)

(declare-fun mapRes!56193 () Bool)

(declare-fun tp!107100 () Bool)

(assert (=> mapNonEmpty!56193 (= mapRes!56193 (and tp!107100 e!756267))))

(declare-fun mapKey!56193 () (_ BitVec 32))

(declare-fun mapValue!56193 () ValueCell!17281)

(declare-fun mapRest!56193 () (Array (_ BitVec 32) ValueCell!17281))

(assert (=> mapNonEmpty!56193 (= (arr!43286 _values!1337) (store mapRest!56193 mapKey!56193 mapValue!56193))))

(declare-fun mapIsEmpty!56193 () Bool)

(assert (=> mapIsEmpty!56193 mapRes!56193))

(declare-fun b!1326918 () Bool)

(declare-fun res!880634 () Bool)

(assert (=> b!1326918 (=> (not res!880634) (not e!756268))))

(assert (=> b!1326918 (= res!880634 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43835 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326919 () Bool)

(assert (=> b!1326919 (= e!756265 (and e!756266 mapRes!56193))))

(declare-fun condMapEmpty!56193 () Bool)

(declare-fun mapDefault!56193 () ValueCell!17281)

