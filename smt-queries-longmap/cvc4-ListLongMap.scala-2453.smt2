; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38540 () Bool)

(assert start!38540)

(declare-fun b!398426 () Bool)

(declare-fun e!240816 () Bool)

(declare-fun tp_is_empty!9959 () Bool)

(assert (=> b!398426 (= e!240816 tp_is_empty!9959)))

(declare-fun b!398427 () Bool)

(declare-fun res!228967 () Bool)

(declare-fun e!240815 () Bool)

(assert (=> b!398427 (=> (not res!228967) (not e!240815))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398427 (= res!228967 (validKeyInArray!0 k!794))))

(declare-fun b!398428 () Bool)

(declare-fun res!228963 () Bool)

(assert (=> b!398428 (=> (not res!228963) (not e!240815))))

(declare-datatypes ((array!23829 0))(
  ( (array!23830 (arr!11364 (Array (_ BitVec 32) (_ BitVec 64))) (size!11716 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23829)

(declare-datatypes ((List!6571 0))(
  ( (Nil!6568) (Cons!6567 (h!7423 (_ BitVec 64)) (t!11745 List!6571)) )
))
(declare-fun arrayNoDuplicates!0 (array!23829 (_ BitVec 32) List!6571) Bool)

(assert (=> b!398428 (= res!228963 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6568))))

(declare-fun b!398429 () Bool)

(declare-fun res!228961 () Bool)

(assert (=> b!398429 (=> (not res!228961) (not e!240815))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398429 (= res!228961 (or (= (select (arr!11364 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11364 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398430 () Bool)

(declare-fun res!228965 () Bool)

(assert (=> b!398430 (=> (not res!228965) (not e!240815))))

(declare-fun arrayContainsKey!0 (array!23829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398430 (= res!228965 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!398431 () Bool)

(declare-fun res!228968 () Bool)

(assert (=> b!398431 (=> (not res!228968) (not e!240815))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23829 (_ BitVec 32)) Bool)

(assert (=> b!398431 (= res!228968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16560 () Bool)

(declare-fun mapRes!16560 () Bool)

(assert (=> mapIsEmpty!16560 mapRes!16560))

(declare-fun res!228966 () Bool)

(assert (=> start!38540 (=> (not res!228966) (not e!240815))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38540 (= res!228966 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11716 _keys!709))))))

(assert (=> start!38540 e!240815))

(assert (=> start!38540 true))

(declare-datatypes ((V!14383 0))(
  ( (V!14384 (val!5024 Int)) )
))
(declare-datatypes ((ValueCell!4636 0))(
  ( (ValueCellFull!4636 (v!7271 V!14383)) (EmptyCell!4636) )
))
(declare-datatypes ((array!23831 0))(
  ( (array!23832 (arr!11365 (Array (_ BitVec 32) ValueCell!4636)) (size!11717 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23831)

(declare-fun e!240813 () Bool)

(declare-fun array_inv!8330 (array!23831) Bool)

(assert (=> start!38540 (and (array_inv!8330 _values!549) e!240813)))

(declare-fun array_inv!8331 (array!23829) Bool)

(assert (=> start!38540 (array_inv!8331 _keys!709)))

(declare-fun b!398432 () Bool)

(declare-fun res!228962 () Bool)

(assert (=> b!398432 (=> (not res!228962) (not e!240815))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398432 (= res!228962 (and (= (size!11717 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11716 _keys!709) (size!11717 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398433 () Bool)

(declare-fun res!228960 () Bool)

(assert (=> b!398433 (=> (not res!228960) (not e!240815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398433 (= res!228960 (validMask!0 mask!1025))))

(declare-fun b!398434 () Bool)

(declare-fun res!228964 () Bool)

(assert (=> b!398434 (=> (not res!228964) (not e!240815))))

(assert (=> b!398434 (= res!228964 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11716 _keys!709))))))

(declare-fun mapNonEmpty!16560 () Bool)

(declare-fun tp!32355 () Bool)

(declare-fun e!240814 () Bool)

(assert (=> mapNonEmpty!16560 (= mapRes!16560 (and tp!32355 e!240814))))

(declare-fun mapKey!16560 () (_ BitVec 32))

(declare-fun mapValue!16560 () ValueCell!4636)

(declare-fun mapRest!16560 () (Array (_ BitVec 32) ValueCell!4636))

(assert (=> mapNonEmpty!16560 (= (arr!11365 _values!549) (store mapRest!16560 mapKey!16560 mapValue!16560))))

(declare-fun b!398435 () Bool)

(declare-fun e!240811 () Bool)

(assert (=> b!398435 (= e!240811 false)))

(declare-fun lt!187456 () Bool)

(declare-fun lt!187457 () array!23829)

(assert (=> b!398435 (= lt!187456 (arrayNoDuplicates!0 lt!187457 #b00000000000000000000000000000000 Nil!6568))))

(declare-fun b!398436 () Bool)

(assert (=> b!398436 (= e!240814 tp_is_empty!9959)))

(declare-fun b!398437 () Bool)

(assert (=> b!398437 (= e!240813 (and e!240816 mapRes!16560))))

(declare-fun condMapEmpty!16560 () Bool)

(declare-fun mapDefault!16560 () ValueCell!4636)

