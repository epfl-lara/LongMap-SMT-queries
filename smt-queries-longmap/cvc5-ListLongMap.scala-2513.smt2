; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38896 () Bool)

(assert start!38896)

(declare-fun b!406664 () Bool)

(declare-fun res!234957 () Bool)

(declare-fun e!244342 () Bool)

(assert (=> b!406664 (=> (not res!234957) (not e!244342))))

(declare-datatypes ((array!24519 0))(
  ( (array!24520 (arr!11709 (Array (_ BitVec 32) (_ BitVec 64))) (size!12061 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24519)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406664 (= res!234957 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!406665 () Bool)

(declare-fun e!244340 () Bool)

(declare-fun tp_is_empty!10315 () Bool)

(assert (=> b!406665 (= e!244340 tp_is_empty!10315)))

(declare-fun b!406666 () Bool)

(declare-fun res!234952 () Bool)

(assert (=> b!406666 (=> (not res!234952) (not e!244342))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406666 (= res!234952 (or (= (select (arr!11709 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11709 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406667 () Bool)

(declare-fun e!244344 () Bool)

(assert (=> b!406667 (= e!244342 e!244344)))

(declare-fun res!234949 () Bool)

(assert (=> b!406667 (=> (not res!234949) (not e!244344))))

(declare-fun lt!188524 () array!24519)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24519 (_ BitVec 32)) Bool)

(assert (=> b!406667 (= res!234949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188524 mask!1025))))

(assert (=> b!406667 (= lt!188524 (array!24520 (store (arr!11709 _keys!709) i!563 k!794) (size!12061 _keys!709)))))

(declare-fun b!406668 () Bool)

(declare-fun res!234955 () Bool)

(assert (=> b!406668 (=> (not res!234955) (not e!244342))))

(declare-datatypes ((List!6798 0))(
  ( (Nil!6795) (Cons!6794 (h!7650 (_ BitVec 64)) (t!11972 List!6798)) )
))
(declare-fun arrayNoDuplicates!0 (array!24519 (_ BitVec 32) List!6798) Bool)

(assert (=> b!406668 (= res!234955 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6795))))

(declare-fun res!234950 () Bool)

(assert (=> start!38896 (=> (not res!234950) (not e!244342))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38896 (= res!234950 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12061 _keys!709))))))

(assert (=> start!38896 e!244342))

(assert (=> start!38896 true))

(declare-datatypes ((V!14859 0))(
  ( (V!14860 (val!5202 Int)) )
))
(declare-datatypes ((ValueCell!4814 0))(
  ( (ValueCellFull!4814 (v!7449 V!14859)) (EmptyCell!4814) )
))
(declare-datatypes ((array!24521 0))(
  ( (array!24522 (arr!11710 (Array (_ BitVec 32) ValueCell!4814)) (size!12062 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24521)

(declare-fun e!244343 () Bool)

(declare-fun array_inv!8550 (array!24521) Bool)

(assert (=> start!38896 (and (array_inv!8550 _values!549) e!244343)))

(declare-fun array_inv!8551 (array!24519) Bool)

(assert (=> start!38896 (array_inv!8551 _keys!709)))

(declare-fun b!406669 () Bool)

(assert (=> b!406669 (= e!244344 false)))

(declare-fun lt!188525 () Bool)

(assert (=> b!406669 (= lt!188525 (arrayNoDuplicates!0 lt!188524 #b00000000000000000000000000000000 Nil!6795))))

(declare-fun b!406670 () Bool)

(declare-fun res!234953 () Bool)

(assert (=> b!406670 (=> (not res!234953) (not e!244342))))

(assert (=> b!406670 (= res!234953 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12061 _keys!709))))))

(declare-fun b!406671 () Bool)

(declare-fun res!234951 () Bool)

(assert (=> b!406671 (=> (not res!234951) (not e!244342))))

(assert (=> b!406671 (= res!234951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406672 () Bool)

(declare-fun res!234956 () Bool)

(assert (=> b!406672 (=> (not res!234956) (not e!244342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406672 (= res!234956 (validMask!0 mask!1025))))

(declare-fun b!406673 () Bool)

(declare-fun e!244341 () Bool)

(declare-fun mapRes!17094 () Bool)

(assert (=> b!406673 (= e!244343 (and e!244341 mapRes!17094))))

(declare-fun condMapEmpty!17094 () Bool)

(declare-fun mapDefault!17094 () ValueCell!4814)

