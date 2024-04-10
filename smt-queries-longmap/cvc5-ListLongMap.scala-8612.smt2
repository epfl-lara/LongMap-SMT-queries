; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104916 () Bool)

(assert start!104916)

(declare-fun b_free!26707 () Bool)

(declare-fun b_next!26707 () Bool)

(assert (=> start!104916 (= b_free!26707 (not b_next!26707))))

(declare-fun tp!93613 () Bool)

(declare-fun b_and!44483 () Bool)

(assert (=> start!104916 (= tp!93613 b_and!44483)))

(declare-fun b!1250537 () Bool)

(declare-fun e!709955 () Bool)

(assert (=> b!1250537 (= e!709955 true)))

(declare-datatypes ((V!47511 0))(
  ( (V!47512 (val!15867 Int)) )
))
(declare-datatypes ((tuple2!20446 0))(
  ( (tuple2!20447 (_1!10234 (_ BitVec 64)) (_2!10234 V!47511)) )
))
(declare-datatypes ((List!27686 0))(
  ( (Nil!27683) (Cons!27682 (h!28891 tuple2!20446) (t!41159 List!27686)) )
))
(declare-datatypes ((ListLongMap!18319 0))(
  ( (ListLongMap!18320 (toList!9175 List!27686)) )
))
(declare-fun lt!564285 () ListLongMap!18319)

(declare-fun -!2000 (ListLongMap!18319 (_ BitVec 64)) ListLongMap!18319)

(assert (=> b!1250537 (= (-!2000 lt!564285 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564285)))

(declare-datatypes ((Unit!41541 0))(
  ( (Unit!41542) )
))
(declare-fun lt!564287 () Unit!41541)

(declare-fun removeNotPresentStillSame!95 (ListLongMap!18319 (_ BitVec 64)) Unit!41541)

(assert (=> b!1250537 (= lt!564287 (removeNotPresentStillSame!95 lt!564285 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250538 () Bool)

(declare-fun res!834138 () Bool)

(declare-fun e!709957 () Bool)

(assert (=> b!1250538 (=> (not res!834138) (not e!709957))))

(declare-datatypes ((array!80886 0))(
  ( (array!80887 (arr!39009 (Array (_ BitVec 32) (_ BitVec 64))) (size!39545 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80886)

(declare-datatypes ((List!27687 0))(
  ( (Nil!27684) (Cons!27683 (h!28892 (_ BitVec 64)) (t!41160 List!27687)) )
))
(declare-fun arrayNoDuplicates!0 (array!80886 (_ BitVec 32) List!27687) Bool)

(assert (=> b!1250538 (= res!834138 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27684))))

(declare-fun b!1250539 () Bool)

(declare-fun e!709956 () Bool)

(declare-fun tp_is_empty!31609 () Bool)

(assert (=> b!1250539 (= e!709956 tp_is_empty!31609)))

(declare-fun b!1250540 () Bool)

(declare-fun res!834135 () Bool)

(assert (=> b!1250540 (=> (not res!834135) (not e!709957))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80886 (_ BitVec 32)) Bool)

(assert (=> b!1250540 (= res!834135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250541 () Bool)

(declare-fun e!709954 () Bool)

(declare-fun mapRes!49177 () Bool)

(assert (=> b!1250541 (= e!709954 (and e!709956 mapRes!49177))))

(declare-fun condMapEmpty!49177 () Bool)

(declare-datatypes ((ValueCell!15041 0))(
  ( (ValueCellFull!15041 (v!18563 V!47511)) (EmptyCell!15041) )
))
(declare-datatypes ((array!80888 0))(
  ( (array!80889 (arr!39010 (Array (_ BitVec 32) ValueCell!15041)) (size!39546 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80888)

(declare-fun mapDefault!49177 () ValueCell!15041)

