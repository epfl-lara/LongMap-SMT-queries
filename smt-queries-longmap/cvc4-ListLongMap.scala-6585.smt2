; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83398 () Bool)

(assert start!83398)

(declare-fun b_free!19391 () Bool)

(declare-fun b_next!19391 () Bool)

(assert (=> start!83398 (= b_free!19391 (not b_next!19391))))

(declare-fun tp!67452 () Bool)

(declare-fun b_and!30993 () Bool)

(assert (=> start!83398 (= tp!67452 b_and!30993)))

(declare-fun b!973954 () Bool)

(declare-fun res!651950 () Bool)

(declare-fun e!548983 () Bool)

(assert (=> b!973954 (=> (not res!651950) (not e!548983))))

(declare-datatypes ((array!60619 0))(
  ( (array!60620 (arr!29173 (Array (_ BitVec 32) (_ BitVec 64))) (size!29652 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60619)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60619 (_ BitVec 32)) Bool)

(assert (=> b!973954 (= res!651950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35443 () Bool)

(declare-fun mapRes!35443 () Bool)

(assert (=> mapIsEmpty!35443 mapRes!35443))

(declare-fun b!973955 () Bool)

(declare-fun res!651952 () Bool)

(assert (=> b!973955 (=> (not res!651952) (not e!548983))))

(declare-datatypes ((V!34701 0))(
  ( (V!34702 (val!11195 Int)) )
))
(declare-datatypes ((ValueCell!10663 0))(
  ( (ValueCellFull!10663 (v!13754 V!34701)) (EmptyCell!10663) )
))
(declare-datatypes ((array!60621 0))(
  ( (array!60622 (arr!29174 (Array (_ BitVec 32) ValueCell!10663)) (size!29653 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60621)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973955 (= res!651952 (and (= (size!29653 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29652 _keys!1717) (size!29653 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973956 () Bool)

(declare-fun res!651949 () Bool)

(assert (=> b!973956 (=> (not res!651949) (not e!548983))))

(declare-datatypes ((List!20241 0))(
  ( (Nil!20238) (Cons!20237 (h!21399 (_ BitVec 64)) (t!28718 List!20241)) )
))
(declare-fun arrayNoDuplicates!0 (array!60619 (_ BitVec 32) List!20241) Bool)

(assert (=> b!973956 (= res!651949 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20238))))

(declare-fun b!973957 () Bool)

(declare-fun res!651951 () Bool)

(assert (=> b!973957 (=> (not res!651951) (not e!548983))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34701)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34701)

(declare-datatypes ((tuple2!14382 0))(
  ( (tuple2!14383 (_1!7202 (_ BitVec 64)) (_2!7202 V!34701)) )
))
(declare-datatypes ((List!20242 0))(
  ( (Nil!20239) (Cons!20238 (h!21400 tuple2!14382) (t!28719 List!20242)) )
))
(declare-datatypes ((ListLongMap!13079 0))(
  ( (ListLongMap!13080 (toList!6555 List!20242)) )
))
(declare-fun contains!5645 (ListLongMap!13079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3788 (array!60619 array!60621 (_ BitVec 32) (_ BitVec 32) V!34701 V!34701 (_ BitVec 32) Int) ListLongMap!13079)

(assert (=> b!973957 (= res!651951 (contains!5645 (getCurrentListMap!3788 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29173 _keys!1717) i!822)))))

(declare-fun b!973958 () Bool)

(declare-fun res!651953 () Bool)

(assert (=> b!973958 (=> (not res!651953) (not e!548983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973958 (= res!651953 (validKeyInArray!0 (select (arr!29173 _keys!1717) i!822)))))

(declare-fun b!973959 () Bool)

(declare-fun e!548985 () Bool)

(declare-fun e!548986 () Bool)

(assert (=> b!973959 (= e!548985 (and e!548986 mapRes!35443))))

(declare-fun condMapEmpty!35443 () Bool)

(declare-fun mapDefault!35443 () ValueCell!10663)

