; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83170 () Bool)

(assert start!83170)

(declare-fun b_free!19163 () Bool)

(declare-fun b_next!19163 () Bool)

(assert (=> start!83170 (= b_free!19163 (not b_next!19163))))

(declare-fun tp!66767 () Bool)

(declare-fun b_and!30651 () Bool)

(assert (=> start!83170 (= tp!66767 b_and!30651)))

(declare-fun b!970304 () Bool)

(declare-fun e!547021 () Bool)

(declare-fun tp_is_empty!22061 () Bool)

(assert (=> b!970304 (= e!547021 tp_is_empty!22061)))

(declare-fun res!649441 () Bool)

(declare-fun e!547020 () Bool)

(assert (=> start!83170 (=> (not res!649441) (not e!547020))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83170 (= res!649441 (validMask!0 mask!2147))))

(assert (=> start!83170 e!547020))

(assert (=> start!83170 true))

(declare-datatypes ((V!34397 0))(
  ( (V!34398 (val!11081 Int)) )
))
(declare-datatypes ((ValueCell!10549 0))(
  ( (ValueCellFull!10549 (v!13640 V!34397)) (EmptyCell!10549) )
))
(declare-datatypes ((array!60181 0))(
  ( (array!60182 (arr!28954 (Array (_ BitVec 32) ValueCell!10549)) (size!29433 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60181)

(declare-fun e!547022 () Bool)

(declare-fun array_inv!22415 (array!60181) Bool)

(assert (=> start!83170 (and (array_inv!22415 _values!1425) e!547022)))

(assert (=> start!83170 tp_is_empty!22061))

(assert (=> start!83170 tp!66767))

(declare-datatypes ((array!60183 0))(
  ( (array!60184 (arr!28955 (Array (_ BitVec 32) (_ BitVec 64))) (size!29434 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60183)

(declare-fun array_inv!22416 (array!60183) Bool)

(assert (=> start!83170 (array_inv!22416 _keys!1717)))

(declare-fun b!970305 () Bool)

(declare-fun e!547023 () Bool)

(assert (=> b!970305 (= e!547023 tp_is_empty!22061)))

(declare-fun mapIsEmpty!35101 () Bool)

(declare-fun mapRes!35101 () Bool)

(assert (=> mapIsEmpty!35101 mapRes!35101))

(declare-fun b!970306 () Bool)

(assert (=> b!970306 (= e!547022 (and e!547021 mapRes!35101))))

(declare-fun condMapEmpty!35101 () Bool)

(declare-fun mapDefault!35101 () ValueCell!10549)

