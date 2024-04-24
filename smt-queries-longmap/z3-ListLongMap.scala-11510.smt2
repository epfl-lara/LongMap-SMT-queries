; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134356 () Bool)

(assert start!134356)

(declare-fun b_free!32167 () Bool)

(declare-fun b_next!32167 () Bool)

(assert (=> start!134356 (= b_free!32167 (not b_next!32167))))

(declare-fun tp!113802 () Bool)

(declare-fun b_and!51777 () Bool)

(assert (=> start!134356 (= tp!113802 b_and!51777)))

(declare-fun res!1071175 () Bool)

(declare-fun e!874253 () Bool)

(assert (=> start!134356 (=> (not res!1071175) (not e!874253))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134356 (= res!1071175 (validMask!0 mask!947))))

(assert (=> start!134356 e!874253))

(assert (=> start!134356 tp!113802))

(declare-fun tp_is_empty!38941 () Bool)

(assert (=> start!134356 tp_is_empty!38941))

(assert (=> start!134356 true))

(declare-datatypes ((array!104690 0))(
  ( (array!104691 (arr!50525 (Array (_ BitVec 32) (_ BitVec 64))) (size!51076 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104690)

(declare-fun array_inv!39499 (array!104690) Bool)

(assert (=> start!134356 (array_inv!39499 _keys!637)))

(declare-datatypes ((V!60129 0))(
  ( (V!60130 (val!19554 Int)) )
))
(declare-datatypes ((ValueCell!18440 0))(
  ( (ValueCellFull!18440 (v!22302 V!60129)) (EmptyCell!18440) )
))
(declare-datatypes ((array!104692 0))(
  ( (array!104693 (arr!50526 (Array (_ BitVec 32) ValueCell!18440)) (size!51077 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104692)

(declare-fun e!874255 () Bool)

(declare-fun array_inv!39500 (array!104692) Bool)

(assert (=> start!134356 (and (array_inv!39500 _values!487) e!874255)))

(declare-fun b!1568220 () Bool)

(declare-fun e!874257 () Bool)

(assert (=> b!1568220 (= e!874257 true)))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((tuple2!25282 0))(
  ( (tuple2!25283 (_1!12652 (_ BitVec 64)) (_2!12652 V!60129)) )
))
(declare-datatypes ((List!36647 0))(
  ( (Nil!36644) (Cons!36643 (h!38107 tuple2!25282) (t!51520 List!36647)) )
))
(declare-datatypes ((ListLongMap!22725 0))(
  ( (ListLongMap!22726 (toList!11378 List!36647)) )
))
(declare-fun lt!673325 () ListLongMap!22725)

(declare-fun lt!673324 () Bool)

(declare-fun contains!10381 (ListLongMap!22725 (_ BitVec 64)) Bool)

(assert (=> b!1568220 (= lt!673324 (contains!10381 lt!673325 (select (arr!50525 _keys!637) from!782)))))

(declare-fun b!1568221 () Bool)

(declare-fun res!1071178 () Bool)

(assert (=> b!1568221 (=> (not res!1071178) (not e!874253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568221 (= res!1071178 (validKeyInArray!0 (select (arr!50525 _keys!637) from!782)))))

(declare-fun b!1568222 () Bool)

(declare-fun res!1071176 () Bool)

(assert (=> b!1568222 (=> (not res!1071176) (not e!874253))))

(declare-datatypes ((List!36648 0))(
  ( (Nil!36645) (Cons!36644 (h!38108 (_ BitVec 64)) (t!51521 List!36648)) )
))
(declare-fun arrayNoDuplicates!0 (array!104690 (_ BitVec 32) List!36648) Bool)

(assert (=> b!1568222 (= res!1071176 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36645))))

(declare-fun b!1568223 () Bool)

(assert (=> b!1568223 (= e!874253 (not e!874257))))

(declare-fun res!1071177 () Bool)

(assert (=> b!1568223 (=> res!1071177 e!874257)))

(assert (=> b!1568223 (= res!1071177 (contains!10381 lt!673325 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568223 (not (contains!10381 lt!673325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673327 () ListLongMap!22725)

(declare-fun lt!673323 () V!60129)

(declare-fun +!5116 (ListLongMap!22725 tuple2!25282) ListLongMap!22725)

(assert (=> b!1568223 (= lt!673325 (+!5116 lt!673327 (tuple2!25283 (select (arr!50525 _keys!637) from!782) lt!673323)))))

(declare-datatypes ((Unit!51927 0))(
  ( (Unit!51928) )
))
(declare-fun lt!673326 () Unit!51927)

(declare-fun addStillNotContains!567 (ListLongMap!22725 (_ BitVec 64) V!60129 (_ BitVec 64)) Unit!51927)

(assert (=> b!1568223 (= lt!673326 (addStillNotContains!567 lt!673327 (select (arr!50525 _keys!637) from!782) lt!673323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26388 (ValueCell!18440 V!60129) V!60129)

(declare-fun dynLambda!3914 (Int (_ BitVec 64)) V!60129)

(assert (=> b!1568223 (= lt!673323 (get!26388 (select (arr!50526 _values!487) from!782) (dynLambda!3914 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60129)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60129)

(declare-fun getCurrentListMapNoExtraKeys!6761 (array!104690 array!104692 (_ BitVec 32) (_ BitVec 32) V!60129 V!60129 (_ BitVec 32) Int) ListLongMap!22725)

(assert (=> b!1568223 (= lt!673327 (getCurrentListMapNoExtraKeys!6761 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59803 () Bool)

(declare-fun mapRes!59803 () Bool)

(assert (=> mapIsEmpty!59803 mapRes!59803))

(declare-fun b!1568224 () Bool)

(declare-fun e!874254 () Bool)

(assert (=> b!1568224 (= e!874254 tp_is_empty!38941)))

(declare-fun b!1568225 () Bool)

(declare-fun res!1071179 () Bool)

(assert (=> b!1568225 (=> (not res!1071179) (not e!874253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104690 (_ BitVec 32)) Bool)

(assert (=> b!1568225 (= res!1071179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1568226 () Bool)

(declare-fun res!1071180 () Bool)

(assert (=> b!1568226 (=> (not res!1071180) (not e!874253))))

(assert (=> b!1568226 (= res!1071180 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51076 _keys!637)) (bvslt from!782 (size!51076 _keys!637))))))

(declare-fun b!1568227 () Bool)

(declare-fun e!874258 () Bool)

(assert (=> b!1568227 (= e!874255 (and e!874258 mapRes!59803))))

(declare-fun condMapEmpty!59803 () Bool)

(declare-fun mapDefault!59803 () ValueCell!18440)

(assert (=> b!1568227 (= condMapEmpty!59803 (= (arr!50526 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18440)) mapDefault!59803)))))

(declare-fun b!1568228 () Bool)

(declare-fun res!1071174 () Bool)

(assert (=> b!1568228 (=> (not res!1071174) (not e!874253))))

(assert (=> b!1568228 (= res!1071174 (and (= (size!51077 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51076 _keys!637) (size!51077 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59803 () Bool)

(declare-fun tp!113803 () Bool)

(assert (=> mapNonEmpty!59803 (= mapRes!59803 (and tp!113803 e!874254))))

(declare-fun mapKey!59803 () (_ BitVec 32))

(declare-fun mapRest!59803 () (Array (_ BitVec 32) ValueCell!18440))

(declare-fun mapValue!59803 () ValueCell!18440)

(assert (=> mapNonEmpty!59803 (= (arr!50526 _values!487) (store mapRest!59803 mapKey!59803 mapValue!59803))))

(declare-fun b!1568229 () Bool)

(assert (=> b!1568229 (= e!874258 tp_is_empty!38941)))

(assert (= (and start!134356 res!1071175) b!1568228))

(assert (= (and b!1568228 res!1071174) b!1568225))

(assert (= (and b!1568225 res!1071179) b!1568222))

(assert (= (and b!1568222 res!1071176) b!1568226))

(assert (= (and b!1568226 res!1071180) b!1568221))

(assert (= (and b!1568221 res!1071178) b!1568223))

(assert (= (and b!1568223 (not res!1071177)) b!1568220))

(assert (= (and b!1568227 condMapEmpty!59803) mapIsEmpty!59803))

(assert (= (and b!1568227 (not condMapEmpty!59803)) mapNonEmpty!59803))

(get-info :version)

(assert (= (and mapNonEmpty!59803 ((_ is ValueCellFull!18440) mapValue!59803)) b!1568224))

(assert (= (and b!1568227 ((_ is ValueCellFull!18440) mapDefault!59803)) b!1568229))

(assert (= start!134356 b!1568227))

(declare-fun b_lambda!24975 () Bool)

(assert (=> (not b_lambda!24975) (not b!1568223)))

(declare-fun t!51519 () Bool)

(declare-fun tb!12627 () Bool)

(assert (=> (and start!134356 (= defaultEntry!495 defaultEntry!495) t!51519) tb!12627))

(declare-fun result!26553 () Bool)

(assert (=> tb!12627 (= result!26553 tp_is_empty!38941)))

(assert (=> b!1568223 t!51519))

(declare-fun b_and!51779 () Bool)

(assert (= b_and!51777 (and (=> t!51519 result!26553) b_and!51779)))

(declare-fun m!1442965 () Bool)

(assert (=> b!1568221 m!1442965))

(assert (=> b!1568221 m!1442965))

(declare-fun m!1442967 () Bool)

(assert (=> b!1568221 m!1442967))

(declare-fun m!1442969 () Bool)

(assert (=> b!1568223 m!1442969))

(declare-fun m!1442971 () Bool)

(assert (=> b!1568223 m!1442971))

(declare-fun m!1442973 () Bool)

(assert (=> b!1568223 m!1442973))

(assert (=> b!1568223 m!1442965))

(declare-fun m!1442975 () Bool)

(assert (=> b!1568223 m!1442975))

(assert (=> b!1568223 m!1442969))

(assert (=> b!1568223 m!1442965))

(declare-fun m!1442977 () Bool)

(assert (=> b!1568223 m!1442977))

(declare-fun m!1442979 () Bool)

(assert (=> b!1568223 m!1442979))

(assert (=> b!1568223 m!1442971))

(declare-fun m!1442981 () Bool)

(assert (=> b!1568223 m!1442981))

(declare-fun m!1442983 () Bool)

(assert (=> b!1568223 m!1442983))

(assert (=> b!1568220 m!1442965))

(assert (=> b!1568220 m!1442965))

(declare-fun m!1442985 () Bool)

(assert (=> b!1568220 m!1442985))

(declare-fun m!1442987 () Bool)

(assert (=> b!1568225 m!1442987))

(declare-fun m!1442989 () Bool)

(assert (=> b!1568222 m!1442989))

(declare-fun m!1442991 () Bool)

(assert (=> mapNonEmpty!59803 m!1442991))

(declare-fun m!1442993 () Bool)

(assert (=> start!134356 m!1442993))

(declare-fun m!1442995 () Bool)

(assert (=> start!134356 m!1442995))

(declare-fun m!1442997 () Bool)

(assert (=> start!134356 m!1442997))

(check-sat (not b!1568223) (not b!1568221) b_and!51779 (not b_next!32167) tp_is_empty!38941 (not b!1568220) (not b!1568225) (not start!134356) (not mapNonEmpty!59803) (not b_lambda!24975) (not b!1568222))
(check-sat b_and!51779 (not b_next!32167))
