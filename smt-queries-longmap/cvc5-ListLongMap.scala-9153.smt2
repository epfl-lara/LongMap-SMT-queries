; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109798 () Bool)

(assert start!109798)

(declare-fun b_free!29191 () Bool)

(declare-fun b_next!29191 () Bool)

(assert (=> start!109798 (= b_free!29191 (not b_next!29191))))

(declare-fun tp!102707 () Bool)

(declare-fun b_and!47305 () Bool)

(assert (=> start!109798 (= tp!102707 b_and!47305)))

(declare-fun b!1300602 () Bool)

(declare-fun e!741892 () Bool)

(declare-fun tp_is_empty!34831 () Bool)

(assert (=> b!1300602 (= e!741892 tp_is_empty!34831)))

(declare-fun b!1300603 () Bool)

(declare-fun call!63675 () Bool)

(assert (=> b!1300603 call!63675))

(declare-datatypes ((Unit!43040 0))(
  ( (Unit!43041) )
))
(declare-fun lt!581425 () Unit!43040)

(declare-fun call!63673 () Unit!43040)

(assert (=> b!1300603 (= lt!581425 call!63673)))

(declare-datatypes ((V!51545 0))(
  ( (V!51546 (val!17490 Int)) )
))
(declare-datatypes ((tuple2!22558 0))(
  ( (tuple2!22559 (_1!11290 (_ BitVec 64)) (_2!11290 V!51545)) )
))
(declare-datatypes ((List!29691 0))(
  ( (Nil!29688) (Cons!29687 (h!30896 tuple2!22558) (t!43265 List!29691)) )
))
(declare-datatypes ((ListLongMap!20215 0))(
  ( (ListLongMap!20216 (toList!10123 List!29691)) )
))
(declare-fun lt!581428 () ListLongMap!20215)

(declare-fun call!63676 () ListLongMap!20215)

(assert (=> b!1300603 (= lt!581428 call!63676)))

(declare-fun e!741895 () Unit!43040)

(assert (=> b!1300603 (= e!741895 lt!581425)))

(declare-fun b!1300604 () Bool)

(declare-fun res!864269 () Bool)

(declare-fun e!741896 () Bool)

(assert (=> b!1300604 (=> (not res!864269) (not e!741896))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16517 0))(
  ( (ValueCellFull!16517 (v!20098 V!51545)) (EmptyCell!16517) )
))
(declare-datatypes ((array!86674 0))(
  ( (array!86675 (arr!41833 (Array (_ BitVec 32) ValueCell!16517)) (size!42383 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86674)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86676 0))(
  ( (array!86677 (arr!41834 (Array (_ BitVec 32) (_ BitVec 64))) (size!42384 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86676)

(assert (=> b!1300604 (= res!864269 (and (= (size!42383 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42384 _keys!1741) (size!42383 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300605 () Bool)

(declare-fun c!124607 () Bool)

(declare-fun lt!581427 () Bool)

(assert (=> b!1300605 (= c!124607 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581427))))

(declare-fun e!741893 () Unit!43040)

(assert (=> b!1300605 (= e!741895 e!741893)))

(declare-fun b!1300606 () Bool)

(declare-fun lt!581426 () Unit!43040)

(assert (=> b!1300606 (= e!741893 lt!581426)))

(declare-fun lt!581431 () ListLongMap!20215)

(assert (=> b!1300606 (= lt!581431 call!63676)))

(assert (=> b!1300606 (= lt!581426 call!63673)))

(assert (=> b!1300606 call!63675))

(declare-fun b!1300607 () Bool)

(declare-fun e!741890 () Unit!43040)

(declare-fun lt!581432 () Unit!43040)

(assert (=> b!1300607 (= e!741890 lt!581432)))

(declare-fun lt!581430 () ListLongMap!20215)

(declare-fun call!63674 () ListLongMap!20215)

(assert (=> b!1300607 (= lt!581430 call!63674)))

(declare-fun lt!581435 () ListLongMap!20215)

(declare-fun zeroValue!1387 () V!51545)

(declare-fun +!4453 (ListLongMap!20215 tuple2!22558) ListLongMap!20215)

(assert (=> b!1300607 (= lt!581435 (+!4453 lt!581430 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!51545)

(declare-fun lt!581434 () Unit!43040)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!75 ((_ BitVec 64) (_ BitVec 64) V!51545 ListLongMap!20215) Unit!43040)

(assert (=> b!1300607 (= lt!581434 (lemmaInListMapAfterAddingDiffThenInBefore!75 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581435))))

(declare-fun call!63678 () Bool)

(assert (=> b!1300607 call!63678))

(declare-fun call!63677 () Unit!43040)

(assert (=> b!1300607 (= lt!581432 call!63677)))

(declare-fun contains!8249 (ListLongMap!20215 (_ BitVec 64)) Bool)

(assert (=> b!1300607 (contains!8249 lt!581430 k!1205)))

(declare-fun b!1300608 () Bool)

(assert (=> b!1300608 (= e!741890 e!741895)))

(declare-fun c!124606 () Bool)

(assert (=> b!1300608 (= c!124606 (and (not lt!581427) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300609 () Bool)

(declare-fun res!864268 () Bool)

(assert (=> b!1300609 (=> (not res!864268) (not e!741896))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5150 (array!86676 array!86674 (_ BitVec 32) (_ BitVec 32) V!51545 V!51545 (_ BitVec 32) Int) ListLongMap!20215)

(assert (=> b!1300609 (= res!864268 (contains!8249 (getCurrentListMap!5150 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1300610 () Bool)

(declare-fun e!741889 () Bool)

(declare-fun mapRes!53822 () Bool)

(assert (=> b!1300610 (= e!741889 (and e!741892 mapRes!53822))))

(declare-fun condMapEmpty!53822 () Bool)

(declare-fun mapDefault!53822 () ValueCell!16517)

