; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97686 () Bool)

(assert start!97686)

(declare-fun b!1116615 () Bool)

(declare-fun res!745576 () Bool)

(declare-fun e!636176 () Bool)

(assert (=> b!1116615 (=> (not res!745576) (not e!636176))))

(declare-datatypes ((array!72731 0))(
  ( (array!72732 (arr!35018 (Array (_ BitVec 32) (_ BitVec 64))) (size!35554 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72731)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1116615 (= res!745576 (= (select (arr!35018 _keys!1208) i!673) k!934))))

(declare-fun b!1116616 () Bool)

(declare-fun e!636177 () Bool)

(assert (=> b!1116616 (= e!636176 e!636177)))

(declare-fun res!745580 () Bool)

(assert (=> b!1116616 (=> (not res!745580) (not e!636177))))

(declare-fun lt!497161 () array!72731)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72731 (_ BitVec 32)) Bool)

(assert (=> b!1116616 (= res!745580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497161 mask!1564))))

(assert (=> b!1116616 (= lt!497161 (array!72732 (store (arr!35018 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35554 _keys!1208)))))

(declare-fun b!1116617 () Bool)

(declare-fun res!745574 () Bool)

(assert (=> b!1116617 (=> (not res!745574) (not e!636176))))

(assert (=> b!1116617 (= res!745574 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35554 _keys!1208))))))

(declare-fun b!1116618 () Bool)

(declare-fun e!636175 () Bool)

(declare-fun tp_is_empty!27917 () Bool)

(assert (=> b!1116618 (= e!636175 tp_is_empty!27917)))

(declare-fun res!745573 () Bool)

(assert (=> start!97686 (=> (not res!745573) (not e!636176))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97686 (= res!745573 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35554 _keys!1208))))))

(assert (=> start!97686 e!636176))

(declare-fun array_inv!26912 (array!72731) Bool)

(assert (=> start!97686 (array_inv!26912 _keys!1208)))

(assert (=> start!97686 true))

(declare-datatypes ((V!42349 0))(
  ( (V!42350 (val!14015 Int)) )
))
(declare-datatypes ((ValueCell!13249 0))(
  ( (ValueCellFull!13249 (v!16648 V!42349)) (EmptyCell!13249) )
))
(declare-datatypes ((array!72733 0))(
  ( (array!72734 (arr!35019 (Array (_ BitVec 32) ValueCell!13249)) (size!35555 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72733)

(declare-fun e!636172 () Bool)

(declare-fun array_inv!26913 (array!72733) Bool)

(assert (=> start!97686 (and (array_inv!26913 _values!996) e!636172)))

(declare-fun b!1116619 () Bool)

(declare-fun res!745581 () Bool)

(assert (=> b!1116619 (=> (not res!745581) (not e!636176))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116619 (= res!745581 (and (= (size!35555 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35554 _keys!1208) (size!35555 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116620 () Bool)

(declare-fun res!745578 () Bool)

(assert (=> b!1116620 (=> (not res!745578) (not e!636177))))

(declare-datatypes ((List!24371 0))(
  ( (Nil!24368) (Cons!24367 (h!25576 (_ BitVec 64)) (t!34852 List!24371)) )
))
(declare-fun arrayNoDuplicates!0 (array!72731 (_ BitVec 32) List!24371) Bool)

(assert (=> b!1116620 (= res!745578 (arrayNoDuplicates!0 lt!497161 #b00000000000000000000000000000000 Nil!24368))))

(declare-fun b!1116621 () Bool)

(declare-fun e!636174 () Bool)

(declare-fun mapRes!43693 () Bool)

(assert (=> b!1116621 (= e!636172 (and e!636174 mapRes!43693))))

(declare-fun condMapEmpty!43693 () Bool)

(declare-fun mapDefault!43693 () ValueCell!13249)

