; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36666 () Bool)

(assert start!36666)

(declare-fun b!365939 () Bool)

(declare-fun res!204627 () Bool)

(declare-fun e!224099 () Bool)

(assert (=> b!365939 (=> (not res!204627) (not e!224099))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!20931 0))(
  ( (array!20932 (arr!9937 (Array (_ BitVec 32) (_ BitVec 64))) (size!10289 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20931)

(assert (=> b!365939 (= res!204627 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10289 _keys!658))))))

(declare-fun mapNonEmpty!14289 () Bool)

(declare-fun mapRes!14289 () Bool)

(declare-fun tp!28365 () Bool)

(declare-fun e!224098 () Bool)

(assert (=> mapNonEmpty!14289 (= mapRes!14289 (and tp!28365 e!224098))))

(declare-fun mapKey!14289 () (_ BitVec 32))

(declare-datatypes ((V!12423 0))(
  ( (V!12424 (val!4289 Int)) )
))
(declare-datatypes ((ValueCell!3901 0))(
  ( (ValueCellFull!3901 (v!6485 V!12423)) (EmptyCell!3901) )
))
(declare-fun mapRest!14289 () (Array (_ BitVec 32) ValueCell!3901))

(declare-datatypes ((array!20933 0))(
  ( (array!20934 (arr!9938 (Array (_ BitVec 32) ValueCell!3901)) (size!10290 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20933)

(declare-fun mapValue!14289 () ValueCell!3901)

(assert (=> mapNonEmpty!14289 (= (arr!9938 _values!506) (store mapRest!14289 mapKey!14289 mapValue!14289))))

(declare-fun b!365940 () Bool)

(declare-fun res!204633 () Bool)

(assert (=> b!365940 (=> (not res!204633) (not e!224099))))

(declare-datatypes ((List!5538 0))(
  ( (Nil!5535) (Cons!5534 (h!6390 (_ BitVec 64)) (t!10688 List!5538)) )
))
(declare-fun arrayNoDuplicates!0 (array!20931 (_ BitVec 32) List!5538) Bool)

(assert (=> b!365940 (= res!204633 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5535))))

(declare-fun b!365941 () Bool)

(declare-fun res!204629 () Bool)

(assert (=> b!365941 (=> (not res!204629) (not e!224099))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20931 (_ BitVec 32)) Bool)

(assert (=> b!365941 (= res!204629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365942 () Bool)

(declare-fun e!224100 () Bool)

(declare-fun tp_is_empty!8489 () Bool)

(assert (=> b!365942 (= e!224100 tp_is_empty!8489)))

(declare-fun b!365943 () Bool)

(declare-fun res!204628 () Bool)

(assert (=> b!365943 (=> (not res!204628) (not e!224099))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365943 (= res!204628 (validKeyInArray!0 k!778))))

(declare-fun b!365944 () Bool)

(declare-fun res!204630 () Bool)

(assert (=> b!365944 (=> (not res!204630) (not e!224099))))

(declare-fun arrayContainsKey!0 (array!20931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365944 (= res!204630 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!365945 () Bool)

(declare-fun e!224096 () Bool)

(assert (=> b!365945 (= e!224096 (and e!224100 mapRes!14289))))

(declare-fun condMapEmpty!14289 () Bool)

(declare-fun mapDefault!14289 () ValueCell!3901)

