; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112506 () Bool)

(assert start!112506)

(declare-fun b_free!30901 () Bool)

(declare-fun b_next!30901 () Bool)

(assert (=> start!112506 (= b_free!30901 (not b_next!30901))))

(declare-fun tp!108340 () Bool)

(declare-fun b_and!49803 () Bool)

(assert (=> start!112506 (= tp!108340 b_and!49803)))

(declare-fun b!1334478 () Bool)

(declare-fun res!885677 () Bool)

(declare-fun e!760034 () Bool)

(assert (=> b!1334478 (=> (not res!885677) (not e!760034))))

(declare-datatypes ((V!54185 0))(
  ( (V!54186 (val!18480 Int)) )
))
(declare-datatypes ((ValueCell!17507 0))(
  ( (ValueCellFull!17507 (v!21117 V!54185)) (EmptyCell!17507) )
))
(declare-datatypes ((array!90488 0))(
  ( (array!90489 (arr!43710 (Array (_ BitVec 32) ValueCell!17507)) (size!44260 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90488)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90490 0))(
  ( (array!90491 (arr!43711 (Array (_ BitVec 32) (_ BitVec 64))) (size!44261 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90490)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54185)

(declare-fun zeroValue!1262 () V!54185)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23828 0))(
  ( (tuple2!23829 (_1!11925 (_ BitVec 64)) (_2!11925 V!54185)) )
))
(declare-datatypes ((List!30967 0))(
  ( (Nil!30964) (Cons!30963 (h!32172 tuple2!23828) (t!45227 List!30967)) )
))
(declare-datatypes ((ListLongMap!21485 0))(
  ( (ListLongMap!21486 (toList!10758 List!30967)) )
))
(declare-fun contains!8922 (ListLongMap!21485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5733 (array!90490 array!90488 (_ BitVec 32) (_ BitVec 32) V!54185 V!54185 (_ BitVec 32) Int) ListLongMap!21485)

(assert (=> b!1334478 (= res!885677 (contains!8922 (getCurrentListMap!5733 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1334479 () Bool)

(declare-fun res!885681 () Bool)

(assert (=> b!1334479 (=> (not res!885681) (not e!760034))))

(assert (=> b!1334479 (= res!885681 (not (= (select (arr!43711 _keys!1590) from!1980) k!1153)))))

(declare-fun mapNonEmpty!56890 () Bool)

(declare-fun mapRes!56890 () Bool)

(declare-fun tp!108339 () Bool)

(declare-fun e!760035 () Bool)

(assert (=> mapNonEmpty!56890 (= mapRes!56890 (and tp!108339 e!760035))))

(declare-fun mapKey!56890 () (_ BitVec 32))

(declare-fun mapValue!56890 () ValueCell!17507)

(declare-fun mapRest!56890 () (Array (_ BitVec 32) ValueCell!17507))

(assert (=> mapNonEmpty!56890 (= (arr!43710 _values!1320) (store mapRest!56890 mapKey!56890 mapValue!56890))))

(declare-fun b!1334480 () Bool)

(declare-fun res!885672 () Bool)

(declare-fun e!760031 () Bool)

(assert (=> b!1334480 (=> (not res!885672) (not e!760031))))

(assert (=> b!1334480 (= res!885672 (not (= k!1153 (select (arr!43711 _keys!1590) from!1980))))))

(declare-fun res!885680 () Bool)

(assert (=> start!112506 (=> (not res!885680) (not e!760034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112506 (= res!885680 (validMask!0 mask!1998))))

(assert (=> start!112506 e!760034))

(declare-fun e!760033 () Bool)

(declare-fun array_inv!32963 (array!90488) Bool)

(assert (=> start!112506 (and (array_inv!32963 _values!1320) e!760033)))

(assert (=> start!112506 true))

(declare-fun array_inv!32964 (array!90490) Bool)

(assert (=> start!112506 (array_inv!32964 _keys!1590)))

(assert (=> start!112506 tp!108340))

(declare-fun tp_is_empty!36811 () Bool)

(assert (=> start!112506 tp_is_empty!36811))

(declare-fun mapIsEmpty!56890 () Bool)

(assert (=> mapIsEmpty!56890 mapRes!56890))

(declare-fun b!1334481 () Bool)

(declare-fun res!885679 () Bool)

(assert (=> b!1334481 (=> (not res!885679) (not e!760034))))

(assert (=> b!1334481 (= res!885679 (and (= (size!44260 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44261 _keys!1590) (size!44260 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334482 () Bool)

(declare-fun e!760036 () Bool)

(assert (=> b!1334482 (= e!760036 tp_is_empty!36811)))

(declare-fun b!1334483 () Bool)

(declare-fun res!885674 () Bool)

(assert (=> b!1334483 (=> (not res!885674) (not e!760034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90490 (_ BitVec 32)) Bool)

(assert (=> b!1334483 (= res!885674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334484 () Bool)

(assert (=> b!1334484 (= e!760035 tp_is_empty!36811)))

(declare-fun b!1334485 () Bool)

(declare-fun res!885675 () Bool)

(assert (=> b!1334485 (=> (not res!885675) (not e!760034))))

(declare-datatypes ((List!30968 0))(
  ( (Nil!30965) (Cons!30964 (h!32173 (_ BitVec 64)) (t!45228 List!30968)) )
))
(declare-fun arrayNoDuplicates!0 (array!90490 (_ BitVec 32) List!30968) Bool)

(assert (=> b!1334485 (= res!885675 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30965))))

(declare-fun b!1334486 () Bool)

(declare-fun res!885673 () Bool)

(assert (=> b!1334486 (=> (not res!885673) (not e!760034))))

(assert (=> b!1334486 (= res!885673 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44261 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334487 () Bool)

(declare-fun res!885678 () Bool)

(assert (=> b!1334487 (=> (not res!885678) (not e!760034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334487 (= res!885678 (validKeyInArray!0 (select (arr!43711 _keys!1590) from!1980)))))

(declare-fun b!1334488 () Bool)

(declare-fun res!885676 () Bool)

(assert (=> b!1334488 (=> (not res!885676) (not e!760034))))

(assert (=> b!1334488 (= res!885676 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334489 () Bool)

(assert (=> b!1334489 (= e!760034 e!760031)))

(declare-fun res!885671 () Bool)

(assert (=> b!1334489 (=> (not res!885671) (not e!760031))))

(declare-fun lt!592345 () V!54185)

(declare-fun lt!592343 () ListLongMap!21485)

(declare-fun +!4727 (ListLongMap!21485 tuple2!23828) ListLongMap!21485)

(assert (=> b!1334489 (= res!885671 (contains!8922 (+!4727 lt!592343 (tuple2!23829 (select (arr!43711 _keys!1590) from!1980) lt!592345)) k!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6365 (array!90490 array!90488 (_ BitVec 32) (_ BitVec 32) V!54185 V!54185 (_ BitVec 32) Int) ListLongMap!21485)

(assert (=> b!1334489 (= lt!592343 (getCurrentListMapNoExtraKeys!6365 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22057 (ValueCell!17507 V!54185) V!54185)

(declare-fun dynLambda!3666 (Int (_ BitVec 64)) V!54185)

(assert (=> b!1334489 (= lt!592345 (get!22057 (select (arr!43710 _values!1320) from!1980) (dynLambda!3666 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334490 () Bool)

(assert (=> b!1334490 (= e!760031 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(assert (=> b!1334490 (contains!8922 lt!592343 k!1153)))

(declare-datatypes ((Unit!43897 0))(
  ( (Unit!43898) )
))
(declare-fun lt!592344 () Unit!43897)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!311 ((_ BitVec 64) (_ BitVec 64) V!54185 ListLongMap!21485) Unit!43897)

(assert (=> b!1334490 (= lt!592344 (lemmaInListMapAfterAddingDiffThenInBefore!311 k!1153 (select (arr!43711 _keys!1590) from!1980) lt!592345 lt!592343))))

(declare-fun b!1334491 () Bool)

(assert (=> b!1334491 (= e!760033 (and e!760036 mapRes!56890))))

(declare-fun condMapEmpty!56890 () Bool)

(declare-fun mapDefault!56890 () ValueCell!17507)

