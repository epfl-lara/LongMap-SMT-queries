; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83356 () Bool)

(assert start!83356)

(declare-fun b_free!19349 () Bool)

(declare-fun b_next!19349 () Bool)

(assert (=> start!83356 (= b_free!19349 (not b_next!19349))))

(declare-fun tp!67326 () Bool)

(declare-fun b_and!30919 () Bool)

(assert (=> start!83356 (= tp!67326 b_and!30919)))

(declare-fun b!973246 () Bool)

(declare-fun e!548581 () Bool)

(declare-fun e!548578 () Bool)

(assert (=> b!973246 (= e!548581 e!548578)))

(declare-fun res!651468 () Bool)

(assert (=> b!973246 (=> (not res!651468) (not e!548578))))

(declare-datatypes ((array!60535 0))(
  ( (array!60536 (arr!29131 (Array (_ BitVec 32) (_ BitVec 64))) (size!29610 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60535)

(declare-datatypes ((V!34645 0))(
  ( (V!34646 (val!11174 Int)) )
))
(declare-datatypes ((tuple2!14342 0))(
  ( (tuple2!14343 (_1!7182 (_ BitVec 64)) (_2!7182 V!34645)) )
))
(declare-datatypes ((List!20203 0))(
  ( (Nil!20200) (Cons!20199 (h!21361 tuple2!14342) (t!28650 List!20203)) )
))
(declare-datatypes ((ListLongMap!13039 0))(
  ( (ListLongMap!13040 (toList!6535 List!20203)) )
))
(declare-fun lt!432388 () ListLongMap!13039)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5628 (ListLongMap!13039 (_ BitVec 64)) Bool)

(assert (=> b!973246 (= res!651468 (contains!5628 lt!432388 (select (arr!29131 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10642 0))(
  ( (ValueCellFull!10642 (v!13733 V!34645)) (EmptyCell!10642) )
))
(declare-datatypes ((array!60537 0))(
  ( (array!60538 (arr!29132 (Array (_ BitVec 32) ValueCell!10642)) (size!29611 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60537)

(declare-fun zeroValue!1367 () V!34645)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34645)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3768 (array!60535 array!60537 (_ BitVec 32) (_ BitVec 32) V!34645 V!34645 (_ BitVec 32) Int) ListLongMap!13039)

(assert (=> b!973246 (= lt!432388 (getCurrentListMap!3768 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973247 () Bool)

(declare-fun e!548580 () Bool)

(declare-fun tp_is_empty!22247 () Bool)

(assert (=> b!973247 (= e!548580 tp_is_empty!22247)))

(declare-fun b!973248 () Bool)

(declare-fun res!651465 () Bool)

(assert (=> b!973248 (=> (not res!651465) (not e!548581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973248 (= res!651465 (validKeyInArray!0 (select (arr!29131 _keys!1717) i!822)))))

(declare-fun b!973249 () Bool)

(declare-fun e!548575 () Bool)

(assert (=> b!973249 (= e!548575 tp_is_empty!22247)))

(declare-fun b!973250 () Bool)

(declare-fun res!651461 () Bool)

(assert (=> b!973250 (=> (not res!651461) (not e!548581))))

(assert (=> b!973250 (= res!651461 (and (= (size!29611 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29610 _keys!1717) (size!29611 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973251 () Bool)

(declare-fun res!651467 () Bool)

(assert (=> b!973251 (=> (not res!651467) (not e!548581))))

(declare-datatypes ((List!20204 0))(
  ( (Nil!20201) (Cons!20200 (h!21362 (_ BitVec 64)) (t!28651 List!20204)) )
))
(declare-fun arrayNoDuplicates!0 (array!60535 (_ BitVec 32) List!20204) Bool)

(assert (=> b!973251 (= res!651467 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20201))))

(declare-fun res!651462 () Bool)

(assert (=> start!83356 (=> (not res!651462) (not e!548581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83356 (= res!651462 (validMask!0 mask!2147))))

(assert (=> start!83356 e!548581))

(assert (=> start!83356 true))

(declare-fun e!548577 () Bool)

(declare-fun array_inv!22537 (array!60537) Bool)

(assert (=> start!83356 (and (array_inv!22537 _values!1425) e!548577)))

(assert (=> start!83356 tp_is_empty!22247))

(assert (=> start!83356 tp!67326))

(declare-fun array_inv!22538 (array!60535) Bool)

(assert (=> start!83356 (array_inv!22538 _keys!1717)))

(declare-fun b!973252 () Bool)

(declare-fun e!548579 () Bool)

(assert (=> b!973252 (= e!548578 e!548579)))

(declare-fun res!651464 () Bool)

(assert (=> b!973252 (=> (not res!651464) (not e!548579))))

(declare-fun lt!432384 () (_ BitVec 64))

(assert (=> b!973252 (= res!651464 (validKeyInArray!0 lt!432384))))

(assert (=> b!973252 (= lt!432384 (select (arr!29131 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432387 () ListLongMap!13039)

(assert (=> b!973252 (= lt!432387 (getCurrentListMap!3768 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973253 () Bool)

(declare-fun res!651463 () Bool)

(assert (=> b!973253 (=> (not res!651463) (not e!548581))))

(assert (=> b!973253 (= res!651463 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29610 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29610 _keys!1717))))))

(declare-fun mapIsEmpty!35380 () Bool)

(declare-fun mapRes!35380 () Bool)

(assert (=> mapIsEmpty!35380 mapRes!35380))

(declare-fun b!973254 () Bool)

(assert (=> b!973254 (= e!548577 (and e!548575 mapRes!35380))))

(declare-fun condMapEmpty!35380 () Bool)

(declare-fun mapDefault!35380 () ValueCell!10642)

