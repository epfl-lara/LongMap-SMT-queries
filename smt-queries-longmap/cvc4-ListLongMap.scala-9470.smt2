; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112432 () Bool)

(assert start!112432)

(declare-fun b_free!30827 () Bool)

(declare-fun b_next!30827 () Bool)

(assert (=> start!112432 (= b_free!30827 (not b_next!30827))))

(declare-fun tp!108118 () Bool)

(declare-fun b_and!49669 () Bool)

(assert (=> start!112432 (= tp!108118 b_and!49669)))

(declare-fun res!884574 () Bool)

(declare-fun e!759405 () Bool)

(assert (=> start!112432 (=> (not res!884574) (not e!759405))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112432 (= res!884574 (validMask!0 mask!1998))))

(assert (=> start!112432 e!759405))

(declare-datatypes ((V!54085 0))(
  ( (V!54086 (val!18443 Int)) )
))
(declare-datatypes ((ValueCell!17470 0))(
  ( (ValueCellFull!17470 (v!21080 V!54085)) (EmptyCell!17470) )
))
(declare-datatypes ((array!90348 0))(
  ( (array!90349 (arr!43640 (Array (_ BitVec 32) ValueCell!17470)) (size!44190 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90348)

(declare-fun e!759403 () Bool)

(declare-fun array_inv!32917 (array!90348) Bool)

(assert (=> start!112432 (and (array_inv!32917 _values!1320) e!759403)))

(assert (=> start!112432 true))

(declare-datatypes ((array!90350 0))(
  ( (array!90351 (arr!43641 (Array (_ BitVec 32) (_ BitVec 64))) (size!44191 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90350)

(declare-fun array_inv!32918 (array!90350) Bool)

(assert (=> start!112432 (array_inv!32918 _keys!1590)))

(assert (=> start!112432 tp!108118))

(declare-fun tp_is_empty!36737 () Bool)

(assert (=> start!112432 tp_is_empty!36737))

(declare-fun b!1332987 () Bool)

(declare-fun res!884575 () Bool)

(assert (=> b!1332987 (=> (not res!884575) (not e!759405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90350 (_ BitVec 32)) Bool)

(assert (=> b!1332987 (= res!884575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56779 () Bool)

(declare-fun mapRes!56779 () Bool)

(assert (=> mapIsEmpty!56779 mapRes!56779))

(declare-fun b!1332988 () Bool)

(declare-fun res!884577 () Bool)

(assert (=> b!1332988 (=> (not res!884577) (not e!759405))))

(declare-datatypes ((List!30915 0))(
  ( (Nil!30912) (Cons!30911 (h!32120 (_ BitVec 64)) (t!45113 List!30915)) )
))
(declare-fun arrayNoDuplicates!0 (array!90350 (_ BitVec 32) List!30915) Bool)

(assert (=> b!1332988 (= res!884577 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30912))))

(declare-fun b!1332989 () Bool)

(declare-fun res!884576 () Bool)

(assert (=> b!1332989 (=> (not res!884576) (not e!759405))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332989 (= res!884576 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44191 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56779 () Bool)

(declare-fun tp!108117 () Bool)

(declare-fun e!759406 () Bool)

(assert (=> mapNonEmpty!56779 (= mapRes!56779 (and tp!108117 e!759406))))

(declare-fun mapKey!56779 () (_ BitVec 32))

(declare-fun mapRest!56779 () (Array (_ BitVec 32) ValueCell!17470))

(declare-fun mapValue!56779 () ValueCell!17470)

(assert (=> mapNonEmpty!56779 (= (arr!43640 _values!1320) (store mapRest!56779 mapKey!56779 mapValue!56779))))

(declare-fun b!1332990 () Bool)

(assert (=> b!1332990 (= e!759405 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592093 () Bool)

(declare-fun minValue!1262 () V!54085)

(declare-fun zeroValue!1262 () V!54085)

(declare-datatypes ((tuple2!23770 0))(
  ( (tuple2!23771 (_1!11896 (_ BitVec 64)) (_2!11896 V!54085)) )
))
(declare-datatypes ((List!30916 0))(
  ( (Nil!30913) (Cons!30912 (h!32121 tuple2!23770) (t!45114 List!30916)) )
))
(declare-datatypes ((ListLongMap!21427 0))(
  ( (ListLongMap!21428 (toList!10729 List!30916)) )
))
(declare-fun contains!8893 (ListLongMap!21427 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5710 (array!90350 array!90348 (_ BitVec 32) (_ BitVec 32) V!54085 V!54085 (_ BitVec 32) Int) ListLongMap!21427)

(assert (=> b!1332990 (= lt!592093 (contains!8893 (getCurrentListMap!5710 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332991 () Bool)

(assert (=> b!1332991 (= e!759406 tp_is_empty!36737)))

(declare-fun b!1332992 () Bool)

(declare-fun res!884573 () Bool)

(assert (=> b!1332992 (=> (not res!884573) (not e!759405))))

(assert (=> b!1332992 (= res!884573 (and (= (size!44190 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44191 _keys!1590) (size!44190 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332993 () Bool)

(declare-fun e!759402 () Bool)

(assert (=> b!1332993 (= e!759403 (and e!759402 mapRes!56779))))

(declare-fun condMapEmpty!56779 () Bool)

(declare-fun mapDefault!56779 () ValueCell!17470)

