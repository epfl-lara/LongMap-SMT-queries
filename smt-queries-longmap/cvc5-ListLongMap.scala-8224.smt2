; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100252 () Bool)

(assert start!100252)

(declare-fun b!1195788 () Bool)

(declare-fun e!679468 () Bool)

(declare-fun tp_is_empty!30319 () Bool)

(assert (=> b!1195788 (= e!679468 tp_is_empty!30319)))

(declare-fun b!1195789 () Bool)

(declare-fun res!795733 () Bool)

(declare-fun e!679467 () Bool)

(assert (=> b!1195789 (=> (not res!795733) (not e!679467))))

(declare-datatypes ((array!77419 0))(
  ( (array!77420 (arr!37356 (Array (_ BitVec 32) (_ BitVec 64))) (size!37892 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77419)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45553 0))(
  ( (V!45554 (val!15216 Int)) )
))
(declare-datatypes ((ValueCell!14450 0))(
  ( (ValueCellFull!14450 (v!17854 V!45553)) (EmptyCell!14450) )
))
(declare-datatypes ((array!77421 0))(
  ( (array!77422 (arr!37357 (Array (_ BitVec 32) ValueCell!14450)) (size!37893 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77421)

(assert (=> b!1195789 (= res!795733 (and (= (size!37893 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37892 _keys!1208) (size!37893 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195790 () Bool)

(declare-fun res!795731 () Bool)

(assert (=> b!1195790 (=> (not res!795731) (not e!679467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77419 (_ BitVec 32)) Bool)

(assert (=> b!1195790 (= res!795731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195791 () Bool)

(declare-fun res!795727 () Bool)

(assert (=> b!1195791 (=> (not res!795727) (not e!679467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195791 (= res!795727 (validMask!0 mask!1564))))

(declare-fun b!1195792 () Bool)

(declare-fun e!679466 () Bool)

(assert (=> b!1195792 (= e!679466 tp_is_empty!30319)))

(declare-fun mapIsEmpty!47315 () Bool)

(declare-fun mapRes!47315 () Bool)

(assert (=> mapIsEmpty!47315 mapRes!47315))

(declare-fun mapNonEmpty!47315 () Bool)

(declare-fun tp!89925 () Bool)

(assert (=> mapNonEmpty!47315 (= mapRes!47315 (and tp!89925 e!679468))))

(declare-fun mapKey!47315 () (_ BitVec 32))

(declare-fun mapRest!47315 () (Array (_ BitVec 32) ValueCell!14450))

(declare-fun mapValue!47315 () ValueCell!14450)

(assert (=> mapNonEmpty!47315 (= (arr!37357 _values!996) (store mapRest!47315 mapKey!47315 mapValue!47315))))

(declare-fun b!1195793 () Bool)

(declare-fun res!795732 () Bool)

(declare-fun e!679469 () Bool)

(assert (=> b!1195793 (=> (not res!795732) (not e!679469))))

(declare-fun lt!542981 () array!77419)

(declare-datatypes ((List!26287 0))(
  ( (Nil!26284) (Cons!26283 (h!27492 (_ BitVec 64)) (t!38958 List!26287)) )
))
(declare-fun arrayNoDuplicates!0 (array!77419 (_ BitVec 32) List!26287) Bool)

(assert (=> b!1195793 (= res!795732 (arrayNoDuplicates!0 lt!542981 #b00000000000000000000000000000000 Nil!26284))))

(declare-fun b!1195794 () Bool)

(declare-fun res!795728 () Bool)

(assert (=> b!1195794 (=> (not res!795728) (not e!679467))))

(assert (=> b!1195794 (= res!795728 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26284))))

(declare-fun res!795735 () Bool)

(assert (=> start!100252 (=> (not res!795735) (not e!679467))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100252 (= res!795735 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37892 _keys!1208))))))

(assert (=> start!100252 e!679467))

(declare-fun array_inv!28474 (array!77419) Bool)

(assert (=> start!100252 (array_inv!28474 _keys!1208)))

(assert (=> start!100252 true))

(declare-fun e!679471 () Bool)

(declare-fun array_inv!28475 (array!77421) Bool)

(assert (=> start!100252 (and (array_inv!28475 _values!996) e!679471)))

(declare-fun b!1195795 () Bool)

(declare-fun res!795729 () Bool)

(assert (=> b!1195795 (=> (not res!795729) (not e!679467))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1195795 (= res!795729 (= (select (arr!37356 _keys!1208) i!673) k!934))))

(declare-fun b!1195796 () Bool)

(assert (=> b!1195796 (= e!679469 (not true))))

(declare-fun arrayContainsKey!0 (array!77419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195796 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39646 0))(
  ( (Unit!39647) )
))
(declare-fun lt!542982 () Unit!39646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77419 (_ BitVec 64) (_ BitVec 32)) Unit!39646)

(assert (=> b!1195796 (= lt!542982 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195797 () Bool)

(declare-fun res!795730 () Bool)

(assert (=> b!1195797 (=> (not res!795730) (not e!679467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195797 (= res!795730 (validKeyInArray!0 k!934))))

(declare-fun b!1195798 () Bool)

(assert (=> b!1195798 (= e!679471 (and e!679466 mapRes!47315))))

(declare-fun condMapEmpty!47315 () Bool)

(declare-fun mapDefault!47315 () ValueCell!14450)

