; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108014 () Bool)

(assert start!108014)

(declare-fun b!1275820 () Bool)

(declare-fun res!847955 () Bool)

(declare-fun e!728405 () Bool)

(assert (=> b!1275820 (=> (not res!847955) (not e!728405))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49485 0))(
  ( (V!49486 (val!16718 Int)) )
))
(declare-datatypes ((ValueCell!15745 0))(
  ( (ValueCellFull!15745 (v!19315 V!49485)) (EmptyCell!15745) )
))
(declare-datatypes ((array!83676 0))(
  ( (array!83677 (arr!40350 (Array (_ BitVec 32) ValueCell!15745)) (size!40900 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83676)

(declare-datatypes ((array!83678 0))(
  ( (array!83679 (arr!40351 (Array (_ BitVec 32) (_ BitVec 64))) (size!40901 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83678)

(assert (=> b!1275820 (= res!847955 (and (= (size!40900 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40901 _keys!1427) (size!40900 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275821 () Bool)

(assert (=> b!1275821 (= e!728405 false)))

(declare-fun lt!575398 () Bool)

(declare-datatypes ((List!28626 0))(
  ( (Nil!28623) (Cons!28622 (h!29831 (_ BitVec 64)) (t!42162 List!28626)) )
))
(declare-fun arrayNoDuplicates!0 (array!83678 (_ BitVec 32) List!28626) Bool)

(assert (=> b!1275821 (= lt!575398 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28623))))

(declare-fun b!1275822 () Bool)

(declare-fun e!728409 () Bool)

(declare-fun tp_is_empty!33287 () Bool)

(assert (=> b!1275822 (= e!728409 tp_is_empty!33287)))

(declare-fun b!1275823 () Bool)

(declare-fun e!728407 () Bool)

(declare-fun e!728408 () Bool)

(declare-fun mapRes!51458 () Bool)

(assert (=> b!1275823 (= e!728407 (and e!728408 mapRes!51458))))

(declare-fun condMapEmpty!51458 () Bool)

(declare-fun mapDefault!51458 () ValueCell!15745)

