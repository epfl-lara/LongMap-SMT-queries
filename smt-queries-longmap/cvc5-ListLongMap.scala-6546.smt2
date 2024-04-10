; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83160 () Bool)

(assert start!83160)

(declare-fun b_free!19153 () Bool)

(declare-fun b_next!19153 () Bool)

(assert (=> start!83160 (= b_free!19153 (not b_next!19153))))

(declare-fun tp!66738 () Bool)

(declare-fun b_and!30641 () Bool)

(assert (=> start!83160 (= tp!66738 b_and!30641)))

(declare-fun mapIsEmpty!35086 () Bool)

(declare-fun mapRes!35086 () Bool)

(assert (=> mapIsEmpty!35086 mapRes!35086))

(declare-fun b!970169 () Bool)

(declare-fun e!546947 () Bool)

(declare-fun tp_is_empty!22051 () Bool)

(assert (=> b!970169 (= e!546947 tp_is_empty!22051)))

(declare-fun b!970170 () Bool)

(declare-fun res!649350 () Bool)

(declare-fun e!546946 () Bool)

(assert (=> b!970170 (=> (not res!649350) (not e!546946))))

(declare-datatypes ((array!60161 0))(
  ( (array!60162 (arr!28944 (Array (_ BitVec 32) (_ BitVec 64))) (size!29423 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60161)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60161 (_ BitVec 32)) Bool)

(assert (=> b!970170 (= res!649350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35086 () Bool)

(declare-fun tp!66737 () Bool)

(assert (=> mapNonEmpty!35086 (= mapRes!35086 (and tp!66737 e!546947))))

(declare-datatypes ((V!34385 0))(
  ( (V!34386 (val!11076 Int)) )
))
(declare-datatypes ((ValueCell!10544 0))(
  ( (ValueCellFull!10544 (v!13635 V!34385)) (EmptyCell!10544) )
))
(declare-datatypes ((array!60163 0))(
  ( (array!60164 (arr!28945 (Array (_ BitVec 32) ValueCell!10544)) (size!29424 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60163)

(declare-fun mapValue!35086 () ValueCell!10544)

(declare-fun mapKey!35086 () (_ BitVec 32))

(declare-fun mapRest!35086 () (Array (_ BitVec 32) ValueCell!10544))

(assert (=> mapNonEmpty!35086 (= (arr!28945 _values!1425) (store mapRest!35086 mapKey!35086 mapValue!35086))))

(declare-fun b!970171 () Bool)

(declare-fun res!649353 () Bool)

(assert (=> b!970171 (=> (not res!649353) (not e!546946))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970171 (= res!649353 (and (= (size!29424 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29423 _keys!1717) (size!29424 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970172 () Bool)

(declare-fun res!649349 () Bool)

(assert (=> b!970172 (=> (not res!649349) (not e!546946))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970172 (= res!649349 (validKeyInArray!0 (select (arr!28944 _keys!1717) i!822)))))

(declare-fun b!970173 () Bool)

(declare-fun e!546945 () Bool)

(assert (=> b!970173 (= e!546945 tp_is_empty!22051)))

(declare-fun b!970174 () Bool)

(assert (=> b!970174 (= e!546946 false)))

(declare-fun zeroValue!1367 () V!34385)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!431708 () Bool)

(declare-fun minValue!1367 () V!34385)

(declare-datatypes ((tuple2!14190 0))(
  ( (tuple2!14191 (_1!7106 (_ BitVec 64)) (_2!7106 V!34385)) )
))
(declare-datatypes ((List!20061 0))(
  ( (Nil!20058) (Cons!20057 (h!21219 tuple2!14190) (t!28424 List!20061)) )
))
(declare-datatypes ((ListLongMap!12887 0))(
  ( (ListLongMap!12888 (toList!6459 List!20061)) )
))
(declare-fun contains!5563 (ListLongMap!12887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3692 (array!60161 array!60163 (_ BitVec 32) (_ BitVec 32) V!34385 V!34385 (_ BitVec 32) Int) ListLongMap!12887)

(assert (=> b!970174 (= lt!431708 (contains!5563 (getCurrentListMap!3692 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28944 _keys!1717) i!822)))))

(declare-fun b!970176 () Bool)

(declare-fun res!649351 () Bool)

(assert (=> b!970176 (=> (not res!649351) (not e!546946))))

(declare-datatypes ((List!20062 0))(
  ( (Nil!20059) (Cons!20058 (h!21220 (_ BitVec 64)) (t!28425 List!20062)) )
))
(declare-fun arrayNoDuplicates!0 (array!60161 (_ BitVec 32) List!20062) Bool)

(assert (=> b!970176 (= res!649351 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20059))))

(declare-fun b!970177 () Bool)

(declare-fun res!649352 () Bool)

(assert (=> b!970177 (=> (not res!649352) (not e!546946))))

(assert (=> b!970177 (= res!649352 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29423 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29423 _keys!1717))))))

(declare-fun res!649348 () Bool)

(assert (=> start!83160 (=> (not res!649348) (not e!546946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83160 (= res!649348 (validMask!0 mask!2147))))

(assert (=> start!83160 e!546946))

(assert (=> start!83160 true))

(declare-fun e!546948 () Bool)

(declare-fun array_inv!22405 (array!60163) Bool)

(assert (=> start!83160 (and (array_inv!22405 _values!1425) e!546948)))

(assert (=> start!83160 tp_is_empty!22051))

(assert (=> start!83160 tp!66738))

(declare-fun array_inv!22406 (array!60161) Bool)

(assert (=> start!83160 (array_inv!22406 _keys!1717)))

(declare-fun b!970175 () Bool)

(assert (=> b!970175 (= e!546948 (and e!546945 mapRes!35086))))

(declare-fun condMapEmpty!35086 () Bool)

(declare-fun mapDefault!35086 () ValueCell!10544)

