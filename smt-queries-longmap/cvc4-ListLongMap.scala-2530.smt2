; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39002 () Bool)

(assert start!39002)

(declare-fun b!408731 () Bool)

(declare-fun res!236541 () Bool)

(declare-fun e!245296 () Bool)

(assert (=> b!408731 (=> (not res!236541) (not e!245296))))

(declare-datatypes ((array!24717 0))(
  ( (array!24718 (arr!11808 (Array (_ BitVec 32) (_ BitVec 64))) (size!12160 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24717)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408731 (= res!236541 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!408732 () Bool)

(declare-fun e!245295 () Bool)

(declare-fun tp_is_empty!10421 () Bool)

(assert (=> b!408732 (= e!245295 tp_is_empty!10421)))

(declare-fun mapNonEmpty!17253 () Bool)

(declare-fun mapRes!17253 () Bool)

(declare-fun tp!33372 () Bool)

(assert (=> mapNonEmpty!17253 (= mapRes!17253 (and tp!33372 e!245295))))

(declare-datatypes ((V!14999 0))(
  ( (V!15000 (val!5255 Int)) )
))
(declare-datatypes ((ValueCell!4867 0))(
  ( (ValueCellFull!4867 (v!7502 V!14999)) (EmptyCell!4867) )
))
(declare-datatypes ((array!24719 0))(
  ( (array!24720 (arr!11809 (Array (_ BitVec 32) ValueCell!4867)) (size!12161 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24719)

(declare-fun mapRest!17253 () (Array (_ BitVec 32) ValueCell!4867))

(declare-fun mapKey!17253 () (_ BitVec 32))

(declare-fun mapValue!17253 () ValueCell!4867)

(assert (=> mapNonEmpty!17253 (= (arr!11809 _values!549) (store mapRest!17253 mapKey!17253 mapValue!17253))))

(declare-fun b!408733 () Bool)

(declare-fun res!236547 () Bool)

(assert (=> b!408733 (=> (not res!236547) (not e!245296))))

(declare-datatypes ((List!6839 0))(
  ( (Nil!6836) (Cons!6835 (h!7691 (_ BitVec 64)) (t!12013 List!6839)) )
))
(declare-fun arrayNoDuplicates!0 (array!24717 (_ BitVec 32) List!6839) Bool)

(assert (=> b!408733 (= res!236547 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6836))))

(declare-fun b!408734 () Bool)

(declare-fun res!236540 () Bool)

(assert (=> b!408734 (=> (not res!236540) (not e!245296))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408734 (= res!236540 (or (= (select (arr!11808 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11808 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408735 () Bool)

(declare-fun res!236538 () Bool)

(assert (=> b!408735 (=> (not res!236538) (not e!245296))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408735 (= res!236538 (validMask!0 mask!1025))))

(declare-fun b!408736 () Bool)

(declare-fun res!236543 () Bool)

(assert (=> b!408736 (=> (not res!236543) (not e!245296))))

(assert (=> b!408736 (= res!236543 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12160 _keys!709))))))

(declare-fun b!408737 () Bool)

(declare-fun e!245298 () Bool)

(assert (=> b!408737 (= e!245296 e!245298)))

(declare-fun res!236542 () Bool)

(assert (=> b!408737 (=> (not res!236542) (not e!245298))))

(declare-fun lt!188842 () array!24717)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24717 (_ BitVec 32)) Bool)

(assert (=> b!408737 (= res!236542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188842 mask!1025))))

(assert (=> b!408737 (= lt!188842 (array!24718 (store (arr!11808 _keys!709) i!563 k!794) (size!12160 _keys!709)))))

(declare-fun b!408738 () Bool)

(declare-fun res!236544 () Bool)

(assert (=> b!408738 (=> (not res!236544) (not e!245296))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408738 (= res!236544 (and (= (size!12161 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12160 _keys!709) (size!12161 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408739 () Bool)

(declare-fun res!236539 () Bool)

(assert (=> b!408739 (=> (not res!236539) (not e!245296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408739 (= res!236539 (validKeyInArray!0 k!794))))

(declare-fun res!236545 () Bool)

(assert (=> start!39002 (=> (not res!236545) (not e!245296))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39002 (= res!236545 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12160 _keys!709))))))

(assert (=> start!39002 e!245296))

(assert (=> start!39002 true))

(declare-fun e!245294 () Bool)

(declare-fun array_inv!8616 (array!24719) Bool)

(assert (=> start!39002 (and (array_inv!8616 _values!549) e!245294)))

(declare-fun array_inv!8617 (array!24717) Bool)

(assert (=> start!39002 (array_inv!8617 _keys!709)))

(declare-fun mapIsEmpty!17253 () Bool)

(assert (=> mapIsEmpty!17253 mapRes!17253))

(declare-fun b!408740 () Bool)

(declare-fun res!236546 () Bool)

(assert (=> b!408740 (=> (not res!236546) (not e!245296))))

(assert (=> b!408740 (= res!236546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408741 () Bool)

(declare-fun e!245293 () Bool)

(assert (=> b!408741 (= e!245293 tp_is_empty!10421)))

(declare-fun b!408742 () Bool)

(assert (=> b!408742 (= e!245298 false)))

(declare-fun lt!188843 () Bool)

(assert (=> b!408742 (= lt!188843 (arrayNoDuplicates!0 lt!188842 #b00000000000000000000000000000000 Nil!6836))))

(declare-fun b!408743 () Bool)

(assert (=> b!408743 (= e!245294 (and e!245293 mapRes!17253))))

(declare-fun condMapEmpty!17253 () Bool)

(declare-fun mapDefault!17253 () ValueCell!4867)

