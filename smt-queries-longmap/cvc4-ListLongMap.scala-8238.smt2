; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100362 () Bool)

(assert start!100362)

(declare-fun mapNonEmpty!47450 () Bool)

(declare-fun mapRes!47450 () Bool)

(declare-fun tp!90105 () Bool)

(declare-fun e!680439 () Bool)

(assert (=> mapNonEmpty!47450 (= mapRes!47450 (and tp!90105 e!680439))))

(declare-datatypes ((V!45669 0))(
  ( (V!45670 (val!15260 Int)) )
))
(declare-datatypes ((ValueCell!14494 0))(
  ( (ValueCellFull!14494 (v!17898 V!45669)) (EmptyCell!14494) )
))
(declare-fun mapValue!47450 () ValueCell!14494)

(declare-fun mapRest!47450 () (Array (_ BitVec 32) ValueCell!14494))

(declare-datatypes ((array!77591 0))(
  ( (array!77592 (arr!37441 (Array (_ BitVec 32) ValueCell!14494)) (size!37977 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77591)

(declare-fun mapKey!47450 () (_ BitVec 32))

(assert (=> mapNonEmpty!47450 (= (arr!37441 _values!996) (store mapRest!47450 mapKey!47450 mapValue!47450))))

(declare-fun b!1197800 () Bool)

(declare-fun res!797149 () Bool)

(declare-fun e!680441 () Bool)

(assert (=> b!1197800 (=> (not res!797149) (not e!680441))))

(declare-datatypes ((array!77593 0))(
  ( (array!77594 (arr!37442 (Array (_ BitVec 32) (_ BitVec 64))) (size!37978 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77593)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77593 (_ BitVec 32)) Bool)

(assert (=> b!1197800 (= res!797149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197801 () Bool)

(declare-fun res!797151 () Bool)

(assert (=> b!1197801 (=> (not res!797151) (not e!680441))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197801 (= res!797151 (and (= (size!37977 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37978 _keys!1208) (size!37977 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197802 () Bool)

(declare-fun res!797146 () Bool)

(assert (=> b!1197802 (=> (not res!797146) (not e!680441))))

(declare-datatypes ((List!26340 0))(
  ( (Nil!26337) (Cons!26336 (h!27545 (_ BitVec 64)) (t!39041 List!26340)) )
))
(declare-fun arrayNoDuplicates!0 (array!77593 (_ BitVec 32) List!26340) Bool)

(assert (=> b!1197802 (= res!797146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26337))))

(declare-fun b!1197803 () Bool)

(declare-fun e!680437 () Bool)

(assert (=> b!1197803 (= e!680437 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197803 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39716 0))(
  ( (Unit!39717) )
))
(declare-fun lt!543354 () Unit!39716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77593 (_ BitVec 64) (_ BitVec 32)) Unit!39716)

(assert (=> b!1197803 (= lt!543354 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!47450 () Bool)

(assert (=> mapIsEmpty!47450 mapRes!47450))

(declare-fun b!1197804 () Bool)

(declare-fun res!797148 () Bool)

(assert (=> b!1197804 (=> (not res!797148) (not e!680437))))

(declare-fun lt!543353 () array!77593)

(assert (=> b!1197804 (= res!797148 (arrayNoDuplicates!0 lt!543353 #b00000000000000000000000000000000 Nil!26337))))

(declare-fun b!1197805 () Bool)

(declare-fun e!680438 () Bool)

(declare-fun tp_is_empty!30407 () Bool)

(assert (=> b!1197805 (= e!680438 tp_is_empty!30407)))

(declare-fun res!797145 () Bool)

(assert (=> start!100362 (=> (not res!797145) (not e!680441))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100362 (= res!797145 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37978 _keys!1208))))))

(assert (=> start!100362 e!680441))

(declare-fun array_inv!28536 (array!77593) Bool)

(assert (=> start!100362 (array_inv!28536 _keys!1208)))

(assert (=> start!100362 true))

(declare-fun e!680436 () Bool)

(declare-fun array_inv!28537 (array!77591) Bool)

(assert (=> start!100362 (and (array_inv!28537 _values!996) e!680436)))

(declare-fun b!1197806 () Bool)

(declare-fun res!797154 () Bool)

(assert (=> b!1197806 (=> (not res!797154) (not e!680441))))

(assert (=> b!1197806 (= res!797154 (= (select (arr!37442 _keys!1208) i!673) k!934))))

(declare-fun b!1197807 () Bool)

(assert (=> b!1197807 (= e!680436 (and e!680438 mapRes!47450))))

(declare-fun condMapEmpty!47450 () Bool)

(declare-fun mapDefault!47450 () ValueCell!14494)

