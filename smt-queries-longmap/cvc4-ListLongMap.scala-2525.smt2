; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38972 () Bool)

(assert start!38972)

(declare-fun b!408146 () Bool)

(declare-fun res!236097 () Bool)

(declare-fun e!245025 () Bool)

(assert (=> b!408146 (=> (not res!236097) (not e!245025))))

(declare-datatypes ((array!24661 0))(
  ( (array!24662 (arr!11780 (Array (_ BitVec 32) (_ BitVec 64))) (size!12132 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24661)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408146 (= res!236097 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!408147 () Bool)

(declare-fun res!236092 () Bool)

(assert (=> b!408147 (=> (not res!236092) (not e!245025))))

(declare-datatypes ((List!6828 0))(
  ( (Nil!6825) (Cons!6824 (h!7680 (_ BitVec 64)) (t!12002 List!6828)) )
))
(declare-fun arrayNoDuplicates!0 (array!24661 (_ BitVec 32) List!6828) Bool)

(assert (=> b!408147 (= res!236092 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6825))))

(declare-fun b!408148 () Bool)

(declare-fun res!236091 () Bool)

(assert (=> b!408148 (=> (not res!236091) (not e!245025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408148 (= res!236091 (validKeyInArray!0 k!794))))

(declare-fun res!236095 () Bool)

(assert (=> start!38972 (=> (not res!236095) (not e!245025))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38972 (= res!236095 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12132 _keys!709))))))

(assert (=> start!38972 e!245025))

(assert (=> start!38972 true))

(declare-datatypes ((V!14959 0))(
  ( (V!14960 (val!5240 Int)) )
))
(declare-datatypes ((ValueCell!4852 0))(
  ( (ValueCellFull!4852 (v!7487 V!14959)) (EmptyCell!4852) )
))
(declare-datatypes ((array!24663 0))(
  ( (array!24664 (arr!11781 (Array (_ BitVec 32) ValueCell!4852)) (size!12133 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24663)

(declare-fun e!245026 () Bool)

(declare-fun array_inv!8592 (array!24663) Bool)

(assert (=> start!38972 (and (array_inv!8592 _values!549) e!245026)))

(declare-fun array_inv!8593 (array!24661) Bool)

(assert (=> start!38972 (array_inv!8593 _keys!709)))

(declare-fun mapIsEmpty!17208 () Bool)

(declare-fun mapRes!17208 () Bool)

(assert (=> mapIsEmpty!17208 mapRes!17208))

(declare-fun b!408149 () Bool)

(declare-fun res!236090 () Bool)

(assert (=> b!408149 (=> (not res!236090) (not e!245025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408149 (= res!236090 (or (= (select (arr!11780 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11780 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408150 () Bool)

(declare-fun res!236089 () Bool)

(assert (=> b!408150 (=> (not res!236089) (not e!245025))))

(assert (=> b!408150 (= res!236089 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12132 _keys!709))))))

(declare-fun b!408151 () Bool)

(declare-fun e!245028 () Bool)

(assert (=> b!408151 (= e!245025 e!245028)))

(declare-fun res!236088 () Bool)

(assert (=> b!408151 (=> (not res!236088) (not e!245028))))

(declare-fun lt!188753 () array!24661)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24661 (_ BitVec 32)) Bool)

(assert (=> b!408151 (= res!236088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188753 mask!1025))))

(assert (=> b!408151 (= lt!188753 (array!24662 (store (arr!11780 _keys!709) i!563 k!794) (size!12132 _keys!709)))))

(declare-fun b!408152 () Bool)

(assert (=> b!408152 (= e!245028 false)))

(declare-fun lt!188752 () Bool)

(assert (=> b!408152 (= lt!188752 (arrayNoDuplicates!0 lt!188753 #b00000000000000000000000000000000 Nil!6825))))

(declare-fun b!408153 () Bool)

(declare-fun res!236093 () Bool)

(assert (=> b!408153 (=> (not res!236093) (not e!245025))))

(assert (=> b!408153 (= res!236093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408154 () Bool)

(declare-fun res!236096 () Bool)

(assert (=> b!408154 (=> (not res!236096) (not e!245025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408154 (= res!236096 (validMask!0 mask!1025))))

(declare-fun b!408155 () Bool)

(declare-fun res!236094 () Bool)

(assert (=> b!408155 (=> (not res!236094) (not e!245025))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408155 (= res!236094 (and (= (size!12133 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12132 _keys!709) (size!12133 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408156 () Bool)

(declare-fun e!245023 () Bool)

(declare-fun tp_is_empty!10391 () Bool)

(assert (=> b!408156 (= e!245023 tp_is_empty!10391)))

(declare-fun b!408157 () Bool)

(declare-fun e!245027 () Bool)

(assert (=> b!408157 (= e!245026 (and e!245027 mapRes!17208))))

(declare-fun condMapEmpty!17208 () Bool)

(declare-fun mapDefault!17208 () ValueCell!4852)

