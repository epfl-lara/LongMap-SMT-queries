; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133736 () Bool)

(assert start!133736)

(declare-fun b_free!32099 () Bool)

(declare-fun b_next!32099 () Bool)

(assert (=> start!133736 (= b_free!32099 (not b_next!32099))))

(declare-fun tp!113501 () Bool)

(declare-fun b_and!51669 () Bool)

(assert (=> start!133736 (= tp!113501 b_and!51669)))

(declare-fun b!1563755 () Bool)

(declare-fun e!871542 () Bool)

(declare-fun tp_is_empty!38819 () Bool)

(assert (=> b!1563755 (= e!871542 tp_is_empty!38819)))

(declare-fun b!1563756 () Bool)

(declare-fun res!1069069 () Bool)

(declare-fun e!871543 () Bool)

(assert (=> b!1563756 (=> (not res!1069069) (not e!871543))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104330 0))(
  ( (array!104331 (arr!50357 (Array (_ BitVec 32) (_ BitVec 64))) (size!50907 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104330)

(declare-datatypes ((V!59965 0))(
  ( (V!59966 (val!19493 Int)) )
))
(declare-datatypes ((ValueCell!18379 0))(
  ( (ValueCellFull!18379 (v!22245 V!59965)) (EmptyCell!18379) )
))
(declare-datatypes ((array!104332 0))(
  ( (array!104333 (arr!50358 (Array (_ BitVec 32) ValueCell!18379)) (size!50908 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104332)

(assert (=> b!1563756 (= res!1069069 (and (= (size!50908 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50907 _keys!637) (size!50908 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563757 () Bool)

(declare-fun e!871546 () Bool)

(assert (=> b!1563757 (= e!871546 tp_is_empty!38819)))

(declare-fun b!1563758 () Bool)

(declare-fun res!1069068 () Bool)

(assert (=> b!1563758 (=> (not res!1069068) (not e!871543))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563758 (= res!1069068 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50907 _keys!637)) (bvslt from!782 (size!50907 _keys!637))))))

(declare-fun res!1069071 () Bool)

(assert (=> start!133736 (=> (not res!1069071) (not e!871543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133736 (= res!1069071 (validMask!0 mask!947))))

(assert (=> start!133736 e!871543))

(assert (=> start!133736 tp!113501))

(assert (=> start!133736 tp_is_empty!38819))

(assert (=> start!133736 true))

(declare-fun array_inv!39131 (array!104330) Bool)

(assert (=> start!133736 (array_inv!39131 _keys!637)))

(declare-fun e!871541 () Bool)

(declare-fun array_inv!39132 (array!104332) Bool)

(assert (=> start!133736 (and (array_inv!39132 _values!487) e!871541)))

(declare-fun b!1563759 () Bool)

(declare-fun res!1069065 () Bool)

(assert (=> b!1563759 (=> (not res!1069065) (not e!871543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563759 (= res!1069065 (not (validKeyInArray!0 (select (arr!50357 _keys!637) from!782))))))

(declare-fun b!1563760 () Bool)

(declare-fun res!1069066 () Bool)

(assert (=> b!1563760 (=> (not res!1069066) (not e!871543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104330 (_ BitVec 32)) Bool)

(assert (=> b!1563760 (= res!1069066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59604 () Bool)

(declare-fun mapRes!59604 () Bool)

(declare-fun tp!113502 () Bool)

(assert (=> mapNonEmpty!59604 (= mapRes!59604 (and tp!113502 e!871546))))

(declare-fun mapRest!59604 () (Array (_ BitVec 32) ValueCell!18379))

(declare-fun mapKey!59604 () (_ BitVec 32))

(declare-fun mapValue!59604 () ValueCell!18379)

(assert (=> mapNonEmpty!59604 (= (arr!50358 _values!487) (store mapRest!59604 mapKey!59604 mapValue!59604))))

(declare-fun b!1563761 () Bool)

(declare-fun res!1069070 () Bool)

(assert (=> b!1563761 (=> (not res!1069070) (not e!871543))))

(declare-datatypes ((List!36534 0))(
  ( (Nil!36531) (Cons!36530 (h!37976 (_ BitVec 64)) (t!51381 List!36534)) )
))
(declare-fun arrayNoDuplicates!0 (array!104330 (_ BitVec 32) List!36534) Bool)

(assert (=> b!1563761 (= res!1069070 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36531))))

(declare-fun b!1563762 () Bool)

(assert (=> b!1563762 (= e!871541 (and e!871542 mapRes!59604))))

(declare-fun condMapEmpty!59604 () Bool)

(declare-fun mapDefault!59604 () ValueCell!18379)

