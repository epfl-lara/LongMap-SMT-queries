; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40430 () Bool)

(assert start!40430)

(declare-fun b!444731 () Bool)

(declare-fun res!263761 () Bool)

(declare-fun e!261510 () Bool)

(assert (=> b!444731 (=> (not res!263761) (not e!261510))))

(declare-datatypes ((array!27437 0))(
  ( (array!27438 (arr!13166 (Array (_ BitVec 32) (_ BitVec 64))) (size!13518 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27437)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444731 (= res!263761 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!444732 () Bool)

(declare-fun e!261509 () Bool)

(assert (=> b!444732 (= e!261509 false)))

(declare-fun lt!203536 () Bool)

(declare-fun lt!203537 () array!27437)

(declare-datatypes ((List!7877 0))(
  ( (Nil!7874) (Cons!7873 (h!8729 (_ BitVec 64)) (t!13635 List!7877)) )
))
(declare-fun arrayNoDuplicates!0 (array!27437 (_ BitVec 32) List!7877) Bool)

(assert (=> b!444732 (= lt!203536 (arrayNoDuplicates!0 lt!203537 #b00000000000000000000000000000000 Nil!7874))))

(declare-fun b!444733 () Bool)

(declare-fun e!261511 () Bool)

(declare-fun tp_is_empty!11815 () Bool)

(assert (=> b!444733 (= e!261511 tp_is_empty!11815)))

(declare-fun b!444734 () Bool)

(declare-fun res!263764 () Bool)

(assert (=> b!444734 (=> (not res!263764) (not e!261510))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444734 (= res!263764 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13518 _keys!709))))))

(declare-fun b!444735 () Bool)

(declare-fun res!263768 () Bool)

(assert (=> b!444735 (=> (not res!263768) (not e!261510))))

(declare-datatypes ((V!16859 0))(
  ( (V!16860 (val!5952 Int)) )
))
(declare-datatypes ((ValueCell!5564 0))(
  ( (ValueCellFull!5564 (v!8203 V!16859)) (EmptyCell!5564) )
))
(declare-datatypes ((array!27439 0))(
  ( (array!27440 (arr!13167 (Array (_ BitVec 32) ValueCell!5564)) (size!13519 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27439)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444735 (= res!263768 (and (= (size!13519 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13518 _keys!709) (size!13519 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444736 () Bool)

(declare-fun res!263767 () Bool)

(assert (=> b!444736 (=> (not res!263767) (not e!261510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27437 (_ BitVec 32)) Bool)

(assert (=> b!444736 (= res!263767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444738 () Bool)

(assert (=> b!444738 (= e!261510 e!261509)))

(declare-fun res!263765 () Bool)

(assert (=> b!444738 (=> (not res!263765) (not e!261509))))

(assert (=> b!444738 (= res!263765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203537 mask!1025))))

(assert (=> b!444738 (= lt!203537 (array!27438 (store (arr!13166 _keys!709) i!563 k!794) (size!13518 _keys!709)))))

(declare-fun mapIsEmpty!19350 () Bool)

(declare-fun mapRes!19350 () Bool)

(assert (=> mapIsEmpty!19350 mapRes!19350))

(declare-fun mapNonEmpty!19350 () Bool)

(declare-fun tp!37332 () Bool)

(assert (=> mapNonEmpty!19350 (= mapRes!19350 (and tp!37332 e!261511))))

(declare-fun mapKey!19350 () (_ BitVec 32))

(declare-fun mapValue!19350 () ValueCell!5564)

(declare-fun mapRest!19350 () (Array (_ BitVec 32) ValueCell!5564))

(assert (=> mapNonEmpty!19350 (= (arr!13167 _values!549) (store mapRest!19350 mapKey!19350 mapValue!19350))))

(declare-fun b!444739 () Bool)

(declare-fun res!263762 () Bool)

(assert (=> b!444739 (=> (not res!263762) (not e!261510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444739 (= res!263762 (validKeyInArray!0 k!794))))

(declare-fun b!444740 () Bool)

(declare-fun e!261512 () Bool)

(declare-fun e!261508 () Bool)

(assert (=> b!444740 (= e!261512 (and e!261508 mapRes!19350))))

(declare-fun condMapEmpty!19350 () Bool)

(declare-fun mapDefault!19350 () ValueCell!5564)

