; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83512 () Bool)

(assert start!83512)

(declare-fun b_free!19499 () Bool)

(declare-fun b_next!19499 () Bool)

(assert (=> start!83512 (= b_free!19499 (not b_next!19499))))

(declare-fun tp!67784 () Bool)

(declare-fun b_and!31101 () Bool)

(assert (=> start!83512 (= tp!67784 b_and!31101)))

(declare-fun b!975645 () Bool)

(declare-fun e!549856 () Bool)

(declare-fun tp_is_empty!22403 () Bool)

(assert (=> b!975645 (= e!549856 tp_is_empty!22403)))

(declare-fun b!975646 () Bool)

(declare-fun res!653128 () Bool)

(declare-fun e!549859 () Bool)

(assert (=> b!975646 (=> (not res!653128) (not e!549859))))

(declare-datatypes ((array!60837 0))(
  ( (array!60838 (arr!29282 (Array (_ BitVec 32) (_ BitVec 64))) (size!29761 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60837)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975646 (= res!653128 (validKeyInArray!0 (select (arr!29282 _keys!1717) i!822)))))

(declare-fun b!975647 () Bool)

(declare-fun res!653129 () Bool)

(assert (=> b!975647 (=> (not res!653129) (not e!549859))))

(declare-datatypes ((List!20323 0))(
  ( (Nil!20320) (Cons!20319 (h!21481 (_ BitVec 64)) (t!28800 List!20323)) )
))
(declare-fun arrayNoDuplicates!0 (array!60837 (_ BitVec 32) List!20323) Bool)

(assert (=> b!975647 (= res!653129 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20320))))

(declare-fun b!975648 () Bool)

(declare-fun e!549857 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!975648 (= e!549857 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29761 _keys!1717)))))

(declare-fun b!975649 () Bool)

(declare-fun res!653132 () Bool)

(assert (=> b!975649 (=> (not res!653132) (not e!549859))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60837 (_ BitVec 32)) Bool)

(assert (=> b!975649 (= res!653132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975650 () Bool)

(declare-fun e!549855 () Bool)

(assert (=> b!975650 (= e!549855 tp_is_empty!22403)))

(declare-fun b!975651 () Bool)

(declare-fun res!653133 () Bool)

(assert (=> b!975651 (=> (not res!653133) (not e!549859))))

(declare-datatypes ((V!34853 0))(
  ( (V!34854 (val!11252 Int)) )
))
(declare-datatypes ((ValueCell!10720 0))(
  ( (ValueCellFull!10720 (v!13811 V!34853)) (EmptyCell!10720) )
))
(declare-datatypes ((array!60839 0))(
  ( (array!60840 (arr!29283 (Array (_ BitVec 32) ValueCell!10720)) (size!29762 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60839)

(declare-fun zeroValue!1367 () V!34853)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34853)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14470 0))(
  ( (tuple2!14471 (_1!7246 (_ BitVec 64)) (_2!7246 V!34853)) )
))
(declare-datatypes ((List!20324 0))(
  ( (Nil!20321) (Cons!20320 (h!21482 tuple2!14470) (t!28801 List!20324)) )
))
(declare-datatypes ((ListLongMap!13167 0))(
  ( (ListLongMap!13168 (toList!6599 List!20324)) )
))
(declare-fun contains!5680 (ListLongMap!13167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3832 (array!60837 array!60839 (_ BitVec 32) (_ BitVec 32) V!34853 V!34853 (_ BitVec 32) Int) ListLongMap!13167)

(assert (=> b!975651 (= res!653133 (contains!5680 (getCurrentListMap!3832 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29282 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35614 () Bool)

(declare-fun mapRes!35614 () Bool)

(assert (=> mapIsEmpty!35614 mapRes!35614))

(declare-fun b!975652 () Bool)

(declare-fun res!653127 () Bool)

(assert (=> b!975652 (=> (not res!653127) (not e!549859))))

(assert (=> b!975652 (= res!653127 (and (= (size!29762 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29761 _keys!1717) (size!29762 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975653 () Bool)

(declare-fun e!549854 () Bool)

(assert (=> b!975653 (= e!549854 (and e!549856 mapRes!35614))))

(declare-fun condMapEmpty!35614 () Bool)

(declare-fun mapDefault!35614 () ValueCell!10720)

