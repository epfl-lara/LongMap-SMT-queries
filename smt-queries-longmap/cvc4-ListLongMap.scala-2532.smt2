; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39014 () Bool)

(assert start!39014)

(declare-fun b!408965 () Bool)

(declare-fun res!236723 () Bool)

(declare-fun e!245404 () Bool)

(assert (=> b!408965 (=> (not res!236723) (not e!245404))))

(declare-datatypes ((array!24739 0))(
  ( (array!24740 (arr!11819 (Array (_ BitVec 32) (_ BitVec 64))) (size!12171 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24739)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408965 (= res!236723 (or (= (select (arr!11819 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11819 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!236721 () Bool)

(assert (=> start!39014 (=> (not res!236721) (not e!245404))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39014 (= res!236721 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12171 _keys!709))))))

(assert (=> start!39014 e!245404))

(assert (=> start!39014 true))

(declare-datatypes ((V!15015 0))(
  ( (V!15016 (val!5261 Int)) )
))
(declare-datatypes ((ValueCell!4873 0))(
  ( (ValueCellFull!4873 (v!7508 V!15015)) (EmptyCell!4873) )
))
(declare-datatypes ((array!24741 0))(
  ( (array!24742 (arr!11820 (Array (_ BitVec 32) ValueCell!4873)) (size!12172 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24741)

(declare-fun e!245405 () Bool)

(declare-fun array_inv!8624 (array!24741) Bool)

(assert (=> start!39014 (and (array_inv!8624 _values!549) e!245405)))

(declare-fun array_inv!8625 (array!24739) Bool)

(assert (=> start!39014 (array_inv!8625 _keys!709)))

(declare-fun b!408966 () Bool)

(declare-fun res!236725 () Bool)

(assert (=> b!408966 (=> (not res!236725) (not e!245404))))

(declare-datatypes ((List!6844 0))(
  ( (Nil!6841) (Cons!6840 (h!7696 (_ BitVec 64)) (t!12018 List!6844)) )
))
(declare-fun arrayNoDuplicates!0 (array!24739 (_ BitVec 32) List!6844) Bool)

(assert (=> b!408966 (= res!236725 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6841))))

(declare-fun b!408967 () Bool)

(declare-fun res!236722 () Bool)

(assert (=> b!408967 (=> (not res!236722) (not e!245404))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408967 (= res!236722 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17271 () Bool)

(declare-fun mapRes!17271 () Bool)

(declare-fun tp!33390 () Bool)

(declare-fun e!245403 () Bool)

(assert (=> mapNonEmpty!17271 (= mapRes!17271 (and tp!33390 e!245403))))

(declare-fun mapValue!17271 () ValueCell!4873)

(declare-fun mapKey!17271 () (_ BitVec 32))

(declare-fun mapRest!17271 () (Array (_ BitVec 32) ValueCell!4873))

(assert (=> mapNonEmpty!17271 (= (arr!11820 _values!549) (store mapRest!17271 mapKey!17271 mapValue!17271))))

(declare-fun b!408968 () Bool)

(declare-fun res!236720 () Bool)

(assert (=> b!408968 (=> (not res!236720) (not e!245404))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408968 (= res!236720 (validKeyInArray!0 k!794))))

(declare-fun b!408969 () Bool)

(declare-fun tp_is_empty!10433 () Bool)

(assert (=> b!408969 (= e!245403 tp_is_empty!10433)))

(declare-fun b!408970 () Bool)

(declare-fun res!236726 () Bool)

(assert (=> b!408970 (=> (not res!236726) (not e!245404))))

(assert (=> b!408970 (= res!236726 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12171 _keys!709))))))

(declare-fun mapIsEmpty!17271 () Bool)

(assert (=> mapIsEmpty!17271 mapRes!17271))

(declare-fun b!408971 () Bool)

(declare-fun res!236718 () Bool)

(assert (=> b!408971 (=> (not res!236718) (not e!245404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24739 (_ BitVec 32)) Bool)

(assert (=> b!408971 (= res!236718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408972 () Bool)

(declare-fun res!236719 () Bool)

(assert (=> b!408972 (=> (not res!236719) (not e!245404))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408972 (= res!236719 (and (= (size!12172 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12171 _keys!709) (size!12172 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408973 () Bool)

(declare-fun e!245401 () Bool)

(assert (=> b!408973 (= e!245401 false)))

(declare-fun lt!188878 () Bool)

(declare-fun lt!188879 () array!24739)

(assert (=> b!408973 (= lt!188878 (arrayNoDuplicates!0 lt!188879 #b00000000000000000000000000000000 Nil!6841))))

(declare-fun b!408974 () Bool)

(assert (=> b!408974 (= e!245404 e!245401)))

(declare-fun res!236724 () Bool)

(assert (=> b!408974 (=> (not res!236724) (not e!245401))))

(assert (=> b!408974 (= res!236724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188879 mask!1025))))

(assert (=> b!408974 (= lt!188879 (array!24740 (store (arr!11819 _keys!709) i!563 k!794) (size!12171 _keys!709)))))

(declare-fun b!408975 () Bool)

(declare-fun e!245402 () Bool)

(assert (=> b!408975 (= e!245402 tp_is_empty!10433)))

(declare-fun b!408976 () Bool)

(assert (=> b!408976 (= e!245405 (and e!245402 mapRes!17271))))

(declare-fun condMapEmpty!17271 () Bool)

(declare-fun mapDefault!17271 () ValueCell!4873)

