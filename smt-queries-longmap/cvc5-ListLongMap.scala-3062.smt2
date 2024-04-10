; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43214 () Bool)

(assert start!43214)

(declare-fun mapNonEmpty!22099 () Bool)

(declare-fun mapRes!22099 () Bool)

(declare-fun tp!42574 () Bool)

(declare-fun e!281673 () Bool)

(assert (=> mapNonEmpty!22099 (= mapRes!22099 (and tp!42574 e!281673))))

(declare-datatypes ((V!19209 0))(
  ( (V!19210 (val!6849 Int)) )
))
(declare-datatypes ((ValueCell!6440 0))(
  ( (ValueCellFull!6440 (v!9138 V!19209)) (EmptyCell!6440) )
))
(declare-fun mapRest!22099 () (Array (_ BitVec 32) ValueCell!6440))

(declare-fun mapValue!22099 () ValueCell!6440)

(declare-datatypes ((array!30883 0))(
  ( (array!30884 (arr!14849 (Array (_ BitVec 32) ValueCell!6440)) (size!15207 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30883)

(declare-fun mapKey!22099 () (_ BitVec 32))

(assert (=> mapNonEmpty!22099 (= (arr!14849 _values!1516) (store mapRest!22099 mapKey!22099 mapValue!22099))))

(declare-fun b!478913 () Bool)

(declare-fun res!285703 () Bool)

(declare-fun e!281672 () Bool)

(assert (=> b!478913 (=> (not res!285703) (not e!281672))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30885 0))(
  ( (array!30886 (arr!14850 (Array (_ BitVec 32) (_ BitVec 64))) (size!15208 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30885)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478913 (= res!285703 (and (= (size!15207 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15208 _keys!1874) (size!15207 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478914 () Bool)

(declare-fun e!281669 () Bool)

(declare-fun tp_is_empty!13603 () Bool)

(assert (=> b!478914 (= e!281669 tp_is_empty!13603)))

(declare-fun b!478915 () Bool)

(assert (=> b!478915 (= e!281673 tp_is_empty!13603)))

(declare-fun b!478916 () Bool)

(declare-fun res!285705 () Bool)

(assert (=> b!478916 (=> (not res!285705) (not e!281672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30885 (_ BitVec 32)) Bool)

(assert (=> b!478916 (= res!285705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285704 () Bool)

(assert (=> start!43214 (=> (not res!285704) (not e!281672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43214 (= res!285704 (validMask!0 mask!2352))))

(assert (=> start!43214 e!281672))

(assert (=> start!43214 true))

(declare-fun e!281670 () Bool)

(declare-fun array_inv!10714 (array!30883) Bool)

(assert (=> start!43214 (and (array_inv!10714 _values!1516) e!281670)))

(declare-fun array_inv!10715 (array!30885) Bool)

(assert (=> start!43214 (array_inv!10715 _keys!1874)))

(declare-fun b!478912 () Bool)

(assert (=> b!478912 (= e!281672 false)))

(declare-fun lt!217789 () Bool)

(declare-datatypes ((List!9075 0))(
  ( (Nil!9072) (Cons!9071 (h!9927 (_ BitVec 64)) (t!15281 List!9075)) )
))
(declare-fun arrayNoDuplicates!0 (array!30885 (_ BitVec 32) List!9075) Bool)

(assert (=> b!478912 (= lt!217789 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9072))))

(declare-fun mapIsEmpty!22099 () Bool)

(assert (=> mapIsEmpty!22099 mapRes!22099))

(declare-fun b!478917 () Bool)

(assert (=> b!478917 (= e!281670 (and e!281669 mapRes!22099))))

(declare-fun condMapEmpty!22099 () Bool)

(declare-fun mapDefault!22099 () ValueCell!6440)

