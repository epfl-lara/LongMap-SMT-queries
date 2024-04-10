; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84654 () Bool)

(assert start!84654)

(declare-fun b_free!20065 () Bool)

(declare-fun b_next!20065 () Bool)

(assert (=> start!84654 (= b_free!20065 (not b_next!20065))))

(declare-fun tp!69989 () Bool)

(declare-fun b_and!32201 () Bool)

(assert (=> start!84654 (= tp!69989 b_and!32201)))

(declare-fun b!989991 () Bool)

(declare-fun e!558233 () Bool)

(declare-fun tp_is_empty!23281 () Bool)

(assert (=> b!989991 (= e!558233 tp_is_empty!23281)))

(declare-fun b!989992 () Bool)

(declare-fun res!661994 () Bool)

(declare-fun e!558237 () Bool)

(assert (=> b!989992 (=> (not res!661994) (not e!558237))))

(declare-datatypes ((array!62523 0))(
  ( (array!62524 (arr!30113 (Array (_ BitVec 32) (_ BitVec 64))) (size!30592 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62523)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989992 (= res!661994 (validKeyInArray!0 (select (arr!30113 _keys!1544) from!1932)))))

(declare-fun b!989993 () Bool)

(declare-fun e!558235 () Bool)

(assert (=> b!989993 (= e!558235 (not true))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36025 0))(
  ( (V!36026 (val!11691 Int)) )
))
(declare-fun minValue!1220 () V!36025)

(declare-datatypes ((ValueCell!11159 0))(
  ( (ValueCellFull!11159 (v!14261 V!36025)) (EmptyCell!11159) )
))
(declare-datatypes ((array!62525 0))(
  ( (array!62526 (arr!30114 (Array (_ BitVec 32) ValueCell!11159)) (size!30593 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62525)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14906 0))(
  ( (tuple2!14907 (_1!7464 (_ BitVec 64)) (_2!7464 V!36025)) )
))
(declare-datatypes ((List!20835 0))(
  ( (Nil!20832) (Cons!20831 (h!21993 tuple2!14906) (t!29796 List!20835)) )
))
(declare-datatypes ((ListLongMap!13603 0))(
  ( (ListLongMap!13604 (toList!6817 List!20835)) )
))
(declare-fun lt!439166 () ListLongMap!13603)

(declare-fun zeroValue!1220 () V!36025)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3867 (array!62523 array!62525 (_ BitVec 32) (_ BitVec 32) V!36025 V!36025 (_ BitVec 32) Int) ListLongMap!13603)

(assert (=> b!989993 (= lt!439166 (getCurrentListMap!3867 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439169 () ListLongMap!13603)

(declare-fun lt!439170 () tuple2!14906)

(declare-fun lt!439167 () tuple2!14906)

(declare-fun +!3087 (ListLongMap!13603 tuple2!14906) ListLongMap!13603)

(assert (=> b!989993 (= (+!3087 (+!3087 lt!439169 lt!439170) lt!439167) (+!3087 (+!3087 lt!439169 lt!439167) lt!439170))))

(declare-fun lt!439165 () V!36025)

(assert (=> b!989993 (= lt!439167 (tuple2!14907 (select (arr!30113 _keys!1544) from!1932) lt!439165))))

(assert (=> b!989993 (= lt!439170 (tuple2!14907 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32848 0))(
  ( (Unit!32849) )
))
(declare-fun lt!439168 () Unit!32848)

(declare-fun addCommutativeForDiffKeys!709 (ListLongMap!13603 (_ BitVec 64) V!36025 (_ BitVec 64) V!36025) Unit!32848)

(assert (=> b!989993 (= lt!439168 (addCommutativeForDiffKeys!709 lt!439169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30113 _keys!1544) from!1932) lt!439165))))

(declare-fun b!989994 () Bool)

(declare-fun res!661995 () Bool)

(assert (=> b!989994 (=> (not res!661995) (not e!558237))))

(declare-datatypes ((List!20836 0))(
  ( (Nil!20833) (Cons!20832 (h!21994 (_ BitVec 64)) (t!29797 List!20836)) )
))
(declare-fun arrayNoDuplicates!0 (array!62523 (_ BitVec 32) List!20836) Bool)

(assert (=> b!989994 (= res!661995 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20833))))

(declare-fun mapNonEmpty!36970 () Bool)

(declare-fun mapRes!36970 () Bool)

(declare-fun tp!69990 () Bool)

(declare-fun e!558232 () Bool)

(assert (=> mapNonEmpty!36970 (= mapRes!36970 (and tp!69990 e!558232))))

(declare-fun mapKey!36970 () (_ BitVec 32))

(declare-fun mapValue!36970 () ValueCell!11159)

(declare-fun mapRest!36970 () (Array (_ BitVec 32) ValueCell!11159))

(assert (=> mapNonEmpty!36970 (= (arr!30114 _values!1278) (store mapRest!36970 mapKey!36970 mapValue!36970))))

(declare-fun b!989995 () Bool)

(declare-fun e!558236 () Bool)

(assert (=> b!989995 (= e!558236 (and e!558233 mapRes!36970))))

(declare-fun condMapEmpty!36970 () Bool)

(declare-fun mapDefault!36970 () ValueCell!11159)

