; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34034 () Bool)

(assert start!34034)

(declare-fun b_free!7139 () Bool)

(declare-fun b_next!7139 () Bool)

(assert (=> start!34034 (= b_free!7139 (not b_next!7139))))

(declare-fun tp!24938 () Bool)

(declare-fun b_and!14331 () Bool)

(assert (=> start!34034 (= tp!24938 b_and!14331)))

(declare-fun b!339153 () Bool)

(declare-fun e!208085 () Bool)

(declare-fun e!208079 () Bool)

(assert (=> b!339153 (= e!208085 e!208079)))

(declare-fun res!187348 () Bool)

(assert (=> b!339153 (=> (not res!187348) (not e!208079))))

(declare-fun lt!161071 () Bool)

(assert (=> b!339153 (= res!187348 (not lt!161071))))

(declare-datatypes ((Unit!10557 0))(
  ( (Unit!10558) )
))
(declare-fun lt!161070 () Unit!10557)

(declare-fun e!208084 () Unit!10557)

(assert (=> b!339153 (= lt!161070 e!208084)))

(declare-fun c!52509 () Bool)

(assert (=> b!339153 (= c!52509 lt!161071)))

(declare-datatypes ((array!17779 0))(
  ( (array!17780 (arr!8414 (Array (_ BitVec 32) (_ BitVec 64))) (size!8766 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17779)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339153 (= lt!161071 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!339154 () Bool)

(declare-fun Unit!10559 () Unit!10557)

(assert (=> b!339154 (= e!208084 Unit!10559)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10431 0))(
  ( (V!10432 (val!3590 Int)) )
))
(declare-fun zeroValue!1467 () V!10431)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3202 0))(
  ( (ValueCellFull!3202 (v!5758 V!10431)) (EmptyCell!3202) )
))
(declare-datatypes ((array!17781 0))(
  ( (array!17782 (arr!8415 (Array (_ BitVec 32) ValueCell!3202)) (size!8767 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17781)

(declare-fun lt!161069 () Unit!10557)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10431)

(declare-fun lemmaArrayContainsKeyThenInListMap!283 (array!17779 array!17781 (_ BitVec 32) (_ BitVec 32) V!10431 V!10431 (_ BitVec 64) (_ BitVec 32) Int) Unit!10557)

(declare-fun arrayScanForKey!0 (array!17779 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339154 (= lt!161069 (lemmaArrayContainsKeyThenInListMap!283 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339154 false))

(declare-fun b!339155 () Bool)

(declare-fun e!208086 () Bool)

(declare-fun tp_is_empty!7091 () Bool)

(assert (=> b!339155 (= e!208086 tp_is_empty!7091)))

(declare-fun b!339156 () Bool)

(declare-fun res!187350 () Bool)

(declare-fun e!208081 () Bool)

(assert (=> b!339156 (=> (not res!187350) (not e!208081))))

(assert (=> b!339156 (= res!187350 (and (= (size!8767 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8766 _keys!1895) (size!8767 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339157 () Bool)

(declare-fun res!187355 () Bool)

(assert (=> b!339157 (=> (not res!187355) (not e!208081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17779 (_ BitVec 32)) Bool)

(assert (=> b!339157 (= res!187355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339158 () Bool)

(declare-fun res!187351 () Bool)

(assert (=> b!339158 (=> (not res!187351) (not e!208081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339158 (= res!187351 (validKeyInArray!0 k!1348))))

(declare-fun b!339159 () Bool)

(declare-fun res!187347 () Bool)

(assert (=> b!339159 (=> (not res!187347) (not e!208081))))

(declare-datatypes ((List!4829 0))(
  ( (Nil!4826) (Cons!4825 (h!5681 (_ BitVec 64)) (t!9929 List!4829)) )
))
(declare-fun arrayNoDuplicates!0 (array!17779 (_ BitVec 32) List!4829) Bool)

(assert (=> b!339159 (= res!187347 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4826))))

(declare-fun b!339160 () Bool)

(declare-fun e!208080 () Bool)

(declare-fun mapRes!12051 () Bool)

(assert (=> b!339160 (= e!208080 (and e!208086 mapRes!12051))))

(declare-fun condMapEmpty!12051 () Bool)

(declare-fun mapDefault!12051 () ValueCell!3202)

