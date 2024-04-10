; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83490 () Bool)

(assert start!83490)

(declare-fun b_free!19477 () Bool)

(declare-fun b_next!19477 () Bool)

(assert (=> start!83490 (= b_free!19477 (not b_next!19477))))

(declare-fun tp!67718 () Bool)

(declare-fun b_and!31079 () Bool)

(assert (=> start!83490 (= tp!67718 b_and!31079)))

(declare-fun mapNonEmpty!35581 () Bool)

(declare-fun mapRes!35581 () Bool)

(declare-fun tp!67719 () Bool)

(declare-fun e!549683 () Bool)

(assert (=> mapNonEmpty!35581 (= mapRes!35581 (and tp!67719 e!549683))))

(declare-fun mapKey!35581 () (_ BitVec 32))

(declare-datatypes ((V!34825 0))(
  ( (V!34826 (val!11241 Int)) )
))
(declare-datatypes ((ValueCell!10709 0))(
  ( (ValueCellFull!10709 (v!13800 V!34825)) (EmptyCell!10709) )
))
(declare-datatypes ((array!60793 0))(
  ( (array!60794 (arr!29260 (Array (_ BitVec 32) ValueCell!10709)) (size!29739 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60793)

(declare-fun mapRest!35581 () (Array (_ BitVec 32) ValueCell!10709))

(declare-fun mapValue!35581 () ValueCell!10709)

(assert (=> mapNonEmpty!35581 (= (arr!29260 _values!1425) (store mapRest!35581 mapKey!35581 mapValue!35581))))

(declare-fun b!975307 () Bool)

(declare-fun e!549685 () Bool)

(assert (=> b!975307 (= e!549685 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((tuple2!14454 0))(
  ( (tuple2!14455 (_1!7238 (_ BitVec 64)) (_2!7238 V!34825)) )
))
(declare-datatypes ((List!20306 0))(
  ( (Nil!20303) (Cons!20302 (h!21464 tuple2!14454) (t!28783 List!20306)) )
))
(declare-datatypes ((ListLongMap!13151 0))(
  ( (ListLongMap!13152 (toList!6591 List!20306)) )
))
(declare-fun lt!432851 () ListLongMap!13151)

(declare-fun zeroValue!1367 () V!34825)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34825)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60795 0))(
  ( (array!60796 (arr!29261 (Array (_ BitVec 32) (_ BitVec 64))) (size!29740 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60795)

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3824 (array!60795 array!60793 (_ BitVec 32) (_ BitVec 32) V!34825 V!34825 (_ BitVec 32) Int) ListLongMap!13151)

(assert (=> b!975307 (= lt!432851 (getCurrentListMap!3824 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!652889 () Bool)

(assert (=> start!83490 (=> (not res!652889) (not e!549685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83490 (= res!652889 (validMask!0 mask!2147))))

(assert (=> start!83490 e!549685))

(assert (=> start!83490 true))

(declare-fun e!549681 () Bool)

(declare-fun array_inv!22627 (array!60793) Bool)

(assert (=> start!83490 (and (array_inv!22627 _values!1425) e!549681)))

(declare-fun tp_is_empty!22381 () Bool)

(assert (=> start!83490 tp_is_empty!22381))

(assert (=> start!83490 tp!67718))

(declare-fun array_inv!22628 (array!60795) Bool)

(assert (=> start!83490 (array_inv!22628 _keys!1717)))

(declare-fun b!975308 () Bool)

(assert (=> b!975308 (= e!549683 tp_is_empty!22381)))

(declare-fun b!975309 () Bool)

(declare-fun res!652890 () Bool)

(assert (=> b!975309 (=> (not res!652890) (not e!549685))))

(declare-datatypes ((List!20307 0))(
  ( (Nil!20304) (Cons!20303 (h!21465 (_ BitVec 64)) (t!28784 List!20307)) )
))
(declare-fun arrayNoDuplicates!0 (array!60795 (_ BitVec 32) List!20307) Bool)

(assert (=> b!975309 (= res!652890 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20304))))

(declare-fun b!975310 () Bool)

(declare-fun res!652892 () Bool)

(assert (=> b!975310 (=> (not res!652892) (not e!549685))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975310 (= res!652892 (validKeyInArray!0 (select (arr!29261 _keys!1717) i!822)))))

(declare-fun b!975311 () Bool)

(declare-fun res!652891 () Bool)

(assert (=> b!975311 (=> (not res!652891) (not e!549685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60795 (_ BitVec 32)) Bool)

(assert (=> b!975311 (= res!652891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35581 () Bool)

(assert (=> mapIsEmpty!35581 mapRes!35581))

(declare-fun b!975312 () Bool)

(declare-fun res!652887 () Bool)

(assert (=> b!975312 (=> (not res!652887) (not e!549685))))

(assert (=> b!975312 (= res!652887 (and (= (size!29739 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29740 _keys!1717) (size!29739 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975313 () Bool)

(declare-fun res!652888 () Bool)

(assert (=> b!975313 (=> (not res!652888) (not e!549685))))

(declare-fun contains!5673 (ListLongMap!13151 (_ BitVec 64)) Bool)

(assert (=> b!975313 (= res!652888 (contains!5673 (getCurrentListMap!3824 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29261 _keys!1717) i!822)))))

(declare-fun b!975314 () Bool)

(declare-fun e!549682 () Bool)

(assert (=> b!975314 (= e!549681 (and e!549682 mapRes!35581))))

(declare-fun condMapEmpty!35581 () Bool)

(declare-fun mapDefault!35581 () ValueCell!10709)

