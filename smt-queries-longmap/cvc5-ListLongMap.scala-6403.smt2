; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82214 () Bool)

(assert start!82214)

(declare-fun b_free!18487 () Bool)

(declare-fun b_next!18487 () Bool)

(assert (=> start!82214 (= b_free!18487 (not b_next!18487))))

(declare-fun tp!64422 () Bool)

(declare-fun b_and!29975 () Bool)

(assert (=> start!82214 (= tp!64422 b_and!29975)))

(declare-fun res!641422 () Bool)

(declare-fun e!540222 () Bool)

(assert (=> start!82214 (=> (not res!641422) (not e!540222))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82214 (= res!641422 (validMask!0 mask!2088))))

(assert (=> start!82214 e!540222))

(assert (=> start!82214 true))

(declare-fun tp_is_empty!21193 () Bool)

(assert (=> start!82214 tp_is_empty!21193))

(declare-datatypes ((array!58487 0))(
  ( (array!58488 (arr!28117 (Array (_ BitVec 32) (_ BitVec 64))) (size!28596 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58487)

(declare-fun array_inv!21809 (array!58487) Bool)

(assert (=> start!82214 (array_inv!21809 _keys!1668)))

(declare-datatypes ((V!33241 0))(
  ( (V!33242 (val!10647 Int)) )
))
(declare-datatypes ((ValueCell!10115 0))(
  ( (ValueCellFull!10115 (v!13204 V!33241)) (EmptyCell!10115) )
))
(declare-datatypes ((array!58489 0))(
  ( (array!58490 (arr!28118 (Array (_ BitVec 32) ValueCell!10115)) (size!28597 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58489)

(declare-fun e!540225 () Bool)

(declare-fun array_inv!21810 (array!58489) Bool)

(assert (=> start!82214 (and (array_inv!21810 _values!1386) e!540225)))

(assert (=> start!82214 tp!64422))

(declare-fun b!958253 () Bool)

(assert (=> b!958253 (= e!540222 false)))

(declare-fun lt!430422 () Bool)

(declare-fun minValue!1328 () V!33241)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33241)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13724 0))(
  ( (tuple2!13725 (_1!6873 (_ BitVec 64)) (_2!6873 V!33241)) )
))
(declare-datatypes ((List!19546 0))(
  ( (Nil!19543) (Cons!19542 (h!20704 tuple2!13724) (t!27909 List!19546)) )
))
(declare-datatypes ((ListLongMap!12421 0))(
  ( (ListLongMap!12422 (toList!6226 List!19546)) )
))
(declare-fun contains!5327 (ListLongMap!12421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3459 (array!58487 array!58489 (_ BitVec 32) (_ BitVec 32) V!33241 V!33241 (_ BitVec 32) Int) ListLongMap!12421)

(assert (=> b!958253 (= lt!430422 (contains!5327 (getCurrentListMap!3459 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28117 _keys!1668) i!793)))))

(declare-fun b!958254 () Bool)

(declare-fun res!641423 () Bool)

(assert (=> b!958254 (=> (not res!641423) (not e!540222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58487 (_ BitVec 32)) Bool)

(assert (=> b!958254 (= res!641423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958255 () Bool)

(declare-fun e!540221 () Bool)

(assert (=> b!958255 (= e!540221 tp_is_empty!21193)))

(declare-fun b!958256 () Bool)

(declare-fun mapRes!33769 () Bool)

(assert (=> b!958256 (= e!540225 (and e!540221 mapRes!33769))))

(declare-fun condMapEmpty!33769 () Bool)

(declare-fun mapDefault!33769 () ValueCell!10115)

