; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33700 () Bool)

(assert start!33700)

(declare-fun b_free!6935 () Bool)

(declare-fun b_next!6935 () Bool)

(assert (=> start!33700 (= b_free!6935 (not b_next!6935))))

(declare-fun tp!24308 () Bool)

(declare-fun b_and!14115 () Bool)

(assert (=> start!33700 (= tp!24308 b_and!14115)))

(declare-fun mapNonEmpty!11727 () Bool)

(declare-fun mapRes!11727 () Bool)

(declare-fun tp!24309 () Bool)

(declare-fun e!205583 () Bool)

(assert (=> mapNonEmpty!11727 (= mapRes!11727 (and tp!24309 e!205583))))

(declare-datatypes ((V!10159 0))(
  ( (V!10160 (val!3488 Int)) )
))
(declare-datatypes ((ValueCell!3100 0))(
  ( (ValueCellFull!3100 (v!5650 V!10159)) (EmptyCell!3100) )
))
(declare-fun mapValue!11727 () ValueCell!3100)

(declare-datatypes ((array!17367 0))(
  ( (array!17368 (arr!8214 (Array (_ BitVec 32) ValueCell!3100)) (size!8566 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17367)

(declare-fun mapKey!11727 () (_ BitVec 32))

(declare-fun mapRest!11727 () (Array (_ BitVec 32) ValueCell!3100))

(assert (=> mapNonEmpty!11727 (= (arr!8214 _values!1525) (store mapRest!11727 mapKey!11727 mapValue!11727))))

(declare-fun b!334932 () Bool)

(declare-fun e!205581 () Bool)

(declare-fun tp_is_empty!6887 () Bool)

(assert (=> b!334932 (= e!205581 tp_is_empty!6887)))

(declare-fun mapIsEmpty!11727 () Bool)

(assert (=> mapIsEmpty!11727 mapRes!11727))

(declare-fun b!334934 () Bool)

(declare-fun res!184739 () Bool)

(declare-fun e!205584 () Bool)

(assert (=> b!334934 (=> (not res!184739) (not e!205584))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17369 0))(
  ( (array!17370 (arr!8215 (Array (_ BitVec 32) (_ BitVec 64))) (size!8567 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17369)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334934 (= res!184739 (and (= (size!8566 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8567 _keys!1895) (size!8566 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334935 () Bool)

(assert (=> b!334935 (= e!205583 tp_is_empty!6887)))

(declare-fun b!334936 () Bool)

(declare-fun res!184737 () Bool)

(assert (=> b!334936 (=> (not res!184737) (not e!205584))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334936 (= res!184737 (validKeyInArray!0 k!1348))))

(declare-fun b!334937 () Bool)

(declare-fun res!184733 () Bool)

(assert (=> b!334937 (=> (not res!184733) (not e!205584))))

(declare-datatypes ((List!4686 0))(
  ( (Nil!4683) (Cons!4682 (h!5538 (_ BitVec 64)) (t!9774 List!4686)) )
))
(declare-fun arrayNoDuplicates!0 (array!17369 (_ BitVec 32) List!4686) Bool)

(assert (=> b!334937 (= res!184733 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4683))))

(declare-fun b!334938 () Bool)

(declare-fun res!184734 () Bool)

(declare-fun e!205585 () Bool)

(assert (=> b!334938 (=> (not res!184734) (not e!205585))))

(declare-datatypes ((SeekEntryResult!3174 0))(
  ( (MissingZero!3174 (index!14875 (_ BitVec 32))) (Found!3174 (index!14876 (_ BitVec 32))) (Intermediate!3174 (undefined!3986 Bool) (index!14877 (_ BitVec 32)) (x!33372 (_ BitVec 32))) (Undefined!3174) (MissingVacant!3174 (index!14878 (_ BitVec 32))) )
))
(declare-fun lt!159648 () SeekEntryResult!3174)

(declare-fun arrayContainsKey!0 (array!17369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334938 (= res!184734 (arrayContainsKey!0 _keys!1895 k!1348 (index!14876 lt!159648)))))

(declare-fun b!334939 () Bool)

(declare-fun e!205586 () Bool)

(assert (=> b!334939 (= e!205584 e!205586)))

(declare-fun res!184736 () Bool)

(assert (=> b!334939 (=> (not res!184736) (not e!205586))))

(declare-datatypes ((tuple2!5062 0))(
  ( (tuple2!5063 (_1!2542 (_ BitVec 64)) (_2!2542 V!10159)) )
))
(declare-datatypes ((List!4687 0))(
  ( (Nil!4684) (Cons!4683 (h!5539 tuple2!5062) (t!9775 List!4687)) )
))
(declare-datatypes ((ListLongMap!3975 0))(
  ( (ListLongMap!3976 (toList!2003 List!4687)) )
))
(declare-fun lt!159649 () ListLongMap!3975)

(declare-fun contains!2047 (ListLongMap!3975 (_ BitVec 64)) Bool)

(assert (=> b!334939 (= res!184736 (not (contains!2047 lt!159649 k!1348)))))

(declare-fun zeroValue!1467 () V!10159)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10159)

(declare-fun getCurrentListMap!1531 (array!17369 array!17367 (_ BitVec 32) (_ BitVec 32) V!10159 V!10159 (_ BitVec 32) Int) ListLongMap!3975)

(assert (=> b!334939 (= lt!159649 (getCurrentListMap!1531 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334940 () Bool)

(assert (=> b!334940 (= e!205586 e!205585)))

(declare-fun res!184735 () Bool)

(assert (=> b!334940 (=> (not res!184735) (not e!205585))))

(assert (=> b!334940 (= res!184735 (and (is-Found!3174 lt!159648) (= (select (arr!8215 _keys!1895) (index!14876 lt!159648)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17369 (_ BitVec 32)) SeekEntryResult!3174)

(assert (=> b!334940 (= lt!159648 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334941 () Bool)

(declare-fun e!205587 () Bool)

(assert (=> b!334941 (= e!205587 (and e!205581 mapRes!11727))))

(declare-fun condMapEmpty!11727 () Bool)

(declare-fun mapDefault!11727 () ValueCell!3100)

