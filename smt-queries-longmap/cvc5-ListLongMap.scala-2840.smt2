; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41004 () Bool)

(assert start!41004)

(declare-fun b_free!10939 () Bool)

(declare-fun b_next!10939 () Bool)

(assert (=> start!41004 (= b_free!10939 (not b_next!10939))))

(declare-fun tp!38644 () Bool)

(declare-fun b_and!19081 () Bool)

(assert (=> start!41004 (= tp!38644 b_and!19081)))

(declare-fun b!456792 () Bool)

(declare-fun res!272661 () Bool)

(declare-fun e!266845 () Bool)

(assert (=> b!456792 (=> (not res!272661) (not e!266845))))

(declare-datatypes ((array!28355 0))(
  ( (array!28356 (arr!13621 (Array (_ BitVec 32) (_ BitVec 64))) (size!13973 (_ BitVec 32))) )
))
(declare-fun lt!206657 () array!28355)

(declare-datatypes ((List!8218 0))(
  ( (Nil!8215) (Cons!8214 (h!9070 (_ BitVec 64)) (t!14046 List!8218)) )
))
(declare-fun arrayNoDuplicates!0 (array!28355 (_ BitVec 32) List!8218) Bool)

(assert (=> b!456792 (= res!272661 (arrayNoDuplicates!0 lt!206657 #b00000000000000000000000000000000 Nil!8215))))

(declare-fun mapNonEmpty!20056 () Bool)

(declare-fun mapRes!20056 () Bool)

(declare-fun tp!38643 () Bool)

(declare-fun e!266848 () Bool)

(assert (=> mapNonEmpty!20056 (= mapRes!20056 (and tp!38643 e!266848))))

(declare-fun mapKey!20056 () (_ BitVec 32))

(declare-datatypes ((V!17475 0))(
  ( (V!17476 (val!6183 Int)) )
))
(declare-datatypes ((ValueCell!5795 0))(
  ( (ValueCellFull!5795 (v!8449 V!17475)) (EmptyCell!5795) )
))
(declare-fun mapValue!20056 () ValueCell!5795)

(declare-datatypes ((array!28357 0))(
  ( (array!28358 (arr!13622 (Array (_ BitVec 32) ValueCell!5795)) (size!13974 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28357)

(declare-fun mapRest!20056 () (Array (_ BitVec 32) ValueCell!5795))

(assert (=> mapNonEmpty!20056 (= (arr!13622 _values!549) (store mapRest!20056 mapKey!20056 mapValue!20056))))

(declare-fun b!456793 () Bool)

(declare-fun res!272662 () Bool)

(declare-fun e!266846 () Bool)

(assert (=> b!456793 (=> (not res!272662) (not e!266846))))

(declare-fun _keys!709 () array!28355)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456793 (= res!272662 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20056 () Bool)

(assert (=> mapIsEmpty!20056 mapRes!20056))

(declare-fun b!456794 () Bool)

(declare-fun res!272665 () Bool)

(assert (=> b!456794 (=> (not res!272665) (not e!266846))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456794 (= res!272665 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13973 _keys!709))))))

(declare-fun b!456795 () Bool)

(declare-fun tp_is_empty!12277 () Bool)

(assert (=> b!456795 (= e!266848 tp_is_empty!12277)))

(declare-fun b!456796 () Bool)

(declare-fun res!272660 () Bool)

(assert (=> b!456796 (=> (not res!272660) (not e!266846))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456796 (= res!272660 (validMask!0 mask!1025))))

(declare-fun b!456797 () Bool)

(declare-fun res!272667 () Bool)

(assert (=> b!456797 (=> (not res!272667) (not e!266846))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!456797 (= res!272667 (and (= (size!13974 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13973 _keys!709) (size!13974 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456798 () Bool)

(declare-fun e!266844 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!456798 (= e!266844 (bvslt from!863 (size!13973 _keys!709)))))

(declare-fun b!456800 () Bool)

(declare-fun res!272656 () Bool)

(assert (=> b!456800 (=> (not res!272656) (not e!266846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456800 (= res!272656 (validKeyInArray!0 k!794))))

(declare-fun b!456801 () Bool)

(declare-fun res!272664 () Bool)

(assert (=> b!456801 (=> (not res!272664) (not e!266846))))

(assert (=> b!456801 (= res!272664 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8215))))

(declare-fun b!456802 () Bool)

(declare-fun res!272659 () Bool)

(assert (=> b!456802 (=> (not res!272659) (not e!266845))))

(assert (=> b!456802 (= res!272659 (bvsle from!863 i!563))))

(declare-fun b!456803 () Bool)

(declare-fun e!266847 () Bool)

(declare-fun e!266849 () Bool)

(assert (=> b!456803 (= e!266847 (and e!266849 mapRes!20056))))

(declare-fun condMapEmpty!20056 () Bool)

(declare-fun mapDefault!20056 () ValueCell!5795)

