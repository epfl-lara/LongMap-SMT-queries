; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43212 () Bool)

(assert start!43212)

(declare-fun b!478894 () Bool)

(declare-fun e!281656 () Bool)

(assert (=> b!478894 (= e!281656 false)))

(declare-fun lt!217786 () Bool)

(declare-datatypes ((array!30879 0))(
  ( (array!30880 (arr!14847 (Array (_ BitVec 32) (_ BitVec 64))) (size!15205 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30879)

(declare-datatypes ((List!9074 0))(
  ( (Nil!9071) (Cons!9070 (h!9926 (_ BitVec 64)) (t!15280 List!9074)) )
))
(declare-fun arrayNoDuplicates!0 (array!30879 (_ BitVec 32) List!9074) Bool)

(assert (=> b!478894 (= lt!217786 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9071))))

(declare-fun b!478895 () Bool)

(declare-fun res!285695 () Bool)

(assert (=> b!478895 (=> (not res!285695) (not e!281656))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30879 (_ BitVec 32)) Bool)

(assert (=> b!478895 (= res!285695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478896 () Bool)

(declare-fun e!281655 () Bool)

(declare-fun tp_is_empty!13601 () Bool)

(assert (=> b!478896 (= e!281655 tp_is_empty!13601)))

(declare-fun mapNonEmpty!22096 () Bool)

(declare-fun mapRes!22096 () Bool)

(declare-fun tp!42571 () Bool)

(assert (=> mapNonEmpty!22096 (= mapRes!22096 (and tp!42571 e!281655))))

(declare-fun mapKey!22096 () (_ BitVec 32))

(declare-datatypes ((V!19205 0))(
  ( (V!19206 (val!6848 Int)) )
))
(declare-datatypes ((ValueCell!6439 0))(
  ( (ValueCellFull!6439 (v!9137 V!19205)) (EmptyCell!6439) )
))
(declare-fun mapRest!22096 () (Array (_ BitVec 32) ValueCell!6439))

(declare-fun mapValue!22096 () ValueCell!6439)

(declare-datatypes ((array!30881 0))(
  ( (array!30882 (arr!14848 (Array (_ BitVec 32) ValueCell!6439)) (size!15206 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30881)

(assert (=> mapNonEmpty!22096 (= (arr!14848 _values!1516) (store mapRest!22096 mapKey!22096 mapValue!22096))))

(declare-fun b!478897 () Bool)

(declare-fun e!281658 () Bool)

(assert (=> b!478897 (= e!281658 tp_is_empty!13601)))

(declare-fun res!285696 () Bool)

(assert (=> start!43212 (=> (not res!285696) (not e!281656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43212 (= res!285696 (validMask!0 mask!2352))))

(assert (=> start!43212 e!281656))

(assert (=> start!43212 true))

(declare-fun e!281657 () Bool)

(declare-fun array_inv!10712 (array!30881) Bool)

(assert (=> start!43212 (and (array_inv!10712 _values!1516) e!281657)))

(declare-fun array_inv!10713 (array!30879) Bool)

(assert (=> start!43212 (array_inv!10713 _keys!1874)))

(declare-fun b!478898 () Bool)

(declare-fun res!285694 () Bool)

(assert (=> b!478898 (=> (not res!285694) (not e!281656))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478898 (= res!285694 (and (= (size!15206 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15205 _keys!1874) (size!15206 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22096 () Bool)

(assert (=> mapIsEmpty!22096 mapRes!22096))

(declare-fun b!478899 () Bool)

(assert (=> b!478899 (= e!281657 (and e!281658 mapRes!22096))))

(declare-fun condMapEmpty!22096 () Bool)

(declare-fun mapDefault!22096 () ValueCell!6439)

