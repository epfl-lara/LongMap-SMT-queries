; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83392 () Bool)

(assert start!83392)

(declare-fun b_free!19385 () Bool)

(declare-fun b_next!19385 () Bool)

(assert (=> start!83392 (= b_free!19385 (not b_next!19385))))

(declare-fun tp!67433 () Bool)

(declare-fun b_and!30987 () Bool)

(assert (=> start!83392 (= tp!67433 b_and!30987)))

(declare-fun b!973865 () Bool)

(declare-fun res!651886 () Bool)

(declare-fun e!548937 () Bool)

(assert (=> b!973865 (=> (not res!651886) (not e!548937))))

(declare-datatypes ((array!60607 0))(
  ( (array!60608 (arr!29167 (Array (_ BitVec 32) (_ BitVec 64))) (size!29646 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60607)

(declare-datatypes ((List!20235 0))(
  ( (Nil!20232) (Cons!20231 (h!21393 (_ BitVec 64)) (t!28712 List!20235)) )
))
(declare-fun arrayNoDuplicates!0 (array!60607 (_ BitVec 32) List!20235) Bool)

(assert (=> b!973865 (= res!651886 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20232))))

(declare-fun b!973866 () Bool)

(declare-fun e!548939 () Bool)

(declare-fun tp_is_empty!22283 () Bool)

(assert (=> b!973866 (= e!548939 tp_is_empty!22283)))

(declare-fun mapNonEmpty!35434 () Bool)

(declare-fun mapRes!35434 () Bool)

(declare-fun tp!67434 () Bool)

(declare-fun e!548940 () Bool)

(assert (=> mapNonEmpty!35434 (= mapRes!35434 (and tp!67434 e!548940))))

(declare-datatypes ((V!34693 0))(
  ( (V!34694 (val!11192 Int)) )
))
(declare-datatypes ((ValueCell!10660 0))(
  ( (ValueCellFull!10660 (v!13751 V!34693)) (EmptyCell!10660) )
))
(declare-fun mapValue!35434 () ValueCell!10660)

(declare-fun mapKey!35434 () (_ BitVec 32))

(declare-datatypes ((array!60609 0))(
  ( (array!60610 (arr!29168 (Array (_ BitVec 32) ValueCell!10660)) (size!29647 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60609)

(declare-fun mapRest!35434 () (Array (_ BitVec 32) ValueCell!10660))

(assert (=> mapNonEmpty!35434 (= (arr!29168 _values!1425) (store mapRest!35434 mapKey!35434 mapValue!35434))))

(declare-fun b!973867 () Bool)

(assert (=> b!973867 (= e!548937 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((tuple2!14376 0))(
  ( (tuple2!14377 (_1!7199 (_ BitVec 64)) (_2!7199 V!34693)) )
))
(declare-datatypes ((List!20236 0))(
  ( (Nil!20233) (Cons!20232 (h!21394 tuple2!14376) (t!28713 List!20236)) )
))
(declare-datatypes ((ListLongMap!13073 0))(
  ( (ListLongMap!13074 (toList!6552 List!20236)) )
))
(declare-fun lt!432713 () ListLongMap!13073)

(declare-fun zeroValue!1367 () V!34693)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34693)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3785 (array!60607 array!60609 (_ BitVec 32) (_ BitVec 32) V!34693 V!34693 (_ BitVec 32) Int) ListLongMap!13073)

(assert (=> b!973867 (= lt!432713 (getCurrentListMap!3785 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973868 () Bool)

(declare-fun res!651890 () Bool)

(assert (=> b!973868 (=> (not res!651890) (not e!548937))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973868 (= res!651890 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29646 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29646 _keys!1717))))))

(declare-fun b!973869 () Bool)

(declare-fun res!651885 () Bool)

(assert (=> b!973869 (=> (not res!651885) (not e!548937))))

(assert (=> b!973869 (= res!651885 (and (= (size!29647 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29646 _keys!1717) (size!29647 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973870 () Bool)

(declare-fun res!651888 () Bool)

(assert (=> b!973870 (=> (not res!651888) (not e!548937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973870 (= res!651888 (validKeyInArray!0 (select (arr!29167 _keys!1717) i!822)))))

(declare-fun b!973871 () Bool)

(declare-fun e!548938 () Bool)

(assert (=> b!973871 (= e!548938 (and e!548939 mapRes!35434))))

(declare-fun condMapEmpty!35434 () Bool)

(declare-fun mapDefault!35434 () ValueCell!10660)

