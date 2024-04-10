; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34848 () Bool)

(assert start!34848)

(declare-fun b_free!7633 () Bool)

(declare-fun b_next!7633 () Bool)

(assert (=> start!34848 (= b_free!7633 (not b_next!7633))))

(declare-fun tp!26466 () Bool)

(declare-fun b_and!14855 () Bool)

(assert (=> start!34848 (= tp!26466 b_and!14855)))

(declare-fun b!349004 () Bool)

(declare-fun res!193428 () Bool)

(declare-fun e!213792 () Bool)

(assert (=> b!349004 (=> (not res!193428) (not e!213792))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11091 0))(
  ( (V!11092 (val!3837 Int)) )
))
(declare-fun zeroValue!1467 () V!11091)

(declare-datatypes ((ValueCell!3449 0))(
  ( (ValueCellFull!3449 (v!6020 V!11091)) (EmptyCell!3449) )
))
(declare-datatypes ((array!18755 0))(
  ( (array!18756 (arr!8887 (Array (_ BitVec 32) ValueCell!3449)) (size!9239 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18755)

(declare-datatypes ((array!18757 0))(
  ( (array!18758 (arr!8888 (Array (_ BitVec 32) (_ BitVec 64))) (size!9240 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18757)

(declare-fun minValue!1467 () V!11091)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5542 0))(
  ( (tuple2!5543 (_1!2782 (_ BitVec 64)) (_2!2782 V!11091)) )
))
(declare-datatypes ((List!5164 0))(
  ( (Nil!5161) (Cons!5160 (h!6016 tuple2!5542) (t!10294 List!5164)) )
))
(declare-datatypes ((ListLongMap!4455 0))(
  ( (ListLongMap!4456 (toList!2243 List!5164)) )
))
(declare-fun contains!2308 (ListLongMap!4455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1764 (array!18757 array!18755 (_ BitVec 32) (_ BitVec 32) V!11091 V!11091 (_ BitVec 32) Int) ListLongMap!4455)

(assert (=> b!349004 (= res!193428 (not (contains!2308 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!349005 () Bool)

(declare-fun res!193427 () Bool)

(assert (=> b!349005 (=> (not res!193427) (not e!213792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349005 (= res!193427 (validKeyInArray!0 k!1348))))

(declare-fun b!349007 () Bool)

(declare-fun e!213790 () Bool)

(declare-fun e!213789 () Bool)

(declare-fun mapRes!12837 () Bool)

(assert (=> b!349007 (= e!213790 (and e!213789 mapRes!12837))))

(declare-fun condMapEmpty!12837 () Bool)

(declare-fun mapDefault!12837 () ValueCell!3449)

