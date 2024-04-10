; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100460 () Bool)

(assert start!100460)

(declare-fun b_free!25783 () Bool)

(declare-fun b_next!25783 () Bool)

(assert (=> start!100460 (= b_free!25783 (not b_next!25783))))

(declare-fun tp!90338 () Bool)

(declare-fun b_and!42453 () Bool)

(assert (=> start!100460 (= tp!90338 b_and!42453)))

(declare-fun b!1199628 () Bool)

(declare-fun e!681336 () Bool)

(declare-fun e!681340 () Bool)

(assert (=> b!1199628 (= e!681336 (not e!681340))))

(declare-fun res!798507 () Bool)

(assert (=> b!1199628 (=> res!798507 e!681340)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199628 (= res!798507 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77749 0))(
  ( (array!77750 (arr!37519 (Array (_ BitVec 32) (_ BitVec 64))) (size!38055 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77749)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199628 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39772 0))(
  ( (Unit!39773) )
))
(declare-fun lt!543822 () Unit!39772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77749 (_ BitVec 64) (_ BitVec 32)) Unit!39772)

(assert (=> b!1199628 (= lt!543822 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1199629 () Bool)

(declare-fun res!798501 () Bool)

(declare-fun e!681339 () Bool)

(assert (=> b!1199629 (=> (not res!798501) (not e!681339))))

(assert (=> b!1199629 (= res!798501 (= (select (arr!37519 _keys!1208) i!673) k!934))))

(declare-fun b!1199630 () Bool)

(declare-fun e!681337 () Bool)

(declare-fun tp_is_empty!30487 () Bool)

(assert (=> b!1199630 (= e!681337 tp_is_empty!30487)))

(declare-fun b!1199631 () Bool)

(declare-fun e!681338 () Bool)

(assert (=> b!1199631 (= e!681338 tp_is_empty!30487)))

(declare-fun b!1199632 () Bool)

(assert (=> b!1199632 (= e!681339 e!681336)))

(declare-fun res!798499 () Bool)

(assert (=> b!1199632 (=> (not res!798499) (not e!681336))))

(declare-fun lt!543823 () array!77749)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77749 (_ BitVec 32)) Bool)

(assert (=> b!1199632 (= res!798499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543823 mask!1564))))

(assert (=> b!1199632 (= lt!543823 (array!77750 (store (arr!37519 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38055 _keys!1208)))))

(declare-fun b!1199633 () Bool)

(declare-fun res!798497 () Bool)

(assert (=> b!1199633 (=> (not res!798497) (not e!681339))))

(assert (=> b!1199633 (= res!798497 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38055 _keys!1208))))))

(declare-fun b!1199634 () Bool)

(declare-fun res!798502 () Bool)

(assert (=> b!1199634 (=> (not res!798502) (not e!681339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199634 (= res!798502 (validKeyInArray!0 k!934))))

(declare-fun b!1199635 () Bool)

(declare-fun res!798503 () Bool)

(assert (=> b!1199635 (=> (not res!798503) (not e!681339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199635 (= res!798503 (validMask!0 mask!1564))))

(declare-fun res!798505 () Bool)

(assert (=> start!100460 (=> (not res!798505) (not e!681339))))

(assert (=> start!100460 (= res!798505 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38055 _keys!1208))))))

(assert (=> start!100460 e!681339))

(assert (=> start!100460 tp_is_empty!30487))

(declare-fun array_inv!28590 (array!77749) Bool)

(assert (=> start!100460 (array_inv!28590 _keys!1208)))

(assert (=> start!100460 true))

(assert (=> start!100460 tp!90338))

(declare-datatypes ((V!45777 0))(
  ( (V!45778 (val!15300 Int)) )
))
(declare-datatypes ((ValueCell!14534 0))(
  ( (ValueCellFull!14534 (v!17938 V!45777)) (EmptyCell!14534) )
))
(declare-datatypes ((array!77751 0))(
  ( (array!77752 (arr!37520 (Array (_ BitVec 32) ValueCell!14534)) (size!38056 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77751)

(declare-fun e!681335 () Bool)

(declare-fun array_inv!28591 (array!77751) Bool)

(assert (=> start!100460 (and (array_inv!28591 _values!996) e!681335)))

(declare-fun b!1199636 () Bool)

(declare-fun res!798504 () Bool)

(assert (=> b!1199636 (=> (not res!798504) (not e!681339))))

(assert (=> b!1199636 (= res!798504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199637 () Bool)

(declare-fun mapRes!47573 () Bool)

(assert (=> b!1199637 (= e!681335 (and e!681337 mapRes!47573))))

(declare-fun condMapEmpty!47573 () Bool)

(declare-fun mapDefault!47573 () ValueCell!14534)

