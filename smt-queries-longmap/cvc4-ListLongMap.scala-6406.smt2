; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82236 () Bool)

(assert start!82236)

(declare-fun b_free!18509 () Bool)

(declare-fun b_next!18509 () Bool)

(assert (=> start!82236 (= b_free!18509 (not b_next!18509))))

(declare-fun tp!64488 () Bool)

(declare-fun b_and!29997 () Bool)

(assert (=> start!82236 (= tp!64488 b_and!29997)))

(declare-fun b!958550 () Bool)

(declare-fun res!641623 () Bool)

(declare-fun e!540386 () Bool)

(assert (=> b!958550 (=> (not res!641623) (not e!540386))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58529 0))(
  ( (array!58530 (arr!28138 (Array (_ BitVec 32) (_ BitVec 64))) (size!28617 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58529)

(declare-datatypes ((V!33269 0))(
  ( (V!33270 (val!10658 Int)) )
))
(declare-datatypes ((ValueCell!10126 0))(
  ( (ValueCellFull!10126 (v!13215 V!33269)) (EmptyCell!10126) )
))
(declare-datatypes ((array!58531 0))(
  ( (array!58532 (arr!28139 (Array (_ BitVec 32) ValueCell!10126)) (size!28618 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58531)

(assert (=> b!958550 (= res!641623 (and (= (size!28618 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28617 _keys!1668) (size!28618 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958551 () Bool)

(declare-fun res!641621 () Bool)

(assert (=> b!958551 (=> (not res!641621) (not e!540386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58529 (_ BitVec 32)) Bool)

(assert (=> b!958551 (= res!641621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958552 () Bool)

(declare-fun e!540390 () Bool)

(declare-fun tp_is_empty!21215 () Bool)

(assert (=> b!958552 (= e!540390 tp_is_empty!21215)))

(declare-fun b!958553 () Bool)

(assert (=> b!958553 (= e!540386 false)))

(declare-fun lt!430455 () Bool)

(declare-fun minValue!1328 () V!33269)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33269)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13738 0))(
  ( (tuple2!13739 (_1!6880 (_ BitVec 64)) (_2!6880 V!33269)) )
))
(declare-datatypes ((List!19561 0))(
  ( (Nil!19558) (Cons!19557 (h!20719 tuple2!13738) (t!27924 List!19561)) )
))
(declare-datatypes ((ListLongMap!12435 0))(
  ( (ListLongMap!12436 (toList!6233 List!19561)) )
))
(declare-fun contains!5334 (ListLongMap!12435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3466 (array!58529 array!58531 (_ BitVec 32) (_ BitVec 32) V!33269 V!33269 (_ BitVec 32) Int) ListLongMap!12435)

(assert (=> b!958553 (= lt!430455 (contains!5334 (getCurrentListMap!3466 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28138 _keys!1668) i!793)))))

(declare-fun res!641620 () Bool)

(assert (=> start!82236 (=> (not res!641620) (not e!540386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82236 (= res!641620 (validMask!0 mask!2088))))

(assert (=> start!82236 e!540386))

(assert (=> start!82236 true))

(assert (=> start!82236 tp_is_empty!21215))

(declare-fun array_inv!21823 (array!58529) Bool)

(assert (=> start!82236 (array_inv!21823 _keys!1668)))

(declare-fun e!540389 () Bool)

(declare-fun array_inv!21824 (array!58531) Bool)

(assert (=> start!82236 (and (array_inv!21824 _values!1386) e!540389)))

(assert (=> start!82236 tp!64488))

(declare-fun b!958554 () Bool)

(declare-fun res!641619 () Bool)

(assert (=> b!958554 (=> (not res!641619) (not e!540386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958554 (= res!641619 (validKeyInArray!0 (select (arr!28138 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33802 () Bool)

(declare-fun mapRes!33802 () Bool)

(declare-fun tp!64487 () Bool)

(assert (=> mapNonEmpty!33802 (= mapRes!33802 (and tp!64487 e!540390))))

(declare-fun mapRest!33802 () (Array (_ BitVec 32) ValueCell!10126))

(declare-fun mapValue!33802 () ValueCell!10126)

(declare-fun mapKey!33802 () (_ BitVec 32))

(assert (=> mapNonEmpty!33802 (= (arr!28139 _values!1386) (store mapRest!33802 mapKey!33802 mapValue!33802))))

(declare-fun b!958555 () Bool)

(declare-fun res!641622 () Bool)

(assert (=> b!958555 (=> (not res!641622) (not e!540386))))

(declare-datatypes ((List!19562 0))(
  ( (Nil!19559) (Cons!19558 (h!20720 (_ BitVec 64)) (t!27925 List!19562)) )
))
(declare-fun arrayNoDuplicates!0 (array!58529 (_ BitVec 32) List!19562) Bool)

(assert (=> b!958555 (= res!641622 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19559))))

(declare-fun mapIsEmpty!33802 () Bool)

(assert (=> mapIsEmpty!33802 mapRes!33802))

(declare-fun b!958556 () Bool)

(declare-fun e!540388 () Bool)

(assert (=> b!958556 (= e!540389 (and e!540388 mapRes!33802))))

(declare-fun condMapEmpty!33802 () Bool)

(declare-fun mapDefault!33802 () ValueCell!10126)

