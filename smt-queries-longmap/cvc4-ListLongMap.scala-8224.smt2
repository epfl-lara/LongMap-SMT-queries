; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100256 () Bool)

(assert start!100256)

(declare-fun b!1195866 () Bool)

(declare-fun res!795791 () Bool)

(declare-fun e!679502 () Bool)

(assert (=> b!1195866 (=> (not res!795791) (not e!679502))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195866 (= res!795791 (validMask!0 mask!1564))))

(declare-fun b!1195867 () Bool)

(declare-fun e!679504 () Bool)

(assert (=> b!1195867 (= e!679502 e!679504)))

(declare-fun res!795787 () Bool)

(assert (=> b!1195867 (=> (not res!795787) (not e!679504))))

(declare-datatypes ((array!77427 0))(
  ( (array!77428 (arr!37360 (Array (_ BitVec 32) (_ BitVec 64))) (size!37896 (_ BitVec 32))) )
))
(declare-fun lt!542993 () array!77427)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77427 (_ BitVec 32)) Bool)

(assert (=> b!1195867 (= res!795787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542993 mask!1564))))

(declare-fun _keys!1208 () array!77427)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195867 (= lt!542993 (array!77428 (store (arr!37360 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37896 _keys!1208)))))

(declare-fun b!1195868 () Bool)

(declare-fun res!795792 () Bool)

(assert (=> b!1195868 (=> (not res!795792) (not e!679504))))

(declare-datatypes ((List!26289 0))(
  ( (Nil!26286) (Cons!26285 (h!27494 (_ BitVec 64)) (t!38960 List!26289)) )
))
(declare-fun arrayNoDuplicates!0 (array!77427 (_ BitVec 32) List!26289) Bool)

(assert (=> b!1195868 (= res!795792 (arrayNoDuplicates!0 lt!542993 #b00000000000000000000000000000000 Nil!26286))))

(declare-fun b!1195869 () Bool)

(declare-fun res!795790 () Bool)

(assert (=> b!1195869 (=> (not res!795790) (not e!679502))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45557 0))(
  ( (V!45558 (val!15218 Int)) )
))
(declare-datatypes ((ValueCell!14452 0))(
  ( (ValueCellFull!14452 (v!17856 V!45557)) (EmptyCell!14452) )
))
(declare-datatypes ((array!77429 0))(
  ( (array!77430 (arr!37361 (Array (_ BitVec 32) ValueCell!14452)) (size!37897 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77429)

(assert (=> b!1195869 (= res!795790 (and (= (size!37897 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37896 _keys!1208) (size!37897 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195870 () Bool)

(declare-fun res!795794 () Bool)

(assert (=> b!1195870 (=> (not res!795794) (not e!679502))))

(assert (=> b!1195870 (= res!795794 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26286))))

(declare-fun b!1195871 () Bool)

(declare-fun e!679507 () Bool)

(declare-fun tp_is_empty!30323 () Bool)

(assert (=> b!1195871 (= e!679507 tp_is_empty!30323)))

(declare-fun b!1195872 () Bool)

(declare-fun e!679506 () Bool)

(assert (=> b!1195872 (= e!679506 tp_is_empty!30323)))

(declare-fun b!1195873 () Bool)

(declare-fun res!795795 () Bool)

(assert (=> b!1195873 (=> (not res!795795) (not e!679502))))

(assert (=> b!1195873 (= res!795795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37896 _keys!1208))))))

(declare-fun res!795796 () Bool)

(assert (=> start!100256 (=> (not res!795796) (not e!679502))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100256 (= res!795796 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37896 _keys!1208))))))

(assert (=> start!100256 e!679502))

(declare-fun array_inv!28478 (array!77427) Bool)

(assert (=> start!100256 (array_inv!28478 _keys!1208)))

(assert (=> start!100256 true))

(declare-fun e!679503 () Bool)

(declare-fun array_inv!28479 (array!77429) Bool)

(assert (=> start!100256 (and (array_inv!28479 _values!996) e!679503)))

(declare-fun b!1195874 () Bool)

(assert (=> b!1195874 (= e!679504 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195874 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39650 0))(
  ( (Unit!39651) )
))
(declare-fun lt!542994 () Unit!39650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77427 (_ BitVec 64) (_ BitVec 32)) Unit!39650)

(assert (=> b!1195874 (= lt!542994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195875 () Bool)

(declare-fun mapRes!47321 () Bool)

(assert (=> b!1195875 (= e!679503 (and e!679507 mapRes!47321))))

(declare-fun condMapEmpty!47321 () Bool)

(declare-fun mapDefault!47321 () ValueCell!14452)

