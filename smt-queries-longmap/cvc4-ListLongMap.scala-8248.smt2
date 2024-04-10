; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100440 () Bool)

(assert start!100440)

(declare-fun b_free!25763 () Bool)

(declare-fun b_next!25763 () Bool)

(assert (=> start!100440 (= b_free!25763 (not b_next!25763))))

(declare-fun tp!90278 () Bool)

(declare-fun b_and!42413 () Bool)

(assert (=> start!100440 (= tp!90278 b_and!42413)))

(declare-fun b!1199188 () Bool)

(declare-fun res!798176 () Bool)

(declare-fun e!681124 () Bool)

(assert (=> b!1199188 (=> (not res!798176) (not e!681124))))

(declare-datatypes ((array!77711 0))(
  ( (array!77712 (arr!37500 (Array (_ BitVec 32) (_ BitVec 64))) (size!38036 (_ BitVec 32))) )
))
(declare-fun lt!543703 () array!77711)

(declare-datatypes ((List!26386 0))(
  ( (Nil!26383) (Cons!26382 (h!27591 (_ BitVec 64)) (t!39129 List!26386)) )
))
(declare-fun arrayNoDuplicates!0 (array!77711 (_ BitVec 32) List!26386) Bool)

(assert (=> b!1199188 (= res!798176 (arrayNoDuplicates!0 lt!543703 #b00000000000000000000000000000000 Nil!26383))))

(declare-fun b!1199189 () Bool)

(declare-fun res!798175 () Bool)

(declare-fun e!681126 () Bool)

(assert (=> b!1199189 (=> (not res!798175) (not e!681126))))

(declare-fun _keys!1208 () array!77711)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77711 (_ BitVec 32)) Bool)

(assert (=> b!1199189 (= res!798175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199190 () Bool)

(declare-fun res!798169 () Bool)

(assert (=> b!1199190 (=> (not res!798169) (not e!681126))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199190 (= res!798169 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38036 _keys!1208))))))

(declare-fun b!1199191 () Bool)

(declare-fun res!798171 () Bool)

(assert (=> b!1199191 (=> (not res!798171) (not e!681126))))

(assert (=> b!1199191 (= res!798171 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26383))))

(declare-fun res!798170 () Bool)

(assert (=> start!100440 (=> (not res!798170) (not e!681126))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100440 (= res!798170 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38036 _keys!1208))))))

(assert (=> start!100440 e!681126))

(declare-fun tp_is_empty!30467 () Bool)

(assert (=> start!100440 tp_is_empty!30467))

(declare-fun array_inv!28576 (array!77711) Bool)

(assert (=> start!100440 (array_inv!28576 _keys!1208)))

(assert (=> start!100440 true))

(assert (=> start!100440 tp!90278))

(declare-datatypes ((V!45749 0))(
  ( (V!45750 (val!15290 Int)) )
))
(declare-datatypes ((ValueCell!14524 0))(
  ( (ValueCellFull!14524 (v!17928 V!45749)) (EmptyCell!14524) )
))
(declare-datatypes ((array!77713 0))(
  ( (array!77714 (arr!37501 (Array (_ BitVec 32) ValueCell!14524)) (size!38037 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77713)

(declare-fun e!681125 () Bool)

(declare-fun array_inv!28577 (array!77713) Bool)

(assert (=> start!100440 (and (array_inv!28577 _values!996) e!681125)))

(declare-fun b!1199192 () Bool)

(declare-fun res!798172 () Bool)

(assert (=> b!1199192 (=> (not res!798172) (not e!681126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199192 (= res!798172 (validMask!0 mask!1564))))

(declare-fun b!1199193 () Bool)

(declare-fun res!798167 () Bool)

(assert (=> b!1199193 (=> (not res!798167) (not e!681126))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199193 (= res!798167 (validKeyInArray!0 k!934))))

(declare-fun b!1199194 () Bool)

(declare-fun e!681129 () Bool)

(assert (=> b!1199194 (= e!681129 tp_is_empty!30467)))

(declare-fun b!1199195 () Bool)

(assert (=> b!1199195 (= e!681126 e!681124)))

(declare-fun res!798173 () Bool)

(assert (=> b!1199195 (=> (not res!798173) (not e!681124))))

(assert (=> b!1199195 (= res!798173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543703 mask!1564))))

(assert (=> b!1199195 (= lt!543703 (array!77712 (store (arr!37500 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38036 _keys!1208)))))

(declare-fun mapNonEmpty!47543 () Bool)

(declare-fun mapRes!47543 () Bool)

(declare-fun tp!90279 () Bool)

(declare-fun e!681130 () Bool)

(assert (=> mapNonEmpty!47543 (= mapRes!47543 (and tp!90279 e!681130))))

(declare-fun mapKey!47543 () (_ BitVec 32))

(declare-fun mapRest!47543 () (Array (_ BitVec 32) ValueCell!14524))

(declare-fun mapValue!47543 () ValueCell!14524)

(assert (=> mapNonEmpty!47543 (= (arr!37501 _values!996) (store mapRest!47543 mapKey!47543 mapValue!47543))))

(declare-fun b!1199196 () Bool)

(declare-fun res!798168 () Bool)

(assert (=> b!1199196 (=> (not res!798168) (not e!681126))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199196 (= res!798168 (and (= (size!38037 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38036 _keys!1208) (size!38037 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199197 () Bool)

(declare-fun res!798177 () Bool)

(assert (=> b!1199197 (=> (not res!798177) (not e!681126))))

(assert (=> b!1199197 (= res!798177 (= (select (arr!37500 _keys!1208) i!673) k!934))))

(declare-fun b!1199198 () Bool)

(assert (=> b!1199198 (= e!681130 tp_is_empty!30467)))

(declare-fun mapIsEmpty!47543 () Bool)

(assert (=> mapIsEmpty!47543 mapRes!47543))

(declare-fun b!1199199 () Bool)

(declare-fun e!681128 () Bool)

(assert (=> b!1199199 (= e!681128 true)))

(declare-fun zeroValue!944 () V!45749)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19570 0))(
  ( (tuple2!19571 (_1!9796 (_ BitVec 64)) (_2!9796 V!45749)) )
))
(declare-datatypes ((List!26387 0))(
  ( (Nil!26384) (Cons!26383 (h!27592 tuple2!19570) (t!39130 List!26387)) )
))
(declare-datatypes ((ListLongMap!17539 0))(
  ( (ListLongMap!17540 (toList!8785 List!26387)) )
))
(declare-fun lt!543702 () ListLongMap!17539)

(declare-fun minValue!944 () V!45749)

(declare-fun getCurrentListMapNoExtraKeys!5224 (array!77711 array!77713 (_ BitVec 32) (_ BitVec 32) V!45749 V!45749 (_ BitVec 32) Int) ListLongMap!17539)

(declare-fun dynLambda!3144 (Int (_ BitVec 64)) V!45749)

(assert (=> b!1199199 (= lt!543702 (getCurrentListMapNoExtraKeys!5224 lt!543703 (array!77714 (store (arr!37501 _values!996) i!673 (ValueCellFull!14524 (dynLambda!3144 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38037 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543701 () ListLongMap!17539)

(assert (=> b!1199199 (= lt!543701 (getCurrentListMapNoExtraKeys!5224 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199200 () Bool)

(assert (=> b!1199200 (= e!681125 (and e!681129 mapRes!47543))))

(declare-fun condMapEmpty!47543 () Bool)

(declare-fun mapDefault!47543 () ValueCell!14524)

