; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83440 () Bool)

(assert start!83440)

(declare-fun b_free!19433 () Bool)

(declare-fun b_next!19433 () Bool)

(assert (=> start!83440 (= b_free!19433 (not b_next!19433))))

(declare-fun tp!67578 () Bool)

(declare-fun b_and!31035 () Bool)

(assert (=> start!83440 (= tp!67578 b_and!31035)))

(declare-fun b!974592 () Bool)

(declare-fun res!652398 () Bool)

(declare-fun e!549309 () Bool)

(assert (=> b!974592 (=> (not res!652398) (not e!549309))))

(declare-datatypes ((array!60701 0))(
  ( (array!60702 (arr!29214 (Array (_ BitVec 32) (_ BitVec 64))) (size!29693 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60701)

(declare-datatypes ((List!20272 0))(
  ( (Nil!20269) (Cons!20268 (h!21430 (_ BitVec 64)) (t!28749 List!20272)) )
))
(declare-fun arrayNoDuplicates!0 (array!60701 (_ BitVec 32) List!20272) Bool)

(assert (=> b!974592 (= res!652398 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20269))))

(declare-fun b!974593 () Bool)

(declare-fun res!652401 () Bool)

(assert (=> b!974593 (=> (not res!652401) (not e!549309))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974593 (= res!652401 (validKeyInArray!0 (select (arr!29214 _keys!1717) i!822)))))

(declare-fun b!974595 () Bool)

(declare-fun e!549310 () Bool)

(assert (=> b!974595 (= e!549309 e!549310)))

(declare-fun res!652403 () Bool)

(assert (=> b!974595 (=> (not res!652403) (not e!549310))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974595 (= res!652403 (not (validKeyInArray!0 (select (arr!29214 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-datatypes ((V!34757 0))(
  ( (V!34758 (val!11216 Int)) )
))
(declare-datatypes ((ValueCell!10684 0))(
  ( (ValueCellFull!10684 (v!13775 V!34757)) (EmptyCell!10684) )
))
(declare-datatypes ((array!60703 0))(
  ( (array!60704 (arr!29215 (Array (_ BitVec 32) ValueCell!10684)) (size!29694 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60703)

(declare-fun zeroValue!1367 () V!34757)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34757)

(declare-datatypes ((tuple2!14420 0))(
  ( (tuple2!14421 (_1!7221 (_ BitVec 64)) (_2!7221 V!34757)) )
))
(declare-datatypes ((List!20273 0))(
  ( (Nil!20270) (Cons!20269 (h!21431 tuple2!14420) (t!28750 List!20273)) )
))
(declare-datatypes ((ListLongMap!13117 0))(
  ( (ListLongMap!13118 (toList!6574 List!20273)) )
))
(declare-fun lt!432785 () ListLongMap!13117)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3807 (array!60701 array!60703 (_ BitVec 32) (_ BitVec 32) V!34757 V!34757 (_ BitVec 32) Int) ListLongMap!13117)

(assert (=> b!974595 (= lt!432785 (getCurrentListMap!3807 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974596 () Bool)

(declare-fun res!652404 () Bool)

(assert (=> b!974596 (=> (not res!652404) (not e!549309))))

(declare-fun contains!5660 (ListLongMap!13117 (_ BitVec 64)) Bool)

(assert (=> b!974596 (= res!652404 (contains!5660 (getCurrentListMap!3807 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29214 _keys!1717) i!822)))))

(declare-fun res!652402 () Bool)

(assert (=> start!83440 (=> (not res!652402) (not e!549309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83440 (= res!652402 (validMask!0 mask!2147))))

(assert (=> start!83440 e!549309))

(assert (=> start!83440 true))

(declare-fun e!549307 () Bool)

(declare-fun array_inv!22593 (array!60703) Bool)

(assert (=> start!83440 (and (array_inv!22593 _values!1425) e!549307)))

(declare-fun tp_is_empty!22331 () Bool)

(assert (=> start!83440 tp_is_empty!22331))

(assert (=> start!83440 tp!67578))

(declare-fun array_inv!22594 (array!60701) Bool)

(assert (=> start!83440 (array_inv!22594 _keys!1717)))

(declare-fun b!974594 () Bool)

(declare-fun e!549305 () Bool)

(assert (=> b!974594 (= e!549305 tp_is_empty!22331)))

(declare-fun mapNonEmpty!35506 () Bool)

(declare-fun mapRes!35506 () Bool)

(declare-fun tp!67577 () Bool)

(assert (=> mapNonEmpty!35506 (= mapRes!35506 (and tp!67577 e!549305))))

(declare-fun mapKey!35506 () (_ BitVec 32))

(declare-fun mapValue!35506 () ValueCell!10684)

(declare-fun mapRest!35506 () (Array (_ BitVec 32) ValueCell!10684))

(assert (=> mapNonEmpty!35506 (= (arr!29215 _values!1425) (store mapRest!35506 mapKey!35506 mapValue!35506))))

(declare-fun b!974597 () Bool)

(declare-fun res!652400 () Bool)

(assert (=> b!974597 (=> (not res!652400) (not e!549309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60701 (_ BitVec 32)) Bool)

(assert (=> b!974597 (= res!652400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974598 () Bool)

(declare-fun e!549306 () Bool)

(assert (=> b!974598 (= e!549306 tp_is_empty!22331)))

(declare-fun mapIsEmpty!35506 () Bool)

(assert (=> mapIsEmpty!35506 mapRes!35506))

(declare-fun b!974599 () Bool)

(assert (=> b!974599 (= e!549310 (bvsgt (bvsub from!2118 #b00000000000000000000000000000001) (size!29693 _keys!1717)))))

(declare-fun b!974600 () Bool)

(declare-fun res!652399 () Bool)

(assert (=> b!974600 (=> (not res!652399) (not e!549309))))

(assert (=> b!974600 (= res!652399 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29693 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29693 _keys!1717))))))

(declare-fun b!974601 () Bool)

(assert (=> b!974601 (= e!549307 (and e!549306 mapRes!35506))))

(declare-fun condMapEmpty!35506 () Bool)

(declare-fun mapDefault!35506 () ValueCell!10684)

