; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43196 () Bool)

(assert start!43196)

(declare-fun res!285623 () Bool)

(declare-fun e!281537 () Bool)

(assert (=> start!43196 (=> (not res!285623) (not e!281537))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43196 (= res!285623 (validMask!0 mask!2352))))

(assert (=> start!43196 e!281537))

(assert (=> start!43196 true))

(declare-datatypes ((V!19185 0))(
  ( (V!19186 (val!6840 Int)) )
))
(declare-datatypes ((ValueCell!6431 0))(
  ( (ValueCellFull!6431 (v!9129 V!19185)) (EmptyCell!6431) )
))
(declare-datatypes ((array!30847 0))(
  ( (array!30848 (arr!14831 (Array (_ BitVec 32) ValueCell!6431)) (size!15189 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30847)

(declare-fun e!281538 () Bool)

(declare-fun array_inv!10700 (array!30847) Bool)

(assert (=> start!43196 (and (array_inv!10700 _values!1516) e!281538)))

(declare-datatypes ((array!30849 0))(
  ( (array!30850 (arr!14832 (Array (_ BitVec 32) (_ BitVec 64))) (size!15190 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30849)

(declare-fun array_inv!10701 (array!30849) Bool)

(assert (=> start!43196 (array_inv!10701 _keys!1874)))

(declare-fun mapNonEmpty!22072 () Bool)

(declare-fun mapRes!22072 () Bool)

(declare-fun tp!42547 () Bool)

(declare-fun e!281534 () Bool)

(assert (=> mapNonEmpty!22072 (= mapRes!22072 (and tp!42547 e!281534))))

(declare-fun mapValue!22072 () ValueCell!6431)

(declare-fun mapKey!22072 () (_ BitVec 32))

(declare-fun mapRest!22072 () (Array (_ BitVec 32) ValueCell!6431))

(assert (=> mapNonEmpty!22072 (= (arr!14831 _values!1516) (store mapRest!22072 mapKey!22072 mapValue!22072))))

(declare-fun b!478750 () Bool)

(declare-fun res!285624 () Bool)

(assert (=> b!478750 (=> (not res!285624) (not e!281537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30849 (_ BitVec 32)) Bool)

(assert (=> b!478750 (= res!285624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478751 () Bool)

(declare-fun res!285622 () Bool)

(assert (=> b!478751 (=> (not res!285622) (not e!281537))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478751 (= res!285622 (and (= (size!15189 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15190 _keys!1874) (size!15189 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478752 () Bool)

(declare-fun e!281535 () Bool)

(declare-fun tp_is_empty!13585 () Bool)

(assert (=> b!478752 (= e!281535 tp_is_empty!13585)))

(declare-fun b!478753 () Bool)

(assert (=> b!478753 (= e!281538 (and e!281535 mapRes!22072))))

(declare-fun condMapEmpty!22072 () Bool)

(declare-fun mapDefault!22072 () ValueCell!6431)

