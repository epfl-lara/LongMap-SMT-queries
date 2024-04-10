; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83996 () Bool)

(assert start!83996)

(declare-fun b_free!19751 () Bool)

(declare-fun b_next!19751 () Bool)

(assert (=> start!83996 (= b_free!19751 (not b_next!19751))))

(declare-fun tp!68776 () Bool)

(declare-fun b_and!31585 () Bool)

(assert (=> start!83996 (= tp!68776 b_and!31585)))

(declare-fun b!981684 () Bool)

(declare-fun e!553405 () Bool)

(declare-fun tp_is_empty!22799 () Bool)

(assert (=> b!981684 (= e!553405 tp_is_empty!22799)))

(declare-fun b!981685 () Bool)

(declare-fun res!656930 () Bool)

(declare-fun e!553408 () Bool)

(assert (=> b!981685 (=> (not res!656930) (not e!553408))))

(declare-datatypes ((array!61593 0))(
  ( (array!61594 (arr!29654 (Array (_ BitVec 32) (_ BitVec 64))) (size!30133 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61593)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981685 (= res!656930 (validKeyInArray!0 (select (arr!29654 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36227 () Bool)

(declare-fun mapRes!36227 () Bool)

(assert (=> mapIsEmpty!36227 mapRes!36227))

(declare-fun b!981686 () Bool)

(declare-fun res!656924 () Bool)

(assert (=> b!981686 (=> (not res!656924) (not e!553408))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35381 0))(
  ( (V!35382 (val!11450 Int)) )
))
(declare-datatypes ((ValueCell!10918 0))(
  ( (ValueCellFull!10918 (v!14012 V!35381)) (EmptyCell!10918) )
))
(declare-datatypes ((array!61595 0))(
  ( (array!61596 (arr!29655 (Array (_ BitVec 32) ValueCell!10918)) (size!30134 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61595)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981686 (= res!656924 (and (= (size!30134 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30133 _keys!1544) (size!30134 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981687 () Bool)

(declare-fun res!656925 () Bool)

(assert (=> b!981687 (=> (not res!656925) (not e!553408))))

(assert (=> b!981687 (= res!656925 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981688 () Bool)

(declare-fun e!553406 () Bool)

(assert (=> b!981688 (= e!553408 e!553406)))

(declare-fun res!656928 () Bool)

(assert (=> b!981688 (=> (not res!656928) (not e!553406))))

(assert (=> b!981688 (= res!656928 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29654 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!435811 () V!35381)

(declare-fun get!15369 (ValueCell!10918 V!35381) V!35381)

(declare-fun dynLambda!1776 (Int (_ BitVec 64)) V!35381)

(assert (=> b!981688 (= lt!435811 (get!15369 (select (arr!29655 _values!1278) from!1932) (dynLambda!1776 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35381)

(declare-datatypes ((tuple2!14656 0))(
  ( (tuple2!14657 (_1!7339 (_ BitVec 64)) (_2!7339 V!35381)) )
))
(declare-datatypes ((List!20540 0))(
  ( (Nil!20537) (Cons!20536 (h!21698 tuple2!14656) (t!29241 List!20540)) )
))
(declare-datatypes ((ListLongMap!13353 0))(
  ( (ListLongMap!13354 (toList!6692 List!20540)) )
))
(declare-fun lt!435815 () ListLongMap!13353)

(declare-fun zeroValue!1220 () V!35381)

(declare-fun getCurrentListMapNoExtraKeys!3393 (array!61593 array!61595 (_ BitVec 32) (_ BitVec 32) V!35381 V!35381 (_ BitVec 32) Int) ListLongMap!13353)

(assert (=> b!981688 (= lt!435815 (getCurrentListMapNoExtraKeys!3393 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!656923 () Bool)

(assert (=> start!83996 (=> (not res!656923) (not e!553408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83996 (= res!656923 (validMask!0 mask!1948))))

(assert (=> start!83996 e!553408))

(assert (=> start!83996 true))

(assert (=> start!83996 tp_is_empty!22799))

(declare-fun e!553407 () Bool)

(declare-fun array_inv!22929 (array!61595) Bool)

(assert (=> start!83996 (and (array_inv!22929 _values!1278) e!553407)))

(assert (=> start!83996 tp!68776))

(declare-fun array_inv!22930 (array!61593) Bool)

(assert (=> start!83996 (array_inv!22930 _keys!1544)))

(declare-fun b!981689 () Bool)

(declare-fun res!656926 () Bool)

(assert (=> b!981689 (=> (not res!656926) (not e!553408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61593 (_ BitVec 32)) Bool)

(assert (=> b!981689 (= res!656926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36227 () Bool)

(declare-fun tp!68775 () Bool)

(assert (=> mapNonEmpty!36227 (= mapRes!36227 (and tp!68775 e!553405))))

(declare-fun mapRest!36227 () (Array (_ BitVec 32) ValueCell!10918))

(declare-fun mapValue!36227 () ValueCell!10918)

(declare-fun mapKey!36227 () (_ BitVec 32))

(assert (=> mapNonEmpty!36227 (= (arr!29655 _values!1278) (store mapRest!36227 mapKey!36227 mapValue!36227))))

(declare-fun b!981690 () Bool)

(declare-fun e!553410 () Bool)

(assert (=> b!981690 (= e!553407 (and e!553410 mapRes!36227))))

(declare-fun condMapEmpty!36227 () Bool)

(declare-fun mapDefault!36227 () ValueCell!10918)

