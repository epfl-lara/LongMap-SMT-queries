; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40948 () Bool)

(assert start!40948)

(declare-fun b_free!10883 () Bool)

(declare-fun b_next!10883 () Bool)

(assert (=> start!40948 (= b_free!10883 (not b_next!10883))))

(declare-fun tp!38475 () Bool)

(declare-fun b_and!19025 () Bool)

(assert (=> start!40948 (= tp!38475 b_and!19025)))

(declare-fun b!455492 () Bool)

(declare-fun res!271614 () Bool)

(declare-fun e!266300 () Bool)

(assert (=> b!455492 (=> (not res!271614) (not e!266300))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455492 (= res!271614 (validMask!0 mask!1025))))

(declare-fun b!455493 () Bool)

(declare-fun res!271611 () Bool)

(declare-fun e!266304 () Bool)

(assert (=> b!455493 (=> (not res!271611) (not e!266304))))

(declare-datatypes ((array!28245 0))(
  ( (array!28246 (arr!13566 (Array (_ BitVec 32) (_ BitVec 64))) (size!13918 (_ BitVec 32))) )
))
(declare-fun lt!206348 () array!28245)

(declare-datatypes ((List!8177 0))(
  ( (Nil!8174) (Cons!8173 (h!9029 (_ BitVec 64)) (t!14005 List!8177)) )
))
(declare-fun arrayNoDuplicates!0 (array!28245 (_ BitVec 32) List!8177) Bool)

(assert (=> b!455493 (= res!271611 (arrayNoDuplicates!0 lt!206348 #b00000000000000000000000000000000 Nil!8174))))

(declare-fun b!455494 () Bool)

(declare-fun e!266303 () Bool)

(declare-fun tp_is_empty!12221 () Bool)

(assert (=> b!455494 (= e!266303 tp_is_empty!12221)))

(declare-fun res!271610 () Bool)

(assert (=> start!40948 (=> (not res!271610) (not e!266300))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!28245)

(assert (=> start!40948 (= res!271610 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13918 _keys!709))))))

(assert (=> start!40948 e!266300))

(assert (=> start!40948 tp_is_empty!12221))

(assert (=> start!40948 tp!38475))

(assert (=> start!40948 true))

(declare-datatypes ((V!17399 0))(
  ( (V!17400 (val!6155 Int)) )
))
(declare-datatypes ((ValueCell!5767 0))(
  ( (ValueCellFull!5767 (v!8421 V!17399)) (EmptyCell!5767) )
))
(declare-datatypes ((array!28247 0))(
  ( (array!28248 (arr!13567 (Array (_ BitVec 32) ValueCell!5767)) (size!13919 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28247)

(declare-fun e!266302 () Bool)

(declare-fun array_inv!9828 (array!28247) Bool)

(assert (=> start!40948 (and (array_inv!9828 _values!549) e!266302)))

(declare-fun array_inv!9829 (array!28245) Bool)

(assert (=> start!40948 (array_inv!9829 _keys!709)))

(declare-fun b!455495 () Bool)

(declare-fun res!271613 () Bool)

(assert (=> b!455495 (=> (not res!271613) (not e!266300))))

(assert (=> b!455495 (= res!271613 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8174))))

(declare-fun b!455496 () Bool)

(declare-fun res!271609 () Bool)

(assert (=> b!455496 (=> (not res!271609) (not e!266300))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455496 (= res!271609 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!455497 () Bool)

(declare-fun res!271619 () Bool)

(assert (=> b!455497 (=> (not res!271619) (not e!266300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28245 (_ BitVec 32)) Bool)

(assert (=> b!455497 (= res!271619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19972 () Bool)

(declare-fun mapRes!19972 () Bool)

(declare-fun tp!38476 () Bool)

(declare-fun e!266305 () Bool)

(assert (=> mapNonEmpty!19972 (= mapRes!19972 (and tp!38476 e!266305))))

(declare-fun mapKey!19972 () (_ BitVec 32))

(declare-fun mapRest!19972 () (Array (_ BitVec 32) ValueCell!5767))

(declare-fun mapValue!19972 () ValueCell!5767)

(assert (=> mapNonEmpty!19972 (= (arr!13567 _values!549) (store mapRest!19972 mapKey!19972 mapValue!19972))))

(declare-fun b!455498 () Bool)

(declare-fun res!271616 () Bool)

(assert (=> b!455498 (=> (not res!271616) (not e!266300))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455498 (= res!271616 (or (= (select (arr!13566 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13566 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455499 () Bool)

(declare-fun res!271612 () Bool)

(assert (=> b!455499 (=> (not res!271612) (not e!266300))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!455499 (= res!271612 (and (= (size!13919 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13918 _keys!709) (size!13919 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19972 () Bool)

(assert (=> mapIsEmpty!19972 mapRes!19972))

(declare-fun b!455500 () Bool)

(declare-fun res!271617 () Bool)

(assert (=> b!455500 (=> (not res!271617) (not e!266300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455500 (= res!271617 (validKeyInArray!0 k!794))))

(declare-fun b!455501 () Bool)

(declare-fun res!271608 () Bool)

(assert (=> b!455501 (=> (not res!271608) (not e!266300))))

(assert (=> b!455501 (= res!271608 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13918 _keys!709))))))

(declare-fun b!455502 () Bool)

(declare-fun res!271615 () Bool)

(assert (=> b!455502 (=> (not res!271615) (not e!266304))))

(assert (=> b!455502 (= res!271615 (bvsle from!863 i!563))))

(declare-fun b!455503 () Bool)

(assert (=> b!455503 (= e!266302 (and e!266303 mapRes!19972))))

(declare-fun condMapEmpty!19972 () Bool)

(declare-fun mapDefault!19972 () ValueCell!5767)

