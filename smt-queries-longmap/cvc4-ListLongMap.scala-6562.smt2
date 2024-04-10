; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83260 () Bool)

(assert start!83260)

(declare-fun b_free!19253 () Bool)

(declare-fun b_next!19253 () Bool)

(assert (=> start!83260 (= b_free!19253 (not b_next!19253))))

(declare-fun tp!67038 () Bool)

(declare-fun b_and!30741 () Bool)

(assert (=> start!83260 (= tp!67038 b_and!30741)))

(declare-fun b!971599 () Bool)

(declare-fun res!650330 () Bool)

(declare-fun e!547696 () Bool)

(assert (=> b!971599 (=> (not res!650330) (not e!547696))))

(declare-datatypes ((array!60349 0))(
  ( (array!60350 (arr!29038 (Array (_ BitVec 32) (_ BitVec 64))) (size!29517 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60349)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971599 (= res!650330 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29517 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29517 _keys!1717))))))

(declare-fun res!650332 () Bool)

(assert (=> start!83260 (=> (not res!650332) (not e!547696))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83260 (= res!650332 (validMask!0 mask!2147))))

(assert (=> start!83260 e!547696))

(assert (=> start!83260 true))

(declare-datatypes ((V!34517 0))(
  ( (V!34518 (val!11126 Int)) )
))
(declare-datatypes ((ValueCell!10594 0))(
  ( (ValueCellFull!10594 (v!13685 V!34517)) (EmptyCell!10594) )
))
(declare-datatypes ((array!60351 0))(
  ( (array!60352 (arr!29039 (Array (_ BitVec 32) ValueCell!10594)) (size!29518 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60351)

(declare-fun e!547699 () Bool)

(declare-fun array_inv!22469 (array!60351) Bool)

(assert (=> start!83260 (and (array_inv!22469 _values!1425) e!547699)))

(declare-fun tp_is_empty!22151 () Bool)

(assert (=> start!83260 tp_is_empty!22151))

(assert (=> start!83260 tp!67038))

(declare-fun array_inv!22470 (array!60349) Bool)

(assert (=> start!83260 (array_inv!22470 _keys!1717)))

(declare-fun b!971600 () Bool)

(declare-fun e!547697 () Bool)

(assert (=> b!971600 (= e!547697 tp_is_empty!22151)))

(declare-fun b!971601 () Bool)

(declare-fun e!547695 () Bool)

(assert (=> b!971601 (= e!547695 tp_is_empty!22151)))

(declare-fun b!971602 () Bool)

(declare-fun res!650328 () Bool)

(assert (=> b!971602 (=> (not res!650328) (not e!547696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971602 (= res!650328 (validKeyInArray!0 (select (arr!29038 _keys!1717) i!822)))))

(declare-fun b!971603 () Bool)

(declare-fun res!650333 () Bool)

(assert (=> b!971603 (=> (not res!650333) (not e!547696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60349 (_ BitVec 32)) Bool)

(assert (=> b!971603 (= res!650333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971604 () Bool)

(assert (=> b!971604 (= e!547696 false)))

(declare-fun zeroValue!1367 () V!34517)

(declare-datatypes ((tuple2!14260 0))(
  ( (tuple2!14261 (_1!7141 (_ BitVec 64)) (_2!7141 V!34517)) )
))
(declare-datatypes ((List!20127 0))(
  ( (Nil!20124) (Cons!20123 (h!21285 tuple2!14260) (t!28490 List!20127)) )
))
(declare-datatypes ((ListLongMap!12957 0))(
  ( (ListLongMap!12958 (toList!6494 List!20127)) )
))
(declare-fun lt!431849 () ListLongMap!12957)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34517)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3727 (array!60349 array!60351 (_ BitVec 32) (_ BitVec 32) V!34517 V!34517 (_ BitVec 32) Int) ListLongMap!12957)

(assert (=> b!971604 (= lt!431849 (getCurrentListMap!3727 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35236 () Bool)

(declare-fun mapRes!35236 () Bool)

(assert (=> mapIsEmpty!35236 mapRes!35236))

(declare-fun b!971605 () Bool)

(declare-fun res!650334 () Bool)

(assert (=> b!971605 (=> (not res!650334) (not e!547696))))

(declare-fun contains!5594 (ListLongMap!12957 (_ BitVec 64)) Bool)

(assert (=> b!971605 (= res!650334 (contains!5594 (getCurrentListMap!3727 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29038 _keys!1717) i!822)))))

(declare-fun b!971606 () Bool)

(assert (=> b!971606 (= e!547699 (and e!547697 mapRes!35236))))

(declare-fun condMapEmpty!35236 () Bool)

(declare-fun mapDefault!35236 () ValueCell!10594)

