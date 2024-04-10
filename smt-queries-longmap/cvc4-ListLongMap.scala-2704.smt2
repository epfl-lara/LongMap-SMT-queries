; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40046 () Bool)

(assert start!40046)

(declare-fun b_free!10313 () Bool)

(declare-fun b_next!10313 () Bool)

(assert (=> start!40046 (= b_free!10313 (not b_next!10313))))

(declare-fun tp!36467 () Bool)

(declare-fun b_and!18281 () Bool)

(assert (=> start!40046 (= tp!36467 b_and!18281)))

(declare-fun b!436868 () Bool)

(declare-fun res!257605 () Bool)

(declare-fun e!257932 () Bool)

(assert (=> b!436868 (=> (not res!257605) (not e!257932))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436868 (= res!257605 (validKeyInArray!0 k!794))))

(declare-fun b!436869 () Bool)

(declare-fun res!257596 () Bool)

(assert (=> b!436869 (=> (not res!257596) (not e!257932))))

(declare-datatypes ((array!26753 0))(
  ( (array!26754 (arr!12826 (Array (_ BitVec 32) (_ BitVec 64))) (size!13178 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26753)

(declare-fun arrayContainsKey!0 (array!26753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436869 (= res!257596 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18819 () Bool)

(declare-fun mapRes!18819 () Bool)

(assert (=> mapIsEmpty!18819 mapRes!18819))

(declare-fun b!436870 () Bool)

(declare-fun res!257600 () Bool)

(assert (=> b!436870 (=> (not res!257600) (not e!257932))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436870 (= res!257600 (or (= (select (arr!12826 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12826 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436871 () Bool)

(declare-fun res!257602 () Bool)

(assert (=> b!436871 (=> (not res!257602) (not e!257932))))

(assert (=> b!436871 (= res!257602 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13178 _keys!709))))))

(declare-fun b!436872 () Bool)

(declare-fun res!257595 () Bool)

(declare-fun e!257933 () Bool)

(assert (=> b!436872 (=> (not res!257595) (not e!257933))))

(declare-fun lt!201468 () array!26753)

(declare-datatypes ((List!7656 0))(
  ( (Nil!7653) (Cons!7652 (h!8508 (_ BitVec 64)) (t!13412 List!7656)) )
))
(declare-fun arrayNoDuplicates!0 (array!26753 (_ BitVec 32) List!7656) Bool)

(assert (=> b!436872 (= res!257595 (arrayNoDuplicates!0 lt!201468 #b00000000000000000000000000000000 Nil!7653))))

(declare-fun mapNonEmpty!18819 () Bool)

(declare-fun tp!36468 () Bool)

(declare-fun e!257928 () Bool)

(assert (=> mapNonEmpty!18819 (= mapRes!18819 (and tp!36468 e!257928))))

(declare-datatypes ((V!16391 0))(
  ( (V!16392 (val!5777 Int)) )
))
(declare-datatypes ((ValueCell!5389 0))(
  ( (ValueCellFull!5389 (v!8024 V!16391)) (EmptyCell!5389) )
))
(declare-fun mapValue!18819 () ValueCell!5389)

(declare-fun mapKey!18819 () (_ BitVec 32))

(declare-datatypes ((array!26755 0))(
  ( (array!26756 (arr!12827 (Array (_ BitVec 32) ValueCell!5389)) (size!13179 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26755)

(declare-fun mapRest!18819 () (Array (_ BitVec 32) ValueCell!5389))

(assert (=> mapNonEmpty!18819 (= (arr!12827 _values!549) (store mapRest!18819 mapKey!18819 mapValue!18819))))

(declare-fun res!257606 () Bool)

(assert (=> start!40046 (=> (not res!257606) (not e!257932))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40046 (= res!257606 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13178 _keys!709))))))

(assert (=> start!40046 e!257932))

(declare-fun tp_is_empty!11465 () Bool)

(assert (=> start!40046 tp_is_empty!11465))

(assert (=> start!40046 tp!36467))

(assert (=> start!40046 true))

(declare-fun e!257929 () Bool)

(declare-fun array_inv!9318 (array!26755) Bool)

(assert (=> start!40046 (and (array_inv!9318 _values!549) e!257929)))

(declare-fun array_inv!9319 (array!26753) Bool)

(assert (=> start!40046 (array_inv!9319 _keys!709)))

(declare-fun b!436873 () Bool)

(declare-fun e!257934 () Bool)

(assert (=> b!436873 (= e!257929 (and e!257934 mapRes!18819))))

(declare-fun condMapEmpty!18819 () Bool)

(declare-fun mapDefault!18819 () ValueCell!5389)

