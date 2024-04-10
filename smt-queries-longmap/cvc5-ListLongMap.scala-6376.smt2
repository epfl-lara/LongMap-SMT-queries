; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81992 () Bool)

(assert start!81992)

(declare-fun b!956311 () Bool)

(declare-fun e!538842 () Bool)

(assert (=> b!956311 (= e!538842 false)))

(declare-fun lt!430124 () Bool)

(declare-datatypes ((array!58159 0))(
  ( (array!58160 (arr!27959 (Array (_ BitVec 32) (_ BitVec 64))) (size!28438 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58159)

(declare-datatypes ((List!19476 0))(
  ( (Nil!19473) (Cons!19472 (h!20634 (_ BitVec 64)) (t!27837 List!19476)) )
))
(declare-fun arrayNoDuplicates!0 (array!58159 (_ BitVec 32) List!19476) Bool)

(assert (=> b!956311 (= lt!430124 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19473))))

(declare-fun b!956312 () Bool)

(declare-fun res!640336 () Bool)

(assert (=> b!956312 (=> (not res!640336) (not e!538842))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58159 (_ BitVec 32)) Bool)

(assert (=> b!956312 (= res!640336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33508 () Bool)

(declare-fun mapRes!33508 () Bool)

(assert (=> mapIsEmpty!33508 mapRes!33508))

(declare-fun res!640337 () Bool)

(assert (=> start!81992 (=> (not res!640337) (not e!538842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81992 (= res!640337 (validMask!0 mask!1823))))

(assert (=> start!81992 e!538842))

(assert (=> start!81992 true))

(declare-datatypes ((V!33025 0))(
  ( (V!33026 (val!10566 Int)) )
))
(declare-datatypes ((ValueCell!10034 0))(
  ( (ValueCellFull!10034 (v!13121 V!33025)) (EmptyCell!10034) )
))
(declare-datatypes ((array!58161 0))(
  ( (array!58162 (arr!27960 (Array (_ BitVec 32) ValueCell!10034)) (size!28439 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58161)

(declare-fun e!538841 () Bool)

(declare-fun array_inv!21695 (array!58161) Bool)

(assert (=> start!81992 (and (array_inv!21695 _values!1197) e!538841)))

(declare-fun array_inv!21696 (array!58159) Bool)

(assert (=> start!81992 (array_inv!21696 _keys!1441)))

(declare-fun b!956313 () Bool)

(declare-fun e!538840 () Bool)

(declare-fun tp_is_empty!21031 () Bool)

(assert (=> b!956313 (= e!538840 tp_is_empty!21031)))

(declare-fun mapNonEmpty!33508 () Bool)

(declare-fun tp!64086 () Bool)

(declare-fun e!538839 () Bool)

(assert (=> mapNonEmpty!33508 (= mapRes!33508 (and tp!64086 e!538839))))

(declare-fun mapKey!33508 () (_ BitVec 32))

(declare-fun mapValue!33508 () ValueCell!10034)

(declare-fun mapRest!33508 () (Array (_ BitVec 32) ValueCell!10034))

(assert (=> mapNonEmpty!33508 (= (arr!27960 _values!1197) (store mapRest!33508 mapKey!33508 mapValue!33508))))

(declare-fun b!956314 () Bool)

(assert (=> b!956314 (= e!538839 tp_is_empty!21031)))

(declare-fun b!956315 () Bool)

(assert (=> b!956315 (= e!538841 (and e!538840 mapRes!33508))))

(declare-fun condMapEmpty!33508 () Bool)

(declare-fun mapDefault!33508 () ValueCell!10034)

