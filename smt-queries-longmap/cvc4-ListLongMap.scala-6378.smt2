; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82008 () Bool)

(assert start!82008)

(declare-fun b!956455 () Bool)

(declare-fun res!640409 () Bool)

(declare-fun e!538961 () Bool)

(assert (=> b!956455 (=> (not res!640409) (not e!538961))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58191 0))(
  ( (array!58192 (arr!27975 (Array (_ BitVec 32) (_ BitVec 64))) (size!28454 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58191)

(declare-datatypes ((V!33045 0))(
  ( (V!33046 (val!10574 Int)) )
))
(declare-datatypes ((ValueCell!10042 0))(
  ( (ValueCellFull!10042 (v!13129 V!33045)) (EmptyCell!10042) )
))
(declare-datatypes ((array!58193 0))(
  ( (array!58194 (arr!27976 (Array (_ BitVec 32) ValueCell!10042)) (size!28455 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58193)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956455 (= res!640409 (and (= (size!28455 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28454 _keys!1441) (size!28455 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33532 () Bool)

(declare-fun mapRes!33532 () Bool)

(assert (=> mapIsEmpty!33532 mapRes!33532))

(declare-fun b!956456 () Bool)

(declare-fun e!538960 () Bool)

(declare-fun tp_is_empty!21047 () Bool)

(assert (=> b!956456 (= e!538960 tp_is_empty!21047)))

(declare-fun res!640410 () Bool)

(assert (=> start!82008 (=> (not res!640410) (not e!538961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82008 (= res!640410 (validMask!0 mask!1823))))

(assert (=> start!82008 e!538961))

(assert (=> start!82008 true))

(declare-fun e!538963 () Bool)

(declare-fun array_inv!21705 (array!58193) Bool)

(assert (=> start!82008 (and (array_inv!21705 _values!1197) e!538963)))

(declare-fun array_inv!21706 (array!58191) Bool)

(assert (=> start!82008 (array_inv!21706 _keys!1441)))

(declare-fun b!956457 () Bool)

(declare-fun e!538962 () Bool)

(assert (=> b!956457 (= e!538962 tp_is_empty!21047)))

(declare-fun b!956458 () Bool)

(declare-fun res!640408 () Bool)

(assert (=> b!956458 (=> (not res!640408) (not e!538961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58191 (_ BitVec 32)) Bool)

(assert (=> b!956458 (= res!640408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33532 () Bool)

(declare-fun tp!64110 () Bool)

(assert (=> mapNonEmpty!33532 (= mapRes!33532 (and tp!64110 e!538960))))

(declare-fun mapRest!33532 () (Array (_ BitVec 32) ValueCell!10042))

(declare-fun mapKey!33532 () (_ BitVec 32))

(declare-fun mapValue!33532 () ValueCell!10042)

(assert (=> mapNonEmpty!33532 (= (arr!27976 _values!1197) (store mapRest!33532 mapKey!33532 mapValue!33532))))

(declare-fun b!956459 () Bool)

(assert (=> b!956459 (= e!538961 false)))

(declare-fun lt!430148 () Bool)

(declare-datatypes ((List!19482 0))(
  ( (Nil!19479) (Cons!19478 (h!20640 (_ BitVec 64)) (t!27843 List!19482)) )
))
(declare-fun arrayNoDuplicates!0 (array!58191 (_ BitVec 32) List!19482) Bool)

(assert (=> b!956459 (= lt!430148 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19479))))

(declare-fun b!956460 () Bool)

(assert (=> b!956460 (= e!538963 (and e!538962 mapRes!33532))))

(declare-fun condMapEmpty!33532 () Bool)

(declare-fun mapDefault!33532 () ValueCell!10042)

