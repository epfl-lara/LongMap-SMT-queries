; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43300 () Bool)

(assert start!43300)

(declare-fun b_free!12167 () Bool)

(declare-fun b_next!12167 () Bool)

(assert (=> start!43300 (= b_free!12167 (not b_next!12167))))

(declare-fun tp!42771 () Bool)

(declare-fun b_and!20919 () Bool)

(assert (=> start!43300 (= tp!42771 b_and!20919)))

(declare-fun b!479720 () Bool)

(declare-fun e!282266 () Bool)

(assert (=> b!479720 (= e!282266 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19309 0))(
  ( (V!19310 (val!6887 Int)) )
))
(declare-fun minValue!1458 () V!19309)

(declare-fun lt!217903 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19309)

(declare-datatypes ((ValueCell!6478 0))(
  ( (ValueCellFull!6478 (v!9176 V!19309)) (EmptyCell!6478) )
))
(declare-datatypes ((array!31025 0))(
  ( (array!31026 (arr!14919 (Array (_ BitVec 32) ValueCell!6478)) (size!15277 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31025)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31027 0))(
  ( (array!31028 (arr!14920 (Array (_ BitVec 32) (_ BitVec 64))) (size!15278 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31027)

(declare-datatypes ((tuple2!9040 0))(
  ( (tuple2!9041 (_1!4531 (_ BitVec 64)) (_2!4531 V!19309)) )
))
(declare-datatypes ((List!9118 0))(
  ( (Nil!9115) (Cons!9114 (h!9970 tuple2!9040) (t!15324 List!9118)) )
))
(declare-datatypes ((ListLongMap!7953 0))(
  ( (ListLongMap!7954 (toList!3992 List!9118)) )
))
(declare-fun contains!2602 (ListLongMap!7953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2311 (array!31027 array!31025 (_ BitVec 32) (_ BitVec 32) V!19309 V!19309 (_ BitVec 32) Int) ListLongMap!7953)

(assert (=> b!479720 (= lt!217903 (contains!2602 (getCurrentListMap!2311 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapIsEmpty!22216 () Bool)

(declare-fun mapRes!22216 () Bool)

(assert (=> mapIsEmpty!22216 mapRes!22216))

(declare-fun res!286150 () Bool)

(assert (=> start!43300 (=> (not res!286150) (not e!282266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43300 (= res!286150 (validMask!0 mask!2352))))

(assert (=> start!43300 e!282266))

(assert (=> start!43300 true))

(declare-fun tp_is_empty!13679 () Bool)

(assert (=> start!43300 tp_is_empty!13679))

(declare-fun e!282267 () Bool)

(declare-fun array_inv!10762 (array!31025) Bool)

(assert (=> start!43300 (and (array_inv!10762 _values!1516) e!282267)))

(assert (=> start!43300 tp!42771))

(declare-fun array_inv!10763 (array!31027) Bool)

(assert (=> start!43300 (array_inv!10763 _keys!1874)))

(declare-fun b!479721 () Bool)

(declare-fun res!286149 () Bool)

(assert (=> b!479721 (=> (not res!286149) (not e!282266))))

(declare-datatypes ((List!9119 0))(
  ( (Nil!9116) (Cons!9115 (h!9971 (_ BitVec 64)) (t!15325 List!9119)) )
))
(declare-fun arrayNoDuplicates!0 (array!31027 (_ BitVec 32) List!9119) Bool)

(assert (=> b!479721 (= res!286149 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9116))))

(declare-fun b!479722 () Bool)

(declare-fun res!286152 () Bool)

(assert (=> b!479722 (=> (not res!286152) (not e!282266))))

(assert (=> b!479722 (= res!286152 (and (= (size!15277 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15278 _keys!1874) (size!15277 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479723 () Bool)

(declare-fun e!282269 () Bool)

(assert (=> b!479723 (= e!282269 tp_is_empty!13679)))

(declare-fun b!479724 () Bool)

(declare-fun e!282268 () Bool)

(assert (=> b!479724 (= e!282268 tp_is_empty!13679)))

(declare-fun mapNonEmpty!22216 () Bool)

(declare-fun tp!42772 () Bool)

(assert (=> mapNonEmpty!22216 (= mapRes!22216 (and tp!42772 e!282268))))

(declare-fun mapKey!22216 () (_ BitVec 32))

(declare-fun mapValue!22216 () ValueCell!6478)

(declare-fun mapRest!22216 () (Array (_ BitVec 32) ValueCell!6478))

(assert (=> mapNonEmpty!22216 (= (arr!14919 _values!1516) (store mapRest!22216 mapKey!22216 mapValue!22216))))

(declare-fun b!479725 () Bool)

(assert (=> b!479725 (= e!282267 (and e!282269 mapRes!22216))))

(declare-fun condMapEmpty!22216 () Bool)

(declare-fun mapDefault!22216 () ValueCell!6478)

