; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82016 () Bool)

(assert start!82016)

(declare-fun b_free!18439 () Bool)

(declare-fun b_next!18439 () Bool)

(assert (=> start!82016 (= b_free!18439 (not b_next!18439))))

(declare-fun tp!64125 () Bool)

(declare-fun b_and!29925 () Bool)

(assert (=> start!82016 (= tp!64125 b_and!29925)))

(declare-fun b!956533 () Bool)

(declare-fun e!539022 () Bool)

(declare-fun tp_is_empty!21055 () Bool)

(assert (=> b!956533 (= e!539022 tp_is_empty!21055)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun b!956534 () Bool)

(declare-datatypes ((array!58207 0))(
  ( (array!58208 (arr!27983 (Array (_ BitVec 32) (_ BitVec 64))) (size!28462 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58207)

(declare-datatypes ((V!33057 0))(
  ( (V!33058 (val!10578 Int)) )
))
(declare-datatypes ((ValueCell!10046 0))(
  ( (ValueCellFull!10046 (v!13133 V!33057)) (EmptyCell!10046) )
))
(declare-datatypes ((array!58209 0))(
  ( (array!58210 (arr!27984 (Array (_ BitVec 32) ValueCell!10046)) (size!28463 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58209)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!33057)

(declare-fun e!539019 () Bool)

(declare-fun minValue!1139 () V!33057)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13686 0))(
  ( (tuple2!13687 (_1!6854 (_ BitVec 64)) (_2!6854 V!33057)) )
))
(declare-datatypes ((List!19485 0))(
  ( (Nil!19482) (Cons!19481 (h!20643 tuple2!13686) (t!27846 List!19485)) )
))
(declare-datatypes ((ListLongMap!12383 0))(
  ( (ListLongMap!12384 (toList!6207 List!19485)) )
))
(declare-fun contains!5305 (ListLongMap!12383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3440 (array!58207 array!58209 (_ BitVec 32) (_ BitVec 32) V!33057 V!33057 (_ BitVec 32) Int) ListLongMap!12383)

(assert (=> b!956534 (= e!539019 (not (contains!5305 (getCurrentListMap!3440 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27983 _keys!1441) i!735))))))

(declare-fun b!956535 () Bool)

(declare-fun res!640454 () Bool)

(assert (=> b!956535 (=> (not res!640454) (not e!539019))))

(assert (=> b!956535 (= res!640454 (and (= (size!28463 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28462 _keys!1441) (size!28463 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956537 () Bool)

(declare-fun res!640455 () Bool)

(assert (=> b!956537 (=> (not res!640455) (not e!539019))))

(assert (=> b!956537 (= res!640455 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28462 _keys!1441))))))

(declare-fun b!956538 () Bool)

(declare-fun e!539023 () Bool)

(assert (=> b!956538 (= e!539023 tp_is_empty!21055)))

(declare-fun b!956539 () Bool)

(declare-fun res!640453 () Bool)

(assert (=> b!956539 (=> (not res!640453) (not e!539019))))

(declare-datatypes ((List!19486 0))(
  ( (Nil!19483) (Cons!19482 (h!20644 (_ BitVec 64)) (t!27847 List!19486)) )
))
(declare-fun arrayNoDuplicates!0 (array!58207 (_ BitVec 32) List!19486) Bool)

(assert (=> b!956539 (= res!640453 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19483))))

(declare-fun b!956540 () Bool)

(declare-fun e!539021 () Bool)

(declare-fun mapRes!33544 () Bool)

(assert (=> b!956540 (= e!539021 (and e!539023 mapRes!33544))))

(declare-fun condMapEmpty!33544 () Bool)

(declare-fun mapDefault!33544 () ValueCell!10046)

