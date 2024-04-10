; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100292 () Bool)

(assert start!100292)

(declare-fun b!1196568 () Bool)

(declare-fun res!796332 () Bool)

(declare-fun e!679826 () Bool)

(assert (=> b!1196568 (=> (not res!796332) (not e!679826))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196568 (= res!796332 (validKeyInArray!0 k!934))))

(declare-datatypes ((array!77497 0))(
  ( (array!77498 (arr!37395 (Array (_ BitVec 32) (_ BitVec 64))) (size!37931 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77497)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1196569 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!679830 () Bool)

(assert (=> b!1196569 (= e!679830 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37931 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvsub (size!37931 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!37931 _keys!1208) from!1455)))))))

(declare-fun arrayContainsKey!0 (array!77497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196569 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39678 0))(
  ( (Unit!39679) )
))
(declare-fun lt!543102 () Unit!39678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77497 (_ BitVec 64) (_ BitVec 32)) Unit!39678)

(assert (=> b!1196569 (= lt!543102 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1196570 () Bool)

(declare-fun res!796334 () Bool)

(assert (=> b!1196570 (=> (not res!796334) (not e!679830))))

(declare-fun lt!543101 () array!77497)

(declare-datatypes ((List!26306 0))(
  ( (Nil!26303) (Cons!26302 (h!27511 (_ BitVec 64)) (t!38977 List!26306)) )
))
(declare-fun arrayNoDuplicates!0 (array!77497 (_ BitVec 32) List!26306) Bool)

(assert (=> b!1196570 (= res!796334 (arrayNoDuplicates!0 lt!543101 #b00000000000000000000000000000000 Nil!26303))))

(declare-fun b!1196571 () Bool)

(declare-fun res!796335 () Bool)

(assert (=> b!1196571 (=> (not res!796335) (not e!679826))))

(assert (=> b!1196571 (= res!796335 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37931 _keys!1208))))))

(declare-fun b!1196572 () Bool)

(declare-fun e!679829 () Bool)

(declare-fun tp_is_empty!30359 () Bool)

(assert (=> b!1196572 (= e!679829 tp_is_empty!30359)))

(declare-fun b!1196573 () Bool)

(declare-fun e!679828 () Bool)

(assert (=> b!1196573 (= e!679828 tp_is_empty!30359)))

(declare-fun mapNonEmpty!47375 () Bool)

(declare-fun mapRes!47375 () Bool)

(declare-fun tp!89985 () Bool)

(assert (=> mapNonEmpty!47375 (= mapRes!47375 (and tp!89985 e!679829))))

(declare-datatypes ((V!45605 0))(
  ( (V!45606 (val!15236 Int)) )
))
(declare-datatypes ((ValueCell!14470 0))(
  ( (ValueCellFull!14470 (v!17874 V!45605)) (EmptyCell!14470) )
))
(declare-fun mapRest!47375 () (Array (_ BitVec 32) ValueCell!14470))

(declare-fun mapKey!47375 () (_ BitVec 32))

(declare-datatypes ((array!77499 0))(
  ( (array!77500 (arr!37396 (Array (_ BitVec 32) ValueCell!14470)) (size!37932 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77499)

(declare-fun mapValue!47375 () ValueCell!14470)

(assert (=> mapNonEmpty!47375 (= (arr!37396 _values!996) (store mapRest!47375 mapKey!47375 mapValue!47375))))

(declare-fun mapIsEmpty!47375 () Bool)

(assert (=> mapIsEmpty!47375 mapRes!47375))

(declare-fun b!1196574 () Bool)

(declare-fun res!796327 () Bool)

(assert (=> b!1196574 (=> (not res!796327) (not e!679826))))

(assert (=> b!1196574 (= res!796327 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26303))))

(declare-fun b!1196575 () Bool)

(declare-fun res!796328 () Bool)

(assert (=> b!1196575 (=> (not res!796328) (not e!679826))))

(assert (=> b!1196575 (= res!796328 (= (select (arr!37395 _keys!1208) i!673) k!934))))

(declare-fun b!1196576 () Bool)

(declare-fun res!796333 () Bool)

(assert (=> b!1196576 (=> (not res!796333) (not e!679826))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77497 (_ BitVec 32)) Bool)

(assert (=> b!1196576 (= res!796333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!796329 () Bool)

(assert (=> start!100292 (=> (not res!796329) (not e!679826))))

(assert (=> start!100292 (= res!796329 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37931 _keys!1208))))))

(assert (=> start!100292 e!679826))

(declare-fun array_inv!28502 (array!77497) Bool)

(assert (=> start!100292 (array_inv!28502 _keys!1208)))

(assert (=> start!100292 true))

(declare-fun e!679827 () Bool)

(declare-fun array_inv!28503 (array!77499) Bool)

(assert (=> start!100292 (and (array_inv!28503 _values!996) e!679827)))

(declare-fun b!1196577 () Bool)

(declare-fun res!796331 () Bool)

(assert (=> b!1196577 (=> (not res!796331) (not e!679826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196577 (= res!796331 (validMask!0 mask!1564))))

(declare-fun b!1196578 () Bool)

(assert (=> b!1196578 (= e!679826 e!679830)))

(declare-fun res!796336 () Bool)

(assert (=> b!1196578 (=> (not res!796336) (not e!679830))))

(assert (=> b!1196578 (= res!796336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543101 mask!1564))))

(assert (=> b!1196578 (= lt!543101 (array!77498 (store (arr!37395 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37931 _keys!1208)))))

(declare-fun b!1196579 () Bool)

(assert (=> b!1196579 (= e!679827 (and e!679828 mapRes!47375))))

(declare-fun condMapEmpty!47375 () Bool)

(declare-fun mapDefault!47375 () ValueCell!14470)

