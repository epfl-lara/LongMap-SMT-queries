; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99896 () Bool)

(assert start!99896)

(declare-fun b_free!25475 () Bool)

(declare-fun b_next!25475 () Bool)

(assert (=> start!99896 (= b_free!25475 (not b_next!25475))))

(declare-fun tp!89139 () Bool)

(declare-fun b_and!41817 () Bool)

(assert (=> start!99896 (= tp!89139 b_and!41817)))

(declare-fun b!1188837 () Bool)

(declare-fun res!790487 () Bool)

(declare-fun e!675944 () Bool)

(assert (=> b!1188837 (=> (not res!790487) (not e!675944))))

(declare-datatypes ((array!76805 0))(
  ( (array!76806 (arr!37052 (Array (_ BitVec 32) (_ BitVec 64))) (size!37588 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76805)

(declare-datatypes ((List!26083 0))(
  ( (Nil!26080) (Cons!26079 (h!27288 (_ BitVec 64)) (t!38550 List!26083)) )
))
(declare-fun arrayNoDuplicates!0 (array!76805 (_ BitVec 32) List!26083) Bool)

(assert (=> b!1188837 (= res!790487 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26080))))

(declare-fun b!1188838 () Bool)

(declare-fun e!675942 () Bool)

(declare-fun tp_is_empty!30005 () Bool)

(assert (=> b!1188838 (= e!675942 tp_is_empty!30005)))

(declare-fun b!1188839 () Bool)

(declare-fun res!790491 () Bool)

(assert (=> b!1188839 (=> (not res!790491) (not e!675944))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188839 (= res!790491 (validMask!0 mask!1564))))

(declare-fun b!1188840 () Bool)

(declare-fun res!790492 () Bool)

(assert (=> b!1188840 (=> (not res!790492) (not e!675944))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45133 0))(
  ( (V!45134 (val!15059 Int)) )
))
(declare-datatypes ((ValueCell!14293 0))(
  ( (ValueCellFull!14293 (v!17697 V!45133)) (EmptyCell!14293) )
))
(declare-datatypes ((array!76807 0))(
  ( (array!76808 (arr!37053 (Array (_ BitVec 32) ValueCell!14293)) (size!37589 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76807)

(assert (=> b!1188840 (= res!790492 (and (= (size!37589 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37588 _keys!1208) (size!37589 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188841 () Bool)

(declare-fun res!790490 () Bool)

(assert (=> b!1188841 (=> (not res!790490) (not e!675944))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188841 (= res!790490 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37588 _keys!1208))))))

(declare-fun mapNonEmpty!46835 () Bool)

(declare-fun mapRes!46835 () Bool)

(declare-fun tp!89138 () Bool)

(declare-fun e!675939 () Bool)

(assert (=> mapNonEmpty!46835 (= mapRes!46835 (and tp!89138 e!675939))))

(declare-fun mapRest!46835 () (Array (_ BitVec 32) ValueCell!14293))

(declare-fun mapKey!46835 () (_ BitVec 32))

(declare-fun mapValue!46835 () ValueCell!14293)

(assert (=> mapNonEmpty!46835 (= (arr!37053 _values!996) (store mapRest!46835 mapKey!46835 mapValue!46835))))

(declare-fun b!1188842 () Bool)

(declare-fun res!790485 () Bool)

(assert (=> b!1188842 (=> (not res!790485) (not e!675944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76805 (_ BitVec 32)) Bool)

(assert (=> b!1188842 (= res!790485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188843 () Bool)

(declare-fun res!790494 () Bool)

(assert (=> b!1188843 (=> (not res!790494) (not e!675944))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188843 (= res!790494 (validKeyInArray!0 k!934))))

(declare-fun b!1188844 () Bool)

(declare-fun res!790493 () Bool)

(assert (=> b!1188844 (=> (not res!790493) (not e!675944))))

(assert (=> b!1188844 (= res!790493 (= (select (arr!37052 _keys!1208) i!673) k!934))))

(declare-fun b!1188845 () Bool)

(declare-fun e!675943 () Bool)

(assert (=> b!1188845 (= e!675943 (and e!675942 mapRes!46835))))

(declare-fun condMapEmpty!46835 () Bool)

(declare-fun mapDefault!46835 () ValueCell!14293)

