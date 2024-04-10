; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43460 () Bool)

(assert start!43460)

(declare-fun b_free!12239 () Bool)

(declare-fun b_next!12239 () Bool)

(assert (=> start!43460 (= b_free!12239 (not b_next!12239))))

(declare-fun tp!42999 () Bool)

(declare-fun b_and!20999 () Bool)

(assert (=> start!43460 (= tp!42999 b_and!20999)))

(declare-fun b!481417 () Bool)

(declare-fun e!283258 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481417 (= e!283258 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481418 () Bool)

(declare-fun res!287014 () Bool)

(declare-fun e!283261 () Bool)

(assert (=> b!481418 (=> (not res!287014) (not e!283261))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19405 0))(
  ( (V!19406 (val!6923 Int)) )
))
(declare-fun minValue!1458 () V!19405)

(declare-fun zeroValue!1458 () V!19405)

(declare-datatypes ((ValueCell!6514 0))(
  ( (ValueCellFull!6514 (v!9216 V!19405)) (EmptyCell!6514) )
))
(declare-datatypes ((array!31165 0))(
  ( (array!31166 (arr!14985 (Array (_ BitVec 32) ValueCell!6514)) (size!15343 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31165)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31167 0))(
  ( (array!31168 (arr!14986 (Array (_ BitVec 32) (_ BitVec 64))) (size!15344 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31167)

(declare-datatypes ((tuple2!9084 0))(
  ( (tuple2!9085 (_1!4553 (_ BitVec 64)) (_2!4553 V!19405)) )
))
(declare-datatypes ((List!9162 0))(
  ( (Nil!9159) (Cons!9158 (h!10014 tuple2!9084) (t!15376 List!9162)) )
))
(declare-datatypes ((ListLongMap!7997 0))(
  ( (ListLongMap!7998 (toList!4014 List!9162)) )
))
(declare-fun contains!2628 (ListLongMap!7997 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2333 (array!31167 array!31165 (_ BitVec 32) (_ BitVec 32) V!19405 V!19405 (_ BitVec 32) Int) ListLongMap!7997)

(assert (=> b!481418 (= res!287014 (contains!2628 (getCurrentListMap!2333 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!481419 () Bool)

(declare-fun res!287016 () Bool)

(assert (=> b!481419 (=> (not res!287016) (not e!283261))))

(declare-datatypes ((List!9163 0))(
  ( (Nil!9160) (Cons!9159 (h!10015 (_ BitVec 64)) (t!15377 List!9163)) )
))
(declare-fun arrayNoDuplicates!0 (array!31167 (_ BitVec 32) List!9163) Bool)

(assert (=> b!481419 (= res!287016 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9160))))

(declare-fun b!481420 () Bool)

(declare-fun arrayContainsKey!0 (array!31167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481420 (= e!283258 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!481421 () Bool)

(declare-fun res!287013 () Bool)

(assert (=> b!481421 (=> (not res!287013) (not e!283261))))

(assert (=> b!481421 (= res!287013 (and (= (size!15343 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15344 _keys!1874) (size!15343 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287012 () Bool)

(assert (=> start!43460 (=> (not res!287012) (not e!283261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43460 (= res!287012 (validMask!0 mask!2352))))

(assert (=> start!43460 e!283261))

(assert (=> start!43460 true))

(declare-fun tp_is_empty!13751 () Bool)

(assert (=> start!43460 tp_is_empty!13751))

(declare-fun e!283263 () Bool)

(declare-fun array_inv!10808 (array!31165) Bool)

(assert (=> start!43460 (and (array_inv!10808 _values!1516) e!283263)))

(assert (=> start!43460 tp!42999))

(declare-fun array_inv!10809 (array!31167) Bool)

(assert (=> start!43460 (array_inv!10809 _keys!1874)))

(declare-fun b!481422 () Bool)

(assert (=> b!481422 (= e!283261 (not true))))

(declare-fun lt!218522 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31167 (_ BitVec 32)) Bool)

(assert (=> b!481422 (arrayForallSeekEntryOrOpenFound!0 lt!218522 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14120 0))(
  ( (Unit!14121) )
))
(declare-fun lt!218523 () Unit!14120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14120)

(assert (=> b!481422 (= lt!218523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218522))))

(declare-fun arrayScanForKey!0 (array!31167 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481422 (= lt!218522 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!481422 e!283258))

(declare-fun c!57912 () Bool)

(assert (=> b!481422 (= c!57912 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218524 () Unit!14120)

(declare-fun lemmaKeyInListMapIsInArray!131 (array!31167 array!31165 (_ BitVec 32) (_ BitVec 32) V!19405 V!19405 (_ BitVec 64) Int) Unit!14120)

(assert (=> b!481422 (= lt!218524 (lemmaKeyInListMapIsInArray!131 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481423 () Bool)

(declare-fun e!283262 () Bool)

(assert (=> b!481423 (= e!283262 tp_is_empty!13751)))

(declare-fun mapIsEmpty!22336 () Bool)

(declare-fun mapRes!22336 () Bool)

(assert (=> mapIsEmpty!22336 mapRes!22336))

(declare-fun b!481424 () Bool)

(assert (=> b!481424 (= e!283263 (and e!283262 mapRes!22336))))

(declare-fun condMapEmpty!22336 () Bool)

(declare-fun mapDefault!22336 () ValueCell!6514)

