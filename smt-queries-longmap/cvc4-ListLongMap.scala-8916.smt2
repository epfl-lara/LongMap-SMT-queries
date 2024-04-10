; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108168 () Bool)

(assert start!108168)

(declare-fun b_free!27863 () Bool)

(declare-fun b_next!27863 () Bool)

(assert (=> start!108168 (= b_free!27863 (not b_next!27863))))

(declare-fun tp!98546 () Bool)

(declare-fun b_and!45921 () Bool)

(assert (=> start!108168 (= tp!98546 b_and!45921)))

(declare-fun b!1277361 () Bool)

(declare-fun e!729487 () Bool)

(declare-fun tp_is_empty!33413 () Bool)

(assert (=> b!1277361 (= e!729487 tp_is_empty!33413)))

(declare-fun b!1277362 () Bool)

(declare-fun e!729485 () Bool)

(assert (=> b!1277362 (= e!729485 tp_is_empty!33413)))

(declare-fun mapNonEmpty!51653 () Bool)

(declare-fun mapRes!51653 () Bool)

(declare-fun tp!98545 () Bool)

(assert (=> mapNonEmpty!51653 (= mapRes!51653 (and tp!98545 e!729487))))

(declare-fun mapKey!51653 () (_ BitVec 32))

(declare-datatypes ((V!49653 0))(
  ( (V!49654 (val!16781 Int)) )
))
(declare-datatypes ((ValueCell!15808 0))(
  ( (ValueCellFull!15808 (v!19379 V!49653)) (EmptyCell!15808) )
))
(declare-fun mapRest!51653 () (Array (_ BitVec 32) ValueCell!15808))

(declare-fun mapValue!51653 () ValueCell!15808)

(declare-datatypes ((array!83920 0))(
  ( (array!83921 (arr!40470 (Array (_ BitVec 32) ValueCell!15808)) (size!41020 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83920)

(assert (=> mapNonEmpty!51653 (= (arr!40470 _values!1187) (store mapRest!51653 mapKey!51653 mapValue!51653))))

(declare-fun b!1277363 () Bool)

(declare-fun res!848785 () Bool)

(declare-fun e!729486 () Bool)

(assert (=> b!1277363 (=> (not res!848785) (not e!729486))))

(declare-datatypes ((array!83922 0))(
  ( (array!83923 (arr!40471 (Array (_ BitVec 32) (_ BitVec 64))) (size!41021 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83922)

(declare-datatypes ((List!28702 0))(
  ( (Nil!28699) (Cons!28698 (h!29907 (_ BitVec 64)) (t!42240 List!28702)) )
))
(declare-fun arrayNoDuplicates!0 (array!83922 (_ BitVec 32) List!28702) Bool)

(assert (=> b!1277363 (= res!848785 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28699))))

(declare-fun b!1277364 () Bool)

(declare-fun res!848784 () Bool)

(assert (=> b!1277364 (=> (not res!848784) (not e!729486))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277364 (= res!848784 (and (= (size!41020 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41021 _keys!1427) (size!41020 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277365 () Bool)

(declare-fun e!729489 () Bool)

(assert (=> b!1277365 (= e!729489 (and e!729485 mapRes!51653))))

(declare-fun condMapEmpty!51653 () Bool)

(declare-fun mapDefault!51653 () ValueCell!15808)

