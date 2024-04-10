; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83334 () Bool)

(assert start!83334)

(declare-fun b_free!19327 () Bool)

(declare-fun b_next!19327 () Bool)

(assert (=> start!83334 (= b_free!19327 (not b_next!19327))))

(declare-fun tp!67260 () Bool)

(declare-fun b_and!30875 () Bool)

(assert (=> start!83334 (= tp!67260 b_and!30875)))

(declare-fun b!972861 () Bool)

(declare-fun e!548350 () Bool)

(declare-fun tp_is_empty!22225 () Bool)

(assert (=> b!972861 (= e!548350 tp_is_empty!22225)))

(declare-fun b!972862 () Bool)

(declare-fun res!651201 () Bool)

(declare-fun e!548345 () Bool)

(assert (=> b!972862 (=> (not res!651201) (not e!548345))))

(declare-datatypes ((array!60493 0))(
  ( (array!60494 (arr!29110 (Array (_ BitVec 32) (_ BitVec 64))) (size!29589 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60493)

(declare-datatypes ((List!20185 0))(
  ( (Nil!20182) (Cons!20181 (h!21343 (_ BitVec 64)) (t!28610 List!20185)) )
))
(declare-fun arrayNoDuplicates!0 (array!60493 (_ BitVec 32) List!20185) Bool)

(assert (=> b!972862 (= res!651201 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20182))))

(declare-fun b!972863 () Bool)

(declare-fun res!651202 () Bool)

(assert (=> b!972863 (=> (not res!651202) (not e!548345))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60493 (_ BitVec 32)) Bool)

(assert (=> b!972863 (= res!651202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972864 () Bool)

(declare-fun e!548349 () Bool)

(assert (=> b!972864 (= e!548345 e!548349)))

(declare-fun res!651203 () Bool)

(assert (=> b!972864 (=> (not res!651203) (not e!548349))))

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((V!34617 0))(
  ( (V!34618 (val!11163 Int)) )
))
(declare-datatypes ((tuple2!14322 0))(
  ( (tuple2!14323 (_1!7172 (_ BitVec 64)) (_2!7172 V!34617)) )
))
(declare-datatypes ((List!20186 0))(
  ( (Nil!20183) (Cons!20182 (h!21344 tuple2!14322) (t!28611 List!20186)) )
))
(declare-datatypes ((ListLongMap!13019 0))(
  ( (ListLongMap!13020 (toList!6525 List!20186)) )
))
(declare-fun lt!432156 () ListLongMap!13019)

(declare-fun contains!5618 (ListLongMap!13019 (_ BitVec 64)) Bool)

(assert (=> b!972864 (= res!651203 (contains!5618 lt!432156 (select (arr!29110 _keys!1717) i!822)))))

(declare-datatypes ((ValueCell!10631 0))(
  ( (ValueCellFull!10631 (v!13722 V!34617)) (EmptyCell!10631) )
))
(declare-datatypes ((array!60495 0))(
  ( (array!60496 (arr!29111 (Array (_ BitVec 32) ValueCell!10631)) (size!29590 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60495)

(declare-fun zeroValue!1367 () V!34617)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34617)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3758 (array!60493 array!60495 (_ BitVec 32) (_ BitVec 32) V!34617 V!34617 (_ BitVec 32) Int) ListLongMap!13019)

(assert (=> b!972864 (= lt!432156 (getCurrentListMap!3758 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun mapNonEmpty!35347 () Bool)

(declare-fun mapRes!35347 () Bool)

(declare-fun tp!67259 () Bool)

(declare-fun e!548346 () Bool)

(assert (=> mapNonEmpty!35347 (= mapRes!35347 (and tp!67259 e!548346))))

(declare-fun mapRest!35347 () (Array (_ BitVec 32) ValueCell!10631))

(declare-fun mapValue!35347 () ValueCell!10631)

(declare-fun mapKey!35347 () (_ BitVec 32))

(assert (=> mapNonEmpty!35347 (= (arr!29111 _values!1425) (store mapRest!35347 mapKey!35347 mapValue!35347))))

(declare-fun b!972865 () Bool)

(declare-fun res!651200 () Bool)

(assert (=> b!972865 (=> (not res!651200) (not e!548345))))

(assert (=> b!972865 (= res!651200 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29589 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29589 _keys!1717))))))

(declare-fun b!972866 () Bool)

(declare-fun e!548344 () Bool)

(assert (=> b!972866 (= e!548349 e!548344)))

(declare-fun res!651198 () Bool)

(assert (=> b!972866 (=> (not res!651198) (not e!548344))))

(declare-fun lt!432157 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972866 (= res!651198 (validKeyInArray!0 lt!432157))))

(assert (=> b!972866 (= lt!432157 (select (arr!29110 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432154 () ListLongMap!13019)

(assert (=> b!972866 (= lt!432154 (getCurrentListMap!3758 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972867 () Bool)

(declare-fun res!651197 () Bool)

(assert (=> b!972867 (=> (not res!651197) (not e!548345))))

(assert (=> b!972867 (= res!651197 (and (= (size!29590 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29589 _keys!1717) (size!29590 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972868 () Bool)

(declare-fun res!651199 () Bool)

(assert (=> b!972868 (=> (not res!651199) (not e!548345))))

(assert (=> b!972868 (= res!651199 (validKeyInArray!0 (select (arr!29110 _keys!1717) i!822)))))

(declare-fun res!651204 () Bool)

(assert (=> start!83334 (=> (not res!651204) (not e!548345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83334 (= res!651204 (validMask!0 mask!2147))))

(assert (=> start!83334 e!548345))

(assert (=> start!83334 true))

(declare-fun e!548347 () Bool)

(declare-fun array_inv!22519 (array!60495) Bool)

(assert (=> start!83334 (and (array_inv!22519 _values!1425) e!548347)))

(assert (=> start!83334 tp_is_empty!22225))

(assert (=> start!83334 tp!67260))

(declare-fun array_inv!22520 (array!60493) Bool)

(assert (=> start!83334 (array_inv!22520 _keys!1717)))

(declare-fun mapIsEmpty!35347 () Bool)

(assert (=> mapIsEmpty!35347 mapRes!35347))

(declare-fun b!972869 () Bool)

(assert (=> b!972869 (= e!548347 (and e!548350 mapRes!35347))))

(declare-fun condMapEmpty!35347 () Bool)

(declare-fun mapDefault!35347 () ValueCell!10631)

