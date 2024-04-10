; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100126 () Bool)

(assert start!100126)

(declare-fun mapNonEmpty!47180 () Bool)

(declare-fun mapRes!47180 () Bool)

(declare-fun tp!89790 () Bool)

(declare-fun e!678601 () Bool)

(assert (=> mapNonEmpty!47180 (= mapRes!47180 (and tp!89790 e!678601))))

(declare-datatypes ((V!45441 0))(
  ( (V!45442 (val!15174 Int)) )
))
(declare-datatypes ((ValueCell!14408 0))(
  ( (ValueCellFull!14408 (v!17812 V!45441)) (EmptyCell!14408) )
))
(declare-fun mapRest!47180 () (Array (_ BitVec 32) ValueCell!14408))

(declare-fun mapKey!47180 () (_ BitVec 32))

(declare-fun mapValue!47180 () ValueCell!14408)

(declare-datatypes ((array!77249 0))(
  ( (array!77250 (arr!37274 (Array (_ BitVec 32) ValueCell!14408)) (size!37810 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77249)

(assert (=> mapNonEmpty!47180 (= (arr!37274 _values!996) (store mapRest!47180 mapKey!47180 mapValue!47180))))

(declare-fun b!1194022 () Bool)

(declare-fun res!794416 () Bool)

(declare-fun e!678597 () Bool)

(assert (=> b!1194022 (=> (not res!794416) (not e!678597))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194022 (= res!794416 (validMask!0 mask!1564))))

(declare-fun b!1194023 () Bool)

(declare-fun res!794418 () Bool)

(assert (=> b!1194023 (=> (not res!794418) (not e!678597))))

(declare-datatypes ((array!77251 0))(
  ( (array!77252 (arr!37275 (Array (_ BitVec 32) (_ BitVec 64))) (size!37811 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77251)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77251 (_ BitVec 32)) Bool)

(assert (=> b!1194023 (= res!794418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194024 () Bool)

(declare-fun res!794414 () Bool)

(assert (=> b!1194024 (=> (not res!794414) (not e!678597))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194024 (= res!794414 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37811 _keys!1208))))))

(declare-fun b!1194025 () Bool)

(declare-fun res!794413 () Bool)

(assert (=> b!1194025 (=> (not res!794413) (not e!678597))))

(declare-datatypes ((List!26252 0))(
  ( (Nil!26249) (Cons!26248 (h!27457 (_ BitVec 64)) (t!38923 List!26252)) )
))
(declare-fun arrayNoDuplicates!0 (array!77251 (_ BitVec 32) List!26252) Bool)

(assert (=> b!1194025 (= res!794413 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26249))))

(declare-fun b!1194026 () Bool)

(declare-fun e!678596 () Bool)

(assert (=> b!1194026 (= e!678597 e!678596)))

(declare-fun res!794412 () Bool)

(assert (=> b!1194026 (=> (not res!794412) (not e!678596))))

(declare-fun lt!542708 () array!77251)

(assert (=> b!1194026 (= res!794412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542708 mask!1564))))

(assert (=> b!1194026 (= lt!542708 (array!77252 (store (arr!37275 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37811 _keys!1208)))))

(declare-fun mapIsEmpty!47180 () Bool)

(assert (=> mapIsEmpty!47180 mapRes!47180))

(declare-fun res!794417 () Bool)

(assert (=> start!100126 (=> (not res!794417) (not e!678597))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100126 (= res!794417 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37811 _keys!1208))))))

(assert (=> start!100126 e!678597))

(declare-fun array_inv!28416 (array!77251) Bool)

(assert (=> start!100126 (array_inv!28416 _keys!1208)))

(assert (=> start!100126 true))

(declare-fun e!678600 () Bool)

(declare-fun array_inv!28417 (array!77249) Bool)

(assert (=> start!100126 (and (array_inv!28417 _values!996) e!678600)))

(declare-fun b!1194027 () Bool)

(declare-fun e!678599 () Bool)

(declare-fun tp_is_empty!30235 () Bool)

(assert (=> b!1194027 (= e!678599 tp_is_empty!30235)))

(declare-fun b!1194028 () Bool)

(assert (=> b!1194028 (= e!678596 false)))

(declare-fun lt!542709 () Bool)

(assert (=> b!1194028 (= lt!542709 (arrayNoDuplicates!0 lt!542708 #b00000000000000000000000000000000 Nil!26249))))

(declare-fun b!1194029 () Bool)

(declare-fun res!794411 () Bool)

(assert (=> b!1194029 (=> (not res!794411) (not e!678597))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194029 (= res!794411 (and (= (size!37810 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37811 _keys!1208) (size!37810 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194030 () Bool)

(declare-fun res!794419 () Bool)

(assert (=> b!1194030 (=> (not res!794419) (not e!678597))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194030 (= res!794419 (validKeyInArray!0 k!934))))

(declare-fun b!1194031 () Bool)

(assert (=> b!1194031 (= e!678601 tp_is_empty!30235)))

(declare-fun b!1194032 () Bool)

(assert (=> b!1194032 (= e!678600 (and e!678599 mapRes!47180))))

(declare-fun condMapEmpty!47180 () Bool)

(declare-fun mapDefault!47180 () ValueCell!14408)

