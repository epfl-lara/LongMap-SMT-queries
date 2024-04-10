; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100452 () Bool)

(assert start!100452)

(declare-fun b_free!25775 () Bool)

(declare-fun b_next!25775 () Bool)

(assert (=> start!100452 (= b_free!25775 (not b_next!25775))))

(declare-fun tp!90315 () Bool)

(declare-fun b_and!42437 () Bool)

(assert (=> start!100452 (= tp!90315 b_and!42437)))

(declare-fun b!1199452 () Bool)

(declare-fun e!681255 () Bool)

(assert (=> b!1199452 (= e!681255 true)))

(declare-datatypes ((V!45765 0))(
  ( (V!45766 (val!15296 Int)) )
))
(declare-fun zeroValue!944 () V!45765)

(declare-datatypes ((array!77733 0))(
  ( (array!77734 (arr!37511 (Array (_ BitVec 32) (_ BitVec 64))) (size!38047 (_ BitVec 32))) )
))
(declare-fun lt!543772 () array!77733)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45765)

(declare-datatypes ((ValueCell!14530 0))(
  ( (ValueCellFull!14530 (v!17934 V!45765)) (EmptyCell!14530) )
))
(declare-datatypes ((array!77735 0))(
  ( (array!77736 (arr!37512 (Array (_ BitVec 32) ValueCell!14530)) (size!38048 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77735)

(declare-datatypes ((tuple2!19580 0))(
  ( (tuple2!19581 (_1!9801 (_ BitVec 64)) (_2!9801 V!45765)) )
))
(declare-datatypes ((List!26396 0))(
  ( (Nil!26393) (Cons!26392 (h!27601 tuple2!19580) (t!39151 List!26396)) )
))
(declare-datatypes ((ListLongMap!17549 0))(
  ( (ListLongMap!17550 (toList!8790 List!26396)) )
))
(declare-fun lt!543773 () ListLongMap!17549)

(declare-fun getCurrentListMapNoExtraKeys!5229 (array!77733 array!77735 (_ BitVec 32) (_ BitVec 32) V!45765 V!45765 (_ BitVec 32) Int) ListLongMap!17549)

(declare-fun dynLambda!3149 (Int (_ BitVec 64)) V!45765)

(assert (=> b!1199452 (= lt!543773 (getCurrentListMapNoExtraKeys!5229 lt!543772 (array!77736 (store (arr!37512 _values!996) i!673 (ValueCellFull!14530 (dynLambda!3149 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38048 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77733)

(declare-fun lt!543775 () ListLongMap!17549)

(assert (=> b!1199452 (= lt!543775 (getCurrentListMapNoExtraKeys!5229 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47561 () Bool)

(declare-fun mapRes!47561 () Bool)

(assert (=> mapIsEmpty!47561 mapRes!47561))

(declare-fun b!1199453 () Bool)

(declare-fun res!798367 () Bool)

(declare-fun e!681254 () Bool)

(assert (=> b!1199453 (=> (not res!798367) (not e!681254))))

(assert (=> b!1199453 (= res!798367 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38047 _keys!1208))))))

(declare-fun b!1199454 () Bool)

(declare-fun e!681256 () Bool)

(declare-fun tp_is_empty!30479 () Bool)

(assert (=> b!1199454 (= e!681256 tp_is_empty!30479)))

(declare-fun b!1199455 () Bool)

(declare-fun e!681251 () Bool)

(assert (=> b!1199455 (= e!681251 (not e!681255))))

(declare-fun res!798372 () Bool)

(assert (=> b!1199455 (=> res!798372 e!681255)))

(assert (=> b!1199455 (= res!798372 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199455 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39766 0))(
  ( (Unit!39767) )
))
(declare-fun lt!543774 () Unit!39766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77733 (_ BitVec 64) (_ BitVec 32)) Unit!39766)

(assert (=> b!1199455 (= lt!543774 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1199456 () Bool)

(declare-fun res!798369 () Bool)

(assert (=> b!1199456 (=> (not res!798369) (not e!681254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77733 (_ BitVec 32)) Bool)

(assert (=> b!1199456 (= res!798369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199458 () Bool)

(declare-fun res!798368 () Bool)

(assert (=> b!1199458 (=> (not res!798368) (not e!681254))))

(assert (=> b!1199458 (= res!798368 (and (= (size!38048 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38047 _keys!1208) (size!38048 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199459 () Bool)

(assert (=> b!1199459 (= e!681254 e!681251)))

(declare-fun res!798370 () Bool)

(assert (=> b!1199459 (=> (not res!798370) (not e!681251))))

(assert (=> b!1199459 (= res!798370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543772 mask!1564))))

(assert (=> b!1199459 (= lt!543772 (array!77734 (store (arr!37511 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38047 _keys!1208)))))

(declare-fun b!1199460 () Bool)

(declare-fun res!798373 () Bool)

(assert (=> b!1199460 (=> (not res!798373) (not e!681254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199460 (= res!798373 (validMask!0 mask!1564))))

(declare-fun b!1199461 () Bool)

(declare-fun res!798375 () Bool)

(assert (=> b!1199461 (=> (not res!798375) (not e!681254))))

(assert (=> b!1199461 (= res!798375 (= (select (arr!37511 _keys!1208) i!673) k!934))))

(declare-fun b!1199462 () Bool)

(declare-fun res!798371 () Bool)

(assert (=> b!1199462 (=> (not res!798371) (not e!681254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199462 (= res!798371 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!47561 () Bool)

(declare-fun tp!90314 () Bool)

(declare-fun e!681253 () Bool)

(assert (=> mapNonEmpty!47561 (= mapRes!47561 (and tp!90314 e!681253))))

(declare-fun mapValue!47561 () ValueCell!14530)

(declare-fun mapRest!47561 () (Array (_ BitVec 32) ValueCell!14530))

(declare-fun mapKey!47561 () (_ BitVec 32))

(assert (=> mapNonEmpty!47561 (= (arr!37512 _values!996) (store mapRest!47561 mapKey!47561 mapValue!47561))))

(declare-fun b!1199463 () Bool)

(declare-fun res!798374 () Bool)

(assert (=> b!1199463 (=> (not res!798374) (not e!681254))))

(declare-datatypes ((List!26397 0))(
  ( (Nil!26394) (Cons!26393 (h!27602 (_ BitVec 64)) (t!39152 List!26397)) )
))
(declare-fun arrayNoDuplicates!0 (array!77733 (_ BitVec 32) List!26397) Bool)

(assert (=> b!1199463 (= res!798374 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26394))))

(declare-fun res!798366 () Bool)

(assert (=> start!100452 (=> (not res!798366) (not e!681254))))

(assert (=> start!100452 (= res!798366 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38047 _keys!1208))))))

(assert (=> start!100452 e!681254))

(assert (=> start!100452 tp_is_empty!30479))

(declare-fun array_inv!28582 (array!77733) Bool)

(assert (=> start!100452 (array_inv!28582 _keys!1208)))

(assert (=> start!100452 true))

(assert (=> start!100452 tp!90315))

(declare-fun e!681250 () Bool)

(declare-fun array_inv!28583 (array!77735) Bool)

(assert (=> start!100452 (and (array_inv!28583 _values!996) e!681250)))

(declare-fun b!1199457 () Bool)

(assert (=> b!1199457 (= e!681250 (and e!681256 mapRes!47561))))

(declare-fun condMapEmpty!47561 () Bool)

(declare-fun mapDefault!47561 () ValueCell!14530)

