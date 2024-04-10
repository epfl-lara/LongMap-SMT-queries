; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43206 () Bool)

(assert start!43206)

(declare-fun b!478840 () Bool)

(declare-fun e!281611 () Bool)

(declare-fun tp_is_empty!13595 () Bool)

(assert (=> b!478840 (= e!281611 tp_is_empty!13595)))

(declare-fun b!478841 () Bool)

(declare-fun e!281613 () Bool)

(assert (=> b!478841 (= e!281613 false)))

(declare-fun lt!217777 () Bool)

(declare-datatypes ((array!30867 0))(
  ( (array!30868 (arr!14841 (Array (_ BitVec 32) (_ BitVec 64))) (size!15199 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30867)

(declare-datatypes ((List!9071 0))(
  ( (Nil!9068) (Cons!9067 (h!9923 (_ BitVec 64)) (t!15277 List!9071)) )
))
(declare-fun arrayNoDuplicates!0 (array!30867 (_ BitVec 32) List!9071) Bool)

(assert (=> b!478841 (= lt!217777 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9068))))

(declare-fun mapIsEmpty!22087 () Bool)

(declare-fun mapRes!22087 () Bool)

(assert (=> mapIsEmpty!22087 mapRes!22087))

(declare-fun b!478842 () Bool)

(declare-fun res!285668 () Bool)

(assert (=> b!478842 (=> (not res!285668) (not e!281613))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19197 0))(
  ( (V!19198 (val!6845 Int)) )
))
(declare-datatypes ((ValueCell!6436 0))(
  ( (ValueCellFull!6436 (v!9134 V!19197)) (EmptyCell!6436) )
))
(declare-datatypes ((array!30869 0))(
  ( (array!30870 (arr!14842 (Array (_ BitVec 32) ValueCell!6436)) (size!15200 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30869)

(assert (=> b!478842 (= res!285668 (and (= (size!15200 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15199 _keys!1874) (size!15200 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22087 () Bool)

(declare-fun tp!42562 () Bool)

(declare-fun e!281612 () Bool)

(assert (=> mapNonEmpty!22087 (= mapRes!22087 (and tp!42562 e!281612))))

(declare-fun mapValue!22087 () ValueCell!6436)

(declare-fun mapKey!22087 () (_ BitVec 32))

(declare-fun mapRest!22087 () (Array (_ BitVec 32) ValueCell!6436))

(assert (=> mapNonEmpty!22087 (= (arr!14842 _values!1516) (store mapRest!22087 mapKey!22087 mapValue!22087))))

(declare-fun b!478843 () Bool)

(assert (=> b!478843 (= e!281612 tp_is_empty!13595)))

(declare-fun b!478844 () Bool)

(declare-fun res!285669 () Bool)

(assert (=> b!478844 (=> (not res!285669) (not e!281613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30867 (_ BitVec 32)) Bool)

(assert (=> b!478844 (= res!285669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285667 () Bool)

(assert (=> start!43206 (=> (not res!285667) (not e!281613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43206 (= res!285667 (validMask!0 mask!2352))))

(assert (=> start!43206 e!281613))

(assert (=> start!43206 true))

(declare-fun e!281610 () Bool)

(declare-fun array_inv!10706 (array!30869) Bool)

(assert (=> start!43206 (and (array_inv!10706 _values!1516) e!281610)))

(declare-fun array_inv!10707 (array!30867) Bool)

(assert (=> start!43206 (array_inv!10707 _keys!1874)))

(declare-fun b!478845 () Bool)

(assert (=> b!478845 (= e!281610 (and e!281611 mapRes!22087))))

(declare-fun condMapEmpty!22087 () Bool)

(declare-fun mapDefault!22087 () ValueCell!6436)

