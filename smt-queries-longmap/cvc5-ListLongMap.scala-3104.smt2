; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43608 () Bool)

(assert start!43608)

(declare-fun b_free!12343 () Bool)

(declare-fun b_next!12343 () Bool)

(assert (=> start!43608 (= b_free!12343 (not b_next!12343))))

(declare-fun tp!43318 () Bool)

(declare-fun b_and!21107 () Bool)

(assert (=> start!43608 (= tp!43318 b_and!21107)))

(declare-fun b!483063 () Bool)

(declare-fun e!284286 () Bool)

(declare-datatypes ((array!31371 0))(
  ( (array!31372 (arr!15086 (Array (_ BitVec 32) (_ BitVec 64))) (size!15444 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31371)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483063 (= e!284286 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22498 () Bool)

(declare-fun mapRes!22498 () Bool)

(assert (=> mapIsEmpty!22498 mapRes!22498))

(declare-fun b!483064 () Bool)

(declare-fun res!287891 () Bool)

(declare-fun e!284284 () Bool)

(assert (=> b!483064 (=> (not res!287891) (not e!284284))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19545 0))(
  ( (V!19546 (val!6975 Int)) )
))
(declare-fun minValue!1458 () V!19545)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19545)

(declare-datatypes ((ValueCell!6566 0))(
  ( (ValueCellFull!6566 (v!9270 V!19545)) (EmptyCell!6566) )
))
(declare-datatypes ((array!31373 0))(
  ( (array!31374 (arr!15087 (Array (_ BitVec 32) ValueCell!6566)) (size!15445 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31373)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9156 0))(
  ( (tuple2!9157 (_1!4589 (_ BitVec 64)) (_2!4589 V!19545)) )
))
(declare-datatypes ((List!9236 0))(
  ( (Nil!9233) (Cons!9232 (h!10088 tuple2!9156) (t!15454 List!9236)) )
))
(declare-datatypes ((ListLongMap!8069 0))(
  ( (ListLongMap!8070 (toList!4050 List!9236)) )
))
(declare-fun contains!2666 (ListLongMap!8069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2369 (array!31371 array!31373 (_ BitVec 32) (_ BitVec 32) V!19545 V!19545 (_ BitVec 32) Int) ListLongMap!8069)

(assert (=> b!483064 (= res!287891 (contains!2666 (getCurrentListMap!2369 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!483065 () Bool)

(declare-fun res!287893 () Bool)

(assert (=> b!483065 (=> (not res!287893) (not e!284284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31371 (_ BitVec 32)) Bool)

(assert (=> b!483065 (= res!287893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483066 () Bool)

(assert (=> b!483066 (= e!284284 (not true))))

(declare-fun lt!218976 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31371 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483066 (= lt!218976 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!483066 e!284286))

(declare-fun c!58053 () Bool)

(assert (=> b!483066 (= c!58053 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14162 0))(
  ( (Unit!14163) )
))
(declare-fun lt!218977 () Unit!14162)

(declare-fun lemmaKeyInListMapIsInArray!150 (array!31371 array!31373 (_ BitVec 32) (_ BitVec 32) V!19545 V!19545 (_ BitVec 64) Int) Unit!14162)

(assert (=> b!483066 (= lt!218977 (lemmaKeyInListMapIsInArray!150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun res!287890 () Bool)

(assert (=> start!43608 (=> (not res!287890) (not e!284284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43608 (= res!287890 (validMask!0 mask!2352))))

(assert (=> start!43608 e!284284))

(assert (=> start!43608 true))

(declare-fun tp_is_empty!13855 () Bool)

(assert (=> start!43608 tp_is_empty!13855))

(declare-fun e!284283 () Bool)

(declare-fun array_inv!10884 (array!31373) Bool)

(assert (=> start!43608 (and (array_inv!10884 _values!1516) e!284283)))

(assert (=> start!43608 tp!43318))

(declare-fun array_inv!10885 (array!31371) Bool)

(assert (=> start!43608 (array_inv!10885 _keys!1874)))

(declare-fun mapNonEmpty!22498 () Bool)

(declare-fun tp!43317 () Bool)

(declare-fun e!284281 () Bool)

(assert (=> mapNonEmpty!22498 (= mapRes!22498 (and tp!43317 e!284281))))

(declare-fun mapValue!22498 () ValueCell!6566)

(declare-fun mapRest!22498 () (Array (_ BitVec 32) ValueCell!6566))

(declare-fun mapKey!22498 () (_ BitVec 32))

(assert (=> mapNonEmpty!22498 (= (arr!15087 _values!1516) (store mapRest!22498 mapKey!22498 mapValue!22498))))

(declare-fun b!483067 () Bool)

(declare-fun res!287888 () Bool)

(assert (=> b!483067 (=> (not res!287888) (not e!284284))))

(assert (=> b!483067 (= res!287888 (and (= (size!15445 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15444 _keys!1874) (size!15445 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!483068 () Bool)

(assert (=> b!483068 (= e!284286 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483069 () Bool)

(declare-fun res!287889 () Bool)

(assert (=> b!483069 (=> (not res!287889) (not e!284284))))

(declare-datatypes ((List!9237 0))(
  ( (Nil!9234) (Cons!9233 (h!10089 (_ BitVec 64)) (t!15455 List!9237)) )
))
(declare-fun arrayNoDuplicates!0 (array!31371 (_ BitVec 32) List!9237) Bool)

(assert (=> b!483069 (= res!287889 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9234))))

(declare-fun b!483070 () Bool)

(declare-fun e!284282 () Bool)

(assert (=> b!483070 (= e!284282 tp_is_empty!13855)))

(declare-fun b!483071 () Bool)

(declare-fun res!287892 () Bool)

(assert (=> b!483071 (=> (not res!287892) (not e!284284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483071 (= res!287892 (validKeyInArray!0 k!1332))))

(declare-fun b!483072 () Bool)

(assert (=> b!483072 (= e!284283 (and e!284282 mapRes!22498))))

(declare-fun condMapEmpty!22498 () Bool)

(declare-fun mapDefault!22498 () ValueCell!6566)

