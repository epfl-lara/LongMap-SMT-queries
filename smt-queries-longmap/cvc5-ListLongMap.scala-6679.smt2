; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84046 () Bool)

(assert start!84046)

(declare-fun b_free!19801 () Bool)

(declare-fun b_next!19801 () Bool)

(assert (=> start!84046 (= b_free!19801 (not b_next!19801))))

(declare-fun tp!68925 () Bool)

(declare-fun b_and!31685 () Bool)

(assert (=> start!84046 (= tp!68925 b_and!31685)))

(declare-fun b!982559 () Bool)

(declare-fun e!553858 () Bool)

(declare-fun tp_is_empty!22849 () Bool)

(assert (=> b!982559 (= e!553858 tp_is_empty!22849)))

(declare-fun b!982561 () Bool)

(declare-fun res!657525 () Bool)

(declare-fun e!553856 () Bool)

(assert (=> b!982561 (=> (not res!657525) (not e!553856))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982561 (= res!657525 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982562 () Bool)

(declare-fun e!553859 () Bool)

(assert (=> b!982562 (= e!553859 (not true))))

(declare-datatypes ((V!35449 0))(
  ( (V!35450 (val!11475 Int)) )
))
(declare-datatypes ((tuple2!14700 0))(
  ( (tuple2!14701 (_1!7361 (_ BitVec 64)) (_2!7361 V!35449)) )
))
(declare-datatypes ((List!20580 0))(
  ( (Nil!20577) (Cons!20576 (h!21738 tuple2!14700) (t!29331 List!20580)) )
))
(declare-datatypes ((ListLongMap!13397 0))(
  ( (ListLongMap!13398 (toList!6714 List!20580)) )
))
(declare-fun lt!436186 () ListLongMap!13397)

(declare-fun lt!436188 () tuple2!14700)

(declare-fun lt!436190 () tuple2!14700)

(declare-fun +!3012 (ListLongMap!13397 tuple2!14700) ListLongMap!13397)

(assert (=> b!982562 (= (+!3012 (+!3012 lt!436186 lt!436188) lt!436190) (+!3012 (+!3012 lt!436186 lt!436190) lt!436188))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61689 0))(
  ( (array!61690 (arr!29702 (Array (_ BitVec 32) (_ BitVec 64))) (size!30181 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61689)

(declare-fun lt!436189 () V!35449)

(assert (=> b!982562 (= lt!436190 (tuple2!14701 (select (arr!29702 _keys!1544) from!1932) lt!436189))))

(declare-fun zeroValue!1220 () V!35449)

(assert (=> b!982562 (= lt!436188 (tuple2!14701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32663 0))(
  ( (Unit!32664) )
))
(declare-fun lt!436187 () Unit!32663)

(declare-fun addCommutativeForDiffKeys!640 (ListLongMap!13397 (_ BitVec 64) V!35449 (_ BitVec 64) V!35449) Unit!32663)

(assert (=> b!982562 (= lt!436187 (addCommutativeForDiffKeys!640 lt!436186 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29702 _keys!1544) from!1932) lt!436189))))

(declare-fun b!982563 () Bool)

(declare-fun res!657527 () Bool)

(assert (=> b!982563 (=> (not res!657527) (not e!553856))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10943 0))(
  ( (ValueCellFull!10943 (v!14037 V!35449)) (EmptyCell!10943) )
))
(declare-datatypes ((array!61691 0))(
  ( (array!61692 (arr!29703 (Array (_ BitVec 32) ValueCell!10943)) (size!30182 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61691)

(assert (=> b!982563 (= res!657527 (and (= (size!30182 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30181 _keys!1544) (size!30182 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36302 () Bool)

(declare-fun mapRes!36302 () Bool)

(declare-fun tp!68926 () Bool)

(declare-fun e!553857 () Bool)

(assert (=> mapNonEmpty!36302 (= mapRes!36302 (and tp!68926 e!553857))))

(declare-fun mapRest!36302 () (Array (_ BitVec 32) ValueCell!10943))

(declare-fun mapKey!36302 () (_ BitVec 32))

(declare-fun mapValue!36302 () ValueCell!10943)

(assert (=> mapNonEmpty!36302 (= (arr!29703 _values!1278) (store mapRest!36302 mapKey!36302 mapValue!36302))))

(declare-fun b!982564 () Bool)

(declare-fun res!657529 () Bool)

(assert (=> b!982564 (=> (not res!657529) (not e!553856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61689 (_ BitVec 32)) Bool)

(assert (=> b!982564 (= res!657529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982565 () Bool)

(assert (=> b!982565 (= e!553857 tp_is_empty!22849)))

(declare-fun mapIsEmpty!36302 () Bool)

(assert (=> mapIsEmpty!36302 mapRes!36302))

(declare-fun b!982566 () Bool)

(declare-fun res!657523 () Bool)

(assert (=> b!982566 (=> (not res!657523) (not e!553856))))

(assert (=> b!982566 (= res!657523 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30181 _keys!1544))))))

(declare-fun b!982567 () Bool)

(declare-fun res!657528 () Bool)

(assert (=> b!982567 (=> (not res!657528) (not e!553856))))

(declare-datatypes ((List!20581 0))(
  ( (Nil!20578) (Cons!20577 (h!21739 (_ BitVec 64)) (t!29332 List!20581)) )
))
(declare-fun arrayNoDuplicates!0 (array!61689 (_ BitVec 32) List!20581) Bool)

(assert (=> b!982567 (= res!657528 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20578))))

(declare-fun b!982560 () Bool)

(declare-fun res!657524 () Bool)

(assert (=> b!982560 (=> (not res!657524) (not e!553856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982560 (= res!657524 (validKeyInArray!0 (select (arr!29702 _keys!1544) from!1932)))))

(declare-fun res!657526 () Bool)

(assert (=> start!84046 (=> (not res!657526) (not e!553856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84046 (= res!657526 (validMask!0 mask!1948))))

(assert (=> start!84046 e!553856))

(assert (=> start!84046 true))

(assert (=> start!84046 tp_is_empty!22849))

(declare-fun e!553860 () Bool)

(declare-fun array_inv!22969 (array!61691) Bool)

(assert (=> start!84046 (and (array_inv!22969 _values!1278) e!553860)))

(assert (=> start!84046 tp!68925))

(declare-fun array_inv!22970 (array!61689) Bool)

(assert (=> start!84046 (array_inv!22970 _keys!1544)))

(declare-fun b!982568 () Bool)

(assert (=> b!982568 (= e!553860 (and e!553858 mapRes!36302))))

(declare-fun condMapEmpty!36302 () Bool)

(declare-fun mapDefault!36302 () ValueCell!10943)

