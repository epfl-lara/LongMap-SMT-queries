; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84002 () Bool)

(assert start!84002)

(declare-fun b_free!19757 () Bool)

(declare-fun b_next!19757 () Bool)

(assert (=> start!84002 (= b_free!19757 (not b_next!19757))))

(declare-fun tp!68794 () Bool)

(declare-fun b_and!31597 () Bool)

(assert (=> start!84002 (= tp!68794 b_and!31597)))

(declare-fun b!981789 () Bool)

(declare-fun res!657001 () Bool)

(declare-fun e!553459 () Bool)

(assert (=> b!981789 (=> (not res!657001) (not e!553459))))

(declare-datatypes ((array!61605 0))(
  ( (array!61606 (arr!29660 (Array (_ BitVec 32) (_ BitVec 64))) (size!30139 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61605)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981789 (= res!657001 (validKeyInArray!0 (select (arr!29660 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36236 () Bool)

(declare-fun mapRes!36236 () Bool)

(declare-fun tp!68793 () Bool)

(declare-fun e!553463 () Bool)

(assert (=> mapNonEmpty!36236 (= mapRes!36236 (and tp!68793 e!553463))))

(declare-datatypes ((V!35389 0))(
  ( (V!35390 (val!11453 Int)) )
))
(declare-datatypes ((ValueCell!10921 0))(
  ( (ValueCellFull!10921 (v!14015 V!35389)) (EmptyCell!10921) )
))
(declare-datatypes ((array!61607 0))(
  ( (array!61608 (arr!29661 (Array (_ BitVec 32) ValueCell!10921)) (size!30140 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61607)

(declare-fun mapValue!36236 () ValueCell!10921)

(declare-fun mapKey!36236 () (_ BitVec 32))

(declare-fun mapRest!36236 () (Array (_ BitVec 32) ValueCell!10921))

(assert (=> mapNonEmpty!36236 (= (arr!29661 _values!1278) (store mapRest!36236 mapKey!36236 mapValue!36236))))

(declare-fun b!981790 () Bool)

(declare-fun res!656999 () Bool)

(assert (=> b!981790 (=> (not res!656999) (not e!553459))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981790 (= res!656999 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36236 () Bool)

(assert (=> mapIsEmpty!36236 mapRes!36236))

(declare-fun b!981792 () Bool)

(declare-fun tp_is_empty!22805 () Bool)

(assert (=> b!981792 (= e!553463 tp_is_empty!22805)))

(declare-fun b!981793 () Bool)

(declare-fun e!553464 () Bool)

(assert (=> b!981793 (= e!553464 tp_is_empty!22805)))

(declare-fun b!981794 () Bool)

(declare-fun res!656997 () Bool)

(assert (=> b!981794 (=> (not res!656997) (not e!553459))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61605 (_ BitVec 32)) Bool)

(assert (=> b!981794 (= res!656997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981795 () Bool)

(declare-fun res!657002 () Bool)

(assert (=> b!981795 (=> (not res!657002) (not e!553459))))

(declare-datatypes ((List!20545 0))(
  ( (Nil!20542) (Cons!20541 (h!21703 (_ BitVec 64)) (t!29252 List!20545)) )
))
(declare-fun arrayNoDuplicates!0 (array!61605 (_ BitVec 32) List!20545) Bool)

(assert (=> b!981795 (= res!657002 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20542))))

(declare-fun b!981796 () Bool)

(declare-fun res!656995 () Bool)

(assert (=> b!981796 (=> (not res!656995) (not e!553459))))

(assert (=> b!981796 (= res!656995 (and (= (size!30140 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30139 _keys!1544) (size!30140 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981797 () Bool)

(declare-fun e!553462 () Bool)

(assert (=> b!981797 (= e!553462 (not true))))

(declare-datatypes ((tuple2!14662 0))(
  ( (tuple2!14663 (_1!7342 (_ BitVec 64)) (_2!7342 V!35389)) )
))
(declare-datatypes ((List!20546 0))(
  ( (Nil!20543) (Cons!20542 (h!21704 tuple2!14662) (t!29253 List!20546)) )
))
(declare-datatypes ((ListLongMap!13359 0))(
  ( (ListLongMap!13360 (toList!6695 List!20546)) )
))
(declare-fun lt!435857 () ListLongMap!13359)

(declare-fun lt!435860 () tuple2!14662)

(declare-fun lt!435858 () tuple2!14662)

(declare-fun +!2995 (ListLongMap!13359 tuple2!14662) ListLongMap!13359)

(assert (=> b!981797 (= (+!2995 (+!2995 lt!435857 lt!435860) lt!435858) (+!2995 (+!2995 lt!435857 lt!435858) lt!435860))))

(declare-fun lt!435859 () V!35389)

(assert (=> b!981797 (= lt!435858 (tuple2!14663 (select (arr!29660 _keys!1544) from!1932) lt!435859))))

(declare-fun zeroValue!1220 () V!35389)

(assert (=> b!981797 (= lt!435860 (tuple2!14663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32629 0))(
  ( (Unit!32630) )
))
(declare-fun lt!435856 () Unit!32629)

(declare-fun addCommutativeForDiffKeys!623 (ListLongMap!13359 (_ BitVec 64) V!35389 (_ BitVec 64) V!35389) Unit!32629)

(assert (=> b!981797 (= lt!435856 (addCommutativeForDiffKeys!623 lt!435857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29660 _keys!1544) from!1932) lt!435859))))

(declare-fun b!981798 () Bool)

(assert (=> b!981798 (= e!553459 e!553462)))

(declare-fun res!657000 () Bool)

(assert (=> b!981798 (=> (not res!657000) (not e!553462))))

(assert (=> b!981798 (= res!657000 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29660 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15373 (ValueCell!10921 V!35389) V!35389)

(declare-fun dynLambda!1778 (Int (_ BitVec 64)) V!35389)

(assert (=> b!981798 (= lt!435859 (get!15373 (select (arr!29661 _values!1278) from!1932) (dynLambda!1778 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35389)

(declare-fun getCurrentListMapNoExtraKeys!3395 (array!61605 array!61607 (_ BitVec 32) (_ BitVec 32) V!35389 V!35389 (_ BitVec 32) Int) ListLongMap!13359)

(assert (=> b!981798 (= lt!435857 (getCurrentListMapNoExtraKeys!3395 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981799 () Bool)

(declare-fun e!553461 () Bool)

(assert (=> b!981799 (= e!553461 (and e!553464 mapRes!36236))))

(declare-fun condMapEmpty!36236 () Bool)

(declare-fun mapDefault!36236 () ValueCell!10921)

