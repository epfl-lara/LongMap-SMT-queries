; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38528 () Bool)

(assert start!38528)

(declare-fun b!398192 () Bool)

(declare-fun res!228788 () Bool)

(declare-fun e!240706 () Bool)

(assert (=> b!398192 (=> (not res!228788) (not e!240706))))

(declare-datatypes ((array!23805 0))(
  ( (array!23806 (arr!11352 (Array (_ BitVec 32) (_ BitVec 64))) (size!11704 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23805)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14367 0))(
  ( (V!14368 (val!5018 Int)) )
))
(declare-datatypes ((ValueCell!4630 0))(
  ( (ValueCellFull!4630 (v!7265 V!14367)) (EmptyCell!4630) )
))
(declare-datatypes ((array!23807 0))(
  ( (array!23808 (arr!11353 (Array (_ BitVec 32) ValueCell!4630)) (size!11705 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23807)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!398192 (= res!228788 (and (= (size!11705 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11704 _keys!709) (size!11705 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398193 () Bool)

(declare-fun res!228784 () Bool)

(assert (=> b!398193 (=> (not res!228784) (not e!240706))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398193 (= res!228784 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11704 _keys!709))))))

(declare-fun b!398194 () Bool)

(declare-fun res!228782 () Bool)

(assert (=> b!398194 (=> (not res!228782) (not e!240706))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398194 (= res!228782 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!398195 () Bool)

(declare-fun res!228786 () Bool)

(assert (=> b!398195 (=> (not res!228786) (not e!240706))))

(assert (=> b!398195 (= res!228786 (or (= (select (arr!11352 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11352 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398197 () Bool)

(declare-fun e!240707 () Bool)

(assert (=> b!398197 (= e!240706 e!240707)))

(declare-fun res!228789 () Bool)

(assert (=> b!398197 (=> (not res!228789) (not e!240707))))

(declare-fun lt!187420 () array!23805)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23805 (_ BitVec 32)) Bool)

(assert (=> b!398197 (= res!228789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187420 mask!1025))))

(assert (=> b!398197 (= lt!187420 (array!23806 (store (arr!11352 _keys!709) i!563 k!794) (size!11704 _keys!709)))))

(declare-fun b!398198 () Bool)

(assert (=> b!398198 (= e!240707 false)))

(declare-fun lt!187421 () Bool)

(declare-datatypes ((List!6567 0))(
  ( (Nil!6564) (Cons!6563 (h!7419 (_ BitVec 64)) (t!11741 List!6567)) )
))
(declare-fun arrayNoDuplicates!0 (array!23805 (_ BitVec 32) List!6567) Bool)

(assert (=> b!398198 (= lt!187421 (arrayNoDuplicates!0 lt!187420 #b00000000000000000000000000000000 Nil!6564))))

(declare-fun b!398199 () Bool)

(declare-fun res!228787 () Bool)

(assert (=> b!398199 (=> (not res!228787) (not e!240706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398199 (= res!228787 (validKeyInArray!0 k!794))))

(declare-fun b!398200 () Bool)

(declare-fun e!240704 () Bool)

(declare-fun tp_is_empty!9947 () Bool)

(assert (=> b!398200 (= e!240704 tp_is_empty!9947)))

(declare-fun b!398201 () Bool)

(declare-fun res!228785 () Bool)

(assert (=> b!398201 (=> (not res!228785) (not e!240706))))

(assert (=> b!398201 (= res!228785 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6564))))

(declare-fun b!398202 () Bool)

(declare-fun res!228780 () Bool)

(assert (=> b!398202 (=> (not res!228780) (not e!240706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398202 (= res!228780 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16542 () Bool)

(declare-fun mapRes!16542 () Bool)

(declare-fun tp!32337 () Bool)

(assert (=> mapNonEmpty!16542 (= mapRes!16542 (and tp!32337 e!240704))))

(declare-fun mapKey!16542 () (_ BitVec 32))

(declare-fun mapValue!16542 () ValueCell!4630)

(declare-fun mapRest!16542 () (Array (_ BitVec 32) ValueCell!4630))

(assert (=> mapNonEmpty!16542 (= (arr!11353 _values!549) (store mapRest!16542 mapKey!16542 mapValue!16542))))

(declare-fun b!398203 () Bool)

(declare-fun e!240703 () Bool)

(assert (=> b!398203 (= e!240703 tp_is_empty!9947)))

(declare-fun b!398204 () Bool)

(declare-fun res!228783 () Bool)

(assert (=> b!398204 (=> (not res!228783) (not e!240706))))

(assert (=> b!398204 (= res!228783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16542 () Bool)

(assert (=> mapIsEmpty!16542 mapRes!16542))

(declare-fun b!398196 () Bool)

(declare-fun e!240708 () Bool)

(assert (=> b!398196 (= e!240708 (and e!240703 mapRes!16542))))

(declare-fun condMapEmpty!16542 () Bool)

(declare-fun mapDefault!16542 () ValueCell!4630)

