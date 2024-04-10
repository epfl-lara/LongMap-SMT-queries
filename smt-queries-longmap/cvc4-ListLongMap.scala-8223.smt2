; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100250 () Bool)

(assert start!100250)

(declare-fun b!1195749 () Bool)

(declare-fun res!795697 () Bool)

(declare-fun e!679449 () Bool)

(assert (=> b!1195749 (=> (not res!795697) (not e!679449))))

(declare-datatypes ((array!77415 0))(
  ( (array!77416 (arr!37354 (Array (_ BitVec 32) (_ BitVec 64))) (size!37890 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77415)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77415 (_ BitVec 32)) Bool)

(assert (=> b!1195749 (= res!795697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195750 () Bool)

(declare-fun res!795702 () Bool)

(assert (=> b!1195750 (=> (not res!795702) (not e!679449))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195750 (= res!795702 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37890 _keys!1208))))))

(declare-fun b!1195751 () Bool)

(declare-fun res!795698 () Bool)

(assert (=> b!1195751 (=> (not res!795698) (not e!679449))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45549 0))(
  ( (V!45550 (val!15215 Int)) )
))
(declare-datatypes ((ValueCell!14449 0))(
  ( (ValueCellFull!14449 (v!17853 V!45549)) (EmptyCell!14449) )
))
(declare-datatypes ((array!77417 0))(
  ( (array!77418 (arr!37355 (Array (_ BitVec 32) ValueCell!14449)) (size!37891 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77417)

(assert (=> b!1195751 (= res!795698 (and (= (size!37891 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37890 _keys!1208) (size!37891 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195752 () Bool)

(declare-fun res!795699 () Bool)

(assert (=> b!1195752 (=> (not res!795699) (not e!679449))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1195752 (= res!795699 (= (select (arr!37354 _keys!1208) i!673) k!934))))

(declare-fun b!1195753 () Bool)

(declare-fun e!679448 () Bool)

(declare-fun e!679452 () Bool)

(declare-fun mapRes!47312 () Bool)

(assert (=> b!1195753 (= e!679448 (and e!679452 mapRes!47312))))

(declare-fun condMapEmpty!47312 () Bool)

(declare-fun mapDefault!47312 () ValueCell!14449)

