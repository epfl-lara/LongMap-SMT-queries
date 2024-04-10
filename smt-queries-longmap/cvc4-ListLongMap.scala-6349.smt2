; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81834 () Bool)

(assert start!81834)

(declare-fun b_free!18329 () Bool)

(declare-fun b_next!18329 () Bool)

(assert (=> start!81834 (= b_free!18329 (not b_next!18329))))

(declare-fun tp!63687 () Bool)

(declare-fun b_and!29815 () Bool)

(assert (=> start!81834 (= tp!63687 b_and!29815)))

(declare-fun mapNonEmpty!33271 () Bool)

(declare-fun mapRes!33271 () Bool)

(declare-fun tp!63686 () Bool)

(declare-fun e!537654 () Bool)

(assert (=> mapNonEmpty!33271 (= mapRes!33271 (and tp!63686 e!537654))))

(declare-datatypes ((V!32813 0))(
  ( (V!32814 (val!10487 Int)) )
))
(declare-datatypes ((ValueCell!9955 0))(
  ( (ValueCellFull!9955 (v!13042 V!32813)) (EmptyCell!9955) )
))
(declare-fun mapRest!33271 () (Array (_ BitVec 32) ValueCell!9955))

(declare-datatypes ((array!57859 0))(
  ( (array!57860 (arr!27809 (Array (_ BitVec 32) ValueCell!9955)) (size!28288 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57859)

(declare-fun mapKey!33271 () (_ BitVec 32))

(declare-fun mapValue!33271 () ValueCell!9955)

(assert (=> mapNonEmpty!33271 (= (arr!27809 _values!1197) (store mapRest!33271 mapKey!33271 mapValue!33271))))

(declare-fun b!954319 () Bool)

(declare-fun res!639057 () Bool)

(declare-fun e!537656 () Bool)

(assert (=> b!954319 (=> (not res!639057) (not e!537656))))

(declare-datatypes ((array!57861 0))(
  ( (array!57862 (arr!27810 (Array (_ BitVec 32) (_ BitVec 64))) (size!28289 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57861)

(declare-datatypes ((List!19392 0))(
  ( (Nil!19389) (Cons!19388 (h!20550 (_ BitVec 64)) (t!27753 List!19392)) )
))
(declare-fun arrayNoDuplicates!0 (array!57861 (_ BitVec 32) List!19392) Bool)

(assert (=> b!954319 (= res!639057 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19389))))

(declare-fun res!639058 () Bool)

(assert (=> start!81834 (=> (not res!639058) (not e!537656))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81834 (= res!639058 (validMask!0 mask!1823))))

(assert (=> start!81834 e!537656))

(assert (=> start!81834 true))

(declare-fun tp_is_empty!20873 () Bool)

(assert (=> start!81834 tp_is_empty!20873))

(declare-fun array_inv!21589 (array!57861) Bool)

(assert (=> start!81834 (array_inv!21589 _keys!1441)))

(declare-fun e!537655 () Bool)

(declare-fun array_inv!21590 (array!57859) Bool)

(assert (=> start!81834 (and (array_inv!21590 _values!1197) e!537655)))

(assert (=> start!81834 tp!63687))

(declare-fun b!954320 () Bool)

(declare-fun res!639060 () Bool)

(assert (=> b!954320 (=> (not res!639060) (not e!537656))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954320 (= res!639060 (validKeyInArray!0 (select (arr!27810 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33271 () Bool)

(assert (=> mapIsEmpty!33271 mapRes!33271))

(declare-fun b!954321 () Bool)

(assert (=> b!954321 (= e!537654 tp_is_empty!20873)))

(declare-fun b!954322 () Bool)

(declare-fun e!537658 () Bool)

(assert (=> b!954322 (= e!537658 tp_is_empty!20873)))

(declare-fun b!954323 () Bool)

(declare-fun res!639055 () Bool)

(assert (=> b!954323 (=> (not res!639055) (not e!537656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57861 (_ BitVec 32)) Bool)

(assert (=> b!954323 (= res!639055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954324 () Bool)

(declare-fun res!639059 () Bool)

(assert (=> b!954324 (=> (not res!639059) (not e!537656))))

(assert (=> b!954324 (= res!639059 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28289 _keys!1441))))))

(declare-fun b!954325 () Bool)

(declare-fun res!639056 () Bool)

(assert (=> b!954325 (=> (not res!639056) (not e!537656))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954325 (= res!639056 (and (= (size!28288 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28289 _keys!1441) (size!28288 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954326 () Bool)

(assert (=> b!954326 (= e!537655 (and e!537658 mapRes!33271))))

(declare-fun condMapEmpty!33271 () Bool)

(declare-fun mapDefault!33271 () ValueCell!9955)

