; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84034 () Bool)

(assert start!84034)

(declare-fun b_free!19789 () Bool)

(declare-fun b_next!19789 () Bool)

(assert (=> start!84034 (= b_free!19789 (not b_next!19789))))

(declare-fun tp!68890 () Bool)

(declare-fun b_and!31661 () Bool)

(assert (=> start!84034 (= tp!68890 b_and!31661)))

(declare-fun mapNonEmpty!36284 () Bool)

(declare-fun mapRes!36284 () Bool)

(declare-fun tp!68889 () Bool)

(declare-fun e!553748 () Bool)

(assert (=> mapNonEmpty!36284 (= mapRes!36284 (and tp!68889 e!553748))))

(declare-datatypes ((V!35433 0))(
  ( (V!35434 (val!11469 Int)) )
))
(declare-datatypes ((ValueCell!10937 0))(
  ( (ValueCellFull!10937 (v!14031 V!35433)) (EmptyCell!10937) )
))
(declare-datatypes ((array!61667 0))(
  ( (array!61668 (arr!29691 (Array (_ BitVec 32) ValueCell!10937)) (size!30170 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61667)

(declare-fun mapRest!36284 () (Array (_ BitVec 32) ValueCell!10937))

(declare-fun mapKey!36284 () (_ BitVec 32))

(declare-fun mapValue!36284 () ValueCell!10937)

(assert (=> mapNonEmpty!36284 (= (arr!29691 _values!1278) (store mapRest!36284 mapKey!36284 mapValue!36284))))

(declare-fun b!982349 () Bool)

(declare-fun res!657380 () Bool)

(declare-fun e!553747 () Bool)

(assert (=> b!982349 (=> (not res!657380) (not e!553747))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61669 0))(
  ( (array!61670 (arr!29692 (Array (_ BitVec 32) (_ BitVec 64))) (size!30171 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61669)

(assert (=> b!982349 (= res!657380 (and (= (size!30170 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30171 _keys!1544) (size!30170 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982350 () Bool)

(declare-fun res!657385 () Bool)

(assert (=> b!982350 (=> (not res!657385) (not e!553747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61669 (_ BitVec 32)) Bool)

(assert (=> b!982350 (= res!657385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36284 () Bool)

(assert (=> mapIsEmpty!36284 mapRes!36284))

(declare-fun res!657384 () Bool)

(assert (=> start!84034 (=> (not res!657384) (not e!553747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84034 (= res!657384 (validMask!0 mask!1948))))

(assert (=> start!84034 e!553747))

(assert (=> start!84034 true))

(declare-fun tp_is_empty!22837 () Bool)

(assert (=> start!84034 tp_is_empty!22837))

(declare-fun e!553750 () Bool)

(declare-fun array_inv!22959 (array!61667) Bool)

(assert (=> start!84034 (and (array_inv!22959 _values!1278) e!553750)))

(assert (=> start!84034 tp!68890))

(declare-fun array_inv!22960 (array!61669) Bool)

(assert (=> start!84034 (array_inv!22960 _keys!1544)))

(declare-fun b!982351 () Bool)

(declare-fun res!657381 () Bool)

(assert (=> b!982351 (=> (not res!657381) (not e!553747))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982351 (= res!657381 (validKeyInArray!0 (select (arr!29692 _keys!1544) from!1932)))))

(declare-fun b!982352 () Bool)

(declare-fun res!657383 () Bool)

(assert (=> b!982352 (=> (not res!657383) (not e!553747))))

(declare-datatypes ((List!20571 0))(
  ( (Nil!20568) (Cons!20567 (h!21729 (_ BitVec 64)) (t!29310 List!20571)) )
))
(declare-fun arrayNoDuplicates!0 (array!61669 (_ BitVec 32) List!20571) Bool)

(assert (=> b!982352 (= res!657383 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20568))))

(declare-fun b!982353 () Bool)

(declare-fun e!553751 () Bool)

(assert (=> b!982353 (= e!553751 (not true))))

(declare-datatypes ((tuple2!14690 0))(
  ( (tuple2!14691 (_1!7356 (_ BitVec 64)) (_2!7356 V!35433)) )
))
(declare-datatypes ((List!20572 0))(
  ( (Nil!20569) (Cons!20568 (h!21730 tuple2!14690) (t!29311 List!20572)) )
))
(declare-datatypes ((ListLongMap!13387 0))(
  ( (ListLongMap!13388 (toList!6709 List!20572)) )
))
(declare-fun lt!436096 () ListLongMap!13387)

(declare-fun lt!436100 () tuple2!14690)

(declare-fun lt!436098 () tuple2!14690)

(declare-fun +!3007 (ListLongMap!13387 tuple2!14690) ListLongMap!13387)

(assert (=> b!982353 (= (+!3007 (+!3007 lt!436096 lt!436100) lt!436098) (+!3007 (+!3007 lt!436096 lt!436098) lt!436100))))

(declare-fun lt!436099 () V!35433)

(assert (=> b!982353 (= lt!436098 (tuple2!14691 (select (arr!29692 _keys!1544) from!1932) lt!436099))))

(declare-fun zeroValue!1220 () V!35433)

(assert (=> b!982353 (= lt!436100 (tuple2!14691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32653 0))(
  ( (Unit!32654) )
))
(declare-fun lt!436097 () Unit!32653)

(declare-fun addCommutativeForDiffKeys!635 (ListLongMap!13387 (_ BitVec 64) V!35433 (_ BitVec 64) V!35433) Unit!32653)

(assert (=> b!982353 (= lt!436097 (addCommutativeForDiffKeys!635 lt!436096 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29692 _keys!1544) from!1932) lt!436099))))

(declare-fun b!982354 () Bool)

(declare-fun res!657379 () Bool)

(assert (=> b!982354 (=> (not res!657379) (not e!553747))))

(assert (=> b!982354 (= res!657379 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982355 () Bool)

(assert (=> b!982355 (= e!553748 tp_is_empty!22837)))

(declare-fun b!982356 () Bool)

(declare-fun res!657382 () Bool)

(assert (=> b!982356 (=> (not res!657382) (not e!553747))))

(assert (=> b!982356 (= res!657382 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30171 _keys!1544))))))

(declare-fun b!982357 () Bool)

(assert (=> b!982357 (= e!553747 e!553751)))

(declare-fun res!657386 () Bool)

(assert (=> b!982357 (=> (not res!657386) (not e!553751))))

(assert (=> b!982357 (= res!657386 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29692 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15399 (ValueCell!10937 V!35433) V!35433)

(declare-fun dynLambda!1792 (Int (_ BitVec 64)) V!35433)

(assert (=> b!982357 (= lt!436099 (get!15399 (select (arr!29691 _values!1278) from!1932) (dynLambda!1792 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35433)

(declare-fun getCurrentListMapNoExtraKeys!3409 (array!61669 array!61667 (_ BitVec 32) (_ BitVec 32) V!35433 V!35433 (_ BitVec 32) Int) ListLongMap!13387)

(assert (=> b!982357 (= lt!436096 (getCurrentListMapNoExtraKeys!3409 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982358 () Bool)

(declare-fun e!553749 () Bool)

(assert (=> b!982358 (= e!553750 (and e!553749 mapRes!36284))))

(declare-fun condMapEmpty!36284 () Bool)

(declare-fun mapDefault!36284 () ValueCell!10937)

