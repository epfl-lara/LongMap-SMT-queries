; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38410 () Bool)

(assert start!38410)

(declare-fun b!396162 () Bool)

(declare-fun res!227231 () Bool)

(declare-fun e!239753 () Bool)

(assert (=> b!396162 (=> (not res!227231) (not e!239753))))

(declare-datatypes ((array!23605 0))(
  ( (array!23606 (arr!11253 (Array (_ BitVec 32) (_ BitVec 64))) (size!11605 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23605)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23605 (_ BitVec 32)) Bool)

(assert (=> b!396162 (= res!227231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23606 (store (arr!11253 _keys!709) i!563 k!794) (size!11605 _keys!709)) mask!1025))))

(declare-fun b!396164 () Bool)

(declare-fun e!239755 () Bool)

(declare-fun tp_is_empty!9847 () Bool)

(assert (=> b!396164 (= e!239755 tp_is_empty!9847)))

(declare-fun b!396165 () Bool)

(declare-fun res!227230 () Bool)

(assert (=> b!396165 (=> (not res!227230) (not e!239753))))

(declare-fun arrayContainsKey!0 (array!23605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396165 (= res!227230 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396166 () Bool)

(declare-fun e!239758 () Bool)

(declare-datatypes ((List!6522 0))(
  ( (Nil!6519) (Cons!6518 (h!7374 (_ BitVec 64)) (t!11696 List!6522)) )
))
(declare-fun contains!2483 (List!6522 (_ BitVec 64)) Bool)

(assert (=> b!396166 (= e!239758 (contains!2483 Nil!6519 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396167 () Bool)

(declare-fun res!227232 () Bool)

(assert (=> b!396167 (=> (not res!227232) (not e!239753))))

(assert (=> b!396167 (= res!227232 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11605 _keys!709))))))

(declare-fun mapIsEmpty!16389 () Bool)

(declare-fun mapRes!16389 () Bool)

(assert (=> mapIsEmpty!16389 mapRes!16389))

(declare-fun b!396168 () Bool)

(assert (=> b!396168 (= e!239753 e!239758)))

(declare-fun res!227223 () Bool)

(assert (=> b!396168 (=> res!227223 e!239758)))

(assert (=> b!396168 (= res!227223 (contains!2483 Nil!6519 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396169 () Bool)

(declare-fun res!227227 () Bool)

(assert (=> b!396169 (=> (not res!227227) (not e!239753))))

(declare-fun arrayNoDuplicates!0 (array!23605 (_ BitVec 32) List!6522) Bool)

(assert (=> b!396169 (= res!227227 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6519))))

(declare-fun mapNonEmpty!16389 () Bool)

(declare-fun tp!32184 () Bool)

(assert (=> mapNonEmpty!16389 (= mapRes!16389 (and tp!32184 e!239755))))

(declare-fun mapKey!16389 () (_ BitVec 32))

(declare-datatypes ((V!14235 0))(
  ( (V!14236 (val!4968 Int)) )
))
(declare-datatypes ((ValueCell!4580 0))(
  ( (ValueCellFull!4580 (v!7214 V!14235)) (EmptyCell!4580) )
))
(declare-datatypes ((array!23607 0))(
  ( (array!23608 (arr!11254 (Array (_ BitVec 32) ValueCell!4580)) (size!11606 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23607)

(declare-fun mapValue!16389 () ValueCell!4580)

(declare-fun mapRest!16389 () (Array (_ BitVec 32) ValueCell!4580))

(assert (=> mapNonEmpty!16389 (= (arr!11254 _values!549) (store mapRest!16389 mapKey!16389 mapValue!16389))))

(declare-fun b!396170 () Bool)

(declare-fun res!227228 () Bool)

(assert (=> b!396170 (=> (not res!227228) (not e!239753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396170 (= res!227228 (validKeyInArray!0 k!794))))

(declare-fun res!227224 () Bool)

(assert (=> start!38410 (=> (not res!227224) (not e!239753))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38410 (= res!227224 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11605 _keys!709))))))

(assert (=> start!38410 e!239753))

(assert (=> start!38410 true))

(declare-fun e!239754 () Bool)

(declare-fun array_inv!8258 (array!23607) Bool)

(assert (=> start!38410 (and (array_inv!8258 _values!549) e!239754)))

(declare-fun array_inv!8259 (array!23605) Bool)

(assert (=> start!38410 (array_inv!8259 _keys!709)))

(declare-fun b!396163 () Bool)

(declare-fun res!227234 () Bool)

(assert (=> b!396163 (=> (not res!227234) (not e!239753))))

(declare-fun noDuplicate!199 (List!6522) Bool)

(assert (=> b!396163 (= res!227234 (noDuplicate!199 Nil!6519))))

(declare-fun b!396171 () Bool)

(declare-fun res!227222 () Bool)

(assert (=> b!396171 (=> (not res!227222) (not e!239753))))

(assert (=> b!396171 (= res!227222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396172 () Bool)

(declare-fun res!227225 () Bool)

(assert (=> b!396172 (=> (not res!227225) (not e!239753))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396172 (= res!227225 (and (= (size!11606 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11605 _keys!709) (size!11606 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396173 () Bool)

(declare-fun e!239757 () Bool)

(assert (=> b!396173 (= e!239754 (and e!239757 mapRes!16389))))

(declare-fun condMapEmpty!16389 () Bool)

(declare-fun mapDefault!16389 () ValueCell!4580)

