; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4468 () Bool)

(assert start!4468)

(declare-fun b_free!1229 () Bool)

(declare-fun b_next!1229 () Bool)

(assert (=> start!4468 (= b_free!1229 (not b_next!1229))))

(declare-fun tp!5125 () Bool)

(declare-fun b_and!2051 () Bool)

(assert (=> start!4468 (= tp!5125 b_and!2051)))

(declare-fun b!34651 () Bool)

(declare-fun res!21038 () Bool)

(declare-fun e!21954 () Bool)

(assert (=> b!34651 (=> (not res!21038) (not e!21954))))

(declare-datatypes ((array!2383 0))(
  ( (array!2384 (arr!1139 (Array (_ BitVec 32) (_ BitVec 64))) (size!1240 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2383)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34651 (= res!21038 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34652 () Bool)

(declare-fun res!21042 () Bool)

(assert (=> b!34652 (=> (not res!21042) (not e!21954))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2383 (_ BitVec 32)) Bool)

(assert (=> b!34652 (= res!21042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1921 () Bool)

(declare-fun mapRes!1921 () Bool)

(declare-fun tp!5124 () Bool)

(declare-fun e!21952 () Bool)

(assert (=> mapNonEmpty!1921 (= mapRes!1921 (and tp!5124 e!21952))))

(declare-datatypes ((V!1935 0))(
  ( (V!1936 (val!818 Int)) )
))
(declare-datatypes ((ValueCell!592 0))(
  ( (ValueCellFull!592 (v!1913 V!1935)) (EmptyCell!592) )
))
(declare-datatypes ((array!2385 0))(
  ( (array!2386 (arr!1140 (Array (_ BitVec 32) ValueCell!592)) (size!1241 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2385)

(declare-fun mapValue!1921 () ValueCell!592)

(declare-fun mapRest!1921 () (Array (_ BitVec 32) ValueCell!592))

(declare-fun mapKey!1921 () (_ BitVec 32))

(assert (=> mapNonEmpty!1921 (= (arr!1140 _values!1501) (store mapRest!1921 mapKey!1921 mapValue!1921))))

(declare-fun b!34653 () Bool)

(declare-fun res!21036 () Bool)

(assert (=> b!34653 (=> (not res!21036) (not e!21954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34653 (= res!21036 (validKeyInArray!0 k!1304))))

(declare-fun res!21040 () Bool)

(assert (=> start!4468 (=> (not res!21040) (not e!21954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4468 (= res!21040 (validMask!0 mask!2294))))

(assert (=> start!4468 e!21954))

(assert (=> start!4468 true))

(assert (=> start!4468 tp!5125))

(declare-fun e!21955 () Bool)

(declare-fun array_inv!807 (array!2385) Bool)

(assert (=> start!4468 (and (array_inv!807 _values!1501) e!21955)))

(declare-fun array_inv!808 (array!2383) Bool)

(assert (=> start!4468 (array_inv!808 _keys!1833)))

(declare-fun tp_is_empty!1583 () Bool)

(assert (=> start!4468 tp_is_empty!1583))

(declare-fun b!34654 () Bool)

(declare-fun res!21041 () Bool)

(assert (=> b!34654 (=> (not res!21041) (not e!21954))))

(declare-datatypes ((List!917 0))(
  ( (Nil!914) (Cons!913 (h!1480 (_ BitVec 64)) (t!3622 List!917)) )
))
(declare-fun arrayNoDuplicates!0 (array!2383 (_ BitVec 32) List!917) Bool)

(assert (=> b!34654 (= res!21041 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!914))))

(declare-fun b!34655 () Bool)

(declare-fun res!21039 () Bool)

(assert (=> b!34655 (=> (not res!21039) (not e!21954))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34655 (= res!21039 (and (= (size!1241 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1240 _keys!1833) (size!1241 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34656 () Bool)

(declare-fun e!21953 () Bool)

(assert (=> b!34656 (= e!21953 tp_is_empty!1583)))

(declare-fun b!34657 () Bool)

(assert (=> b!34657 (= e!21952 tp_is_empty!1583)))

(declare-fun b!34658 () Bool)

(assert (=> b!34658 (= e!21955 (and e!21953 mapRes!1921))))

(declare-fun condMapEmpty!1921 () Bool)

(declare-fun mapDefault!1921 () ValueCell!592)

