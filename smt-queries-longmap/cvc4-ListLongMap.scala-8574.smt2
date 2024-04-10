; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104656 () Bool)

(assert start!104656)

(declare-fun b!1247853 () Bool)

(declare-fun e!708007 () Bool)

(declare-datatypes ((array!80462 0))(
  ( (array!80463 (arr!38800 (Array (_ BitVec 32) (_ BitVec 64))) (size!39336 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80462)

(assert (=> b!1247853 (= e!708007 (bvsgt #b00000000000000000000000000000000 (size!39336 _keys!1118)))))

(declare-fun b!1247854 () Bool)

(declare-fun res!832581 () Bool)

(assert (=> b!1247854 (=> (not res!832581) (not e!708007))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80462 (_ BitVec 32)) Bool)

(assert (=> b!1247854 (= res!832581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247855 () Bool)

(declare-fun res!832578 () Bool)

(assert (=> b!1247855 (=> (not res!832578) (not e!708007))))

(declare-datatypes ((List!27540 0))(
  ( (Nil!27537) (Cons!27536 (h!28745 (_ BitVec 64)) (t!41009 List!27540)) )
))
(declare-fun arrayNoDuplicates!0 (array!80462 (_ BitVec 32) List!27540) Bool)

(assert (=> b!1247855 (= res!832578 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27537))))

(declare-fun mapNonEmpty!48832 () Bool)

(declare-fun mapRes!48832 () Bool)

(declare-fun tp!92933 () Bool)

(declare-fun e!708006 () Bool)

(assert (=> mapNonEmpty!48832 (= mapRes!48832 (and tp!92933 e!708006))))

(declare-fun mapKey!48832 () (_ BitVec 32))

(declare-datatypes ((V!47211 0))(
  ( (V!47212 (val!15755 Int)) )
))
(declare-datatypes ((ValueCell!14929 0))(
  ( (ValueCellFull!14929 (v!18451 V!47211)) (EmptyCell!14929) )
))
(declare-fun mapRest!48832 () (Array (_ BitVec 32) ValueCell!14929))

(declare-fun mapValue!48832 () ValueCell!14929)

(declare-datatypes ((array!80464 0))(
  ( (array!80465 (arr!38801 (Array (_ BitVec 32) ValueCell!14929)) (size!39337 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80464)

(assert (=> mapNonEmpty!48832 (= (arr!38801 _values!914) (store mapRest!48832 mapKey!48832 mapValue!48832))))

(declare-fun b!1247856 () Bool)

(declare-fun e!708005 () Bool)

(declare-fun tp_is_empty!31385 () Bool)

(assert (=> b!1247856 (= e!708005 tp_is_empty!31385)))

(declare-fun b!1247857 () Bool)

(declare-fun e!708004 () Bool)

(assert (=> b!1247857 (= e!708004 (and e!708005 mapRes!48832))))

(declare-fun condMapEmpty!48832 () Bool)

(declare-fun mapDefault!48832 () ValueCell!14929)

