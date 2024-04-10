; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34066 () Bool)

(assert start!34066)

(declare-fun b_free!7145 () Bool)

(declare-fun b_next!7145 () Bool)

(assert (=> start!34066 (= b_free!7145 (not b_next!7145))))

(declare-fun tp!24960 () Bool)

(declare-fun b_and!14339 () Bool)

(assert (=> start!34066 (= tp!24960 b_and!14339)))

(declare-fun b!339402 () Bool)

(declare-fun res!187466 () Bool)

(declare-fun e!208234 () Bool)

(assert (=> b!339402 (=> (not res!187466) (not e!208234))))

(declare-datatypes ((array!17793 0))(
  ( (array!17794 (arr!8420 (Array (_ BitVec 32) (_ BitVec 64))) (size!8772 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17793)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17793 (_ BitVec 32)) Bool)

(assert (=> b!339402 (= res!187466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339403 () Bool)

(declare-fun e!208238 () Bool)

(declare-fun tp_is_empty!7097 () Bool)

(assert (=> b!339403 (= e!208238 tp_is_empty!7097)))

(declare-fun mapNonEmpty!12063 () Bool)

(declare-fun mapRes!12063 () Bool)

(declare-fun tp!24959 () Bool)

(assert (=> mapNonEmpty!12063 (= mapRes!12063 (and tp!24959 e!208238))))

(declare-datatypes ((V!10439 0))(
  ( (V!10440 (val!3593 Int)) )
))
(declare-datatypes ((ValueCell!3205 0))(
  ( (ValueCellFull!3205 (v!5762 V!10439)) (EmptyCell!3205) )
))
(declare-fun mapRest!12063 () (Array (_ BitVec 32) ValueCell!3205))

(declare-fun mapKey!12063 () (_ BitVec 32))

(declare-fun mapValue!12063 () ValueCell!3205)

(declare-datatypes ((array!17795 0))(
  ( (array!17796 (arr!8421 (Array (_ BitVec 32) ValueCell!3205)) (size!8773 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17795)

(assert (=> mapNonEmpty!12063 (= (arr!8421 _values!1525) (store mapRest!12063 mapKey!12063 mapValue!12063))))

(declare-fun mapIsEmpty!12063 () Bool)

(assert (=> mapIsEmpty!12063 mapRes!12063))

(declare-fun b!339404 () Bool)

(declare-fun res!187469 () Bool)

(assert (=> b!339404 (=> (not res!187469) (not e!208234))))

(declare-datatypes ((List!4834 0))(
  ( (Nil!4831) (Cons!4830 (h!5686 (_ BitVec 64)) (t!9936 List!4834)) )
))
(declare-fun arrayNoDuplicates!0 (array!17793 (_ BitVec 32) List!4834) Bool)

(assert (=> b!339404 (= res!187469 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4831))))

(declare-fun res!187463 () Bool)

(assert (=> start!34066 (=> (not res!187463) (not e!208234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34066 (= res!187463 (validMask!0 mask!2385))))

(assert (=> start!34066 e!208234))

(assert (=> start!34066 true))

(assert (=> start!34066 tp_is_empty!7097))

(assert (=> start!34066 tp!24960))

(declare-fun e!208233 () Bool)

(declare-fun array_inv!6242 (array!17795) Bool)

(assert (=> start!34066 (and (array_inv!6242 _values!1525) e!208233)))

(declare-fun array_inv!6243 (array!17793) Bool)

(assert (=> start!34066 (array_inv!6243 _keys!1895)))

(declare-fun b!339405 () Bool)

(declare-datatypes ((Unit!10569 0))(
  ( (Unit!10570) )
))
(declare-fun e!208235 () Unit!10569)

(declare-fun Unit!10571 () Unit!10569)

(assert (=> b!339405 (= e!208235 Unit!10571)))

(declare-fun b!339406 () Bool)

(declare-fun res!187467 () Bool)

(assert (=> b!339406 (=> (not res!187467) (not e!208234))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339406 (= res!187467 (and (= (size!8773 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8772 _keys!1895) (size!8773 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339407 () Bool)

(declare-fun e!208236 () Bool)

(assert (=> b!339407 (= e!208234 e!208236)))

(declare-fun res!187465 () Bool)

(assert (=> b!339407 (=> (not res!187465) (not e!208236))))

(declare-datatypes ((SeekEntryResult!3253 0))(
  ( (MissingZero!3253 (index!15191 (_ BitVec 32))) (Found!3253 (index!15192 (_ BitVec 32))) (Intermediate!3253 (undefined!4065 Bool) (index!15193 (_ BitVec 32)) (x!33801 (_ BitVec 32))) (Undefined!3253) (MissingVacant!3253 (index!15194 (_ BitVec 32))) )
))
(declare-fun lt!161199 () SeekEntryResult!3253)

(assert (=> b!339407 (= res!187465 (and (not (is-Found!3253 lt!161199)) (is-MissingZero!3253 lt!161199)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17793 (_ BitVec 32)) SeekEntryResult!3253)

(assert (=> b!339407 (= lt!161199 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!339408 () Bool)

(declare-fun e!208237 () Bool)

(assert (=> b!339408 (= e!208237 tp_is_empty!7097)))

(declare-fun b!339409 () Bool)

(declare-fun res!187468 () Bool)

(assert (=> b!339409 (=> (not res!187468) (not e!208234))))

(declare-fun zeroValue!1467 () V!10439)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10439)

(declare-datatypes ((tuple2!5216 0))(
  ( (tuple2!5217 (_1!2619 (_ BitVec 64)) (_2!2619 V!10439)) )
))
(declare-datatypes ((List!4835 0))(
  ( (Nil!4832) (Cons!4831 (h!5687 tuple2!5216) (t!9937 List!4835)) )
))
(declare-datatypes ((ListLongMap!4129 0))(
  ( (ListLongMap!4130 (toList!2080 List!4835)) )
))
(declare-fun contains!2131 (ListLongMap!4129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1601 (array!17793 array!17795 (_ BitVec 32) (_ BitVec 32) V!10439 V!10439 (_ BitVec 32) Int) ListLongMap!4129)

(assert (=> b!339409 (= res!187468 (not (contains!2131 (getCurrentListMap!1601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!339410 () Bool)

(assert (=> b!339410 (= e!208233 (and e!208237 mapRes!12063))))

(declare-fun condMapEmpty!12063 () Bool)

(declare-fun mapDefault!12063 () ValueCell!3205)

