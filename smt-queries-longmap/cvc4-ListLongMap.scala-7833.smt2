; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97746 () Bool)

(assert start!97746)

(declare-fun b_free!23447 () Bool)

(declare-fun b_next!23447 () Bool)

(assert (=> start!97746 (= b_free!23447 (not b_next!23447))))

(declare-fun tp!83044 () Bool)

(declare-fun b_and!37721 () Bool)

(assert (=> start!97746 (= tp!83044 b_and!37721)))

(declare-fun b!1117802 () Bool)

(declare-fun res!746491 () Bool)

(declare-fun e!636735 () Bool)

(assert (=> b!1117802 (=> (not res!746491) (not e!636735))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117802 (= res!746491 (validMask!0 mask!1564))))

(declare-fun b!1117803 () Bool)

(declare-fun e!636732 () Bool)

(declare-fun e!636730 () Bool)

(assert (=> b!1117803 (= e!636732 (not e!636730))))

(declare-fun res!746498 () Bool)

(assert (=> b!1117803 (=> res!746498 e!636730)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117803 (= res!746498 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72845 0))(
  ( (array!72846 (arr!35075 (Array (_ BitVec 32) (_ BitVec 64))) (size!35611 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72845)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117803 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36684 0))(
  ( (Unit!36685) )
))
(declare-fun lt!497359 () Unit!36684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72845 (_ BitVec 64) (_ BitVec 32)) Unit!36684)

(assert (=> b!1117803 (= lt!497359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1117804 () Bool)

(declare-fun res!746500 () Bool)

(assert (=> b!1117804 (=> (not res!746500) (not e!636735))))

(assert (=> b!1117804 (= res!746500 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35611 _keys!1208))))))

(declare-fun b!1117805 () Bool)

(declare-fun res!746496 () Bool)

(assert (=> b!1117805 (=> (not res!746496) (not e!636735))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42429 0))(
  ( (V!42430 (val!14045 Int)) )
))
(declare-datatypes ((ValueCell!13279 0))(
  ( (ValueCellFull!13279 (v!16678 V!42429)) (EmptyCell!13279) )
))
(declare-datatypes ((array!72847 0))(
  ( (array!72848 (arr!35076 (Array (_ BitVec 32) ValueCell!13279)) (size!35612 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72847)

(assert (=> b!1117805 (= res!746496 (and (= (size!35612 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35611 _keys!1208) (size!35612 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117807 () Bool)

(declare-fun res!746494 () Bool)

(assert (=> b!1117807 (=> (not res!746494) (not e!636735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72845 (_ BitVec 32)) Bool)

(assert (=> b!1117807 (= res!746494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117808 () Bool)

(declare-fun res!746492 () Bool)

(assert (=> b!1117808 (=> (not res!746492) (not e!636735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117808 (= res!746492 (validKeyInArray!0 k!934))))

(declare-fun b!1117809 () Bool)

(declare-fun e!636733 () Bool)

(declare-fun e!636729 () Bool)

(declare-fun mapRes!43783 () Bool)

(assert (=> b!1117809 (= e!636733 (and e!636729 mapRes!43783))))

(declare-fun condMapEmpty!43783 () Bool)

(declare-fun mapDefault!43783 () ValueCell!13279)

