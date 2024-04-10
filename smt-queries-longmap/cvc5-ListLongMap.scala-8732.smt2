; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105886 () Bool)

(assert start!105886)

(declare-fun b_free!27427 () Bool)

(declare-fun b_next!27427 () Bool)

(assert (=> start!105886 (= b_free!27427 (not b_next!27427))))

(declare-fun tp!95812 () Bool)

(declare-fun b_and!45335 () Bool)

(assert (=> start!105886 (= tp!95812 b_and!45335)))

(declare-fun b!1261231 () Bool)

(declare-fun res!840457 () Bool)

(declare-fun e!717796 () Bool)

(assert (=> b!1261231 (=> (not res!840457) (not e!717796))))

(declare-datatypes ((array!82272 0))(
  ( (array!82273 (arr!39689 (Array (_ BitVec 32) (_ BitVec 64))) (size!40225 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82272)

(declare-datatypes ((List!28197 0))(
  ( (Nil!28194) (Cons!28193 (h!29402 (_ BitVec 64)) (t!41696 List!28197)) )
))
(declare-fun arrayNoDuplicates!0 (array!82272 (_ BitVec 32) List!28197) Bool)

(assert (=> b!1261231 (= res!840457 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28194))))

(declare-fun b!1261232 () Bool)

(declare-fun e!717798 () Bool)

(declare-fun e!717800 () Bool)

(declare-fun mapRes!50296 () Bool)

(assert (=> b!1261232 (= e!717798 (and e!717800 mapRes!50296))))

(declare-fun condMapEmpty!50296 () Bool)

(declare-datatypes ((V!48471 0))(
  ( (V!48472 (val!16227 Int)) )
))
(declare-datatypes ((ValueCell!15401 0))(
  ( (ValueCellFull!15401 (v!18931 V!48471)) (EmptyCell!15401) )
))
(declare-datatypes ((array!82274 0))(
  ( (array!82275 (arr!39690 (Array (_ BitVec 32) ValueCell!15401)) (size!40226 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82274)

(declare-fun mapDefault!50296 () ValueCell!15401)

