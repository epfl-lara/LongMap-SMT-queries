; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83146 () Bool)

(assert start!83146)

(declare-fun b_free!19139 () Bool)

(declare-fun b_next!19139 () Bool)

(assert (=> start!83146 (= b_free!19139 (not b_next!19139))))

(declare-fun tp!66696 () Bool)

(declare-fun b_and!30627 () Bool)

(assert (=> start!83146 (= tp!66696 b_and!30627)))

(declare-fun mapIsEmpty!35065 () Bool)

(declare-fun mapRes!35065 () Bool)

(assert (=> mapIsEmpty!35065 mapRes!35065))

(declare-fun b!969971 () Bool)

(declare-fun res!649216 () Bool)

(declare-fun e!546842 () Bool)

(assert (=> b!969971 (=> (not res!649216) (not e!546842))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34365 0))(
  ( (V!34366 (val!11069 Int)) )
))
(declare-datatypes ((ValueCell!10537 0))(
  ( (ValueCellFull!10537 (v!13628 V!34365)) (EmptyCell!10537) )
))
(declare-datatypes ((array!60135 0))(
  ( (array!60136 (arr!28931 (Array (_ BitVec 32) ValueCell!10537)) (size!29410 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60135)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60137 0))(
  ( (array!60138 (arr!28932 (Array (_ BitVec 32) (_ BitVec 64))) (size!29411 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60137)

(assert (=> b!969971 (= res!649216 (and (= (size!29410 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29411 _keys!1717) (size!29410 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969972 () Bool)

(assert (=> b!969972 (= e!546842 false)))

(declare-fun lt!431696 () Bool)

(declare-fun zeroValue!1367 () V!34365)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34365)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14180 0))(
  ( (tuple2!14181 (_1!7101 (_ BitVec 64)) (_2!7101 V!34365)) )
))
(declare-datatypes ((List!20050 0))(
  ( (Nil!20047) (Cons!20046 (h!21208 tuple2!14180) (t!28413 List!20050)) )
))
(declare-datatypes ((ListLongMap!12877 0))(
  ( (ListLongMap!12878 (toList!6454 List!20050)) )
))
(declare-fun contains!5558 (ListLongMap!12877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3687 (array!60137 array!60135 (_ BitVec 32) (_ BitVec 32) V!34365 V!34365 (_ BitVec 32) Int) ListLongMap!12877)

(assert (=> b!969972 (= lt!431696 (contains!5558 (getCurrentListMap!3687 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28932 _keys!1717) i!822)))))

(declare-fun b!969973 () Bool)

(declare-fun res!649218 () Bool)

(assert (=> b!969973 (=> (not res!649218) (not e!546842))))

(assert (=> b!969973 (= res!649218 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29411 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29411 _keys!1717))))))

(declare-fun b!969974 () Bool)

(declare-fun e!546844 () Bool)

(declare-fun tp_is_empty!22037 () Bool)

(assert (=> b!969974 (= e!546844 tp_is_empty!22037)))

(declare-fun b!969975 () Bool)

(declare-fun res!649217 () Bool)

(assert (=> b!969975 (=> (not res!649217) (not e!546842))))

(declare-datatypes ((List!20051 0))(
  ( (Nil!20048) (Cons!20047 (h!21209 (_ BitVec 64)) (t!28414 List!20051)) )
))
(declare-fun arrayNoDuplicates!0 (array!60137 (_ BitVec 32) List!20051) Bool)

(assert (=> b!969975 (= res!649217 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20048))))

(declare-fun mapNonEmpty!35065 () Bool)

(declare-fun tp!66695 () Bool)

(declare-fun e!546840 () Bool)

(assert (=> mapNonEmpty!35065 (= mapRes!35065 (and tp!66695 e!546840))))

(declare-fun mapValue!35065 () ValueCell!10537)

(declare-fun mapRest!35065 () (Array (_ BitVec 32) ValueCell!10537))

(declare-fun mapKey!35065 () (_ BitVec 32))

(assert (=> mapNonEmpty!35065 (= (arr!28931 _values!1425) (store mapRest!35065 mapKey!35065 mapValue!35065))))

(declare-fun b!969976 () Bool)

(declare-fun res!649215 () Bool)

(assert (=> b!969976 (=> (not res!649215) (not e!546842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969976 (= res!649215 (validKeyInArray!0 (select (arr!28932 _keys!1717) i!822)))))

(declare-fun b!969977 () Bool)

(assert (=> b!969977 (= e!546840 tp_is_empty!22037)))

(declare-fun res!649214 () Bool)

(assert (=> start!83146 (=> (not res!649214) (not e!546842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83146 (= res!649214 (validMask!0 mask!2147))))

(assert (=> start!83146 e!546842))

(assert (=> start!83146 true))

(declare-fun e!546843 () Bool)

(declare-fun array_inv!22395 (array!60135) Bool)

(assert (=> start!83146 (and (array_inv!22395 _values!1425) e!546843)))

(assert (=> start!83146 tp_is_empty!22037))

(assert (=> start!83146 tp!66696))

(declare-fun array_inv!22396 (array!60137) Bool)

(assert (=> start!83146 (array_inv!22396 _keys!1717)))

(declare-fun b!969978 () Bool)

(declare-fun res!649213 () Bool)

(assert (=> b!969978 (=> (not res!649213) (not e!546842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60137 (_ BitVec 32)) Bool)

(assert (=> b!969978 (= res!649213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969979 () Bool)

(assert (=> b!969979 (= e!546843 (and e!546844 mapRes!35065))))

(declare-fun condMapEmpty!35065 () Bool)

(declare-fun mapDefault!35065 () ValueCell!10537)

