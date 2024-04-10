; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33466 () Bool)

(assert start!33466)

(declare-fun b!332181 () Bool)

(declare-fun res!183004 () Bool)

(declare-fun e!203927 () Bool)

(assert (=> b!332181 (=> (not res!183004) (not e!203927))))

(declare-datatypes ((array!17033 0))(
  ( (array!17034 (arr!8051 (Array (_ BitVec 32) (_ BitVec 64))) (size!8403 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17033)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17033 (_ BitVec 32)) Bool)

(assert (=> b!332181 (= res!183004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332182 () Bool)

(declare-fun e!203931 () Bool)

(declare-fun tp_is_empty!6719 () Bool)

(assert (=> b!332182 (= e!203931 tp_is_empty!6719)))

(declare-fun mapIsEmpty!11463 () Bool)

(declare-fun mapRes!11463 () Bool)

(assert (=> mapIsEmpty!11463 mapRes!11463))

(declare-fun b!332183 () Bool)

(declare-fun res!183003 () Bool)

(assert (=> b!332183 (=> (not res!183003) (not e!203927))))

(declare-datatypes ((V!9935 0))(
  ( (V!9936 (val!3404 Int)) )
))
(declare-datatypes ((ValueCell!3016 0))(
  ( (ValueCellFull!3016 (v!5563 V!9935)) (EmptyCell!3016) )
))
(declare-datatypes ((array!17035 0))(
  ( (array!17036 (arr!8052 (Array (_ BitVec 32) ValueCell!3016)) (size!8404 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17035)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332183 (= res!183003 (and (= (size!8404 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8403 _keys!1895) (size!8404 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332184 () Bool)

(declare-fun e!203928 () Bool)

(assert (=> b!332184 (= e!203928 tp_is_empty!6719)))

(declare-fun b!332185 () Bool)

(assert (=> b!332185 (= e!203927 false)))

(declare-fun lt!158974 () Bool)

(declare-datatypes ((List!4584 0))(
  ( (Nil!4581) (Cons!4580 (h!5436 (_ BitVec 64)) (t!9666 List!4584)) )
))
(declare-fun arrayNoDuplicates!0 (array!17033 (_ BitVec 32) List!4584) Bool)

(assert (=> b!332185 (= lt!158974 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4581))))

(declare-fun b!332186 () Bool)

(declare-fun e!203930 () Bool)

(assert (=> b!332186 (= e!203930 (and e!203931 mapRes!11463))))

(declare-fun condMapEmpty!11463 () Bool)

(declare-fun mapDefault!11463 () ValueCell!3016)

