; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33738 () Bool)

(assert start!33738)

(declare-fun b_free!6973 () Bool)

(declare-fun b_next!6973 () Bool)

(assert (=> start!33738 (= b_free!6973 (not b_next!6973))))

(declare-fun tp!24422 () Bool)

(declare-fun b_and!14153 () Bool)

(assert (=> start!33738 (= tp!24422 b_and!14153)))

(declare-fun b!335559 () Bool)

(declare-fun e!205982 () Bool)

(declare-fun e!205980 () Bool)

(assert (=> b!335559 (= e!205982 e!205980)))

(declare-fun res!185192 () Bool)

(assert (=> b!335559 (=> (not res!185192) (not e!205980))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3191 0))(
  ( (MissingZero!3191 (index!14943 (_ BitVec 32))) (Found!3191 (index!14944 (_ BitVec 32))) (Intermediate!3191 (undefined!4003 Bool) (index!14945 (_ BitVec 32)) (x!33445 (_ BitVec 32))) (Undefined!3191) (MissingVacant!3191 (index!14946 (_ BitVec 32))) )
))
(declare-fun lt!159877 () SeekEntryResult!3191)

(declare-datatypes ((array!17443 0))(
  ( (array!17444 (arr!8252 (Array (_ BitVec 32) (_ BitVec 64))) (size!8604 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17443)

(assert (=> b!335559 (= res!185192 (and (is-Found!3191 lt!159877) (= (select (arr!8252 _keys!1895) (index!14944 lt!159877)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17443 (_ BitVec 32)) SeekEntryResult!3191)

(assert (=> b!335559 (= lt!159877 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335560 () Bool)

(declare-fun res!185191 () Bool)

(declare-fun e!205983 () Bool)

(assert (=> b!335560 (=> (not res!185191) (not e!205983))))

(declare-datatypes ((V!10211 0))(
  ( (V!10212 (val!3507 Int)) )
))
(declare-datatypes ((ValueCell!3119 0))(
  ( (ValueCellFull!3119 (v!5669 V!10211)) (EmptyCell!3119) )
))
(declare-datatypes ((array!17445 0))(
  ( (array!17446 (arr!8253 (Array (_ BitVec 32) ValueCell!3119)) (size!8605 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17445)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335560 (= res!185191 (and (= (size!8605 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8604 _keys!1895) (size!8605 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335561 () Bool)

(declare-fun res!185195 () Bool)

(assert (=> b!335561 (=> (not res!185195) (not e!205980))))

(declare-fun arrayContainsKey!0 (array!17443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335561 (= res!185195 (arrayContainsKey!0 _keys!1895 k!1348 (index!14944 lt!159877)))))

(declare-fun b!335562 () Bool)

(declare-fun res!185190 () Bool)

(assert (=> b!335562 (=> (not res!185190) (not e!205983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17443 (_ BitVec 32)) Bool)

(assert (=> b!335562 (= res!185190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11784 () Bool)

(declare-fun mapRes!11784 () Bool)

(declare-fun tp!24423 () Bool)

(declare-fun e!205986 () Bool)

(assert (=> mapNonEmpty!11784 (= mapRes!11784 (and tp!24423 e!205986))))

(declare-fun mapRest!11784 () (Array (_ BitVec 32) ValueCell!3119))

(declare-fun mapValue!11784 () ValueCell!3119)

(declare-fun mapKey!11784 () (_ BitVec 32))

(assert (=> mapNonEmpty!11784 (= (arr!8253 _values!1525) (store mapRest!11784 mapKey!11784 mapValue!11784))))

(declare-fun b!335563 () Bool)

(assert (=> b!335563 (= e!205983 e!205982)))

(declare-fun res!185194 () Bool)

(assert (=> b!335563 (=> (not res!185194) (not e!205982))))

(declare-datatypes ((tuple2!5096 0))(
  ( (tuple2!5097 (_1!2559 (_ BitVec 64)) (_2!2559 V!10211)) )
))
(declare-datatypes ((List!4715 0))(
  ( (Nil!4712) (Cons!4711 (h!5567 tuple2!5096) (t!9803 List!4715)) )
))
(declare-datatypes ((ListLongMap!4009 0))(
  ( (ListLongMap!4010 (toList!2020 List!4715)) )
))
(declare-fun lt!159875 () ListLongMap!4009)

(declare-fun contains!2064 (ListLongMap!4009 (_ BitVec 64)) Bool)

(assert (=> b!335563 (= res!185194 (not (contains!2064 lt!159875 k!1348)))))

(declare-fun zeroValue!1467 () V!10211)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10211)

(declare-fun getCurrentListMap!1543 (array!17443 array!17445 (_ BitVec 32) (_ BitVec 32) V!10211 V!10211 (_ BitVec 32) Int) ListLongMap!4009)

(assert (=> b!335563 (= lt!159875 (getCurrentListMap!1543 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335564 () Bool)

(declare-fun res!185189 () Bool)

(assert (=> b!335564 (=> (not res!185189) (not e!205983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335564 (= res!185189 (validKeyInArray!0 k!1348))))

(declare-fun b!335565 () Bool)

(declare-fun e!205981 () Bool)

(declare-fun e!205985 () Bool)

(assert (=> b!335565 (= e!205981 (and e!205985 mapRes!11784))))

(declare-fun condMapEmpty!11784 () Bool)

(declare-fun mapDefault!11784 () ValueCell!3119)

