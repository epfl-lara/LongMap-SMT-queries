; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83500 () Bool)

(assert start!83500)

(declare-fun b_free!19487 () Bool)

(declare-fun b_next!19487 () Bool)

(assert (=> start!83500 (= b_free!19487 (not b_next!19487))))

(declare-fun tp!67749 () Bool)

(declare-fun b_and!31089 () Bool)

(assert (=> start!83500 (= tp!67749 b_and!31089)))

(declare-fun res!652997 () Bool)

(declare-fun e!549760 () Bool)

(assert (=> start!83500 (=> (not res!652997) (not e!549760))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83500 (= res!652997 (validMask!0 mask!2147))))

(assert (=> start!83500 e!549760))

(assert (=> start!83500 true))

(declare-datatypes ((V!34837 0))(
  ( (V!34838 (val!11246 Int)) )
))
(declare-datatypes ((ValueCell!10714 0))(
  ( (ValueCellFull!10714 (v!13805 V!34837)) (EmptyCell!10714) )
))
(declare-datatypes ((array!60813 0))(
  ( (array!60814 (arr!29270 (Array (_ BitVec 32) ValueCell!10714)) (size!29749 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60813)

(declare-fun e!549758 () Bool)

(declare-fun array_inv!22635 (array!60813) Bool)

(assert (=> start!83500 (and (array_inv!22635 _values!1425) e!549758)))

(declare-fun tp_is_empty!22391 () Bool)

(assert (=> start!83500 tp_is_empty!22391))

(assert (=> start!83500 tp!67749))

(declare-datatypes ((array!60815 0))(
  ( (array!60816 (arr!29271 (Array (_ BitVec 32) (_ BitVec 64))) (size!29750 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60815)

(declare-fun array_inv!22636 (array!60815) Bool)

(assert (=> start!83500 (array_inv!22636 _keys!1717)))

(declare-fun b!975457 () Bool)

(declare-fun res!652994 () Bool)

(assert (=> b!975457 (=> (not res!652994) (not e!549760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60815 (_ BitVec 32)) Bool)

(assert (=> b!975457 (= res!652994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975458 () Bool)

(declare-fun res!652998 () Bool)

(assert (=> b!975458 (=> (not res!652998) (not e!549760))))

(declare-fun zeroValue!1367 () V!34837)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34837)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14462 0))(
  ( (tuple2!14463 (_1!7242 (_ BitVec 64)) (_2!7242 V!34837)) )
))
(declare-datatypes ((List!20314 0))(
  ( (Nil!20311) (Cons!20310 (h!21472 tuple2!14462) (t!28791 List!20314)) )
))
(declare-datatypes ((ListLongMap!13159 0))(
  ( (ListLongMap!13160 (toList!6595 List!20314)) )
))
(declare-fun contains!5677 (ListLongMap!13159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3828 (array!60815 array!60813 (_ BitVec 32) (_ BitVec 32) V!34837 V!34837 (_ BitVec 32) Int) ListLongMap!13159)

(assert (=> b!975458 (= res!652998 (contains!5677 (getCurrentListMap!3828 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29271 _keys!1717) i!822)))))

(declare-fun b!975459 () Bool)

(declare-fun res!652996 () Bool)

(assert (=> b!975459 (=> (not res!652996) (not e!549760))))

(assert (=> b!975459 (= res!652996 (and (= (size!29749 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29750 _keys!1717) (size!29749 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35596 () Bool)

(declare-fun mapRes!35596 () Bool)

(declare-fun tp!67748 () Bool)

(declare-fun e!549756 () Bool)

(assert (=> mapNonEmpty!35596 (= mapRes!35596 (and tp!67748 e!549756))))

(declare-fun mapKey!35596 () (_ BitVec 32))

(declare-fun mapValue!35596 () ValueCell!10714)

(declare-fun mapRest!35596 () (Array (_ BitVec 32) ValueCell!10714))

(assert (=> mapNonEmpty!35596 (= (arr!29270 _values!1425) (store mapRest!35596 mapKey!35596 mapValue!35596))))

(declare-fun b!975460 () Bool)

(assert (=> b!975460 (= e!549756 tp_is_empty!22391)))

(declare-fun b!975461 () Bool)

(declare-fun res!652992 () Bool)

(assert (=> b!975461 (=> (not res!652992) (not e!549760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975461 (= res!652992 (validKeyInArray!0 (select (arr!29271 _keys!1717) i!822)))))

(declare-fun b!975462 () Bool)

(declare-fun e!549759 () Bool)

(assert (=> b!975462 (= e!549759 tp_is_empty!22391)))

(declare-fun b!975463 () Bool)

(declare-fun res!652995 () Bool)

(assert (=> b!975463 (=> (not res!652995) (not e!549760))))

(assert (=> b!975463 (= res!652995 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29750 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29750 _keys!1717))))))

(declare-fun b!975464 () Bool)

(declare-fun res!652993 () Bool)

(assert (=> b!975464 (=> (not res!652993) (not e!549760))))

(declare-datatypes ((List!20315 0))(
  ( (Nil!20312) (Cons!20311 (h!21473 (_ BitVec 64)) (t!28792 List!20315)) )
))
(declare-fun arrayNoDuplicates!0 (array!60815 (_ BitVec 32) List!20315) Bool)

(assert (=> b!975464 (= res!652993 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20312))))

(declare-fun b!975465 () Bool)

(assert (=> b!975465 (= e!549758 (and e!549759 mapRes!35596))))

(declare-fun condMapEmpty!35596 () Bool)

(declare-fun mapDefault!35596 () ValueCell!10714)

