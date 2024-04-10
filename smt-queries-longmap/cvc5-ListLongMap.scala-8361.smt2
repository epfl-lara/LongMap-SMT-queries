; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101748 () Bool)

(assert start!101748)

(declare-fun b_free!26437 () Bool)

(declare-fun b_next!26437 () Bool)

(assert (=> start!101748 (= b_free!26437 (not b_next!26437))))

(declare-fun tp!92357 () Bool)

(declare-fun b_and!44135 () Bool)

(assert (=> start!101748 (= tp!92357 b_and!44135)))

(declare-fun b!1225009 () Bool)

(declare-fun res!814054 () Bool)

(declare-fun e!695753 () Bool)

(assert (=> b!1225009 (=> (not res!814054) (not e!695753))))

(declare-datatypes ((array!79065 0))(
  ( (array!79066 (arr!38159 (Array (_ BitVec 32) (_ BitVec 64))) (size!38695 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79065)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79065 (_ BitVec 32)) Bool)

(assert (=> b!1225009 (= res!814054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225010 () Bool)

(declare-fun res!814046 () Bool)

(assert (=> b!1225010 (=> (not res!814046) (not e!695753))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225010 (= res!814046 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38695 _keys!1208))))))

(declare-fun b!1225011 () Bool)

(declare-fun e!695760 () Bool)

(declare-fun tp_is_empty!31141 () Bool)

(assert (=> b!1225011 (= e!695760 tp_is_empty!31141)))

(declare-fun b!1225012 () Bool)

(declare-fun res!814057 () Bool)

(assert (=> b!1225012 (=> (not res!814057) (not e!695753))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1225012 (= res!814057 (= (select (arr!38159 _keys!1208) i!673) k!934))))

(declare-fun b!1225013 () Bool)

(declare-fun res!814056 () Bool)

(assert (=> b!1225013 (=> (not res!814056) (not e!695753))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46649 0))(
  ( (V!46650 (val!15627 Int)) )
))
(declare-datatypes ((ValueCell!14861 0))(
  ( (ValueCellFull!14861 (v!18289 V!46649)) (EmptyCell!14861) )
))
(declare-datatypes ((array!79067 0))(
  ( (array!79068 (arr!38160 (Array (_ BitVec 32) ValueCell!14861)) (size!38696 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79067)

(assert (=> b!1225013 (= res!814056 (and (= (size!38696 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38695 _keys!1208) (size!38696 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225014 () Bool)

(declare-fun res!814055 () Bool)

(assert (=> b!1225014 (=> (not res!814055) (not e!695753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225014 (= res!814055 (validMask!0 mask!1564))))

(declare-fun b!1225015 () Bool)

(declare-fun res!814045 () Bool)

(declare-fun e!695756 () Bool)

(assert (=> b!1225015 (=> (not res!814045) (not e!695756))))

(declare-fun lt!558009 () array!79065)

(declare-datatypes ((List!26942 0))(
  ( (Nil!26939) (Cons!26938 (h!28147 (_ BitVec 64)) (t!40359 List!26942)) )
))
(declare-fun arrayNoDuplicates!0 (array!79065 (_ BitVec 32) List!26942) Bool)

(assert (=> b!1225015 (= res!814045 (arrayNoDuplicates!0 lt!558009 #b00000000000000000000000000000000 Nil!26939))))

(declare-fun b!1225016 () Bool)

(declare-fun e!695762 () Bool)

(declare-fun mapRes!48610 () Bool)

(assert (=> b!1225016 (= e!695762 (and e!695760 mapRes!48610))))

(declare-fun condMapEmpty!48610 () Bool)

(declare-fun mapDefault!48610 () ValueCell!14861)

