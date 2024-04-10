; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133748 () Bool)

(assert start!133748)

(declare-fun b_free!32111 () Bool)

(declare-fun b_next!32111 () Bool)

(assert (=> start!133748 (= b_free!32111 (not b_next!32111))))

(declare-fun tp!113537 () Bool)

(declare-fun b_and!51681 () Bool)

(assert (=> start!133748 (= tp!113537 b_and!51681)))

(declare-fun b!1563935 () Bool)

(declare-fun res!1069192 () Bool)

(declare-fun e!871652 () Bool)

(assert (=> b!1563935 (=> (not res!1069192) (not e!871652))))

(declare-datatypes ((array!104354 0))(
  ( (array!104355 (arr!50369 (Array (_ BitVec 32) (_ BitVec 64))) (size!50919 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104354)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563935 (= res!1069192 (not (validKeyInArray!0 (select (arr!50369 _keys!637) from!782))))))

(declare-fun res!1069191 () Bool)

(assert (=> start!133748 (=> (not res!1069191) (not e!871652))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133748 (= res!1069191 (validMask!0 mask!947))))

(assert (=> start!133748 e!871652))

(assert (=> start!133748 tp!113537))

(declare-fun tp_is_empty!38831 () Bool)

(assert (=> start!133748 tp_is_empty!38831))

(assert (=> start!133748 true))

(declare-fun array_inv!39143 (array!104354) Bool)

(assert (=> start!133748 (array_inv!39143 _keys!637)))

(declare-datatypes ((V!59981 0))(
  ( (V!59982 (val!19499 Int)) )
))
(declare-datatypes ((ValueCell!18385 0))(
  ( (ValueCellFull!18385 (v!22251 V!59981)) (EmptyCell!18385) )
))
(declare-datatypes ((array!104356 0))(
  ( (array!104357 (arr!50370 (Array (_ BitVec 32) ValueCell!18385)) (size!50920 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104356)

(declare-fun e!871651 () Bool)

(declare-fun array_inv!39144 (array!104356) Bool)

(assert (=> start!133748 (and (array_inv!39144 _values!487) e!871651)))

(declare-fun mapIsEmpty!59622 () Bool)

(declare-fun mapRes!59622 () Bool)

(assert (=> mapIsEmpty!59622 mapRes!59622))

(declare-fun b!1563936 () Bool)

(declare-fun e!871653 () Bool)

(assert (=> b!1563936 (= e!871653 false)))

(declare-fun lt!671988 () Bool)

(declare-datatypes ((tuple2!25158 0))(
  ( (tuple2!25159 (_1!12590 (_ BitVec 64)) (_2!12590 V!59981)) )
))
(declare-datatypes ((List!36544 0))(
  ( (Nil!36541) (Cons!36540 (h!37986 tuple2!25158) (t!51391 List!36544)) )
))
(declare-datatypes ((ListLongMap!22593 0))(
  ( (ListLongMap!22594 (toList!11312 List!36544)) )
))
(declare-fun lt!671987 () ListLongMap!22593)

(declare-fun contains!10302 (ListLongMap!22593 (_ BitVec 64)) Bool)

(assert (=> b!1563936 (= lt!671988 (contains!10302 lt!671987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563937 () Bool)

(declare-fun res!1069197 () Bool)

(assert (=> b!1563937 (=> (not res!1069197) (not e!871652))))

(declare-datatypes ((List!36545 0))(
  ( (Nil!36542) (Cons!36541 (h!37987 (_ BitVec 64)) (t!51392 List!36545)) )
))
(declare-fun arrayNoDuplicates!0 (array!104354 (_ BitVec 32) List!36545) Bool)

(assert (=> b!1563937 (= res!1069197 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36542))))

(declare-fun b!1563938 () Bool)

(declare-fun e!871649 () Bool)

(assert (=> b!1563938 (= e!871649 tp_is_empty!38831)))

(declare-fun b!1563939 () Bool)

(declare-fun res!1069196 () Bool)

(assert (=> b!1563939 (=> (not res!1069196) (not e!871652))))

(assert (=> b!1563939 (= res!1069196 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50919 _keys!637)) (bvslt from!782 (size!50919 _keys!637))))))

(declare-fun b!1563940 () Bool)

(declare-fun e!871654 () Bool)

(assert (=> b!1563940 (= e!871654 tp_is_empty!38831)))

(declare-fun b!1563941 () Bool)

(declare-fun res!1069194 () Bool)

(assert (=> b!1563941 (=> (not res!1069194) (not e!871652))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563941 (= res!1069194 (and (= (size!50920 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50919 _keys!637) (size!50920 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59622 () Bool)

(declare-fun tp!113538 () Bool)

(assert (=> mapNonEmpty!59622 (= mapRes!59622 (and tp!113538 e!871654))))

(declare-fun mapValue!59622 () ValueCell!18385)

(declare-fun mapRest!59622 () (Array (_ BitVec 32) ValueCell!18385))

(declare-fun mapKey!59622 () (_ BitVec 32))

(assert (=> mapNonEmpty!59622 (= (arr!50370 _values!487) (store mapRest!59622 mapKey!59622 mapValue!59622))))

(declare-fun b!1563942 () Bool)

(assert (=> b!1563942 (= e!871651 (and e!871649 mapRes!59622))))

(declare-fun condMapEmpty!59622 () Bool)

(declare-fun mapDefault!59622 () ValueCell!18385)

