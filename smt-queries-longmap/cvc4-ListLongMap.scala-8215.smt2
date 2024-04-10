; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100186 () Bool)

(assert start!100186)

(declare-fun b!1194763 () Bool)

(declare-fun res!794960 () Bool)

(declare-fun e!678976 () Bool)

(assert (=> b!1194763 (=> (not res!794960) (not e!678976))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194763 (= res!794960 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47237 () Bool)

(declare-fun mapRes!47237 () Bool)

(declare-fun tp!89847 () Bool)

(declare-fun e!678977 () Bool)

(assert (=> mapNonEmpty!47237 (= mapRes!47237 (and tp!89847 e!678977))))

(declare-datatypes ((V!45485 0))(
  ( (V!45486 (val!15191 Int)) )
))
(declare-datatypes ((ValueCell!14425 0))(
  ( (ValueCellFull!14425 (v!17829 V!45485)) (EmptyCell!14425) )
))
(declare-fun mapRest!47237 () (Array (_ BitVec 32) ValueCell!14425))

(declare-fun mapValue!47237 () ValueCell!14425)

(declare-datatypes ((array!77319 0))(
  ( (array!77320 (arr!37307 (Array (_ BitVec 32) ValueCell!14425)) (size!37843 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77319)

(declare-fun mapKey!47237 () (_ BitVec 32))

(assert (=> mapNonEmpty!47237 (= (arr!37307 _values!996) (store mapRest!47237 mapKey!47237 mapValue!47237))))

(declare-fun b!1194764 () Bool)

(declare-fun res!794951 () Bool)

(assert (=> b!1194764 (=> (not res!794951) (not e!678976))))

(declare-datatypes ((array!77321 0))(
  ( (array!77322 (arr!37308 (Array (_ BitVec 32) (_ BitVec 64))) (size!37844 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77321)

(declare-datatypes ((List!26266 0))(
  ( (Nil!26263) (Cons!26262 (h!27471 (_ BitVec 64)) (t!38937 List!26266)) )
))
(declare-fun arrayNoDuplicates!0 (array!77321 (_ BitVec 32) List!26266) Bool)

(assert (=> b!1194764 (= res!794951 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26263))))

(declare-fun mapIsEmpty!47237 () Bool)

(assert (=> mapIsEmpty!47237 mapRes!47237))

(declare-fun b!1194765 () Bool)

(declare-fun res!794952 () Bool)

(assert (=> b!1194765 (=> (not res!794952) (not e!678976))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194765 (= res!794952 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37844 _keys!1208))))))

(declare-fun res!794954 () Bool)

(assert (=> start!100186 (=> (not res!794954) (not e!678976))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100186 (= res!794954 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37844 _keys!1208))))))

(assert (=> start!100186 e!678976))

(declare-fun array_inv!28438 (array!77321) Bool)

(assert (=> start!100186 (array_inv!28438 _keys!1208)))

(assert (=> start!100186 true))

(declare-fun e!678979 () Bool)

(declare-fun array_inv!28439 (array!77319) Bool)

(assert (=> start!100186 (and (array_inv!28439 _values!996) e!678979)))

(declare-fun b!1194766 () Bool)

(declare-fun res!794953 () Bool)

(assert (=> b!1194766 (=> (not res!794953) (not e!678976))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1194766 (= res!794953 (= (select (arr!37308 _keys!1208) i!673) k!934))))

(declare-fun b!1194767 () Bool)

(declare-fun res!794956 () Bool)

(declare-fun e!678978 () Bool)

(assert (=> b!1194767 (=> (not res!794956) (not e!678978))))

(declare-fun lt!542817 () array!77321)

(assert (=> b!1194767 (= res!794956 (arrayNoDuplicates!0 lt!542817 #b00000000000000000000000000000000 Nil!26263))))

(declare-fun b!1194768 () Bool)

(declare-fun res!794959 () Bool)

(assert (=> b!1194768 (=> (not res!794959) (not e!678976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194768 (= res!794959 (validKeyInArray!0 k!934))))

(declare-fun b!1194769 () Bool)

(declare-fun e!678980 () Bool)

(declare-fun tp_is_empty!30269 () Bool)

(assert (=> b!1194769 (= e!678980 tp_is_empty!30269)))

(declare-fun b!1194770 () Bool)

(assert (=> b!1194770 (= e!678976 e!678978)))

(declare-fun res!794957 () Bool)

(assert (=> b!1194770 (=> (not res!794957) (not e!678978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77321 (_ BitVec 32)) Bool)

(assert (=> b!1194770 (= res!794957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542817 mask!1564))))

(assert (=> b!1194770 (= lt!542817 (array!77322 (store (arr!37308 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37844 _keys!1208)))))

(declare-fun b!1194771 () Bool)

(declare-fun res!794958 () Bool)

(assert (=> b!1194771 (=> (not res!794958) (not e!678976))))

(assert (=> b!1194771 (= res!794958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194772 () Bool)

(declare-fun res!794955 () Bool)

(assert (=> b!1194772 (=> (not res!794955) (not e!678976))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194772 (= res!794955 (and (= (size!37843 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37844 _keys!1208) (size!37843 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194773 () Bool)

(assert (=> b!1194773 (= e!678979 (and e!678980 mapRes!47237))))

(declare-fun condMapEmpty!47237 () Bool)

(declare-fun mapDefault!47237 () ValueCell!14425)

