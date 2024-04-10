; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99692 () Bool)

(assert start!99692)

(declare-fun b_free!25271 () Bool)

(declare-fun b_next!25271 () Bool)

(assert (=> start!99692 (= b_free!25271 (not b_next!25271))))

(declare-fun tp!88527 () Bool)

(declare-fun b_and!41409 () Bool)

(assert (=> start!99692 (= tp!88527 b_and!41409)))

(declare-fun b!1182687 () Bool)

(declare-fun e!672416 () Bool)

(declare-fun e!672413 () Bool)

(assert (=> b!1182687 (= e!672416 e!672413)))

(declare-fun res!786010 () Bool)

(assert (=> b!1182687 (=> (not res!786010) (not e!672413))))

(declare-datatypes ((array!76405 0))(
  ( (array!76406 (arr!36852 (Array (_ BitVec 32) (_ BitVec 64))) (size!37388 (_ BitVec 32))) )
))
(declare-fun lt!535479 () array!76405)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76405 (_ BitVec 32)) Bool)

(assert (=> b!1182687 (= res!786010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535479 mask!1564))))

(declare-fun _keys!1208 () array!76405)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182687 (= lt!535479 (array!76406 (store (arr!36852 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37388 _keys!1208)))))

(declare-fun b!1182688 () Bool)

(declare-fun res!786009 () Bool)

(assert (=> b!1182688 (=> (not res!786009) (not e!672416))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182688 (= res!786009 (validKeyInArray!0 k!934))))

(declare-fun b!1182689 () Bool)

(declare-fun res!786008 () Bool)

(assert (=> b!1182689 (=> (not res!786008) (not e!672416))))

(assert (=> b!1182689 (= res!786008 (= (select (arr!36852 _keys!1208) i!673) k!934))))

(declare-fun b!1182690 () Bool)

(declare-fun res!786013 () Bool)

(assert (=> b!1182690 (=> (not res!786013) (not e!672416))))

(declare-datatypes ((List!25912 0))(
  ( (Nil!25909) (Cons!25908 (h!27117 (_ BitVec 64)) (t!38175 List!25912)) )
))
(declare-fun arrayNoDuplicates!0 (array!76405 (_ BitVec 32) List!25912) Bool)

(assert (=> b!1182690 (= res!786013 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25909))))

(declare-fun b!1182691 () Bool)

(declare-datatypes ((Unit!39133 0))(
  ( (Unit!39134) )
))
(declare-fun e!672417 () Unit!39133)

(declare-fun Unit!39135 () Unit!39133)

(assert (=> b!1182691 (= e!672417 Unit!39135)))

(declare-fun res!786011 () Bool)

(assert (=> start!99692 (=> (not res!786011) (not e!672416))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99692 (= res!786011 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37388 _keys!1208))))))

(assert (=> start!99692 e!672416))

(declare-fun tp_is_empty!29801 () Bool)

(assert (=> start!99692 tp_is_empty!29801))

(declare-fun array_inv!28136 (array!76405) Bool)

(assert (=> start!99692 (array_inv!28136 _keys!1208)))

(assert (=> start!99692 true))

(assert (=> start!99692 tp!88527))

(declare-datatypes ((V!44861 0))(
  ( (V!44862 (val!14957 Int)) )
))
(declare-datatypes ((ValueCell!14191 0))(
  ( (ValueCellFull!14191 (v!17595 V!44861)) (EmptyCell!14191) )
))
(declare-datatypes ((array!76407 0))(
  ( (array!76408 (arr!36853 (Array (_ BitVec 32) ValueCell!14191)) (size!37389 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76407)

(declare-fun e!672408 () Bool)

(declare-fun array_inv!28137 (array!76407) Bool)

(assert (=> start!99692 (and (array_inv!28137 _values!996) e!672408)))

(declare-fun mapIsEmpty!46529 () Bool)

(declare-fun mapRes!46529 () Bool)

(assert (=> mapIsEmpty!46529 mapRes!46529))

(declare-fun b!1182692 () Bool)

(declare-fun e!672415 () Bool)

(assert (=> b!1182692 (= e!672408 (and e!672415 mapRes!46529))))

(declare-fun condMapEmpty!46529 () Bool)

(declare-fun mapDefault!46529 () ValueCell!14191)

