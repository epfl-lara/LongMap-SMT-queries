; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43208 () Bool)

(assert start!43208)

(declare-fun b!478858 () Bool)

(declare-fun res!285678 () Bool)

(declare-fun e!281625 () Bool)

(assert (=> b!478858 (=> (not res!285678) (not e!281625))))

(declare-datatypes ((array!30871 0))(
  ( (array!30872 (arr!14843 (Array (_ BitVec 32) (_ BitVec 64))) (size!15201 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30871)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30871 (_ BitVec 32)) Bool)

(assert (=> b!478858 (= res!285678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478859 () Bool)

(assert (=> b!478859 (= e!281625 false)))

(declare-fun lt!217780 () Bool)

(declare-datatypes ((List!9072 0))(
  ( (Nil!9069) (Cons!9068 (h!9924 (_ BitVec 64)) (t!15278 List!9072)) )
))
(declare-fun arrayNoDuplicates!0 (array!30871 (_ BitVec 32) List!9072) Bool)

(assert (=> b!478859 (= lt!217780 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9069))))

(declare-fun mapIsEmpty!22090 () Bool)

(declare-fun mapRes!22090 () Bool)

(assert (=> mapIsEmpty!22090 mapRes!22090))

(declare-fun b!478860 () Bool)

(declare-fun e!281624 () Bool)

(declare-fun tp_is_empty!13597 () Bool)

(assert (=> b!478860 (= e!281624 tp_is_empty!13597)))

(declare-fun res!285676 () Bool)

(assert (=> start!43208 (=> (not res!285676) (not e!281625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43208 (= res!285676 (validMask!0 mask!2352))))

(assert (=> start!43208 e!281625))

(assert (=> start!43208 true))

(declare-datatypes ((V!19201 0))(
  ( (V!19202 (val!6846 Int)) )
))
(declare-datatypes ((ValueCell!6437 0))(
  ( (ValueCellFull!6437 (v!9135 V!19201)) (EmptyCell!6437) )
))
(declare-datatypes ((array!30873 0))(
  ( (array!30874 (arr!14844 (Array (_ BitVec 32) ValueCell!6437)) (size!15202 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30873)

(declare-fun e!281627 () Bool)

(declare-fun array_inv!10708 (array!30873) Bool)

(assert (=> start!43208 (and (array_inv!10708 _values!1516) e!281627)))

(declare-fun array_inv!10709 (array!30871) Bool)

(assert (=> start!43208 (array_inv!10709 _keys!1874)))

(declare-fun mapNonEmpty!22090 () Bool)

(declare-fun tp!42565 () Bool)

(assert (=> mapNonEmpty!22090 (= mapRes!22090 (and tp!42565 e!281624))))

(declare-fun mapKey!22090 () (_ BitVec 32))

(declare-fun mapRest!22090 () (Array (_ BitVec 32) ValueCell!6437))

(declare-fun mapValue!22090 () ValueCell!6437)

(assert (=> mapNonEmpty!22090 (= (arr!14844 _values!1516) (store mapRest!22090 mapKey!22090 mapValue!22090))))

(declare-fun b!478861 () Bool)

(declare-fun e!281626 () Bool)

(assert (=> b!478861 (= e!281626 tp_is_empty!13597)))

(declare-fun b!478862 () Bool)

(declare-fun res!285677 () Bool)

(assert (=> b!478862 (=> (not res!285677) (not e!281625))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478862 (= res!285677 (and (= (size!15202 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15201 _keys!1874) (size!15202 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478863 () Bool)

(assert (=> b!478863 (= e!281627 (and e!281626 mapRes!22090))))

(declare-fun condMapEmpty!22090 () Bool)

(declare-fun mapDefault!22090 () ValueCell!6437)

