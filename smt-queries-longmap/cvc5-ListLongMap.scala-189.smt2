; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3754 () Bool)

(assert start!3754)

(declare-fun b!26180 () Bool)

(declare-fun res!15565 () Bool)

(declare-fun e!17007 () Bool)

(assert (=> b!26180 (=> (not res!15565) (not e!17007))))

(declare-datatypes ((array!1397 0))(
  ( (array!1398 (arr!656 (Array (_ BitVec 32) (_ BitVec 64))) (size!757 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1397)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1397 (_ BitVec 32)) Bool)

(assert (=> b!26180 (= res!15565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1129 () Bool)

(declare-fun mapRes!1129 () Bool)

(assert (=> mapIsEmpty!1129 mapRes!1129))

(declare-fun b!26181 () Bool)

(declare-fun res!15566 () Bool)

(assert (=> b!26181 (=> (not res!15566) (not e!17007))))

(declare-datatypes ((V!1259 0))(
  ( (V!1260 (val!564 Int)) )
))
(declare-datatypes ((ValueCell!338 0))(
  ( (ValueCellFull!338 (v!1650 V!1259)) (EmptyCell!338) )
))
(declare-datatypes ((array!1399 0))(
  ( (array!1400 (arr!657 (Array (_ BitVec 32) ValueCell!338)) (size!758 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1399)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26181 (= res!15566 (and (= (size!758 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!757 _keys!1833) (size!758 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1129 () Bool)

(declare-fun tp!3649 () Bool)

(declare-fun e!17005 () Bool)

(assert (=> mapNonEmpty!1129 (= mapRes!1129 (and tp!3649 e!17005))))

(declare-fun mapRest!1129 () (Array (_ BitVec 32) ValueCell!338))

(declare-fun mapValue!1129 () ValueCell!338)

(declare-fun mapKey!1129 () (_ BitVec 32))

(assert (=> mapNonEmpty!1129 (= (arr!657 _values!1501) (store mapRest!1129 mapKey!1129 mapValue!1129))))

(declare-fun b!26182 () Bool)

(declare-fun tp_is_empty!1075 () Bool)

(assert (=> b!26182 (= e!17005 tp_is_empty!1075)))

(declare-fun res!15567 () Bool)

(assert (=> start!3754 (=> (not res!15567) (not e!17007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3754 (= res!15567 (validMask!0 mask!2294))))

(assert (=> start!3754 e!17007))

(assert (=> start!3754 true))

(declare-fun e!17006 () Bool)

(declare-fun array_inv!445 (array!1399) Bool)

(assert (=> start!3754 (and (array_inv!445 _values!1501) e!17006)))

(declare-fun array_inv!446 (array!1397) Bool)

(assert (=> start!3754 (array_inv!446 _keys!1833)))

(declare-fun b!26183 () Bool)

(declare-fun e!17009 () Bool)

(assert (=> b!26183 (= e!17006 (and e!17009 mapRes!1129))))

(declare-fun condMapEmpty!1129 () Bool)

(declare-fun mapDefault!1129 () ValueCell!338)

