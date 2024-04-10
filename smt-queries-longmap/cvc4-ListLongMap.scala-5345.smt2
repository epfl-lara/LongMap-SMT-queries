; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71436 () Bool)

(assert start!71436)

(declare-fun b_free!13481 () Bool)

(declare-fun b_next!13481 () Bool)

(assert (=> start!71436 (= b_free!13481 (not b_next!13481))))

(declare-fun tp!47224 () Bool)

(declare-fun b_and!22487 () Bool)

(assert (=> start!71436 (= tp!47224 b_and!22487)))

(declare-fun mapNonEmpty!24433 () Bool)

(declare-fun mapRes!24433 () Bool)

(declare-fun tp!47223 () Bool)

(declare-fun e!462467 () Bool)

(assert (=> mapNonEmpty!24433 (= mapRes!24433 (and tp!47223 e!462467))))

(declare-datatypes ((V!25255 0))(
  ( (V!25256 (val!7643 Int)) )
))
(declare-datatypes ((ValueCell!7180 0))(
  ( (ValueCellFull!7180 (v!10083 V!25255)) (EmptyCell!7180) )
))
(declare-fun mapRest!24433 () (Array (_ BitVec 32) ValueCell!7180))

(declare-datatypes ((array!46548 0))(
  ( (array!46549 (arr!22312 (Array (_ BitVec 32) ValueCell!7180)) (size!22733 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46548)

(declare-fun mapValue!24433 () ValueCell!7180)

(declare-fun mapKey!24433 () (_ BitVec 32))

(assert (=> mapNonEmpty!24433 (= (arr!22312 _values!788) (store mapRest!24433 mapKey!24433 mapValue!24433))))

(declare-fun res!565148 () Bool)

(declare-fun e!462466 () Bool)

(assert (=> start!71436 (=> (not res!565148) (not e!462466))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71436 (= res!565148 (validMask!0 mask!1312))))

(assert (=> start!71436 e!462466))

(declare-fun tp_is_empty!15191 () Bool)

(assert (=> start!71436 tp_is_empty!15191))

(declare-datatypes ((array!46550 0))(
  ( (array!46551 (arr!22313 (Array (_ BitVec 32) (_ BitVec 64))) (size!22734 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46550)

(declare-fun array_inv!17771 (array!46550) Bool)

(assert (=> start!71436 (array_inv!17771 _keys!976)))

(assert (=> start!71436 true))

(declare-fun e!462464 () Bool)

(declare-fun array_inv!17772 (array!46548) Bool)

(assert (=> start!71436 (and (array_inv!17772 _values!788) e!462464)))

(assert (=> start!71436 tp!47224))

(declare-fun b!829626 () Bool)

(assert (=> b!829626 (= e!462467 tp_is_empty!15191)))

(declare-fun b!829627 () Bool)

(declare-fun res!565144 () Bool)

(assert (=> b!829627 (=> (not res!565144) (not e!462466))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829627 (= res!565144 (and (= (size!22733 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22734 _keys!976) (size!22733 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829628 () Bool)

(declare-fun e!462465 () Bool)

(assert (=> b!829628 (= e!462466 (not e!462465))))

(declare-fun res!565147 () Bool)

(assert (=> b!829628 (=> res!565147 e!462465)))

(assert (=> b!829628 (= res!565147 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10138 0))(
  ( (tuple2!10139 (_1!5080 (_ BitVec 64)) (_2!5080 V!25255)) )
))
(declare-datatypes ((List!15931 0))(
  ( (Nil!15928) (Cons!15927 (h!17056 tuple2!10138) (t!22292 List!15931)) )
))
(declare-datatypes ((ListLongMap!8961 0))(
  ( (ListLongMap!8962 (toList!4496 List!15931)) )
))
(declare-fun lt!376274 () ListLongMap!8961)

(declare-fun lt!376281 () ListLongMap!8961)

(assert (=> b!829628 (= lt!376274 lt!376281)))

(declare-fun zeroValueBefore!34 () V!25255)

(declare-fun zeroValueAfter!34 () V!25255)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28413 0))(
  ( (Unit!28414) )
))
(declare-fun lt!376282 () Unit!28413)

(declare-fun minValue!754 () V!25255)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!583 (array!46550 array!46548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25255 V!25255 V!25255 V!25255 (_ BitVec 32) Int) Unit!28413)

(assert (=> b!829628 (= lt!376282 (lemmaNoChangeToArrayThenSameMapNoExtras!583 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2495 (array!46550 array!46548 (_ BitVec 32) (_ BitVec 32) V!25255 V!25255 (_ BitVec 32) Int) ListLongMap!8961)

(assert (=> b!829628 (= lt!376281 (getCurrentListMapNoExtraKeys!2495 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829628 (= lt!376274 (getCurrentListMapNoExtraKeys!2495 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829629 () Bool)

(declare-fun res!565146 () Bool)

(assert (=> b!829629 (=> (not res!565146) (not e!462466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46550 (_ BitVec 32)) Bool)

(assert (=> b!829629 (= res!565146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829630 () Bool)

(declare-fun e!462469 () Bool)

(assert (=> b!829630 (= e!462464 (and e!462469 mapRes!24433))))

(declare-fun condMapEmpty!24433 () Bool)

(declare-fun mapDefault!24433 () ValueCell!7180)

