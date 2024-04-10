; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20064 () Bool)

(assert start!20064)

(declare-fun b!196467 () Bool)

(declare-fun res!92731 () Bool)

(declare-fun e!129402 () Bool)

(assert (=> b!196467 (=> (not res!92731) (not e!129402))))

(declare-datatypes ((array!8415 0))(
  ( (array!8416 (arr!3958 (Array (_ BitVec 32) (_ BitVec 64))) (size!4283 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8415)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8415 (_ BitVec 32)) Bool)

(assert (=> b!196467 (= res!92731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196468 () Bool)

(declare-fun res!92729 () Bool)

(assert (=> b!196468 (=> (not res!92729) (not e!129402))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5753 0))(
  ( (V!5754 (val!2334 Int)) )
))
(declare-datatypes ((ValueCell!1946 0))(
  ( (ValueCellFull!1946 (v!4304 V!5753)) (EmptyCell!1946) )
))
(declare-datatypes ((array!8417 0))(
  ( (array!8418 (arr!3959 (Array (_ BitVec 32) ValueCell!1946)) (size!4284 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8417)

(assert (=> b!196468 (= res!92729 (and (= (size!4284 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4283 _keys!825) (size!4284 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196469 () Bool)

(declare-fun e!129400 () Bool)

(declare-fun tp_is_empty!4579 () Bool)

(assert (=> b!196469 (= e!129400 tp_is_empty!4579)))

(declare-fun b!196470 () Bool)

(assert (=> b!196470 (= e!129402 false)))

(declare-fun lt!97623 () Bool)

(declare-datatypes ((List!2474 0))(
  ( (Nil!2471) (Cons!2470 (h!3112 (_ BitVec 64)) (t!7405 List!2474)) )
))
(declare-fun arrayNoDuplicates!0 (array!8415 (_ BitVec 32) List!2474) Bool)

(assert (=> b!196470 (= lt!97623 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2471))))

(declare-fun mapNonEmpty!7937 () Bool)

(declare-fun mapRes!7937 () Bool)

(declare-fun tp!17225 () Bool)

(declare-fun e!129401 () Bool)

(assert (=> mapNonEmpty!7937 (= mapRes!7937 (and tp!17225 e!129401))))

(declare-fun mapRest!7937 () (Array (_ BitVec 32) ValueCell!1946))

(declare-fun mapKey!7937 () (_ BitVec 32))

(declare-fun mapValue!7937 () ValueCell!1946)

(assert (=> mapNonEmpty!7937 (= (arr!3959 _values!649) (store mapRest!7937 mapKey!7937 mapValue!7937))))

(declare-fun res!92730 () Bool)

(assert (=> start!20064 (=> (not res!92730) (not e!129402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20064 (= res!92730 (validMask!0 mask!1149))))

(assert (=> start!20064 e!129402))

(assert (=> start!20064 true))

(declare-fun e!129404 () Bool)

(declare-fun array_inv!2577 (array!8417) Bool)

(assert (=> start!20064 (and (array_inv!2577 _values!649) e!129404)))

(declare-fun array_inv!2578 (array!8415) Bool)

(assert (=> start!20064 (array_inv!2578 _keys!825)))

(declare-fun b!196471 () Bool)

(assert (=> b!196471 (= e!129404 (and e!129400 mapRes!7937))))

(declare-fun condMapEmpty!7937 () Bool)

(declare-fun mapDefault!7937 () ValueCell!1946)

