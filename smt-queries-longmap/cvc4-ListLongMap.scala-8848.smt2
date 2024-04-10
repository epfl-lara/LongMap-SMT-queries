; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107316 () Bool)

(assert start!107316)

(declare-fun mapNonEmpty!51088 () Bool)

(declare-fun mapRes!51088 () Bool)

(declare-fun tp!97429 () Bool)

(declare-fun e!725370 () Bool)

(assert (=> mapNonEmpty!51088 (= mapRes!51088 (and tp!97429 e!725370))))

(declare-datatypes ((V!49199 0))(
  ( (V!49200 (val!16577 Int)) )
))
(declare-datatypes ((ValueCell!15649 0))(
  ( (ValueCellFull!15649 (v!19214 V!49199)) (EmptyCell!15649) )
))
(declare-datatypes ((array!83258 0))(
  ( (array!83259 (arr!40166 (Array (_ BitVec 32) ValueCell!15649)) (size!40702 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83258)

(declare-fun mapRest!51088 () (Array (_ BitVec 32) ValueCell!15649))

(declare-fun mapValue!51088 () ValueCell!15649)

(declare-fun mapKey!51088 () (_ BitVec 32))

(assert (=> mapNonEmpty!51088 (= (arr!40166 _values!1134) (store mapRest!51088 mapKey!51088 mapValue!51088))))

(declare-fun b!1271867 () Bool)

(declare-fun res!846128 () Bool)

(declare-fun e!725372 () Bool)

(assert (=> b!1271867 (=> (not res!846128) (not e!725372))))

(declare-datatypes ((array!83260 0))(
  ( (array!83261 (arr!40167 (Array (_ BitVec 32) (_ BitVec 64))) (size!40703 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83260)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83260 (_ BitVec 32)) Bool)

(assert (=> b!1271867 (= res!846128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271868 () Bool)

(declare-fun e!725371 () Bool)

(declare-fun tp_is_empty!33005 () Bool)

(assert (=> b!1271868 (= e!725371 tp_is_empty!33005)))

(declare-fun b!1271869 () Bool)

(assert (=> b!1271869 (= e!725372 false)))

(declare-fun lt!574944 () Bool)

(declare-datatypes ((List!28542 0))(
  ( (Nil!28539) (Cons!28538 (h!29747 (_ BitVec 64)) (t!42071 List!28542)) )
))
(declare-fun arrayNoDuplicates!0 (array!83260 (_ BitVec 32) List!28542) Bool)

(assert (=> b!1271869 (= lt!574944 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28539))))

(declare-fun res!846126 () Bool)

(assert (=> start!107316 (=> (not res!846126) (not e!725372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107316 (= res!846126 (validMask!0 mask!1730))))

(assert (=> start!107316 e!725372))

(declare-fun e!725369 () Bool)

(declare-fun array_inv!30553 (array!83258) Bool)

(assert (=> start!107316 (and (array_inv!30553 _values!1134) e!725369)))

(assert (=> start!107316 true))

(declare-fun array_inv!30554 (array!83260) Bool)

(assert (=> start!107316 (array_inv!30554 _keys!1364)))

(declare-fun b!1271870 () Bool)

(assert (=> b!1271870 (= e!725369 (and e!725371 mapRes!51088))))

(declare-fun condMapEmpty!51088 () Bool)

(declare-fun mapDefault!51088 () ValueCell!15649)

