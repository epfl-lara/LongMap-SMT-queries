; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108486 () Bool)

(assert start!108486)

(declare-fun b_free!28033 () Bool)

(declare-fun b_next!28033 () Bool)

(assert (=> start!108486 (= b_free!28033 (not b_next!28033))))

(declare-fun tp!99208 () Bool)

(declare-fun b_and!46093 () Bool)

(assert (=> start!108486 (= tp!99208 b_and!46093)))

(declare-fun b!1280409 () Bool)

(declare-fun e!731612 () Bool)

(assert (=> b!1280409 (= e!731612 false)))

(declare-datatypes ((V!50001 0))(
  ( (V!50002 (val!16911 Int)) )
))
(declare-fun minValue!1387 () V!50001)

(declare-fun zeroValue!1387 () V!50001)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15938 0))(
  ( (ValueCellFull!15938 (v!19511 V!50001)) (EmptyCell!15938) )
))
(declare-datatypes ((array!84424 0))(
  ( (array!84425 (arr!40716 (Array (_ BitVec 32) ValueCell!15938)) (size!41266 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84424)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84426 0))(
  ( (array!84427 (arr!40717 (Array (_ BitVec 32) (_ BitVec 64))) (size!41267 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84426)

(declare-fun lt!576122 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21642 0))(
  ( (tuple2!21643 (_1!10832 (_ BitVec 64)) (_2!10832 V!50001)) )
))
(declare-datatypes ((List!28841 0))(
  ( (Nil!28838) (Cons!28837 (h!30046 tuple2!21642) (t!42381 List!28841)) )
))
(declare-datatypes ((ListLongMap!19299 0))(
  ( (ListLongMap!19300 (toList!9665 List!28841)) )
))
(declare-fun contains!7780 (ListLongMap!19299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4749 (array!84426 array!84424 (_ BitVec 32) (_ BitVec 32) V!50001 V!50001 (_ BitVec 32) Int) ListLongMap!19299)

(assert (=> b!1280409 (= lt!576122 (contains!7780 (getCurrentListMap!4749 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280410 () Bool)

(declare-fun res!850519 () Bool)

(assert (=> b!1280410 (=> (not res!850519) (not e!731612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84426 (_ BitVec 32)) Bool)

(assert (=> b!1280410 (= res!850519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280412 () Bool)

(declare-fun e!731614 () Bool)

(declare-fun e!731611 () Bool)

(declare-fun mapRes!52061 () Bool)

(assert (=> b!1280412 (= e!731614 (and e!731611 mapRes!52061))))

(declare-fun condMapEmpty!52061 () Bool)

(declare-fun mapDefault!52061 () ValueCell!15938)

