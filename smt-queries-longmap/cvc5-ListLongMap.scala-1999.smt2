; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34948 () Bool)

(assert start!34948)

(declare-fun b_free!7663 () Bool)

(declare-fun b_next!7663 () Bool)

(assert (=> start!34948 (= b_free!7663 (not b_next!7663))))

(declare-fun tp!26564 () Bool)

(declare-fun b_and!14891 () Bool)

(assert (=> start!34948 (= tp!26564 b_and!14891)))

(declare-fun b!349965 () Bool)

(declare-fun res!193947 () Bool)

(declare-fun e!214369 () Bool)

(assert (=> b!349965 (=> (not res!193947) (not e!214369))))

(declare-datatypes ((array!18815 0))(
  ( (array!18816 (arr!8914 (Array (_ BitVec 32) (_ BitVec 64))) (size!9266 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18815)

(declare-datatypes ((List!5183 0))(
  ( (Nil!5180) (Cons!5179 (h!6035 (_ BitVec 64)) (t!10319 List!5183)) )
))
(declare-fun arrayNoDuplicates!0 (array!18815 (_ BitVec 32) List!5183) Bool)

(assert (=> b!349965 (= res!193947 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5180))))

(declare-fun b!349966 () Bool)

(declare-fun res!193953 () Bool)

(assert (=> b!349966 (=> (not res!193953) (not e!214369))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11131 0))(
  ( (V!11132 (val!3852 Int)) )
))
(declare-fun zeroValue!1467 () V!11131)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3464 0))(
  ( (ValueCellFull!3464 (v!6038 V!11131)) (EmptyCell!3464) )
))
(declare-datatypes ((array!18817 0))(
  ( (array!18818 (arr!8915 (Array (_ BitVec 32) ValueCell!3464)) (size!9267 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18817)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11131)

(declare-datatypes ((tuple2!5562 0))(
  ( (tuple2!5563 (_1!2792 (_ BitVec 64)) (_2!2792 V!11131)) )
))
(declare-datatypes ((List!5184 0))(
  ( (Nil!5181) (Cons!5180 (h!6036 tuple2!5562) (t!10320 List!5184)) )
))
(declare-datatypes ((ListLongMap!4475 0))(
  ( (ListLongMap!4476 (toList!2253 List!5184)) )
))
(declare-fun contains!2321 (ListLongMap!4475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1774 (array!18815 array!18817 (_ BitVec 32) (_ BitVec 32) V!11131 V!11131 (_ BitVec 32) Int) ListLongMap!4475)

(assert (=> b!349966 (= res!193953 (not (contains!2321 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!349967 () Bool)

(declare-fun e!214372 () Bool)

(declare-fun tp_is_empty!7615 () Bool)

(assert (=> b!349967 (= e!214372 tp_is_empty!7615)))

(declare-fun b!349968 () Bool)

(declare-fun res!193948 () Bool)

(assert (=> b!349968 (=> (not res!193948) (not e!214369))))

(assert (=> b!349968 (= res!193948 (and (= (size!9267 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9266 _keys!1895) (size!9267 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349969 () Bool)

(declare-fun res!193949 () Bool)

(assert (=> b!349969 (=> (not res!193949) (not e!214369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18815 (_ BitVec 32)) Bool)

(assert (=> b!349969 (= res!193949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349971 () Bool)

(declare-fun e!214371 () Bool)

(assert (=> b!349971 (= e!214369 e!214371)))

(declare-fun res!193951 () Bool)

(assert (=> b!349971 (=> (not res!193951) (not e!214371))))

(declare-datatypes ((SeekEntryResult!3434 0))(
  ( (MissingZero!3434 (index!15915 (_ BitVec 32))) (Found!3434 (index!15916 (_ BitVec 32))) (Intermediate!3434 (undefined!4246 Bool) (index!15917 (_ BitVec 32)) (x!34848 (_ BitVec 32))) (Undefined!3434) (MissingVacant!3434 (index!15918 (_ BitVec 32))) )
))
(declare-fun lt!164408 () SeekEntryResult!3434)

(assert (=> b!349971 (= res!193951 (and (not (is-Found!3434 lt!164408)) (is-MissingZero!3434 lt!164408)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18815 (_ BitVec 32)) SeekEntryResult!3434)

(assert (=> b!349971 (= lt!164408 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!349972 () Bool)

(declare-datatypes ((Unit!10840 0))(
  ( (Unit!10841) )
))
(declare-fun e!214374 () Unit!10840)

(declare-fun Unit!10842 () Unit!10840)

(assert (=> b!349972 (= e!214374 Unit!10842)))

(declare-fun lt!164409 () Unit!10840)

(declare-fun lemmaArrayContainsKeyThenInListMap!322 (array!18815 array!18817 (_ BitVec 32) (_ BitVec 32) V!11131 V!11131 (_ BitVec 64) (_ BitVec 32) Int) Unit!10840)

(declare-fun arrayScanForKey!0 (array!18815 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349972 (= lt!164409 (lemmaArrayContainsKeyThenInListMap!322 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349972 false))

(declare-fun b!349973 () Bool)

(declare-fun e!214375 () Bool)

(assert (=> b!349973 (= e!214375 tp_is_empty!7615)))

(declare-fun b!349974 () Bool)

(declare-fun e!214370 () Bool)

(declare-fun mapRes!12891 () Bool)

(assert (=> b!349974 (= e!214370 (and e!214372 mapRes!12891))))

(declare-fun condMapEmpty!12891 () Bool)

(declare-fun mapDefault!12891 () ValueCell!3464)

