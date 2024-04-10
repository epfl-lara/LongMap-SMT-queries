; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83124 () Bool)

(assert start!83124)

(declare-fun b_free!19117 () Bool)

(declare-fun b_next!19117 () Bool)

(assert (=> start!83124 (= b_free!19117 (not b_next!19117))))

(declare-fun tp!66630 () Bool)

(declare-fun b_and!30605 () Bool)

(assert (=> start!83124 (= tp!66630 b_and!30605)))

(declare-fun b!969674 () Bool)

(declare-fun res!649018 () Bool)

(declare-fun e!546679 () Bool)

(assert (=> b!969674 (=> (not res!649018) (not e!546679))))

(declare-datatypes ((array!60093 0))(
  ( (array!60094 (arr!28910 (Array (_ BitVec 32) (_ BitVec 64))) (size!29389 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60093)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969674 (= res!649018 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29389 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29389 _keys!1717))))))

(declare-fun b!969675 () Bool)

(declare-fun e!546676 () Bool)

(declare-fun tp_is_empty!22015 () Bool)

(assert (=> b!969675 (= e!546676 tp_is_empty!22015)))

(declare-fun res!649020 () Bool)

(assert (=> start!83124 (=> (not res!649020) (not e!546679))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83124 (= res!649020 (validMask!0 mask!2147))))

(assert (=> start!83124 e!546679))

(assert (=> start!83124 true))

(declare-datatypes ((V!34337 0))(
  ( (V!34338 (val!11058 Int)) )
))
(declare-datatypes ((ValueCell!10526 0))(
  ( (ValueCellFull!10526 (v!13617 V!34337)) (EmptyCell!10526) )
))
(declare-datatypes ((array!60095 0))(
  ( (array!60096 (arr!28911 (Array (_ BitVec 32) ValueCell!10526)) (size!29390 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60095)

(declare-fun e!546678 () Bool)

(declare-fun array_inv!22377 (array!60095) Bool)

(assert (=> start!83124 (and (array_inv!22377 _values!1425) e!546678)))

(assert (=> start!83124 tp_is_empty!22015))

(assert (=> start!83124 tp!66630))

(declare-fun array_inv!22378 (array!60093) Bool)

(assert (=> start!83124 (array_inv!22378 _keys!1717)))

(declare-fun b!969676 () Bool)

(declare-fun e!546677 () Bool)

(assert (=> b!969676 (= e!546677 tp_is_empty!22015)))

(declare-fun b!969677 () Bool)

(declare-fun res!649016 () Bool)

(assert (=> b!969677 (=> (not res!649016) (not e!546679))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969677 (= res!649016 (and (= (size!29390 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29389 _keys!1717) (size!29390 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969678 () Bool)

(assert (=> b!969678 (= e!546679 false)))

(declare-fun zeroValue!1367 () V!34337)

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!431663 () Bool)

(declare-fun minValue!1367 () V!34337)

(declare-datatypes ((tuple2!14166 0))(
  ( (tuple2!14167 (_1!7094 (_ BitVec 64)) (_2!7094 V!34337)) )
))
(declare-datatypes ((List!20035 0))(
  ( (Nil!20032) (Cons!20031 (h!21193 tuple2!14166) (t!28398 List!20035)) )
))
(declare-datatypes ((ListLongMap!12863 0))(
  ( (ListLongMap!12864 (toList!6447 List!20035)) )
))
(declare-fun contains!5551 (ListLongMap!12863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3680 (array!60093 array!60095 (_ BitVec 32) (_ BitVec 32) V!34337 V!34337 (_ BitVec 32) Int) ListLongMap!12863)

(assert (=> b!969678 (= lt!431663 (contains!5551 (getCurrentListMap!3680 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28910 _keys!1717) i!822)))))

(declare-fun b!969679 () Bool)

(declare-fun mapRes!35032 () Bool)

(assert (=> b!969679 (= e!546678 (and e!546676 mapRes!35032))))

(declare-fun condMapEmpty!35032 () Bool)

(declare-fun mapDefault!35032 () ValueCell!10526)

