; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100262 () Bool)

(assert start!100262)

(declare-fun b!1195983 () Bool)

(declare-fun e!679556 () Bool)

(declare-fun tp_is_empty!30329 () Bool)

(assert (=> b!1195983 (= e!679556 tp_is_empty!30329)))

(declare-fun b!1195984 () Bool)

(declare-fun res!795877 () Bool)

(declare-fun e!679559 () Bool)

(assert (=> b!1195984 (=> (not res!795877) (not e!679559))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77439 0))(
  ( (array!77440 (arr!37366 (Array (_ BitVec 32) (_ BitVec 64))) (size!37902 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77439)

(assert (=> b!1195984 (= res!795877 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37902 _keys!1208))))))

(declare-fun mapIsEmpty!47330 () Bool)

(declare-fun mapRes!47330 () Bool)

(assert (=> mapIsEmpty!47330 mapRes!47330))

(declare-fun b!1195985 () Bool)

(declare-fun res!795886 () Bool)

(assert (=> b!1195985 (=> (not res!795886) (not e!679559))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45565 0))(
  ( (V!45566 (val!15221 Int)) )
))
(declare-datatypes ((ValueCell!14455 0))(
  ( (ValueCellFull!14455 (v!17859 V!45565)) (EmptyCell!14455) )
))
(declare-datatypes ((array!77441 0))(
  ( (array!77442 (arr!37367 (Array (_ BitVec 32) ValueCell!14455)) (size!37903 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77441)

(assert (=> b!1195985 (= res!795886 (and (= (size!37903 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37902 _keys!1208) (size!37903 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195986 () Bool)

(declare-fun e!679561 () Bool)

(assert (=> b!1195986 (= e!679561 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195986 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39654 0))(
  ( (Unit!39655) )
))
(declare-fun lt!543011 () Unit!39654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77439 (_ BitVec 64) (_ BitVec 32)) Unit!39654)

(assert (=> b!1195986 (= lt!543011 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195987 () Bool)

(declare-fun res!795885 () Bool)

(assert (=> b!1195987 (=> (not res!795885) (not e!679559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195987 (= res!795885 (validMask!0 mask!1564))))

(declare-fun b!1195988 () Bool)

(declare-fun res!795879 () Bool)

(assert (=> b!1195988 (=> (not res!795879) (not e!679561))))

(declare-fun lt!543012 () array!77439)

(declare-datatypes ((List!26292 0))(
  ( (Nil!26289) (Cons!26288 (h!27497 (_ BitVec 64)) (t!38963 List!26292)) )
))
(declare-fun arrayNoDuplicates!0 (array!77439 (_ BitVec 32) List!26292) Bool)

(assert (=> b!1195988 (= res!795879 (arrayNoDuplicates!0 lt!543012 #b00000000000000000000000000000000 Nil!26289))))

(declare-fun b!1195989 () Bool)

(declare-fun e!679557 () Bool)

(assert (=> b!1195989 (= e!679557 tp_is_empty!30329)))

(declare-fun b!1195991 () Bool)

(declare-fun res!795882 () Bool)

(assert (=> b!1195991 (=> (not res!795882) (not e!679559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195991 (= res!795882 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!47330 () Bool)

(declare-fun tp!89940 () Bool)

(assert (=> mapNonEmpty!47330 (= mapRes!47330 (and tp!89940 e!679557))))

(declare-fun mapValue!47330 () ValueCell!14455)

(declare-fun mapKey!47330 () (_ BitVec 32))

(declare-fun mapRest!47330 () (Array (_ BitVec 32) ValueCell!14455))

(assert (=> mapNonEmpty!47330 (= (arr!37367 _values!996) (store mapRest!47330 mapKey!47330 mapValue!47330))))

(declare-fun b!1195992 () Bool)

(assert (=> b!1195992 (= e!679559 e!679561)))

(declare-fun res!795880 () Bool)

(assert (=> b!1195992 (=> (not res!795880) (not e!679561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77439 (_ BitVec 32)) Bool)

(assert (=> b!1195992 (= res!795880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543012 mask!1564))))

(assert (=> b!1195992 (= lt!543012 (array!77440 (store (arr!37366 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37902 _keys!1208)))))

(declare-fun b!1195993 () Bool)

(declare-fun res!795881 () Bool)

(assert (=> b!1195993 (=> (not res!795881) (not e!679559))))

(assert (=> b!1195993 (= res!795881 (= (select (arr!37366 _keys!1208) i!673) k!934))))

(declare-fun b!1195994 () Bool)

(declare-fun res!795883 () Bool)

(assert (=> b!1195994 (=> (not res!795883) (not e!679559))))

(assert (=> b!1195994 (= res!795883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195995 () Bool)

(declare-fun res!795884 () Bool)

(assert (=> b!1195995 (=> (not res!795884) (not e!679559))))

(assert (=> b!1195995 (= res!795884 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26289))))

(declare-fun b!1195990 () Bool)

(declare-fun e!679558 () Bool)

(assert (=> b!1195990 (= e!679558 (and e!679556 mapRes!47330))))

(declare-fun condMapEmpty!47330 () Bool)

(declare-fun mapDefault!47330 () ValueCell!14455)

