; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82900 () Bool)

(assert start!82900)

(declare-fun b_free!19027 () Bool)

(declare-fun b_next!19027 () Bool)

(assert (=> start!82900 (= b_free!19027 (not b_next!19027))))

(declare-fun tp!66209 () Bool)

(declare-fun b_and!30515 () Bool)

(assert (=> start!82900 (= tp!66209 b_and!30515)))

(declare-fun res!647506 () Bool)

(declare-fun e!545213 () Bool)

(assert (=> start!82900 (=> (not res!647506) (not e!545213))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82900 (= res!647506 (validMask!0 mask!2110))))

(assert (=> start!82900 e!545213))

(assert (=> start!82900 true))

(declare-datatypes ((V!34097 0))(
  ( (V!34098 (val!10968 Int)) )
))
(declare-datatypes ((ValueCell!10436 0))(
  ( (ValueCellFull!10436 (v!13526 V!34097)) (EmptyCell!10436) )
))
(declare-datatypes ((array!59745 0))(
  ( (array!59746 (arr!28741 (Array (_ BitVec 32) ValueCell!10436)) (size!29220 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59745)

(declare-fun e!545215 () Bool)

(declare-fun array_inv!22257 (array!59745) Bool)

(assert (=> start!82900 (and (array_inv!22257 _values!1400) e!545215)))

(declare-datatypes ((array!59747 0))(
  ( (array!59748 (arr!28742 (Array (_ BitVec 32) (_ BitVec 64))) (size!29221 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59747)

(declare-fun array_inv!22258 (array!59747) Bool)

(assert (=> start!82900 (array_inv!22258 _keys!1686)))

(assert (=> start!82900 tp!66209))

(declare-fun tp_is_empty!21835 () Bool)

(assert (=> start!82900 tp_is_empty!21835))

(declare-fun b!967284 () Bool)

(declare-fun res!647503 () Bool)

(assert (=> b!967284 (=> (not res!647503) (not e!545213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59747 (_ BitVec 32)) Bool)

(assert (=> b!967284 (= res!647503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967285 () Bool)

(declare-fun e!545216 () Bool)

(assert (=> b!967285 (= e!545216 tp_is_empty!21835)))

(declare-fun b!967286 () Bool)

(declare-fun res!647501 () Bool)

(assert (=> b!967286 (=> (not res!647501) (not e!545213))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967286 (= res!647501 (and (= (size!29220 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29221 _keys!1686) (size!29220 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967287 () Bool)

(assert (=> b!967287 (= e!545213 (not true))))

(declare-fun minValue!1342 () V!34097)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34097)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14104 0))(
  ( (tuple2!14105 (_1!7063 (_ BitVec 64)) (_2!7063 V!34097)) )
))
(declare-datatypes ((List!19954 0))(
  ( (Nil!19951) (Cons!19950 (h!21112 tuple2!14104) (t!28317 List!19954)) )
))
(declare-datatypes ((ListLongMap!12801 0))(
  ( (ListLongMap!12802 (toList!6416 List!19954)) )
))
(declare-fun contains!5517 (ListLongMap!12801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3649 (array!59747 array!59745 (_ BitVec 32) (_ BitVec 32) V!34097 V!34097 (_ BitVec 32) Int) ListLongMap!12801)

(assert (=> b!967287 (contains!5517 (getCurrentListMap!3649 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28742 _keys!1686) i!803))))

(declare-datatypes ((Unit!32315 0))(
  ( (Unit!32316) )
))
(declare-fun lt!431407 () Unit!32315)

(declare-fun lemmaInListMapFromThenInFromMinusOne!52 (array!59747 array!59745 (_ BitVec 32) (_ BitVec 32) V!34097 V!34097 (_ BitVec 32) (_ BitVec 32) Int) Unit!32315)

(assert (=> b!967287 (= lt!431407 (lemmaInListMapFromThenInFromMinusOne!52 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34747 () Bool)

(declare-fun mapRes!34747 () Bool)

(declare-fun tp!66210 () Bool)

(assert (=> mapNonEmpty!34747 (= mapRes!34747 (and tp!66210 e!545216))))

(declare-fun mapValue!34747 () ValueCell!10436)

(declare-fun mapRest!34747 () (Array (_ BitVec 32) ValueCell!10436))

(declare-fun mapKey!34747 () (_ BitVec 32))

(assert (=> mapNonEmpty!34747 (= (arr!28741 _values!1400) (store mapRest!34747 mapKey!34747 mapValue!34747))))

(declare-fun b!967288 () Bool)

(declare-fun res!647499 () Bool)

(assert (=> b!967288 (=> (not res!647499) (not e!545213))))

(assert (=> b!967288 (= res!647499 (contains!5517 (getCurrentListMap!3649 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28742 _keys!1686) i!803)))))

(declare-fun b!967289 () Bool)

(declare-fun res!647505 () Bool)

(assert (=> b!967289 (=> (not res!647505) (not e!545213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967289 (= res!647505 (validKeyInArray!0 (select (arr!28742 _keys!1686) i!803)))))

(declare-fun b!967290 () Bool)

(declare-fun res!647504 () Bool)

(assert (=> b!967290 (=> (not res!647504) (not e!545213))))

(declare-datatypes ((List!19955 0))(
  ( (Nil!19952) (Cons!19951 (h!21113 (_ BitVec 64)) (t!28318 List!19955)) )
))
(declare-fun arrayNoDuplicates!0 (array!59747 (_ BitVec 32) List!19955) Bool)

(assert (=> b!967290 (= res!647504 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19952))))

(declare-fun b!967291 () Bool)

(declare-fun res!647500 () Bool)

(assert (=> b!967291 (=> (not res!647500) (not e!545213))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967291 (= res!647500 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29221 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29221 _keys!1686))))))

(declare-fun mapIsEmpty!34747 () Bool)

(assert (=> mapIsEmpty!34747 mapRes!34747))

(declare-fun b!967292 () Bool)

(declare-fun e!545214 () Bool)

(assert (=> b!967292 (= e!545214 tp_is_empty!21835)))

(declare-fun b!967293 () Bool)

(assert (=> b!967293 (= e!545215 (and e!545214 mapRes!34747))))

(declare-fun condMapEmpty!34747 () Bool)

(declare-fun mapDefault!34747 () ValueCell!10436)

