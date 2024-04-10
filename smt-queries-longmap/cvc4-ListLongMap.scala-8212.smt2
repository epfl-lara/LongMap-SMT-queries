; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100142 () Bool)

(assert start!100142)

(declare-fun b!1194310 () Bool)

(declare-fun e!678743 () Bool)

(declare-fun e!678741 () Bool)

(assert (=> b!1194310 (= e!678743 e!678741)))

(declare-fun res!794632 () Bool)

(assert (=> b!1194310 (=> (not res!794632) (not e!678741))))

(declare-datatypes ((array!77281 0))(
  ( (array!77282 (arr!37290 (Array (_ BitVec 32) (_ BitVec 64))) (size!37826 (_ BitVec 32))) )
))
(declare-fun lt!542756 () array!77281)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77281 (_ BitVec 32)) Bool)

(assert (=> b!1194310 (= res!794632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542756 mask!1564))))

(declare-fun _keys!1208 () array!77281)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194310 (= lt!542756 (array!77282 (store (arr!37290 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37826 _keys!1208)))))

(declare-fun b!1194311 () Bool)

(declare-fun res!794635 () Bool)

(assert (=> b!1194311 (=> (not res!794635) (not e!678743))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194311 (= res!794635 (validKeyInArray!0 k!934))))

(declare-fun b!1194312 () Bool)

(declare-fun res!794634 () Bool)

(assert (=> b!1194312 (=> (not res!794634) (not e!678743))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45461 0))(
  ( (V!45462 (val!15182 Int)) )
))
(declare-datatypes ((ValueCell!14416 0))(
  ( (ValueCellFull!14416 (v!17820 V!45461)) (EmptyCell!14416) )
))
(declare-datatypes ((array!77283 0))(
  ( (array!77284 (arr!37291 (Array (_ BitVec 32) ValueCell!14416)) (size!37827 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77283)

(assert (=> b!1194312 (= res!794634 (and (= (size!37827 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37826 _keys!1208) (size!37827 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47204 () Bool)

(declare-fun mapRes!47204 () Bool)

(assert (=> mapIsEmpty!47204 mapRes!47204))

(declare-fun mapNonEmpty!47204 () Bool)

(declare-fun tp!89814 () Bool)

(declare-fun e!678742 () Bool)

(assert (=> mapNonEmpty!47204 (= mapRes!47204 (and tp!89814 e!678742))))

(declare-fun mapKey!47204 () (_ BitVec 32))

(declare-fun mapRest!47204 () (Array (_ BitVec 32) ValueCell!14416))

(declare-fun mapValue!47204 () ValueCell!14416)

(assert (=> mapNonEmpty!47204 (= (arr!37291 _values!996) (store mapRest!47204 mapKey!47204 mapValue!47204))))

(declare-fun b!1194313 () Bool)

(assert (=> b!1194313 (= e!678741 false)))

(declare-fun lt!542757 () Bool)

(declare-datatypes ((List!26259 0))(
  ( (Nil!26256) (Cons!26255 (h!27464 (_ BitVec 64)) (t!38930 List!26259)) )
))
(declare-fun arrayNoDuplicates!0 (array!77281 (_ BitVec 32) List!26259) Bool)

(assert (=> b!1194313 (= lt!542757 (arrayNoDuplicates!0 lt!542756 #b00000000000000000000000000000000 Nil!26256))))

(declare-fun b!1194315 () Bool)

(declare-fun tp_is_empty!30251 () Bool)

(assert (=> b!1194315 (= e!678742 tp_is_empty!30251)))

(declare-fun b!1194316 () Bool)

(declare-fun res!794630 () Bool)

(assert (=> b!1194316 (=> (not res!794630) (not e!678743))))

(assert (=> b!1194316 (= res!794630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194317 () Bool)

(declare-fun res!794633 () Bool)

(assert (=> b!1194317 (=> (not res!794633) (not e!678743))))

(assert (=> b!1194317 (= res!794633 (= (select (arr!37290 _keys!1208) i!673) k!934))))

(declare-fun b!1194318 () Bool)

(declare-fun res!794631 () Bool)

(assert (=> b!1194318 (=> (not res!794631) (not e!678743))))

(assert (=> b!1194318 (= res!794631 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37826 _keys!1208))))))

(declare-fun b!1194319 () Bool)

(declare-fun res!794628 () Bool)

(assert (=> b!1194319 (=> (not res!794628) (not e!678743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194319 (= res!794628 (validMask!0 mask!1564))))

(declare-fun b!1194320 () Bool)

(declare-fun e!678745 () Bool)

(assert (=> b!1194320 (= e!678745 tp_is_empty!30251)))

(declare-fun b!1194321 () Bool)

(declare-fun res!794629 () Bool)

(assert (=> b!1194321 (=> (not res!794629) (not e!678743))))

(assert (=> b!1194321 (= res!794629 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26256))))

(declare-fun b!1194314 () Bool)

(declare-fun e!678744 () Bool)

(assert (=> b!1194314 (= e!678744 (and e!678745 mapRes!47204))))

(declare-fun condMapEmpty!47204 () Bool)

(declare-fun mapDefault!47204 () ValueCell!14416)

