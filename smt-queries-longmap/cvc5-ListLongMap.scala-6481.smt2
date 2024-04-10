; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82726 () Bool)

(assert start!82726)

(declare-fun b_free!18859 () Bool)

(declare-fun b_next!18859 () Bool)

(assert (=> start!82726 (= b_free!18859 (not b_next!18859))))

(declare-fun tp!65697 () Bool)

(declare-fun b_and!30347 () Bool)

(assert (=> start!82726 (= tp!65697 b_and!30347)))

(declare-fun b!964820 () Bool)

(declare-fun res!645822 () Bool)

(declare-fun e!543900 () Bool)

(assert (=> b!964820 (=> (not res!645822) (not e!543900))))

(declare-datatypes ((array!59409 0))(
  ( (array!59410 (arr!28573 (Array (_ BitVec 32) (_ BitVec 64))) (size!29052 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59409)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964820 (= res!645822 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29052 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29052 _keys!1686))))))

(declare-fun mapIsEmpty!34486 () Bool)

(declare-fun mapRes!34486 () Bool)

(assert (=> mapIsEmpty!34486 mapRes!34486))

(declare-fun b!964821 () Bool)

(declare-fun e!543901 () Bool)

(declare-fun tp_is_empty!21661 () Bool)

(assert (=> b!964821 (= e!543901 tp_is_empty!21661)))

(declare-fun mapNonEmpty!34486 () Bool)

(declare-fun tp!65696 () Bool)

(assert (=> mapNonEmpty!34486 (= mapRes!34486 (and tp!65696 e!543901))))

(declare-datatypes ((V!33865 0))(
  ( (V!33866 (val!10881 Int)) )
))
(declare-datatypes ((ValueCell!10349 0))(
  ( (ValueCellFull!10349 (v!13439 V!33865)) (EmptyCell!10349) )
))
(declare-fun mapRest!34486 () (Array (_ BitVec 32) ValueCell!10349))

(declare-datatypes ((array!59411 0))(
  ( (array!59412 (arr!28574 (Array (_ BitVec 32) ValueCell!10349)) (size!29053 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59411)

(declare-fun mapValue!34486 () ValueCell!10349)

(declare-fun mapKey!34486 () (_ BitVec 32))

(assert (=> mapNonEmpty!34486 (= (arr!28574 _values!1400) (store mapRest!34486 mapKey!34486 mapValue!34486))))

(declare-fun b!964822 () Bool)

(declare-fun e!543904 () Bool)

(assert (=> b!964822 (= e!543900 (not e!543904))))

(declare-fun res!645824 () Bool)

(assert (=> b!964822 (=> res!645824 e!543904)))

(assert (=> b!964822 (= res!645824 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29052 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33865)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33865)

(declare-datatypes ((tuple2!13988 0))(
  ( (tuple2!13989 (_1!7005 (_ BitVec 64)) (_2!7005 V!33865)) )
))
(declare-datatypes ((List!19833 0))(
  ( (Nil!19830) (Cons!19829 (h!20991 tuple2!13988) (t!28196 List!19833)) )
))
(declare-datatypes ((ListLongMap!12685 0))(
  ( (ListLongMap!12686 (toList!6358 List!19833)) )
))
(declare-fun contains!5461 (ListLongMap!12685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3591 (array!59409 array!59411 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) Int) ListLongMap!12685)

(assert (=> b!964822 (contains!5461 (getCurrentListMap!3591 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28573 _keys!1686) i!803))))

(declare-datatypes ((Unit!32297 0))(
  ( (Unit!32298) )
))
(declare-fun lt!431167 () Unit!32297)

(declare-fun lemmaInListMapFromThenInFromMinusOne!43 (array!59409 array!59411 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) (_ BitVec 32) Int) Unit!32297)

(assert (=> b!964822 (= lt!431167 (lemmaInListMapFromThenInFromMinusOne!43 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!645820 () Bool)

(assert (=> start!82726 (=> (not res!645820) (not e!543900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82726 (= res!645820 (validMask!0 mask!2110))))

(assert (=> start!82726 e!543900))

(assert (=> start!82726 true))

(declare-fun e!543902 () Bool)

(declare-fun array_inv!22123 (array!59411) Bool)

(assert (=> start!82726 (and (array_inv!22123 _values!1400) e!543902)))

(declare-fun array_inv!22124 (array!59409) Bool)

(assert (=> start!82726 (array_inv!22124 _keys!1686)))

(assert (=> start!82726 tp!65697))

(assert (=> start!82726 tp_is_empty!21661))

(declare-fun b!964823 () Bool)

(declare-fun e!543903 () Bool)

(assert (=> b!964823 (= e!543902 (and e!543903 mapRes!34486))))

(declare-fun condMapEmpty!34486 () Bool)

(declare-fun mapDefault!34486 () ValueCell!10349)

