; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81954 () Bool)

(assert start!81954)

(declare-fun res!640167 () Bool)

(declare-fun e!538557 () Bool)

(assert (=> start!81954 (=> (not res!640167) (not e!538557))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81954 (= res!640167 (validMask!0 mask!1823))))

(assert (=> start!81954 e!538557))

(assert (=> start!81954 true))

(declare-datatypes ((V!32973 0))(
  ( (V!32974 (val!10547 Int)) )
))
(declare-datatypes ((ValueCell!10015 0))(
  ( (ValueCellFull!10015 (v!13102 V!32973)) (EmptyCell!10015) )
))
(declare-datatypes ((array!58087 0))(
  ( (array!58088 (arr!27923 (Array (_ BitVec 32) ValueCell!10015)) (size!28402 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58087)

(declare-fun e!538556 () Bool)

(declare-fun array_inv!21667 (array!58087) Bool)

(assert (=> start!81954 (and (array_inv!21667 _values!1197) e!538556)))

(declare-datatypes ((array!58089 0))(
  ( (array!58090 (arr!27924 (Array (_ BitVec 32) (_ BitVec 64))) (size!28403 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58089)

(declare-fun array_inv!21668 (array!58089) Bool)

(assert (=> start!81954 (array_inv!21668 _keys!1441)))

(declare-fun b!955969 () Bool)

(declare-fun e!538558 () Bool)

(declare-fun tp_is_empty!20993 () Bool)

(assert (=> b!955969 (= e!538558 tp_is_empty!20993)))

(declare-fun b!955970 () Bool)

(declare-fun res!640166 () Bool)

(assert (=> b!955970 (=> (not res!640166) (not e!538557))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955970 (= res!640166 (and (= (size!28402 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28403 _keys!1441) (size!28402 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33451 () Bool)

(declare-fun mapRes!33451 () Bool)

(declare-fun tp!64029 () Bool)

(assert (=> mapNonEmpty!33451 (= mapRes!33451 (and tp!64029 e!538558))))

(declare-fun mapKey!33451 () (_ BitVec 32))

(declare-fun mapValue!33451 () ValueCell!10015)

(declare-fun mapRest!33451 () (Array (_ BitVec 32) ValueCell!10015))

(assert (=> mapNonEmpty!33451 (= (arr!27923 _values!1197) (store mapRest!33451 mapKey!33451 mapValue!33451))))

(declare-fun b!955971 () Bool)

(assert (=> b!955971 (= e!538557 false)))

(declare-fun lt!430067 () Bool)

(declare-datatypes ((List!19462 0))(
  ( (Nil!19459) (Cons!19458 (h!20620 (_ BitVec 64)) (t!27823 List!19462)) )
))
(declare-fun arrayNoDuplicates!0 (array!58089 (_ BitVec 32) List!19462) Bool)

(assert (=> b!955971 (= lt!430067 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19459))))

(declare-fun mapIsEmpty!33451 () Bool)

(assert (=> mapIsEmpty!33451 mapRes!33451))

(declare-fun b!955972 () Bool)

(declare-fun e!538555 () Bool)

(assert (=> b!955972 (= e!538555 tp_is_empty!20993)))

(declare-fun b!955973 () Bool)

(declare-fun res!640165 () Bool)

(assert (=> b!955973 (=> (not res!640165) (not e!538557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58089 (_ BitVec 32)) Bool)

(assert (=> b!955973 (= res!640165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955974 () Bool)

(assert (=> b!955974 (= e!538556 (and e!538555 mapRes!33451))))

(declare-fun condMapEmpty!33451 () Bool)

(declare-fun mapDefault!33451 () ValueCell!10015)

