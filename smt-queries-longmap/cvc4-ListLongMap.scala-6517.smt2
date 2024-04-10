; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82946 () Bool)

(assert start!82946)

(declare-fun b_free!19073 () Bool)

(declare-fun b_next!19073 () Bool)

(assert (=> start!82946 (= b_free!19073 (not b_next!19073))))

(declare-fun tp!66348 () Bool)

(declare-fun b_and!30561 () Bool)

(assert (=> start!82946 (= tp!66348 b_and!30561)))

(declare-fun b!968043 () Bool)

(declare-fun e!545557 () Bool)

(declare-fun tp_is_empty!21881 () Bool)

(assert (=> b!968043 (= e!545557 tp_is_empty!21881)))

(declare-datatypes ((array!59835 0))(
  ( (array!59836 (arr!28786 (Array (_ BitVec 32) (_ BitVec 64))) (size!29265 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59835)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun b!968044 () Bool)

(declare-fun e!545559 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968044 (= e!545559 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29265 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001)) (bvslt (bvsub (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159) (bvsub from!2084 newFrom!159)))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34157 0))(
  ( (V!34158 (val!10991 Int)) )
))
(declare-datatypes ((ValueCell!10459 0))(
  ( (ValueCellFull!10459 (v!13549 V!34157)) (EmptyCell!10459) )
))
(declare-datatypes ((array!59837 0))(
  ( (array!59838 (arr!28787 (Array (_ BitVec 32) ValueCell!10459)) (size!29266 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59837)

(declare-fun minValue!1342 () V!34157)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34157)

(declare-datatypes ((tuple2!14140 0))(
  ( (tuple2!14141 (_1!7081 (_ BitVec 64)) (_2!7081 V!34157)) )
))
(declare-datatypes ((List!19988 0))(
  ( (Nil!19985) (Cons!19984 (h!21146 tuple2!14140) (t!28351 List!19988)) )
))
(declare-datatypes ((ListLongMap!12837 0))(
  ( (ListLongMap!12838 (toList!6434 List!19988)) )
))
(declare-fun contains!5535 (ListLongMap!12837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3667 (array!59835 array!59837 (_ BitVec 32) (_ BitVec 32) V!34157 V!34157 (_ BitVec 32) Int) ListLongMap!12837)

(assert (=> b!968044 (contains!5535 (getCurrentListMap!3667 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28786 _keys!1686) i!803))))

(declare-datatypes ((Unit!32349 0))(
  ( (Unit!32350) )
))
(declare-fun lt!431476 () Unit!32349)

(declare-fun lemmaInListMapFromThenInFromMinusOne!69 (array!59835 array!59837 (_ BitVec 32) (_ BitVec 32) V!34157 V!34157 (_ BitVec 32) (_ BitVec 32) Int) Unit!32349)

(assert (=> b!968044 (= lt!431476 (lemmaInListMapFromThenInFromMinusOne!69 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968045 () Bool)

(declare-fun res!648058 () Bool)

(assert (=> b!968045 (=> (not res!648058) (not e!545559))))

(assert (=> b!968045 (= res!648058 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968046 () Bool)

(declare-fun res!648056 () Bool)

(assert (=> b!968046 (=> (not res!648056) (not e!545559))))

(assert (=> b!968046 (= res!648056 (and (= (size!29266 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29265 _keys!1686) (size!29266 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968047 () Bool)

(declare-fun e!545558 () Bool)

(declare-fun e!545561 () Bool)

(declare-fun mapRes!34816 () Bool)

(assert (=> b!968047 (= e!545558 (and e!545561 mapRes!34816))))

(declare-fun condMapEmpty!34816 () Bool)

(declare-fun mapDefault!34816 () ValueCell!10459)

