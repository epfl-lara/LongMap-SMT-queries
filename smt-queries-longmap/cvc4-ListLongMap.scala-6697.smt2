; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84158 () Bool)

(assert start!84158)

(declare-fun b_free!19859 () Bool)

(declare-fun b_next!19859 () Bool)

(assert (=> start!84158 (= b_free!19859 (not b_next!19859))))

(declare-fun tp!69181 () Bool)

(declare-fun b_and!31795 () Bool)

(assert (=> start!84158 (= tp!69181 b_and!31795)))

(declare-fun b!984072 () Bool)

(declare-fun res!658481 () Bool)

(declare-fun e!554774 () Bool)

(assert (=> b!984072 (=> (not res!658481) (not e!554774))))

(declare-datatypes ((array!61903 0))(
  ( (array!61904 (arr!29809 (Array (_ BitVec 32) (_ BitVec 64))) (size!30288 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61903)

(declare-datatypes ((List!20638 0))(
  ( (Nil!20635) (Cons!20634 (h!21796 (_ BitVec 64)) (t!29441 List!20638)) )
))
(declare-fun arrayNoDuplicates!0 (array!61903 (_ BitVec 32) List!20638) Bool)

(assert (=> b!984072 (= res!658481 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20635))))

(declare-fun b!984073 () Bool)

(declare-fun res!658482 () Bool)

(assert (=> b!984073 (=> (not res!658482) (not e!554774))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35597 0))(
  ( (V!35598 (val!11531 Int)) )
))
(declare-datatypes ((ValueCell!10999 0))(
  ( (ValueCellFull!10999 (v!14093 V!35597)) (EmptyCell!10999) )
))
(declare-datatypes ((array!61905 0))(
  ( (array!61906 (arr!29810 (Array (_ BitVec 32) ValueCell!10999)) (size!30289 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61905)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984073 (= res!658482 (and (= (size!30289 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30288 _keys!1544) (size!30289 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984074 () Bool)

(declare-fun e!554773 () Bool)

(assert (=> b!984074 (= e!554774 e!554773)))

(declare-fun res!658485 () Bool)

(assert (=> b!984074 (=> (not res!658485) (not e!554773))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984074 (= res!658485 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29809 _keys!1544) from!1932))))))

(declare-fun lt!436657 () V!35597)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15458 (ValueCell!10999 V!35597) V!35597)

(declare-fun dynLambda!1811 (Int (_ BitVec 64)) V!35597)

(assert (=> b!984074 (= lt!436657 (get!15458 (select (arr!29810 _values!1278) from!1932) (dynLambda!1811 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35597)

(declare-fun zeroValue!1220 () V!35597)

(declare-datatypes ((tuple2!14746 0))(
  ( (tuple2!14747 (_1!7384 (_ BitVec 64)) (_2!7384 V!35597)) )
))
(declare-datatypes ((List!20639 0))(
  ( (Nil!20636) (Cons!20635 (h!21797 tuple2!14746) (t!29442 List!20639)) )
))
(declare-datatypes ((ListLongMap!13443 0))(
  ( (ListLongMap!13444 (toList!6737 List!20639)) )
))
(declare-fun lt!436660 () ListLongMap!13443)

(declare-fun getCurrentListMapNoExtraKeys!3431 (array!61903 array!61905 (_ BitVec 32) (_ BitVec 32) V!35597 V!35597 (_ BitVec 32) Int) ListLongMap!13443)

(assert (=> b!984074 (= lt!436660 (getCurrentListMapNoExtraKeys!3431 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984075 () Bool)

(declare-fun res!658480 () Bool)

(assert (=> b!984075 (=> (not res!658480) (not e!554774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984075 (= res!658480 (validKeyInArray!0 (select (arr!29809 _keys!1544) from!1932)))))

(declare-fun b!984076 () Bool)

(declare-fun e!554778 () Bool)

(declare-fun tp_is_empty!22961 () Bool)

(assert (=> b!984076 (= e!554778 tp_is_empty!22961)))

(declare-fun b!984077 () Bool)

(declare-fun res!658487 () Bool)

(assert (=> b!984077 (=> (not res!658487) (not e!554774))))

(assert (=> b!984077 (= res!658487 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30288 _keys!1544))))))

(declare-fun res!658483 () Bool)

(assert (=> start!84158 (=> (not res!658483) (not e!554774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84158 (= res!658483 (validMask!0 mask!1948))))

(assert (=> start!84158 e!554774))

(assert (=> start!84158 true))

(assert (=> start!84158 tp_is_empty!22961))

(declare-fun e!554777 () Bool)

(declare-fun array_inv!23051 (array!61905) Bool)

(assert (=> start!84158 (and (array_inv!23051 _values!1278) e!554777)))

(assert (=> start!84158 tp!69181))

(declare-fun array_inv!23052 (array!61903) Bool)

(assert (=> start!84158 (array_inv!23052 _keys!1544)))

(declare-fun b!984078 () Bool)

(assert (=> b!984078 (= e!554773 (not true))))

(declare-fun lt!436661 () tuple2!14746)

(declare-fun lt!436659 () tuple2!14746)

(declare-fun +!3030 (ListLongMap!13443 tuple2!14746) ListLongMap!13443)

(assert (=> b!984078 (= (+!3030 (+!3030 lt!436660 lt!436661) lt!436659) (+!3030 (+!3030 lt!436660 lt!436659) lt!436661))))

(assert (=> b!984078 (= lt!436659 (tuple2!14747 (select (arr!29809 _keys!1544) from!1932) lt!436657))))

(assert (=> b!984078 (= lt!436661 (tuple2!14747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32699 0))(
  ( (Unit!32700) )
))
(declare-fun lt!436658 () Unit!32699)

(declare-fun addCommutativeForDiffKeys!658 (ListLongMap!13443 (_ BitVec 64) V!35597 (_ BitVec 64) V!35597) Unit!32699)

(assert (=> b!984078 (= lt!436658 (addCommutativeForDiffKeys!658 lt!436660 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29809 _keys!1544) from!1932) lt!436657))))

(declare-fun mapNonEmpty!36470 () Bool)

(declare-fun mapRes!36470 () Bool)

(declare-fun tp!69180 () Bool)

(assert (=> mapNonEmpty!36470 (= mapRes!36470 (and tp!69180 e!554778))))

(declare-fun mapRest!36470 () (Array (_ BitVec 32) ValueCell!10999))

(declare-fun mapValue!36470 () ValueCell!10999)

(declare-fun mapKey!36470 () (_ BitVec 32))

(assert (=> mapNonEmpty!36470 (= (arr!29810 _values!1278) (store mapRest!36470 mapKey!36470 mapValue!36470))))

(declare-fun b!984079 () Bool)

(declare-fun e!554775 () Bool)

(assert (=> b!984079 (= e!554775 tp_is_empty!22961)))

(declare-fun mapIsEmpty!36470 () Bool)

(assert (=> mapIsEmpty!36470 mapRes!36470))

(declare-fun b!984080 () Bool)

(assert (=> b!984080 (= e!554777 (and e!554775 mapRes!36470))))

(declare-fun condMapEmpty!36470 () Bool)

(declare-fun mapDefault!36470 () ValueCell!10999)

