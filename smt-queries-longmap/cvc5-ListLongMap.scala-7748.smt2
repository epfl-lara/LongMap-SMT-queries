; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97232 () Bool)

(assert start!97232)

(declare-fun b!1106538 () Bool)

(declare-fun e!631422 () Bool)

(declare-fun e!631425 () Bool)

(assert (=> b!1106538 (= e!631422 e!631425)))

(declare-fun res!738448 () Bool)

(assert (=> b!1106538 (=> (not res!738448) (not e!631425))))

(declare-datatypes ((array!71843 0))(
  ( (array!71844 (arr!34574 (Array (_ BitVec 32) (_ BitVec 64))) (size!35110 (_ BitVec 32))) )
))
(declare-fun lt!495475 () array!71843)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71843 (_ BitVec 32)) Bool)

(assert (=> b!1106538 (= res!738448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495475 mask!1564))))

(declare-fun _keys!1208 () array!71843)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106538 (= lt!495475 (array!71844 (store (arr!34574 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35110 _keys!1208)))))

(declare-fun b!1106539 () Bool)

(declare-fun res!738442 () Bool)

(assert (=> b!1106539 (=> (not res!738442) (not e!631422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106539 (= res!738442 (validMask!0 mask!1564))))

(declare-fun b!1106540 () Bool)

(assert (=> b!1106540 (= e!631425 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106540 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36312 0))(
  ( (Unit!36313) )
))
(declare-fun lt!495476 () Unit!36312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71843 (_ BitVec 64) (_ BitVec 32)) Unit!36312)

(assert (=> b!1106540 (= lt!495476 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106541 () Bool)

(declare-fun res!738447 () Bool)

(assert (=> b!1106541 (=> (not res!738447) (not e!631422))))

(declare-datatypes ((List!24098 0))(
  ( (Nil!24095) (Cons!24094 (h!25303 (_ BitVec 64)) (t!34363 List!24098)) )
))
(declare-fun arrayNoDuplicates!0 (array!71843 (_ BitVec 32) List!24098) Bool)

(assert (=> b!1106541 (= res!738447 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24095))))

(declare-fun b!1106542 () Bool)

(declare-fun e!631420 () Bool)

(declare-fun tp_is_empty!27463 () Bool)

(assert (=> b!1106542 (= e!631420 tp_is_empty!27463)))

(declare-fun b!1106543 () Bool)

(declare-fun e!631424 () Bool)

(declare-fun mapRes!43012 () Bool)

(assert (=> b!1106543 (= e!631424 (and e!631420 mapRes!43012))))

(declare-fun condMapEmpty!43012 () Bool)

(declare-datatypes ((V!41745 0))(
  ( (V!41746 (val!13788 Int)) )
))
(declare-datatypes ((ValueCell!13022 0))(
  ( (ValueCellFull!13022 (v!16421 V!41745)) (EmptyCell!13022) )
))
(declare-datatypes ((array!71845 0))(
  ( (array!71846 (arr!34575 (Array (_ BitVec 32) ValueCell!13022)) (size!35111 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71845)

(declare-fun mapDefault!43012 () ValueCell!13022)

