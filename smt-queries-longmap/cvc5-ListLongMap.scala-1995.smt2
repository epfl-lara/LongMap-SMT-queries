; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34876 () Bool)

(assert start!34876)

(declare-fun b_free!7639 () Bool)

(declare-fun b_next!7639 () Bool)

(assert (=> start!34876 (= b_free!7639 (not b_next!7639))))

(declare-fun tp!26487 () Bool)

(declare-fun b_and!14863 () Bool)

(assert (=> start!34876 (= tp!26487 b_and!14863)))

(declare-fun b!349244 () Bool)

(declare-fun res!193554 () Bool)

(declare-fun e!213937 () Bool)

(assert (=> b!349244 (=> (not res!193554) (not e!213937))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11099 0))(
  ( (V!11100 (val!3840 Int)) )
))
(declare-datatypes ((ValueCell!3452 0))(
  ( (ValueCellFull!3452 (v!6024 V!11099)) (EmptyCell!3452) )
))
(declare-datatypes ((array!18767 0))(
  ( (array!18768 (arr!8892 (Array (_ BitVec 32) ValueCell!3452)) (size!9244 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18767)

(declare-datatypes ((array!18769 0))(
  ( (array!18770 (arr!8893 (Array (_ BitVec 32) (_ BitVec 64))) (size!9245 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18769)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!349244 (= res!193554 (and (= (size!9244 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9245 _keys!1895) (size!9244 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12849 () Bool)

(declare-fun mapRes!12849 () Bool)

(assert (=> mapIsEmpty!12849 mapRes!12849))

(declare-fun b!349245 () Bool)

(declare-fun res!193555 () Bool)

(assert (=> b!349245 (=> (not res!193555) (not e!213937))))

(declare-datatypes ((List!5167 0))(
  ( (Nil!5164) (Cons!5163 (h!6019 (_ BitVec 64)) (t!10299 List!5167)) )
))
(declare-fun arrayNoDuplicates!0 (array!18769 (_ BitVec 32) List!5167) Bool)

(assert (=> b!349245 (= res!193555 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5164))))

(declare-fun b!349246 () Bool)

(declare-fun res!193551 () Bool)

(declare-fun e!213940 () Bool)

(assert (=> b!349246 (=> (not res!193551) (not e!213940))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349246 (= res!193551 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!349247 () Bool)

(declare-fun e!213941 () Bool)

(declare-fun e!213936 () Bool)

(assert (=> b!349247 (= e!213941 (and e!213936 mapRes!12849))))

(declare-fun condMapEmpty!12849 () Bool)

(declare-fun mapDefault!12849 () ValueCell!3452)

