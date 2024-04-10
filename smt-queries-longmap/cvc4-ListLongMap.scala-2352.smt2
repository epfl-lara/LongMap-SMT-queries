; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37578 () Bool)

(assert start!37578)

(declare-fun b_free!8705 () Bool)

(declare-fun b_next!8705 () Bool)

(assert (=> start!37578 (= b_free!8705 (not b_next!8705))))

(declare-fun tp!30831 () Bool)

(declare-fun b_and!15947 () Bool)

(assert (=> start!37578 (= tp!30831 b_and!15947)))

(declare-fun b!384082 () Bool)

(declare-fun res!218818 () Bool)

(declare-fun e!233225 () Bool)

(assert (=> b!384082 (=> (not res!218818) (not e!233225))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13575 0))(
  ( (V!13576 (val!4721 Int)) )
))
(declare-datatypes ((ValueCell!4333 0))(
  ( (ValueCellFull!4333 (v!6918 V!13575)) (EmptyCell!4333) )
))
(declare-datatypes ((array!22611 0))(
  ( (array!22612 (arr!10774 (Array (_ BitVec 32) ValueCell!4333)) (size!11126 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22611)

(declare-datatypes ((array!22613 0))(
  ( (array!22614 (arr!10775 (Array (_ BitVec 32) (_ BitVec 64))) (size!11127 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22613)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!384082 (= res!218818 (and (= (size!11126 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11127 _keys!658) (size!11126 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384083 () Bool)

(declare-fun res!218815 () Bool)

(assert (=> b!384083 (=> (not res!218815) (not e!233225))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384083 (= res!218815 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!384084 () Bool)

(declare-fun res!218816 () Bool)

(assert (=> b!384084 (=> (not res!218816) (not e!233225))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384084 (= res!218816 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11127 _keys!658))))))

(declare-fun b!384085 () Bool)

(declare-fun res!218824 () Bool)

(assert (=> b!384085 (=> (not res!218824) (not e!233225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22613 (_ BitVec 32)) Bool)

(assert (=> b!384085 (= res!218824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15594 () Bool)

(declare-fun mapRes!15594 () Bool)

(assert (=> mapIsEmpty!15594 mapRes!15594))

(declare-fun b!384086 () Bool)

(declare-fun res!218821 () Bool)

(assert (=> b!384086 (=> (not res!218821) (not e!233225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384086 (= res!218821 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15594 () Bool)

(declare-fun tp!30830 () Bool)

(declare-fun e!233224 () Bool)

(assert (=> mapNonEmpty!15594 (= mapRes!15594 (and tp!30830 e!233224))))

(declare-fun mapKey!15594 () (_ BitVec 32))

(declare-fun mapValue!15594 () ValueCell!4333)

(declare-fun mapRest!15594 () (Array (_ BitVec 32) ValueCell!4333))

(assert (=> mapNonEmpty!15594 (= (arr!10774 _values!506) (store mapRest!15594 mapKey!15594 mapValue!15594))))

(declare-fun res!218817 () Bool)

(assert (=> start!37578 (=> (not res!218817) (not e!233225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37578 (= res!218817 (validMask!0 mask!970))))

(assert (=> start!37578 e!233225))

(declare-fun e!233228 () Bool)

(declare-fun array_inv!7930 (array!22611) Bool)

(assert (=> start!37578 (and (array_inv!7930 _values!506) e!233228)))

(assert (=> start!37578 tp!30831))

(assert (=> start!37578 true))

(declare-fun tp_is_empty!9353 () Bool)

(assert (=> start!37578 tp_is_empty!9353))

(declare-fun array_inv!7931 (array!22613) Bool)

(assert (=> start!37578 (array_inv!7931 _keys!658)))

(declare-fun b!384087 () Bool)

(declare-fun res!218822 () Bool)

(assert (=> b!384087 (=> (not res!218822) (not e!233225))))

(assert (=> b!384087 (= res!218822 (or (= (select (arr!10775 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10775 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384088 () Bool)

(declare-fun e!233227 () Bool)

(assert (=> b!384088 (= e!233227 true)))

(declare-datatypes ((tuple2!6352 0))(
  ( (tuple2!6353 (_1!3187 (_ BitVec 64)) (_2!3187 V!13575)) )
))
(declare-datatypes ((List!6188 0))(
  ( (Nil!6185) (Cons!6184 (h!7040 tuple2!6352) (t!11338 List!6188)) )
))
(declare-datatypes ((ListLongMap!5265 0))(
  ( (ListLongMap!5266 (toList!2648 List!6188)) )
))
(declare-fun lt!180625 () ListLongMap!5265)

(declare-fun lt!180627 () ListLongMap!5265)

(declare-fun lt!180621 () tuple2!6352)

(declare-fun +!983 (ListLongMap!5265 tuple2!6352) ListLongMap!5265)

(assert (=> b!384088 (= lt!180625 (+!983 lt!180627 lt!180621))))

(declare-fun lt!180622 () ListLongMap!5265)

(declare-fun lt!180629 () ListLongMap!5265)

(assert (=> b!384088 (= lt!180622 lt!180629)))

(declare-fun b!384089 () Bool)

(declare-fun res!218820 () Bool)

(declare-fun e!233226 () Bool)

(assert (=> b!384089 (=> (not res!218820) (not e!233226))))

(declare-fun lt!180628 () array!22613)

(declare-datatypes ((List!6189 0))(
  ( (Nil!6186) (Cons!6185 (h!7041 (_ BitVec 64)) (t!11339 List!6189)) )
))
(declare-fun arrayNoDuplicates!0 (array!22613 (_ BitVec 32) List!6189) Bool)

(assert (=> b!384089 (= res!218820 (arrayNoDuplicates!0 lt!180628 #b00000000000000000000000000000000 Nil!6186))))

(declare-fun b!384090 () Bool)

(declare-fun res!218825 () Bool)

(assert (=> b!384090 (=> (not res!218825) (not e!233225))))

(assert (=> b!384090 (= res!218825 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6186))))

(declare-fun b!384091 () Bool)

(declare-fun e!233222 () Bool)

(assert (=> b!384091 (= e!233222 tp_is_empty!9353)))

(declare-fun b!384092 () Bool)

(assert (=> b!384092 (= e!233228 (and e!233222 mapRes!15594))))

(declare-fun condMapEmpty!15594 () Bool)

(declare-fun mapDefault!15594 () ValueCell!4333)

