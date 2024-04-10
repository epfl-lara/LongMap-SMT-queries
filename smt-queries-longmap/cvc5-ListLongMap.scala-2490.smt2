; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38758 () Bool)

(assert start!38758)

(declare-fun mapIsEmpty!16887 () Bool)

(declare-fun mapRes!16887 () Bool)

(assert (=> mapIsEmpty!16887 mapRes!16887))

(declare-fun b!403973 () Bool)

(declare-fun e!243101 () Bool)

(assert (=> b!403973 (= e!243101 false)))

(declare-fun lt!188111 () Bool)

(declare-datatypes ((array!24251 0))(
  ( (array!24252 (arr!11575 (Array (_ BitVec 32) (_ BitVec 64))) (size!11927 (_ BitVec 32))) )
))
(declare-fun lt!188110 () array!24251)

(declare-datatypes ((List!6743 0))(
  ( (Nil!6740) (Cons!6739 (h!7595 (_ BitVec 64)) (t!11917 List!6743)) )
))
(declare-fun arrayNoDuplicates!0 (array!24251 (_ BitVec 32) List!6743) Bool)

(assert (=> b!403973 (= lt!188111 (arrayNoDuplicates!0 lt!188110 #b00000000000000000000000000000000 Nil!6740))))

(declare-fun b!403974 () Bool)

(declare-fun res!232884 () Bool)

(declare-fun e!243100 () Bool)

(assert (=> b!403974 (=> (not res!232884) (not e!243100))))

(declare-fun _keys!709 () array!24251)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403974 (= res!232884 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!403975 () Bool)

(declare-fun res!232887 () Bool)

(assert (=> b!403975 (=> (not res!232887) (not e!243100))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24251 (_ BitVec 32)) Bool)

(assert (=> b!403975 (= res!232887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403977 () Bool)

(declare-fun res!232880 () Bool)

(assert (=> b!403977 (=> (not res!232880) (not e!243100))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403977 (= res!232880 (or (= (select (arr!11575 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11575 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403978 () Bool)

(declare-fun res!232885 () Bool)

(assert (=> b!403978 (=> (not res!232885) (not e!243100))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14675 0))(
  ( (V!14676 (val!5133 Int)) )
))
(declare-datatypes ((ValueCell!4745 0))(
  ( (ValueCellFull!4745 (v!7380 V!14675)) (EmptyCell!4745) )
))
(declare-datatypes ((array!24253 0))(
  ( (array!24254 (arr!11576 (Array (_ BitVec 32) ValueCell!4745)) (size!11928 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24253)

(assert (=> b!403978 (= res!232885 (and (= (size!11928 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11927 _keys!709) (size!11928 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403979 () Bool)

(declare-fun res!232879 () Bool)

(assert (=> b!403979 (=> (not res!232879) (not e!243100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403979 (= res!232879 (validMask!0 mask!1025))))

(declare-fun b!403980 () Bool)

(declare-fun e!243102 () Bool)

(declare-fun tp_is_empty!10177 () Bool)

(assert (=> b!403980 (= e!243102 tp_is_empty!10177)))

(declare-fun b!403976 () Bool)

(declare-fun res!232883 () Bool)

(assert (=> b!403976 (=> (not res!232883) (not e!243100))))

(assert (=> b!403976 (= res!232883 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6740))))

(declare-fun res!232882 () Bool)

(assert (=> start!38758 (=> (not res!232882) (not e!243100))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38758 (= res!232882 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11927 _keys!709))))))

(assert (=> start!38758 e!243100))

(assert (=> start!38758 true))

(declare-fun e!243097 () Bool)

(declare-fun array_inv!8468 (array!24253) Bool)

(assert (=> start!38758 (and (array_inv!8468 _values!549) e!243097)))

(declare-fun array_inv!8469 (array!24251) Bool)

(assert (=> start!38758 (array_inv!8469 _keys!709)))

(declare-fun b!403981 () Bool)

(declare-fun e!243098 () Bool)

(assert (=> b!403981 (= e!243097 (and e!243098 mapRes!16887))))

(declare-fun condMapEmpty!16887 () Bool)

(declare-fun mapDefault!16887 () ValueCell!4745)

