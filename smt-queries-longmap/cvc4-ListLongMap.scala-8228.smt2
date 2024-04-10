; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100280 () Bool)

(assert start!100280)

(declare-fun b!1196334 () Bool)

(declare-fun e!679720 () Bool)

(declare-fun tp_is_empty!30347 () Bool)

(assert (=> b!1196334 (= e!679720 tp_is_empty!30347)))

(declare-fun b!1196335 () Bool)

(declare-fun e!679721 () Bool)

(assert (=> b!1196335 (= e!679721 (not true))))

(declare-datatypes ((array!77475 0))(
  ( (array!77476 (arr!37384 (Array (_ BitVec 32) (_ BitVec 64))) (size!37920 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77475)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196335 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39668 0))(
  ( (Unit!39669) )
))
(declare-fun lt!543065 () Unit!39668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77475 (_ BitVec 64) (_ BitVec 32)) Unit!39668)

(assert (=> b!1196335 (= lt!543065 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47357 () Bool)

(declare-fun mapRes!47357 () Bool)

(declare-fun tp!89967 () Bool)

(declare-fun e!679718 () Bool)

(assert (=> mapNonEmpty!47357 (= mapRes!47357 (and tp!89967 e!679718))))

(declare-datatypes ((V!45589 0))(
  ( (V!45590 (val!15230 Int)) )
))
(declare-datatypes ((ValueCell!14464 0))(
  ( (ValueCellFull!14464 (v!17868 V!45589)) (EmptyCell!14464) )
))
(declare-fun mapValue!47357 () ValueCell!14464)

(declare-fun mapRest!47357 () (Array (_ BitVec 32) ValueCell!14464))

(declare-fun mapKey!47357 () (_ BitVec 32))

(declare-datatypes ((array!77477 0))(
  ( (array!77478 (arr!37385 (Array (_ BitVec 32) ValueCell!14464)) (size!37921 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77477)

(assert (=> mapNonEmpty!47357 (= (arr!37385 _values!996) (store mapRest!47357 mapKey!47357 mapValue!47357))))

(declare-fun b!1196336 () Bool)

(declare-fun res!796151 () Bool)

(declare-fun e!679723 () Bool)

(assert (=> b!1196336 (=> (not res!796151) (not e!679723))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196336 (= res!796151 (validMask!0 mask!1564))))

(declare-fun b!1196337 () Bool)

(declare-fun res!796153 () Bool)

(assert (=> b!1196337 (=> (not res!796153) (not e!679723))))

(declare-datatypes ((List!26301 0))(
  ( (Nil!26298) (Cons!26297 (h!27506 (_ BitVec 64)) (t!38972 List!26301)) )
))
(declare-fun arrayNoDuplicates!0 (array!77475 (_ BitVec 32) List!26301) Bool)

(assert (=> b!1196337 (= res!796153 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26298))))

(declare-fun mapIsEmpty!47357 () Bool)

(assert (=> mapIsEmpty!47357 mapRes!47357))

(declare-fun b!1196338 () Bool)

(assert (=> b!1196338 (= e!679723 e!679721)))

(declare-fun res!796147 () Bool)

(assert (=> b!1196338 (=> (not res!796147) (not e!679721))))

(declare-fun lt!543066 () array!77475)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77475 (_ BitVec 32)) Bool)

(assert (=> b!1196338 (= res!796147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543066 mask!1564))))

(assert (=> b!1196338 (= lt!543066 (array!77476 (store (arr!37384 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37920 _keys!1208)))))

(declare-fun res!796150 () Bool)

(assert (=> start!100280 (=> (not res!796150) (not e!679723))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100280 (= res!796150 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37920 _keys!1208))))))

(assert (=> start!100280 e!679723))

(declare-fun array_inv!28494 (array!77475) Bool)

(assert (=> start!100280 (array_inv!28494 _keys!1208)))

(assert (=> start!100280 true))

(declare-fun e!679722 () Bool)

(declare-fun array_inv!28495 (array!77477) Bool)

(assert (=> start!100280 (and (array_inv!28495 _values!996) e!679722)))

(declare-fun b!1196339 () Bool)

(declare-fun res!796149 () Bool)

(assert (=> b!1196339 (=> (not res!796149) (not e!679721))))

(assert (=> b!1196339 (= res!796149 (arrayNoDuplicates!0 lt!543066 #b00000000000000000000000000000000 Nil!26298))))

(declare-fun b!1196340 () Bool)

(declare-fun res!796148 () Bool)

(assert (=> b!1196340 (=> (not res!796148) (not e!679723))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196340 (= res!796148 (and (= (size!37921 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37920 _keys!1208) (size!37921 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196341 () Bool)

(declare-fun res!796154 () Bool)

(assert (=> b!1196341 (=> (not res!796154) (not e!679723))))

(assert (=> b!1196341 (= res!796154 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37920 _keys!1208))))))

(declare-fun b!1196342 () Bool)

(assert (=> b!1196342 (= e!679722 (and e!679720 mapRes!47357))))

(declare-fun condMapEmpty!47357 () Bool)

(declare-fun mapDefault!47357 () ValueCell!14464)

