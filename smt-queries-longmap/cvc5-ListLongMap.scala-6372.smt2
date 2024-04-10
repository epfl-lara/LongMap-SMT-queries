; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81968 () Bool)

(assert start!81968)

(declare-fun mapIsEmpty!33472 () Bool)

(declare-fun mapRes!33472 () Bool)

(assert (=> mapIsEmpty!33472 mapRes!33472))

(declare-fun b!956095 () Bool)

(declare-fun e!538663 () Bool)

(declare-fun tp_is_empty!21007 () Bool)

(assert (=> b!956095 (= e!538663 tp_is_empty!21007)))

(declare-fun b!956096 () Bool)

(declare-fun e!538659 () Bool)

(assert (=> b!956096 (= e!538659 tp_is_empty!21007)))

(declare-fun b!956097 () Bool)

(declare-fun res!640230 () Bool)

(declare-fun e!538660 () Bool)

(assert (=> b!956097 (=> (not res!640230) (not e!538660))))

(declare-datatypes ((array!58113 0))(
  ( (array!58114 (arr!27936 (Array (_ BitVec 32) (_ BitVec 64))) (size!28415 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58113)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58113 (_ BitVec 32)) Bool)

(assert (=> b!956097 (= res!640230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33472 () Bool)

(declare-fun tp!64050 () Bool)

(assert (=> mapNonEmpty!33472 (= mapRes!33472 (and tp!64050 e!538659))))

(declare-datatypes ((V!32993 0))(
  ( (V!32994 (val!10554 Int)) )
))
(declare-datatypes ((ValueCell!10022 0))(
  ( (ValueCellFull!10022 (v!13109 V!32993)) (EmptyCell!10022) )
))
(declare-fun mapValue!33472 () ValueCell!10022)

(declare-fun mapRest!33472 () (Array (_ BitVec 32) ValueCell!10022))

(declare-fun mapKey!33472 () (_ BitVec 32))

(declare-datatypes ((array!58115 0))(
  ( (array!58116 (arr!27937 (Array (_ BitVec 32) ValueCell!10022)) (size!28416 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58115)

(assert (=> mapNonEmpty!33472 (= (arr!27937 _values!1197) (store mapRest!33472 mapKey!33472 mapValue!33472))))

(declare-fun b!956098 () Bool)

(assert (=> b!956098 (= e!538660 false)))

(declare-fun lt!430088 () Bool)

(declare-datatypes ((List!19467 0))(
  ( (Nil!19464) (Cons!19463 (h!20625 (_ BitVec 64)) (t!27828 List!19467)) )
))
(declare-fun arrayNoDuplicates!0 (array!58113 (_ BitVec 32) List!19467) Bool)

(assert (=> b!956098 (= lt!430088 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19464))))

(declare-fun res!640229 () Bool)

(assert (=> start!81968 (=> (not res!640229) (not e!538660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81968 (= res!640229 (validMask!0 mask!1823))))

(assert (=> start!81968 e!538660))

(assert (=> start!81968 true))

(declare-fun e!538661 () Bool)

(declare-fun array_inv!21679 (array!58115) Bool)

(assert (=> start!81968 (and (array_inv!21679 _values!1197) e!538661)))

(declare-fun array_inv!21680 (array!58113) Bool)

(assert (=> start!81968 (array_inv!21680 _keys!1441)))

(declare-fun b!956099 () Bool)

(assert (=> b!956099 (= e!538661 (and e!538663 mapRes!33472))))

(declare-fun condMapEmpty!33472 () Bool)

(declare-fun mapDefault!33472 () ValueCell!10022)

