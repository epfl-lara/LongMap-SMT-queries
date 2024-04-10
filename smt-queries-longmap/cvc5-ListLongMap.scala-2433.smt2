; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38368 () Bool)

(assert start!38368)

(declare-fun b!395817 () Bool)

(declare-fun res!226976 () Bool)

(declare-fun e!239583 () Bool)

(assert (=> b!395817 (=> (not res!226976) (not e!239583))))

(declare-datatypes ((array!23577 0))(
  ( (array!23578 (arr!11241 (Array (_ BitVec 32) (_ BitVec 64))) (size!11593 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23577)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14219 0))(
  ( (V!14220 (val!4962 Int)) )
))
(declare-datatypes ((ValueCell!4574 0))(
  ( (ValueCellFull!4574 (v!7208 V!14219)) (EmptyCell!4574) )
))
(declare-datatypes ((array!23579 0))(
  ( (array!23580 (arr!11242 (Array (_ BitVec 32) ValueCell!4574)) (size!11594 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23579)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395817 (= res!226976 (and (= (size!11594 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11593 _keys!709) (size!11594 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395818 () Bool)

(assert (=> b!395818 (= e!239583 (and (bvsle #b00000000000000000000000000000000 (size!11593 _keys!709)) (bvsge (size!11593 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395819 () Bool)

(declare-fun res!226984 () Bool)

(assert (=> b!395819 (=> (not res!226984) (not e!239583))))

(declare-datatypes ((List!6517 0))(
  ( (Nil!6514) (Cons!6513 (h!7369 (_ BitVec 64)) (t!11691 List!6517)) )
))
(declare-fun arrayNoDuplicates!0 (array!23577 (_ BitVec 32) List!6517) Bool)

(assert (=> b!395819 (= res!226984 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6514))))

(declare-fun b!395820 () Bool)

(declare-fun res!226980 () Bool)

(assert (=> b!395820 (=> (not res!226980) (not e!239583))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23577 (_ BitVec 32)) Bool)

(assert (=> b!395820 (= res!226980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23578 (store (arr!11241 _keys!709) i!563 k!794) (size!11593 _keys!709)) mask!1025))))

(declare-fun b!395821 () Bool)

(declare-fun res!226981 () Bool)

(assert (=> b!395821 (=> (not res!226981) (not e!239583))))

(declare-fun arrayContainsKey!0 (array!23577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395821 (= res!226981 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!395822 () Bool)

(declare-fun e!239587 () Bool)

(declare-fun tp_is_empty!9835 () Bool)

(assert (=> b!395822 (= e!239587 tp_is_empty!9835)))

(declare-fun mapIsEmpty!16365 () Bool)

(declare-fun mapRes!16365 () Bool)

(assert (=> mapIsEmpty!16365 mapRes!16365))

(declare-fun b!395823 () Bool)

(declare-fun res!226979 () Bool)

(assert (=> b!395823 (=> (not res!226979) (not e!239583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395823 (= res!226979 (validMask!0 mask!1025))))

(declare-fun b!395824 () Bool)

(declare-fun e!239585 () Bool)

(assert (=> b!395824 (= e!239585 tp_is_empty!9835)))

(declare-fun b!395825 () Bool)

(declare-fun res!226982 () Bool)

(assert (=> b!395825 (=> (not res!226982) (not e!239583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395825 (= res!226982 (validKeyInArray!0 k!794))))

(declare-fun res!226977 () Bool)

(assert (=> start!38368 (=> (not res!226977) (not e!239583))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38368 (= res!226977 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11593 _keys!709))))))

(assert (=> start!38368 e!239583))

(assert (=> start!38368 true))

(declare-fun e!239586 () Bool)

(declare-fun array_inv!8250 (array!23579) Bool)

(assert (=> start!38368 (and (array_inv!8250 _values!549) e!239586)))

(declare-fun array_inv!8251 (array!23577) Bool)

(assert (=> start!38368 (array_inv!8251 _keys!709)))

(declare-fun mapNonEmpty!16365 () Bool)

(declare-fun tp!32160 () Bool)

(assert (=> mapNonEmpty!16365 (= mapRes!16365 (and tp!32160 e!239585))))

(declare-fun mapValue!16365 () ValueCell!4574)

(declare-fun mapKey!16365 () (_ BitVec 32))

(declare-fun mapRest!16365 () (Array (_ BitVec 32) ValueCell!4574))

(assert (=> mapNonEmpty!16365 (= (arr!11242 _values!549) (store mapRest!16365 mapKey!16365 mapValue!16365))))

(declare-fun b!395826 () Bool)

(declare-fun res!226983 () Bool)

(assert (=> b!395826 (=> (not res!226983) (not e!239583))))

(assert (=> b!395826 (= res!226983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395827 () Bool)

(assert (=> b!395827 (= e!239586 (and e!239587 mapRes!16365))))

(declare-fun condMapEmpty!16365 () Bool)

(declare-fun mapDefault!16365 () ValueCell!4574)

