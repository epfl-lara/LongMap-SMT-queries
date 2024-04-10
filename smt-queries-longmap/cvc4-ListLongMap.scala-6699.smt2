; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84170 () Bool)

(assert start!84170)

(declare-fun b_free!19871 () Bool)

(declare-fun b_next!19871 () Bool)

(assert (=> start!84170 (= b_free!19871 (not b_next!19871))))

(declare-fun tp!69217 () Bool)

(declare-fun b_and!31819 () Bool)

(assert (=> start!84170 (= tp!69217 b_and!31819)))

(declare-fun b!984282 () Bool)

(declare-fun res!658627 () Bool)

(declare-fun e!554881 () Bool)

(assert (=> b!984282 (=> (not res!658627) (not e!554881))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35613 0))(
  ( (V!35614 (val!11537 Int)) )
))
(declare-datatypes ((ValueCell!11005 0))(
  ( (ValueCellFull!11005 (v!14099 V!35613)) (EmptyCell!11005) )
))
(declare-datatypes ((array!61927 0))(
  ( (array!61928 (arr!29821 (Array (_ BitVec 32) ValueCell!11005)) (size!30300 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61927)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61929 0))(
  ( (array!61930 (arr!29822 (Array (_ BitVec 32) (_ BitVec 64))) (size!30301 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61929)

(assert (=> b!984282 (= res!658627 (and (= (size!30300 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30301 _keys!1544) (size!30300 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984283 () Bool)

(declare-fun res!658628 () Bool)

(assert (=> b!984283 (=> (not res!658628) (not e!554881))))

(assert (=> b!984283 (= res!658628 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36488 () Bool)

(declare-fun mapRes!36488 () Bool)

(assert (=> mapIsEmpty!36488 mapRes!36488))

(declare-fun b!984284 () Bool)

(declare-fun res!658630 () Bool)

(assert (=> b!984284 (=> (not res!658630) (not e!554881))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984284 (= res!658630 (validKeyInArray!0 (select (arr!29822 _keys!1544) from!1932)))))

(declare-fun b!984285 () Bool)

(declare-fun e!554884 () Bool)

(assert (=> b!984285 (= e!554881 e!554884)))

(declare-fun res!658626 () Bool)

(assert (=> b!984285 (=> (not res!658626) (not e!554884))))

(assert (=> b!984285 (= res!658626 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29822 _keys!1544) from!1932))))))

(declare-fun lt!436750 () V!35613)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15465 (ValueCell!11005 V!35613) V!35613)

(declare-fun dynLambda!1814 (Int (_ BitVec 64)) V!35613)

(assert (=> b!984285 (= lt!436750 (get!15465 (select (arr!29821 _values!1278) from!1932) (dynLambda!1814 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35613)

(declare-fun zeroValue!1220 () V!35613)

(declare-datatypes ((tuple2!14752 0))(
  ( (tuple2!14753 (_1!7387 (_ BitVec 64)) (_2!7387 V!35613)) )
))
(declare-datatypes ((List!20645 0))(
  ( (Nil!20642) (Cons!20641 (h!21803 tuple2!14752) (t!29460 List!20645)) )
))
(declare-datatypes ((ListLongMap!13449 0))(
  ( (ListLongMap!13450 (toList!6740 List!20645)) )
))
(declare-fun lt!436749 () ListLongMap!13449)

(declare-fun getCurrentListMapNoExtraKeys!3434 (array!61929 array!61927 (_ BitVec 32) (_ BitVec 32) V!35613 V!35613 (_ BitVec 32) Int) ListLongMap!13449)

(assert (=> b!984285 (= lt!436749 (getCurrentListMapNoExtraKeys!3434 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!658631 () Bool)

(assert (=> start!84170 (=> (not res!658631) (not e!554881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84170 (= res!658631 (validMask!0 mask!1948))))

(assert (=> start!84170 e!554881))

(assert (=> start!84170 true))

(declare-fun tp_is_empty!22973 () Bool)

(assert (=> start!84170 tp_is_empty!22973))

(declare-fun e!554883 () Bool)

(declare-fun array_inv!23061 (array!61927) Bool)

(assert (=> start!84170 (and (array_inv!23061 _values!1278) e!554883)))

(assert (=> start!84170 tp!69217))

(declare-fun array_inv!23062 (array!61929) Bool)

(assert (=> start!84170 (array_inv!23062 _keys!1544)))

(declare-fun b!984286 () Bool)

(declare-fun e!554886 () Bool)

(assert (=> b!984286 (= e!554886 tp_is_empty!22973)))

(declare-fun b!984287 () Bool)

(declare-fun e!554885 () Bool)

(assert (=> b!984287 (= e!554885 tp_is_empty!22973)))

(declare-fun b!984288 () Bool)

(declare-fun res!658629 () Bool)

(assert (=> b!984288 (=> (not res!658629) (not e!554881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61929 (_ BitVec 32)) Bool)

(assert (=> b!984288 (= res!658629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984289 () Bool)

(declare-fun res!658625 () Bool)

(assert (=> b!984289 (=> (not res!658625) (not e!554881))))

(declare-datatypes ((List!20646 0))(
  ( (Nil!20643) (Cons!20642 (h!21804 (_ BitVec 64)) (t!29461 List!20646)) )
))
(declare-fun arrayNoDuplicates!0 (array!61929 (_ BitVec 32) List!20646) Bool)

(assert (=> b!984289 (= res!658625 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20643))))

(declare-fun b!984290 () Bool)

(assert (=> b!984290 (= e!554884 (not true))))

(declare-fun lt!436747 () tuple2!14752)

(declare-fun lt!436748 () tuple2!14752)

(declare-fun +!3033 (ListLongMap!13449 tuple2!14752) ListLongMap!13449)

(assert (=> b!984290 (= (+!3033 (+!3033 lt!436749 lt!436747) lt!436748) (+!3033 (+!3033 lt!436749 lt!436748) lt!436747))))

(assert (=> b!984290 (= lt!436748 (tuple2!14753 (select (arr!29822 _keys!1544) from!1932) lt!436750))))

(assert (=> b!984290 (= lt!436747 (tuple2!14753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32705 0))(
  ( (Unit!32706) )
))
(declare-fun lt!436751 () Unit!32705)

(declare-fun addCommutativeForDiffKeys!661 (ListLongMap!13449 (_ BitVec 64) V!35613 (_ BitVec 64) V!35613) Unit!32705)

(assert (=> b!984290 (= lt!436751 (addCommutativeForDiffKeys!661 lt!436749 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29822 _keys!1544) from!1932) lt!436750))))

(declare-fun mapNonEmpty!36488 () Bool)

(declare-fun tp!69216 () Bool)

(assert (=> mapNonEmpty!36488 (= mapRes!36488 (and tp!69216 e!554885))))

(declare-fun mapKey!36488 () (_ BitVec 32))

(declare-fun mapValue!36488 () ValueCell!11005)

(declare-fun mapRest!36488 () (Array (_ BitVec 32) ValueCell!11005))

(assert (=> mapNonEmpty!36488 (= (arr!29821 _values!1278) (store mapRest!36488 mapKey!36488 mapValue!36488))))

(declare-fun b!984291 () Bool)

(assert (=> b!984291 (= e!554883 (and e!554886 mapRes!36488))))

(declare-fun condMapEmpty!36488 () Bool)

(declare-fun mapDefault!36488 () ValueCell!11005)

