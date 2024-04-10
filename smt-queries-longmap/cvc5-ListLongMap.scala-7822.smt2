; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97676 () Bool)

(assert start!97676)

(declare-fun b!1116420 () Bool)

(declare-fun e!636083 () Bool)

(declare-fun e!636087 () Bool)

(assert (=> b!1116420 (= e!636083 e!636087)))

(declare-fun res!745423 () Bool)

(assert (=> b!1116420 (=> (not res!745423) (not e!636087))))

(declare-datatypes ((array!72711 0))(
  ( (array!72712 (arr!35008 (Array (_ BitVec 32) (_ BitVec 64))) (size!35544 (_ BitVec 32))) )
))
(declare-fun lt!497132 () array!72711)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72711 (_ BitVec 32)) Bool)

(assert (=> b!1116420 (= res!745423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497132 mask!1564))))

(declare-fun _keys!1208 () array!72711)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116420 (= lt!497132 (array!72712 (store (arr!35008 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35544 _keys!1208)))))

(declare-fun b!1116421 () Bool)

(declare-fun res!745425 () Bool)

(assert (=> b!1116421 (=> (not res!745425) (not e!636083))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42337 0))(
  ( (V!42338 (val!14010 Int)) )
))
(declare-datatypes ((ValueCell!13244 0))(
  ( (ValueCellFull!13244 (v!16643 V!42337)) (EmptyCell!13244) )
))
(declare-datatypes ((array!72713 0))(
  ( (array!72714 (arr!35009 (Array (_ BitVec 32) ValueCell!13244)) (size!35545 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72713)

(assert (=> b!1116421 (= res!745425 (and (= (size!35545 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35544 _keys!1208) (size!35545 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116422 () Bool)

(declare-fun res!745424 () Bool)

(assert (=> b!1116422 (=> (not res!745424) (not e!636083))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116422 (= res!745424 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43678 () Bool)

(declare-fun mapRes!43678 () Bool)

(declare-fun tp!82922 () Bool)

(declare-fun e!636084 () Bool)

(assert (=> mapNonEmpty!43678 (= mapRes!43678 (and tp!82922 e!636084))))

(declare-fun mapValue!43678 () ValueCell!13244)

(declare-fun mapKey!43678 () (_ BitVec 32))

(declare-fun mapRest!43678 () (Array (_ BitVec 32) ValueCell!13244))

(assert (=> mapNonEmpty!43678 (= (arr!35009 _values!996) (store mapRest!43678 mapKey!43678 mapValue!43678))))

(declare-fun b!1116423 () Bool)

(declare-fun tp_is_empty!27907 () Bool)

(assert (=> b!1116423 (= e!636084 tp_is_empty!27907)))

(declare-fun b!1116424 () Bool)

(declare-fun res!745426 () Bool)

(assert (=> b!1116424 (=> (not res!745426) (not e!636087))))

(declare-datatypes ((List!24367 0))(
  ( (Nil!24364) (Cons!24363 (h!25572 (_ BitVec 64)) (t!34848 List!24367)) )
))
(declare-fun arrayNoDuplicates!0 (array!72711 (_ BitVec 32) List!24367) Bool)

(assert (=> b!1116424 (= res!745426 (arrayNoDuplicates!0 lt!497132 #b00000000000000000000000000000000 Nil!24364))))

(declare-fun b!1116425 () Bool)

(declare-fun res!745428 () Bool)

(assert (=> b!1116425 (=> (not res!745428) (not e!636083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116425 (= res!745428 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43678 () Bool)

(assert (=> mapIsEmpty!43678 mapRes!43678))

(declare-fun b!1116426 () Bool)

(declare-fun res!745429 () Bool)

(assert (=> b!1116426 (=> (not res!745429) (not e!636083))))

(assert (=> b!1116426 (= res!745429 (= (select (arr!35008 _keys!1208) i!673) k!934))))

(declare-fun b!1116427 () Bool)

(declare-fun e!636082 () Bool)

(assert (=> b!1116427 (= e!636082 tp_is_empty!27907)))

(declare-fun res!745427 () Bool)

(assert (=> start!97676 (=> (not res!745427) (not e!636083))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97676 (= res!745427 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35544 _keys!1208))))))

(assert (=> start!97676 e!636083))

(declare-fun array_inv!26906 (array!72711) Bool)

(assert (=> start!97676 (array_inv!26906 _keys!1208)))

(assert (=> start!97676 true))

(declare-fun e!636085 () Bool)

(declare-fun array_inv!26907 (array!72713) Bool)

(assert (=> start!97676 (and (array_inv!26907 _values!996) e!636085)))

(declare-fun b!1116428 () Bool)

(declare-fun res!745431 () Bool)

(assert (=> b!1116428 (=> (not res!745431) (not e!636083))))

(assert (=> b!1116428 (= res!745431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116429 () Bool)

(declare-fun res!745432 () Bool)

(assert (=> b!1116429 (=> (not res!745432) (not e!636083))))

(assert (=> b!1116429 (= res!745432 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24364))))

(declare-fun b!1116430 () Bool)

(assert (=> b!1116430 (= e!636085 (and e!636082 mapRes!43678))))

(declare-fun condMapEmpty!43678 () Bool)

(declare-fun mapDefault!43678 () ValueCell!13244)

