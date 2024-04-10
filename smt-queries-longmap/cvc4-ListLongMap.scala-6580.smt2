; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83368 () Bool)

(assert start!83368)

(declare-fun b_free!19361 () Bool)

(declare-fun b_next!19361 () Bool)

(assert (=> start!83368 (= b_free!19361 (not b_next!19361))))

(declare-fun tp!67361 () Bool)

(declare-fun b_and!30943 () Bool)

(assert (=> start!83368 (= tp!67361 b_and!30943)))

(declare-fun b!973456 () Bool)

(declare-fun res!651611 () Bool)

(declare-fun e!548701 () Bool)

(assert (=> b!973456 (=> (not res!651611) (not e!548701))))

(declare-datatypes ((array!60559 0))(
  ( (array!60560 (arr!29143 (Array (_ BitVec 32) (_ BitVec 64))) (size!29622 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60559)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973456 (= res!651611 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29622 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29622 _keys!1717))))))

(declare-fun b!973458 () Bool)

(declare-fun e!548705 () Bool)

(declare-fun e!548704 () Bool)

(assert (=> b!973458 (= e!548705 e!548704)))

(declare-fun res!651605 () Bool)

(assert (=> b!973458 (=> (not res!651605) (not e!548704))))

(declare-fun lt!432510 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973458 (= res!651605 (validKeyInArray!0 lt!432510))))

(assert (=> b!973458 (= lt!432510 (select (arr!29143 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34661 0))(
  ( (V!34662 (val!11180 Int)) )
))
(declare-datatypes ((tuple2!14354 0))(
  ( (tuple2!14355 (_1!7188 (_ BitVec 64)) (_2!7188 V!34661)) )
))
(declare-datatypes ((List!20214 0))(
  ( (Nil!20211) (Cons!20210 (h!21372 tuple2!14354) (t!28673 List!20214)) )
))
(declare-datatypes ((ListLongMap!13051 0))(
  ( (ListLongMap!13052 (toList!6541 List!20214)) )
))
(declare-fun lt!432515 () ListLongMap!13051)

(declare-datatypes ((ValueCell!10648 0))(
  ( (ValueCellFull!10648 (v!13739 V!34661)) (EmptyCell!10648) )
))
(declare-datatypes ((array!60561 0))(
  ( (array!60562 (arr!29144 (Array (_ BitVec 32) ValueCell!10648)) (size!29623 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60561)

(declare-fun zeroValue!1367 () V!34661)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34661)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3774 (array!60559 array!60561 (_ BitVec 32) (_ BitVec 32) V!34661 V!34661 (_ BitVec 32) Int) ListLongMap!13051)

(assert (=> b!973458 (= lt!432515 (getCurrentListMap!3774 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973459 () Bool)

(declare-fun e!548707 () Bool)

(declare-fun e!548703 () Bool)

(declare-fun mapRes!35398 () Bool)

(assert (=> b!973459 (= e!548707 (and e!548703 mapRes!35398))))

(declare-fun condMapEmpty!35398 () Bool)

(declare-fun mapDefault!35398 () ValueCell!10648)

