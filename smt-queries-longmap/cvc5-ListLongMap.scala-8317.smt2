; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101250 () Bool)

(assert start!101250)

(declare-fun b_free!26173 () Bool)

(declare-fun b_next!26173 () Bool)

(assert (=> start!101250 (= b_free!26173 (not b_next!26173))))

(declare-fun tp!91540 () Bool)

(declare-fun b_and!43463 () Bool)

(assert (=> start!101250 (= tp!91540 b_and!43463)))

(declare-fun b!1216080 () Bool)

(declare-fun res!807486 () Bool)

(declare-fun e!690448 () Bool)

(assert (=> b!1216080 (=> (not res!807486) (not e!690448))))

(declare-datatypes ((array!78527 0))(
  ( (array!78528 (arr!37898 (Array (_ BitVec 32) (_ BitVec 64))) (size!38434 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78527)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78527 (_ BitVec 32)) Bool)

(assert (=> b!1216080 (= res!807486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216082 () Bool)

(declare-fun res!807491 () Bool)

(declare-fun e!690451 () Bool)

(assert (=> b!1216082 (=> (not res!807491) (not e!690451))))

(declare-fun lt!552791 () array!78527)

(declare-datatypes ((List!26717 0))(
  ( (Nil!26714) (Cons!26713 (h!27922 (_ BitVec 64)) (t!39870 List!26717)) )
))
(declare-fun arrayNoDuplicates!0 (array!78527 (_ BitVec 32) List!26717) Bool)

(assert (=> b!1216082 (= res!807491 (arrayNoDuplicates!0 lt!552791 #b00000000000000000000000000000000 Nil!26714))))

(declare-fun b!1216083 () Bool)

(assert (=> b!1216083 (= e!690448 e!690451)))

(declare-fun res!807492 () Bool)

(assert (=> b!1216083 (=> (not res!807492) (not e!690451))))

(assert (=> b!1216083 (= res!807492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552791 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216083 (= lt!552791 (array!78528 (store (arr!37898 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38434 _keys!1208)))))

(declare-fun b!1216084 () Bool)

(declare-fun res!807484 () Bool)

(assert (=> b!1216084 (=> (not res!807484) (not e!690448))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46297 0))(
  ( (V!46298 (val!15495 Int)) )
))
(declare-datatypes ((ValueCell!14729 0))(
  ( (ValueCellFull!14729 (v!18148 V!46297)) (EmptyCell!14729) )
))
(declare-datatypes ((array!78529 0))(
  ( (array!78530 (arr!37899 (Array (_ BitVec 32) ValueCell!14729)) (size!38435 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78529)

(assert (=> b!1216084 (= res!807484 (and (= (size!38435 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38434 _keys!1208) (size!38435 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216085 () Bool)

(declare-fun e!690454 () Bool)

(declare-fun e!690449 () Bool)

(declare-fun mapRes!48190 () Bool)

(assert (=> b!1216085 (= e!690454 (and e!690449 mapRes!48190))))

(declare-fun condMapEmpty!48190 () Bool)

(declare-fun mapDefault!48190 () ValueCell!14729)

