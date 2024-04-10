; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82954 () Bool)

(assert start!82954)

(declare-fun b_free!19081 () Bool)

(declare-fun b_next!19081 () Bool)

(assert (=> start!82954 (= b_free!19081 (not b_next!19081))))

(declare-fun tp!66372 () Bool)

(declare-fun b_and!30569 () Bool)

(assert (=> start!82954 (= tp!66372 b_and!30569)))

(declare-fun b!968186 () Bool)

(declare-fun res!648158 () Bool)

(declare-fun e!545631 () Bool)

(assert (=> b!968186 (=> (not res!648158) (not e!545631))))

(declare-datatypes ((array!59849 0))(
  ( (array!59850 (arr!28793 (Array (_ BitVec 32) (_ BitVec 64))) (size!29272 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59849)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968186 (= res!648158 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29272 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29272 _keys!1686))))))

(declare-fun b!968187 () Bool)

(declare-fun res!648161 () Bool)

(assert (=> b!968187 (=> (not res!648161) (not e!545631))))

(declare-datatypes ((V!34169 0))(
  ( (V!34170 (val!10995 Int)) )
))
(declare-datatypes ((ValueCell!10463 0))(
  ( (ValueCellFull!10463 (v!13553 V!34169)) (EmptyCell!10463) )
))
(declare-datatypes ((array!59851 0))(
  ( (array!59852 (arr!28794 (Array (_ BitVec 32) ValueCell!10463)) (size!29273 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59851)

(declare-fun minValue!1342 () V!34169)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34169)

(declare-datatypes ((tuple2!14146 0))(
  ( (tuple2!14147 (_1!7084 (_ BitVec 64)) (_2!7084 V!34169)) )
))
(declare-datatypes ((List!19993 0))(
  ( (Nil!19990) (Cons!19989 (h!21151 tuple2!14146) (t!28356 List!19993)) )
))
(declare-datatypes ((ListLongMap!12843 0))(
  ( (ListLongMap!12844 (toList!6437 List!19993)) )
))
(declare-fun contains!5538 (ListLongMap!12843 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3670 (array!59849 array!59851 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) Int) ListLongMap!12843)

(assert (=> b!968187 (= res!648161 (contains!5538 (getCurrentListMap!3670 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28793 _keys!1686) i!803)))))

(declare-fun res!648163 () Bool)

(assert (=> start!82954 (=> (not res!648163) (not e!545631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82954 (= res!648163 (validMask!0 mask!2110))))

(assert (=> start!82954 e!545631))

(assert (=> start!82954 true))

(declare-fun e!545629 () Bool)

(declare-fun array_inv!22291 (array!59851) Bool)

(assert (=> start!82954 (and (array_inv!22291 _values!1400) e!545629)))

(declare-fun array_inv!22292 (array!59849) Bool)

(assert (=> start!82954 (array_inv!22292 _keys!1686)))

(assert (=> start!82954 tp!66372))

(declare-fun tp_is_empty!21889 () Bool)

(assert (=> start!82954 tp_is_empty!21889))

(declare-fun b!968188 () Bool)

(declare-fun e!545628 () Bool)

(assert (=> b!968188 (= e!545628 tp_is_empty!21889)))

(declare-fun b!968189 () Bool)

(declare-fun res!648165 () Bool)

(assert (=> b!968189 (=> (not res!648165) (not e!545631))))

(assert (=> b!968189 (= res!648165 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968190 () Bool)

(declare-fun e!545632 () Bool)

(assert (=> b!968190 (= e!545632 true)))

(assert (=> b!968190 (contains!5538 (getCurrentListMap!3670 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28793 _keys!1686) i!803))))

(declare-datatypes ((Unit!32355 0))(
  ( (Unit!32356) )
))
(declare-fun lt!431499 () Unit!32355)

(declare-fun lemmaInListMapFromThenInFromSmaller!41 (array!59849 array!59851 (_ BitVec 32) (_ BitVec 32) V!34169 V!34169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32355)

(assert (=> b!968190 (= lt!431499 (lemmaInListMapFromThenInFromSmaller!41 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!968191 () Bool)

(declare-fun e!545630 () Bool)

(declare-fun mapRes!34828 () Bool)

(assert (=> b!968191 (= e!545629 (and e!545630 mapRes!34828))))

(declare-fun condMapEmpty!34828 () Bool)

(declare-fun mapDefault!34828 () ValueCell!10463)

