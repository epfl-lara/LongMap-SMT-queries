; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97710 () Bool)

(assert start!97710)

(declare-fun b!1117084 () Bool)

(declare-fun res!745939 () Bool)

(declare-fun e!636393 () Bool)

(assert (=> b!1117084 (=> (not res!745939) (not e!636393))))

(declare-datatypes ((array!72779 0))(
  ( (array!72780 (arr!35042 (Array (_ BitVec 32) (_ BitVec 64))) (size!35578 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72779)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72779 (_ BitVec 32)) Bool)

(assert (=> b!1117084 (= res!745939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117085 () Bool)

(declare-fun e!636388 () Bool)

(assert (=> b!1117085 (= e!636388 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117085 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36660 0))(
  ( (Unit!36661) )
))
(declare-fun lt!497234 () Unit!36660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72779 (_ BitVec 64) (_ BitVec 32)) Unit!36660)

(assert (=> b!1117085 (= lt!497234 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1117086 () Bool)

(assert (=> b!1117086 (= e!636393 e!636388)))

(declare-fun res!745942 () Bool)

(assert (=> b!1117086 (=> (not res!745942) (not e!636388))))

(declare-fun lt!497233 () array!72779)

(assert (=> b!1117086 (= res!745942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497233 mask!1564))))

(assert (=> b!1117086 (= lt!497233 (array!72780 (store (arr!35042 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35578 _keys!1208)))))

(declare-fun b!1117087 () Bool)

(declare-fun res!745941 () Bool)

(assert (=> b!1117087 (=> (not res!745941) (not e!636393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117087 (= res!745941 (validMask!0 mask!1564))))

(declare-fun b!1117088 () Bool)

(declare-fun e!636392 () Bool)

(declare-fun tp_is_empty!27941 () Bool)

(assert (=> b!1117088 (= e!636392 tp_is_empty!27941)))

(declare-fun b!1117089 () Bool)

(declare-fun e!636389 () Bool)

(declare-fun mapRes!43729 () Bool)

(assert (=> b!1117089 (= e!636389 (and e!636392 mapRes!43729))))

(declare-fun condMapEmpty!43729 () Bool)

(declare-datatypes ((V!42381 0))(
  ( (V!42382 (val!14027 Int)) )
))
(declare-datatypes ((ValueCell!13261 0))(
  ( (ValueCellFull!13261 (v!16660 V!42381)) (EmptyCell!13261) )
))
(declare-datatypes ((array!72781 0))(
  ( (array!72782 (arr!35043 (Array (_ BitVec 32) ValueCell!13261)) (size!35579 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72781)

(declare-fun mapDefault!43729 () ValueCell!13261)

