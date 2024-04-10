; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83344 () Bool)

(assert start!83344)

(declare-fun b_free!19337 () Bool)

(declare-fun b_next!19337 () Bool)

(assert (=> start!83344 (= b_free!19337 (not b_next!19337))))

(declare-fun tp!67289 () Bool)

(declare-fun b_and!30895 () Bool)

(assert (=> start!83344 (= tp!67289 b_and!30895)))

(declare-fun b!973036 () Bool)

(declare-fun e!548451 () Bool)

(declare-fun e!548455 () Bool)

(assert (=> b!973036 (= e!548451 e!548455)))

(declare-fun res!651320 () Bool)

(assert (=> b!973036 (=> (not res!651320) (not e!548455))))

(declare-fun lt!432259 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973036 (= res!651320 (validKeyInArray!0 lt!432259))))

(declare-datatypes ((array!60511 0))(
  ( (array!60512 (arr!29119 (Array (_ BitVec 32) (_ BitVec 64))) (size!29598 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60511)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973036 (= lt!432259 (select (arr!29119 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34629 0))(
  ( (V!34630 (val!11168 Int)) )
))
(declare-datatypes ((ValueCell!10636 0))(
  ( (ValueCellFull!10636 (v!13727 V!34629)) (EmptyCell!10636) )
))
(declare-datatypes ((array!60513 0))(
  ( (array!60514 (arr!29120 (Array (_ BitVec 32) ValueCell!10636)) (size!29599 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60513)

(declare-datatypes ((tuple2!14330 0))(
  ( (tuple2!14331 (_1!7176 (_ BitVec 64)) (_2!7176 V!34629)) )
))
(declare-datatypes ((List!20192 0))(
  ( (Nil!20189) (Cons!20188 (h!21350 tuple2!14330) (t!28627 List!20192)) )
))
(declare-datatypes ((ListLongMap!13027 0))(
  ( (ListLongMap!13028 (toList!6529 List!20192)) )
))
(declare-fun lt!432262 () ListLongMap!13027)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34629)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34629)

(declare-fun getCurrentListMap!3762 (array!60511 array!60513 (_ BitVec 32) (_ BitVec 32) V!34629 V!34629 (_ BitVec 32) Int) ListLongMap!13027)

(assert (=> b!973036 (= lt!432262 (getCurrentListMap!3762 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973037 () Bool)

(declare-fun res!651318 () Bool)

(declare-fun e!548452 () Bool)

(assert (=> b!973037 (=> (not res!651318) (not e!548452))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973037 (= res!651318 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29598 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29598 _keys!1717))))))

(declare-fun mapNonEmpty!35362 () Bool)

(declare-fun mapRes!35362 () Bool)

(declare-fun tp!67290 () Bool)

(declare-fun e!548449 () Bool)

(assert (=> mapNonEmpty!35362 (= mapRes!35362 (and tp!67290 e!548449))))

(declare-fun mapValue!35362 () ValueCell!10636)

(declare-fun mapKey!35362 () (_ BitVec 32))

(declare-fun mapRest!35362 () (Array (_ BitVec 32) ValueCell!10636))

(assert (=> mapNonEmpty!35362 (= (arr!29120 _values!1425) (store mapRest!35362 mapKey!35362 mapValue!35362))))

(declare-fun b!973038 () Bool)

(declare-fun res!651319 () Bool)

(assert (=> b!973038 (=> (not res!651319) (not e!548452))))

(assert (=> b!973038 (= res!651319 (validKeyInArray!0 (select (arr!29119 _keys!1717) i!822)))))

(declare-fun b!973039 () Bool)

(declare-fun e!548454 () Bool)

(declare-fun tp_is_empty!22235 () Bool)

(assert (=> b!973039 (= e!548454 tp_is_empty!22235)))

(declare-fun b!973040 () Bool)

(declare-fun res!651317 () Bool)

(assert (=> b!973040 (=> (not res!651317) (not e!548452))))

(assert (=> b!973040 (= res!651317 (and (= (size!29599 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29598 _keys!1717) (size!29599 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!651321 () Bool)

(assert (=> start!83344 (=> (not res!651321) (not e!548452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83344 (= res!651321 (validMask!0 mask!2147))))

(assert (=> start!83344 e!548452))

(assert (=> start!83344 true))

(declare-fun e!548453 () Bool)

(declare-fun array_inv!22527 (array!60513) Bool)

(assert (=> start!83344 (and (array_inv!22527 _values!1425) e!548453)))

(assert (=> start!83344 tp_is_empty!22235))

(assert (=> start!83344 tp!67289))

(declare-fun array_inv!22528 (array!60511) Bool)

(assert (=> start!83344 (array_inv!22528 _keys!1717)))

(declare-fun b!973041 () Bool)

(assert (=> b!973041 (= e!548452 e!548451)))

(declare-fun res!651323 () Bool)

(assert (=> b!973041 (=> (not res!651323) (not e!548451))))

(declare-fun lt!432258 () ListLongMap!13027)

(declare-fun contains!5622 (ListLongMap!13027 (_ BitVec 64)) Bool)

(assert (=> b!973041 (= res!651323 (contains!5622 lt!432258 (select (arr!29119 _keys!1717) i!822)))))

(assert (=> b!973041 (= lt!432258 (getCurrentListMap!3762 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973042 () Bool)

(assert (=> b!973042 (= e!548453 (and e!548454 mapRes!35362))))

(declare-fun condMapEmpty!35362 () Bool)

(declare-fun mapDefault!35362 () ValueCell!10636)

