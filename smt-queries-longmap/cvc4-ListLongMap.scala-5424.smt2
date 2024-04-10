; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72332 () Bool)

(assert start!72332)

(declare-fun b!838007 () Bool)

(declare-fun res!569871 () Bool)

(declare-fun e!467788 () Bool)

(assert (=> b!838007 (=> (not res!569871) (not e!467788))))

(declare-datatypes ((array!47060 0))(
  ( (array!47061 (arr!22561 (Array (_ BitVec 32) (_ BitVec 64))) (size!23001 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47060)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47060 (_ BitVec 32)) Bool)

(assert (=> b!838007 (= res!569871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838008 () Bool)

(declare-fun e!467786 () Bool)

(declare-fun tp_is_empty!15383 () Bool)

(assert (=> b!838008 (= e!467786 tp_is_empty!15383)))

(declare-fun b!838009 () Bool)

(declare-fun res!569870 () Bool)

(assert (=> b!838009 (=> (not res!569870) (not e!467788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838009 (= res!569870 (validMask!0 mask!1196))))

(declare-fun b!838010 () Bool)

(assert (=> b!838010 (= e!467788 false)))

(declare-fun lt!380641 () Bool)

(declare-datatypes ((List!16045 0))(
  ( (Nil!16042) (Cons!16041 (h!17172 (_ BitVec 64)) (t!22416 List!16045)) )
))
(declare-fun arrayNoDuplicates!0 (array!47060 (_ BitVec 32) List!16045) Bool)

(assert (=> b!838010 (= lt!380641 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16042))))

(declare-fun mapNonEmpty!24674 () Bool)

(declare-fun mapRes!24674 () Bool)

(declare-fun tp!47668 () Bool)

(assert (=> mapNonEmpty!24674 (= mapRes!24674 (and tp!47668 e!467786))))

(declare-datatypes ((V!25557 0))(
  ( (V!25558 (val!7739 Int)) )
))
(declare-datatypes ((ValueCell!7252 0))(
  ( (ValueCellFull!7252 (v!10164 V!25557)) (EmptyCell!7252) )
))
(declare-fun mapRest!24674 () (Array (_ BitVec 32) ValueCell!7252))

(declare-fun mapKey!24674 () (_ BitVec 32))

(declare-datatypes ((array!47062 0))(
  ( (array!47063 (arr!22562 (Array (_ BitVec 32) ValueCell!7252)) (size!23002 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47062)

(declare-fun mapValue!24674 () ValueCell!7252)

(assert (=> mapNonEmpty!24674 (= (arr!22562 _values!688) (store mapRest!24674 mapKey!24674 mapValue!24674))))

(declare-fun mapIsEmpty!24674 () Bool)

(assert (=> mapIsEmpty!24674 mapRes!24674))

(declare-fun res!569872 () Bool)

(assert (=> start!72332 (=> (not res!569872) (not e!467788))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72332 (= res!569872 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23001 _keys!868))))))

(assert (=> start!72332 e!467788))

(assert (=> start!72332 true))

(declare-fun array_inv!17978 (array!47060) Bool)

(assert (=> start!72332 (array_inv!17978 _keys!868)))

(declare-fun e!467785 () Bool)

(declare-fun array_inv!17979 (array!47062) Bool)

(assert (=> start!72332 (and (array_inv!17979 _values!688) e!467785)))

(declare-fun b!838011 () Bool)

(declare-fun res!569873 () Bool)

(assert (=> b!838011 (=> (not res!569873) (not e!467788))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838011 (= res!569873 (and (= (size!23002 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23001 _keys!868) (size!23002 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838012 () Bool)

(declare-fun e!467784 () Bool)

(assert (=> b!838012 (= e!467785 (and e!467784 mapRes!24674))))

(declare-fun condMapEmpty!24674 () Bool)

(declare-fun mapDefault!24674 () ValueCell!7252)

