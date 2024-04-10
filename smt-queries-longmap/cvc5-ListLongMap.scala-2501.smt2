; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38824 () Bool)

(assert start!38824)

(declare-fun b!405260 () Bool)

(declare-fun res!233873 () Bool)

(declare-fun e!243695 () Bool)

(assert (=> b!405260 (=> (not res!233873) (not e!243695))))

(declare-datatypes ((array!24377 0))(
  ( (array!24378 (arr!11638 (Array (_ BitVec 32) (_ BitVec 64))) (size!11990 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24377)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405260 (= res!233873 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16986 () Bool)

(declare-fun mapRes!16986 () Bool)

(declare-fun tp!33105 () Bool)

(declare-fun e!243692 () Bool)

(assert (=> mapNonEmpty!16986 (= mapRes!16986 (and tp!33105 e!243692))))

(declare-fun mapKey!16986 () (_ BitVec 32))

(declare-datatypes ((V!14763 0))(
  ( (V!14764 (val!5166 Int)) )
))
(declare-datatypes ((ValueCell!4778 0))(
  ( (ValueCellFull!4778 (v!7413 V!14763)) (EmptyCell!4778) )
))
(declare-fun mapValue!16986 () ValueCell!4778)

(declare-fun mapRest!16986 () (Array (_ BitVec 32) ValueCell!4778))

(declare-datatypes ((array!24379 0))(
  ( (array!24380 (arr!11639 (Array (_ BitVec 32) ValueCell!4778)) (size!11991 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24379)

(assert (=> mapNonEmpty!16986 (= (arr!11639 _values!549) (store mapRest!16986 mapKey!16986 mapValue!16986))))

(declare-fun res!233874 () Bool)

(assert (=> start!38824 (=> (not res!233874) (not e!243695))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38824 (= res!233874 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11990 _keys!709))))))

(assert (=> start!38824 e!243695))

(assert (=> start!38824 true))

(declare-fun e!243693 () Bool)

(declare-fun array_inv!8506 (array!24379) Bool)

(assert (=> start!38824 (and (array_inv!8506 _values!549) e!243693)))

(declare-fun array_inv!8507 (array!24377) Bool)

(assert (=> start!38824 (array_inv!8507 _keys!709)))

(declare-fun b!405261 () Bool)

(declare-fun tp_is_empty!10243 () Bool)

(assert (=> b!405261 (= e!243692 tp_is_empty!10243)))

(declare-fun b!405262 () Bool)

(declare-fun e!243694 () Bool)

(assert (=> b!405262 (= e!243695 e!243694)))

(declare-fun res!233871 () Bool)

(assert (=> b!405262 (=> (not res!233871) (not e!243694))))

(declare-fun lt!188308 () array!24377)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24377 (_ BitVec 32)) Bool)

(assert (=> b!405262 (= res!233871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188308 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405262 (= lt!188308 (array!24378 (store (arr!11638 _keys!709) i!563 k!794) (size!11990 _keys!709)))))

(declare-fun b!405263 () Bool)

(declare-fun e!243691 () Bool)

(assert (=> b!405263 (= e!243691 tp_is_empty!10243)))

(declare-fun b!405264 () Bool)

(declare-fun res!233877 () Bool)

(assert (=> b!405264 (=> (not res!233877) (not e!243695))))

(declare-datatypes ((List!6769 0))(
  ( (Nil!6766) (Cons!6765 (h!7621 (_ BitVec 64)) (t!11943 List!6769)) )
))
(declare-fun arrayNoDuplicates!0 (array!24377 (_ BitVec 32) List!6769) Bool)

(assert (=> b!405264 (= res!233877 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6766))))

(declare-fun b!405265 () Bool)

(declare-fun res!233875 () Bool)

(assert (=> b!405265 (=> (not res!233875) (not e!243695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405265 (= res!233875 (validKeyInArray!0 k!794))))

(declare-fun b!405266 () Bool)

(declare-fun res!233869 () Bool)

(assert (=> b!405266 (=> (not res!233869) (not e!243695))))

(assert (=> b!405266 (= res!233869 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11990 _keys!709))))))

(declare-fun b!405267 () Bool)

(declare-fun res!233872 () Bool)

(assert (=> b!405267 (=> (not res!233872) (not e!243695))))

(assert (=> b!405267 (= res!233872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405268 () Bool)

(declare-fun res!233870 () Bool)

(assert (=> b!405268 (=> (not res!233870) (not e!243695))))

(assert (=> b!405268 (= res!233870 (or (= (select (arr!11638 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11638 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405269 () Bool)

(assert (=> b!405269 (= e!243694 false)))

(declare-fun lt!188309 () Bool)

(assert (=> b!405269 (= lt!188309 (arrayNoDuplicates!0 lt!188308 #b00000000000000000000000000000000 Nil!6766))))

(declare-fun mapIsEmpty!16986 () Bool)

(assert (=> mapIsEmpty!16986 mapRes!16986))

(declare-fun b!405270 () Bool)

(declare-fun res!233876 () Bool)

(assert (=> b!405270 (=> (not res!233876) (not e!243695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405270 (= res!233876 (validMask!0 mask!1025))))

(declare-fun b!405271 () Bool)

(declare-fun res!233868 () Bool)

(assert (=> b!405271 (=> (not res!233868) (not e!243695))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405271 (= res!233868 (and (= (size!11991 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11990 _keys!709) (size!11991 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405272 () Bool)

(assert (=> b!405272 (= e!243693 (and e!243691 mapRes!16986))))

(declare-fun condMapEmpty!16986 () Bool)

(declare-fun mapDefault!16986 () ValueCell!4778)

