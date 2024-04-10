; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43618 () Bool)

(assert start!43618)

(declare-fun b_free!12353 () Bool)

(declare-fun b_next!12353 () Bool)

(assert (=> start!43618 (= b_free!12353 (not b_next!12353))))

(declare-fun tp!43348 () Bool)

(declare-fun b_and!21117 () Bool)

(assert (=> start!43618 (= tp!43348 b_and!21117)))

(declare-fun b!483244 () Bool)

(declare-fun res!287997 () Bool)

(declare-fun e!284380 () Bool)

(assert (=> b!483244 (=> (not res!287997) (not e!284380))))

(declare-datatypes ((array!31391 0))(
  ( (array!31392 (arr!15096 (Array (_ BitVec 32) (_ BitVec 64))) (size!15454 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31391)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31391 (_ BitVec 32)) Bool)

(assert (=> b!483244 (= res!287997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483245 () Bool)

(declare-fun e!284381 () Bool)

(declare-fun tp_is_empty!13865 () Bool)

(assert (=> b!483245 (= e!284381 tp_is_empty!13865)))

(declare-fun res!287999 () Bool)

(assert (=> start!43618 (=> (not res!287999) (not e!284380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43618 (= res!287999 (validMask!0 mask!2352))))

(assert (=> start!43618 e!284380))

(assert (=> start!43618 true))

(assert (=> start!43618 tp_is_empty!13865))

(declare-datatypes ((V!19557 0))(
  ( (V!19558 (val!6980 Int)) )
))
(declare-datatypes ((ValueCell!6571 0))(
  ( (ValueCellFull!6571 (v!9275 V!19557)) (EmptyCell!6571) )
))
(declare-datatypes ((array!31393 0))(
  ( (array!31394 (arr!15097 (Array (_ BitVec 32) ValueCell!6571)) (size!15455 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31393)

(declare-fun e!284384 () Bool)

(declare-fun array_inv!10894 (array!31393) Bool)

(assert (=> start!43618 (and (array_inv!10894 _values!1516) e!284384)))

(assert (=> start!43618 tp!43348))

(declare-fun array_inv!10895 (array!31391) Bool)

(assert (=> start!43618 (array_inv!10895 _keys!1874)))

(declare-fun b!483246 () Bool)

(declare-fun res!288001 () Bool)

(assert (=> b!483246 (=> (not res!288001) (not e!284380))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19557)

(declare-fun zeroValue!1458 () V!19557)

(declare-fun defaultEntry!1519 () Int)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((tuple2!9166 0))(
  ( (tuple2!9167 (_1!4594 (_ BitVec 64)) (_2!4594 V!19557)) )
))
(declare-datatypes ((List!9245 0))(
  ( (Nil!9242) (Cons!9241 (h!10097 tuple2!9166) (t!15463 List!9245)) )
))
(declare-datatypes ((ListLongMap!8079 0))(
  ( (ListLongMap!8080 (toList!4055 List!9245)) )
))
(declare-fun contains!2671 (ListLongMap!8079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2374 (array!31391 array!31393 (_ BitVec 32) (_ BitVec 32) V!19557 V!19557 (_ BitVec 32) Int) ListLongMap!8079)

(assert (=> b!483246 (= res!288001 (contains!2671 (getCurrentListMap!2374 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!483247 () Bool)

(declare-fun res!287998 () Bool)

(assert (=> b!483247 (=> (not res!287998) (not e!284380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483247 (= res!287998 (validKeyInArray!0 k!1332))))

(declare-fun b!483248 () Bool)

(declare-fun e!284383 () Bool)

(assert (=> b!483248 (= e!284383 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483249 () Bool)

(declare-fun arrayContainsKey!0 (array!31391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483249 (= e!284383 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22513 () Bool)

(declare-fun mapRes!22513 () Bool)

(assert (=> mapIsEmpty!22513 mapRes!22513))

(declare-fun mapNonEmpty!22513 () Bool)

(declare-fun tp!43347 () Bool)

(declare-fun e!284385 () Bool)

(assert (=> mapNonEmpty!22513 (= mapRes!22513 (and tp!43347 e!284385))))

(declare-fun mapRest!22513 () (Array (_ BitVec 32) ValueCell!6571))

(declare-fun mapKey!22513 () (_ BitVec 32))

(declare-fun mapValue!22513 () ValueCell!6571)

(assert (=> mapNonEmpty!22513 (= (arr!15097 _values!1516) (store mapRest!22513 mapKey!22513 mapValue!22513))))

(declare-fun b!483250 () Bool)

(declare-fun res!288000 () Bool)

(declare-fun e!284382 () Bool)

(assert (=> b!483250 (=> res!288000 e!284382)))

(declare-datatypes ((SeekEntryResult!3576 0))(
  ( (MissingZero!3576 (index!16483 (_ BitVec 32))) (Found!3576 (index!16484 (_ BitVec 32))) (Intermediate!3576 (undefined!4388 Bool) (index!16485 (_ BitVec 32)) (x!45380 (_ BitVec 32))) (Undefined!3576) (MissingVacant!3576 (index!16486 (_ BitVec 32))) )
))
(declare-fun lt!219022 () SeekEntryResult!3576)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!483250 (= res!288000 (not (inRange!0 (index!16484 lt!219022) mask!2352)))))

(declare-fun b!483251 () Bool)

(assert (=> b!483251 (= e!284384 (and e!284381 mapRes!22513))))

(declare-fun condMapEmpty!22513 () Bool)

(declare-fun mapDefault!22513 () ValueCell!6571)

