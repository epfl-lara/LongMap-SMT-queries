; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100484 () Bool)

(assert start!100484)

(declare-fun b_free!25807 () Bool)

(declare-fun b_next!25807 () Bool)

(assert (=> start!100484 (= b_free!25807 (not b_next!25807))))

(declare-fun tp!90410 () Bool)

(declare-fun b_and!42501 () Bool)

(assert (=> start!100484 (= tp!90410 b_and!42501)))

(declare-fun b!1200156 () Bool)

(declare-fun res!798899 () Bool)

(declare-fun e!681589 () Bool)

(assert (=> b!1200156 (=> (not res!798899) (not e!681589))))

(declare-datatypes ((array!77795 0))(
  ( (array!77796 (arr!37542 (Array (_ BitVec 32) (_ BitVec 64))) (size!38078 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77795)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1200156 (= res!798899 (= (select (arr!37542 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!47609 () Bool)

(declare-fun mapRes!47609 () Bool)

(assert (=> mapIsEmpty!47609 mapRes!47609))

(declare-fun b!1200157 () Bool)

(declare-fun e!681592 () Bool)

(declare-fun tp_is_empty!30511 () Bool)

(assert (=> b!1200157 (= e!681592 tp_is_empty!30511)))

(declare-fun b!1200158 () Bool)

(declare-fun e!681586 () Bool)

(assert (=> b!1200158 (= e!681586 true)))

(declare-datatypes ((V!45809 0))(
  ( (V!45810 (val!15312 Int)) )
))
(declare-fun zeroValue!944 () V!45809)

(declare-datatypes ((tuple2!19600 0))(
  ( (tuple2!19601 (_1!9811 (_ BitVec 64)) (_2!9811 V!45809)) )
))
(declare-datatypes ((List!26419 0))(
  ( (Nil!26416) (Cons!26415 (h!27624 tuple2!19600) (t!39206 List!26419)) )
))
(declare-datatypes ((ListLongMap!17569 0))(
  ( (ListLongMap!17570 (toList!8800 List!26419)) )
))
(declare-fun lt!543967 () ListLongMap!17569)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!543964 () array!77795)

(declare-datatypes ((ValueCell!14546 0))(
  ( (ValueCellFull!14546 (v!17950 V!45809)) (EmptyCell!14546) )
))
(declare-datatypes ((array!77797 0))(
  ( (array!77798 (arr!37543 (Array (_ BitVec 32) ValueCell!14546)) (size!38079 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77797)

(declare-fun minValue!944 () V!45809)

(declare-fun getCurrentListMapNoExtraKeys!5239 (array!77795 array!77797 (_ BitVec 32) (_ BitVec 32) V!45809 V!45809 (_ BitVec 32) Int) ListLongMap!17569)

(declare-fun dynLambda!3159 (Int (_ BitVec 64)) V!45809)

(assert (=> b!1200158 (= lt!543967 (getCurrentListMapNoExtraKeys!5239 lt!543964 (array!77798 (store (arr!37543 _values!996) i!673 (ValueCellFull!14546 (dynLambda!3159 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38079 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543966 () ListLongMap!17569)

(assert (=> b!1200158 (= lt!543966 (getCurrentListMapNoExtraKeys!5239 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200159 () Bool)

(declare-fun res!798903 () Bool)

(assert (=> b!1200159 (=> (not res!798903) (not e!681589))))

(declare-datatypes ((List!26420 0))(
  ( (Nil!26417) (Cons!26416 (h!27625 (_ BitVec 64)) (t!39207 List!26420)) )
))
(declare-fun arrayNoDuplicates!0 (array!77795 (_ BitVec 32) List!26420) Bool)

(assert (=> b!1200159 (= res!798903 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26417))))

(declare-fun b!1200160 () Bool)

(declare-fun res!798897 () Bool)

(assert (=> b!1200160 (=> (not res!798897) (not e!681589))))

(assert (=> b!1200160 (= res!798897 (and (= (size!38079 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38078 _keys!1208) (size!38079 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200161 () Bool)

(declare-fun e!681587 () Bool)

(assert (=> b!1200161 (= e!681589 e!681587)))

(declare-fun res!798896 () Bool)

(assert (=> b!1200161 (=> (not res!798896) (not e!681587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77795 (_ BitVec 32)) Bool)

(assert (=> b!1200161 (= res!798896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543964 mask!1564))))

(assert (=> b!1200161 (= lt!543964 (array!77796 (store (arr!37542 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38078 _keys!1208)))))

(declare-fun res!798893 () Bool)

(assert (=> start!100484 (=> (not res!798893) (not e!681589))))

(assert (=> start!100484 (= res!798893 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38078 _keys!1208))))))

(assert (=> start!100484 e!681589))

(assert (=> start!100484 tp_is_empty!30511))

(declare-fun array_inv!28610 (array!77795) Bool)

(assert (=> start!100484 (array_inv!28610 _keys!1208)))

(assert (=> start!100484 true))

(assert (=> start!100484 tp!90410))

(declare-fun e!681591 () Bool)

(declare-fun array_inv!28611 (array!77797) Bool)

(assert (=> start!100484 (and (array_inv!28611 _values!996) e!681591)))

(declare-fun b!1200162 () Bool)

(declare-fun res!798900 () Bool)

(assert (=> b!1200162 (=> (not res!798900) (not e!681589))))

(assert (=> b!1200162 (= res!798900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200163 () Bool)

(declare-fun e!681588 () Bool)

(assert (=> b!1200163 (= e!681588 tp_is_empty!30511)))

(declare-fun b!1200164 () Bool)

(declare-fun res!798894 () Bool)

(assert (=> b!1200164 (=> (not res!798894) (not e!681587))))

(assert (=> b!1200164 (= res!798894 (arrayNoDuplicates!0 lt!543964 #b00000000000000000000000000000000 Nil!26417))))

(declare-fun mapNonEmpty!47609 () Bool)

(declare-fun tp!90411 () Bool)

(assert (=> mapNonEmpty!47609 (= mapRes!47609 (and tp!90411 e!681592))))

(declare-fun mapValue!47609 () ValueCell!14546)

(declare-fun mapRest!47609 () (Array (_ BitVec 32) ValueCell!14546))

(declare-fun mapKey!47609 () (_ BitVec 32))

(assert (=> mapNonEmpty!47609 (= (arr!37543 _values!996) (store mapRest!47609 mapKey!47609 mapValue!47609))))

(declare-fun b!1200165 () Bool)

(assert (=> b!1200165 (= e!681587 (not e!681586))))

(declare-fun res!798898 () Bool)

(assert (=> b!1200165 (=> res!798898 e!681586)))

(assert (=> b!1200165 (= res!798898 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200165 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39790 0))(
  ( (Unit!39791) )
))
(declare-fun lt!543965 () Unit!39790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77795 (_ BitVec 64) (_ BitVec 32)) Unit!39790)

(assert (=> b!1200165 (= lt!543965 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1200166 () Bool)

(assert (=> b!1200166 (= e!681591 (and e!681588 mapRes!47609))))

(declare-fun condMapEmpty!47609 () Bool)

(declare-fun mapDefault!47609 () ValueCell!14546)

