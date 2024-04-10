; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84022 () Bool)

(assert start!84022)

(declare-fun b_free!19777 () Bool)

(declare-fun b_next!19777 () Bool)

(assert (=> start!84022 (= b_free!19777 (not b_next!19777))))

(declare-fun tp!68854 () Bool)

(declare-fun b_and!31637 () Bool)

(assert (=> start!84022 (= tp!68854 b_and!31637)))

(declare-fun b!982139 () Bool)

(declare-fun e!553642 () Bool)

(declare-fun tp_is_empty!22825 () Bool)

(assert (=> b!982139 (= e!553642 tp_is_empty!22825)))

(declare-fun b!982141 () Bool)

(declare-fun res!657236 () Bool)

(declare-fun e!553644 () Bool)

(assert (=> b!982141 (=> (not res!657236) (not e!553644))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35417 0))(
  ( (V!35418 (val!11463 Int)) )
))
(declare-datatypes ((ValueCell!10931 0))(
  ( (ValueCellFull!10931 (v!14025 V!35417)) (EmptyCell!10931) )
))
(declare-datatypes ((array!61643 0))(
  ( (array!61644 (arr!29679 (Array (_ BitVec 32) ValueCell!10931)) (size!30158 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61643)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61645 0))(
  ( (array!61646 (arr!29680 (Array (_ BitVec 32) (_ BitVec 64))) (size!30159 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61645)

(assert (=> b!982141 (= res!657236 (and (= (size!30158 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30159 _keys!1544) (size!30158 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982142 () Bool)

(declare-fun res!657239 () Bool)

(assert (=> b!982142 (=> (not res!657239) (not e!553644))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982142 (= res!657239 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30159 _keys!1544))))))

(declare-fun b!982143 () Bool)

(declare-fun res!657238 () Bool)

(assert (=> b!982143 (=> (not res!657238) (not e!553644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61645 (_ BitVec 32)) Bool)

(assert (=> b!982143 (= res!657238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36266 () Bool)

(declare-fun mapRes!36266 () Bool)

(assert (=> mapIsEmpty!36266 mapRes!36266))

(declare-fun b!982144 () Bool)

(declare-fun res!657237 () Bool)

(assert (=> b!982144 (=> (not res!657237) (not e!553644))))

(assert (=> b!982144 (= res!657237 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982145 () Bool)

(declare-fun e!553639 () Bool)

(assert (=> b!982145 (= e!553639 tp_is_empty!22825)))

(declare-fun b!982146 () Bool)

(declare-fun res!657241 () Bool)

(assert (=> b!982146 (=> (not res!657241) (not e!553644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982146 (= res!657241 (validKeyInArray!0 (select (arr!29680 _keys!1544) from!1932)))))

(declare-fun b!982140 () Bool)

(declare-fun e!553641 () Bool)

(assert (=> b!982140 (= e!553644 e!553641)))

(declare-fun res!657240 () Bool)

(assert (=> b!982140 (=> (not res!657240) (not e!553641))))

(assert (=> b!982140 (= res!657240 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29680 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436009 () V!35417)

(declare-fun get!15389 (ValueCell!10931 V!35417) V!35417)

(declare-fun dynLambda!1786 (Int (_ BitVec 64)) V!35417)

(assert (=> b!982140 (= lt!436009 (get!15389 (select (arr!29679 _values!1278) from!1932) (dynLambda!1786 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14678 0))(
  ( (tuple2!14679 (_1!7350 (_ BitVec 64)) (_2!7350 V!35417)) )
))
(declare-datatypes ((List!20559 0))(
  ( (Nil!20556) (Cons!20555 (h!21717 tuple2!14678) (t!29286 List!20559)) )
))
(declare-datatypes ((ListLongMap!13375 0))(
  ( (ListLongMap!13376 (toList!6703 List!20559)) )
))
(declare-fun lt!436010 () ListLongMap!13375)

(declare-fun minValue!1220 () V!35417)

(declare-fun zeroValue!1220 () V!35417)

(declare-fun getCurrentListMapNoExtraKeys!3403 (array!61645 array!61643 (_ BitVec 32) (_ BitVec 32) V!35417 V!35417 (_ BitVec 32) Int) ListLongMap!13375)

(assert (=> b!982140 (= lt!436010 (getCurrentListMapNoExtraKeys!3403 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!657242 () Bool)

(assert (=> start!84022 (=> (not res!657242) (not e!553644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84022 (= res!657242 (validMask!0 mask!1948))))

(assert (=> start!84022 e!553644))

(assert (=> start!84022 true))

(assert (=> start!84022 tp_is_empty!22825))

(declare-fun e!553640 () Bool)

(declare-fun array_inv!22949 (array!61643) Bool)

(assert (=> start!84022 (and (array_inv!22949 _values!1278) e!553640)))

(assert (=> start!84022 tp!68854))

(declare-fun array_inv!22950 (array!61645) Bool)

(assert (=> start!84022 (array_inv!22950 _keys!1544)))

(declare-fun b!982147 () Bool)

(declare-fun res!657235 () Bool)

(assert (=> b!982147 (=> (not res!657235) (not e!553644))))

(declare-datatypes ((List!20560 0))(
  ( (Nil!20557) (Cons!20556 (h!21718 (_ BitVec 64)) (t!29287 List!20560)) )
))
(declare-fun arrayNoDuplicates!0 (array!61645 (_ BitVec 32) List!20560) Bool)

(assert (=> b!982147 (= res!657235 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20557))))

(declare-fun mapNonEmpty!36266 () Bool)

(declare-fun tp!68853 () Bool)

(assert (=> mapNonEmpty!36266 (= mapRes!36266 (and tp!68853 e!553642))))

(declare-fun mapValue!36266 () ValueCell!10931)

(declare-fun mapRest!36266 () (Array (_ BitVec 32) ValueCell!10931))

(declare-fun mapKey!36266 () (_ BitVec 32))

(assert (=> mapNonEmpty!36266 (= (arr!29679 _values!1278) (store mapRest!36266 mapKey!36266 mapValue!36266))))

(declare-fun b!982148 () Bool)

(assert (=> b!982148 (= e!553641 (not true))))

(declare-fun lt!436006 () tuple2!14678)

(declare-fun lt!436008 () tuple2!14678)

(declare-fun +!3001 (ListLongMap!13375 tuple2!14678) ListLongMap!13375)

(assert (=> b!982148 (= (+!3001 (+!3001 lt!436010 lt!436006) lt!436008) (+!3001 (+!3001 lt!436010 lt!436008) lt!436006))))

(assert (=> b!982148 (= lt!436008 (tuple2!14679 (select (arr!29680 _keys!1544) from!1932) lt!436009))))

(assert (=> b!982148 (= lt!436006 (tuple2!14679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32641 0))(
  ( (Unit!32642) )
))
(declare-fun lt!436007 () Unit!32641)

(declare-fun addCommutativeForDiffKeys!629 (ListLongMap!13375 (_ BitVec 64) V!35417 (_ BitVec 64) V!35417) Unit!32641)

(assert (=> b!982148 (= lt!436007 (addCommutativeForDiffKeys!629 lt!436010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29680 _keys!1544) from!1932) lt!436009))))

(declare-fun b!982149 () Bool)

(assert (=> b!982149 (= e!553640 (and e!553639 mapRes!36266))))

(declare-fun condMapEmpty!36266 () Bool)

(declare-fun mapDefault!36266 () ValueCell!10931)

