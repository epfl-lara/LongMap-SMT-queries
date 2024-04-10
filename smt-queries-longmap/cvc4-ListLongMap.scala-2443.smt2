; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38480 () Bool)

(assert start!38480)

(declare-fun res!228067 () Bool)

(declare-fun e!240276 () Bool)

(assert (=> start!38480 (=> (not res!228067) (not e!240276))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23711 0))(
  ( (array!23712 (arr!11305 (Array (_ BitVec 32) (_ BitVec 64))) (size!11657 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23711)

(assert (=> start!38480 (= res!228067 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11657 _keys!709))))))

(assert (=> start!38480 e!240276))

(assert (=> start!38480 true))

(declare-datatypes ((V!14303 0))(
  ( (V!14304 (val!4994 Int)) )
))
(declare-datatypes ((ValueCell!4606 0))(
  ( (ValueCellFull!4606 (v!7241 V!14303)) (EmptyCell!4606) )
))
(declare-datatypes ((array!23713 0))(
  ( (array!23714 (arr!11306 (Array (_ BitVec 32) ValueCell!4606)) (size!11658 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23713)

(declare-fun e!240272 () Bool)

(declare-fun array_inv!8286 (array!23713) Bool)

(assert (=> start!38480 (and (array_inv!8286 _values!549) e!240272)))

(declare-fun array_inv!8287 (array!23711) Bool)

(assert (=> start!38480 (array_inv!8287 _keys!709)))

(declare-fun b!397256 () Bool)

(declare-fun res!228061 () Bool)

(assert (=> b!397256 (=> (not res!228061) (not e!240276))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397256 (= res!228061 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16470 () Bool)

(declare-fun mapRes!16470 () Bool)

(assert (=> mapIsEmpty!16470 mapRes!16470))

(declare-fun b!397257 () Bool)

(declare-fun e!240273 () Bool)

(assert (=> b!397257 (= e!240273 false)))

(declare-fun lt!187276 () Bool)

(declare-fun lt!187277 () array!23711)

(declare-datatypes ((List!6544 0))(
  ( (Nil!6541) (Cons!6540 (h!7396 (_ BitVec 64)) (t!11718 List!6544)) )
))
(declare-fun arrayNoDuplicates!0 (array!23711 (_ BitVec 32) List!6544) Bool)

(assert (=> b!397257 (= lt!187276 (arrayNoDuplicates!0 lt!187277 #b00000000000000000000000000000000 Nil!6541))))

(declare-fun b!397258 () Bool)

(assert (=> b!397258 (= e!240276 e!240273)))

(declare-fun res!228063 () Bool)

(assert (=> b!397258 (=> (not res!228063) (not e!240273))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23711 (_ BitVec 32)) Bool)

(assert (=> b!397258 (= res!228063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187277 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397258 (= lt!187277 (array!23712 (store (arr!11305 _keys!709) i!563 k!794) (size!11657 _keys!709)))))

(declare-fun b!397259 () Bool)

(declare-fun res!228066 () Bool)

(assert (=> b!397259 (=> (not res!228066) (not e!240276))))

(assert (=> b!397259 (= res!228066 (or (= (select (arr!11305 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11305 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397260 () Bool)

(declare-fun res!228069 () Bool)

(assert (=> b!397260 (=> (not res!228069) (not e!240276))))

(assert (=> b!397260 (= res!228069 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6541))))

(declare-fun b!397261 () Bool)

(declare-fun res!228060 () Bool)

(assert (=> b!397261 (=> (not res!228060) (not e!240276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397261 (= res!228060 (validMask!0 mask!1025))))

(declare-fun b!397262 () Bool)

(declare-fun res!228065 () Bool)

(assert (=> b!397262 (=> (not res!228065) (not e!240276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397262 (= res!228065 (validKeyInArray!0 k!794))))

(declare-fun b!397263 () Bool)

(declare-fun res!228068 () Bool)

(assert (=> b!397263 (=> (not res!228068) (not e!240276))))

(assert (=> b!397263 (= res!228068 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11657 _keys!709))))))

(declare-fun b!397264 () Bool)

(declare-fun e!240271 () Bool)

(declare-fun tp_is_empty!9899 () Bool)

(assert (=> b!397264 (= e!240271 tp_is_empty!9899)))

(declare-fun b!397265 () Bool)

(declare-fun e!240274 () Bool)

(assert (=> b!397265 (= e!240274 tp_is_empty!9899)))

(declare-fun mapNonEmpty!16470 () Bool)

(declare-fun tp!32265 () Bool)

(assert (=> mapNonEmpty!16470 (= mapRes!16470 (and tp!32265 e!240274))))

(declare-fun mapRest!16470 () (Array (_ BitVec 32) ValueCell!4606))

(declare-fun mapValue!16470 () ValueCell!4606)

(declare-fun mapKey!16470 () (_ BitVec 32))

(assert (=> mapNonEmpty!16470 (= (arr!11306 _values!549) (store mapRest!16470 mapKey!16470 mapValue!16470))))

(declare-fun b!397266 () Bool)

(assert (=> b!397266 (= e!240272 (and e!240271 mapRes!16470))))

(declare-fun condMapEmpty!16470 () Bool)

(declare-fun mapDefault!16470 () ValueCell!4606)

