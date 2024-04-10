; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100246 () Bool)

(assert start!100246)

(declare-fun b!1195671 () Bool)

(declare-fun res!795644 () Bool)

(declare-fun e!679416 () Bool)

(assert (=> b!1195671 (=> (not res!795644) (not e!679416))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77407 0))(
  ( (array!77408 (arr!37350 (Array (_ BitVec 32) (_ BitVec 64))) (size!37886 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77407)

(assert (=> b!1195671 (= res!795644 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37886 _keys!1208))))))

(declare-fun b!1195672 () Bool)

(declare-fun res!795640 () Bool)

(assert (=> b!1195672 (=> (not res!795640) (not e!679416))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45545 0))(
  ( (V!45546 (val!15213 Int)) )
))
(declare-datatypes ((ValueCell!14447 0))(
  ( (ValueCellFull!14447 (v!17851 V!45545)) (EmptyCell!14447) )
))
(declare-datatypes ((array!77409 0))(
  ( (array!77410 (arr!37351 (Array (_ BitVec 32) ValueCell!14447)) (size!37887 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77409)

(assert (=> b!1195672 (= res!795640 (and (= (size!37887 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37886 _keys!1208) (size!37887 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195673 () Bool)

(declare-fun e!679414 () Bool)

(declare-fun tp_is_empty!30313 () Bool)

(assert (=> b!1195673 (= e!679414 tp_is_empty!30313)))

(declare-fun b!1195674 () Bool)

(declare-fun res!795645 () Bool)

(assert (=> b!1195674 (=> (not res!795645) (not e!679416))))

(declare-datatypes ((List!26285 0))(
  ( (Nil!26282) (Cons!26281 (h!27490 (_ BitVec 64)) (t!38956 List!26285)) )
))
(declare-fun arrayNoDuplicates!0 (array!77407 (_ BitVec 32) List!26285) Bool)

(assert (=> b!1195674 (= res!795645 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26282))))

(declare-fun b!1195675 () Bool)

(declare-fun res!795642 () Bool)

(declare-fun e!679412 () Bool)

(assert (=> b!1195675 (=> (not res!795642) (not e!679412))))

(declare-fun lt!542964 () array!77407)

(assert (=> b!1195675 (= res!795642 (arrayNoDuplicates!0 lt!542964 #b00000000000000000000000000000000 Nil!26282))))

(declare-fun b!1195676 () Bool)

(declare-fun res!795641 () Bool)

(assert (=> b!1195676 (=> (not res!795641) (not e!679416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195676 (= res!795641 (validMask!0 mask!1564))))

(declare-fun res!795643 () Bool)

(assert (=> start!100246 (=> (not res!795643) (not e!679416))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100246 (= res!795643 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37886 _keys!1208))))))

(assert (=> start!100246 e!679416))

(declare-fun array_inv!28470 (array!77407) Bool)

(assert (=> start!100246 (array_inv!28470 _keys!1208)))

(assert (=> start!100246 true))

(declare-fun e!679415 () Bool)

(declare-fun array_inv!28471 (array!77409) Bool)

(assert (=> start!100246 (and (array_inv!28471 _values!996) e!679415)))

(declare-fun b!1195677 () Bool)

(declare-fun res!795638 () Bool)

(assert (=> b!1195677 (=> (not res!795638) (not e!679416))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1195677 (= res!795638 (= (select (arr!37350 _keys!1208) i!673) k!934))))

(declare-fun b!1195678 () Bool)

(assert (=> b!1195678 (= e!679416 e!679412)))

(declare-fun res!795637 () Bool)

(assert (=> b!1195678 (=> (not res!795637) (not e!679412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77407 (_ BitVec 32)) Bool)

(assert (=> b!1195678 (= res!795637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542964 mask!1564))))

(assert (=> b!1195678 (= lt!542964 (array!77408 (store (arr!37350 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37886 _keys!1208)))))

(declare-fun mapIsEmpty!47306 () Bool)

(declare-fun mapRes!47306 () Bool)

(assert (=> mapIsEmpty!47306 mapRes!47306))

(declare-fun b!1195679 () Bool)

(declare-fun res!795646 () Bool)

(assert (=> b!1195679 (=> (not res!795646) (not e!679416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195679 (= res!795646 (validKeyInArray!0 k!934))))

(declare-fun b!1195680 () Bool)

(assert (=> b!1195680 (= e!679412 (not true))))

(declare-fun arrayContainsKey!0 (array!77407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195680 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39642 0))(
  ( (Unit!39643) )
))
(declare-fun lt!542963 () Unit!39642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77407 (_ BitVec 64) (_ BitVec 32)) Unit!39642)

(assert (=> b!1195680 (= lt!542963 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195681 () Bool)

(declare-fun res!795639 () Bool)

(assert (=> b!1195681 (=> (not res!795639) (not e!679416))))

(assert (=> b!1195681 (= res!795639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195682 () Bool)

(declare-fun e!679413 () Bool)

(assert (=> b!1195682 (= e!679413 tp_is_empty!30313)))

(declare-fun mapNonEmpty!47306 () Bool)

(declare-fun tp!89916 () Bool)

(assert (=> mapNonEmpty!47306 (= mapRes!47306 (and tp!89916 e!679413))))

(declare-fun mapKey!47306 () (_ BitVec 32))

(declare-fun mapRest!47306 () (Array (_ BitVec 32) ValueCell!14447))

(declare-fun mapValue!47306 () ValueCell!14447)

(assert (=> mapNonEmpty!47306 (= (arr!37351 _values!996) (store mapRest!47306 mapKey!47306 mapValue!47306))))

(declare-fun b!1195683 () Bool)

(assert (=> b!1195683 (= e!679415 (and e!679414 mapRes!47306))))

(declare-fun condMapEmpty!47306 () Bool)

(declare-fun mapDefault!47306 () ValueCell!14447)

