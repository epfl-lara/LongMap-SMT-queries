; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40220 () Bool)

(assert start!40220)

(declare-fun b_free!10487 () Bool)

(declare-fun b_next!10487 () Bool)

(assert (=> start!40220 (= b_free!10487 (not b_next!10487))))

(declare-fun tp!36990 () Bool)

(declare-fun b_and!18455 () Bool)

(assert (=> start!40220 (= tp!36990 b_and!18455)))

(declare-fun b!441044 () Bool)

(declare-fun res!260998 () Bool)

(declare-fun e!259756 () Bool)

(assert (=> b!441044 (=> (not res!260998) (not e!259756))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441044 (= res!260998 (bvsle from!863 i!563))))

(declare-fun b!441045 () Bool)

(declare-fun res!260991 () Bool)

(declare-fun e!259757 () Bool)

(assert (=> b!441045 (=> (not res!260991) (not e!259757))))

(declare-datatypes ((array!27091 0))(
  ( (array!27092 (arr!12995 (Array (_ BitVec 32) (_ BitVec 64))) (size!13347 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27091)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16623 0))(
  ( (V!16624 (val!5864 Int)) )
))
(declare-datatypes ((ValueCell!5476 0))(
  ( (ValueCellFull!5476 (v!8111 V!16623)) (EmptyCell!5476) )
))
(declare-datatypes ((array!27093 0))(
  ( (array!27094 (arr!12996 (Array (_ BitVec 32) ValueCell!5476)) (size!13348 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27093)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!441045 (= res!260991 (and (= (size!13348 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13347 _keys!709) (size!13348 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441046 () Bool)

(assert (=> b!441046 (= e!259757 e!259756)))

(declare-fun res!261000 () Bool)

(assert (=> b!441046 (=> (not res!261000) (not e!259756))))

(declare-fun lt!202774 () array!27091)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27091 (_ BitVec 32)) Bool)

(assert (=> b!441046 (= res!261000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202774 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!441046 (= lt!202774 (array!27092 (store (arr!12995 _keys!709) i!563 k!794) (size!13347 _keys!709)))))

(declare-fun b!441047 () Bool)

(declare-fun e!259758 () Bool)

(assert (=> b!441047 (= e!259758 (not true))))

(declare-fun minValue!515 () V!16623)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202773 () array!27093)

(declare-fun zeroValue!515 () V!16623)

(declare-fun v!412 () V!16623)

(declare-datatypes ((tuple2!7800 0))(
  ( (tuple2!7801 (_1!3911 (_ BitVec 64)) (_2!3911 V!16623)) )
))
(declare-datatypes ((List!7795 0))(
  ( (Nil!7792) (Cons!7791 (h!8647 tuple2!7800) (t!13551 List!7795)) )
))
(declare-datatypes ((ListLongMap!6713 0))(
  ( (ListLongMap!6714 (toList!3372 List!7795)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1561 (array!27091 array!27093 (_ BitVec 32) (_ BitVec 32) V!16623 V!16623 (_ BitVec 32) Int) ListLongMap!6713)

(declare-fun +!1508 (ListLongMap!6713 tuple2!7800) ListLongMap!6713)

(assert (=> b!441047 (= (getCurrentListMapNoExtraKeys!1561 lt!202774 lt!202773 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1508 (getCurrentListMapNoExtraKeys!1561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7801 k!794 v!412)))))

(declare-datatypes ((Unit!13120 0))(
  ( (Unit!13121) )
))
(declare-fun lt!202772 () Unit!13120)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!677 (array!27091 array!27093 (_ BitVec 32) (_ BitVec 32) V!16623 V!16623 (_ BitVec 32) (_ BitVec 64) V!16623 (_ BitVec 32) Int) Unit!13120)

(assert (=> b!441047 (= lt!202772 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!677 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441048 () Bool)

(declare-fun e!259755 () Bool)

(declare-fun tp_is_empty!11639 () Bool)

(assert (=> b!441048 (= e!259755 tp_is_empty!11639)))

(declare-fun b!441050 () Bool)

(declare-fun res!260993 () Bool)

(assert (=> b!441050 (=> (not res!260993) (not e!259757))))

(declare-fun arrayContainsKey!0 (array!27091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441050 (= res!260993 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19080 () Bool)

(declare-fun mapRes!19080 () Bool)

(assert (=> mapIsEmpty!19080 mapRes!19080))

(declare-fun b!441051 () Bool)

(declare-fun res!260992 () Bool)

(assert (=> b!441051 (=> (not res!260992) (not e!259757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441051 (= res!260992 (validKeyInArray!0 k!794))))

(declare-fun b!441052 () Bool)

(assert (=> b!441052 (= e!259756 e!259758)))

(declare-fun res!260989 () Bool)

(assert (=> b!441052 (=> (not res!260989) (not e!259758))))

(assert (=> b!441052 (= res!260989 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202775 () ListLongMap!6713)

(assert (=> b!441052 (= lt!202775 (getCurrentListMapNoExtraKeys!1561 lt!202774 lt!202773 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441052 (= lt!202773 (array!27094 (store (arr!12996 _values!549) i!563 (ValueCellFull!5476 v!412)) (size!13348 _values!549)))))

(declare-fun lt!202771 () ListLongMap!6713)

(assert (=> b!441052 (= lt!202771 (getCurrentListMapNoExtraKeys!1561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441053 () Bool)

(declare-fun res!260988 () Bool)

(assert (=> b!441053 (=> (not res!260988) (not e!259756))))

(declare-datatypes ((List!7796 0))(
  ( (Nil!7793) (Cons!7792 (h!8648 (_ BitVec 64)) (t!13552 List!7796)) )
))
(declare-fun arrayNoDuplicates!0 (array!27091 (_ BitVec 32) List!7796) Bool)

(assert (=> b!441053 (= res!260988 (arrayNoDuplicates!0 lt!202774 #b00000000000000000000000000000000 Nil!7793))))

(declare-fun b!441049 () Bool)

(declare-fun res!260999 () Bool)

(assert (=> b!441049 (=> (not res!260999) (not e!259757))))

(assert (=> b!441049 (= res!260999 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13347 _keys!709))))))

(declare-fun res!260994 () Bool)

(assert (=> start!40220 (=> (not res!260994) (not e!259757))))

(assert (=> start!40220 (= res!260994 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13347 _keys!709))))))

(assert (=> start!40220 e!259757))

(assert (=> start!40220 tp_is_empty!11639))

(assert (=> start!40220 tp!36990))

(assert (=> start!40220 true))

(declare-fun e!259759 () Bool)

(declare-fun array_inv!9432 (array!27093) Bool)

(assert (=> start!40220 (and (array_inv!9432 _values!549) e!259759)))

(declare-fun array_inv!9433 (array!27091) Bool)

(assert (=> start!40220 (array_inv!9433 _keys!709)))

(declare-fun b!441054 () Bool)

(declare-fun e!259760 () Bool)

(assert (=> b!441054 (= e!259759 (and e!259760 mapRes!19080))))

(declare-fun condMapEmpty!19080 () Bool)

(declare-fun mapDefault!19080 () ValueCell!5476)

