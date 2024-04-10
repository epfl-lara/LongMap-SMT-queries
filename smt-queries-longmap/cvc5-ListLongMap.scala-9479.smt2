; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112482 () Bool)

(assert start!112482)

(declare-fun b_free!30877 () Bool)

(declare-fun b_next!30877 () Bool)

(assert (=> start!112482 (= b_free!30877 (not b_next!30877))))

(declare-fun tp!108267 () Bool)

(declare-fun b_and!49755 () Bool)

(assert (=> start!112482 (= tp!108267 b_and!49755)))

(declare-fun b!1333950 () Bool)

(declare-fun e!759817 () Bool)

(declare-fun e!759818 () Bool)

(assert (=> b!1333950 (= e!759817 e!759818)))

(declare-fun res!885283 () Bool)

(assert (=> b!1333950 (=> (not res!885283) (not e!759818))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((V!54153 0))(
  ( (V!54154 (val!18468 Int)) )
))
(declare-fun lt!592235 () V!54153)

(declare-datatypes ((array!90440 0))(
  ( (array!90441 (arr!43686 (Array (_ BitVec 32) (_ BitVec 64))) (size!44236 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90440)

(declare-fun k!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23806 0))(
  ( (tuple2!23807 (_1!11914 (_ BitVec 64)) (_2!11914 V!54153)) )
))
(declare-datatypes ((List!30949 0))(
  ( (Nil!30946) (Cons!30945 (h!32154 tuple2!23806) (t!45185 List!30949)) )
))
(declare-datatypes ((ListLongMap!21463 0))(
  ( (ListLongMap!21464 (toList!10747 List!30949)) )
))
(declare-fun lt!592236 () ListLongMap!21463)

(declare-fun contains!8911 (ListLongMap!21463 (_ BitVec 64)) Bool)

(declare-fun +!4718 (ListLongMap!21463 tuple2!23806) ListLongMap!21463)

(assert (=> b!1333950 (= res!885283 (contains!8911 (+!4718 lt!592236 (tuple2!23807 (select (arr!43686 _keys!1590) from!1980) lt!592235)) k!1153))))

(declare-datatypes ((ValueCell!17495 0))(
  ( (ValueCellFull!17495 (v!21105 V!54153)) (EmptyCell!17495) )
))
(declare-datatypes ((array!90442 0))(
  ( (array!90443 (arr!43687 (Array (_ BitVec 32) ValueCell!17495)) (size!44237 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90442)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54153)

(declare-fun zeroValue!1262 () V!54153)

(declare-fun getCurrentListMapNoExtraKeys!6356 (array!90440 array!90442 (_ BitVec 32) (_ BitVec 32) V!54153 V!54153 (_ BitVec 32) Int) ListLongMap!21463)

(assert (=> b!1333950 (= lt!592236 (getCurrentListMapNoExtraKeys!6356 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22040 (ValueCell!17495 V!54153) V!54153)

(declare-fun dynLambda!3657 (Int (_ BitVec 64)) V!54153)

(assert (=> b!1333950 (= lt!592235 (get!22040 (select (arr!43687 _values!1320) from!1980) (dynLambda!3657 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333951 () Bool)

(declare-fun res!885276 () Bool)

(assert (=> b!1333951 (=> (not res!885276) (not e!759817))))

(assert (=> b!1333951 (= res!885276 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44236 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333952 () Bool)

(declare-fun res!885280 () Bool)

(assert (=> b!1333952 (=> (not res!885280) (not e!759817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90440 (_ BitVec 32)) Bool)

(assert (=> b!1333952 (= res!885280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56854 () Bool)

(declare-fun mapRes!56854 () Bool)

(assert (=> mapIsEmpty!56854 mapRes!56854))

(declare-fun b!1333953 () Bool)

(declare-fun res!885285 () Bool)

(assert (=> b!1333953 (=> (not res!885285) (not e!759817))))

(declare-datatypes ((List!30950 0))(
  ( (Nil!30947) (Cons!30946 (h!32155 (_ BitVec 64)) (t!45186 List!30950)) )
))
(declare-fun arrayNoDuplicates!0 (array!90440 (_ BitVec 32) List!30950) Bool)

(assert (=> b!1333953 (= res!885285 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30947))))

(declare-fun b!1333954 () Bool)

(declare-fun res!885282 () Bool)

(assert (=> b!1333954 (=> (not res!885282) (not e!759817))))

(assert (=> b!1333954 (= res!885282 (not (= (select (arr!43686 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1333955 () Bool)

(declare-fun res!885284 () Bool)

(assert (=> b!1333955 (=> (not res!885284) (not e!759818))))

(assert (=> b!1333955 (= res!885284 (not (= k!1153 (select (arr!43686 _keys!1590) from!1980))))))

(declare-fun b!1333956 () Bool)

(declare-fun e!759819 () Bool)

(declare-fun tp_is_empty!36787 () Bool)

(assert (=> b!1333956 (= e!759819 tp_is_empty!36787)))

(declare-fun b!1333957 () Bool)

(declare-fun res!885275 () Bool)

(assert (=> b!1333957 (=> (not res!885275) (not e!759817))))

(assert (=> b!1333957 (= res!885275 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333958 () Bool)

(declare-fun res!885277 () Bool)

(assert (=> b!1333958 (=> (not res!885277) (not e!759817))))

(assert (=> b!1333958 (= res!885277 (and (= (size!44237 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44236 _keys!1590) (size!44237 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333959 () Bool)

(declare-fun res!885278 () Bool)

(assert (=> b!1333959 (=> (not res!885278) (not e!759817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333959 (= res!885278 (validKeyInArray!0 (select (arr!43686 _keys!1590) from!1980)))))

(declare-fun res!885281 () Bool)

(assert (=> start!112482 (=> (not res!885281) (not e!759817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112482 (= res!885281 (validMask!0 mask!1998))))

(assert (=> start!112482 e!759817))

(declare-fun e!759815 () Bool)

(declare-fun array_inv!32947 (array!90442) Bool)

(assert (=> start!112482 (and (array_inv!32947 _values!1320) e!759815)))

(assert (=> start!112482 true))

(declare-fun array_inv!32948 (array!90440) Bool)

(assert (=> start!112482 (array_inv!32948 _keys!1590)))

(assert (=> start!112482 tp!108267))

(assert (=> start!112482 tp_is_empty!36787))

(declare-fun b!1333960 () Bool)

(declare-fun e!759820 () Bool)

(assert (=> b!1333960 (= e!759815 (and e!759820 mapRes!56854))))

(declare-fun condMapEmpty!56854 () Bool)

(declare-fun mapDefault!56854 () ValueCell!17495)

